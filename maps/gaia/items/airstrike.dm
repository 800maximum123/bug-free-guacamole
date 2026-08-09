#define AIRSTRIKE_HE "High-Explosive"
#define AIRSTRIKE_CLUSTER "Frag Cluster"
#define AIRSTRIKE_NAPALM "Napalm"
#define AIRSTRIKE_SMOKE "WP Smoke"
#define AIRSTRIKE_GAS "HD Gas"
#define AIRSTRIKE_THERMOBARIC "Thermobaric"
#define ALL_AIRSTRIKES list(AIRSTRIKE_HE, AIRSTRIKE_CLUSTER, AIRSTRIKE_NAPALM, AIRSTRIKE_SMOKE, AIRSTRIKE_GAS, AIRSTRIKE_THERMOBARIC)

// Airstrike radio device for Gaia map
/obj/item/device/airstrike
	name = "airstrike radio"
	desc = "A portable radio used for requesting orbital airstrikes on coordinates."
	icon = 'mods/_fd/_maps/gccv_ulyanovsk/icons/ulyanovsk.dmi'
	icon_state = "walkietalkie_gcc-1"
	slot_flags = SLOT_BELT
	w_class = ITEM_SIZE_SMALL

	/// Initial icon_state for icon reasons
	var/initial_icon_state = "walkietalkie_gcc"
	/// The name of who is striking everyone down
	var/striker_name = "SFV 'Boomstick"
	/// Last time airstrike was called
	var/last_use
	/// How long to wait before calling in airstrikes
	var/cooldown = 1 MINUTES
	/// Margin of error in tiles of how much the target can be off
	var/margin = 1
	/// How much uses left
	var/uses = 3
	/// If it has no uses left and is now unusuable
	var/locked = FALSE
	/// If you can airstrike homebases of ICCG and SCG
	var/allow_base_strikes = FALSE
	/// What kind of airstrikes are allowed
	var/list/allowed_types = ALL_AIRSTRIKES

	/// What is the last target X coordinate
	var/selected_x
	/// What is the last target Y coordinate
	var/selected_y
	/// What is the last target Z coordinate
	var/selected_z
	/// What is the last ammo type used
	var/selected_ammo_type

/obj/item/device/airstrike/proc/lock_off(mob/user)
	if(!locked)
		return
	locked = FALSE
	icon_state = initial_icon_state + "-1"
	flick(icon, initial_icon_state + "-on")
	to_chat(user, SPAN_NOTICE("\The [src] flicks as it unlocks"))

/obj/item/device/airstrike/proc/lock_on(mob/user)
	if(locked)
		return
	locked = TRUE
	icon_state = initial_icon_state + "-0"
	flick(icon, initial_icon_state + "-off")
	to_chat(user, SPAN_NOTICE("\The [src] flicks as it locks down"))

/obj/item/device/airstrike/proc/strike(href, href_list, mob/user)
	// Prevent reuse when locked
	if(locked)
		return TRUE
	if(world.time <= last_use)
		balloon_alert(user, "cooldown")
		return TRUE

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
	A.x = strx + rand(-margin, margin)
	A.y = stry + rand(-margin, margin)
	A.z = strz
	A.ammo_type = strammo_type
	A.striker_name = striker_name
	A.requester = user
	A.device = src
	A.launch()

	selected_x = strx
	selected_y = stry
	selected_z = strz
	selected_ammo_type = strammo_type

	// Lock the device after use
	uses--
	if(uses <= 0 && !locked)
		lock_on(user)

	last_use = world.time + cooldown
	SSnano.update_uis(src)

	// Feedback to the user
	playsound(src.loc, 'sound/effects/walkietalkie.ogg', 20, 0)
	balloon_alert(user, "called")
	audible_message("[SPAN_BOLD(striker_name)] states, \"[SPAN_NOTICE("Airstrike requested at [strx], [stry], [strz] ([strammo_type]).")]\"")
	return TRUE

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
		ui = new(user, src, ui_key, "airstrike.tmpl", "[name]", 460, 300)
		ui.set_initial_data(data)
		ui.open()

// Handle form submissions from NanoUI
/obj/item/device/airstrike/Topic(href, href_list)
	if(..())
		return 1

	if(href_list["choice"])
		switch(href_list["choice"])
			if("do_strike")
				strike(href, href_list, usr)
			if("my_loc")
				selected_x = usr.x
				selected_y = usr.y
				selected_z = usr.z
				SSnano.update_uis(src)

/obj/item/device/airstrike/pepel
	name = "airstrike radio (GCNV 'Pepel')"
	striker_name = "GCNV 'Pepel'"
	allowed_types = list(
		AIRSTRIKE_HE, AIRSTRIKE_CLUSTER, AIRSTRIKE_NAPALM, AIRSTRIKE_SMOKE, AIRSTRIKE_GAS
	)

/obj/item/device/airstrike/zarya
	name = "airstrike radio (GCNV 'Zarya')"
	striker_name = "GCNV 'Zarya'"
	allowed_types = list(
		AIRSTRIKE_HE, AIRSTRIKE_CLUSTER, AIRSTRIKE_NAPALM, AIRSTRIKE_SMOKE, AIRSTRIKE_GAS
	)


// Datum representing an airstrike request
/datum/airstrike
	/// X coordinate of the strike
	var/x = 0
	/// Y coordinate of the strike
	var/y = 0
	/// Z coordinate of the strike
	var/z = 0
	/// How long before the strike fully happens
	var/duration = 10 SECONDS
	/// What kind of strike is this
	var/ammo_type = AIRSTRIKE_HE
	/// The name of who is striking everyone down
	var/striker_name = "SFV 'Boomstick"
	/// Who requested this strike
	var/mob/requester = null
	/// From what was this strike requested
	var/obj/item/device/airstrike/device = null
	/// What is the target of this strike
	var/turf/target = null

	// Various sounds used
	var/alarm_sound = 'sound/misc/notice1.ogg'
	var/aiming_sound = 'sound/machines/disperser_fire.ogg'
	var/incoming_sound = 'maps/gaia/sounds/effects/incoming.ogg'
	var/laser_sound = 'sound/weapons/bombwhine.ogg'

/datum/airstrike/proc/launch()
	// Register the strike in a global list so other systems /admins can inspect it
	//LAZYINITLIST(GLOB.airstrikes)
	//GLOB.airstrikes += src

	// Notify requester/device that the strike was queued
	if(device)
		device.audible_message("[SPAN_BOLD(striker_name)] states, \"[SPAN_WARNING("Your airstrike request has been queued.")]\"")

	// Resolve target turf
	target = locate(x, y, z)
	if(!target)
		if(requester && device)
			playsound(device.loc, 'sound/effects/walkietalkie.ogg', 20, 0)
			device.audible_message("[SPAN_BOLD(striker_name)] states, \"[SPAN_WARNING("Bad target. Airstrike waved off.")]\"")
			device.balloon_alert(requester, "cancelled")
			return

	log_and_message_admins("[ammo_type] orbital airstrike requested by [requester] with [device] to [x], [y], [z].", requester, target)

	reticle()
	strike()

/datum/airstrike/proc/strike()
	// Broadcast an immediate alarm to the entire Z-level
	for(var/mob/living/mob in GLOB.alive_mobs)
		if((mob.z == z) || (mob.z in GetConnectedZlevels(z)))
			to_chat(mob, FONT_GIANT(SPAN_DANGER("Warning: Orbital airstrike inbound!")))
			sound_to(mob, sound(alarm_sound))

	// Schedule approach sounds / countdown messages and final effect
	// Mid warning at ~5s
	spawn(trunc(duration/2))
		for(var/atom/mob in range(world.view*2, target))
			if(ismob(mob))
				to_chat(mob, FONT_HUGE(SPAN_WARNING("You hear sky roar from [dir2text(get_dir(mob, target))]!")))

	// Near warning at ~8s
	spawn(trunc(duration/1.2))
		if(target)
			playsound(target, aiming_sound, 150, 0, 12)
			new /obj/effect/smoke/illumination(target, 2 SECONDS, range = 10, power = 5, color = COLOR_SEDONA)
		for(var/atom/mob in range(world.view*2, target))
			if(ismob(mob))
				to_chat(mob, FONT_GIANT(SPAN_WARNING("Sky bursts in flames at [dir2text(get_dir(mob, target))]!")))

	// Near warning at ~9s
	spawn(trunc(duration/1.1))
		if(target)
			playsound(target, incoming_sound, 100, TRUE, 12)

	// Execute the strike at ~10s
	spawn(duration)
		// Final visible/sound feedback to requester/device
		if(device)
			device.audible_message("[SPAN_BOLD(striker_name)] states, \"[SPAN_NOTICE("Airstrike is incoming at [x], [y], [z].")]\"")
		for(var/atom/mob in range(world.view*2, target))
			if(ismob(mob))
				to_chat(mob, FONT_GIANT(SPAN_DANGER("You see a [ammo_type] shell incoming at [dir2text(get_dir(mob, target))]!")))

		// Perform ammo_type-specific effects
		bomb_act()

		// Announce completion to admins/requester
		if(requester)
			log_and_message_admins("[ammo_type] orbital airstrike done by [requester] with [device] to [target].", requester, target)
			playsound(device.loc, 'sound/effects/walkietalkie.ogg', 20, 0)
			device.audible_message("[SPAN_BOLD(striker_name)] states, \"[SPAN_GOOD("Airstrike fully executed.")]\"")

/// Creates a visible reticle on the strike position
/datum/airstrike/proc/reticle(r_duration, turf/r_target, notify = TRUE)
	if(!r_duration)
		r_duration = duration
	if(!r_target)
		r_target = target

	if(r_duration <= 1 SECOND)
		r_duration = 2 SECOND

	// Shows an reticle on the targeted area
	var/image/I = image('icons/effects/Targeted.dmi', r_target, "lockonbig")
	I.AddOverlays(
		emissive_appearance('icons/effects/Targeted.dmi', "lockonbig"),
		"lockonbig"
	)
	if(!I)
		return
	flick_overlay(I, GLOB.clients, r_duration)

	animate(
		I,
		alpha = 255,
		transform = matrix().Update(scale_x = 0.75, scale_y = 0.75),
		pixel_x = 0,
		pixel_y = 0,
		pixel_z = 0,
		time = r_duration - 1 SECOND
	)
	animate(time = 1)
	animate(alpha = 0, time = 1 SECOND, easing = CIRCULAR_EASING|EASE_OUT)
	if(notify)
		// Visible message and sound for those nearby
		r_target.visible_message(SPAN_WARNING("You see a laser point at \the [r_target] from the sky!"), SPAN_WARNING("You hear a laser aiming down near you."))
		playsound(target, laser_sound, 50, FALSE)

/// Makes different actions depending on the ammo_type
/datum/airstrike/proc/bomb_act()
	switch(ammo_type)
		if(AIRSTRIKE_HE)
			// spawns massive explosion on the target turf
			if(target)
				cell_explosion(target, 1500, 50, shrapnel = FALSE)
		if(AIRSTRIKE_CLUSTER)
			if(target)
				// spawns mulitple small explosions around the target turf
				var/pause = 1 SECOND
				var/amount = 10
				while(amount > 0)
					var/turf/bomblet = get_random_turf_in_range(target, 10)
					reticle(pause, bomblet, FALSE)
					playsound(target, 'maps/gaia/sounds/effects/incoming.ogg', 100, TRUE, 12)
					cell_explosion(bomblet, 300, 100, shrapnel = TRUE)
					amount--
					sleep(pause)
		if(AIRSTRIKE_NAPALM)
			if(target)
				cell_explosion(target, 500, 100, shrapnel = FALSE)
				// create a turf fire around the target turf with high power
				var/list/fire_spread = get_turfs_in_range(target, 8)
				for(var/turf/around in fire_spread)
					around.IgniteTurf(50, COLOR_WHITE)
		if(AIRSTRIKE_SMOKE)
			if(target)
				// spawn a concentrated smoke cloud around the target turf
				var/pause = 1 SECOND
				var/amount = 5
				while(amount > 0)
					var/datum/effect/smoke_spread/bad/smoke = new()
					var/turf/bomblet = get_random_turf_in_range(target, 7)
					if(!isopenturf(bomblet)) // Walls are not really good for smoke spread
						bomblet = get_random_turf_in_range(target, 7)
					reticle(pause, bomblet, FALSE)
					if(amount != initial(amount)) // Stops double sound spam
						playsound(bomblet, 'maps/gaia/sounds/effects/incoming.ogg', 100, TRUE, 12)
					smoke.set_up(20, 0, bomblet)
					smoke.start()
					playsound(bomblet, 'sound/effects/bamf.ogg', 100, TRUE, 4)
					amount--
					sleep(pause)
		if(AIRSTRIKE_GAS)
			if(target)
				// spawn a concentrated gas cloud around the target turf
				var/pause = 1 SECOND
				var/amount = 5
				while(amount > 0)
					var/datum/effect/smoke_spread/mustard/smoke = new()
					var/turf/bomblet = get_random_turf_in_range(target, 7, 1)
					if(!isopenturf(bomblet)) // Walls are not really good for gas spread
						bomblet = get_random_turf_in_range(target, 7)
					reticle(pause, bomblet, FALSE)
					if(amount != initial(amount)) // Stops double sound spam
						playsound(bomblet, 'maps/gaia/sounds/effects/incoming.ogg', 100, 0, 12)
					smoke.set_up(20, 0, bomblet)
					smoke.start()
					playsound(bomblet, 'sound/effects/bamf.ogg', 100, TRUE, 4)
					amount--
					sleep(pause)
		if(AIRSTRIKE_THERMOBARIC)
			if(target)
				// spawn a concentrated gas cloud around the target turf
				var/pause = 1 SECOND
				var/amount = 5
				while(amount > 0)
					var/datum/effect/smoke_spread/thermobaric/smoke = new()
					var/turf/bomblet = get_random_turf_in_range(target, 7, 1)
					if(!isopenturf(bomblet)) // Walls are not really good for gas spread
						bomblet = get_random_turf_in_range(target, 7)
					reticle(pause, bomblet, FALSE)
					if(amount != initial(amount)) // Stops double sound spam
						playsound(bomblet, 'maps/gaia/sounds/effects/incoming.ogg', 100, 0, 12)
					smoke.set_up(20, 0, bomblet)
					smoke.start()
					playsound(bomblet, 'sound/effects/bamf.ogg', 100, TRUE, 4)
					amount--
					sleep(pause)


/// Calls in airstrike datum from airstrike.dm
/client/proc/call_airstrike()
	set category = "Fun"
	set name = "Call Airstrike"

	if(!check_rights(R_FUN))
		return

	var/strx
	var/stry
	var/strz

	var/where = alert("Location of the airstrike?", "Call Airstrike", "Mob", "Coordinates")
	if(where == "Coordinates")
		strx = input("What X coordinate?", "Call Airstrike", mob.x) as num|null
		stry = input("What Y coordinate?", "Call Airstrike", mob.y) as num|null
		strz = input("What Z coordinate?", "Call Airstrike", mob.z) as num|null
	else
		strx = mob.x
		stry = mob.y
		strz = mob.z

	var/strammo_type = input("What ammotype to fire?", "Call Airstrike", AIRSTRIKE_HE) as null|anything in ALL_AIRSTRIKES
	var/margin = input("What margin of error in tiles from the coordinates?", "Call Airstrike", 0) as num|null

	if(!strx || !stry || !strz || !strammo_type)
		return

	// Create the strike datum
	var/datum/airstrike/A = new()
	if(margin)
		A.x = strx + rand(-margin, margin)
		A.y = stry + rand(-margin, margin)
	else
		A.x = strx
		A.y = stry
	A.z = strz
	A.ammo_type = strammo_type
	A.requester = mob
	A.device = null
	A.launch()

#undef AIRSTRIKE_HE
#undef AIRSTRIKE_CLUSTER
#undef AIRSTRIKE_NAPALM
#undef AIRSTRIKE_SMOKE
#undef AIRSTRIKE_GAS
#undef AIRSTRIKE_THERMOBARIC
#undef ALL_AIRSTRIKES
