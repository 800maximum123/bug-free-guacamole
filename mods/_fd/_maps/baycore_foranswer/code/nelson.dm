/mob/living/simple_animal/hostile/fd/mech/nelson
	name = "APU Nelson"
	desc = "One of the most used breaching units."
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/mechs/breacher_def.dmi'
	icon_state = "breacher"
	icon_living = "breacher"

	pixel_x = -70
	default_pixel_x = -70
	pixel_y = -60
	default_pixel_y = -60

	armor_stat = 10
	integrity_stat = 500
	integrity_stat_max = 500
	repairs_left = 2

	heat_overflow = 10

	weapon_equiped = "Shield"

	movement_cooldown = 4

	var/next_shield_bump = 0
	var/next_spear_poke = 0

	var/pointblank = FALSE

	var/pre_run = 0

	var/momentum = FALSE
	var/momentum_timer = 1 SECOND
	var/momentum_stacks = 0

/mob/living/simple_animal/hostile/fd/mech/nelson/set_dir()
	..()
	switch(dir)
		if(WEST, SOUTH)
			pixel_x = -70
			default_pixel_x = -70
		if(EAST, NORTH)
			pixel_x = -150
			default_pixel_x = -150

/mob/living/simple_animal/hostile/fd/mech/nelson/Move()
	if(pre_run < 3 && !momentum)
		pre_run += 1

	if(!momentum && pre_run >= 3)
		momentum = TRUE
		pre_run = 0
		momentum_timer += world.time

	if(momentum)
		if(momentum_stacks < 10)
			momentum_timer += 1 SECONDS
			momentum_stacks += 1
		if(movement_cooldown > -1)
			movement_cooldown -= 0.5

	. = ..()

/mob/living/simple_animal/hostile/fd/mech/nelson/Bump(atom/A)

	if(momentum_stacks >= 10)
		if(istype(A, /mob/living/simple_animal/hostile/fd/mech))
			var/mob/living/simple_animal/hostile/fd/mech/M = A
			shake_camera(src, 1, 1)
			throw_at(get_edge_target_turf(src, get_dir(M, src)), 1, 3, M)
			M.throw_at(get_edge_target_turf(M, get_dir(src, M)), 1, 3, src)
			M.chained_for = world.time + 10 SECONDS
			M.chained = TRUE
			pointblank = TRUE
			momentum_stacks = 0

	. = ..()

/mob/living/simple_animal/hostile/fd/mech/nelson/Life()

	if(momentum && world.time >= momentum_timer)
		momentum_stacks = 0
		momentum_timer = initial(momentum_timer)
		movement_cooldown = initial(movement_cooldown)
		momentum = FALSE
		pointblank = FALSE

	. = ..()

/mob/living/simple_animal/hostile/fd/mech/nelson/choose_weapon()
	var/list/options = list(
		"Shield" = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "24"),
		"Spear" = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "24")
	)
	var/chosen_option = show_radial_menu(src, src, options, radius = 30, require_near = TRUE, offset_x = 105, offset_y = 90)
	switch(chosen_option)
		if("Shield")
			weapon_equiped = "Shield"
			armor_stat = 10
			movement_cooldown = 4
			return TRUE
		if("Spear")
			weapon_equiped = "Spear"
			armor_stat = 0
			movement_cooldown = 2
			return TRUE

/mob/living/simple_animal/hostile/fd/mech/nelson/ClickOn(atom/A, params)
	if(A == src && hacked)
		if(!do_after(src, 2 SECONDS))
			return FALSE
		hacked = FALSE
		return TRUE

	if(A == src)
		var/list/options = list(
			"Change Weapon" = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "24"),
			"Reboot" = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "34"),
		)

		var/chosen_option = show_radial_menu(src, src, options, radius = 30, require_near = TRUE, offset_x = 105, offset_y = 90)
		if(!chosen_option)
			return FALSE
		switch(chosen_option)

			if("Change Weapon")
				choose_weapon()
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

	var/modifiers = params2list(params)

	if(modifiers["alt"])
		if(pointblank)
			if(malfunction)
				return FALSE
			if(damaged)
				return FALSE
			else
				var/obj/item/projectile/bullet/mech/pew
				var/pew_sound

				pew = new /obj/item/projectile/bullet/mech(get_turf(src))
				pew.real_damage = 50
				pew.hitchance_mod = 5
				pew.icon_state = "bolter"
				pew_sound = 'sound/weapons/gunshot/sniper.ogg'
				pew.SetTransform(2)

				if(istype(pew))
					playsound(pew.loc, pew_sound, 25, 1)
					pew.original = A
					pew.current = A
					pew.starting = get_turf(src)
					pew.shot_from = src
					pew.launch(A)
					pointblank = FALSE
				return TRUE

	. = ..()

	switch(weapon_equiped)

		if("Shield")
			if(damaged)
				return FALSE
			if(get_dist(A, src) > 1)
				return FALSE
			if(world.time <= next_shield_bump)
				return FALSE

			do_attack_animation(A)
			if(istype(A, /mob/living/simple_animal/hostile/fd/mech))
				var/mob/living/simple_animal/hostile/fd/mech/M = A
				var/damage_incoming = 10
				damage_incoming -= M.armor_stat
				if(!M.damaged)
					M.integrity_stat -= damage_incoming
					M.damage_animation(damage_incoming)
					M.throw_at(get_edge_target_turf(M, get_dir(src, M)), 5, 3, src)
			next_shield_bump = world.time + 1 SECONDS

		if("Spear")
			if(damaged)
				return FALSE
			if(get_dist(A, src) > 4)
				return FALSE
			if(world.time <= next_spear_poke)
				return FALSE

			do_attack_animation(A)
			if(istype(A, /mob/living/simple_animal/hostile/fd/mech))
				var/mob/living/simple_animal/hostile/fd/mech/M = A
				var/damage_incoming = 5
				if(!M.damaged)
					M.integrity_stat -= damage_incoming
					M.damage_animation(damage_incoming, ignore_armor = TRUE)
			next_shield_bump = world.time + 3 SECONDS
