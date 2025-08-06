/mob/living/simple_animal/hostile/fd/mech/saladin
	name = "SUPP-APU Saladin"
	desc = "An special experimental mech, utilizing some of the stolen enemy tech."
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/mechs/experimental_def.dmi'
	icon_state = "experimental"
	icon_living = "experimental"

	pixel_x = -115
	default_pixel_x = -115
	pixel_y = -25
	default_pixel_y = -25

	integrity_stat = 300
	integrity_stat_max = 300

	heat_overflow = 40
	overheat_timer = 60
	has_overheated_state = TRUE

	weapon_equiped = "Thermal Release"

	repairs_left = 2

	movement_cooldown = 2

	var/jump_cooldown = 0

	var/mob/living/simple_animal/hostile/fd/mech/protected = null
	var/shield_integrity = 200
	var/shield_cooldown = 0

/mob/living/simple_animal/hostile/fd/mech/saladin/Stat()
	. = ..()
	if(statpanel("Mech"))
		if(jump_cooldown > world.time)
			stat(null, SPAN_COLOR("#67d7eb", "Следующий Прыжок: [jump_cooldown - world.time / 10] Секунд"))
		if(protected)
			stat(null, SPAN_BOLD(SPAN_COLOR("#6dc5ff", "Барьера [protected.name]: [shield_integrity]")))

/mob/living/simple_animal/hostile/fd/mech/saladin/Life()
	if(overheated && overheat_timer > 0 && !damaged)
		for(var/mob/living/simple_animal/hostile/fd/mech/M in orange(5,src))
			M.integrity_stat -= 5
			M.damage_animation(5, ignore_armor = TRUE)

	. = ..()

	if(shield_integrity <= 0)
		if(!isnull(protected))
			protected.CutOverlays(field_overlay)
			protected.overprotected = FALSE

			shield_integrity = initial(shield_integrity)
			protected = null
			shield_cooldown = world.time + 10 SECONDS

	if(!isnull(protected) && get_dist(protected, src) > 12)
		protected.CutOverlays(field_overlay)
		protected.overprotected = FALSE

		shield_integrity = initial(shield_integrity)
		protected = null
		shield_cooldown = world.time + 5 SECONDS

/mob/living/simple_animal/hostile/fd/mech/saladin/ClickOn(atom/A, params)
	var/modifiers = params2list(params)

	if(modifiers["alt"])
		if(world.time <= jump_cooldown)
			return FALSE
		var/turf/target_turf = get_turf(A)
		if(heat < 10 && A.density != FALSE)
			return FALSE

		animate(src, transform = matrix(0.01, MATRIX_SCALE), time = 1 SECOND, easing = BOUNCE_EASING)

		sleep(1 SECOND)
		alpha = 0

		sleep(1 SECONDS)

		alpha = 255
		forceMove(target_turf)

		sleep(2 SECONDS)

		animate(src, transform = matrix(), time = 1 SECOND, easing = BOUNCE_EASING)
		heat -= 10
		return TRUE

	if(modifiers["shift"])
		if(istype(A, /mob/living/simple_animal/hostile/fd/mech))
			var/mob/living/simple_animal/hostile/fd/mech/M = A
			if(world.time <= shield_cooldown)
				return FALSE
			if(M == protected)
				protected.overprotected = FALSE
				protected.CutOverlays(field_overlay)
				shield_integrity = initial(shield_integrity)
				protected = null

				shield_cooldown = world.time + 5 SECONDS
				return TRUE
			if(!do_after(src, 2 SECONDS))
				return FALSE

			if(!isnull(protected) && protected != M)
				protected.overprotected = FALSE
				protected.CutOverlays(field_overlay)
				shield_integrity = initial(shield_integrity)
				protected = null

			protected = M
			field_overlay = mutable_appearance('mods/_fd/_maps/baycore_foranswer/icons/mechs/experimental_def.dmi', "shield")
			field_overlay.pixel_x = M.pixel_x + 100
			field_overlay.mouse_opacity = FALSE

			protected.overprotected = TRUE
			protected.AddOverlays(field_overlay)
			return TRUE

	if(A == src && hacked)
		if(!do_after(src, 2 SECONDS))
			return FALSE
		hacked = FALSE
		return TRUE

	if(A == src)
		var/list/options = list(
			"Toggle Safety" = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "6"),
			"Reboot" = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "34"),
		)

		var/chosen_option = show_radial_menu(src, src, options, radius = 30, require_near = TRUE, offset_x = 105, offset_y = 90)
		if(!chosen_option)
			return FALSE
		switch(chosen_option)

			if("Toggle Safety")
				if(can_shoot)
					can_shoot = FALSE
					return TRUE
				if(!can_shoot)
					can_shoot = TRUE
					return TRUE

			if("Reboot")
				if(!damaged)
					return FALSE
				if(!do_after(src, 60 SECONDS))
					return FALSE
				damaged = FALSE
				integrity_stat = integrity_stat_max / 2
				repairs_left -= 1
				remove_filter("down")
				return TRUE

	. = ..()

	switch(weapon_equiped)
		if("Thermal Release")
			mech_shoot(A, /obj/item/projectile/bullet/mech/saladin, (world.time + 2 SECONDS))

/mob/living/simple_animal/hostile/fd/mech/saladin/consume_ammo()
	if(heat <= 0)
		return FALSE
	heat -= 1
	return TRUE

/obj/item/projectile/bullet/mech/saladin
	real_damage = 5
	icon = 'mods/_fd/fd_assets/icons/projectiles.dmi'
	icon_state = "heavylaser"
	fire_sound = 'sound/weapons/laser3.ogg'

/obj/item/projectile/bullet/mech/saladin/on_hit(atom/target, blocked = 0)
	. = ..()

	if(istype(target, /mob/living/simple_animal/hostile/fd/mech))
		var/mob/living/simple_animal/hostile/fd/mech/M = target

		M.heat += 2
