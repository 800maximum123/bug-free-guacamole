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

/proc/mech1_lost()
	var/novel_message = "C4-003 VITAL SIGNS LOST"
	var/colored = PIPE_COLOR_RED

	var/obj/screen/novel_message/start_credits/nofade_simple/visuals = new /obj/screen/novel_message/start_credits/nofade_simple()
	visuals.maptext_x = -100
	visuals.maptext_y = 0
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 10 SECONDS)

/proc/mech2_lost()
	var/novel_message = "C4-004 VITAL SIGNS LOST"
	var/colored = PIPE_COLOR_RED

	var/obj/screen/novel_message/start_credits/nofade_simple/visuals = new /obj/screen/novel_message/start_credits/nofade_simple()
	visuals.maptext_x = 100
	visuals.maptext_y = -200
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 8 SECONDS)

/proc/awayoutforemmy()
	var/novel_message = "CALCULATING POSSIBLE ROUTE..."
	var/colored = PIPE_COLOR_YELLOW

	var/obj/screen/novel_message/start_credits/nofade_simple/visuals = new /obj/screen/novel_message/start_credits/nofade_simple()
	visuals.maptext_x = -120
	visuals.maptext_y = -410
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 6 SECONDS)

/proc/inthepast1()
	var/novel_message = "2317-08-03 |"
	var/colored = CABLE_COLOR_GREEN

	var/obj/screen/novel_message/start_credits/visuals = new /obj/screen/novel_message/start_credits()
	visuals.maptext_x = -110
	visuals.maptext_y = -410
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 8 SECONDS)

/proc/inthepast2()
	var/novel_message = "БИТВА ЗА ПЛУТОН"
	var/colored = CABLE_COLOR_GREEN

	var/obj/screen/novel_message/start_credits/visuals = new /obj/screen/novel_message/start_credits()
	visuals.maptext_x = -60
	visuals.maptext_y = -410
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 6 SECONDS)


/proc/manticore_day()
	var/novel_message = "2338-08-03 |"
	var/colored = CABLE_COLOR_GREEN

	var/obj/screen/novel_message/start_credits/visuals = new /obj/screen/novel_message/start_credits()
	visuals.maptext_x = -110
	visuals.maptext_y = -410
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 8 SECONDS)

/proc/manticore_day2()
	var/novel_message = "ЗА НЕСКОЛЬКО ЧАСОВ ДО ПАДЕНИЯ ФАКЕЛА"
	var/colored = CABLE_COLOR_GREEN

	var/obj/screen/novel_message/start_credits/visuals = new /obj/screen/novel_message/start_credits()
	visuals.maptext_x = -60
	visuals.maptext_y = -410
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 6 SECONDS)

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

/obj/effect/cutscene_camera/s2ep3sc6
	camera_id = "Сцена 3-1 - Кадр 6"

/obj/effect/cutscene_camera/s2ep3sc7
	camera_id = "Сцена 3-1 - Кадр 7"

/obj/effect/cutscene_camera/s2ep3sc8
	camera_id = "Сцена 3-1 - Кадр 8"

/obj/effect/cutscene_camera/s2ep3sc9
	camera_id = "Сцена 3-1 - Кадр 9"

/obj/effect/cutscene_camera/s2ep3sc10
	camera_id = "Сцена 3-1 - Кадр 10"

/obj/effect/cutscene_camera/s2ep3sc11
	camera_id = "Сцена 3-1 - Кадр 11"

/proc/fds2ep3_cutscene1()
	start_cutscene(/datum/modular_cutscene/s2ep3sc1)

/datum/modular_cutscene/s2ep3sc1/setup_actions(...)
	actions = list(
		ADD_SCREEN(/blackout/animated_better) = 2 SECONDS,
		CALL_GLOB(episode2_sponsors),
		CALL_GLOB(episode2_sponsors2) = 10 SECONDS,
		CALL_GLOB(inthepast1) = 2 SECONDS,
		CALL_GLOB(inthepast2) = 8 SECONDS,
		REMOVE_SCREEN(/blackout/animated_better, 1 SECONDS),
		TP_CAMERA("Сцена 3-1 - Кадр 1"),
		ADD_SCREEN(/cinema_borders),
		PLAY_SOUND(sound('sound/machines/engine.ogg', volume = 5), null),
		PLAY_SOUND(sound('sound/effects/footstep/asteroid4.ogg', volume = 70), null),
		MOVE_ACTOR(actor("Солдат 1 - 3-1-1"), NORTH) = 2 SECONDS,
		TALK_ACTOR(actor("Солдат 1 - 3-1-1"), "Эй, командир!"),
		PLAY_SOUND(sound('sound/effects/footstep/asteroid2.ogg', volume = 70), null),
		MOVE_ACTOR(actor("Солдат 1 - 3-1-1"), NORTH) = 1 SECONDS,
		PLAY_SOUND(sound('sound/machines/engine.ogg', volume = 5), null),
		TURN_ACTOR(actor("Эмми - 3-1-1"), WEST) = 1 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/asteroid1.ogg', volume = 70), null),
		MOVE_ACTOR(actor("Солдат 1 - 3-1-1"), NORTH) = 1 SECONDS,
		TALK_ACTOR(actor("Солдат 1 - 3-1-1"), "!салютует.") = 1 SECONDS,
		PLAY_SOUND(sound('sound/machines/engine.ogg', volume = 5), null),
		PLAY_SOUND(sound('sound/effects/footstep/asteroid2.ogg', volume = 70), null),
		MOVE_ACTOR(actor("Солдат 1 - 3-1-1"), NORTH),
		TALK_ACTOR(actor("Солдат 1 - 3-1-1"), "Полагаемся на вас!"),
		PLAY_SOUND(sound('sound/machines/thruster.ogg', volume = 10), null),
		MOVE_ACTOR(actor("Мех 1 - 3-1-1"), SOUTH) = 0.5 SECONDS,
		MOVE_ACTOR(actor("Мех 1 - 3-1-1"), SOUTH) = 0.2 SECONDS,
		MOVE_ACTOR(actor("Мех 1 - 3-1-1"), SOUTH) = 0.2 SECONDS,
		TURN_ACTOR(actor("Солдат 1 - 3-1-1"), EAST) = 0.1 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/asteroid4.ogg', volume = 70), null),
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
		MOVE_ACTOR(actor("Мех 1 - 3-1-1"), SOUTH) = 0.6 SECONDS,
		PLAY_SOUND(sound('sound/machines/engine.ogg', volume = 5), null) = 0.5 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/asteroid1.ogg', volume = 70), null),
		MOVE_ACTOR(actor("Солдат 1 - 3-1-1"), NORTH) = 1 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/AC5.ogg', volume = 30), null),
		ADD_SCREEN(/blackout/animated_better),
		PLAY_SOUND(sound('sound/effects/footstep/asteroid3.ogg', volume = 70), null),
		MOVE_ACTOR(actor("Солдат 1 - 3-1-1"), NORTH) = 2 SECONDS,
		CHANGE_ACTOR_VISUALS(actor("Солдат 1 - 3-1-1"), "Mech Pilot"),
		TURN_ACTOR(actor("Солдат 1 - 3-1-1"), WEST),
		PLAY_SOUND(sound('sound/effects/footstep/asteroid4.ogg', volume = 70), null),
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/ambienceriver.ogg', volume = 50), null),
		MOVE_ACTOR(actor("Солдат 1 - 3-1-1"), NORTH) = 2 SECONDS,
		TURN_ACTOR(actor("Солдат 1 - 3-1-1"), NORTH),
		PLAY_SOUND(sound('sound/effects/footstep/asteroid1.ogg', volume = 70), null),
		MOVE_ACTOR(actor("Солдат 1 - 3-1-1"), NORTH) = 8 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/s2ep3sc2)
	)

/datum/modular_cutscene/s2ep3sc2/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 3-1 - Кадр 2"),
		MOVE_CAMERA(0, 18, 0, null),
		MOVE_CAMERA(0, -20, 4 SECONDS, SINE_EASING|EASE_IN),
		ADD_SCREEN(/cinema_borders),
		MOVE_ACTOR(actor("Мех 2 - 3-1-2"), SOUTH),
		MOVE_ACTOR(actor("Мех 3 - 3-1-2"), SOUTH),
		MOVE_ACTOR(actor("Мех 4 - 3-1-2"), SOUTH),
		PLAY_SOUND(sound('sound/weapons/Laser2.ogg', volume = 10), null),
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
		PLAY_SOUND(sound('sound/machines/thruster.ogg', volume = 10), null),
		PLAY_SOUND(sound('sound/weapons/guns/miss4.ogg', volume = 30), null),
		MOVE_ACTOR(actor("Мех 1 - 3-1-2"), EAST) = 0.1 SECONDS,
		MOVE_ACTOR(actor("Выстрел 1 - 3-1-2"), NORTH),
		MOVE_ACTOR(actor("Мех 1 - 3-1-2"), SOUTH) = 0.1 SECONDS,
		MOVE_ACTOR(actor("Мех 2 - 3-1-2"), SOUTH),
		MOVE_ACTOR(actor("Мех 3 - 3-1-2"), SOUTH),
		MOVE_ACTOR(actor("Мех 4 - 3-1-2"), SOUTH),
		PLAY_SOUND(sound('sound/weapons/Laser2.ogg', volume = 10), null),
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
		PLAY_SOUND(sound('sound/mecha/mechmove03.ogg', volume = 10), null),
		CREATE_SPARK(actor("Мех 4 - 3-1-2")),
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
		PLAY_SOUND(sound('sound/mecha/mechstep03.ogg', volume = 10), null),
		TURN_ACTOR(actor("Мех 3 - 3-1-2"), WEST),
		MOVE_ACTOR(actor("Мех 1 - 3-1-2"), SOUTH) = 0.2 SECONDS,
		MOVE_ACTOR(actor("Мех 2 - 3-1-2"), SOUTH),
		PLAY_SOUND(sound('sound/machines/thruster.ogg', volume = 10), null),
		MOVE_ACTOR(actor("Мех 1 - 3-1-2"), SOUTH) = 0.2 SECONDS,
		MOVE_ACTOR(actor("Мех 2 - 3-1-2"), SOUTH),
		MOVE_ACTOR(actor("Мех 1 - 3-1-2"), SOUTH) = 0.2 SECONDS,
		MOVE_ACTOR(actor("Мех 2 - 3-1-2"), SOUTH),
		MOVE_ACTOR(actor("Мех 1 - 3-1-2"), SOUTH) = 0.2 SECONDS,
		PLAY_SOUND(sound('sound/machines/thruster.ogg', volume = 10), null),
		MOVE_ACTOR(actor("Мех 2 - 3-1-2"), SOUTH),
		MOVE_ACTOR(actor("Мех 1 - 3-1-2"), SOUTH) = 0.2 SECONDS,
		ADD_SCREEN(/blackout) = 2 SECONDS,
		CALL_GLOB(mech1_lost) = 2 SECONDS,
		CALL_GLOB(mech2_lost) = 2 SECONDS,
		CALL_GLOB(awayoutforemmy) = 8 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/s2ep3sc3)
	)

/datum/modular_cutscene/s2ep3sc3/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 3-1 - Кадр 3"),
		MOVE_CAMERA(0, 0, 0, null),
		ADD_SCREEN(/cinema_borders),
		TALK_ACTOR(actor("Солдат - 3-1-3"), "Третий и четвёртый отстали! Нужно-...") = 2 SECONDS,
		SHAKE_SCENE(5, 1),
		TALK_ACTOR(actor("Эмми - В мехе"), "ПРОДОЛЖАТЬ движение!") = 4 SECONDS,
		TALK_ACTOR(actor("Солдат - 3-1-3"), "...но ведь!") = 2 SECONDS,
		CHANGE_ACTOR_VISUALS(actor("Эмми - В мехе"), "EP3 PAGE 1 - 7"),
		TALK_ACTOR(actor("Эмми - В мехе"), "Они помогут себе сами!") = 2 SECONDS,
		PLAY_SOUND(sound('sound/mecha/mechstep01.ogg', volume = 10), null),
		CREATE_SPARK(actor("Солдат - 3-1-3")),
		PLAY_SOUND(sound('sound/mecha/critdestrnano.ogg', volume = 30), null),
		SHAKE_SCENE(5, 1) = 2 SECONDS,
		CHANGE_ACTOR_VISUALS(actor("Эмми - В мехе"), "EP3 PAGE 1 - 2"),
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/AC5.ogg', volume = 30), null),
		TALK_ACTOR(actor("Эмми - В мехе"), "У нас всё ещё есть ЗАДАЧА, которую нужно выполнить!") = 2 SECONDS,
		ADD_SCREEN(/blackout) = 4 SECONDS,
		TALK_ACTOR(actor("Эмми - В мехе"), "Прошу...сконцентрируйся на ней.") = 6 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/s2ep3sc4)
	)

/datum/modular_cutscene/s2ep3sc4/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 3-1 - Кадр 4"),
		ADD_SCREEN(/cinema_borders),
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/ambienceriver.ogg', volume = 50), null),
		TALK_ACTOR(actor("Мех 2 - 3-1-4"), "Командир...!"),
		SHIFT_ACTOR(actor("Восхожденец 2 - 3-1-4"), -10, -11, 0.5 SECONDS, SINE_EASING|EASE_IN, null),
		SHIFT_ACTOR(actor("Мех 2 - 3-1-4"), 5, 16, 0.5 SECONDS, SINE_EASING|EASE_IN, ANIMATION_PARALLEL),
		CREATE_SPARK(actor("Мех 2 - 3-1-4")),
		CHANGE_ACTOR_COLOR(actor("Мех 2 - 3-1-4"), "#ff0000", 0.5 SECONDS, SINE_EASING, ANIMATION_PARALLEL),
		PLAY_SOUND(sound('sound/weapons/guns/casingfall1.ogg', volume = 10), null),
		PLAY_SOUND(sound('sound/weapons/gunshot/mech_autocannon.ogg', volume = 30), null),
		SHIFT_ACTOR(actor("Мех 1 - 3-1-4"), 8, 40, 0.1 SECONDS, SINE_EASING|EASE_IN, null),
		CHANGE_ACTOR_VISIBILITY(actor("Снаряд 1 - 3-1-4"), 255, 0.2 SECONDS, SINE_EASING, null),
		MOVE_ACTOR(actor("Снаряд 1 - 3-1-4"), SOUTH) = 0.1 SECONDS,
		MOVE_ACTOR(actor("Снаряд 1 - 3-1-4"), SOUTH) = 0.1 SECONDS,
		SHIFT_ACTOR(actor("Мех 1 - 3-1-4"), 8, 32, 0.2 SECONDS, SINE_EASING|EASE_OUT, null),
		MOVE_ACTOR(actor("Снаряд 1 - 3-1-4"), SOUTH) = 0.1 SECONDS,
		CHANGE_ACTOR_VISIBILITY(actor("Снаряд 1 - 3-1-4"), 0, 0.2 SECONDS, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Попадание 1 - 3-1-4"), 255, 0.2 SECONDS, SINE_EASING, null),
		CREATE_SPARK(actor("Восхожденец 1 - 3-1-4")),
		SHIFT_ACTOR(actor("Восхожденец 1 - 3-1-4"), -5, -16, 0.2 SECONDS, SINE_EASING|EASE_OUT, null),
		CHANGE_ACTOR_COLOR(actor("Восхожденец 1 - 3-1-4"), "#ff0000", 0.5 SECONDS, SINE_EASING, ANIMATION_PARALLEL) = 0.2 SECONDS,
		CHANGE_ACTOR_COLOR(actor("Мех 2 - 3-1-4"), "#ffffff", 0.5 SECONDS, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Попадание 1 - 3-1-4"), 0, 0.2 SECONDS, SINE_EASING, null),
		SHIFT_ACTOR(actor("Восхожденец 1 - 3-1-4"), 0, 0, 0.2 SECONDS, SINE_EASING|EASE_IN, null) = 0.3 SECONDS,
		CHANGE_ACTOR_COLOR(actor("Восхожденец 1 - 3-1-4"), "#622ceb", 0.5 SECONDS, SINE_EASING, ANIMATION_PARALLEL) = 0.2 SECONDS,

		PLAY_SOUND(sound('sound/weapons/guns/casingfall3.ogg', volume = 10), null),
		PLAY_SOUND(sound('sound/weapons/gunshot/mech_autocannon.ogg', volume = 30), null),
		SHIFT_ACTOR(actor("Мех 1 - 3-1-4"), 8, 40, 0.1 SECONDS, SINE_EASING|EASE_IN, null),
		CHANGE_ACTOR_VISIBILITY(actor("Снаряд 2 - 3-1-4"), 255, 0.2 SECONDS, SINE_EASING, null),
		MOVE_ACTOR(actor("Снаряд 2 - 3-1-4"), SOUTH) = 0.1 SECONDS,
		MOVE_ACTOR(actor("Снаряд 2 - 3-1-4"), SOUTH) = 0.1 SECONDS,
		SHIFT_ACTOR(actor("Мех 1 - 3-1-4"), 8, 32, 0.2 SECONDS, SINE_EASING|EASE_OUT, null),
		MOVE_ACTOR(actor("Снаряд 2 - 3-1-4"), SOUTH) = 0.1 SECONDS,
		CHANGE_ACTOR_VISIBILITY(actor("Снаряд 2 - 3-1-4"), 0, 0.2 SECONDS, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Попадание 2 - 3-1-4"), 255, 0.2 SECONDS, SINE_EASING, null),
		CREATE_SPARK(actor("Восхожденец 1 - 3-1-4")),
		SHIFT_ACTOR(actor("Восхожденец 1 - 3-1-4"), 5, -16, 0.2 SECONDS, SINE_EASING|EASE_OUT, null),
		CHANGE_ACTOR_COLOR(actor("Восхожденец 1 - 3-1-4"), "#ff0000", 0.5 SECONDS, SINE_EASING, ANIMATION_PARALLEL) = 0.2 SECONDS,
		CHANGE_ACTOR_VISIBILITY(actor("Попадание 2 - 3-1-4"), 0, 0.2 SECONDS, SINE_EASING, null),
		SHIFT_ACTOR(actor("Восхожденец 1 - 3-1-4"), 0, 0, 0.2 SECONDS, SINE_EASING|EASE_IN, null) = 0.3 SECONDS,
		CHANGE_ACTOR_COLOR(actor("Восхожденец 1 - 3-1-4"), "#622ceb", 0.5 SECONDS, SINE_EASING, ANIMATION_PARALLEL) = 0.2 SECONDS,

		MOVE_ACTOR(actor("Восхожденец 1 - 3-1-4"), SOUTH) = 0.2 SECONDS,
		MOVE_ACTOR(actor("Мех 1 - 3-1-4"), SOUTH) = 0.2 SECONDS,

		PLAY_SOUND(sound('sound/weapons/guns/casingfall2.ogg', volume = 10), null),
		PLAY_SOUND(sound('sound/weapons/gunshot/mech_autocannon.ogg', volume = 30), null),
		SHIFT_ACTOR(actor("Мех 1 - 3-1-4"), 8, 40, 0.1 SECONDS, SINE_EASING|EASE_IN, null),
		CHANGE_ACTOR_VISIBILITY(actor("Снаряд 3 - 3-1-4"), 255, 0.2 SECONDS, SINE_EASING, null),
		MOVE_ACTOR(actor("Снаряд 3 - 3-1-4"), SOUTH) = 0.1 SECONDS,
		MOVE_ACTOR(actor("Снаряд 3 - 3-1-4"), SOUTH) = 0.1 SECONDS,
		SHIFT_ACTOR(actor("Мех 1 - 3-1-4"), 8, 32, 0.2 SECONDS, SINE_EASING|EASE_OUT, null),
		MOVE_ACTOR(actor("Снаряд 3 - 3-1-4"), SOUTH) = 0.1 SECONDS,
		CHANGE_ACTOR_VISIBILITY(actor("Снаряд 3 - 3-1-4"), 0, 0.2 SECONDS, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Попадание 3 - 3-1-4"), 255, 0.2 SECONDS, SINE_EASING, null),
		CREATE_SPARK(actor("Восхожденец 1 - 3-1-4")),
		SHIFT_ACTOR(actor("Восхожденец 1 - 3-1-4"), 0, -16, 0.2 SECONDS, SINE_EASING|EASE_OUT, null),
		CHANGE_ACTOR_VISUALS(actor("Восхожденец 1 - 3-1-4"), "ascent_destroyed"),
		CHANGE_ACTOR_COLOR(actor("Восхожденец 1 - 3-1-4"), "#ff0000", 0.5 SECONDS, SINE_EASING, ANIMATION_PARALLEL) = 0.2 SECONDS,
		CHANGE_ACTOR_VISIBILITY(actor("Попадание 3 - 3-1-4"), 0, 0.2 SECONDS, SINE_EASING, null),
		SHIFT_ACTOR(actor("Восхожденец 1 - 3-1-4"), 0, 0, 0.2 SECONDS, SINE_EASING|EASE_IN, null) = 0.3 SECONDS,
		CHANGE_ACTOR_COLOR(actor("Восхожденец 1 - 3-1-4"), "#622ceb", 0.5 SECONDS, SINE_EASING, ANIMATION_PARALLEL) = 0.2 SECONDS,

		MOVE_ACTOR(actor("Мех 1 - 3-1-4"), SOUTH) = 0.2 SECONDS,
		TALK_ACTOR(actor("Мех 1 - 3-1-4"), "ВТОРОЙ!"),
		TURN_ACTOR(actor("Мех 1 - 3-1-4"), EAST) = 0.4 SECONDS,

		SHIFT_ACTOR(actor("Восхожденец 2 - 3-1-4"), 5, -11, 0.5 SECONDS, SINE_EASING|EASE_IN, null) = 0.5 SECONDS,
		TALK_ACTOR(actor("Мех 2 - 3-1-4"), "П-простите..."),
		TURN_ACTOR(actor("Мех 2 - 3-1-4"), SOUTH),
		SHIFT_ACTOR(actor("Мех 2 - 3-1-4"), 10, -16, 0.5 SECONDS, SINE_EASING|EASE_IN, null) = 0.5 SECONDS,
		SHIFT_ACTOR(actor("Мех 2 - 3-1-4"), 0, 16, 0.5 SECONDS, SINE_EASING|EASE_IN, null) = 0.4 SECONDS,
		CHANGE_ACTOR_VISUALS(actor("Мех 2 - 3-1-4"), "basic_destroyed"),
		CREATE_SPARK(actor("Мех 2 - 3-1-4")),
		MOVE_ACTOR(actor("Мех 2 - 3-1-4"), NORTH) = 0.1 SECONDS,
		MOVE_ACTOR(actor("Мех 2 - 3-1-4"), NORTH) = 0.1 SECONDS,
		MOVE_ACTOR(actor("Мех 2 - 3-1-4"), NORTH),
		SHIFT_ACTOR(actor("Мех 2 - 3-1-4"), 0, 32, 0.2 SECONDS, SINE_EASING|EASE_IN, null) = 0.5 SECONDS,

		MOVE_ACTOR(actor("Восхожденец 2 - 3-1-4"), WEST) = 1 SECONDS,
		TALK_ACTOR(actor("Голос 1 - 3-1-4"), "Э̶̷̲̅т̶̷̲̅о̶̷̲̅ ̶̷̲̅к̶̷̲̅в̶̷̲̅а̶̷̲̅д̶̷̲̅р̶̷̲̅а̶̷̲̅нт̶̷̲̅ ̶̷̲̅3̶̷̲̅3̶̷̲̅-̶̷̲̅B̶̷̲̅!̶̷̲̅ ") = 2 SECONDS,
		TALK_ACTOR(actor("Восхожденец 2 - 3-1-4"), "!отряхивает окровавленный меч."),
		SHIFT_ACTOR(actor("Восхожденец 2 - 3-1-4"), 5, -32, 0.5 SECONDS, SINE_EASING|EASE_IN, null) = 0.5 SECONDS,
		PLAY_SOUND(sound('sound/obj/machinery/door/airlock/bolts_down.ogg', volume = 20), null),
		TALK_ACTOR(actor("Мех 1 - 3-1-4"), "!сжимает пальцы в кулак.") = 4 SECONDS,
		TALK_ACTOR(actor("Голос 1 - 3-1-4"), "З̶̷̲̅а̶̷̲̅п̶̷̲̅р̶̷̲̅а̶̷̲̅ш̶̷̲̅и̶̷̲̅в̶̷̲̅а̶̷̲̅е̶̷̲̅м̶̷̲̅ ̶̷̲̅п̶̷̲̅о̶̷̲̅д̶̷̲̅д̶̷̲̅е̶̷̲̅р̶̷̲̅ж̶̷̲̅к̶̷̲̅у̶̷̲̅!̶̷̲̅  Н̶̷̲̅а̶̷̲̅с̶̷̲̅ ̶̷̲̅р̶̷̲̅е̶̷̲̅ж̶̷̲̅у̶̷̲̅т̶̷̲̅ ̶̷̲̅к̶̷̲̅а̶̷̲̅к̶̷̲̅ ̶̷̲̅к̶̷̲̅о̶̷̲̅р̶̷̲̅о̶̷̲̅в̶̷̲̅ ̶̷̲̅н̶̷̲̅а̶̷̲̅ ̶̷̲̅к̶̷̲̅о̶̷̲̅м̶̷̲̅б̶̷̲̅и̶̷̲̅н̶̷̲̅а̶̷̲̅т̶̷̲̅е̶̷̲̅!̶̷̲̅ ") = 2 SECONDS,
		TALK_ACTOR(actor("Мех 1 - 3-1-4"), "Прочь с дороги..."),
		MOVE_ACTOR(actor("Мех 1 - 3-1-4"), EAST) = 4 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/s2ep3sc5)
	)

/datum/modular_cutscene/s2ep3sc5/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 3-1 - Кадр 5"),
		ADD_SCREEN(/cinema_borders),
		SHIFT_ACTOR(actor("Пилот Восхождения - 3-1-5"), 0, 0, 1 SECONDS, SINE_EASING|EASE_OUT, null),
		TALK_ACTOR(actor("Пилот Восхождения - 3-1-5"), "!угрожающе шипит.") = 2 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/s2ep3sc6)
	)

/datum/modular_cutscene/s2ep3sc6/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 3-1 - Кадр 6"),
		ADD_SCREEN(/cinema_borders),
		TALK_ACTOR(actor("Эмми - В мехе"), "!кладёт руку на гашетку.") = 2 SECONDS,
		TALK_ACTOR(actor("Эмми - В мехе"), "Я ведь с тобой говорю...") = 4 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/s2ep3sc7)
	)

/datum/modular_cutscene/s2ep3sc7/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 3-1 - Кадр 7"),
		ADD_SCREEN(/cinema_borders),
		TALK_ACTOR(actor("Мех 1 - 3-1-4"), "СВОЛОЧЬ!!!"),
		PLAY_SOUND(sound('sound/machines/thruster.ogg', volume = 10), null),
		MOVE_ACTOR(actor("Мех 1 - 3-1-4"), EAST),
		MOVE_ACTOR(actor("Восхожденец 2 - 3-1-4"), WEST) = 0.2 SECONDS,
		MOVE_ACTOR(actor("Мех 1 - 3-1-4"), EAST),
		MOVE_ACTOR(actor("Восхожденец 2 - 3-1-4"), WEST) = 0.2 SECONDS,

		SHIFT_ACTOR(actor("Восхожденец 2 - 3-1-4"), -15, -32, 0.5 SECONDS, SINE_EASING|EASE_IN, null),
		SHIFT_ACTOR(actor("Мех 1 - 3-1-4"), 20, 32, 0.5 SECONDS, SINE_EASING|EASE_IN, null) = 0.3 SECONDS,
		PLAY_SOUND(sound('sound/weapons/anime_sword.wav', volume = 10), null),
		CREATE_SPARK(actor("Восхожденец 2 - 3-1-4")),
		CREATE_SPARK(actor("Мех 1 - 3-1-4")) = 0.1 SECONDS,

		ADD_SCREEN(/blackout) = 2 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5), null) = 2 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/s2ep3sc8)
	)

/datum/modular_cutscene/s2ep3sc8/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 3-1 - Кадр 8"),
		ADD_SCREEN(/blackout) = 2 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5), null),
		TALK_ACTOR(actor("Четвёртая - 3-1-8"), "Просыпайся, соня-я~...") = 4 SECONDS,
		REMOVE_SCREEN(/blackout, 0),
		ADD_SCREEN(/cinema_borders),
		TALK_ACTOR(actor("Эмми - 3-1-8"), "!тяжело дышит.") = 2 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5), null) = 4 SECONDS,
		TALK_ACTOR(actor("Голос 1 - 3-1-8"), "Скорее! Доставайте её оттуда!") = 4 SECONDS,
		TURN_ACTOR(actor("Эмми - 3-1-8"), NORTH),
		TALK_ACTOR(actor("Эмми - 3-1-8"), "!стягивает с себя шлем."),
		TALK_ACTOR(actor("Голос 2 - 3-1-8"), "Кто взял сварку?!") = 2 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5), null),
		CHANGE_ACTOR_VISUALS(actor("Эмми - 3-1-8"), "EP3 PAGE 1 - 4"),
		TURN_ACTOR(actor("Эмми - 3-1-8"), SOUTH),
		TALK_ACTOR(actor("Голос 3 - 3-1-8"), "Здесь! Она у меня!") = 4 SECONDS,
		TALK_ACTOR(actor("Эмми - 3-1-8"), "!закидывает голову назад, закрывая глаза."),
		TALK_ACTOR(actor("Голос 2 - 3-1-8"), "Нас точно отправят в штрафбат...") = 2 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5), null) = 4 SECONDS,
		TALK_ACTOR(actor("Голос 2 - 3-1-8"), "ЧТО ТАМ С ПОКАЗАТЕЛЯМИ?!!!") = 2 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/s2ep3sc9),
	)

/datum/modular_cutscene/s2ep3sc9/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 3-1 - Кадр 9"),
		ADD_SCREEN(/cinema_borders),
		MOVE_ACTOR(actor("Другой солдат - 3-1-9"), SOUTH),
		TALK_ACTOR(actor("Солдат - 3-1-9"), "Держись! Ещё немного и мы тебя вытащим!") = 2 SECONDS,
		MOVE_ACTOR(actor("Другой солдат - 3-1-9"), SOUTH),
		ADD_SCREEN(/blackout/animated_better) = 1 SECONDS,
		MOVE_ACTOR(actor("Инженер - 3-1-9"), NORTH) = 0.2 SECONDS,
		TURN_ACTOR(actor("Инженер - 3-1-9"), EAST),
		TALK_ACTOR(actor("Инженер - 3-1-9"), "Да она в отключке, кому ты кричишь!?") = 2 SECONDS,
		CALL_GLOB(credits_name) = 10 SECONDS,
		CALL_GLOB(manticore_day) = 2 SECONDS,
		CALL_GLOB(manticore_day2) = 4 SECONDS,
		PLAY_SOUND(sound('sound/effects/3beep.ogg', volume = 5), null) = 2 SECONDS,
		PLAY_SOUND(sound('sound/effects/3beep.ogg', volume = 10), null) = 2 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/s2ep3sc10),
	)

/datum/modular_cutscene/s2ep3sc10/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 3-1 - Кадр 10"),
		ADD_SCREEN(/blackout),
		ADD_SCREEN(/cinema_borders),
		PLAY_SOUND(sound('sound/effects/3beep.ogg', volume = 20), null),
		CHANGE_ACTOR_MATRIX(actor("Эмми - 3-1-10"), 90, 0, null, null),
		TALK_ACTOR(actor("Четвёртая - 3-1-10"), "Я серьёзно. Ты вставать собираешься?") = 2 SECONDS,
		PLAY_SOUND(sound('sound/effects/3beep.ogg', volume = 30), null) = 2 SECONDS,
		REMOVE_SCREEN(/blackout, 2 SECONDS) = 2 SECONDS,
		PLAY_SOUND(sound('sound/weapons/punchmiss.ogg', volume = 5), null),
		SHIFT_ACTOR(actor("Четвёртая - 3-1-10"), -10, 17, 0.5 SECONDS, SINE_EASING|EASE_IN, ANIMATION_PARALLEL),
		CHANGE_ACTOR_MATRIX(actor("Четвёртая - 3-1-10"), -35, 0.5 SECONDS, SINE_EASING|EASE_IN, ANIMATION_PARALLEL) = 2 SECONDS,
		TALK_ACTOR(actor("Четвёртая - 3-1-10"), "!недовольно щёлкает пальцами."),
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/Tekkadan.ogg', volume = 30), null),
		TALK_ACTOR(actor("Четвёртая - 3-1-10"), "Ау? Хьюстон? У нас проблемы?") = 2 SECONDS,
		TURN_ACTOR(actor("Четвёртая - 3-1-10"), NORTH),
		PLAY_SOUND(sound('sound/weapons/punchmiss.ogg', volume = 5), null),
		SHIFT_ACTOR(actor("Четвёртая - 3-1-10"), -24, -10, 1 SECONDS, SINE_EASING|EASE_IN, ANIMATION_PARALLEL),
		CHANGE_ACTOR_MATRIX(actor("Четвёртая - 3-1-10"), 0, 1 SECONDS, SINE_EASING|EASE_IN, ANIMATION_PARALLEL),
		TALK_ACTOR(actor("Эмми - 3-1-10"), "!морщится.") = 4 SECONDS,
		TURN_ACTOR(actor("Эмми - 3-1-10"), SOUTH),
		CHANGE_ACTOR_VISUALS(actor("Эмми - 3-1-10"), "EP3 PAGE 1 - 6"),
		CHANGE_ACTOR_MATRIX(actor("Эмми - 3-1-10"), 0, 1 SECOND, SINE_EASING|EASE_IN, null) = 2 SECONDS,
		PLAY_SOUND(sound('mods/emote_panel/sound/yawn_female_2.ogg', volume = 5), null),
		TALK_ACTOR(actor("Эмми - 3-1-10"), "!широко зевает.") = 2 SECONDS,
		PLAY_SOUND(sound('sound/weapons/punchmiss.ogg', volume = 5), null),
		TURN_ACTOR(actor("Четвёртая - 3-1-10"), WEST),
		SHIFT_ACTOR(actor("Четвёртая - 3-1-10"), 11, -5, 0.5 SECONDS, SINE_EASING|EASE_OUT, null),
		TURN_ACTOR(actor("Эмми - 3-1-10"), EAST) = 2 SECONDS,
		TALK_ACTOR(actor("Эмми - 3-1-10"), "...ты закончила?"),
		TALK_ACTOR(actor("Четвёртая - 3-1-10"), "!скрестила руки на груди.") = 4 SECONDS,
		TALK_ACTOR(actor("Четвёртая - 3-1-10"), "На часах уже девять-тридцать. Ты и это собрание собралась пропустить?") = 6 SECONDS,
		TALK_ACTOR(actor("Эмми - 3-1-10"), "!вздыхает, медленно сползая с кровати."),
		PLAY_SOUND(sound('sound/effects/rustle4.ogg', volume = 50), null),
		SHIFT_ACTOR(actor("Эмми - 3-1-10"), 0, 0, 1 SECONDS, SINE_EASING|EASE_OUT, null) = 0.8 SECONDS,
		ADD_SCREEN(/blackout) = 1 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/s2ep3sc11),
	)

/datum/modular_cutscene/s2ep3sc11/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 3-1 - Кадр 11"),
		ADD_SCREEN(/cinema_borders),
		CHANGE_ACTOR_VISUALS(actor("Эмми - 3-1-10"), "EP3 PAGE 1 - 8"),
		MOVE_ACTOR(actor("Четвёртая - 3-1-10"), SOUTH),
		SHIFT_ACTOR(actor("Четвёртая - 3-1-10"), 0, 0, 0, null, null),
		TURN_ACTOR(actor("Четвёртая - 3-1-10"), EAST),
		MOVE_ACTOR(actor("Эмми - 3-1-10"), EAST),
		MOVE_ACTOR(actor("Эмми - 3-1-10"), EAST) = 1 SECONDS,
		TALK_ACTOR(actor("Эмми - 3-1-10"), "!поправляет комбинезон.") = 1 SECONDS,
		MOVE_ACTOR(actor("Эмми - 3-1-10"), EAST) = 1 SECONDS,
		MOVE_ACTOR(actor("Эмми - 3-1-10"), EAST),
		MOVE_ACTOR(actor("Эмми - 3-1-10"), EAST),
		TURN_ACTOR(actor("Эмми - 3-1-10"), NORTH) = 2 SECONDS,
		SHIFT_ACTOR(actor("Эмми - 3-1-10"), 10, 0, 1 SECONDS, SINE_EASING|EASE_IN, null),
		TALK_ACTOR(actor("Эмми - 3-1-10"), "!слегка встряхивает лохматые волосы.") = 6 SECONDS,
		SHIFT_ACTOR(actor("Эмми - 3-1-10"), 0, 0, 0, null, null),
		CHANGE_ACTOR_VISUALS(actor("Эмми - 3-1-10"), "EP3 PAGE 1 - 9"),
		TURN_ACTOR(actor("Эмми - 3-1-10"), EAST),
		MOVE_ACTOR(actor("Эмми - 3-1-10"), WEST),
		MOVE_ACTOR(actor("Эмми - 3-1-10"), WEST),
		MOVE_ACTOR(actor("Эмми - 3-1-10"), SOUTH),
		MOVE_ACTOR(actor("Эмми - 3-1-10"), SOUTH),
		PLAY_SOUND(sound('sound/items/drink.ogg', volume = 30), null),
		TALK_ACTOR(actor("Эмми - 3-1-10"), "!делает глоток кофе.") = 2 SECONDS,
		MOVE_ACTOR(actor("Четвёртая - 3-1-10"), EAST) = 1 SECONDS,
		SHIFT_ACTOR(actor("Четвёртая - 3-1-10"), 22, 0, 1 SECONDS, SINE_EASING|EASE_IN, null) = 2 SECONDS,
		TALK_ACTOR(actor("Четвёртая - 3-1-10"), "Тебе ещё не надоело-...") = 2 SECONDS,
		TALK_ACTOR(actor("Эмми - 3-1-10"), "...таращиться?") = 4 SECONDS,
		MOVE_ACTOR(actor("Четвёртая - 3-1-10"), EAST),
		TURN_ACTOR(actor("Четвёртая - 3-1-10"), SOUTH),
		PLAY_SOUND(sound('sound/weapons/punchmiss.ogg', volume = 5), null),
		SHIFT_ACTOR(actor("Четвёртая - 3-1-10"), 32, 32, 2 SECONDS, SINE_EASING|EASE_IN, ANIMATION_PARALLEL),
		CHANGE_ACTOR_MATRIX(actor("Четвёртая - 3-1-10"), 180, 2 SECONDS, SINE_EASING|EASE_OUT, ANIMATION_PARALLEL),
		TALK_ACTOR(actor("Четвёртая - 3-1-10"), "Типа того. Ты делаешь это...каждый день.") = 6 SECONDS,
		PLAY_SOUND(sound('packs/infinity/sound/voice/giggle_female_3.ogg', volume = 30), null),
		PLAY_SOUND(sound('sound/items/drink.ogg', volume = 30), null),
		TALK_ACTOR(actor("Эмми - 3-1-10"), "!посмеивается, делая ещё один сёрб."),
		TALK_ACTOR(actor("Эмми - 3-1-10"), "Ритуал у меня такой. Пять минут, каждое утро...") = 4 SECONDS,
		TALK_ACTOR(actor("Эмми - 3-1-10"), "...кофе с добавлением щепотки несбыточных мечтаний.") = 6 SECONDS,
		MOVE_ACTOR(actor("Четвёртая - 3-1-10"), EAST),
		TURN_ACTOR(actor("Четвёртая - 3-1-10"), WEST),
		PLAY_SOUND(sound('sound/weapons/punchmiss.ogg', volume = 5), null),
		SHIFT_ACTOR(actor("Четвёртая - 3-1-10"), 32, 0, 2 SECONDS, SINE_EASING|EASE_IN, ANIMATION_PARALLEL),
		CHANGE_ACTOR_MATRIX(actor("Четвёртая - 3-1-10"), 0, 2 SECONDS, SINE_EASING|EASE_OUT, ANIMATION_PARALLEL) = 4 SECONDS,
		TALK_ACTOR(actor("Четвёртая - 3-1-10"), "Звучишь жалко.") = 4 SECONDS,
		PLAY_SOUND(sound('mods/emote_panel/sound/sigh_female.ogg', volume = 30), null),
		TALK_ACTOR(actor("Эмми - 3-1-10"), "!вздыхает.") = 2 SECONDS,
		TALK_ACTOR(actor("Эмми - 3-1-10"), "Иначе и не пыталась.") = 4 SECONDS,
		PLAY_SOUND(sound('packs/infinity/sound/items/drinking_after.ogg', volume = 10), null),
		TALK_ACTOR(actor("Эмми - 3-1-10"), "!бросает стакан за спину.") = 4 SECONDS,

		MOVE_ACTOR(actor("Эмми - 3-1-10"), EAST),
		MOVE_ACTOR(actor("Эмми - 3-1-10"), EAST),
		CHANGE_ACTOR_VISUALS(actor("Эмми - 3-1-10"), "EP3 PAGE 1 - 10"),

		MOVE_ACTOR(actor("Четвёртая - 3-1-10"), SOUTH),
		TURN_ACTOR(actor("Четвёртая - 3-1-10"), EAST),
		SHIFT_ACTOR(actor("Четвёртая - 3-1-10"), -20, -20, 0, null, ANIMATION_PARALLEL),
		CHANGE_ACTOR_MATRIX(actor("Четвёртая - 3-1-10"), -30, 0, null, ANIMATION_PARALLEL) = 1 SECONDS,

		SHIFT_ACTOR(actor("Эмми - 3-1-10"), 10, 0, 0.5 SECONDS, SINE_EASING|EASE_OUT, null),
		PLAY_SOUND(sound('sound/effects/tape.ogg', volume = 50), null),
		TALK_ACTOR(actor("Эмми - 3-1-10"), "!фиксирует бинт на руке.") = 4 SECONDS,

		MOVE_ACTOR(actor("Эмми - 3-1-10"), NORTH),
		MOVE_ACTOR(actor("Эмми - 3-1-10"), NORTH),
		TURN_ACTOR(actor("Эмми - 3-1-10"), NORTH),
		SHIFT_ACTOR(actor("Эмми - 3-1-10"), 0, 0, 0, null, null),
		CHANGE_ACTOR_VISUALS(actor("Эмми - 3-1-10"), "EP3 PAGE 1 - 11"),

		MOVE_ACTOR(actor("Четвёртая - 3-1-10"), NORTH),
		MOVE_ACTOR(actor("Четвёртая - 3-1-10"), NORTH),
		TURN_ACTOR(actor("Четвёртая - 3-1-10"), NORTH),
		SHIFT_ACTOR(actor("Четвёртая - 3-1-10"), 0, -32, 0, null, ANIMATION_PARALLEL),
		CHANGE_ACTOR_MATRIX(actor("Четвёртая - 3-1-10"), 180, 0, null, ANIMATION_PARALLEL) = 1 SECONDS,

		SHIFT_ACTOR(actor("Четвёртая - 3-1-10"), 0, -48, 1 SECONDS, SINE_EASING|EASE_OUT, null),
		PLAY_SOUND(sound('sound/effects/rustle2.ogg', volume = 50), null),
		TALK_ACTOR(actor("Эмми - 3-1-10"), "!натягивает рукав бомбера.") = 6 SECONDS,

		MOVE_ACTOR(actor("Четвёртая - 3-1-10"), EAST),
		MOVE_ACTOR(actor("Четвёртая - 3-1-10"), SOUTH),
		MOVE_ACTOR(actor("Четвёртая - 3-1-10"), SOUTH),
		TURN_ACTOR(actor("Четвёртая - 3-1-10"), WEST),
		SHIFT_ACTOR(actor("Четвёртая - 3-1-10"), 0, 0, 0, null, ANIMATION_PARALLEL),
		CHANGE_ACTOR_MATRIX(actor("Четвёртая - 3-1-10"), 0, 0, null, ANIMATION_PARALLEL),

		TURN_ACTOR(actor("Эмми - 3-1-10"), WEST),
		MOVE_ACTOR(actor("Эмми - 3-1-10"), WEST),
		MOVE_ACTOR(actor("Эмми - 3-1-10"), WEST),
		CHANGE_ACTOR_VISUALS(actor("Эмми - 3-1-10"), "Current"),
		PLAY_SOUND(sound('sound/effects/buckle.ogg', volume = 50), null),
		TALK_ACTOR(actor("Эмми - 3-1-10"), "!защёлкивает ремень шлема.") = 4 SECONDS,

		TURN_ACTOR(actor("Эмми - 3-1-10"), SOUTH) = 2 SECONDS,
		TALK_ACTOR(actor("Эмми - 3-1-10"), "Ты в нём точно дыру просверлишь.") = 4 SECONDS,

		TURN_ACTOR(actor("Эмми - 3-1-10"), WEST),
		MOVE_ACTOR(actor("Эмми - 3-1-10"), WEST),

		TALK_ACTOR(actor("Четвёртая - 3-1-10"), "!бурчит.") = 2 SECONDS,
		TALK_ACTOR(actor("Четвёртая - 3-1-10"), "Поумничай ещё."),
		MOVE_ACTOR(actor("Эмми - 3-1-10"), WEST) = 1.5 SECONDS,

		SHIFT_ACTOR(actor("Четвёртая - 3-1-10"), -96, 48, 4 SECONDS, SINE_EASING|EASE_IN, ANIMATION_PARALLEL),
		CHANGE_ACTOR_MATRIX(actor("Четвёртая - 3-1-10"), -65, 4 SECONDS, SINE_EASING|EASE_OUT, ANIMATION_PARALLEL) = 2 SECONDS,

		ADD_SCREEN(/blackout),
		CALL_GLOB(episode3_name),
		CALL_GLOB(episode3_name2) = 10 SECONDS,
		RETURN_VIEWERS
	)
