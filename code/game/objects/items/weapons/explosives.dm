/obj/item/plastique
	name = "plastic explosives"
	desc = "Used to put holes in specific areas without too much extra hole. Get cover!"
	gender = PLURAL
	icon = 'icons/obj/weapons/grenade.dmi'
	icon_state = "plastic-explosive"
	item_state = "plasticx"
	item_flags = ITEM_FLAG_NO_BLUDGEON
	w_class = ITEM_SIZE_SMALL
	origin_tech = list(TECH_ESOTERIC = 2)
	var/datum/wires/explosive/c4/wires = null
	var/timer = 10
	var/atom/target = null
	var/open_panel = 0
	var/image_overlay = null

	var/power = 300
	var/falloff = 50
	var/shaped = FALSE

/obj/item/plastique/New()
	wires = new(src)
	image_overlay = image('icons/obj/weapons/grenade.dmi', "[icon_state]2")
	..()

/obj/item/plastique/Destroy()
	qdel(wires)
	wires = null
	return ..()

/obj/item/plastique/use_tool(obj/item/I, mob/living/user, list/click_params)
	if(isScrewdriver(I))
		open_panel = !open_panel
		to_chat(user, SPAN_NOTICE("You [open_panel ? "open" : "close"] the wire panel."))
		return TRUE
	if (isWirecutter(I) || isMultitool(I) || istype(I, /obj/item/device/assembly/signaler ))
		wires.Interact(user)
		return TRUE
	else
		return ..()

/obj/item/plastique/attack_self(mob/user as mob)
	var/newtime = input(usr, "Please set the timer.", "Timer", 10) as num
	if (newtime < 10)
		to_chat(user, SPAN_WARNING("You cannot set the timer to be less than 10 seconds."))
		return

	if (user.get_active_hand() == src)
		newtime = clamp(newtime, 10, 60000)
		timer = newtime
		to_chat(user, "Timer set for [timer] seconds.")

/obj/item/plastique/use_after(atom/clicked, mob/living/user, click_parameters)
	if(user.a_intent != I_HURT)
		return
	if(clicked in user)
		return
	var/plant_time = 5 SECONDS
	if(ismob(clicked))
		plant_time = 15 SECONDS
		user.visible_message(SPAN_WARNING("[user] is planting [src] on \the [clicked]!"), SPAN_WARNING("Planting explosives on [clicked]! Its hard doing so with a living being."))
		to_chat(clicked, FONT_HUGE(SPAN_DANGER("[user] is planting [src] on you!")))
	else
		user.visible_message(SPAN_WARNING("[user] is planting [src] on \the [clicked]!"), SPAN_NOTICE("Planting [src] on \the [clicked]..."))

	user.balloon_alert_to_viewers("planting...")
	user.do_attack_animation(clicked)
	playsound(clicked, 'sound/machines/lockenable.ogg', 60, FALSE)

	if(do_after(user, plant_time, clicked, DO_DEFAULT | DO_USER_UNIQUE_ACT | DO_PUBLIC_PROGRESS) && in_range(user, clicked))
		if(!user.unequip_item())
			FEEDBACK_UNEQUIP_FAILURE(user, src)
			return TRUE
		target = clicked
		forceMove(null)

		if (ismob(target))
			admin_attack_log(user, target, "Planted \a [src] with a [timer] second fuse.", "Had \a [src] with a [timer] second fuse planted on them.", "planted \a [src] with a [timer] second fuse on")
			log_game("[key_name(user)] planted [src.name] on [key_name(target)] with [timer] second fuse")
			user.visible_message(SPAN_DANGER("[user.name] finished planting an explosive on [target.name]!"))
		else
			log_and_message_admins("planted \a [src] with a [timer] second fuse on \the [target].")

		dir = get_dir(user, target)
		target.AddOverlays(image_overlay)
		to_chat(user, "Bomb has been planted. Timer counting down from [timer].")
		playsound(target.loc, 'sound/effects/bomb.ogg', 30, FALSE)
		run_timer()
	return TRUE

/obj/item/plastique/proc/explode(turf/location)
	if(!target)
		target = get_atom_on_turf(src)
	if(!target)
		target = src
	if(target)
		target.CutOverlays(image_overlay)
	if(target)
		if(istype(target, /turf/simulated/wall))
			var/turf/simulated/wall/W = target
			W.kill_health()
		if(istype(target, /obj/machinery/door))
			var/obj/machinery/door/D = target
			qdel(D)
	if(location)
		if(shaped)
			cell_explosion(location, power, falloff, direction = dir, shrapnel = FALSE)
			fragmentate(location, 72, 7, direction = dir)
		else
			cell_explosion(location, power, falloff, shrapnel = FALSE)

/obj/item/plastique/proc/run_timer()
	set waitfor = 0
	var/T = timer
	while(T > 0)
		sleep(1 SECOND)
		if(target)
			playsound(target, 'sound/items/timer.ogg', 50)
		else
			playsound(loc, 'sound/items/timer.ogg', 50)
		T--
	explode(get_turf(target))
	qdel(src)

/obj/item/plastique/breaching
	name = "breaching explosive"
	desc = "Used to put holes in specific areas with putting MORE extra holes on the other side. Safe to stay near."
	gender = NEUTER
	icon_state = "plasticx4"

	power = 400
	shaped = TRUE
