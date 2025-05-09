/mob/living/simple_animal/fd/unit/cmpack/marines/rifleman
	name = "Rifleman"
	desc = "Rifleman"

	icon_state = "Alex Smith"

	unit_health = 6
	has_armor = TRUE
	unit_armor = 2

	unit_actions_amount = 2

	unit_speed = 12
	unit_move_actions = 1

	has_special = TRUE

	max_ammo = 20
	ammo = 20

/mob/living/simple_animal/fd/unit/cmpack/marines/rifleman/get_additional_info()
	var/list/info = list()

	if(chosen_action == "Attack")
		return
	if(chosen_action == "Special")
		return
	else
		info += FONT_LARGE("Параметры: ")
		info += FONT_NORMAL("<li>[SPAN_COLOR("#ecebeb","[initial(unit_actions_amount)]")] AP</li>")
		info += FONT_NORMAL("<li>[SPAN_COLOR("#76cc5c","[initial(unit_move_actions)]")] MP</li>")
		info += FONT_NORMAL("<br>")
		info += FONT_NORMAL("<li>[SPAN_COLOR("#ff2525","[unit_health]/[initial(unit_health)]")] HEALTH</li>")
		if(has_armor)
			info += FONT_NORMAL("<li>[SPAN_COLOR("#17e7ee","[unit_armor]/[initial(unit_armor)]")] ARMOR</li>")
		info += FONT_NORMAL("<li>[SPAN_COLOR("#f7d621","[initial(unit_speed)]")] SPD</li>")

		info += FONT_LARGE("История: ")
		info += FONT_NORMAL("Никому неинтересна!")

	return jointext(info, "")

/mob/living/simple_animal/fd/unit/cmpack/marines/rifleman/special_death()
	return

/mob/living/simple_animal/fd/unit/cmpack/marines/rifleman/resolve_special()
	return

/mob/living/simple_animal/fd/unit/cmpack/marines/rifleman/decline_special()
	return

/mob/living/simple_animal/fd/unit/cmpack/marines/rifleman/specials(mob/user)
	var/mob/living/simple_animal/fd/player/commander = user
	var/list/abilities = list(
		"Grenade Throw" = image('mods/_fd/fd_tbs/icons/tbs_ui.dmi', "Ability"), // АоЕ. Жрёт много припасов
		"Combat Stance" = image('mods/_fd/fd_tbs/icons/tbs_ui.dmi', "Ability") // Больше урона и защиты, но лишь при том условии что юнит не двигался в этом раунде
	)
	chosen_special = show_radial_menu(commander, src, abilities, radius = 60, require_near = FALSE)
	if (!chosen_special)
		return 0

	switch(chosen_special)
		if("Grenade Throw")
			return 1
		if("Combat Stance")
			return 1

	return 0

/mob/living/simple_animal/fd/unit/cmpack/marines/rifleman/decline_attack()
	return

/mob/living/simple_animal/fd/unit/cmpack/marines/rifleman/resolve_attack()
	return

/mob/living/simple_animal/fd/unit/cmpack/marines/rifleman/attack_options(mob/user)
	var/mob/living/simple_animal/fd/player/commander = user
	var/list/attacks = list(
		"Rifle Burst" = image('mods/_fd/fd_tbs/icons/tbs_ui.dmi', "Attack"), // Стандартная очередь винтовки. Должна гарантированно убивать обычного дрона
		"Combat Bump" = image('mods/_fd/fd_tbs/icons/tbs_ui.dmi', "Attack") // Бесплатное мили
	)
	chosen_attack = show_radial_menu(commander, src, attacks, radius = 60, require_near = FALSE)
	if (!chosen_attack)
		return 0

	switch(chosen_attack)
		if("Rifle Burst")
			return 1
		if("Combat Bump")
			return 1

	return 0
