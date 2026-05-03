/obj/effect/cutscene_camera/s2ep5sc1
	camera_id = "Сцена 5-1 - Кадр 1"

/obj/effect/cutscene_camera/s2ep5sc2
	camera_id = "Сцена 5-1 - Кадр 2"

/obj/effect/cutscene_camera/s2ep5sc3
	camera_id = "Сцена 5-1 - Кадр 3"

/proc/s2ep5sc1_screentext()
	var/message = {"<span style="color: yellow;">Амелия</span>: Кажется..."}

	var/obj/screen/player_message/maintext = new /obj/screen/player_message()
	maintext.plane = HUD_PLANE
	maintext.layer = HUD_ABOVE_HUD_LAYER
	maintext.maptext_x = 0
	maintext.maptext_y = -310

	for(var/client/M in GLOB.clients)
		M.screen += maintext
		maintext.set_text(message, COLOR_WHITE)

	spawn(3.5 SECONDS)
		message = {"<span style="color: yellow;">Амелия</span>: Кажется...всё."}
		maintext.set_text(message, COLOR_WHITE)

	spawn(8 SECONDS)
		message = {"<span style="color: yellow;">Амелия</span>: Попробуй встать."}
		maintext.set_text(message, COLOR_WHITE)

	spawn(14 SECONDS)

		for(var/client/M in GLOB.clients)
			for(var/obj/screen/messages in M.screen)
				if(istype(messages, /obj/screen/player_message))
					M.screen -= messages
					qdel(messages)

/proc/s2ep5sc2_screentext()
	var/message = {"<span style="color: yellow;">Амелия</span>: Ну?"}

	var/obj/screen/player_message/maintext = new /obj/screen/player_message()
	maintext.plane = HUD_PLANE
	maintext.layer = HUD_ABOVE_HUD_LAYER
	maintext.maptext_x = 0
	maintext.maptext_y = -310

	for(var/client/M in GLOB.clients)
		M.screen += maintext
		maintext.set_text(message, COLOR_WHITE)

	spawn(2 SECONDS)
		message = {"<span style="color: yellow;">Амелия</span>: Ну? Что скажешь?"}
		maintext.set_text(message, COLOR_WHITE)

	spawn(7 SECONDS)
		message = ""
		maintext.set_text(message, COLOR_WHITE)

	spawn(16 SECONDS)
		message = {"<span style="color: yellow;">Персиваль</span>: Швы <b>ЯВНО</b> могли быть и ровнее."}
		maintext.set_text(message, COLOR_WHITE)

	spawn(22 SECONDS)
		message = {"<span style="color: yellow;">Амелия</span>: Ампер мог бы и <b>ПОУБАВИТЬ</b> твою претенциозность."}
		maintext.set_text(message, COLOR_WHITE)

	spawn(26 SECONDS)
		message = {"<span style="color: yellow;">Персиваль</span>: <b>Эй!</b>"}
		maintext.set_text(message, COLOR_WHITE)

	spawn(27 SECONDS)
		message = {"<span style="color: yellow;">Персиваль</span>: <b>Эй!</b> Звучит неприятно, вообще-то."}
		maintext.set_text(message, COLOR_WHITE)

	spawn(33 SECONDS)
		message = {"<span style="color: yellow;">Персиваль</span>: Претенциозность - это неотъемлемая часть моей модели личности!"}
		maintext.set_text(message, COLOR_WHITE)

	spawn(40 SECONDS)
		message = {"<span style="color: yellow;">Персиваль</span>: Да и вообще, давно я стал твоим тамагочи?"}
		maintext.set_text(message, COLOR_WHITE)

	spawn(44 SECONDS)
		message = {"<span style="color: yellow;">Амелия</span>: Я \"кормлю\", чиню, и одеваю тебя."}
		maintext.set_text(message, COLOR_WHITE)

	spawn(50 SECONDS)

		for(var/client/M in GLOB.clients)
			for(var/obj/screen/messages in M.screen)
				if(istype(messages, /obj/screen/player_message))
					M.screen -= messages
					qdel(messages)

/proc/fds2ep5_cutscene1()
	start_cutscene(/datum/modular_cutscene/s2ep5sc1)

/datum/modular_cutscene/s2ep5sc1/setup_actions(...)
	actions = list(
		ADD_SCREEN(/blackout/animated_better) = 4 SECONDS,
		MOVE_CAMERA(0, -1, 0, null),

		EASY_TRANSFORM_ACTOR(actor("Комп 5"), 7, 0),
		CHANGE_ACTOR_LAYER(actor("Комп 5"), 4.05),

		EASY_TRANSFORM_ACTOR(actor("Глаза Амелии - 5-1-1"), 4, 0),
		CHANGE_ACTOR_LAYER(actor("Глаза Амелии - 5-1-1"), 4.07),

		EASY_TRANSFORM_ACTOR(actor("Амелия - 5-1-1"), 9, 0),
		CHANGE_ACTOR_LAYER(actor("Амелия - 5-1-1"), 4.06),

		EASY_TRANSFORM_ACTOR(actor("Стена 5"), 15, 0),
		CHANGE_ACTOR_LAYER(actor("Стена 5"), 4.01),

		EASY_TRANSFORM_ACTOR(actor("Стул 5"), 8, 0),
		CHANGE_ACTOR_LAYER(actor("Стул 5"), 4.02),

		EASY_TRANSFORM_ACTOR(actor("Перси - 5-1-1"), 9, 5),
		CHANGE_ACTOR_LAYER(actor("Перси - 5-1-1"), 4.03),

		EASY_TRANSFORM_ACTOR(actor("Стол 5"), 7, 0),
		CHANGE_ACTOR_LAYER(actor("Стол 5"), 4.04),

		REMOVE_SCREEN(/blackout/animated_better, 1 SECONDS),
		TP_CAMERA("Сцена 5-1 - Кадр 1"),
		ADD_SCREEN(/cinema_borders) = 0.5 SECONDS,

		CALL_GLOB(s2ep5sc1_screentext),
		TALK_ACTOR(actor("Амелия - 5-1-1"), "Кажется..."),

		SHIFT_ACTOR(actor("Амелия - 5-1-1"), 15, 0, 1 SECONDS, SINE_EASING|EASE_OUT, null),
		CHANGE_ACTOR_VISUALS(actor("Амелия - 5-1-1"), "EP5 PAGE 1 - 1NOEYES"),

		SHIFT_ACTOR(actor("Глаза Амелии - 5-1-1"), 32, 13, 1 SECONDS, SINE_EASING|EASE_OUT, null) = 0.5 SECONDS,

		PLAY_SOUND(sound('sound/machines/keyboard/keystroke2.ogg', volume = 10)),
		CHANGE_ACTOR_VISIBILITY(actor("Клава 1"), 255, 1 SECONDS, LINEAR_EASING, null) = 0.5 SECONDS,

		PLAY_SOUND(sound('sound/machines/keyboard/keystroke4.ogg', volume = 10)),
		CHANGE_ACTOR_VISIBILITY(actor("Клава 4"), 255, 0.5 SECONDS, LINEAR_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Клава 1"), 0, 1 SECONDS, LINEAR_EASING, null) = 0.5 SECONDS,

		PLAY_SOUND(sound('sound/machines/keyboard/keystroke1.ogg', volume = 10)),
		CHANGE_ACTOR_VISIBILITY(actor("Клава 2"), 255, 0.5 SECONDS, LINEAR_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Клава 4"), 0, 1 SECONDS, LINEAR_EASING, null) = 0.5 SECONDS,

		PLAY_SOUND(sound('sound/machines/keyboard/keystroke4.ogg', volume = 10)),
		CHANGE_ACTOR_VISIBILITY(actor("Клава 1"), 255, 0.5 SECONDS, LINEAR_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Клава 2"), 0, 1 SECONDS, LINEAR_EASING, null) = 0.5 SECONDS,

		PLAY_SOUND(sound('sound/machines/keyboard/keystroke3.ogg', volume = 10)),
		CHANGE_ACTOR_VISIBILITY(actor("Клава 3"), 255, 0.5 SECONDS, LINEAR_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Клава 1"), 0, 1 SECONDS, LINEAR_EASING, null) = 0.5 SECONDS,

		CHANGE_ACTOR_VISIBILITY(actor("Клава 3"), 0, 0.5 SECONDS, LINEAR_EASING, null),

		SHIFT_ACTOR(actor("Глаза Амелии - 5-1-1"), 37, 12, 0.5 SECONDS, LINEAR_EASING, null),
		EASY_TRANSFORM_ACTOR(actor("Глаза Амелии - 5-1-1"), 4, 2),
		EASY_TRANSFORM_ACTOR(actor("Амелия - 5-1-1"), 9, 1) = 0.05 SECONDS,
		EASY_TRANSFORM_ACTOR(actor("Глаза Амелии - 5-1-1"), 4, 4),
		EASY_TRANSFORM_ACTOR(actor("Амелия - 5-1-1"), 9, 2) = 0.05 SECONDS,
		EASY_TRANSFORM_ACTOR(actor("Глаза Амелии - 5-1-1"), 4, 6),
		EASY_TRANSFORM_ACTOR(actor("Амелия - 5-1-1"), 9, 3) = 0.05 SECONDS,
		EASY_TRANSFORM_ACTOR(actor("Глаза Амелии - 5-1-1"), 4, 8),
		EASY_TRANSFORM_ACTOR(actor("Амелия - 5-1-1"), 9, 4) = 0.05 SECONDS,
		EASY_TRANSFORM_ACTOR(actor("Амелия - 5-1-1"), 9, 5) = 0.7 SECONDS,
		TALK_ACTOR(actor("Амелия - 5-1-1"), "...всё.") = 0.3 SECONDS,

		TURN_ACTOR(actor("Глаза Амелии - 5-1-1"), NORTH),
		CHANGE_ACTOR_VISUALS(actor("Амелия - 5-1-1"), "EP5 PAGE 1 - 2NOEYES") = 2 SECONDS,

		CHANGE_ACTOR_VISIBILITY(actor("Бзз"), 255, 0.3 SECONDS, LINEAR_EASING, null) = 0.5 SECONDS,
		CHANGE_ACTOR_VISIBILITY(actor("Бзз"), 0, 0.8 SECONDS, LINEAR_EASING, null),

		PLAY_SOUND(sound('sound/mecha/powerup.ogg', volume = 20)),
		CHANGE_ACTOR_VISUALS(actor("Перси - 5-1-1"), "EP5 PAGE 1 - 2") = 2 SECONDS,
		PLAY_SOUND(sound('sound/mecha/mech-shutdown.ogg', volume = 30)),

		SHIFT_ACTOR(actor("Перси - 5-1-1"), 0, -29, 1 SECONDS, SINE_EASING|EASE_IN, null),
		EASY_TRANSFORM_ACTOR(actor("Перси - 5-1-1"), 9, 4) = 0.05 SECONDS,
		EASY_TRANSFORM_ACTOR(actor("Перси - 5-1-1"), 9, 3) = 0.05 SECONDS,
		EASY_TRANSFORM_ACTOR(actor("Перси - 5-1-1"), 9, 2) = 0.05 SECONDS,
		EASY_TRANSFORM_ACTOR(actor("Перси - 5-1-1"), 9, 1) = 0.05 SECONDS,
		EASY_TRANSFORM_ACTOR(actor("Перси - 5-1-1"), 9, 0) = 0.05 SECONDS,

		SHIFT_ACTOR(actor("Амелия - 5-1-1"), 5, 0, 0.5 SECONDS, SINE_EASING|EASE_IN, null),
		CHANGE_ACTOR_VISUALS(actor("Амелия - 5-1-1"), "EP5 PAGE 1 - 3"),

		EASY_TRANSFORM_ACTOR(actor("Амелия - 5-1-1"), 9, 5) = 0.05 SECONDS,
		EASY_TRANSFORM_ACTOR(actor("Амелия - 5-1-1"), 9, 4) = 0.05 SECONDS,
		EASY_TRANSFORM_ACTOR(actor("Амелия - 5-1-1"), 9, 3) = 0.05 SECONDS,
		EASY_TRANSFORM_ACTOR(actor("Амелия - 5-1-1"), 9, 2) = 0.05 SECONDS,
		EASY_TRANSFORM_ACTOR(actor("Амелия - 5-1-1"), 9, 1) = 0.05 SECONDS,
		EASY_TRANSFORM_ACTOR(actor("Амелия - 5-1-1"), 9, 0),
		TALK_ACTOR(actor("Амелия - 5-1-1"), "Попробуй встать.") = 4 SECONDS,

		TURN_ACTOR(actor("Амелия - 5-1-1"), NORTH),
		SHIFT_ACTOR(actor("Амелия - 5-1-1"), 5, -10, 0.5 SECONDS, SINE_EASING|EASE_IN, null),

		PLAY_SOUND(sound('sound/mecha/mechstep03.ogg', volume = 10)),
		SHIFT_ACTOR(actor("Перси - 5-1-1"), -25, 5, 0.5 SECONDS, SINE_EASING|EASE_IN, null),
		CHANGE_ACTOR_VISUALS(actor("Перси - 5-1-1"), "EP5 PAGE 1 - 3") = 1 SECONDS,
		PLAY_SOUND(sound('sound/mecha/mechmove02.ogg', volume = 10)),
		CHANGE_ACTOR_VISUALS(actor("Перси - 5-1-1"), "EP5 PAGE 1 - 4") = 2 SECONDS,

		START_CUTSCENE(/datum/modular_cutscene/s2ep5sc2)
	)

/datum/modular_cutscene/s2ep5sc2/setup_actions(...)
	actions = list(

		EASY_TRANSFORM_ACTOR(actor("Комп 5-2"), 5, 0),
		CHANGE_ACTOR_LAYER(actor("Комп 5-2"), 4.05),

		EASY_TRANSFORM_ACTOR(actor("Глаза Амелии - 5-1-2"), 3, 0),
		CHANGE_ACTOR_LAYER(actor("Глаза Амелии - 5-1-2"), 4.07),

		EASY_TRANSFORM_ACTOR(actor("Амелия - 5-1-2"), 7, 0),
		CHANGE_ACTOR_LAYER(actor("Амелия - 5-1-2"), 4.06),

		EASY_TRANSFORM_ACTOR(actor("Стена 5-2"), 15, 0),
		CHANGE_ACTOR_LAYER(actor("Стена 5-2"), 4.01),

		EASY_TRANSFORM_ACTOR(actor("Стул 5-2"), 7, 0),
		CHANGE_ACTOR_LAYER(actor("Стул 5-2"), 4.02),

		EASY_TRANSFORM_ACTOR(actor("Перси - 5-1-2"), 8, 0),
		CHANGE_ACTOR_LAYER(actor("Перси - 5-1-2"), 4.06),

		EASY_TRANSFORM_ACTOR(actor("Стол 5-2"), 10, 0),
		CHANGE_ACTOR_LAYER(actor("Стол 5-2"), 4.04) = 0.1 SECONDS,

		TP_CAMERA("Сцена 5-1 - Кадр 2"),
		MOVE_CAMERA(-2, -2, 0, null),
		ADD_SCREEN(/cinema_borders) = 0.5 SECONDS,

		CALL_GLOB(s2ep5sc2_screentext),
		TALK_ACTOR(actor("Амелия - 5-1-2"), "Ну?") = 1 SECONDS,
		MOVE_ACTOR(actor("Перси - 5-1-2"), SOUTH),

		PLAY_SOUND(sound('sound/mecha/mechstep03.ogg', volume = 10)),

		CHANGE_ACTOR_VISUALS(actor("Перси - 5-1-2"), "EP5 PAGE 1 - 7") = 1 SECONDS,
		TALK_ACTOR(actor("Амелия - 5-1-2"), "Что скажешь?") = 1 SECONDS,

		SHIFT_ACTOR(actor("Амелия - 5-1-2"), -10, 0, 1 SECONDS, SINE_EASING|EASE_OUT, null),
		SHIFT_ACTOR(actor("Глаза Амелии - 5-1-2"), -23, 28, 1 SECONDS, SINE_EASING|EASE_OUT, null) = 2 SECONDS,

		PLAY_SOUND(sound('sound/mecha/mechmove02.ogg', volume = 10)),

		SHIFT_ACTOR(actor("Перси - 5-1-2"), -15, 0, 0.3 SECONDS, SINE_EASING|EASE_IN, null),
		CHANGE_ACTOR_VISUALS(actor("Перси - 5-1-2"), "EP5 PAGE 1 - 6") = 4 SECONDS,

		PLAY_SOUND(sound('sound/mecha/mechstep03.ogg', volume = 10)),

		MOVE_ACTOR(actor("Перси - 5-1-2"), SOUTH),
		TURN_ACTOR(actor("Перси - 5-1-2"), WEST) = 1 SECONDS,

		PLAY_SOUND(sound('sound/mecha/mechmove03.ogg', volume = 10)),

		SHIFT_ACTOR(actor("Перси - 5-1-2"), 0, 10, 0.3 SECONDS, SINE_EASING|EASE_IN, null),
		TURN_ACTOR(actor("Перси - 5-1-2"), NORTH),
		CHANGE_ACTOR_VISUALS(actor("Перси - 5-1-2"), "EP5 PAGE 1 - 8") = 4 SECONDS,

		CHANGE_ACTOR_VISUALS(actor("Перси - 5-1-2"), "EP5 PAGE 1 - 9") = 1 SECONDS,

		PLAY_SOUND(sound('sound/mecha/mechstep03.ogg', volume = 10)),

		SHIFT_ACTOR(actor("Перси - 5-1-2"), 5, -10, 0.3 SECONDS, SINE_EASING|EASE_OUT, null),
		CHANGE_ACTOR_VISUALS(actor("Перси - 5-1-2"), "EP5 PAGE 1 - 3"),
		MOVE_ACTOR(actor("Перси - 5-1-2"), EAST),
		TURN_ACTOR(actor("Перси - 5-1-2"), EAST) = 1 SECONDS,

		TALK_ACTOR(actor("Перси - 5-1-2"), "Швы ЯВНО могли быть и ровнее.") = 2 SECONDS,

		CHANGE_ACTOR_VISUALS(actor("Глаза Амелии - 5-1-2"), "Amelia Eyes - Pissed off") = 4 SECONDS,
		TALK_ACTOR(actor("Амелия - 5-1-2"), "Ампер мог бы и ПОУБАВИТЬ твою претенциозность.") = 4 SECONDS,

		PLAY_SOUND(sound('sound/mecha/mechmove03.ogg', volume = 10)),

		CHANGE_ACTOR_VISUALS(actor("Перси - 5-1-2"), "EP5 PAGE 1 - 10"),
		SHIFT_ACTOR(actor("Перси - 5-1-2"), 15, -10, 0.3 SECONDS, SINE_EASING|EASE_IN, null),
		MOVE_ACTOR(actor("Перси - 5-1-2"), EAST),
		TALK_ACTOR(actor("Перси - 5-1-2"), "Эй!") = 1 SECONDS,

		TALK_ACTOR(actor("Перси - 5-1-2"), "Звучит неприятно, вообще-то."),

		TURN_ACTOR(actor("Амелия - 5-1-2"), NORTH),
		SHIFT_ACTOR(actor("Амелия - 5-1-2"), -20, 0, 0.3 SECONDS, LINEAR_EASING, null),
		TURN_ACTOR(actor("Глаза Амелии - 5-1-2"), NORTH),
		SHIFT_ACTOR(actor("Глаза Амелии - 5-1-2"), -33, 28, 0.3 SECONDS, LINEAR_EASING, null) = 0.5 SECONDS,

		PLAY_SOUND(sound('sound/machines/keyboard/keystroke3.ogg', volume = 10)),
		CHANGE_ACTOR_VISIBILITY(actor("Клава 5"), 255, 1 SECONDS, LINEAR_EASING, null) = 0.5 SECONDS,

		PLAY_SOUND(sound('sound/machines/keyboard/keystroke1.ogg', volume = 10)),
		CHANGE_ACTOR_VISIBILITY(actor("Клава 7"), 255, 0.5 SECONDS, LINEAR_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Клава 5"), 0, 1 SECONDS, LINEAR_EASING, null) = 0.5 SECONDS,

		PLAY_SOUND(sound('sound/machines/keyboard/keystroke4.ogg', volume = 10)),
		CHANGE_ACTOR_VISIBILITY(actor("Клава 6"), 255, 0.5 SECONDS, LINEAR_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Клава 7"), 0, 1 SECONDS, LINEAR_EASING, null) = 0.5 SECONDS,

		PLAY_SOUND(sound('sound/machines/keyboard/keystroke2.ogg', volume = 10)),
		CHANGE_ACTOR_VISIBILITY(actor("Клава 5"), 255, 0.5 SECONDS, LINEAR_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Клава 6"), 0, 1 SECONDS, LINEAR_EASING, null) = 0.5 SECONDS,

		CHANGE_ACTOR_VISIBILITY(actor("Клава 5"), 0, 1 SECONDS, LINEAR_EASING, null),

		SHIFT_ACTOR(actor("Перси - 5-1-2"), 10, -10, 0.3 SECONDS, SINE_EASING|EASE_OUT, null),
		CHANGE_ACTOR_VISUALS(actor("Перси - 5-1-2"), "EP5 PAGE 1 - 11") = 3.5 SECONDS,
		TALK_ACTOR(actor("Перси - 5-1-2"), "Претенциозность - это неотъемлемая часть моей модели личности!") = 2 SECONDS,

		PLAY_SOUND(sound('sound/machines/keyboard/keystroke4.ogg', volume = 10)),
		CHANGE_ACTOR_VISIBILITY(actor("Клава 7"), 255, 1 SECONDS, LINEAR_EASING, null) = 0.5 SECONDS,

		PLAY_SOUND(sound('sound/machines/keyboard/keystroke1.ogg', volume = 10)),
		CHANGE_ACTOR_VISIBILITY(actor("Клава 5"), 255, 0.5 SECONDS, LINEAR_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Клава 7"), 0, 1 SECONDS, LINEAR_EASING, null) = 0.5 SECONDS,

		PLAY_SOUND(sound('sound/machines/keyboard/keystroke4.ogg', volume = 10)),
		CHANGE_ACTOR_VISIBILITY(actor("Клава 7"), 255, 0.5 SECONDS, LINEAR_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Клава 5"), 0, 1 SECONDS, LINEAR_EASING, null) = 0.5 SECONDS,

		PLAY_SOUND(sound('sound/machines/keyboard/keystroke2.ogg', volume = 10)),
		CHANGE_ACTOR_VISIBILITY(actor("Клава 6"), 255, 0.5 SECONDS, LINEAR_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Клава 7"), 0, 1 SECONDS, LINEAR_EASING, null) = 0.5 SECONDS,

		CHANGE_ACTOR_VISIBILITY(actor("Клава 6"), 0, 1 SECONDS, LINEAR_EASING, null),

		PLAY_SOUND(sound('sound/mecha/mechmove02.ogg', volume = 10)),

		TURN_ACTOR(actor("Перси - 5-1-2"), NORTH),
		SHIFT_ACTOR(actor("Перси - 5-1-2"), 10, -15, 0.3 SECONDS, LINEAR_EASING, null) = 3 SECONDS,
		TALK_ACTOR(actor("Перси - 5-1-2"), "Да и вообще, давно я стал твоим тамагочи?"),

		CHANGE_ACTOR_VISUALS(actor("Амелия - 5-1-2"), "EP5 PAGE 1 - 5"),
		CHANGE_ACTOR_VISUALS(actor("Глаза Амелии - 5-1-2"), "Amelia Eyes - Looking away 2"),
		TURN_ACTOR(actor("Глаза Амелии - 5-1-2"), WEST) = 4 SECONDS,

		TALK_ACTOR(actor("Амелия - 5-1-2"), "Я \"кормлю\", чиню, и одеваю тебя."),
		CHANGE_ACTOR_VISUALS(actor("Глаза Амелии - 5-1-2"), "Amelia Eyes - Looking away 2ALT") = 6 SECONDS,

		START_CUTSCENE(/datum/modular_cutscene/s2ep5sc3)
	)

/datum/modular_cutscene/s2ep5sc3/setup_actions(...)
	actions = list(
		EASY_TRANSFORM_ACTOR(actor("Глаза Амелии - 5-1-3"), 6, 0),
		CHANGE_ACTOR_LAYER(actor("Глаза Амелии - 5-1-3"), 4.10),

		EASY_TRANSFORM_ACTOR(actor("Амелия - 5-1-3"), 10, 0),
		CHANGE_ACTOR_LAYER(actor("Амелия - 5-1-3"), 4.09),

		EASY_TRANSFORM_ACTOR(actor("Стена 5-3"), 15, 0),
		CHANGE_ACTOR_LAYER(actor("Стена 5-3"), 4.01),

		EASY_TRANSFORM_ACTOR(actor("Перси - 5-1-3"), 10, 0),
		CHANGE_ACTOR_LAYER(actor("Перси - 5-1-3"), 4.06),

		EASY_TRANSFORM_ACTOR(actor("Стол 5-3"), 15, 0),
		CHANGE_ACTOR_LAYER(actor("Стол 5-3"), 4.10) = 0.1 SECONDS,

		EASY_TRANSFORM_ACTOR(actor("Комп 5-3"), 7, 0),
		CHANGE_ACTOR_LAYER(actor("Комп 5-3"), 4.11),

		TP_CAMERA("Сцена 5-1 - Кадр 3"),
		MOVE_CAMERA(0, -1, 0, null),
		ADD_SCREEN(/cinema_borders) = 0.5 SECONDS,
	)
