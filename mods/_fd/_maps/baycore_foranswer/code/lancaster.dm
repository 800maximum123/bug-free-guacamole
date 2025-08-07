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

	movement_cooldown = 2

	armor_stat = 4
	integrity_stat = 500
	integrity_stat_max = 500

	heat_overflow = 5
	overheat_timer = 10

	weapon_equipped = "Plasma Cutter"

	repairs_left = 4
	var/restock_charges = 12

	var/cooling_process = 30 SECONDS
	var/start_counting = FALSE

	var/mob/living/simple_animal/hostile/fd/mech/passenger = null
	var/mutable_appearance/passenger_overlay

	wreck_type = /obj/structure/fd/mech_wreckage/small/lancaster

/mob/living/simple_animal/hostile/fd/mech/lancaster/Stat()
	. = ..()
	if(statpanel("Mech"))
		stat(null, SPAN_BOLD(SPAN_COLOR("#aac256", "Зарядов Пополнения: [restock_charges]")))

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
			if(!damaged)
				return FALSE
			if(!do_after(src, 60 SECONDS))
				return FALSE
			damaged = FALSE
			integrity_stat = integrity_stat_max / 2
			repairs_left -= 1
			remove_filter("down")
			return TRUE

		if("Patch Allie/Self")
			if(restock_charges <= 0)
				return FALSE
			for(var/mob/living/simple_animal/hostile/fd/mech/M in view(2,src))
				if(M.stat != DEAD)
					mechs_in_radius += M
			var/mob/living/simple_animal/hostile/fd/mech/target_choice = show_radial_menu(src, src, mechs_in_radius, radius = 30, require_near = TRUE, offset_x = 105, offset_y = 90)
			if(!target_choice)
				return FALSE
			if(!do_after(src, 10 SECONDS))
				return FALSE
			target_choice.mech_reboot(FALSE)
			target_choice.integrity_stat = min(target_choice.integrity_stat + 100, target_choice.integrity_stat_max)
			return TRUE

		if("Restock Allie")
			if(restock_charges <= 0)
				return FALSE
			for(var/mob/living/simple_animal/hostile/fd/mech/M in oview(1,src))
				if(M.stat != DEAD && M.has_ammo)
					mechs_in_radius += M
			var/mob/living/simple_animal/hostile/fd/mech/target_choice = show_radial_menu(src, src, mechs_in_radius, radius = 100, require_near = TRUE, offset_x = 105, offset_y = 90)
			if(!target_choice)
				return FALSE
			if(!do_after(src, 10 SECONDS, target_choice))
				return FALSE
			target_choice.spare_magazines += 2
			restock_charges -= 1
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
				"Unattach Passenger" = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "20"),
			)

			var/chosen_option = show_radial_menu(src, src, options, radius = 30, require_near = TRUE, offset_x = 105, offset_y = 90)
			if(!chosen_option)
				return FALSE
			switch(chosen_option)
				if("Toggle Safety")
					weapon_safety = !weapon_safety

				if("Resupply Mech")
					choose_resupp(params)

				if("Unattach Passenger")
					if(!isnull(passenger))
						passenger.forceMove(get_turf(src))
						passenger = null
						contents -= passenger
						movement_cooldown = 2
						CutOverlays(passenger_overlay)

			return FALSE

	else if(modifiers["middle"])

	else if(modifiers["shift"])

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
				mech_shoot(A, /obj/item/projectile/bullet/mech/lancaster, (world.time + 1 SECONDS), 2, 1)

	else
		. = ..()

/obj/item/projectile/bullet/mech/lancaster
	real_damage = 3
	life_span = 5
	piercing = TRUE
	icon_state = "pulse0_bl"
	fire_sound = 'sound/weapons/plasma_cutter.ogg'
