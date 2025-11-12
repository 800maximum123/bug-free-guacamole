/proc/episode3_sponsors()
	var/novel_message = "ЭПИЗОД ПРОФИНАНСИРОВАЛИ:"
	var/colored = COLOR_ASSEMBLY_BLACK

	var/obj/screen/novel_message/start_credits/visuals = new /obj/screen/novel_message/start_credits()
	visuals.maptext_x = -110
	visuals.maptext_y = -5
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 8 SECONDS)

/proc/episode3_sponsors2()
	var/novel_message = "Rogver Snott, Aftik, Vista1, Treesiss, Tackcard, Farewellsainty, DenXays, Kvas, Grigpashtet, RaviolliBorchevidze"
	var/colored = COLOR_ORANGE

	var/obj/screen/novel_message/start_credits/visuals = new /obj/screen/novel_message/start_credits()
	visuals.maptext_x = -110
	visuals.maptext_y = -30
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 8 SECONDS)

/proc/episode3_name()
	var/novel_message = "ЭП3:"
	var/colored = COLOR_ASSEMBLY_BLACK

	var/obj/screen/novel_message/start_credits/visuals = new /obj/screen/novel_message/start_credits()
	visuals.maptext_x = -110
	visuals.maptext_y = -410
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 10 SECONDS)

/proc/episode3_name2()
	var/novel_message = "ПАДАЮЩАЯ ЗВЕЗДА"
	var/colored = COLOR_SABER_RED

	var/obj/screen/novel_message/start_credits/visuals = new /obj/screen/novel_message/start_credits()
	visuals.maptext_x = -83
	visuals.maptext_y = -410
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 8 SECONDS)

/*
- Сцена начинается с Эмми, что стоит на плацу около своего старого меха. Один из пилотов проходит мимо неё,
говоря что-то вроде "Полагаемся на вас, капитан!".

- Затем, кадр сменяется на поле боя. Несколько мехов с Эмми во главе несётся над землёй, враг производит залп,
и один из них попадает в подчинённого девушки. Она стреляет в ответ.

- Битва. Ещё один союзник погиб. Эмми набросилась на Восхожденца, добила того, и резко отпрыгнула назад.
Поворот в камеру, ещё один выстрел со спины - в этот раз для неё самой.

- Вид из кабины. Крики по интеркому.

- Чёрный экран, надпись ПРОСНИСЬ.

- Девушка приходит в себя на кровати. Это был лишь очередной сон. Начинает заниматься привычной рутиной.

- Одевается. Кто-то стучится в дверь.
*/

/obj/effect/cutscene_camera/s2ep3sc1
	camera_id = "Сцена 3-1 - Кадр 1"

/obj/effect/cutscene_camera/s2ep3sc2
	camera_id = "Сцена 3-1 - Кадр 2"

/obj/effect/cutscene_camera/s2ep3sc3
	camera_id = "Сцена 3-1 - Кадр 3"

/obj/effect/cutscene_camera/s2ep3sc4
	camera_id = "Сцена 3-1 - Кадр 4"

/obj/effect/cutscene_camera/s2ep3sc5
	camera_id = "Сцена 3-1 - Кадр 5"

/proc/fds2ep3_cutscene1()
	start_cutscene(/datum/modular_cutscene/s2ep3sc1)

/datum/modular_cutscene/s2ep3sc1/setup_actions(...)
	actions = list(
		ADD_SCREEN(/blackout/animated_better) = 2 SECONDS,
		CALL_GLOB(episode2_sponsors),
		CALL_GLOB(episode2_sponsors2) = 8 SECONDS,
		REMOVE_SCREEN(/blackout/animated_better, 1 SECONDS),
		TP_CAMERA("Сцена 3-1 - Кадр 1"),
		ADD_SCREEN(/cinema_borders),
		MOVE_ACTOR(actor("Солдат 1 - 3-1-1"), NORTH) = 2 SECONDS,
		TALK_ACTOR(actor("Солдат 1 - 3-1-1"), "Эй, командир!"),
		MOVE_ACTOR(actor("Солдат 1 - 3-1-1"), NORTH) = 1 SECONDS,
		TURN_ACTOR(actor("Эмми - 3-1-1"), WEST) = 1 SECONDS,
		MOVE_ACTOR(actor("Солдат 1 - 3-1-1"), NORTH) = 1 SECONDS,
		TALK_ACTOR(actor("Солдат 1 - 3-1-1"), "!салютует.") = 1 SECONDS,
		MOVE_ACTOR(actor("Солдат 1 - 3-1-1"), NORTH),
		TALK_ACTOR(actor("Солдат 1 - 3-1-1"), "Полагаемся на вас!"),
		MOVE_ACTOR(actor("Мех 1 - 3-1-1"), SOUTH) = 0.5 SECONDS,
		MOVE_ACTOR(actor("Мех 1 - 3-1-1"), SOUTH) = 0.2 SECONDS,
		MOVE_ACTOR(actor("Мех 1 - 3-1-1"), SOUTH) = 0.2 SECONDS,
		TURN_ACTOR(actor("Солдат 1 - 3-1-1"), EAST) = 0.1 SECONDS,
		MOVE_ACTOR(actor("Солдат 1 - 3-1-1"), NORTH),
		MOVE_ACTOR(actor("Мех 1 - 3-1-1"), SOUTH) = 0.2 SECONDS,
		MOVE_ACTOR(actor("Мех 1 - 3-1-1"), SOUTH) = 0.2 SECONDS,
		MOVE_ACTOR(actor("Мех 1 - 3-1-1"), SOUTH) = 0.2 SECONDS,
		MOVE_ACTOR(actor("Мех 1 - 3-1-1"), SOUTH) = 0.2 SECONDS,
		MOVE_ACTOR(actor("Мех 1 - 3-1-1"), SOUTH) = 0.1 SECONDS,
		TALK_ACTOR(actor("Эмми - 3-1-1"), "!кивает."),
		CHANGE_ACTOR_VISUALS(actor("Эмми - 3-1-1"), "EP3 PAGE 1 - 2") = 0.1 SECONDS,
		TURN_ACTOR(actor("Солдат 1 - 3-1-1"), SOUTH),
		MOVE_ACTOR(actor("Мех 1 - 3-1-1"), SOUTH) = 0.1 SECONDS,
		MOVE_ACTOR(actor("Мех 1 - 3-1-1"), SOUTH) = 0.1 SECONDS,
		MOVE_ACTOR(actor("Мех 1 - 3-1-1"), SOUTH) = 0.1 SECONDS,
		TALK_ACTOR(actor("Солдат 1 - 3-1-1"), "!посмеивается."),
		MOVE_ACTOR(actor("Мех 1 - 3-1-1"), SOUTH) = 0.1 SECONDS,
		MOVE_ACTOR(actor("Мех 1 - 3-1-1"), SOUTH) = 1.1 SECONDS,
		MOVE_ACTOR(actor("Солдат 1 - 3-1-1"), NORTH) = 1 SECONDS,
		MOVE_ACTOR(actor("Солдат 1 - 3-1-1"), NORTH) = 2 SECONDS,
		CHANGE_ACTOR_VISUALS(actor("Солдат 1 - 3-1-1"), "Mech Pilot"),
		ADD_SCREEN(/blackout/animated_better),
		TURN_ACTOR(actor("Солдат 1 - 3-1-1"), WEST),
		MOVE_ACTOR(actor("Солдат 1 - 3-1-1"), NORTH) = 2 SECONDS,
		TURN_ACTOR(actor("Солдат 1 - 3-1-1"), NORTH),
		MOVE_ACTOR(actor("Солдат 1 - 3-1-1"), NORTH) = 4 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/s2ep3sc2)
	)

/datum/modular_cutscene/s2ep3sc2/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 3-1 - Кадр 2"),
		MOVE_CAMERA(0, 18, 0, null),
		MOVE_CAMERA(0, -20, 3 SECONDS, SINE_EASING|EASE_IN),
		ADD_SCREEN(/cinema_borders),
		MOVE_ACTOR(actor("Мех 2 - 3-1-2"), SOUTH),
		MOVE_ACTOR(actor("Мех 3 - 3-1-2"), SOUTH),
		MOVE_ACTOR(actor("Мех 4 - 3-1-2"), SOUTH),
		MOVE_ACTOR(actor("Выстрел 1 - 3-1-2"), NORTH),
		MOVE_ACTOR(actor("Мех 1 - 3-1-2"), SOUTH) = 0.1 SECONDS,
		MOVE_ACTOR(actor("Выстрел 1 - 3-1-2"), NORTH) = 0.1 SECONDS,
		MOVE_ACTOR(actor("Мех 2 - 3-1-2"), SOUTH),
		MOVE_ACTOR(actor("Мех 3 - 3-1-2"), SOUTH),
		MOVE_ACTOR(actor("Мех 4 - 3-1-2"), SOUTH),
		MOVE_ACTOR(actor("Выстрел 1 - 3-1-2"), NORTH),
		MOVE_ACTOR(actor("Мех 1 - 3-1-2"), SOUTH) = 0.1 SECONDS,
		MOVE_ACTOR(actor("Выстрел 1 - 3-1-2"), NORTH) = 0.1 SECONDS,
		MOVE_ACTOR(actor("Мех 2 - 3-1-2"), SOUTH),
		MOVE_ACTOR(actor("Мех 3 - 3-1-2"), SOUTH),
		MOVE_ACTOR(actor("Мех 4 - 3-1-2"), SOUTH),
		MOVE_ACTOR(actor("Выстрел 1 - 3-1-2"), NORTH),
		MOVE_ACTOR(actor("Мех 1 - 3-1-2"), SOUTH) = 0.1 SECONDS,
		MOVE_ACTOR(actor("Выстрел 1 - 3-1-2"), NORTH) = 0.1 SECONDS,
		MOVE_ACTOR(actor("Мех 2 - 3-1-2"), SOUTH),
		MOVE_ACTOR(actor("Мех 3 - 3-1-2"), SOUTH),
		MOVE_ACTOR(actor("Мех 4 - 3-1-2"), SOUTH),
		MOVE_ACTOR(actor("Выстрел 1 - 3-1-2"), NORTH),
		MOVE_ACTOR(actor("Мех 1 - 3-1-2"), SOUTH) = 0.1 SECONDS,
		MOVE_ACTOR(actor("Выстрел 1 - 3-1-2"), NORTH) = 0.1 SECONDS,
		MOVE_ACTOR(actor("Мех 2 - 3-1-2"), SOUTH),
		MOVE_ACTOR(actor("Мех 3 - 3-1-2"), SOUTH),
		MOVE_ACTOR(actor("Мех 4 - 3-1-2"), SOUTH),
		MOVE_ACTOR(actor("Выстрел 1 - 3-1-2"), NORTH),
		MOVE_ACTOR(actor("Мех 1 - 3-1-2"), EAST) = 0.1 SECONDS,
		MOVE_ACTOR(actor("Выстрел 1 - 3-1-2"), NORTH),
		MOVE_ACTOR(actor("Мех 1 - 3-1-2"), SOUTH) = 0.1 SECONDS,
		MOVE_ACTOR(actor("Мех 2 - 3-1-2"), SOUTH),
		MOVE_ACTOR(actor("Мех 3 - 3-1-2"), SOUTH),
		MOVE_ACTOR(actor("Мех 4 - 3-1-2"), SOUTH),
		MOVE_ACTOR(actor("Выстрел 2 - 3-1-2"), NORTH),
		MOVE_ACTOR(actor("Выстрел 1 - 3-1-2"), NORTH),
		MOVE_ACTOR(actor("Мех 1 - 3-1-2"), SOUTH) = 0.1 SECONDS,
		MOVE_ACTOR(actor("Выстрел 2 - 3-1-2"), NORTH),
		MOVE_ACTOR(actor("Выстрел 1 - 3-1-2"), NORTH) = 0.1 SECONDS,
		MOVE_ACTOR(actor("Мех 2 - 3-1-2"), SOUTH),
		MOVE_ACTOR(actor("Мех 3 - 3-1-2"), SOUTH),
		MOVE_ACTOR(actor("Мех 4 - 3-1-2"), SOUTH),
		MOVE_ACTOR(actor("Выстрел 2 - 3-1-2"), NORTH),
		MOVE_ACTOR(actor("Мех 1 - 3-1-2"), SOUTH) = 0.1 SECONDS,
		MOVE_ACTOR(actor("Выстрел 2 - 3-1-2"), NORTH) = 0.1 SECONDS,
		MOVE_ACTOR(actor("Мех 2 - 3-1-2"), SOUTH),
		MOVE_ACTOR(actor("Мех 3 - 3-1-2"), SOUTH),
		MOVE_ACTOR(actor("Мех 4 - 3-1-2"), SOUTH),
		MOVE_ACTOR(actor("Выстрел 2 - 3-1-2"), NORTH),
		MOVE_ACTOR(actor("Мех 1 - 3-1-2"), SOUTH) = 0.1 SECONDS,
		MOVE_ACTOR(actor("Выстрел 2 - 3-1-2"), NORTH) = 0.1 SECONDS,
		MOVE_ACTOR(actor("Мех 2 - 3-1-2"), SOUTH),
		MOVE_ACTOR(actor("Мех 3 - 3-1-2"), SOUTH),
		MOVE_ACTOR(actor("Мех 4 - 3-1-2"), SOUTH),
		MOVE_ACTOR(actor("Выстрел 2 - 3-1-2"), NORTH),
		MOVE_ACTOR(actor("Мех 1 - 3-1-2"), SOUTH) = 0.1 SECONDS,
		MOVE_ACTOR(actor("Выстрел 2 - 3-1-2"), NORTH) = 0.1 SECONDS,
		MOVE_ACTOR(actor("Мех 2 - 3-1-2"), SOUTH),
		MOVE_ACTOR(actor("Мех 3 - 3-1-2"), SOUTH),
		SHIFT_ACTOR(actor("Мех 3 - 3-1-2"), 0, 32, 0.4 SECONDS, SINE_EASING|EASE_IN, ANIMATION_PARALLEL),
		MOVE_ACTOR(actor("Мех 4 - 3-1-2"), SOUTH),
		MOVE_ACTOR(actor("Выстрел 2 - 3-1-2"), NORTH),
		MOVE_ACTOR(actor("Мех 1 - 3-1-2"), SOUTH) = 0.1 SECONDS,
		MOVE_ACTOR(actor("Выстрел 2 - 3-1-2"), NORTH) = 0.1 SECONDS,
		MOVE_ACTOR(actor("Мех 2 - 3-1-2"), SOUTH),
		MOVE_ACTOR(actor("Мех 3 - 3-1-2"), SOUTH),
		MOVE_ACTOR(actor("Мех 4 - 3-1-2"), SOUTH),
		CHANGE_ACTOR_VISIBILITY(actor("Попадание - 3-1-2"), 255, 0.2 SECONDS, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Выстрел 2 - 3-1-2"), 0, 0.2 SECONDS, SINE_EASING, null),
		CHANGE_ACTOR_COLOR(actor("Мех 4 - 3-1-2"), "#ff0000", 0.2 SECONDS, SINE_EASING, null),
		MOVE_ACTOR(actor("Мех 1 - 3-1-2"), SOUTH) = 0.2 SECONDS,
		MOVE_ACTOR(actor("Мех 2 - 3-1-2"), SOUTH),
		MOVE_ACTOR(actor("Мех 3 - 3-1-2"), SOUTH),
		SHIFT_ACTOR(actor("Мех 3 - 3-1-2"), 0, 16, 0.4 SECONDS, SINE_EASING|EASE_OUT, null),
		CHANGE_ACTOR_VISUALS(actor("Мех 4 - 3-1-2"), "basic_destroyed2"),
		CHANGE_ACTOR_COLOR(actor("Мех 4 - 3-1-2"), "#ffffff", 0.2 SECONDS, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Попадание - 3-1-2"), 0, 0.2 SECONDS, SINE_EASING, null),
		MOVE_ACTOR(actor("Мех 1 - 3-1-2"), SOUTH) = 0.2 SECONDS,
		MOVE_ACTOR(actor("Мех 2 - 3-1-2"), SOUTH),
		MOVE_ACTOR(actor("Мех 3 - 3-1-2"), SOUTH),
		MOVE_ACTOR(actor("Мех 1 - 3-1-2"), SOUTH) = 0.2 SECONDS,
		MOVE_ACTOR(actor("Мех 2 - 3-1-2"), SOUTH),
		MOVE_ACTOR(actor("Мех 3 - 3-1-2"), SOUTH),
		MOVE_ACTOR(actor("Мех 1 - 3-1-2"), SOUTH) = 0.2 SECONDS,
		MOVE_ACTOR(actor("Мех 2 - 3-1-2"), SOUTH),
		TURN_ACTOR(actor("Мех 3 - 3-1-2"), WEST),
		MOVE_ACTOR(actor("Мех 1 - 3-1-2"), SOUTH) = 0.2 SECONDS,
		MOVE_ACTOR(actor("Мех 2 - 3-1-2"), SOUTH),
		MOVE_ACTOR(actor("Мех 1 - 3-1-2"), SOUTH) = 0.2 SECONDS,
		MOVE_ACTOR(actor("Мех 2 - 3-1-2"), SOUTH),
		MOVE_ACTOR(actor("Мех 1 - 3-1-2"), SOUTH) = 0.2 SECONDS,
		MOVE_ACTOR(actor("Мех 2 - 3-1-2"), SOUTH),
		MOVE_ACTOR(actor("Мех 1 - 3-1-2"), SOUTH) = 0.2 SECONDS,
		MOVE_ACTOR(actor("Мех 2 - 3-1-2"), SOUTH),
		MOVE_ACTOR(actor("Мех 1 - 3-1-2"), SOUTH) = 0.2 SECONDS,
		ADD_SCREEN(/blackout) = 2 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/s2ep3sc3)
	)

/datum/modular_cutscene/s2ep3sc3/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 3-1 - Кадр 3"),
		MOVE_CAMERA(0, 0, 0, null),
		ADD_SCREEN(/cinema_borders),
		CHANGE_ACTOR_VISIBILITY(actor("Снаряд 1 - 3-1-3"), 255, 0.2 SECONDS, SINE_EASING, null),
		MOVE_ACTOR(actor("Снаряд 1 - 3-1-3"), SOUTH) = 0.2 SECONDS,
		CHANGE_ACTOR_VISIBILITY(actor("Снаряд 2 - 3-1-3"), 255, 0.2 SECONDS, SINE_EASING, null),
		MOVE_ACTOR(actor("Снаряд 1 - 3-1-3"), SOUTH),
		MOVE_ACTOR(actor("Снаряд 2 - 3-1-3"), SOUTH) = 0.2 SECONDS,
		CHANGE_ACTOR_VISIBILITY(actor("Снаряд 3 - 3-1-3"), 255, 0.2 SECONDS, SINE_EASING, null),
		MOVE_ACTOR(actor("Снаряд 1 - 3-1-3"), SOUTH),
		CHANGE_ACTOR_VISIBILITY(actor("Снаряд 1 - 3-1-3"), 0, 0.2 SECONDS, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Попадание 1 - 3-1-3"), 255, 0.2 SECONDS, SINE_EASING, null),
		SHIFT_ACTOR(actor("Восхожденец 1 - 3-1-3"), 0, -16, 0.1 SECONDS, SINE_EASING|EASE_OUT, null),
		MOVE_ACTOR(actor("Снаряд 2 - 3-1-3"), SOUTH) = 0.1 SECONDS,
		SHIFT_ACTOR(actor("Восхожденец 1 - 3-1-3"), 0, 0, 0.1 SECONDS, SINE_EASING|EASE_IN, null),
		MOVE_ACTOR(actor("Снаряд 3 - 3-1-3"), SOUTH) = 0.1 SECONDS,
		CHANGE_ACTOR_VISIBILITY(actor("Попадание 1 - 3-1-3"), 0, 0.2 SECONDS, SINE_EASING, null),
		MOVE_ACTOR(actor("Снаряд 2 - 3-1-3"), SOUTH),
		CHANGE_ACTOR_VISIBILITY(actor("Снаряд 2 - 3-1-3"), 0, 0.2 SECONDS, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Попадание 2 - 3-1-3"), 255, 0.2 SECONDS, SINE_EASING, null),
		SHIFT_ACTOR(actor("Восхожденец 1 - 3-1-3"), 0, -16, 0.1 SECONDS, SINE_EASING|EASE_OUT, null),
		MOVE_ACTOR(actor("Снаряд 3 - 3-1-3"), SOUTH) = 0.1 SECONDS,
		SHIFT_ACTOR(actor("Восхожденец 1 - 3-1-3"), 0, 0, 0.1 SECONDS, SINE_EASING|EASE_IN, null) = 0.1 SECONDS,
		MOVE_ACTOR(actor("Восхожденец 1 - 3-1-3"), SOUTH),
		CHANGE_ACTOR_VISIBILITY(actor("Попадание 2 - 3-1-3"), 0, 0.2 SECONDS, SINE_EASING, null),
		MOVE_ACTOR(actor("Снаряд 3 - 3-1-3"), SOUTH) = 0.2 SECONDS,
		MOVE_ACTOR(actor("Снаряд 3 - 3-1-3"), SOUTH),
		CHANGE_ACTOR_VISIBILITY(actor("Снаряд 3 - 3-1-3"), 0, 0.2 SECONDS, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Попадание 3 - 3-1-3"), 255, 0.2 SECONDS, SINE_EASING, null),
	)
