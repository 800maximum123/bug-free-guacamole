/obj/structure/fd/mech_wreckage/medium/napoleon
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/mechs/trooper_def.dmi'
	icon_state = "trooper_death_1"

	pixel_y = 0
	pixel_x = 0
	bound_width = 256
	bound_height = 64

/obj/structure/fd/mech_wreckage/medium/napoleon/Initialize()
	. = ..()
	var/state = rand(1,9)
	icon_state = "trooper_death_[state]"

/mob/living/simple_animal/hostile/fd/mech/napoleon
	name = "APU Napoleon"
	desc = "An standart personal unit for general purposes and combat situations."
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/mechs/trooper_def.dmi'
	icon_state = "trooper"
	icon_living = "trooper"

	pixel_x = -111
	default_pixel_x = -111
	pixel_y = -50
	default_pixel_y = -50

	armor_stat = 2

	integrity = 500
	integrity_max = 500
	repairs_left = 2

	heat_overflow = 10

	weapon_equipped = "Riot Shotgun"

	wreck_type = /obj/structure/fd/mech_wreckage/medium/napoleon

	has_ammo = TRUE
	spare_magazines = 6

	var/chambered_rounds = 12
	var/command_cooldown = 0

/mob/living/simple_animal/hostile/fd/mech/napoleon/choose_weapon()
	var/list/options = list(
		"Riot Shotgun" = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "24"),
		"Heavy Pistol" = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "24")
	)
	var/chosen_option = show_radial_menu(src, src, options, radius = 30, require_near = TRUE, offset_x = 105, offset_y = 90)
	if(!chosen_option)
		return FALSE
	weapon_equipped = chosen_option
	playsound(get_turf(src), 'packs/infinity/sound/items/change_jaws.ogg', 80, TRUE)

/mob/living/simple_animal/hostile/fd/mech/napoleon/consume_ammo()
	if(weapon_equipped == "Heavy Pistol")
		return TRUE

	if(chambered_rounds <= 0)
		return FALSE

	chambered_rounds--
	return TRUE

/mob/living/simple_animal/hostile/fd/mech/napoleon/ClickOn(atom/A, params)
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
				"Reload Weapon" = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "17"),
				"Toggle Safety" = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "6"),
				"Reboot" = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "34"),
			)

			var/chosen_option = show_radial_menu(src, src, options, radius = 30, require_near = TRUE, offset_x = 105, offset_y = 90)
			if(!chosen_option)
				return FALSE

			switch(chosen_option)
				if("Reload Weapon")
					if(weapon_equipped == "Riot Shotgun")
						if(spare_magazines <= 0)
							return FALSE

						visible_message(SPAN_NOTICE("[src] начинает перезаряжать своё орудие."), SPAN_INFO("Ты начинаешь перезаряжать своё орудие."))
						if(!do_after(src, 10 SECONDS))
							return FALSE

						playsound(get_turf(src), 'mods/_fd/immersive_sounds/sounds/SOMA/server_lever_reset_01.ogg', 80)
						visible_message(SPAN_NOTICE("[src] загружает новую порцию патрон в систему."), SPAN_INFO("Ты загружаешь новую порцию патрон в систему."))

						chambered_rounds = initial(chambered_rounds)
						spare_magazines -= 1

				if("Toggle Safety")
					weapon_safety = !weapon_safety
					playsound(get_turf(src), 'packs/infinity/sound/effects/using/switch/small2.ogg', 100, TRUE)

				if("Change Weapon")
					choose_weapon()

				if("Reboot")
					mech_reboot()

			return FALSE

	else if(modifiers["middle"])
		mech_shoot(A, /obj/item/projectile/bullet/mech/napoleon_grenade, (world.time + 10 SECONDS), 1, 0)

	else if(modifiers["shift"])
		if(istype(A, /mob/living/simple_animal/hostile/fd/mech))
			scan(A, params)

	else if(modifiers["alt"])
		if(world.time <= command_cooldown)
			return FALSE
		if(istype(A, /mob/living/simple_animal/hostile/fd/mech))
			var/mob/living/simple_animal/hostile/fd/mech/M
			if(M.leader_target)
				return FALSE
			M.leader_target = TRUE
			M.target_for = world.time + 10 SECONDS

	else if(modifiers["ctrl"])

	else if(modifiers["left"] && !weapon_safety)
		switch(weapon_equipped)
			if("Riot Shotgun")
				mech_shoot(A, /obj/item/projectile/bullet/mech/napoleon_shotgun, (world.time + 3 SECONDS), 3, 0)

			if("Heavy Pistol")
				mech_shoot(A, /obj/item/projectile/bullet/mech/napoleon_pistol, (world.time + 1 SECONDS), 1, 0)

	else
		. = ..()

/obj/item/projectile/bullet/mech/napoleon_shotgun
	real_damage = 3
	life_span = 10
	fire_sound = 'sound/weapons/gunshot/shotgun.ogg'
	icon = 'mods/_fd/fd_assets/icons/projectiles.dmi'
	icon_state = "blastwave"

/obj/item/projectile/bullet/mech/napoleon_shotgun/on_hit(atom/target, blocked = 0)
	. = ..()

	if((initial(life_span) - life_span) < 3)
		real_damage += 10

/obj/item/projectile/bullet/mech/napoleon_grenade
	real_damage = 0
	life_span = 20
	fire_sound = 'sound/weapons/bombwhine.ogg'
	icon_state = "spark_green"

/obj/item/projectile/bullet/mech/napoleon_grenade/Destroy()
	new /obj/structure/fd/gravity_mine(get_turf(src))
	. = ..()

/obj/structure/fd/gravity_mine/Initialize()
	. = ..()
	activate()

/obj/structure/fd/gravity_mine/proc/activate()
	for(var/turf/T in view(5,src))
		animate(T, color = COLOR_RED, time = 1 SECOND, easing = CUBIC_EASING | EASE_IN, flags = ANIMATION_PARALLEL)
		spawn(1 SECOND)
			for(var/mob/living/simple_animal/hostile/fd/mech/M in T)
				M.throw_at(src, 3, 2)
			animate(T, color = initial(color), time = 0.2 SECOND, easing = CUBIC_EASING | EASE_OUT, flags = ANIMATION_PARALLEL)
	spawn(2.5 SECONDS)
		qdel(src)

/obj/item/projectile/bullet/mech/napoleon_pistol
	real_damage = 15
	fire_sound = 'sound/weapons/gunshot/sniper.ogg'
