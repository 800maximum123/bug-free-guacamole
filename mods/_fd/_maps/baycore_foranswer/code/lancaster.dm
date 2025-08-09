/obj/structure/fd/mech_wreckage/small/lancaster
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/mechs/engineer_def.dmi'
	icon_state = "engineer_death_1"

	pixel_y = 0
	pixel_x = 0
	bound_width = 256
	bound_height = 64

/mob/living/simple_animal/hostile/fd/mech/lancaster
	name = "SUPP-APU Lancaster"
	desc = "Special engineering machine, manufactured to bring fast aid to the other personal units on the battlefield."
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/mechs/engineer_def.dmi'
	icon_state = "engineer"
	icon_living = "engineer"

	pixel_x = -105
	default_pixel_x = -105
	pixel_y = -55
	default_pixel_y = -55

	movement_cooldown = 4

	armor_stat = 4
	integrity = 500
	integrity_max = 500

	heat_overflow = 5
	overheat_timer = 10

	weapon_equipped = "Plasma Cutter"

	repairs_left = 4
	var/restock_charges = 12

	var/ping_cooldown = 0

	var/cooling_process = 30 SECONDS
	var/start_counting = FALSE

	var/mob/living/simple_animal/hostile/fd/mech/passenger = null
	var/mutable_appearance/passenger_overlay

	wreck_type = /obj/structure/fd/mech_wreckage/small/lancaster

/mob/living/simple_animal/hostile/fd/mech/lancaster/Stat()
	. = ..()
	if(statpanel("Mech"))
		stat(SPAN_COLOR("#aac256", "Зарядов Пополнения:"), SPAN_COLOR("#aac256", "[restock_charges]"))

/mob/living/simple_animal/hostile/fd/mech/lancaster/Life()
	if(heat > 0 && !start_counting)
		start_counting = TRUE
		cooling_process += world.time

	if(world.time >= cooling_process && start_counting)
		heat -= 1
		cooling_process = initial(cooling_process)
		start_counting = FALSE

	. = ..()

/mob/living/simple_animal/hostile/fd/mech/lancaster/proc/choose_resupp(params)
	var/list/mechs_in_radius = list()

	var/list/options = list(
		"Reboot Self" = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "34"),
		"Patch Allie/Self" = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "36"),
		"Restock Allie" = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "30")
	)

	var/chosen_option = show_radial_menu(src, src, options, radius = 30, require_near = TRUE, offset_x = 105, offset_y = 90)
	if(!chosen_option)
		return FALSE
	switch(chosen_option)
		if("Reboot Self")
			mech_reboot()
			return TRUE

		if("Patch Allie/Self")
			if(restock_charges <= 0)
				to_chat(src, SPAN_WARNING("Для этого действия нужен как минимум 1 Заряд Пополнения!"))
				return FALSE
			for(var/mob/living/simple_animal/hostile/fd/mech/M in view(2,src))
				if(!M.dead)
					mechs_in_radius += M
			var/mob/living/simple_animal/hostile/fd/mech/target_choice = show_radial_menu(src, src, mechs_in_radius, radius = 30, require_near = TRUE, offset_x = 105, offset_y = 90)
			if(!target_choice)
				return FALSE
			if(target_choice.integrity >= target_choice.integrity_max)
				to_chat(src, SPAN_WARNING("[target_choice.name] полностью цел."))
				return FALSE
			visible_message(SPAN_NOTICE("[src] начал ремонтировать корпус [target_choice]."), SPAN_INFO("Ты начал ремонтировать корпус [target_choice]."))
			playsound(get_turf(src), 'sound/items/welderactivate.ogg', 80)
			spawn(0.5 SECONDS)
				playsound(get_turf(src), 'sound/items/Welder2.ogg', 80)
			var/obj/particle_emitter/sparks/EM = new(get_turf(target_choice), 10 SECONDS)
			EM.set_dir(get_dir(target_choice, src))
			EM.pixel_y = 80
			if(!do_after(src, 10 SECONDS))
				qdel(EM)
				return FALSE
			if(!QDELETED(EM))
				qdel(EM)
			playsound(get_turf(src), 'sound/items/welderdeactivate.ogg', 80)
			target_choice.mech_reboot(FALSE, FALSE)
			target_choice.integrity = min(target_choice.integrity + 100, target_choice.integrity_max)
			visible_message(SPAN_NOTICE("[src] закончил ремонтировать повреждения у [target_choice]."), SPAN_INFO("Ты закончил ремонтировать повреждения у [target_choice]."))
			return TRUE

		if("Restock Allie")
			if(restock_charges <= 0)
				to_chat(src, SPAN_WARNING("Для этого действия нужен как минимум 1 Заряд Пополнения!"))
				return FALSE
			for(var/mob/living/simple_animal/hostile/fd/mech/M in oview(1,src))
				if(!M.dead && M.has_ammo)
					mechs_in_radius += M
			var/mob/living/simple_animal/hostile/fd/mech/target_choice = show_radial_menu(src, src, mechs_in_radius, radius = 30, require_near = TRUE, offset_x = 105, offset_y = 90)
			if(!target_choice)
				return FALSE
			visible_message(SPAN_NOTICE("[src] начал погружать припасы на борт [target_choice]."), SPAN_INFO("Ты начал погружать припасы на борт [target_choice]."))
			playsound(get_turf(src), 'sound/effects/lift_heavy_start.ogg', 100)
			spawn(5 SECONDS)
				if(!.)
					playsound(get_turf(target_choice), 'sound/effects/lift_heavy_stop.ogg', 100)
			if(!do_after(src, 10 SECONDS, target_choice))
				. = FALSE
				return .
			target_choice.spare_magazines += 2
			restock_charges -= 1
			visible_message(SPAN_NOTICE("[src] восполнил часть припасов у [target_choice]."), SPAN_INFO("Ты восполнил часть припасов у [target_choice]."))
			return TRUE

/mob/living/simple_animal/hostile/fd/mech/lancaster/ClickOn(atom/A, params)
	var/modifiers = params2list(params)

	if(A == src)
		if(hacked)
			if(!do_after(src, 2 SECONDS))
				return FALSE
			hacked = FALSE
			return TRUE

		if(modifiers["left"])
			var/list/options = list(
				"Toggle Safety" = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "6"),
				"Resupply Mech" = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "17"),
				"Ping Area" = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "28"),
				"Unattach Passenger" = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "20"),
			)

			var/chosen_option = show_radial_menu(src, src, options, radius = 30, require_near = TRUE, offset_x = 105, offset_y = 90)
			if(!chosen_option)
				return FALSE

			switch(chosen_option)
				if("Toggle Safety")
					weapon_safety = !weapon_safety
					playsound(get_turf(src), 'packs/infinity/sound/effects/using/switch/small2.ogg', 100, TRUE)

				if("Resupply Mech")
					choose_resupp(params)

				if("Ping Area")
					if(world.time <= ping_cooldown)
						heat += 1
					if(!do_after(src, 2 SECONDS, do_flags = DO_BOTH_CAN_MOVE))
						return FALSE
					for(var/mob/living/simple_animal/hostile/fd/mech/M in oview(6,src))
						if(M.faction != faction && alpha < 255)
							animate(M, 1 SECOND, alpha = 255)
					ping_cooldown = world.time + 5 SECONDS
					heat += 1

				if("Unattach Passenger")
					if(!isnull(passenger))
						passenger.forceMove(get_turf(src))
						passenger = null
						contents -= passenger
						movement_cooldown = 2
						CutOverlays(passenger_overlay)
						return TRUE

			return FALSE

	else if(modifiers["middle"])

	else if(modifiers["shift"] && istype(A, /mob/living/simple_animal/hostile/fd/mech))
		scan(A, params)

	else if(modifiers["alt"])
		if(get_dist(A, src) > 2)
			return FALSE
		if(!isnull(passenger))
			return FALSE
		if(istype(A, /mob/living/simple_animal/hostile/fd/mech))
			var/mob/living/simple_animal/hostile/fd/mech/M = A
			if(M == src)
				return FALSE
			if(!do_after(src, 5 SECONDS))
				return FALSE
			M.forceMove(src)
			passenger = M
			passenger_overlay = mutable_appearance(M.icon, M.icon_state)
			passenger_overlay.pixel_y = M.pixel_y + 100
			passenger_overlay.mouse_opacity = FALSE
			movement_cooldown = 4

			AddOverlays(passenger_overlay)
			return TRUE

	else if(modifiers["ctrl"])

	else if(modifiers["left"] && !weapon_safety)
		switch(weapon_equipped)
			if("Plasma Cutter")
				mech_shoot(A, /obj/item/projectile/bullet/mech/lancaster, 1 SECONDS, 2, 1)

	else
		. = ..()

/obj/item/projectile/bullet/mech/lancaster
	real_damage = 3
	life_span = 6
	piercing = TRUE
	icon_state = "pulse0_bl"
	fire_sound = 'sound/weapons/plasma_cutter.ogg'
