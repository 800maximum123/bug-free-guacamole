/mob/living/simple_animal/fd/unit/psi
	side = "Meta-Users"
	icon = 'mods/_fd/_maps/new_year_house/icons/psi_trailer.dmi'
	var/psi_limit = 12
	var/psi_overcharge = 8
	var/psi_current = 0

	var/overcharged = FALSE
	var/drawback = FALSE
	var/drawback_period = 2

/mob/living/simple_animal/fd/unit/psi/Life()
	. = ..()

	if(psi_current >= 8 && !overcharged)
		overcharged = TRUE
		poison_strenght += 4

	if(overcharged && psi_current < 8)
		overcharged = FALSE

	if(psi_current == psi_limit && !drawback)
		drawback = TRUE
		armor_block(unit_armor)

	if(drawback && drawback_period <= 0)
		drawback = FALSE
		drawback_period = 2
		repair_armor(initial(unit_armor))

/mob/living/simple_animal/fd/unit/psi/ardent
	name = "Ardent Mayer"
	desc = "Ardent Mayer"

	icon_state = "ardent_combat"

	unit_health = 6
	healthbar_color = "#cc5c00ff"
	side = "Ardent"

	has_armor = TRUE
	unit_armor = 4

	friends_list = list("Okita","Mara")
	unit_actions_amount = 2

	unit_speed = 12
	unit_move_actions = 2

	has_special = TRUE

// АБИЛКИ АРДЕНТА

/mob/living/simple_animal/fd/unit/psi/ardent/resolve_special()
	return

/mob/living/simple_animal/fd/unit/psi/ardent/decline_special()
	return

/mob/living/simple_animal/fd/unit/psi/ardent/specials(mob/user)
	var/mob/living/simple_animal/fd/player/commander = user
	var/list/abilities = list(
		"Electric Chain" = image('mods/_fd/fd_tbs/icons/tbs_ui.dmi', "Ability"),
		"Wall of Fire" = image('mods/_fd/fd_tbs/icons/tbs_ui.dmi', "Ability"),
		"Fist of Flames" = image('mods/_fd/fd_tbs/icons/tbs_ui.dmi', "Ability"),
		"Burning Jets" = image('mods/_fd/fd_tbs/icons/tbs_ui.dmi', "Ability")
	)
	chosen_special = show_radial_menu(commander, src, abilities, radius = 60, require_near = FALSE)
	if (!chosen_special)
		return 0

	switch(chosen_special)
		if("Ability 1")
			return 1
		if("Ability 2")
			return 1

	return 0

// АБИЛКИ АРДЕНТА

// АТАКИ АРДЕНТА

/mob/living/simple_animal/fd/unit/psi/ardent/decline_attack() // Индивидуально для каждого юнита
	for(var/mob/living/simple_animal/fd/unit/targets in possible_targets)
		targets.remove_filter("target")

/mob/living/simple_animal/fd/unit/psi/ardent/resolve_attack() // Индивидуально для каждого юнита
	if(chosen_attack == "Crushing Headbutt")
		for(var/mob/living/simple_animal/fd/unit/targets in possible_targets)
			targets.remove_filter("target")
		face_atom(actual_target)

		actual_target.process_damage(2)
		process_damage(1) // Мы бьём его собственным лбом, так что резонно, что нам тоже будет не очень приятно

		new /obj/temporary(get_turf(actual_target), 3, 'mods/_fd/fd_tbs/icons/attacks.dmi', "punch")
		new /obj/temporary(get_turf(src), 3, 'mods/_fd/fd_tbs/icons/attacks.dmi', "punch")

		animate(actual_target, color = COLOR_RED, time = 0.2 SECOND, easing = CUBIC_EASING | EASE_IN)
		animate(src, color = COLOR_RED, time = 0.2 SECOND, easing = CUBIC_EASING | EASE_IN)
		spawn(0.3 SECOND)
			animate(actual_target, color = COLOR_WHITE, time = 0.2 SECOND, easing = CUBIC_EASING | EASE_OUT)
			animate(src, color = COLOR_WHITE, time = 0.2 SECOND, easing = CUBIC_EASING | EASE_OUT)

		unit_actions_amount -= 1
		actual_target.unit_move_actions = 0 // Нас оглушили. Теперь мы точно не побегаем до конца раунда

		chosen_attack = null

		playsound(src.loc, 'sound/weapons/punch1.ogg', 20, 1)

		spawn(2 SECONDS)
			actual_target = null
		return 1

	if(chosen_attack == "Throw-Boot")
		face_atom(actual_target)

		var/list/targets_list = list()
		var/turf/targ_turf = get_turf(actual_target)
		var/list/turfs_search = list(targ_turf)
		var/attack_dir = get_dir(src,targ_turf)
		turfs_search += list( get_step(targ_turf,turn(attack_dir,90)),get_step(targ_turf,turn(attack_dir,-90)) )
		for(var/turf/search in turfs_search)
			new /obj/tbs_zone(get_turf(search))
			for(var/mob/living/simple_animal/fd/unit/U in search.contents)
				targets_list += U

		spawn(2 SECONDS)
			for(var/mob/living/simple_animal/fd/unit/U in targets_list)
				var/throw_dir = get_dir(src, U)

				new /obj/temporary(get_turf(U), 3, 'mods/_fd/fd_tbs/icons/attacks.dmi', "punch")
				U.process_damage(1)
				U.throw_at(get_edge_target_turf(U, throw_dir),1,4,src)

				animate(actual_target, color = COLOR_RED, time = 0.2 SECOND, easing = CUBIC_EASING | EASE_IN)
				spawn(0.3 SECOND)
					animate(actual_target, color = COLOR_WHITE, time = 0.2 SECOND, easing = CUBIC_EASING | EASE_OUT)

		spawn(3 SECONDS)
			for(var/mob/living/simple_animal/fd/unit/targets in targets_list)
				targets.remove_filter("target")
			for(var/turf/inzone in turfs_search)
				var/turf/covered = get_turf(inzone)
				var/obj/tbs_zone/overlay = locate() in covered
				if(overlay)
					qdel(overlay)
			turfs_search.Cut()
			targets_list.Cut()

		unit_actions_amount -= 1
		actual_target.unit_move_actions = 0 // Нас оглушили. Теперь мы точно не побегаем до конца раунда

		chosen_attack = null

		playsound(src.loc, 'sound/weapons/punch1.ogg', 20, 1)

		spawn(5 SECONDS)
			actual_target = null
		return 1

	if(chosen_attack == "Three Punches")
		for(var/mob/living/simple_animal/fd/unit/targets in possible_targets)
			targets.remove_filter("target")
		face_atom(actual_target)

		actual_target.process_damage(1)
		new /obj/temporary(get_turf(actual_target), 3, 'mods/_fd/fd_tbs/icons/attacks.dmi', "punch")

		var/throw_dir = get_dir(src, actual_target)

		actual_target.throw_at(get_edge_target_turf(actual_target, throw_dir),1,4,src)
		actual_target.face_atom(src)

		animate(actual_target, color = COLOR_RED, time = 0.2 SECOND, easing = CUBIC_EASING | EASE_IN)
		spawn(0.3 SECOND)
			animate(actual_target, color = COLOR_WHITE, time = 0.2 SECOND, easing = CUBIC_EASING | EASE_OUT)

		spawn(1 SECOND)
			walk_to(src, actual_target, 0, 3)

		spawn(2 SECONDS)
			actual_target.process_damage(1)
			new /obj/temporary(get_turf(actual_target), 3, 'mods/_fd/fd_tbs/icons/attacks.dmi', "punch")

			actual_target.throw_at(get_edge_target_turf(actual_target, throw_dir),1,4,src)
			actual_target.face_atom(src)

			animate(actual_target, color = COLOR_RED, time = 0.2 SECOND, easing = CUBIC_EASING | EASE_IN)
			spawn(0.3 SECOND)
				animate(actual_target, color = COLOR_WHITE, time = 0.2 SECOND, easing = CUBIC_EASING | EASE_OUT)

			spawn(1 SECOND)
				walk_to(src, actual_target, 0, 3)

		spawn(4 SECONDS)
			actual_target.process_damage(1)
			new /obj/temporary(get_turf(actual_target), 3, 'mods/_fd/fd_tbs/icons/attacks.dmi', "punch")

			actual_target.throw_at(get_edge_target_turf(actual_target, throw_dir),1,4,src)
			actual_target.face_atom(src)

			animate(actual_target, color = COLOR_RED, time = 0.2 SECOND, easing = CUBIC_EASING | EASE_IN)
			spawn(0.3 SECOND)
				animate(actual_target, color = COLOR_WHITE, time = 0.2 SECOND, easing = CUBIC_EASING | EASE_OUT)

			spawn(1 SECOND)
				walk_to(src, actual_target, 0, 3)

		unit_actions_amount -= 1

		chosen_attack = null

		playsound(src.loc, 'sound/weapons/punch1.ogg', 20, 1)

		spawn(5 SECONDS)
			actual_target = null
		return 1

/mob/living/simple_animal/fd/unit/psi/ardent/attack_options(mob/user) // Индивидуально для каждого юнита, поэтому здесь я оставлю лишь пример того, как данный прок должен выглядеть и работать!
	var/mob/living/simple_animal/fd/player/commander = user
	var/list/attacks = list(
		"Crushing Headbutt" = image('mods/_fd/fd_tbs/icons/tbs_ui.dmi', "Attack"),
		"Throw-Boot" = image('mods/_fd/fd_tbs/icons/tbs_ui.dmi', "Attack"),
		"Three Punches" = image('mods/_fd/fd_tbs/icons/tbs_ui.dmi', "Attack")
	)
	chosen_attack = show_radial_menu(commander, src, attacks, radius = 60, require_near = FALSE)
	if (!chosen_attack)
		commander.selected.chosen_action = null
		commander.selected = null
		overlays -= image('mods/_fd/fd_tbs/icons/progressicons.dmi', "busy_hostile")
		return 0

	switch(chosen_attack)
		if("Crushing Headbutt")
			if(unit_actions_amount <= 0)
				chosen_attack = null
				commander.selected.chosen_action = null
				commander.selected = null
				overlays -= image('mods/_fd/fd_tbs/icons/progressicons.dmi', "busy_hostile")
				return 0

			for(var/mob/living/simple_animal/fd/unit/target in oview(1,src))
				if(target.side == side)
					continue
				if(target.side in friends_list)
					continue
				if(target.kia)
					continue
				target.add_filter("target", 1, list("type" = "outline", , "size" = 1, "color" = COLOR_RED))
				possible_targets += target

			return 1
		if("Throw-Boot")
			if(unit_actions_amount <= 0)
				chosen_attack = null
				commander.selected.chosen_action = null
				commander.selected = null
				overlays -= image('mods/_fd/fd_tbs/icons/progressicons.dmi', "busy_hostile")
				return 0

			for(var/mob/living/simple_animal/fd/unit/target in oview(1,src))
				if(target.side == side)
					continue
				if(target.side in friends_list)
					continue
				if(target.kia)
					continue
				target.add_filter("target", 1, list("type" = "outline", , "size" = 1, "color" = COLOR_RED))
				possible_targets += target

			return 1
		if("Three Punches")
			if(unit_actions_amount <= 0)
				chosen_attack = null
				commander.selected.chosen_action = null
				commander.selected = null
				overlays -= image('mods/_fd/fd_tbs/icons/progressicons.dmi', "busy_hostile")
				return 0

			for(var/mob/living/simple_animal/fd/unit/target in oview(1,src))
				if(target.side == side)
					continue
				if(target.side in friends_list)
					continue
				if(target.kia)
					continue
				target.add_filter("target", 1, list("type" = "outline", , "size" = 1, "color" = COLOR_RED))
				possible_targets += target

			return 1

	return 0

// АТАКИ АРДЕНТА
