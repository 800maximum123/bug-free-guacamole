#define AIRSTRIKE_HE "High-Explosive"
#define AIRSTRIKE_CLUSTER "Frag Cluster"
#define AIRSTRIKE_NAPALM "Napalm"
#define AIRSTRIKE_SMOKE "Smoke"
#define AIRSTRIKE_GAS "HD Gas"

// Airstrike radio device for Gaia map
/obj/item/device/airstrike
	name = "airstrike radio"
	desc = "A portable radio used for requesting orbital airstrikes on coordinates."
	icon = 'mods/_fd/_maps/gccv_ulyanovsk/icons/ulyanovsk.dmi'
	icon_state = "walkietalkie_gcc-1"
	slot_flags = SLOT_BELT
	w_class = ITEM_SIZE_SMALL

	var/initial_icon_state = "walkietalkie_gcc"
	var/striker_name = "GCNV 'Pepel'"
	var/last_use
	var/cooldown = 1 MINUTES
	var/uses = 3
	var/locked = FALSE

	var/list/allowed_types = list(
		AIRSTRIKE_HE, AIRSTRIKE_CLUSTER, AIRSTRIKE_NAPALM, AIRSTRIKE_SMOKE, AIRSTRIKE_GAS
	)

	var/selected_x
	var/selected_y
	var/selected_z
	var/selected_ammo_type

/obj/item/device/airstrike/proc/lock_off(mob/user)
	if(!locked)
		return
	locked = FALSE
	flick(icon, initial_icon_state + "-on")
	icon_state = initial_icon_state + "-1"
	to_chat(user, SPAN_NOTICE("\The [src] flicks as it unlocks"))

/obj/item/device/airstrike/proc/lock_on(mob/user)
	if(locked)
		return
	locked = TRUE
	flick(icon, initial_icon_state + "-off")
	icon_state = initial_icon_state + "-0"
	to_chat(user, SPAN_NOTICE("\The [src] flicks as it locks down"))

/obj/item/device/airstrike/attack_self(mob/user as mob)
	user.set_machine(src)
	if(!locked)
		playsound(src.loc, 'sound/effects/walkieon.ogg', 40, 0)
	if(uses >= 1 && locked)
		lock_off(user)
	ui_interact(user)

/obj/item/device/airstrike/CouldUseTopic(mob/user)
	..()
	if(istype(user, /mob/living/carbon))
		playsound(src, "button", 10)

// Open NanoUI to request an airstrike
/obj/item/device/airstrike/ui_interact(mob/user, ui_key = "main", datum/nanoui/ui = null, force_open = 1, datum/nanoui/master_ui = null, datum/topic_state/state = GLOB.default_state)
	var/data[0]
	data["src"] = "\ref[src]"
	data["striker_name"] = striker_name
	data["uses"] = uses
	data["locked"] = locked
	// Default coordinates prefilled from device location
	if(selected_x && selected_y && selected_z)
		data["x"] = selected_x
		data["y"] = selected_y
		data["z"] = selected_z
	else if(src.loc)
		data["x"] = src.loc.x
		data["y"] = src.loc.y
		data["z"] = src.loc.z
	else
		data["x"] = 0
		data["y"] = 0
		data["z"] = 0

	if(selected_ammo_type)
		data["ammo_type"] = selected_ammo_type
	else
		data["ammo_type"] = pick(allowed_types)

	data["allowed_types"] = list()
	for(var/type in allowed_types)
		var/type_label = type
		data["allowed_types"] += list(list(type = type, label = type_label))

	ui = SSnano.try_update_ui(user, src, ui_key, ui, data, force_open)
	if(!ui)
		ui = new(user, src, ui_key, "airstrike.tmpl", "[name]", 360, 240)
		ui.set_initial_data(data)
		ui.open()

// Handle form submissions from NanoUI
/obj/item/device/airstrike/Topic(href, href_list)
	if(..())
		return 1

	if(href_list["choice"])
		switch(href_list["choice"])
			if("do_strike")
				// Prevent reuse when locked
				if(locked)
					return 1
				if(world.time <= last_use)
					balloon_alert(usr, "cooldown")
					return 1

				var/strx = text2num(href_list["x"])
				var/stry = text2num(href_list["y"])
				var/strz = text2num(href_list["z"])
				var/strammo_type = href_list["ammo_type"]
/*
				// Z is selected automatically: prefer the device's current z
				var/z = src.loc ? src.loc.z : 0
*/
				// Create the strike datum
				var/datum/airstrike/A = new()
				A.x = strx + rand(-1, 1)
				A.y = stry + rand(-1, 1)
				A.z = strz
				A.ammo_type = strammo_type
				A.requester = usr
				A.device = src
				A.strike()

				selected_x = strx
				selected_y = stry
				selected_z = strz
				selected_ammo_type = strammo_type

				// Lock the device after use
				uses--
				if(uses <= 0 && !locked)
					lock_on(usr)

				last_use = world.time + cooldown
				SSnano.update_uis(src)

				// Feedback to the user
				playsound(src.loc, 'sound/effects/walkietalkie.ogg', 20, 0)
				balloon_alert(usr, "called")
				audible_message(SPAN_NOTICE("Airstrike requested at [strx], [stry], [strz] ([strammo_type])."))
				return 1


// Simple datum representing an airstrike request
/datum/airstrike
	var/x = 0
	var/y = 0
	var/z = 0
	var/ammo_type = AIRSTRIKE_HE
	var/mob/requester = null
	var/obj/device = null

/datum/airstrike/proc/strike()
	// Register the strike in a global list so other systems /admins can inspect it
	//LAZYINITLIST(GLOB.airstrikes)
	//GLOB.airstrikes += src

	// Notify requester/device that the strike was queued
	if(requester)
		to_chat(requester, SPAN_WARNING("Your airstrike request has been queued."))
	else if(device)
		device.audible_message(SPAN_WARNING("An airstrike request was queued by an unknown source."))

	// Resolve target turf
	var/turf/target = locate(x, y, z)
	if(!target)
		if(requester && device)
			to_chat(requester, SPAN_WARNING("Bad target. Airstrike waved off."))
			device.balloon_alert(requester, "cancelled")
		return

	log_and_message_admins("[ammo_type] orbital airstrike requested by [requester] with [device] to [x], [y], [z].", requester, target)

	target.visible_message(SPAN_WARNING("You see a laser point at \the [target] from the sky!"), SPAN_WARNING("You hear a laser aiming down near you."))
	playsound(target, 'sound/weapons/bombwhine.ogg', 50, FALSE)
	// Shows an reticle on the targeted area
	var/image/I = image('icons/effects/Targeted.dmi', target, "lockonbig")
	I.AddOverlays(
		emissive_appearance('icons/effects/Targeted.dmi', "lockonbig"),
		"lockonbig"
	)
	if(I)
		flick_overlay(I, GLOB.clients, 10 SECONDS)

		animate(
			I,
			alpha = 255,
			transform = matrix().Update(scale_x = 0.75, scale_y = 0.75),
			pixel_x = 0,
			pixel_y = 0,
			pixel_z = 0,
			time = 9 SECONDS
		)
		animate(time = 1)
		animate(alpha = 0, time = 1 SECOND, easing = CIRCULAR_EASING|EASE_OUT)

	// Broadcast an immediate alarm to the entire Z-level
	for(var/mob/living/mob in GLOB.alive_mobs)
		if((mob.z == z) || (mob.z in GetConnectedZlevels(z)))
			to_chat(mob, FONT_GIANT(SPAN_DANGER("Warning: Orbital airstrike inbound!")))
			sound_to(mob, sound('sound/misc/notice1.ogg'))

	// Schedule approach sounds / countdown messages and final effect
	// Mid warning at ~5s
	spawn(5 SECONDS)
		for(var/atom/mob in range(world.view, target))
			if(ismob(mob))
				to_chat(mob, FONT_HUGE(SPAN_WARNING("You hear sky roar from [dir2text(get_dir(mob, target))]!")))

	// Near warning at ~8s
	spawn(8 SECONDS)
		if(target)
			playsound(target, 'sound/machines/disperser_fire.ogg', 150, 0, 12)
			target.balloon_alert_to_viewers("incoming!", color = COLOR_RED_GRAY)
			new /obj/effect/smoke/illumination(target, 2 SECONDS, range = 10, power = 5, color = COLOR_SEDONA)
		for(var/atom/mob in range(world.view, target))
			if(ismob(mob))
				to_chat(mob, FONT_GIANT(SPAN_WARNING("Sky bursts in flames at [dir2text(get_dir(mob, target))]!")))

	// Near warning at ~9s
	spawn(9 SECONDS)
		if(target)
			playsound(target, 'maps/gaia/sounds/effects/incoming.ogg', 100, TRUE, 12)

	// Execute the strike at ~10s
	spawn(10 SECONDS)
		// Final visible/sound feedback to requester/device
		if(requester)
			to_chat(requester, SPAN_NOTICE("Airstrike is incoming at [x],[y]."))
		else if(device)
			device.audible_message(SPAN_NOTICE("Airstrike launched."))
		for(var/atom/mob in range(world.view, target))
			if(ismob(mob))
				to_chat(mob, FONT_GIANT(SPAN_WARNING("You see a [ammo_type] shell incoming at [dir2text(get_dir(mob, target))]!")))

		// Perform ammo_type-specific effects
		switch(ammo_type)
			if(AIRSTRIKE_HE)
				// spawns massive explosion on the target turf
				if(target)
					cell_explosion(target, 1500, 50, shrapnel = FALSE)
			if(AIRSTRIKE_CLUSTER)
				if(target)
					// spawns mulitple small explosions around the target turf
					var/amount = 10
					while(amount > 0)
						var/turf/bomblet = get_random_turf_in_range(target, 10, 1)
						bomblet.balloon_alert_to_viewers("incoming!", color = COLOR_RED_GRAY)
						playsound(target, 'maps/gaia/sounds/effects/incoming.ogg', 100, TRUE, 12)
						cell_explosion(bomblet, 300, 100, shrapnel = TRUE)
						amount--
						sleep(1 SECOND)
			if(AIRSTRIKE_NAPALM)
				if(target)
					/* Explosions extinguish fires for some reason
					cell_explosion(target, 300, 100, shrapnel = FALSE)
					*/
					playsound(target, "bigboom", 80, TRUE, 12, 7)
					playsound(target, 'sound/effects/explosionfar.ogg', 100, TRUE, 200)
					// create a turf fire around the target turf with high power
					var/list/fire_spread = get_turfs_in_range(target, 8)
					for(var/turf/around in fire_spread)
						around.IgniteTurf(30, COLOR_WHITE)
			if(AIRSTRIKE_SMOKE)
				if(target)
					// spawn a concentrated smoke cloud around the target turf
					var/amount = 5
					while(amount > 0)
						var/datum/effect/smoke_spread/bad/smoke = new()
						var/turf/bomblet = get_random_turf_in_range(target, 7, 1)
						bomblet.balloon_alert_to_viewers("incoming!", color = COLOR_RED_GRAY)
						playsound(target, 'maps/gaia/sounds/effects/incoming.ogg', 100, TRUE, 12)
						smoke.set_up(20, 0, bomblet)
						smoke.start()
						playsound(bomblet, 'sound/effects/bamf.ogg', 100, TRUE, 4)
						amount--
						sleep(1 SECOND)
			if(AIRSTRIKE_GAS)
				if(target)
					// spawn a concentrated gas cloud around the target turf
					var/amount = 5
					while(amount > 0)
						var/datum/effect/smoke_spread/mustard/smoke = new()
						var/turf/bomblet = get_random_turf_in_range(target, 7, 1)
						bomblet.balloon_alert_to_viewers("incoming!", color = COLOR_RED_GRAY)
						playsound(target, 'maps/gaia/sounds/effects/incoming.ogg', 100, 0, 12)
						smoke.set_up(20, 0, bomblet)
						smoke.start()
						playsound(bomblet, 'sound/effects/bamf.ogg', 100, TRUE, 4)
						amount--
						sleep(1 SECOND)

		// Announce completion to admins/requester
		if(requester)
			log_and_message_admins("[ammo_type] orbital airstrike done by [requester] with [device] to [target].", requester, target)
			to_chat(requester, SPAN_GOOD("Airstrike executed."))

#undef AIRSTRIKE_HE
#undef AIRSTRIKE_CLUSTER
#undef AIRSTRIKE_NAPALM
#undef AIRSTRIKE_SMOKE
#undef AIRSTRIKE_GAS
