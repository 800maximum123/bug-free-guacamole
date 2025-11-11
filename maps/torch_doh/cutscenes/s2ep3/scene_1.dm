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
	visuals.maptext_x = -75
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
		CALL_GLOB(episode3_name),
		CALL_GLOB(episode3_name2) = 8 SECONDS,
		REMOVE_SCREEN(/blackout/animated_better, 1 SECONDS),
		TP_CAMERA("Сцена 3-1 - Кадр 1"),
		ADD_SCREEN(/cinema_borders),
		MOVE_ACTOR(actor("Солдат 1 - 3-1-1"), NORTH) = 2 SECONDS,
		TALK_ACTOR(actor("Солдат 1 - 3-1-1"), "Эй, Дождик!"),
		MOVE_ACTOR(actor("Солдат 1 - 3-1-1"), NORTH) = 1 SECONDS,
		TURN_ACTOR(actor("Эмми - 3-1-1"), WEST) = 1 SECONDS,
		MOVE_ACTOR(actor("Солдат 1 - 3-1-1"), NORTH) = 1 SECONDS,
		TALK_ACTOR(actor("Солдат 1 - 3-1-1"), "!салютует.") = 1 SECONDS,
		MOVE_ACTOR(actor("Солдат 1 - 3-1-1"), NORTH),
		TALK_ACTOR(actor("Солдат 1 - 3-1-1"), "Полагаемся на тебя!") = 1 SECONDS,
		TURN_ACTOR(actor("Солдат 1 - 3-1-1"), EAST),
		MOVE_ACTOR(actor("Солдат 1 - 3-1-1"), NORTH) = 1 SECONDS,
		TALK_ACTOR(actor("Эмми - 3-1-1"), "!кивает."),
		CHANGE_ACTOR_VISUALS(actor("Эмми - 3-1-1"), "EP3 PAGE 1 - 2"),
		TURN_ACTOR(actor("Солдат 1 - 3-1-1"), SOUTH),
		MOVE_ACTOR(actor("Солдат 1 - 3-1-1"), NORTH) = 2 SECONDS,
		MOVE_ACTOR(actor("Солдат 1 - 3-1-1"), NORTH) = 2 SECONDS,
		TALK_ACTOR(actor("Солдат 1 - 3-1-1"), "!посмеивается."),
		TURN_ACTOR(actor("Солдат 1 - 3-1-1"), WEST),
		MOVE_ACTOR(actor("Солдат 1 - 3-1-1"), NORTH) = 2 SECONDS,
		TURN_ACTOR(actor("Солдат 1 - 3-1-1"), NORTH),
		MOVE_ACTOR(actor("Солдат 1 - 3-1-1"), NORTH) = 2 SECONDS,
		ADD_SCREEN(/blackout) = 6 SECONDS,
	)
