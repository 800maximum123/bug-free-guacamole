/obj/structure/fd/mech_wreckage/big
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/mechs/heavy_def.dmi'
	icon_state = "heavy_death_1"

	pixel_y = 0
	pixel_x = 0
	bound_width = 256
	bound_height = 64

/obj/structure/fd/mech_wreckage/big/Initialize()
	. = ..()
	var/state = rand(1,7)
	icon_state = "heavy_death_[state]"

/mob/living/simple_animal/hostile/fd/mech/drake
	name = "H-APU Drake"
	desc = "The Drake was the first, and most resilient APU ever designed by ''Shield''."
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/mechs/heavy_def.dmi'
	icon_state = "heavy"
	icon_living = "heavy"

	pixel_x = -110
	default_pixel_x = -110
	pixel_y = -30
	default_pixel_y = -30

	movement_cooldown = 7

	armor_stat = 5
	integrity = 1000
	integrity_max = 1000

	heat_overflow = 10
	weapon_equipped = "Assault Cannon"
	repairs_left = 2

	spare_magazines = 1
	has_ammo = TRUE

	wreck_type = /obj/structure/fd/mech_wreckage/big

	var/cannon_ammo = 600

	var/speed_buff = 0 // Разгон ствола за счёт перегрева
	var/start_counting = FALSE
	var/buff_timer = 30 SECONDS

	var/bunkermode = FALSE
	var/bunker_radius = 3
	var/list/protected_turfs = list()

	var/next_shield_bump = 0

/mob/living/simple_animal/hostile/fd/mech/drake/Move()
	if(bunkermode)
		return 0

	. = ..()

/mob/living/simple_animal/hostile/fd/mech/drake/Life()
	if(speed_buff > 0 && !start_counting)
		start_counting = TRUE
		buff_timer += world.time

	if(world.time >= buff_timer && start_counting)
		speed_buff = 0
		buff_timer = initial(buff_timer)
		start_counting = FALSE

	if(bunkermode && !damaged)
		for(var/mob/living/simple_animal/hostile/fd/mech/M in oview(2,src))
			M.shielded = TRUE

	. = ..()

/mob/living/simple_animal/hostile/fd/mech/drake/choose_weapon()
	var/list/options = list(
		"Assault Cannon" = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "24"),
		"Shield" = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "24")
	)
	var/chosen_option = show_radial_menu(src, src, options, radius = 30, require_near = TRUE, offset_x = 105, offset_y = 90)
	if(!chosen_option)
		return FALSE
	weapon_equipped = chosen_option
	playsound(get_turf(src), 'packs/infinity/sound/items/change_jaws.ogg', 80, TRUE)

/mob/living/simple_animal/hostile/fd/mech/drake/consume_ammo()
	if(cannon_ammo <= 0)
		return FALSE
	cannon_ammo--
	return TRUE

/mob/living/simple_animal/hostile/fd/mech/drake/proc/toggle_bunker()
	bunkermode = !bunkermode
	to_chat(src, SPAN_NOTICE("Ты [bunkermode ? "разложил" : "втянул"] пластины своего мобильного бункера."))
	if(bunkermode)
		armor_stat = initial(armor_stat)
		playsound(get_turf(src),'packs/infinity/sound/mecha/bigmech_rstep.ogg',100)
		add_filter("bunker", 1, list("type" = "outline", , "size" = 0, "color" = COLOR_BLACK))
		animate(get_filter("bunker"), time = 1 SECONDS, size = 2, easing = SINE_EASING, flags = ANIMATION_PARALLEL)
		for(var/turf/floor in block(x-bunker_radius, y-bunker_radius, z, x+bunker_radius, y+bunker_radius, z))
			protected_turfs[floor] = floor.color
			animate(floor, time = 1 SECONDS, color = COLOR_DARK_GRAY, easing = SINE_EASING, flags = ANIMATION_PARALLEL)
	else
		armor_stat = 15
		playsound(get_turf(src),'packs/infinity/sound/mecha/bigmech_rturn.ogg',100)
		animate(get_filter("bunker"), time = 1.5 SECONDS, size = 0, easing = SINE_EASING, flags = ANIMATION_PARALLEL)
		for(var/turf/floor in protected_turfs.Copy())
			animate(floor, time = 1.5 SECONDS, color = protected_turfs[floor], easing = SINE_EASING, flags = ANIMATION_PARALLEL)
		protected_turfs.Cut()

/mob/living/simple_animal/hostile/fd/mech/drake/ClickOn(atom/A, params)
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
				"Accelerate Cannon" = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "22"),
				"Bunker On/Off" = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "18"),
				"Toggle Safety" = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "6"),
				"Reboot" = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "34"),
			)

			var/chosen_option = show_radial_menu(src, src, options, radius = 30, require_near = TRUE, offset_x = 105, offset_y = 90)
			if(!chosen_option)
				return FALSE

			switch(chosen_option)
				if("Toggle Safety")
					weapon_safety = !weapon_safety
					playsound(get_turf(src), 'packs/infinity/sound/effects/using/switch/small2.ogg', 100, TRUE)

				if("Reload Weapon")
					if(weapon_equipped == "Assault Cannon")
						if(spare_magazines <= 0)
							return FALSE

						visible_message(SPAN_NOTICE("[src] начинает перезаряжать своё орудие."), SPAN_INFO("Ты начинаешь перезаряжать своё орудие."))
						if(!do_after(src, 10 SECONDS))
							return FALSE

						playsound(get_turf(src), 'mods/_fd/immersive_sounds/sounds/SOMA/server_lever_reset_01.ogg', 80)
						visible_message(SPAN_NOTICE("[src] загружает новую порцию патрон в систему."), SPAN_INFO("Ты загружаешь новую порцию патрон в систему."))

						cannon_ammo = initial(cannon_ammo)
						spare_magazines -= 1

				if("Bunker On/Off")
					if(!damaged)
						toggle_bunker()

				if("Accelerate Cannon")
					if(damaged)
						return FALSE
					if(speed_buff >= 4 SECONDS)
						to_chat(src, SPAN_WARNING("Пушка уже раскручена до максимума!"))
						return FALSE
					visible_message(SPAN_DANGER("[src] разгоняет свою роторную пушку, повышая нагрев!"))
					if(!do_after(src, 2 SECONDS))
						return FALSE
					if(speed_buff >= 4 SECONDS)
						to_chat(src, SPAN_WARNING("Пушка уже раскручена до максимума!"))
						return FALSE
					speed_buff += 1 SECOND
					if(overheated)
						integrity -= 10
						damage_animation(10, ignore_armor = TRUE)
					else
						heat += 1
					playsound(get_turf(src),'mods/_fd/immersive_sounds/sounds/SOMA/computer_fan_turn_on.ogg',100)

				if("Change Weapon")
					choose_weapon()

				if("Reboot")
					mech_reboot()

			return FALSE

	else if(modifiers["middle"])

	else if(modifiers["shift"] && istype(A, /mob/living/simple_animal/hostile/fd/mech))
		scan(A, params)

	else if(modifiers["alt"])

	else if(modifiers["ctrl"])

	else if(modifiers["left"] && !weapon_safety)
		switch(weapon_equipped)
			if("Assault Cannon")
				mech_shoot(A, /obj/item/projectile/bullet/mech/drake, 4 SECONDS - speed_buff, 6, 1)

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

	else
		. = ..()

/obj/item/projectile/bullet/mech/drake
	icon_state = "bolter"
	fire_sound = 'sound/weapons/gunshot/minigun.ogg'
