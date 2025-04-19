/mob/living/simple_animal/fd/unit/cmpack/aliens
	side = "Xenos"
	icon = 'mods/_fd/fd_tbs/icons/tbs_units_xenos.dmi'

/mob/living/simple_animal/fd/unit/cmpack/aliens/special_death()
	for(var/mob/living/simple_animal/fd/unit/victim in oview(1,src))
		if(victim.side == side)
			continue
		new /obj/temporary(get_turf(victim), 3, 'mods/_fd/fd_tbs/icons/status_effects.dmi', "human_acid")
		victim.poison_strenght += 3
		animate(victim, color = COLOR_RED, time = 0.2 SECOND, easing = CUBIC_EASING | EASE_IN)
		spawn(0.3 SECOND)
			animate(victim, color = COLOR_WHITE, time = 0.2 SECOND, easing = CUBIC_EASING | EASE_OUT)

	return 1

/mob/living/simple_animal/fd/unit/cmpack/aliens/process_damage(amount)
	unit_health -= amount
	var/list/affected = list()
	for(var/mob/living/simple_animal/fd/unit/victim in oview(1,src))
		if(victim.side == side)
			continue
		affected += victim

	var/mob/living/simple_animal/fd/unit/chosen_one = pick(affected)
	new /obj/temporary(get_turf(chosen_one), 3, 'mods/_fd/fd_tbs/icons/status_effects.dmi', "human_acid")
	chosen_one.poison_strenght += 3
	animate(chosen_one, color = COLOR_RED, time = 0.2 SECOND, easing = CUBIC_EASING | EASE_IN)
	spawn(0.3 SECOND)
		animate(chosen_one, color = COLOR_WHITE, time = 0.2 SECOND, easing = CUBIC_EASING | EASE_OUT)

	var/turf/T = get_turf(src)
	for(var/obj/healthbar/health in T)

		var/adjust_one = pixel_x + 2
		var/adjust_two = pixel_x - 4
		var/adjust_three = pixel_x + 2
		animate(health, pixel_x = adjust_one, time = 2, easing = LINEAR_EASING | EASE_IN)
		spawn(2)
			animate(health, pixel_x = adjust_two, time = 2, easing = LINEAR_EASING | EASE_OUT)
		spawn(4)
			animate(health, pixel_x = adjust_three, time = 2, easing = LINEAR_EASING | EASE_IN)

		health.update_icon()

/mob/living/simple_animal/fd/unit/cmpack/aliens/drone
	name = "XX-121"

	icon_state = "Drone"

	unit_health = 3
	healthbar_color = "#7a1d8dff"

	unit_actions_amount = 1

	unit_speed = 12
	unit_move_actions = 2

	has_special = TRUE

	max_plasma = 6
	plasma = 6

	var/list/ability_zone = list()

/mob/living/simple_animal/fd/unit/cmpack/aliens/drone/resolve_special(atom/target)
	if(chosen_special == "Jump")
		if(!(target in ability_zone))
			decline_special()
			return 1
		for(var/turf/inzone in ability_zone)
			var/turf/covered = get_turf(inzone)
			var/obj/tbs_zone/overlay = locate() in covered
			if(overlay)
				qdel(overlay)
		ability_zone.Cut()

		chosen_special = null

		plasma -= 2
		unit_move_actions -= 1
		var/turf/jump_point = get_turf(target)

		animate(src, pixel_z = 16, time = 3, easing = SINE_EASING | EASE_IN)
		animate(pixel_z = src.default_pixel_z, time = 3, easing = SINE_EASING | EASE_OUT)

		src.forceMove(jump_point)
		for(var/mob/living/simple_animal/fd/unit/victim in oview(1,jump_point))
			if(victim == src)
				continue
			victim.process_damage(1)

			new /obj/temporary(get_turf(victim), 3, 'mods/_fd/fd_tbs/icons/attacks.dmi', "slam")
			step_to(victim, get_step(victim, reverse_direction(victim.dir)))
			victim.dir = reverse_direction(victim.dir)

		return 1
	if(chosen_special == "Grab")
		var/mob/living/simple_animal/fd/unit/grabbed = target
		if(!(grabbed in possible_targets))
			decline_special()
			return 1

		for(var/mob/living/simple_animal/fd/unit/targets in possible_targets)
			targets.remove_filter("target")

		new /obj/temporary(get_turf(grabbed), 3, 'mods/_fd/fd_tbs/icons/attacks.dmi', "grab")
		grabbed.unit_move_actions = 0
		possible_targets.Cut()

		chosen_special = null

		plasma -= 2
		unit_actions_amount -= 1

		return 1

/mob/living/simple_animal/fd/unit/cmpack/aliens/drone/decline_special()
	if(chosen_special == "Jump")
		for(var/turf/inzone in ability_zone)
			var/turf/covered = get_turf(inzone)
			var/obj/tbs_zone/overlay = locate() in covered
			if(overlay)
				qdel(overlay)
		ability_zone.Cut()
		return 1
	if(chosen_special == "Grab")
		for(var/mob/living/simple_animal/fd/unit/targets in possible_targets)
			targets.remove_filter("target")
		return 1

/mob/living/simple_animal/fd/unit/cmpack/aliens/drone/specials(mob/user)
	var/mob/living/simple_animal/fd/player/commander = user
	var/list/abilities = list(
		"Jump" = image('mods/_fd/fd_tbs/icons/tbs_ui.dmi', "Ability"),
		"Grab" = image('mods/_fd/fd_tbs/icons/tbs_ui.dmi', "Ability")
	)
	chosen_special = show_radial_menu(commander, src, abilities, radius = 60, require_near = FALSE)
	if (!chosen_special)
		commander.selected.chosen_action = null
		commander.selected = null
		overlays -= image('mods/_fd/fd_tbs/icons/progressicons.dmi', "busy_friendly")
		return 0

	switch(chosen_special)
		if("Jump")
			if(unit_move_actions <= 0) // Прыжок - это движение. Мы можем совершить его вместо дополнительного действия движения!
				chosen_special = null
				commander.selected.chosen_action = null
				commander.selected = null
				overlays -= image('mods/_fd/fd_tbs/icons/progressicons.dmi', "busy_friendly")
				return 0
			if(plasma < 2)
				chosen_special = null
				commander.selected.chosen_action = null
				commander.selected = null
				overlays -= image('mods/_fd/fd_tbs/icons/progressicons.dmi', "busy_friendly")
				return 0
			should_be_used_on = "Turf"
			for(var/turf/inzone in oview(4, src))
				if(inzone.density == TRUE)
					continue
				var/obj/cover = locate() in get_turf(inzone)
				if(cover && cover.density == TRUE)
					continue
				var/mob/living/simple_animal/fd/unit/other = locate() in get_turf(inzone)
				if(other)
					continue
				ability_zone += inzone
				new /obj/tbs_zone(get_turf(inzone))
			return 1
		if("Grab")
			should_be_used_on = "Unit"
			if(unit_actions_amount <= 0)
				chosen_attack = null
				commander.selected.chosen_action = null
				commander.selected = null
				overlays -= image('mods/_fd/fd_tbs/icons/progressicons.dmi', "busy_friendly")
				return 0
			if(plasma < 2)
				chosen_attack = null
				commander.selected.chosen_action = null
				commander.selected = null
				overlays -= image('mods/_fd/fd_tbs/icons/progressicons.dmi', "busy_friendly")
				return 0

			for(var/mob/living/simple_animal/fd/unit/target in oview(1,src))
				if(target.side == side)
					continue
				if(target.unit_move_actions <= 0)
					continue
				if(target.kia)
					continue
				target.add_filter("target", 1, list("type" = "outline", , "size" = 1, "color" = COLOR_RED))
				possible_targets += target

			return 1

	return 0

/mob/living/simple_animal/fd/unit/cmpack/aliens/drone/decline_attack()
	for(var/mob/living/simple_animal/fd/unit/targets in possible_targets)
		targets.remove_filter("target")

/mob/living/simple_animal/fd/unit/cmpack/aliens/drone/resolve_attack()
	if(chosen_attack == "Claws")
		for(var/mob/living/simple_animal/fd/unit/targets in possible_targets)
			targets.remove_filter("target")

		face_atom(actual_target)
		actual_target.process_damage(2)

		animate(actual_target, color = COLOR_RED, time = 0.2 SECOND, easing = CUBIC_EASING | EASE_IN)
		spawn(0.3 SECOND)
			animate(actual_target, color = COLOR_WHITE, time = 0.2 SECOND, easing = CUBIC_EASING | EASE_OUT)

		unit_actions_amount -= 1
		chosen_attack = null

		playsound(src.loc, 'sound/weapons/bite.ogg', 50, 1)
		new /obj/temporary(get_turf(actual_target), 3, 'mods/_fd/fd_tbs/icons/attacks.dmi', "slash")

		spawn(2 SECONDS)
			actual_target = null
		return 1

/mob/living/simple_animal/fd/unit/cmpack/aliens/drone/attack_options(mob/user)
	var/mob/living/simple_animal/fd/player/commander = user
	var/list/attacks = list(
		"Claws" = image('mods/_fd/fd_tbs/icons/tbs_ui.dmi', "Attack")
	)
	chosen_attack = show_radial_menu(commander, src, attacks, radius = 60, require_near = FALSE)
	if (!chosen_attack)
		commander.selected.chosen_action = null
		commander.selected = null
		overlays -= image('mods/_fd/fd_tbs/icons/progressicons.dmi', "busy_hostile")
		return 0

	switch(chosen_attack)
		if("Claws")
			if(unit_actions_amount <= 0)
				chosen_attack = null
				commander.selected.chosen_action = null
				commander.selected = null
				overlays -= image('mods/_fd/fd_tbs/icons/progressicons.dmi', "busy_hostile")
				return 0

			for(var/mob/living/simple_animal/fd/unit/target in oview(1,src))
				if(target.side == side)
					continue
				if(target.kia)
					continue
				target.add_filter("target", 1, list("type" = "outline", , "size" = 1, "color" = COLOR_RED))
				possible_targets += target

			return 1

	return 0
