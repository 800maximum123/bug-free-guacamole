/obj/healthbar
	mouse_opacity = FALSE
	icon = 'mods/_fd/fd_tbs/icons/tbs_ui.dmi'
	icon_state = "health_3"
	pixel_y = 15
	var/mob/living/simple_animal/fd/unit/linked_character

	layer = HUD_ABOVE_HUD_LAYER

/obj/healthbar/Initialize()
	. = ..()
	if(linked_character == null)
		var/turf/T = get_turf(src)
		for(var/mob/living/simple_animal/fd/unit/U in T)
			linked_character = U
		if(linked_character == null)
			qdel(src)
	icon_state = "health_[linked_character.unit_health]"
	color = linked_character.healthbar_color
	START_PROCESSING(SSobj, src)

/obj/healthbar/Process()
	if(!linked_character)
		qdel(src)
		return

	if(linked_character.unit_health == 0)
		update_icon()

	src.forceMove(linked_character.loc)

/obj/healthbar/on_update_icon()
	pixel_y = 15
	icon_state = "health_[linked_character.unit_health]"

/obj/armorbar
	mouse_opacity = FALSE
	icon = 'mods/_fd/fd_tbs/icons/tbs_ui.dmi'
	icon_state = "armor_1"
	pixel_x = 32
	var/mob/living/simple_animal/fd/unit/linked_character

	layer = HUD_ABOVE_HUD_LAYER

/obj/armorbar/Initialize()
	. = ..()
	if(linked_character == null)
		var/turf/T = get_turf(src)
		for(var/mob/living/simple_animal/fd/unit/U in T)
			linked_character = U
		if(linked_character == null)
			qdel(src)
	icon_state = "armor_[linked_character.unit_armor]"
	START_PROCESSING(SSobj, src)

/obj/armorbar/Process()
	if(!linked_character)
		qdel(src)
		return

	if(linked_character.unit_armor == 0)
		update_icon()

	src.forceMove(linked_character.loc)

/obj/armorbar/on_update_icon()
	pixel_x = 32
	icon_state = "armor_[linked_character.unit_armor]"

/mob/living/simple_animal/fd/walk_simulation
	mouse_opacity = FALSE
	var/turf/endgoal // Конечный турф, к которому мы должны прийти
	var/mob/living/simple_animal/fd/unit/owner // Тот, от кого мы начинаем наш путь
	var/owner_speed = 0

/mob/living/simple_animal/fd/walk_simulation/Crossed(atom/movable/movable)
	..()

/mob/living/simple_animal/fd/walk_simulation/Move()
	if(owner_speed <= 0)
		return 0

	owner_speed -= 1
	. = ..()

/mob/living/simple_animal/fd/walk_simulation/proc/return_to_sender()
	spawn(2 SECONDS)
		forceMove(get_turf(owner))
		owner_speed = owner.unit_speed
		walk_to(src, endgoal, 0, 3)

/mob/living/simple_animal/fd/walk_simulation/Life()
	. = ..()
	var/turf/current_loc = get_turf(src)
	if(owner_speed <= 0 || current_loc == endgoal)
		endgoal = get_turf(src)
		return_to_sender()

/mob/living/simple_animal/fd/unit
	name = "unit mob"
	desc = "unit mob"

	icon = 'mods/_fd/fd_tbs/icons/hardsuit_token.dmi'
	icon_state = "hardsuit_token"

	movement_handlers = list(/datum/movement_handler/delay = list(2))
	anchored = TRUE

	var/kia = FALSE // Юнит вообще жив?
	var/poisoned = FALSE // Таймед дамаг
	var/poison_strenght = 0 // Длительность отравления

	var/unit_health = 3 // 3 - базовое значение для большинства. 10 - возможный максимум
	// Армор - это НЕ дополнительное ХП. При попадании по юниту - он снижает входящий урон на указанное число, затем уменьшаясь на один.
	// Если армор и урон будут равны единице - урон полностью аннулируется, значение армора опускается к нулю.
	// Если армор равен трём, а урон двум - юнит не получит урона и его значение армора уменьшится на один
	var/has_armor = FALSE // У нас броня в принципе существует???
	var/armor_broken = FALSE // Сломана ли наша броня?
	var/unit_armor = 0
	var/healthbar_color = "#ffffffff"

	var/side // Фракция
	var/list/friends_list = list() // Список фракций, которые можно считать дружественными и применять на них положительные абилки
	var/chosen_action // Выбранное действие
	var/chosen_attack // Если мы атакуем, то чем?
	var/unit_actions_amount = 1 // Количество действий(помимо движения), которое игрок может совершить этим юнитом за ход

	var/unit_speed = 6 // Как далеко этот юнит может ходить
	var/unit_move_actions = 1 // У большинства юнитов лишь одно действие мувмента на ход

	var/has_special = FALSE // Есть ли у нашего юнита особые умения?
	var/chosen_special
	var/should_be_used_on = "Nothing"

	var/list/possible_targets = list()
	var/mob/living/simple_animal/fd/unit/actual_target

/mob/living/simple_animal/fd/unit/proc/get_additional_info() // Полностью оверрайдим на юните
	var/list/info = list()

	if(chosen_action == "Attack") // Если мы собираемся чистить кому-то рожу - нам нужна информация об атаках
		return
	if(chosen_action == "Special") // Если мы хотим сделать что-то необычное, нам нужна информация об способностях
		return
	else // А иначе - выводим базовую информацию
		info += FONT_LARGE("Параметры: ")
		info += FONT_NORMAL("<li>[SPAN_COLOR("#ecebeb","[initial(unit_actions_amount)]")] AP</li>")
		info += FONT_NORMAL("<li>[SPAN_COLOR("#76cc5c","[initial(unit_move_actions)]")] MP</li>")
		info += FONT_NORMAL("<br>")
		info += FONT_NORMAL("<li>[SPAN_COLOR("#ff2525","[unit_health]/[initial(unit_health)]")] HEALTH</li>")
		if(has_armor)
			info += FONT_NORMAL("<li>[SPAN_COLOR("#17e7ee","[unit_armor]/[initial(unit_armor)]")] ARMOR</li>")
		info += FONT_NORMAL("<li>[SPAN_COLOR("#f7d621","[initial(unit_speed)]")] SPD</li>")

		// Тут все наши основные статы ^

		info += FONT_LARGE("История: ")
		info += FONT_NORMAL("Никому неинтересна!") // Сюда индивидуально можете вписывать ваши плаксивые истории и лор-факты

	return jointext(info, "")

// Нагло спизженно из ИИ-шипов
/mob/living/simple_animal/fd/unit/MouseEntered(location, control, params)
	var/tooltip_text = get_additional_info()
	openToolTip(user = usr, tip_src = src, params = params, title = name, content = tooltip_text)

/mob/living/simple_animal/fd/unit/proc/special_death() // Индивидуально для каждого юнита
	return

/mob/living/simple_animal/fd/unit/Life()
	. = ..()

	if(unit_actions_amount <= 0 && unit_move_actions <= 0)
		for(var/mob/living/simple_animal/fd/player/commander in world)
			if(commander.side == side)
				commander.unit_used += src

	if(unit_health < 0)
		unit_health = 0
		var/turf/T = get_turf(src)
		for(var/obj/healthbar/health in T)
			health.update_icon()

	if(unit_armor < 0)
		unit_armor = 0
		var/turf/T = get_turf(src)
		for(var/obj/armorbar/armor in T)
			armor.update_icon()

	if(unit_health <= 0 && !kia)
		overlays += image('mods/_fd/fd_tbs/icons/tbs_ui.dmi', "dead")
		kia = TRUE

		for(var/mob/living/simple_animal/fd/player/commander in world)
			if(commander.side == side)
				commander.unit_list -= src

		special_death() // Если, вдруг, с юнитом что-то происходит при смерти

	if(unit_health > 0 && kia)
		overlays -= image('mods/_fd/fd_tbs/icons/tbs_ui.dmi', "dead")
		kia = FALSE

		for(var/mob/living/simple_animal/fd/player/commander in world)
			if(commander.side == side)
				commander.unit_list += src

	if(!poisoned && poison_strenght > 0)
		poisoned = TRUE
		overlays += image('mods/_fd/fd_tbs/icons/tbs_ui.dmi', "poison")

	if(poisoned && poison_strenght <= 0)
		poisoned = FALSE
		overlays -= image('mods/_fd/fd_tbs/icons/tbs_ui.dmi', "poison")

	if(unit_armor <= 0 && has_armor && !armor_broken)
		overlays += image('mods/_fd/fd_tbs/icons/tbs_ui.dmi', "broken")
		armor_broken = TRUE

	if(unit_armor > 0 && has_armor && armor_broken)
		overlays -= image('mods/_fd/fd_tbs/icons/tbs_ui.dmi', "broken")
		armor_broken = FALSE

/mob/living/simple_animal/fd/unit/Initialize()
	. = ..()
	new /obj/healthbar(get_turf(src))
	if(has_armor)
		new /obj/armorbar(get_turf(src))

	for(var/mob/living/simple_animal/fd/player/gamer in world)
		if(gamer.side == side)
			gamer.unit_list += src

/mob/living/simple_animal/fd/unit/proc/armor_block(amount)
	unit_armor -= amount

	var/turf/T = get_turf(src)
	for(var/obj/armorbar/armor in T)
		var/adjust_one = armor.pixel_x + 2
		var/adjust_two = armor.pixel_x - 4
		var/adjust_three = armor.pixel_x + 2
		animate(armor, pixel_x = adjust_one, time = 2, easing = LINEAR_EASING | EASE_IN)
		spawn(2)
			animate(armor, pixel_x = adjust_two, time = 2, easing = LINEAR_EASING | EASE_OUT)
		spawn(4)
			animate(armor, pixel_x = adjust_three, time = 2, easing = LINEAR_EASING | EASE_IN)

		armor.update_icon()

/mob/living/simple_animal/fd/unit/proc/heal_damage(amount)
	unit_health += amount

	var/turf/T = get_turf(src)
	for(var/obj/healthbar/health in T)
		health.update_icon()

/mob/living/simple_animal/fd/unit/proc/repair_armor(amount)
	unit_armor += amount

	var/turf/T = get_turf(src)
	for(var/obj/armorbar/armor in T)
		armor.update_icon()

/mob/living/simple_animal/fd/unit/proc/process_damage(amount, ignore_armor = FALSE)
	if(unit_armor > 0 && !ignore_armor)
		amount -= unit_armor
		armor_block(1)
	if(amount < 0)
		amount = 0
	unit_health -= amount

	var/turf/T = get_turf(src)
	for(var/obj/healthbar/health in T)

		var/adjust_one = health.pixel_x + 2
		var/adjust_two = health.pixel_x - 4
		var/adjust_three = health.pixel_x + 2
		animate(health, pixel_x = adjust_one, time = 2, easing = LINEAR_EASING | EASE_IN)
		spawn(2)
			animate(health, pixel_x = adjust_two, time = 2, easing = LINEAR_EASING | EASE_OUT)
		spawn(4)
			animate(health, pixel_x = adjust_three, time = 2, easing = LINEAR_EASING | EASE_IN)

		health.update_icon()

/mob/living/simple_animal/fd/unit/proc/resolve_special() // Индивидуально для каждого юнита
	return

/mob/living/simple_animal/fd/unit/proc/decline_special() // Индивидуально для каждого юнита
	return

/mob/living/simple_animal/fd/unit/proc/specials(mob/user) // Индивидуально для каждого юнита, поэтому здесь я оставлю лишь пример того, как данный прок должен выглядеть и работать!
	var/mob/living/simple_animal/fd/player/commander = user
	var/list/abilities = list(
		"Ability 1" = image('mods/_fd/fd_tbs/icons/tbs_ui.dmi', "Ability"),
		"Ability 2" = image('mods/_fd/fd_tbs/icons/tbs_ui.dmi', "Ability")
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

/mob/living/simple_animal/fd/unit/proc/decline_attack() // Индивидуально для каждого юнита
	return

/mob/living/simple_animal/fd/unit/proc/resolve_attack() // Индивидуально для каждого юнита
	return

/mob/living/simple_animal/fd/unit/proc/attack_options(mob/user) // Индивидуально для каждого юнита, поэтому здесь я оставлю лишь пример того, как данный прок должен выглядеть и работать!
	var/mob/living/simple_animal/fd/player/commander = user
	var/list/attacks = list(
		"Attack 1" = image('mods/_fd/fd_tbs/icons/tbs_ui.dmi', "Attack"),
		"Attack 2" = image('mods/_fd/fd_tbs/icons/tbs_ui.dmi', "Attack")
	)
	chosen_attack = show_radial_menu(commander, src, attacks, radius = 60, require_near = FALSE)
	if (!chosen_attack)
		return 0

	switch(chosen_attack)
		if("Attack 1")
			return 1
		if("Attack 2")
			return 1

	return 0

/mob/living/simple_animal/fd/unit/AltClick(mob/user)
	var/mob/living/simple_animal/fd/player/commander = user
	if(commander.side != side)
		return 0
	if(!commander.active_turn)
		return 0
	if(kia)
		return 0

	var/list/unit_actions = list(
		"Move" = image('mods/_fd/fd_tbs/icons/tbs_ui.dmi', "Move"),
		"Attack" = image('mods/_fd/fd_tbs/icons/tbs_ui.dmi', "Attack"),
		"Special" = image('mods/_fd/fd_tbs/icons/tbs_ui.dmi', "Ability"),
		"Activate" = image('mods/_fd/fd_tbs/icons/tbs_ui.dmi', "Use")
	)

	chosen_action = show_radial_menu(commander, src, unit_actions, radius = 60, require_near = FALSE)
	if (!chosen_action)
		return 0

	switch(chosen_action)
		if("Move")
			if(unit_move_actions <= 0)
				chosen_action = null
				return 0
			overlays += image('mods/_fd/fd_tbs/icons/progressicons.dmi', "busy_friendly")
			commander.selected = src
			return 1
		if("Activate") // Most of the stuff can be activated for free

			commander.selected = src
			return 1
		if("Attack")
			commander.selected = src
			overlays += image('mods/_fd/fd_tbs/icons/progressicons.dmi', "busy_hostile")
			attack_options(commander)
			return 1
		if("Special")
			if(!has_special)
				return 0
			overlays += image('mods/_fd/fd_tbs/icons/progressicons.dmi', "busy_friendly")
			commander.selected = src
			specials(commander)
			return 1

/mob/living/simple_animal/fd/unit/red
	icon_state = "Advanced Mobility Combat Suit"
	side = "Red"
	healthbar_color = "#db0000ff"
	has_armor = TRUE
	unit_health = 5
	unit_armor = 2

/mob/living/simple_animal/fd/unit/blue
	icon_state = "Stealth Suit"
	side = "Blue"
	healthbar_color = "#0061bdff"
	has_armor = TRUE
	unit_health = 5
	unit_armor = 2
