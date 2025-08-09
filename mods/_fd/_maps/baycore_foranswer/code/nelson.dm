/obj/structure/fd/mech_wreckage/small/nelson
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/mechs/breacher_def.dmi'
	icon_state = "breacher_death_1"

	pixel_y = 0
	pixel_x = 0
	bound_width = 160
	bound_height = 64

/obj/structure/fd/mech_wreckage/small/nelson/Initialize()
	. = ..()
	var/state = rand(1,4)
	icon_state = "breacher_death_[state]"

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
	integrity = 500
	integrity_max = 500
	repairs_left = 2

	heat_overflow = 10

	weapon_equipped = "Shield"

	movement_cooldown = 5

	var/next_shield_bump = 0
	var/next_spear_poke = 0

	var/pointblank = FALSE

	var/pre_run = 0

	var/momentum = FALSE
	var/momentum_timer = 0
	var/momentum_stacks = 0

	wreck_type = /obj/structure/fd/mech_wreckage/small/nelson

/mob/living/simple_animal/hostile/fd/mech/nelson/Stat()
	. = ..()
	if(statpanel("Mech"))
		if(pointblank)
			stat(SPAN_COLOR("#ff4800", "ПРОТКНУТЬ И ЗАСТРЕЛИТЬ:"), FONT_HUGE(SPAN_COLOR("#ff0000", "ВРЕМЯ ДЕЙСТВОВАТЬ.")))

/mob/living/simple_animal/hostile/fd/mech/nelson/set_dir()
	..()
	switch(dir)
		if(WEST, SOUTH)
			pixel_x = -70
			default_pixel_x = -70
		if(EAST, NORTH)
			pixel_x = -150
			default_pixel_x = -150

/proc/get_nearby_directions(direction)
	if(NORTH) return list(NORTHWEST, NORTH, NORTHEAST)
	else if(NORTHEAST) return list(NORTH, NORTHEAST, EAST)
	else if(EAST) return list(NORTHEAST, EAST, SOUTHEAST)
	else if(SOUTHEAST) return list(EAST, SOUTHEAST, SOUTH)
	else if(SOUTH) return list(SOUTHEAST, SOUTH, SOUTHWEST)
	else if(SOUTHWEST) return list(SOUTH, SOUTHWEST, WEST)
	else if(WEST) return list(SOUTHWEST, WEST, NORTHWEST)
	else if(NORTHWEST) return list(WEST, NORTHWEST, NORTH)
	else return list()

/mob/living/simple_animal/hostile/fd/mech/nelson/Move(loc, dir)
	. = ..()
	if(!.) // Если мы не смогли подвигатся - никакого разгона
		return

	if(!(dir in get_nearby_directions(last_move)))
		momentum = FALSE
		pointblank = FALSE
		momentum_timer = 0
		momentum_stacks = 0
		if(weapon_equipped == "Shield")
			movement_cooldown = 6
		else
			movement_cooldown = 5
		return

	if(pre_run < 3 && !momentum)
		pre_run += 1

	if(!momentum && pre_run >= 3)
		momentum = TRUE
		pre_run = 0


	if(momentum)
		momentum_timer = world.time + 0.7 SECONDS
		if(momentum_stacks < 10)
			momentum_stacks += 1
		if(movement_cooldown > 1)
			movement_cooldown -= 0.5

/mob/living/simple_animal/hostile/fd/mech/nelson/Bump(atom/A)

	if(momentum_stacks >= 10)
		if(istype(A, /mob/living/simple_animal/hostile/fd/mech))
			var/mob/living/simple_animal/hostile/fd/mech/M = A
			shake_camera(src, 1, 1)
			throw_at(get_edge_target_turf(src, get_dir(M, src)), 1, 2, M, FALSE)
			M.throw_at(get_edge_target_turf(M, get_dir(src, M)), 1, 2, src)
			M.chained_for = world.time + 10 SECONDS
			M.chained = TRUE
			pointblank = TRUE
			momentum = FALSE
			momentum_stacks = 0
			if(weapon_equipped == "Shield")
				movement_cooldown = 6
			else
				movement_cooldown = 5

	. = ..()

/mob/living/simple_animal/hostile/fd/mech/nelson/Life()

	if(momentum && world.time >= momentum_timer)
		momentum = FALSE
		pointblank = FALSE
		momentum_timer = 0
		momentum_stacks = 0
		if(weapon_equipped == "Shield")
			movement_cooldown = 6
		else
			movement_cooldown = 5
		return

	. = ..()

/mob/living/simple_animal/hostile/fd/mech/nelson/choose_weapon()
	var/list/options = list(
		"Shield" = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "24"),
		"Spear" = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "24")
	)
	var/chosen_option = show_radial_menu(src, src, options, radius = 30, require_near = TRUE, offset_x = 105, offset_y = 90)
	if(!chosen_option)
		return FALSE
	switch(chosen_option)
		if("Shield")
			weapon_equipped = "Shield"
			armor_stat = 10
			movement_cooldown = 6
		if("Spear")
			weapon_equipped = "Spear"
			armor_stat = 0
			movement_cooldown = 5
	playsound(get_turf(src), 'packs/infinity/sound/items/change_jaws.ogg', 80, TRUE)

/mob/living/simple_animal/hostile/fd/mech/nelson/ClickOn(atom/A, params)
	var/modifiers = params2list(params)

	if(A == src)
		if(hacked)
			if(!do_after(src, 2 SECONDS))
				return FALSE
			hacked = FALSE
			return TRUE

		if(modifiers["left"])
			var/list/options = list(
				"Change Weapon" = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "24"),
				"Reboot" = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "34"),
			)

			var/chosen_option = show_radial_menu(src, src, options, radius = 30, require_near = TRUE, offset_x = 105, offset_y = 90)
			if(!chosen_option)
				return FALSE

			switch(chosen_option)
				if("Toggle Safety")
					weapon_safety = !weapon_safety
					playsound(get_turf(src), 'packs/infinity/sound/effects/using/switch/small2.ogg', 100, TRUE)

				if("Change Weapon")
					choose_weapon()

				if("Reboot")
					mech_reboot()

			return FALSE

	else if(modifiers["middle"])

	else if(modifiers["shift"] && istype(A, /mob/living/simple_animal/hostile/fd/mech))
		scan(A, params)

	else if(modifiers["alt"])
		if(pointblank)
			mech_shoot(A, /obj/item/projectile/bullet/mech/nelson, 5 SECONDS)
			pointblank = FALSE

	else if(modifiers["ctrl"])

	else if(modifiers["left"] && !weapon_safety)
		switch(weapon_equipped)
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
					if(M.leader_target)
						damage_incoming *= 2
					damage_incoming -= M.armor_stat
					if(!M.damaged)
						M.integrity -= damage_incoming
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
					if(M.leader_target)
						damage_incoming *= 2
					if(!M.damaged)
						M.integrity -= damage_incoming
						M.damage_animation(damage_incoming, ignore_armor = TRUE)
				next_shield_bump = world.time + 3 SECONDS

	else
		. = ..()

/obj/item/projectile/bullet/mech/nelson
	real_damage = 50
	hitchance_mod = 5
	fire_sound = 'sound/weapons/gunshot/sniper.ogg'
	icon_state = "bolter"
