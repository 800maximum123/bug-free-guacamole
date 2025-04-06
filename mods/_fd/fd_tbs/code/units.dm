/obj/healthbar
	mouse_opacity = FALSE
	icon = 'mods/_fd/fd_tbs/icons/overlays.dmi'
	icon_state = "health_3"
	pixel_y = 10
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
	if(linked_character.unit_health == 0)
		pixel_y = 0
		icon_state = "dead"
		return 1
	pixel_y = 10
	icon_state = "health_[linked_character.unit_health]"

/obj/armorbar
	mouse_opacity = FALSE
	icon = 'mods/_fd/fd_tbs/icons/overlays.dmi'
	icon_state = "armor_1"
	pixel_x = 10
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
	if(linked_character.unit_armor == 0)
		pixel_x = 0
		pixel_y = 10
		icon_state = "armor_broken"
		return 1
	pixel_x = 10
	pixel_y = 0
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

	var/unit_health = 3 // 3 - базовое значение для большинства. 10 - возможный максимум
	// Армор - это НЕ дополнительное ХП. При попадании по юниту - он снижает входящий урон на указанное число, затем уменьшаясь на один.
	// Если армор и урон будут равны единице - урон полностью аннулируется, значение армора опускается к нулю.
	// Если армор равен трём, а урон двум - юнит не получит урона и его значение армора уменьшится на один
	var/unit_armor = 0
	var/healthbar_color = "#ffffffff"

	var/side // Фракция
	var/chosen_action // Выбранное действие
	var/unit_actions_amount = 1 // Количество действий(помимо движения), которое игрок может совершить этим юнитом за ход

	var/unit_speed = 6 // Как далеко этот юнит может ходить
	var/unit_move_actions = 1 // У большинства юнитов лишь одно действие мувмента на ход
	var/list/walkable_zone = list() // Все турфы, к которым юнит может передвинуться

	var/has_special = FALSE // Есть ли у нашего юнита особые умения?

/mob/living/simple_animal/fd/unit/Life()
	. = ..()
	if(unit_health <= 0)
		kia = TRUE

/mob/living/simple_animal/fd/unit/Initialize()
	. = ..()
	new /obj/healthbar(get_turf(src))
	if(unit_armor > 0)
		new /obj/armorbar(get_turf(src))

/mob/living/simple_animal/fd/unit/proc/armor_block(amount)
	unit_armor -= amount

	var/turf/T = get_turf(src)
	for(var/obj/armorbar/armor in T)
		var/adjust_one = pixel_x + 2
		var/adjust_two = pixel_x - 4
		var/adjust_three = pixel_x + 2
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
	unit_health -= amount

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

/mob/living/simple_animal/fd/unit/proc/specials(mob/user) // Индивидуально для каждого юнита, поэтому здесь я оставлю лишь пример того, как данный прок должен выглядеть и работать!
	var/list/abilities = list(
		"Ability 1" = image('mods/_fd/fd_tbs/icons/actions.dmi', "mech_lights_off"),
		"Ability 2" = image('mods/_fd/fd_tbs/icons/actions.dmi', "mech_lights_off")
	)
	var/chosen_special = show_radial_menu(user, src, abilities, radius = 60, require_near = FALSE)
	if (!chosen_special)
		return 0

	switch(chosen_special)
		if("Ability 1")
			return 1
		if("Ability 2")
			return 1

	return 0

/mob/living/simple_animal/fd/unit/proc/attack_options(mob/user) // Индивидуально для каждого юнита, поэтому здесь я оставлю лишь пример того, как данный прок должен выглядеть и работать!
	var/list/attacks = list(
		"Attack 1" = image('mods/_fd/fd_tbs/icons/actions.dmi', "mech_zoom_off"),
		"Attack 2" = image('mods/_fd/fd_tbs/icons/actions.dmi', "mech_zoom_off")
	)
	var/chosen_attack = show_radial_menu(user, src, attacks, radius = 60, require_near = FALSE)
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
		"Move" = image('mods/_fd/fd_tbs/icons/actions.dmi', "mech_overload_off"),
		"Attack" = image('mods/_fd/fd_tbs/icons/actions.dmi', "mech_zoom_off"),
		"Special" = image('mods/_fd/fd_tbs/icons/actions.dmi', "mech_lights_off")
	)

	chosen_action = show_radial_menu(commander, src, unit_actions, radius = 60, require_near = FALSE)
	if (!chosen_action)
		return 0

	switch(chosen_action)
		if("Move")
			if(unit_move_actions <= 0)
				return 0
/*			for(var/turf/inzone in orange(src, unit_speed))
				if(inzone.density == TRUE)
					continue
				var/obj/cover = locate() in get_turf(inzone)
				if(cover && cover.density == TRUE)
					continue
				var/mob/unit = locate() in get_turf(inzone)
				if(unit)
					continue
				walkable_zone += inzone
				new /obj/walkable_zone(get_turf(inzone))*/
			commander.selected = src
			return 1
		if("Attack")
			attack_options(commander)
			return 1
		if("Special")
			if(!has_special)
				return 0
			specials(commander)
			return 1

/mob/living/simple_animal/fd/unit/red
	icon_state = "Advanced Mobility Combat Suit"
	side = "Red"
	healthbar_color = "#db0000ff"
	unit_health = 5
	unit_armor = 2

/mob/living/simple_animal/fd/unit/blue
	icon_state = "Stealth Suit"
	side = "Blue"
	healthbar_color = "#0061bdff"
	unit_health = 5
	unit_armor = 2
