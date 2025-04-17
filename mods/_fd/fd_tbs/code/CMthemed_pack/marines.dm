/mob/living/simple_animal/fd/unit/cmpack/marines
	side = "Marines"
	icon = 'mods/_fd/fd_tbs/icons/tbs_units_marines.dmi'
	var/max_ammo = 0
	var/ammo = 0 // Боезапас. У фракции морпехов он тратится на применение практически всех атак и способностей.
	// Восстанавливается по единице в начале каждого раунда или рассходниками, если меньше максимального значения.

/mob/living/simple_animal/fd/unit/cmpack/marines/alex_smith
	name = "Alex Smith"
	icon_state = "Alex Smith"

	unit_health = 6
	healthbar_color = "#2eaf07ff"
	has_armor = TRUE

	unit_armor = 2

	unit_actions_amount = 2

	unit_speed = 12
	unit_move_actions = 1

	has_special = TRUE

	max_ammo = 8
	ammo = 8

	var/list/ability_zone = list()

/mob/living/simple_animal/fd/unit/cmpack/marines/alex_smith/get_additional_info()
	var/list/info = list()

	if(chosen_action == "Attack")
		info += FONT_LARGE("Перечень атак: ")
		info += FONT_NORMAL("<br>")
		info += FONT_NORMAL("<li>[SPAN_COLOR("#ececec","Дробный залп")] - Смит эпически вскидывает свой дробовик, \
		разряжая мощное скопление 12-го калибра в лицо врага. Если цель стоит практически в упор - наносит дополнительный урон.<ul>")
		info += FONT_SMALL("<li>COST: 1 [SPAN_COLOR("#ececec","ACTION")], 1 [SPAN_COLOR("#f7d621","AMMO")]</li>")
		info += FONT_SMALL("<li>DIST: [SPAN_COLOR("#f7d621","3")]</li>")
		info += FONT_SMALL("<li>DMG: [SPAN_COLOR("#ff2525","3-5")]</li>")
		info += FONT_SMALL("</ul></li>")
		info += FONT_NORMAL("<br>")
		info += FONT_NORMAL("<li>[SPAN_COLOR("#ececec","Удар ногой")] - Алекс выдаёт стоящим рядом врагам мощную вертушку, \
		отбрасывающую их назад.<ul>")
		info += FONT_SMALL("<li>COST: 1 [SPAN_COLOR("#ececec","ACTION")]</li>")
		info += FONT_SMALL("<li>DIST: [SPAN_COLOR("#f7d621","1")]</li>")
		info += FONT_SMALL("<li>DMG: [SPAN_COLOR("#ff2525","1")]</li>")
		info += FONT_SMALL("</ul></li>")
	if(chosen_action == "Special")
		return
	if(isnull(chosen_action))
		info += FONT_LARGE("Параметры: ")
		info += FONT_NORMAL("<li>[SPAN_COLOR("#ecebeb","[initial(unit_actions_amount)]")] AP</li>")
		info += FONT_NORMAL("<li>[SPAN_COLOR("#76cc5c","[initial(unit_move_actions)]")] MP</li>")
		info += FONT_NORMAL("<br>")
		info += FONT_NORMAL("<li>[SPAN_COLOR("#ff2525","[unit_health]/[initial(unit_health)]")] HEALTH</li>")
		if(has_armor)
			info += FONT_NORMAL("<li>[SPAN_COLOR("#17e7ee","[unit_armor]/[initial(unit_armor)]")] ARMOR</li>")
		info += FONT_NORMAL("<li>[SPAN_COLOR("#f7d621","[initial(unit_speed)]")] SPD</li>")
		info += FONT_NORMAL("<br>")
		info += FONT_LARGE("Особое: ")
		info += FONT_NORMAL("<li>[SPAN_COLOR("#f7d621","[ammo]/[max_ammo]")] AMMO</li>")
		info += FONT_NORMAL("<br>")
		info += FONT_LARGE("История: ")
		info += FONT_NORMAL("<li>[SPAN_COLOR("#eeeeee","Смит")] - специалист во всём, что касается лени. Если ему нужно решить некую проблему - куда вероятнее то, \
		что он соберёт для этого робота, что сделает всю работу за него. Его любимое оружие - это [SPAN_COLOR("#eeeeee","М37 Итака")], \
		а лучшие друзья - [SPAN_COLOR("#eeeeee","пиво")] и [SPAN_COLOR("#eeeeee","гитара")].</li>")

	return jointext(info, "")

/mob/living/simple_animal/fd/unit/cmpack/marines/alex_smith/resolve_special(atom/target) // Индивидуально для каждого юнита
	if(chosen_special == "Place Sentry")
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

		ammo -= 4
		unit_actions_amount -= 1
		new /mob/living/simple_animal/fd/unit/cmpack/marines/sentry(get_turf(target))
		return 1
	if(chosen_special == "Repair Armor")
		var/mob/living/simple_animal/fd/unit/damaged = target
		if(!(damaged in possible_targets))
			decline_special()
			return 1

		for(var/mob/living/simple_animal/fd/unit/targets in possible_targets)
			targets.remove_filter("target")

		damaged.repair_armor(2)
		possible_targets.Cut()

		chosen_special = null

		ammo -= 2
		unit_actions_amount -= 1
		return 1


/mob/living/simple_animal/fd/unit/cmpack/marines/alex_smith/decline_special()
	if(chosen_special == "Place Sentry")
		for(var/turf/inzone in ability_zone)
			var/turf/covered = get_turf(inzone)
			var/obj/tbs_zone/overlay = locate() in covered
			if(overlay)
				qdel(overlay)
		ability_zone.Cut()
		return 1
	if(chosen_special == "Repair Armor")
		for(var/mob/living/simple_animal/fd/unit/targets in possible_targets)
			targets.remove_filter("target")
		return 1

/mob/living/simple_animal/fd/unit/cmpack/marines/alex_smith/decline_attack()
	for(var/mob/living/simple_animal/fd/unit/targets in possible_targets)
		targets.remove_filter("target")

/mob/living/simple_animal/fd/unit/cmpack/marines/alex_smith/resolve_attack()
	if(chosen_attack == "Shotgun Blast")
		for(var/mob/living/simple_animal/fd/unit/targets in possible_targets)
			targets.remove_filter("target")
		face_atom(actual_target)
		ISay("Получай!")

		if(get_dist(actual_target, src) < 2)
			actual_target.process_damage(5)
		else
			actual_target.process_damage(3)

		animate(actual_target, color = COLOR_RED, time = 0.2 SECOND, easing = CUBIC_EASING | EASE_IN)
		spawn(0.3 SECOND)
			animate(actual_target, color = COLOR_WHITE, time = 0.2 SECOND, easing = CUBIC_EASING | EASE_OUT)

		unit_actions_amount -= 1
		ammo -= 1

		chosen_attack = null

		playsound(src.loc, 'sound/weapons/gunshot/shotgun.ogg', 20, 1)
		playsound(src.loc, 'sound/weapons/guns/shotgun_fall.ogg', 40, 1)

		spawn(1 SECOND)
			playsound(src.loc, 'packs/infinity/sound/weapons/guns/interact/gun_cock.ogg', 20, 1)

		spawn(2 SECONDS)
			actual_target = null
		return 1

/mob/living/simple_animal/fd/unit/cmpack/marines/alex_smith/attack_options(mob/user)
	var/mob/living/simple_animal/fd/player/commander = user
	var/list/attacks = list(
		"Shotgun Blast" = image('mods/_fd/fd_tbs/icons/tbs_units_marines.dmi', "Alex Shotgun"),
		"Boot-Punch" = image('mods/_fd/fd_tbs/icons/tbs_units_marines.dmi', "Alex Punch")
	)
	chosen_attack = show_radial_menu(commander, src, attacks, radius = 60, require_near = FALSE)
	if (!chosen_attack)
		commander.selected.chosen_action = null
		commander.selected = null
		overlays -= image('mods/_fd/fd_tbs/icons/progressicons.dmi', "busy_hostile")
		return 0

	switch(chosen_attack)
		if("Shotgun Blast")
			if(unit_actions_amount <= 0)
				chosen_attack = null
				commander.selected.chosen_action = null
				commander.selected = null
				overlays -= image('mods/_fd/fd_tbs/icons/progressicons.dmi', "busy_hostile")
				return 0
			if(ammo <= 0)
				chosen_attack = null
				commander.selected.chosen_action = null
				commander.selected = null
				overlays -= image('mods/_fd/fd_tbs/icons/progressicons.dmi', "busy_hostile")
				return 0

			ISay("У меня на всех хватит!")

			for(var/mob/living/simple_animal/fd/unit/target in oview(3,src))
				if(target.side == side)
					continue
				if(target.side in friends_list)
					continue
				if(target.kia)
					continue
				target.add_filter("target", 1, list("type" = "outline", , "size" = 1, "color" = COLOR_RED))
				possible_targets += target

			return 1
		if("Boot-Punch")
			if(unit_actions_amount <= 0)
				chosen_attack = null
				commander.selected.chosen_action = null
				commander.selected = null
				overlays -= image('mods/_fd/fd_tbs/icons/progressicons.dmi', "busy_hostile")
				return 0

			var/question = alert(user, "Вас устраивает выбранное действие?", "Подтверждение", "Да", "Нет")
			switch(question)
				if("Да")
					ISay("Пошли...")

					dir = turn(SOUTH,0)
					spawn(2)
						dir = turn(WEST, 0)
					spawn(3)
						dir = turn(NORTH, 0)
					spawn(4)
						dir = turn(EAST, 0)
					spawn(5)
						dir = turn(SOUTH,0)

					playsound(src.loc, 'sound/weapons/pushhiss.ogg', 50, 1)

					for(var/mob/living/simple_animal/fd/unit/target in oview(1,src))

						target.process_damage(1)

						new /obj/temporary(get_turf(target), 3, 'mods/_fd/fd_tbs/icons/attacks.dmi', "punch")
						step_to(target, get_step(target, reverse_direction(target.dir)))
						target.dir = reverse_direction(target.dir)

					unit_actions_amount -= 1
					spawn(1 SECOND)
						ISay("...нахер!")

					chosen_attack = null
					commander.selected.chosen_action = null
					commander.selected = null
					overlays -= image('mods/_fd/fd_tbs/icons/progressicons.dmi', "busy_hostile")
					return 1
				else
					chosen_attack = null
					commander.selected.chosen_action = null
					commander.selected = null
					overlays -= image('mods/_fd/fd_tbs/icons/progressicons.dmi', "busy_hostile")
					return 1

	return 0

/mob/living/simple_animal/fd/unit/cmpack/marines/alex_smith/specials(mob/user)
	var/mob/living/simple_animal/fd/player/commander = user
	var/list/abilities = list(
		"Place Sentry" = image('mods/_fd/fd_tbs/icons/tbs_units_marines.dmi', "Alex Sentry"),
		"Repair Armor" = image('mods/_fd/fd_tbs/icons/tbs_units_marines.dmi', "Alex Repair")
	)
	chosen_special = show_radial_menu(commander, src, abilities, radius = 60, require_near = FALSE)
	if (!chosen_special)
		commander.selected.chosen_action = null
		commander.selected = null
		overlays -= image('mods/_fd/fd_tbs/icons/progressicons.dmi', "busy_friendly")
		return 0

	switch(chosen_special)
		if("Place Sentry")
			if(unit_actions_amount <= 0)
				chosen_special = null
				commander.selected.chosen_action = null
				commander.selected = null
				overlays -= image('mods/_fd/fd_tbs/icons/progressicons.dmi', "busy_friendly")
				return 0
			if(ammo < 4)
				chosen_special = null
				commander.selected.chosen_action = null
				commander.selected = null
				overlays -= image('mods/_fd/fd_tbs/icons/progressicons.dmi', "busy_friendly")
				return 0
			should_be_used_on = "Turf"
			for(var/turf/inzone in oview(1, src))
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
		if("Repair Armor")
			should_be_used_on = "Unit"
			if(unit_actions_amount <= 0)
				chosen_attack = null
				commander.selected.chosen_action = null
				commander.selected = null
				overlays -= image('mods/_fd/fd_tbs/icons/progressicons.dmi', "busy_friendly")
				return 0
			if(ammo < 2)
				chosen_attack = null
				commander.selected.chosen_action = null
				commander.selected = null
				overlays -= image('mods/_fd/fd_tbs/icons/progressicons.dmi', "busy_friendly")
				return 0

			ISay("Синяя изолента всё исправит...")

			for(var/mob/living/simple_animal/fd/unit/target in oview(1,src))
				if(target.side != side && !(target.side in friends_list))
					continue
				if(target.has_armor == FALSE)
					continue
				if(target.kia)
					continue
				target.add_filter("target", 1, list("type" = "outline", , "size" = 1, "color" = COLOR_BLUE))
				possible_targets += target

			return 1

	return 0

/mob/living/simple_animal/fd/unit/cmpack/marines/sentry
	name = "Sentry Gun"
	icon_state = "Sentry"

	unit_health = 2
	healthbar_color = "#2eaf07ff"
	has_armor = TRUE

	unit_armor = 8

	unit_actions_amount = 1

	unit_speed = 0
	unit_move_actions = 0

	max_ammo = 12
	ammo = 12

/mob/living/simple_animal/fd/unit/cmpack/marines/sentry/attack_options(mob/user)
	var/mob/living/simple_animal/fd/player/commander = user
	var/list/attacks = list(
		"Shoot" = image('mods/_fd/fd_tbs/icons/tbs_units_marines.dmi', "Sentry Fire")
	)
	chosen_attack = show_radial_menu(commander, src, attacks, radius = 60, require_near = FALSE)
	if (!chosen_attack)
		commander.selected.chosen_action = null
		commander.selected = null
		overlays -= image('mods/_fd/fd_tbs/icons/progressicons.dmi', "busy_hostile")
		return 0

	switch(chosen_attack)
		if("Shoot")
			if(unit_actions_amount <= 0)
				chosen_attack = null
				commander.selected.chosen_action = null
				commander.selected = null
				overlays -= image('mods/_fd/fd_tbs/icons/progressicons.dmi', "busy_hostile")
				return 0
			if(ammo <= 0)
				chosen_attack = null
				commander.selected.chosen_action = null
				commander.selected = null
				overlays -= image('mods/_fd/fd_tbs/icons/progressicons.dmi', "busy_hostile")
				return 0

			var/question = alert(user, "Вас устраивает выбранное действие?", "Подтверждение", "Да", "Нет")
			switch(question)
				if("Да")

					for(var/mob/living/simple_animal/fd/unit/target in oview(6,src))
						if(target.side == side)
							continue
						if(target.side in friends_list)
							continue
						if(target.kia)
							continue
						possible_targets += target
					ISay("ЦЕЛЬ. ОБНАРУЖЕНА.")
					unit_actions_amount -= 1

					overlays -= image('mods/_fd/fd_tbs/icons/progressicons.dmi', "busy_hostile")
					spawn(1 SECOND)
						var/mob/living/simple_animal/fd/unit/victim = pick(possible_targets)
						ISay("ПРИСТУПИТЬ. К. ЛИКВИДАЦИИ.")
						face_atom(victim)
						victim.process_damage(2)
						possible_targets -= victim
						ammo -= 1

						playsound(src.loc, 'sound/weapons/gunshot/gunshot_smg.ogg', 20, 1)
						new /obj/temporary(get_turf(src), 3, 'mods/_fd/fd_tbs/icons/progressicons.dmi', "busy_danger")

						animate(victim, color = COLOR_RED, time = 0.2 SECOND, easing = CUBIC_EASING | EASE_IN)
						spawn(0.3 SECOND)
							animate(victim, color = COLOR_WHITE, time = 0.2 SECOND, easing = CUBIC_EASING | EASE_OUT)
					if(ammo > 0)
						spawn(2 SECOND)
							var/mob/living/simple_animal/fd/unit/victim = pick(possible_targets)
							face_atom(victim)
							victim.process_damage(2)
							possible_targets -= victim
							ammo -= 1

							playsound(src.loc, 'sound/weapons/gunshot/gunshot_smg.ogg', 20, 1)
							new /obj/temporary(get_turf(src), 3, 'mods/_fd/fd_tbs/icons/progressicons.dmi', "busy_danger")

							animate(victim, color = COLOR_RED, time = 0.2 SECOND, easing = CUBIC_EASING | EASE_IN)
							spawn(0.3 SECOND)
								animate(victim, color = COLOR_WHITE, time = 0.2 SECOND, easing = CUBIC_EASING | EASE_OUT)
					if(ammo > 0)
						spawn(3 SECOND)
							var/mob/living/simple_animal/fd/unit/victim = pick(possible_targets)
							face_atom(victim)
							victim.process_damage(2)
							possible_targets -= victim
							ammo -= 1

							playsound(src.loc, 'sound/weapons/gunshot/gunshot_smg.ogg', 20, 1)
							new /obj/temporary(get_turf(src), 3, 'mods/_fd/fd_tbs/icons/progressicons.dmi', "busy_danger")

							animate(victim, color = COLOR_RED, time = 0.2 SECOND, easing = CUBIC_EASING | EASE_IN)
							spawn(0.3 SECOND)
								animate(victim, color = COLOR_WHITE, time = 0.2 SECOND, easing = CUBIC_EASING | EASE_OUT)

					if(ammo <= 0)
						ISay("БОЕЗАПАС. ПУСТ.")

					chosen_attack = null
					commander.selected.chosen_action = null
					commander.selected = null
					spawn(5 SECONDS)
						possible_targets.Cut()
					return 1
				else
					chosen_attack = null
					commander.selected.chosen_action = null
					commander.selected = null
					overlays -= image('mods/_fd/fd_tbs/icons/progressicons.dmi', "busy_hostile")
					return 1
	return 0

/mob/living/simple_animal/fd/unit/cmpack/marines/sentry/AltClick(mob/user)
	var/mob/living/simple_animal/fd/player/commander = user
	if(commander.side != side)
		return 0
	if(!commander.active_turn)
		return 0
	if(kia)
		return 0

	var/list/unit_actions = list(
		"Attack" = image('mods/_fd/fd_tbs/icons/tbs_ui.dmi', "Attack")
	)

	chosen_action = show_radial_menu(commander, src, unit_actions, radius = 60, require_near = FALSE)
	if (!chosen_action)
		return 0

	switch(chosen_action)
		if("Attack")
			commander.selected = src
			overlays += image('mods/_fd/fd_tbs/icons/progressicons.dmi', "busy_hostile")
			attack_options(commander)
			return 1
