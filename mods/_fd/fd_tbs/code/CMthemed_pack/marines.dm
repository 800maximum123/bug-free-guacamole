/mob/living/simple_animal/fd/unit/cmpack/marines
	side = "Marines"
	var/max_ammo = 0
	var/ammo = 0 // Боезапас. У фракции морпехов он тратится на применение практически всех атак и способностей.
	// Восстанавливается по единице в начале каждого раунда или рассходниками, если меньше максимального значения.

/mob/living/simple_animal/fd/unit/cmpack/marines/alex_smith
	name = "Alex Smith"

	icon = 'mods/_fd/fd_tbs/icons/tbs_units_marines.dmi'
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

/mob/living/simple_animal/fd/unit/cmpack/marines/alex_smith/resolve_attack()
	if(chosen_attack == "Shotgun Blast")
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

/mob/living/simple_animal/fd/unit/cmpack/marines/alex_smith/attack_options(mob/user) // Индивидуально для каждого юнита, поэтому здесь я оставлю лишь пример того, как данный прок должен выглядеть и работать!
	var/mob/living/simple_animal/fd/player/commander = user
	var/list/attacks = list(
		"Shotgun Blast" = image('mods/_fd/fd_tbs/icons/tbs_ui.dmi', "Attack"),
		"Boot-Punch" = image('mods/_fd/fd_tbs/icons/tbs_ui.dmi', "Attack")
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
				if(target.kia)
					continue
				target.add_filter("target", 1, list("type" = "outline", , "size" = 2, "color" = COLOR_RED))
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
