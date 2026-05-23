/obj/effect/cutscene_camera/s2ep5sc1
	camera_id = "Сцена 5-1 - Кадр 1"

/obj/effect/cutscene_camera/s2ep5sc2
	camera_id = "Сцена 5-1 - Кадр 2"

/obj/effect/cutscene_camera/s2ep5sc3
	camera_id = "Сцена 5-1 - Кадр 3"

/obj/effect/cutscene_camera/s2ep5sc4
	camera_id = "Сцена 5-1 - Кадр 4"

/obj/effect/cutscene_camera/s2ep5sc5
	camera_id = "Сцена 5-1 - Кадр 5"

/obj/effect/cutscene_camera/s2ep5sc6
	camera_id = "Сцена 5-1 - Кадр 6"

/obj/effect/cutscene_camera/s2ep5sc7
	camera_id = "Сцена 5-1 - Кадр 7"

/obj/effect/cutscene_camera/s2ep5sc8
	camera_id = "Сцена 5-1 - Кадр 8"

/obj/effect/cutscene_camera/s2ep5sc9
	camera_id = "Сцена 5-1 - Кадр 9"

/obj/effect/cutscene_camera/s2ep5sc10
	camera_id = "Сцена 5-1 - Кадр 10"

/obj/effect/cutscene_camera/s2ep5sc11
	camera_id = "Сцена 5-1 - Кадр 11"

/obj/effect/cutscene_camera/s2ep5sc12
	camera_id = "Сцена 5-1 - Кадр 12"

/obj/effect/cutscene_camera/s2ep5sc13
	camera_id = "Сцена 5-1 - Кадр 13"

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

/proc/s2ep5sc3_screentext()
	var/message = {"<span style="color: yellow;">Амелия</span>: Пора смириться с реальностью, Кощей."}

	var/obj/screen/player_message/maintext = new /obj/screen/player_message()
	maintext.plane = HUD_PLANE
	maintext.layer = HUD_ABOVE_HUD_LAYER
	maintext.maptext_x = 0
	maintext.maptext_y = -310

	for(var/client/M in GLOB.clients)
		M.screen += maintext
		maintext.set_text(message, COLOR_WHITE)

	spawn(5 SECONDS)
		message = ""
		maintext.set_text(message, COLOR_WHITE)

	spawn(7 SECONDS)
		message = {"<span style="color: yellow;">Персиваль</span>: ...Ведьмы."}
		maintext.set_text(message, COLOR_WHITE)

	spawn(11 SECONDS)
		message = {"<span style="color: yellow;">Персиваль</span>: Лишь бы на поводок посадить."}
		maintext.set_text(message, COLOR_WHITE)

	spawn(16 SECONDS)

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

		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/IBO - Sorrow.mp3', volume = 50), "Sorrow (IBO)"),

		CALL_GLOB(s2ep5sc1_screentext),
		TALK_ACTOR(actor("Амелия - 5-1-1"), "Кажется..."),

		SHIFT_ACTOR(actor("Амелия - 5-1-1"), 15, 0, 1 SECONDS, SINE_EASING|EASE_OUT, null),
		CHANGE_ACTOR_VISUALS(actor("Амелия - 5-1-1"), "EP5 PAGE 1 - 1NOEYES"),

		SHIFT_ACTOR(actor("Глаза Амелии - 5-1-1"), 32, 13, 1 SECONDS, SINE_EASING|EASE_OUT, null) = 0.5 SECONDS,

		PLAY_SOUND(sound('sound/machines/keyboard/keystroke2.ogg', volume = 10), null),
		CHANGE_ACTOR_VISIBILITY(actor("Клава 1"), 255, 1 SECONDS, LINEAR_EASING, null) = 0.5 SECONDS,

		PLAY_SOUND(sound('sound/machines/keyboard/keystroke4.ogg', volume = 10), null),
		CHANGE_ACTOR_VISIBILITY(actor("Клава 4"), 255, 0.5 SECONDS, LINEAR_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Клава 1"), 0, 1 SECONDS, LINEAR_EASING, null) = 0.5 SECONDS,

		PLAY_SOUND(sound('sound/machines/keyboard/keystroke1.ogg', volume = 10), null),
		CHANGE_ACTOR_VISIBILITY(actor("Клава 2"), 255, 0.5 SECONDS, LINEAR_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Клава 4"), 0, 1 SECONDS, LINEAR_EASING, null) = 0.5 SECONDS,

		PLAY_SOUND(sound('sound/machines/keyboard/keystroke4.ogg', volume = 10), null),
		CHANGE_ACTOR_VISIBILITY(actor("Клава 1"), 255, 0.5 SECONDS, LINEAR_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Клава 2"), 0, 1 SECONDS, LINEAR_EASING, null) = 0.5 SECONDS,

		PLAY_SOUND(sound('sound/machines/keyboard/keystroke3.ogg', volume = 10), null),
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

		PLAY_SOUND(sound('sound/mecha/powerup.ogg', volume = 20), null),
		CHANGE_ACTOR_VISUALS(actor("Перси - 5-1-1"), "EP5 PAGE 1 - 2") = 2 SECONDS,
		PLAY_SOUND(sound('sound/mecha/mech-shutdown.ogg', volume = 30), null),

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

		PLAY_SOUND(sound('sound/mecha/mechstep03.ogg', volume = 10), null),
		SHIFT_ACTOR(actor("Перси - 5-1-1"), -25, 5, 0.5 SECONDS, SINE_EASING|EASE_IN, null),
		CHANGE_ACTOR_VISUALS(actor("Перси - 5-1-1"), "EP5 PAGE 1 - 3") = 1 SECONDS,
		PLAY_SOUND(sound('sound/mecha/mechmove02.ogg', volume = 10), null),
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

		PLAY_SOUND(sound('sound/mecha/mechstep03.ogg', volume = 10), null),

		CHANGE_ACTOR_VISUALS(actor("Перси - 5-1-2"), "EP5 PAGE 1 - 7") = 1 SECONDS,
		TALK_ACTOR(actor("Амелия - 5-1-2"), "Что скажешь?") = 1 SECONDS,

		SHIFT_ACTOR(actor("Амелия - 5-1-2"), -10, 0, 1 SECONDS, SINE_EASING|EASE_OUT, null),
		SHIFT_ACTOR(actor("Глаза Амелии - 5-1-2"), -23, 28, 1 SECONDS, SINE_EASING|EASE_OUT, null) = 2 SECONDS,

		PLAY_SOUND(sound('sound/mecha/mechmove02.ogg', volume = 10), null),

		SHIFT_ACTOR(actor("Перси - 5-1-2"), -15, 0, 0.3 SECONDS, SINE_EASING|EASE_IN, null),
		CHANGE_ACTOR_VISUALS(actor("Перси - 5-1-2"), "EP5 PAGE 1 - 6") = 4 SECONDS,

		PLAY_SOUND(sound('sound/mecha/mechstep03.ogg', volume = 10), null),

		MOVE_ACTOR(actor("Перси - 5-1-2"), SOUTH),
		TURN_ACTOR(actor("Перси - 5-1-2"), WEST) = 1 SECONDS,

		PLAY_SOUND(sound('sound/mecha/mechmove03.ogg', volume = 10), null),

		SHIFT_ACTOR(actor("Перси - 5-1-2"), 0, 10, 0.3 SECONDS, SINE_EASING|EASE_IN, null),
		TURN_ACTOR(actor("Перси - 5-1-2"), NORTH),
		CHANGE_ACTOR_VISUALS(actor("Перси - 5-1-2"), "EP5 PAGE 1 - 8") = 4 SECONDS,

		CHANGE_ACTOR_VISUALS(actor("Перси - 5-1-2"), "EP5 PAGE 1 - 9") = 1 SECONDS,

		PLAY_SOUND(sound('sound/mecha/mechstep03.ogg', volume = 10), null),

		SHIFT_ACTOR(actor("Перси - 5-1-2"), 5, -10, 0.3 SECONDS, SINE_EASING|EASE_OUT, null),
		CHANGE_ACTOR_VISUALS(actor("Перси - 5-1-2"), "EP5 PAGE 1 - 3"),
		MOVE_ACTOR(actor("Перси - 5-1-2"), EAST),
		TURN_ACTOR(actor("Перси - 5-1-2"), EAST) = 1 SECONDS,

		TALK_ACTOR(actor("Перси - 5-1-2"), "Швы ЯВНО могли быть и ровнее.") = 2 SECONDS,

		CHANGE_ACTOR_VISUALS(actor("Глаза Амелии - 5-1-2"), "Amelia Eyes - Pissed off") = 4 SECONDS,
		TALK_ACTOR(actor("Амелия - 5-1-2"), "Ампер мог бы и ПОУБАВИТЬ твою претенциозность.") = 4 SECONDS,

		PLAY_SOUND(sound('sound/mecha/mechmove03.ogg', volume = 10), null),

		CHANGE_ACTOR_VISUALS(actor("Перси - 5-1-2"), "EP5 PAGE 1 - 10"),
		SHIFT_ACTOR(actor("Перси - 5-1-2"), 15, -10, 0.3 SECONDS, SINE_EASING|EASE_IN, null),
		MOVE_ACTOR(actor("Перси - 5-1-2"), EAST),
		TALK_ACTOR(actor("Перси - 5-1-2"), "Эй!") = 1 SECONDS,

		TALK_ACTOR(actor("Перси - 5-1-2"), "Звучит неприятно, вообще-то."),

		TURN_ACTOR(actor("Амелия - 5-1-2"), NORTH),
		SHIFT_ACTOR(actor("Амелия - 5-1-2"), -20, 0, 0.3 SECONDS, LINEAR_EASING, null),
		TURN_ACTOR(actor("Глаза Амелии - 5-1-2"), NORTH),
		SHIFT_ACTOR(actor("Глаза Амелии - 5-1-2"), -33, 28, 0.3 SECONDS, LINEAR_EASING, null) = 0.5 SECONDS,

		PLAY_SOUND(sound('sound/machines/keyboard/keystroke3.ogg', volume = 10), null),
		CHANGE_ACTOR_VISIBILITY(actor("Клава 5"), 255, 1 SECONDS, LINEAR_EASING, null) = 0.5 SECONDS,

		PLAY_SOUND(sound('sound/machines/keyboard/keystroke1.ogg', volume = 10), null),
		CHANGE_ACTOR_VISIBILITY(actor("Клава 7"), 255, 0.5 SECONDS, LINEAR_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Клава 5"), 0, 1 SECONDS, LINEAR_EASING, null) = 0.5 SECONDS,

		PLAY_SOUND(sound('sound/machines/keyboard/keystroke4.ogg', volume = 10), null),
		CHANGE_ACTOR_VISIBILITY(actor("Клава 6"), 255, 0.5 SECONDS, LINEAR_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Клава 7"), 0, 1 SECONDS, LINEAR_EASING, null) = 0.5 SECONDS,

		PLAY_SOUND(sound('sound/machines/keyboard/keystroke2.ogg', volume = 10), null),
		CHANGE_ACTOR_VISIBILITY(actor("Клава 5"), 255, 0.5 SECONDS, LINEAR_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Клава 6"), 0, 1 SECONDS, LINEAR_EASING, null) = 0.5 SECONDS,

		CHANGE_ACTOR_VISIBILITY(actor("Клава 5"), 0, 1 SECONDS, LINEAR_EASING, null),

		SHIFT_ACTOR(actor("Перси - 5-1-2"), 10, -10, 0.3 SECONDS, SINE_EASING|EASE_OUT, null),
		CHANGE_ACTOR_VISUALS(actor("Перси - 5-1-2"), "EP5 PAGE 1 - 11") = 3.5 SECONDS,
		TALK_ACTOR(actor("Перси - 5-1-2"), "Претенциозность - это неотъемлемая часть моей модели личности!") = 2 SECONDS,

		PLAY_SOUND(sound('sound/machines/keyboard/keystroke4.ogg', volume = 10), null),
		CHANGE_ACTOR_VISIBILITY(actor("Клава 7"), 255, 1 SECONDS, LINEAR_EASING, null) = 0.5 SECONDS,

		PLAY_SOUND(sound('sound/machines/keyboard/keystroke1.ogg', volume = 10), null),
		CHANGE_ACTOR_VISIBILITY(actor("Клава 5"), 255, 0.5 SECONDS, LINEAR_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Клава 7"), 0, 1 SECONDS, LINEAR_EASING, null) = 0.5 SECONDS,

		PLAY_SOUND(sound('sound/machines/keyboard/keystroke4.ogg', volume = 10), null),
		CHANGE_ACTOR_VISIBILITY(actor("Клава 7"), 255, 0.5 SECONDS, LINEAR_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Клава 5"), 0, 1 SECONDS, LINEAR_EASING, null) = 0.5 SECONDS,

		PLAY_SOUND(sound('sound/machines/keyboard/keystroke2.ogg', volume = 10), null),
		CHANGE_ACTOR_VISIBILITY(actor("Клава 6"), 255, 0.5 SECONDS, LINEAR_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Клава 7"), 0, 1 SECONDS, LINEAR_EASING, null) = 0.5 SECONDS,

		CHANGE_ACTOR_VISIBILITY(actor("Клава 6"), 0, 1 SECONDS, LINEAR_EASING, null),

		PLAY_SOUND(sound('sound/mecha/mechmove02.ogg', volume = 10), null),

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
		EASY_TRANSFORM_ACTOR(actor("Глаза Амелии - 5-1-3"), 5, 0),
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
		MOVE_CAMERA(0, 0, 0, null),
		ADD_SCREEN(/cinema_borders) = 1 SECONDS,

		EASY_TRANSFORM_ACTOR(actor("Глаза Амелии - 5-1-3"), 6, 0),
		SHIFT_ACTOR(actor("Глаза Амелии - 5-1-3"), -8, 16, 0, LINEAR_EASING, null),
		TURN_ACTOR(actor("Глаза Амелии - 5-1-3"), SOUTH),

		TURN_ACTOR(actor("Амелия - 5-1-3"), SOUTH),

		CALL_GLOB(s2ep5sc3_screentext),
		TALK_ACTOR(actor("Амелия - 5-1-3"), "Пора смириться с реальностью, Кощей.") = 5 SECONDS,

		CHANGE_ACTOR_VISUALS(actor("Глаза Амелии - 5-1-3"), "Amelia Eyes - Looking down"),

		PLAY_SOUND(sound('sound/machines/keyboard/keystroke2.ogg', volume = 10), null),
		CHANGE_ACTOR_VISIBILITY(actor("Клава 8"), 255, 1 SECONDS, LINEAR_EASING, null) = 0.5 SECONDS,

		PLAY_SOUND(sound('sound/machines/keyboard/keystroke4.ogg', volume = 10), null),
		CHANGE_ACTOR_VISIBILITY(actor("Клава 10"), 255, 0.5 SECONDS, LINEAR_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Клава 8"), 0, 1 SECONDS, LINEAR_EASING, null) = 0.5 SECONDS,

		PLAY_SOUND(sound('sound/machines/keyboard/keystroke1.ogg', volume = 10), null),
		CHANGE_ACTOR_VISIBILITY(actor("Клава 11"), 255, 0.5 SECONDS, LINEAR_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Клава 10"), 0, 1 SECONDS, LINEAR_EASING, null) = 0.5 SECONDS,

		PLAY_SOUND(sound('sound/machines/keyboard/keystroke1.ogg', volume = 10), null),
		CHANGE_ACTOR_VISIBILITY(actor("Клава 9"), 255, 0.5 SECONDS, LINEAR_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Клава 11"), 0, 1 SECONDS, LINEAR_EASING, null) = 0.5 SECONDS,

		PLAY_SOUND(sound('sound/mecha/mechmove03.ogg', volume = 10), null),

		TALK_ACTOR(actor("Перси - 5-1-3"), "...Ведьмы."),
		CHANGE_ACTOR_VISUALS(actor("Перси - 5-1-3"), "EP5 PAGE 1 - 12"),
		TURN_ACTOR(actor("Перси - 5-1-3"), WEST),

		PLAY_SOUND(sound('sound/machines/keyboard/keystroke3.ogg', volume = 10), null),
		CHANGE_ACTOR_VISIBILITY(actor("Клава 10"), 255, 0.5 SECONDS, LINEAR_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Клава 9"), 0, 1 SECONDS, LINEAR_EASING, null) = 0.5 SECONDS,

		PLAY_SOUND(sound('sound/machines/keyboard/keystroke4.ogg', volume = 10), null),
		CHANGE_ACTOR_VISIBILITY(actor("Клава 8"), 255, 0.5 SECONDS, LINEAR_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Клава 10"), 0, 1 SECONDS, LINEAR_EASING, null) = 0.5 SECONDS,

		PLAY_SOUND(sound('sound/machines/keyboard/keystroke4.ogg', volume = 10), null),
		CHANGE_ACTOR_VISIBILITY(actor("Клава 11"), 255, 0.5 SECONDS, LINEAR_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Клава 8"), 0, 1 SECONDS, LINEAR_EASING, null) = 0.5 SECONDS,

		PLAY_SOUND(sound('sound/machines/keyboard/keystroke2.ogg', volume = 10), null),
		CHANGE_ACTOR_VISIBILITY(actor("Клава 9"), 255, 0.5 SECONDS, LINEAR_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Клава 11"), 0, 1 SECONDS, LINEAR_EASING, null) = 0.5 SECONDS,

		PLAY_SOUND(sound('sound/machines/keyboard/keystroke1.ogg', volume = 10), null),
		CHANGE_ACTOR_VISIBILITY(actor("Клава 8"), 255, 0.5 SECONDS, LINEAR_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Клава 9"), 0, 1 SECONDS, LINEAR_EASING, null) = 0.5 SECONDS,

		PLAY_SOUND(sound('sound/machines/keyboard/keystroke4.ogg', volume = 10), null),
		CHANGE_ACTOR_VISIBILITY(actor("Клава 9"), 255, 0.5 SECONDS, LINEAR_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Клава 8"), 0, 1 SECONDS, LINEAR_EASING, null) = 0.5 SECONDS,

		PLAY_SOUND(sound('sound/machines/keyboard/keystroke3.ogg', volume = 10), null),
		CHANGE_ACTOR_VISIBILITY(actor("Клава 10"), 255, 0.5 SECONDS, LINEAR_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Клава 9"), 0, 1 SECONDS, LINEAR_EASING, null) = 0.5 SECONDS,

		CHANGE_ACTOR_VISUALS(actor("Перси - 5-1-3"), "EP5 PAGE 1 - 3"),
		TALK_ACTOR(actor("Перси - 5-1-3"), "Лишь бы на поводок посадить."),
		CHANGE_ACTOR_VISIBILITY(actor("Клава 10"), 0, 1 SECONDS, LINEAR_EASING, null) = 4 SECONDS,

		START_CUTSCENE(/datum/modular_cutscene/s2ep5sc4)
	)

/datum/modular_cutscene/s2ep5sc4/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 5-1 - Кадр 4"),
		MOVE_CAMERA(0, 0, 0, null),
		ADD_SCREEN(/cinema_borders) = 1 SECONDS,

		TALK_ACTOR(actor("Амелия - 5-1-4"), "Мне казалось, что тебе такое нравится.") = 2 SECONDS,

		TALK_ACTOR(actor("Перси - 5-1-4"), "!фырчит.") = 2 SECONDS,
		TALK_ACTOR(actor("Перси - 5-1-4"), "Мне ли?") = 5 SECONDS,

		PLAY_SOUND(sound('sound/machines/BoltsUp.ogg', volume = 70), null),

		CHANGE_ACTOR_VISUALS(actor("Дверь 5-4"), "opening") = 0.5 SECONDS,
		CHANGE_ACTOR_VISUALS(actor("Дверь 5-4"), "open") = 1 SECONDS,

		PLAY_SOUND(sound('sound/effects/footstep/plating4.ogg', volume = 70), null),

		CHANGE_ACTOR_VISIBILITY(actor("Року - 5-1-4"), 255, 1 SECOND, SINE_EASING, null) = 0.5 SECONDS,
		MOVE_ACTOR(actor("Року - 5-1-4"), EAST) = 1 SECONDS,

		PLAY_SOUND(sound('sound/mecha/mechmove03.ogg', volume = 10), null),

		CHANGE_ACTOR_VISUALS(actor("Перси - 5-1-4"), "EP5 PAGE 1 - 3"),
		TURN_ACTOR(actor("Перси - 5-1-4"), WEST) = 0.5 SECONDS,

		PLAY_SOUND(sound('sound/mecha/mechstep03.ogg', volume = 10), null),

		MOVE_ACTOR(actor("Перси - 5-1-4"), EAST),
		SHIFT_ACTOR(actor("Перси - 5-1-4"), 10, 0, 0.5 SECONDS, SINE_EASING|EASE_OUT, null) = 0.5 SECONDS,

		CHANGE_ACTOR_VISUALS(actor("Амелия - 5-1-4"), "EP5 PAGE 1 - 7"),
		TURN_ACTOR(actor("Амелия - 5-1-4"), NORTH) = 2 SECONDS,

		TALK_ACTOR(actor("Амелия - 5-1-4"), "В чём дело? Ты словно призрака увиде-") = 2 SECONDS,
		TALK_ACTOR(actor("Перси - 5-1-4"), "!указывает на Року.") = 1 SECONDS,
		TURN_ACTOR(actor("Амелия - 5-1-4"), WEST) = 2 SECONDS,

		TALK_ACTOR(actor("Амелия - 5-1-4"), "Року?") = 4 SECONDS,
		TALK_ACTOR(actor("Року - 5-1-4"), "Амелия.") = 4 SECONDS,

		PLAY_SOUND(sound('packs/infinity/sound/voice/sigh_female.ogg', volume = 10), null),
		TALK_ACTOR(actor("Амелия - 5-1-4"), "!вздыхает.") = 2 SECONDS,
		CHANGE_ACTOR_VISUALS(actor("Амелия - 5-1-4"), "Ep 1"),
		SHIFT_ACTOR(actor("Амелия - 5-1-4"), 0, 0, 1 SECONDS, LINEAR_EASING, null),
		TALK_ACTOR(actor("Амелия - 5-1-4"), "Что-то срочное?") = 4 SECONDS,

		TALK_ACTOR(actor("Року - 5-1-4"), "Фиддлер просил передать, что ему нужна твоя помощь с...") = 6 SECONDS,
		TALK_ACTOR(actor("Року - 5-1-4"), "...-чем-то. На мостике.") = 4 SECONDS,

		SHIFT_ACTOR(actor("Амелия - 5-1-4"), 10, 0, 0.5 SECONDS, SINE_EASING|EASE_OUT, null) = 0.5 SECONDS,
		CHANGE_ACTOR_VISUALS(actor("Амелия - 5-1-4"), "EP5 PAGE 1 - 1"),
		TURN_ACTOR(actor("Амелия - 5-1-4"), EAST),
		SHIFT_ACTOR(actor("Амелия - 5-1-4"), 13, 0, 0.5 SECONDS, JUMP_EASING|EASE_IN, null) = 0.5 SECONDS,
		TALK_ACTOR(actor("Амелия - 5-1-4"), "Я почти закончила калибровку нового корпуса для Персиваля. Передай ему, что-") = 6 SECONDS,
		TALK_ACTOR(actor("Року - 5-1-4"), "Он звучал крайне отчаянно. Словно ещё немного и его разберут на металлолом.") = 4 SECONDS,

		PLAY_SOUND(sound('sound/mecha/mechmove03.ogg', volume = 10), null),
		TURN_ACTOR(actor("Перси - 5-1-4"), SOUTH),

		TALK_ACTOR(actor("Амелия - 5-1-4"), "!устало опускает голову вниз.") = 4 SECONDS,

		TURN_ACTOR(actor("Перси - 5-1-4"), WEST),
		CHANGE_ACTOR_VISUALS(actor("Перси - 5-1-4"), "EP5 PAGE 1 - 4") = 1 SECONDS,

		SHIFT_ACTOR(actor("Перси - 5-1-4"), -5, 0, 0.5 SECONDS, SINE_EASING|EASE_IN, null),
		CHANGE_ACTOR_VISUALS(actor("Перси - 5-1-4"), "EP5 PAGE 1 - 3") = 2 SECONDS,
		TALK_ACTOR(actor("Перси - 5-1-4"), "Что-то никогда не меняется, да?") = 4 SECONDS,
		TURN_ACTOR(actor("Перси - 5-1-4"), SOUTH) = 1 SECONDS,
		TALK_ACTOR(actor("Амелия - 5-1-4"), "Твоё чувство юмора, к примеру."),
		MOVE_CAMERA(6, 0, 6 SECONDS, SINE_EASING|EASE_IN) = 4 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/s2ep5sc5)
	)

/datum/modular_cutscene/s2ep5sc5/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 5-1 - Кадр 5"),

		ADD_SCREEN(/cinema_borders) = 1 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/IBO - Barren.mp3', volume = 50), "Barren (IBO)"),

		MOVE_ACTOR(actor("Амелия - 5-1-5"), SOUTH) = 1 SECONDS,
		PLAY_SOUND(sound('sound/mecha/mechstep03.ogg', volume = 10), null),
		MOVE_ACTOR(actor("Перси - 5-1-5"), SOUTH) = 1 SECONDS,
		TALK_ACTOR(actor("Перси - 5-1-5"), "Может, просто отдашь мне мою куртку?") = 2 SECONDS,
		PLAY_SOUND(sound('sound/mecha/mechstep03.ogg', volume = 10), null),
		MOVE_ACTOR(actor("Перси - 5-1-5"), SOUTH) = 1 SECONDS,
		MOVE_ACTOR(actor("Амелия - 5-1-5"), SOUTH) = 1 SECONDS,
		TURN_ACTOR(actor("Амелия - 5-1-5"), WEST),
		TALK_ACTOR(actor("Амелия - 5-1-5"), "Тебе не нравится пальто?") = 4 SECONDS,
		PLAY_SOUND(sound('sound/mecha/mechstep03.ogg', volume = 10), null),
		MOVE_ACTOR(actor("Перси - 5-1-5"), SOUTH) = 1 SECONDS,
		PLAY_SOUND(sound('sound/mecha/mechmove03.ogg', volume = 10), null),
		TURN_ACTOR(actor("Перси - 5-1-5"), EAST),
		TALK_ACTOR(actor("Перси - 5-1-5"), "Не нужно быть Шерлоком, чтобы понять что вы нашли его на свалке.") = 6 SECONDS,
		TALK_ACTOR(actor("Амелия - 5-1-5"), "!закатывает глаза.") = 2 SECONDS,
		TURN_ACTOR(actor("Амелия - 5-1-5"), SOUTH),
		TALK_ACTOR(actor("Амелия - 5-1-5"), "Какие мы придирчивые.") = 2 SECONDS,
		MOVE_ACTOR(actor("Амелия - 5-1-5"), SOUTH) = 1 SECONDS,
		PLAY_SOUND(sound('sound/mecha/mechmove02.ogg', volume = 10), null),
		TURN_ACTOR(actor("Перси - 5-1-5"), SOUTH) = 1 SECONDS,
		PLAY_SOUND(sound('sound/mecha/mechstep03.ogg', volume = 10), null),
		MOVE_ACTOR(actor("Перси - 5-1-5"), SOUTH) = 1 SECONDS,
		TALK_ACTOR(actor("Перси - 5-1-5"), "Ты ведь просто не хочешь отдавать её, да?"),
		MOVE_CAMERA(6, -4, 4 SECONDS, SINE_EASING|EASE_OUT),
		MOVE_ACTOR(actor("Амелия - 5-1-5"), SOUTH) = 1 SECONDS,
		PLAY_SOUND(sound('sound/mecha/mechstep03.ogg', volume = 10), null),
		PLAY_SOUND(sound('packs/infinity/sound/voice/giggle_female_3.ogg', volume = 10), null),
		TALK_ACTOR(actor("Амелия - 5-1-5"), "Может быть?") = 1 SECONDS,
		MOVE_ACTOR(actor("Перси - 5-1-5"), SOUTH) = 2 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/s2ep5sc6)
	)

/datum/modular_cutscene/s2ep5sc6/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 5-1 - Кадр 6"),

		ADD_SCREEN(/cinema_borders) = 1 SECONDS,
		TALK_ACTOR(actor("Крис - 5-1-6"), "...но без рабочей АЭС - мы никуда не поедем.") = 1 SECONDS,
		PLAY_SOUND(sound('sound/mecha/mechstep03.ogg', volume = 10), null),
		MOVE_ACTOR(actor("Перси - 5-1-6"), SOUTH) = 1 SECONDS,
		MOVE_ACTOR(actor("Амелия - 5-1-6"), SOUTH) = 1 SECONDS,
		MOVE_ACTOR(actor("Амелия - 5-1-6"), SOUTH) = 1 SECONDS,
		TALK_ACTOR(actor("Фиддлер - 5-1-6"), "Что насчёт альтернатив?") = 4 SECONDS,
		TALK_ACTOR(actor("Крис - 5-1-6"), "Можно попробовать перевести энергию с других контуров...") = 1 SECONDS,
		PLAY_SOUND(sound('sound/mecha/mechstep03.ogg', volume = 10), null),
		MOVE_ACTOR(actor("Перси - 5-1-6"), SOUTH) = 1 SECONDS,
		MOVE_ACTOR(actor("Амелия - 5-1-6"), SOUTH) = 2 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/s2ep5sc7)
	)

/proc/s2ep5sc7_screentext()
	var/message = {"<span style="color: yellow;">Кристиана</span>: Здесь..."}

	var/obj/screen/player_message/maintext = new /obj/screen/player_message()
	maintext.plane = HUD_PLANE
	maintext.layer = HUD_ABOVE_HUD_LAYER
	maintext.maptext_x = 0
	maintext.maptext_y = -310

	for(var/client/M in GLOB.clients)
		M.screen += maintext
		maintext.set_text(message, COLOR_WHITE)

	spawn(1 SECONDS)
		message = {"<span style="color: yellow;">Кристиана</span>: Вот тут-"}
		maintext.set_text(message, COLOR_WHITE)

	spawn(2 SECONDS)
		message = {"<span style="color: yellow;">Кристиана</span>: И ещё где-то здесь -"}
		maintext.set_text(message, COLOR_WHITE)

	spawn(4 SECONDS)
		message = {"<span style="color: yellow;">Кристиана</span>: - расположены аварийные подстанции."}
		maintext.set_text(message, COLOR_WHITE)

	spawn(8 SECONDS)
		message = ""
		maintext.set_text(message, COLOR_WHITE)

	spawn(10 SECONDS)
		message = {"<span style="color: yellow;">Кристиана</span>: Если они всё ещё работают - их выхлопа точно хватит на одну поездку."}
		maintext.set_text(message, COLOR_WHITE)

	spawn(16 SECONDS)
		message = {"<span style="color: yellow;">Кристиана</span>: Нюанс в том, что никаких данных по состоянию тоннелей в целом - у нас нет."}
		maintext.set_text(message, COLOR_WHITE)

	spawn(22 SECONDS)
		message = {"<span style="color: yellow;">Кристиана</span>: Они не эксплуатировались многие годы. И пускай я не думаю, что мы встретим там ЖИВОЕ сопротивление -"}
		maintext.set_text(message, COLOR_WHITE)

	spawn(30 SECONDS)
		message = ""
		maintext.set_text(message, COLOR_WHITE)

	spawn(32 SECONDS)
		message = {"<span style="color: yellow;">Кристиана</span>: - даже простой завал может стать для нас большой проблемой."}
		maintext.set_text(message, COLOR_WHITE)

	spawn(38 SECONDS)

		for(var/client/M in GLOB.clients)
			for(var/obj/screen/messages in M.screen)
				if(istype(messages, /obj/screen/player_message))
					M.screen -= messages
					qdel(messages)

/datum/modular_cutscene/s2ep5sc7/setup_actions(...)
	actions = list(
		EASY_TRANSFORM_ACTOR(actor("Дверь 5-7"), 6, 0),
		CHANGE_ACTOR_LAYER(actor("Дверь 5-7"), 4.02),

		EASY_TRANSFORM_ACTOR(actor("Перси - 5-1-7"), 5, 0),
		CHANGE_ACTOR_LAYER(actor("Перси - 5-1-7"), 4.03),

		EASY_TRANSFORM_ACTOR(actor("Амелия - 5-1-7"), 5, 0),
		CHANGE_ACTOR_LAYER(actor("Амелия - 5-1-7"), 4.04),

		EASY_TRANSFORM_ACTOR(actor("Глаза Амелии - 5-1-7"), 3, 0),
		CHANGE_ACTOR_LAYER(actor("Глаза Амелии - 5-1-7"), 4.05),

		EASY_TRANSFORM_ACTOR(actor("Глаза Райфлер - 5-1-7"), 6, 0),
		CHANGE_ACTOR_LAYER(actor("Глаза Райфлер - 5-1-7"), 4.10),

		EASY_TRANSFORM_ACTOR(actor("Крис - 5-1-7"), 11, 0),
		CHANGE_ACTOR_LAYER(actor("Крис - 5-1-7"), 4.09),

		EASY_TRANSFORM_ACTOR(actor("Стена 5-7"), 15, 0),
		CHANGE_ACTOR_LAYER(actor("Стена 5-7"), 4.01),

		EASY_TRANSFORM_ACTOR(actor("Такмапа 5-7"), 10, 0),
		CHANGE_ACTOR_LAYER(actor("Такмапа 5-7"), 4.11) = 0.1 SECONDS,

		TP_CAMERA("Сцена 5-1 - Кадр 7"),
		MOVE_CAMERA(0, 0, 0, null),
		ADD_SCREEN(/cinema_borders) = 1 SECONDS,

		CALL_GLOB(s2ep5sc7_screentext),
		CHANGE_ACTOR_VISIBILITY(actor("Пинг 1"), 255, 0.5 SECONDS, LINEAR_EASING, null),
		PLAY_SOUND(sound('sound/machines/ping.ogg', volume = 10), null),
		TALK_ACTOR(actor("Крис - 5-1-7"), "Здесь...") = 1 SECONDS,

		CHANGE_ACTOR_VISIBILITY(actor("Пинг 2"), 255, 0.5 SECONDS, LINEAR_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Пинг 1"), 0, 1 SECONDS, LINEAR_EASING, null),
		PLAY_SOUND(sound('sound/machines/ping.ogg', volume = 10), null),
		TALK_ACTOR(actor("Крис - 5-1-7"), "Вот тут-") = 1 SECONDS,

		CHANGE_ACTOR_VISIBILITY(actor("Пинг 3"), 255, 0.5 SECONDS, LINEAR_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Пинг 2"), 0, 1 SECONDS, LINEAR_EASING, null),
		PLAY_SOUND(sound('sound/machines/ping.ogg', volume = 10), null),
		SHIFT_ACTOR(actor("Крис - 5-1-7"), 10, 0, 0.5 SECONDS, SINE_EASING|EASE_IN, null),
		SHIFT_ACTOR(actor("Глаза Райфлер - 5-1-7"), 0, -40, 0.5 SECONDS, SINE_EASING|EASE_IN, null),
		TALK_ACTOR(actor("Крис - 5-1-7"), "И ещё где-то здесь -") = 1 SECONDS,
		CHANGE_ACTOR_VISIBILITY(actor("Пинг 3"), 0, 1 SECONDS, LINEAR_EASING, null) = 1 SECONDS,
		TALK_ACTOR(actor("Крис - 5-1-7"), "- расположены аварийные подстанции.") = 4 SECONDS,

		SHIFT_ACTOR(actor("Крис - 5-1-7"), 0, 10, 0.5 SECONDS, SINE_EASING|EASE_IN, null),
		SHIFT_ACTOR(actor("Глаза Райфлер - 5-1-7"), -9, -30, 0.5 SECONDS, SINE_EASING|EASE_IN, null),
		CHANGE_ACTOR_VISUALS(actor("Глаза Райфлер - 5-1-7"), "Rifler Eyes") = 2 SECONDS,

		TALK_ACTOR(actor("Крис - 5-1-7"), "Если они всё ещё работают - их выхлопа точно хватит на одну поездку.") = 6 SECONDS,

		CHANGE_ACTOR_VISUALS(actor("Глаза Райфлер - 5-1-7"), "Rifler Eyes - Right"),
		TALK_ACTOR(actor("Крис - 5-1-7"), "Нюанс в том, что никаких данных по состоянию тоннелей в целом - у нас нет.") = 6 SECONDS,
		TALK_ACTOR(actor("Крис - 5-1-7"), "Они не эксплуатировались многие годы. И пускай я не думаю, что мы встретим там ЖИВОЕ сопротивление -") = 8 SECONDS,
		SHIFT_ACTOR(actor("Крис - 5-1-7"), 0, 0, 0.5 SECONDS, SINE_EASING|EASE_IN, null),
		SHIFT_ACTOR(actor("Глаза Райфлер - 5-1-7"), -9, -40, 0.5 SECONDS, SINE_EASING|EASE_IN, null) = 2 SECONDS,

		CHANGE_ACTOR_VISUALS(actor("Глаза Райфлер - 5-1-7"), "Rifler Eyes"),
		CHANGE_ACTOR_VISUALS(actor("Крис - 5-1-7"), "EP5 PAGE 1 - 1"),
		EASY_TRANSFORM_ACTOR(actor("Глаза Райфлер - 5-1-7"), 6, 0),
		TURN_ACTOR(actor("Глаза Райфлер - 5-1-7"), WEST),
		SHIFT_ACTOR(actor("Глаза Райфлер - 5-1-7"), -17, -39, 0, null, null),

		TALK_ACTOR(actor("Крис - 5-1-7"), "- даже простой завал может стать для нас большой проблемой.") = 6 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/s2ep5sc8)
	)

/proc/s2ep5sc8_screentext()
	var/message = {"<span style="color: yellow;">Мясо</span>: Значит, какой вариант мы бы не выбрали - он всё равно будет сопряжён с рисками?"}

	var/obj/screen/player_message/maintext = new /obj/screen/player_message()
	maintext.plane = HUD_PLANE
	maintext.layer = HUD_ABOVE_HUD_LAYER
	maintext.maptext_x = 0
	maintext.maptext_y = -310

	for(var/client/M in GLOB.clients)
		M.screen += maintext
		maintext.set_text(message, COLOR_WHITE)

	spawn(6 SECONDS)
		message = ""
		maintext.set_text(message, COLOR_WHITE)

	spawn(8 SECONDS)
		message = {"<span style="color: yellow;">Кристиана</span>: Верно."}
		maintext.set_text(message, COLOR_WHITE)

	spawn(10 SECONDS)
		message = {"<span style="color: yellow;">Кристиана</span>: Я не люблю вести переговоры с террористами, но вынуждена согласиться с позицией Фокс."}
		maintext.set_text(message, COLOR_WHITE)

	spawn(18 SECONDS)
		message = {"<span style="color: yellow;">Кристиана</span>: Каждая минута, которую мы проводим здесь в безделии - стоит крупицы жизни наших товарищей."}
		maintext.set_text(message, COLOR_WHITE)

	spawn(26 SECONDS)
		message = {"<span style="color: yellow;">Мясо хмурится</span>."}
		maintext.set_text(message, COLOR_WHITE)

	spawn(28 SECONDS)
		message = {"<span style="color: yellow;">Кристиана</span>: Прождём ещё денёк - и спасать будет уже некого."}
		maintext.set_text(message, COLOR_WHITE)

	spawn(34 SECONDS)
		message = {"<span style="color: yellow;">Кристиана</span>: Поверьте..."}
		maintext.set_text(message, COLOR_WHITE)

	spawn(36 SECONDS)
		message = {"<span style="color: yellow;">Кристиана</span>: Я знаю о чём говорю. Никто неспособен оправиться от <b>Рая</b>."}
		maintext.set_text(message, COLOR_WHITE)

	spawn(42 SECONDS)
		message = ""
		maintext.set_text(message, COLOR_WHITE)

	spawn(44 SECONDS)
		message = {"<span style="color: yellow;">Мясо</span>: Что скажешь?"}
		maintext.set_text(message, COLOR_WHITE)

	spawn(48 SECONDS)

		for(var/client/M in GLOB.clients)
			for(var/obj/screen/messages in M.screen)
				if(istype(messages, /obj/screen/player_message))
					M.screen -= messages
					qdel(messages)

/datum/modular_cutscene/s2ep5sc8/setup_actions(...)
	actions = list(
		CHANGE_ACTOR_VISIBILITY(actor("Такмапа 5-7"), 0, 0, null, null),

		EASY_TRANSFORM_ACTOR(actor("Мясо - 5-1-8"), 11, 0),
		CHANGE_ACTOR_LAYER(actor("Мясо - 5-1-8"), 4.09),

		EASY_TRANSFORM_ACTOR(actor("Стена 5-8"), 15, 0),
		CHANGE_ACTOR_LAYER(actor("Стена 5-8"), 4.01),

		EASY_TRANSFORM_ACTOR(actor("Такмапа 5-8"), 10, 0),
		CHANGE_ACTOR_LAYER(actor("Такмапа 5-8"), 4.11) = 0.1 SECONDS,

		TP_CAMERA("Сцена 5-1 - Кадр 8"),
		MOVE_CAMERA(0, 0, 0, null),
		ADD_SCREEN(/cinema_borders) = 1 SECONDS,

		CALL_GLOB(s2ep5sc8_screentext),
		TALK_ACTOR(actor("Мясо - 5-1-8"), "Значит, какой вариант мы бы не выбрали - он всё равно будет сопряжён с рисками?") = 10 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/IBO - Barren.mp3', volume = 50), null),

		SHIFT_ACTOR(actor("Мясо - 5-1-8"), 0, -10, 2 SECONDS, SINE_EASING|EASE_IN, null) = 30 SECONDS,
		TURN_ACTOR(actor("Мясо - 5-1-8"), EAST) = 4 SECONDS,
		TALK_ACTOR(actor("Мясо - 5-1-8"), "Что скажешь?") = 5 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/s2ep5sc9)
	)

/proc/s2ep5sc9_screentext()
	var/message = {"<span style="color: yellow;">Йозеф</span>: Я не собираюсь подвергать опасности весь бункер. Запускать гейтвей сейчас слишком опасно."}

	var/obj/screen/player_message/maintext = new /obj/screen/player_message()
	maintext.plane = HUD_PLANE
	maintext.layer = HUD_ABOVE_HUD_LAYER
	maintext.maptext_x = 0
	maintext.maptext_y = -310

	for(var/client/M in GLOB.clients)
		M.screen += maintext
		maintext.set_text(message, COLOR_WHITE)

	spawn(8 SECONDS)
		message = ""
		maintext.set_text(message, COLOR_WHITE)

	spawn(10 SECONDS)
		message = {"<span style="color: yellow;">Йозеф</span>: Мы воспользуемся метро."}
		maintext.set_text(message, COLOR_WHITE)

	spawn(14 SECONDS)
		message = {"<span style="color: yellow;">Йозеф</span>: Райфлер, подготовь отряд к спуску. Раскопки начнутся немедленно."}
		maintext.set_text(message, COLOR_WHITE)

	spawn(18 SECONDS)
		message = {"<span style="color: yellow;">Амелия</span>: Мистер Фиддлер?"}
		maintext.set_text(message, COLOR_WHITE)

	spawn(22 SECONDS)
		message = {"<span style="color: yellow;">Йозеф</span>: Мясо, попробуй-..."}
		maintext.set_text(message, COLOR_WHITE)

	spawn(24 SECONDS)
		message = {"<span style="color: yellow;">Амелия</span>: <b>Мистер Фиддлер!!!</b>"}
		maintext.set_text(message, COLOR_WHITE)

	spawn(26 SECONDS)

		for(var/client/M in GLOB.clients)
			for(var/obj/screen/messages in M.screen)
				if(istype(messages, /obj/screen/player_message))
					M.screen -= messages
					qdel(messages)

/datum/modular_cutscene/s2ep5sc9/setup_actions(...)
	actions = list(
		EASY_TRANSFORM_ACTOR(actor("Глаза Фиддлера - 5-1-9"), 6, 0),
		CHANGE_ACTOR_LAYER(actor("Глаза Фиддлера - 5-1-9"), 4.10),

		EASY_TRANSFORM_ACTOR(actor("Фиддлер - 5-1-9"), 11, 0),
		CHANGE_ACTOR_LAYER(actor("Фиддлер - 5-1-9"), 4.09),

		EASY_TRANSFORM_ACTOR(actor("Стена 5-9"), 15, 0),
		CHANGE_ACTOR_LAYER(actor("Стена 5-9"), 4.01),

		EASY_TRANSFORM_ACTOR(actor("Такмапа 5-9"), 10, 0),
		CHANGE_ACTOR_LAYER(actor("Такмапа 5-9"), 4.11) = 0.1 SECONDS,

		CHANGE_ACTOR_VISIBILITY(actor("Такмапа 5-8"), 0, 0.1 SECONDS, SINE_EASING, null),

		TP_CAMERA("Сцена 5-1 - Кадр 9"),
		MOVE_CAMERA(0, 0, 0, null),
		ADD_SCREEN(/cinema_borders) = 4 SECONDS,

		SHIFT_ACTOR(actor("Глаза Фиддлера - 5-1-9"), -9, -36, 0.5 SECONDS, SINE_EASING|EASE_IN, null),
		CHANGE_ACTOR_VISUALS(actor("Глаза Фиддлера - 5-1-9"), "Fiddler Eyes - Looking away") = 2 SECONDS,

		SHIFT_ACTOR(actor("Глаза Фиддлера - 5-1-9"), -6, -36, 0.5 SECONDS, SINE_EASING|EASE_IN, null),
		CHANGE_ACTOR_VISUALS(actor("Глаза Фиддлера - 5-1-9"), "Fiddler Eyes - Looking away 2") = 2 SECONDS,

		PLAY_SOUND(sound('sound/mecha/mechmove03.ogg', volume = 10), null),
		SHIFT_ACTOR(actor("Фиддлер - 5-1-9"), 0, -5, 0.5 SECONDS, SINE_EASING|EASE_IN, null),
		SHIFT_ACTOR(actor("Глаза Фиддлера - 5-1-9"), -9, -42, 0.5 SECONDS, SINE_EASING|EASE_IN, null),
		CHANGE_ACTOR_VISUALS(actor("Глаза Фиддлера - 5-1-9"), "Fiddler Eyes - Closed") = 2 SECONDS,

		SHIFT_ACTOR(actor("Глаза Фиддлера - 5-1-9"), -9, -40, 0.5 SECONDS, SINE_EASING|EASE_OUT, null),
		CHANGE_ACTOR_VISUALS(actor("Глаза Фиддлера - 5-1-9"), "Fiddler Eyes - Looking down") = 2 SECONDS,
		CALL_GLOB(s2ep5sc9_screentext),
		TALK_ACTOR(actor("Фиддлер - 5-1-9"), "Я не собираюсь подвергать опасности весь бункер. Запускать гейтвей сейчас слишком опасно.") = 10 SECONDS,

		PLAY_SOUND(sound('sound/mecha/mechmove01.ogg', volume = 10), null),
		CHANGE_ACTOR_VISUALS(actor("Глаза Фиддлера - 5-1-9"), "Fiddler Eyes"),
		CHANGE_ACTOR_VISUALS(actor("Фиддлер - 5-1-9"), "EP5 PAGE 1 - 1"),
		TALK_ACTOR(actor("Фиддлер - 5-1-9"), "Мы воспользуемся метро.") = 4 SECONDS,
		CHANGE_ACTOR_VISUALS(actor("Глаза Фиддлера - 5-1-9"), "Fiddler Eyes - Looking away 2"),
		TALK_ACTOR(actor("Фиддлер - 5-1-9"), "Райфлер, подготовь отряд к спуску. Раскопки начнутся немедленно.") = 8 SECONDS,

		CHANGE_ACTOR_VISUALS(actor("Глаза Фиддлера - 5-1-9"), "Fiddler Eyes - Looking away"),
		TALK_ACTOR(actor("Фиддлер - 5-1-9"), "Мясо, попробуй-...") = 4 SECONDS,
		PLAY_SOUND(sound('sound/mecha/mechmove03.ogg', volume = 10), null),
		TURN_ACTOR(actor("Фиддлер - 5-1-9"), EAST),
		TURN_ACTOR(actor("Глаза Фиддлера - 5-1-9"), EAST),
		CHANGE_ACTOR_VISUALS(actor("Глаза Фиддлера - 5-1-9"), "Fiddler Eyes"),
		SHIFT_ACTOR(actor("Глаза Фиддлера - 5-1-9"), 32, -38, 0.5 SECONDS, SINE_EASING|EASE_OUT, null) = 2 SECONDS,

		START_CUTSCENE(/datum/modular_cutscene/s2ep5sc10)
	)

/datum/modular_cutscene/s2ep5sc10/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 5-1 - Кадр 10"),

		ADD_SCREEN(/cinema_borders) = 1 SECONDS,
		TALK_ACTOR(actor("Фиддлер - 5-1-10"), "Амелия!"),
		TURN_ACTOR(actor("Крис - 5-1-10"), EAST),
		MOVE_ACTOR(actor("Амелия - 5-1-10"), NORTH) = 1 SECONDS,
		TURN_ACTOR(actor("Мясо - 5-1-10"), SOUTH),

		PLAY_SOUND(sound('sound/mecha/mechmove02.ogg', volume = 10), null),
		TALK_ACTOR(actor("Фиддлер - 5-1-10"), "!КРЕПКО обнял девушку."),
		SHIFT_ACTOR(actor("Фиддлер - 5-1-10"), 6, 2, 0.5 SECONDS, SINE_EASING|EASE_IN, null),
		SHIFT_ACTOR(actor("Амелия - 5-1-10"), 0, 27, 0.5 SECONDS, SINE_EASING|EASE_IN, null) = 2 SECONDS,

		PLAY_SOUND(sound('sound/mecha/mechstep03.ogg', volume = 10), null),
		MOVE_ACTOR(actor("Перси - 5-1-10"), NORTH),

		PLAY_SOUND(sound('sound/mecha/mechmove01.ogg', volume = 10), null),
		SHIFT_ACTOR(actor("Фиддлер - 5-1-10"), 0, 10, 0.5 SECONDS, SINE_EASING|EASE_OUT, null),
		SHIFT_ACTOR(actor("Амелия - 5-1-10"), 0, 15, 0.5 SECONDS, SINE_EASING|EASE_OUT, null) = 2 SECONDS,

		TURN_ACTOR(actor("Перси - 5-1-10"), EAST),
		TALK_ACTOR(actor("Амелия - 5-1-10"), "Всё настолько плохо?..") = 4 SECONDS,

		TALK_ACTOR(actor("Перси - 5-1-10"), "Ты когда-нибудь видела чтобы Фиддлер кого-то обнимал?"),
		TURN_ACTOR(actor("Амелия - 5-1-10"), WEST) = 4 SECONDS,
		TALK_ACTOR(actor("Амелия - 5-1-10"), "!пожимает плечами.") = 2 SECONDS,

		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/IBO - Barren.mp3', volume = 50), null),

		TALK_ACTOR(actor("Фиддлер - 5-1-10"), "Послушай меня, у нас не так много времени.") = 6 SECONDS,
		TALK_ACTOR(actor("Фиддлер - 5-1-10"), "Дело в Нае.") = 2 SECONDS,
		TURN_ACTOR(actor("Амелия - 5-1-10"), NORTH) = 2 SECONDS,
		PLAY_SOUND(sound('sound/mecha/mechmove03.ogg', volume = 10), null),
		TURN_ACTOR(actor("Перси - 5-1-10"), NORTH),

		TALK_ACTOR(actor("Амелия - 5-1-10"), "Снова взялись за старое? Стоило ожида-") = 4 SECONDS,
		TALK_ACTOR(actor("Фиддлер - 5-1-10"), "Как раз наоборот.") = 6 SECONDS,

		TALK_ACTOR(actor("Фиддлер - 5-1-10"), "Она собирается уйти из бункера на поиски Реймонда и других.") = 4 SECONDS,
		TALK_ACTOR(actor("Фиддлер - 5-1-10"), "Я пытался убедить её в том, что в её действиях нет никакой логики, и она поступает безрассудно-") = 8 SECONDS,
		TALK_ACTOR(actor("Фиддлер - 5-1-10"), "Что мы не можем просто сигать в каждый конфликт надеясь обойтись без очередной трагедии, но...") = 8 SECONDS,
		TALK_ACTOR(actor("Фиддлер - 5-1-10"), "...в ответ меня- просто назвали бесхребетным трусом.") = 4 SECONDS,

		TALK_ACTOR(actor("Мясо - 5-1-10"), "В конечном счёте, больше ли в этом риска, нежели в том что делаем сейчас мы?") = 2 SECONDS,
		TURN_ACTOR(actor("Фиддлер - 5-1-10"), WEST) = 6 SECONDS,

		TALK_ACTOR(actor("Фиддлер - 5-1-10"), "Уж спасибо за поддержку, Мясо.") = 4 SECONDS,
		TALK_ACTOR(actor("Мясо - 5-1-10"), "Просто заметил.") = 4 SECONDS,
		PLAY_SOUND(sound('sound/machines/synth_no.ogg', volume = 10), null),
		TALK_ACTOR(actor("Фиддлер - 5-1-10"), "!вздыхает.") = 4 SECONDS,
		PLAY_SOUND(sound('sound/mecha/mechmove02.ogg', volume = 10), null),
		SHIFT_ACTOR(actor("Фиддлер - 5-1-10"), -12, 12, 0.5 SECONDS, LINEAR_EASING, null) = 2 SECONDS,
		PLAY_SOUND(sound('sound/mecha/mechstep03.ogg', volume = 10), null),
		TURN_ACTOR(actor("Мясо - 5-1-10"), EAST),
		MOVE_ACTOR(actor("Перси - 5-1-10"), NORTH),
		CHANGE_ACTOR_VISUALS(actor("Фиддлер - 5-1-10"), "OP 1 - 2"),
		TALK_ACTOR(actor("Фиддлер - 5-1-10"), "Я предпринимаю всё возможное для того, чтобы эта лодка не пошла ко дну.") = 6 SECONDS,
		TURN_ACTOR(actor("Крис - 5-1-10"), NORTH),
		SHIFT_ACTOR(actor("Крис - 5-1-10"), 0, 10, 0.5 SECONDS, SINE_EASING|EASE_IN, null),
		TALK_ACTOR(actor("Фиддлер - 5-1-10"), "А все вокруг в это же время будто бы намеренно продолжают делать в ней дырки.") = 8 SECONDS,
		TALK_ACTOR(actor("Фиддлер - 5-1-10"), "Я учёный, а не полководец. Я...") = 4 SECONDS,
		TALK_ACTOR(actor("Фиддлер - 5-1-10"), "...+СОЗДАЮ+ боевые задачи - не +РЕШАЮ+ их.") = 4 SECONDS,
		TALK_ACTOR(actor("Фиддлер - 5-1-10"), "Боже, если бы Мартин только мог меня видеть сейчас...ни харизмы, ни уважения.") = 8 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/IBO - Barren.mp3', volume = 50), null),
		TALK_ACTOR(actor("Фиддлер - 5-1-10"), "...") = 2 SECONDS,
		PLAY_SOUND(sound('sound/mecha/mechmove03.ogg', volume = 10), null),
		CHANGE_ACTOR_VISUALS(actor("Фиддлер - 5-1-10"), "Current Alt"),
		SHIFT_ACTOR(actor("Фиддлер - 5-1-10"), 0, 10, 0.5 SECONDS, SINE_EASING|EASE_IN, null) = 1 SECONDS,

		TALK_ACTOR(actor("Фиддлер - 5-1-10"), "Остальной АНАБ наверняка отправится за ней.") = 4 SECONDS,
		PLAY_SOUND(sound('sound/mecha/mechmove01.ogg', volume = 10), null),
		CHANGE_ACTOR_VISUALS(actor("Фиддлер - 5-1-10"), "EP5 PAGE 1 - 2"),
		TURN_ACTOR(actor("Фиддлер - 5-1-10"), SOUTH) = 6 SECONDS,

		TALK_ACTOR(actor("Фиддлер - 5-1-10"), "Нам нужно переубедить их. Любыми возможными способами - хоть мою голову им на блюдце принести.") = 8 SECONDS,
		TALK_ACTOR(actor("Фиддлер - 5-1-10"), "...за эту неделю мы потеряли восьмерых в одном только бою с Восхождением.") = 6 SECONDS,
		TALK_ACTOR(actor("Фиддлер - 5-1-10"), "Прямо сейчас нас по пальцам пересчитать можно, а они-...") = 6 SECONDS,
		PLAY_SOUND(sound('sound/mecha/mechmove03.ogg', volume = 10), null),
		CHANGE_ACTOR_VISUALS(actor("Фиддлер - 5-1-10"), "Current Alt"),
		SHIFT_ACTOR(actor("Фиддлер - 5-1-10"), 0, 2, 0.5 SECONDS, SINE_EASING|EASE_IN, null),
		TALK_ACTOR(actor("Фиддлер - 5-1-10"), "!кладёт руку Амелии на плечо.") = 2 SECONDS,
		TALK_ACTOR(actor("Фиддлер - 5-1-10"), "Прошу, хоть ты помоги мне. Я не хочу копать могилы ещё четверым.") = 6 SECONDS,

		SHIFT_ACTOR(actor("Амелия - 5-1-10"), 0, 0, 0.5 SECONDS, SINE_EASING|EASE_IN, null),
		TALK_ACTOR(actor("Амелия - 5-1-10"), "Почему вы считаете, что у +меня+ получится её урезонить?") = 2 SECONDS,
		TURN_ACTOR(actor("Амелия - 5-1-10"), WEST) = 4 SECONDS,
		TALK_ACTOR(actor("Амелия - 5-1-10"), "Я никогда не была с Наей в ладах.") = 6 SECONDS,
		PLAY_SOUND(sound('sound/mecha/mechmove02.ogg', volume = 10), null),
		PLAY_SOUND(sound('sound/machines/synth_yes.ogg', volume = 20), null),
		TURN_ACTOR(actor("Перси - 5-1-10"), EAST),
		TURN_ACTOR(actor("Мясо - 5-1-10"), EAST),
		MOVE_ACTOR(actor("Мясо - 5-1-10"), EAST),
		TALK_ACTOR(actor("Перси - 5-1-10"), "Дать подсказку?") = 4 SECONDS,
		MOVE_ACTOR(actor("Мясо - 5-1-10"), EAST) = 2 SECONDS,
		TALK_ACTOR(actor("Амелия - 5-1-10"), "!хмурится.") = 4 SECONDS,
		TALK_ACTOR(actor("Амелия - 5-1-10"), "А если я снова сделаю только хуже? Что будет тогда?") = 6 SECONDS,

		TALK_ACTOR(actor("Мясо - 5-1-10"), "Других псиоников с такими же возможностями у нас попросту нет.") = 2 SECONDS,
		TURN_ACTOR(actor("Мясо - 5-1-10"), SOUTH) = 6 SECONDS,

		TURN_ACTOR(actor("Амелия - 5-1-10"), SOUTH),
		TALK_ACTOR(actor("Амелия - 5-1-10"), "!цыкнула.") = 2 SECONDS,
		TURN_ACTOR(actor("Перси - 5-1-10"), SOUTH),

		MOVE_ACTOR(actor("Мясо - 5-1-10"), SOUTH) = 2 SECONDS,
		MOVE_ACTOR(actor("Амелия - 5-1-10"), SOUTH) = 1 SECONDS,
		TURN_ACTOR(actor("Крис - 5-1-10"), SOUTH),
		MOVE_ACTOR(actor("Амелия - 5-1-10"), SOUTH) = 1 SECONDS,
		MOVE_CAMERA(7, 0, 6 SECONDS, SINE_EASING|EASE_OUT),
		SHIFT_ACTOR(actor("Фиддлер - 5-1-10"), 0, 12, 0.5 SECONDS, LINEAR_EASING, null),
		TALK_ACTOR(actor("Амелия - 5-1-10"), "...на какой ответ я рассчитывала?"),
		PLAY_SOUND(sound('sound/mecha/mechstep03.ogg', volume = 10), null),
		MOVE_ACTOR(actor("Перси - 5-1-10"), SOUTH),
		MOVE_ACTOR(actor("Амелия - 5-1-10"), SOUTH) = 1 SECONDS,
		PLAY_SOUND(sound('sound/mecha/mechstep03.ogg', volume = 10), null),
		MOVE_ACTOR(actor("Перси - 5-1-10"), SOUTH),
		MOVE_ACTOR(actor("Амелия - 5-1-10"), SOUTH) = 1 SECONDS,
		PLAY_SOUND(sound('sound/mecha/mechstep03.ogg', volume = 10), null),
		MOVE_ACTOR(actor("Перси - 5-1-10"), SOUTH),
		MOVE_ACTOR(actor("Амелия - 5-1-10"), SOUTH) = 1 SECONDS,

		START_CUTSCENE(/datum/modular_cutscene/s2ep5sc11)
	)

/datum/modular_cutscene/s2ep5sc11/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 5-1 - Кадр 11"),
		MOVE_CAMERA(0, 0, 0, null),

		ADD_SCREEN(/cinema_borders) = 1 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/ambienceNV.ogg', volume = 20), null),

		CHANGE_ACTOR_MATRIX(actor("Ная - 5-1-11"), -25, 0.5 SECONDS, SINE_EASING|EASE_IN, null),
		CHANGE_ACTOR_VISUALS(actor("Ная - 5-1-11"), "EP5 PAGE 1 - 1"),
		TALK_ACTOR(actor("Ная - 5-1-11"), "!шуршит по коробкам.") = 2 SECONDS,
		TALK_ACTOR(actor("Ная - 5-1-11"), "Если хочешь - можешь уходить.") = 6 SECONDS,
		TALK_ACTOR(actor("Фройз - 5-1-11"), "Ты говоришь это уже в четвёртый раз.") = 2 SECONDS,
		CHANGE_ACTOR_VISUALS(actor("Фройз - 5-1-11"), "EP5 PAGE 1 - 1"),
		SHIFT_ACTOR(actor("Фройз - 5-1-11"), 0, 10, 1 SECONDS, SINE_EASING|EASE_OUT, null) = 4 SECONDS,
		TALK_ACTOR(actor("Фройз - 5-1-11"), "Думаешь, что с прошлых трёх что-то поменялось?") = 6 SECONDS,
		TALK_ACTOR(actor("Ная - 5-1-11"), "Не помню чтоб ты записывался в альтруисты. Это и настораживает.") = 6 SECONDS,
		TALK_ACTOR(actor("Фройз - 5-1-11"), "А-а...так вот оно что!") = 4 SECONDS,
		CHANGE_ACTOR_MATRIX(actor("Фройз - 5-1-11"), 15, 0.5 SECONDS, SINE_EASING|EASE_IN, null),

		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/ambienceNV.ogg', volume = 20), null),

		TALK_ACTOR(actor("Фройз - 5-1-11"), "Боишься что меня Фиддлер подослал? Или кто-то ещё?") = 8 SECONDS,
		TURN_ACTOR(actor("Ная - 5-1-11"), NORTH),
		CHANGE_ACTOR_MATRIX(actor("Ная - 5-1-11"), 0, 1 SECONDS, SINE_EASING|EASE_IN, null) = 4 SECONDS,
		TALK_ACTOR(actor("Ная - 5-1-11"), "Нет.") = 2 SECONDS,
		TURN_ACTOR(actor("Ная - 5-1-11"), WEST),
		SHIFT_ACTOR(actor("Ная - 5-1-11"), -8, 0, 0.5 SECONDS, SINE_EASING|EASE_OUT, null) = 2 SECONDS,
		TALK_ACTOR(actor("Фройз - 5-1-11"), "Воу. Окей.") = 4 SECONDS,
		CHANGE_ACTOR_VISUALS(actor("Фройз - 5-1-11"), "Current Alt"),
		CHANGE_ACTOR_MATRIX(actor("Фройз - 5-1-11"), 0, 0.5 SECONDS, SINE_EASING|EASE_IN, ANIMATION_PARALLEL),
		SHIFT_ACTOR(actor("Фройз - 5-1-11"), 0, 0, 0.5 SECONDS, SINE_EASING|EASE_OUT, ANIMATION_PARALLEL),
		TALK_ACTOR(actor("Фройз - 5-1-11"), "Сжирать меня взглядом было необязательно.") = 4 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/asteroid4.ogg', volume = 70), null),
		MOVE_ACTOR(actor("Фройз - 5-1-11"), SOUTH) = 2 SECONDS,
		TALK_ACTOR(actor("Ная - 5-1-11"), "!продолжает копаться в барахле.") = 2 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/ambienceNV.ogg', volume = 20), null),
		PLAY_SOUND(sound('packs/infinity/sound/voice/sigh_male.ogg', volume = 10), null),
		TALK_ACTOR(actor("Фройз - 5-1-11"), "!вздыхает.") = 2 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/asteroid2.ogg', volume = 70), null),
		TURN_ACTOR(actor("Фройз - 5-1-11"), WEST),
		MOVE_ACTOR(actor("Фройз - 5-1-11"), SOUTH) = 2 SECONDS,
		TURN_ACTOR(actor("Фройз - 5-1-11"), NORTH),
		SHIFT_ACTOR(actor("Фройз - 5-1-11"), -26, -5, 1 SECONDS, SINE_EASING|EASE_OUT, null) = 2 SECONDS,
		TALK_ACTOR(actor("Фройз - 5-1-11"), "Слушай-...") = 4 SECONDS,
		TALK_ACTOR(actor("Фройз - 5-1-11"), "Я понимаю что прямо сейчас ты проходишь через некоторое +страшное+ дерьмо.") = 6 SECONDS,
		TALK_ACTOR(actor("Фройз - 5-1-11"), "Твоя жизнь перевернулась с ног на голову, близкие тебе люди ушли, предали тебя, или погибли.") = 8 SECONDS,

		TALK_ACTOR(actor("Фройз - 5-1-11"), "Все мы там были. И я скажу тебе вот что - изолироваться не выход.") = 6 SECONDS,
		TALK_ACTOR(actor("Фройз - 5-1-11"), "Человек без опоры - это человек без цели. А человек без цели -...") = 6 SECONDS,
		TALK_ACTOR(actor("Фройз - 5-1-11"), "...не стоит больше космического мусора.") = 6 SECONDS,
		TURN_ACTOR(actor("Фройз - 5-1-11"), WEST),
		CHANGE_ACTOR_VISUALS(actor("Фройз - 5-1-11"), "EP5 PAGE 1 - 2"),
		TALK_ACTOR(actor("Фройз - 5-1-11"), "!хлопает по плечу.") = 2 SECONDS,
		TALK_ACTOR(actor("Фройз - 5-1-11"), "Хочешь верь, хочешь не верь - но я помогаю тебе бескорыстно. Просто потому что вы - +АНАБ+ - однажды уже помогли мне.") = 8 SECONDS,
		TALK_ACTOR(actor("Фройз - 5-1-11"), "Вы, ребята, дали мне +мою+ цель.") = 6 SECONDS,
		TALK_ACTOR(actor("Фройз - 5-1-11"), "И теперь я готов убить любого ради +вашей+.") = 6 SECONDS,
		PLAY_SOUND(sound('sound/effects/ghost.ogg', volume = 70), null),
		TALK_ACTOR(actor("Фройз - 5-1-11"), "Так что можешь...") = 2 SECONDS,
		CHANGE_VISION,
		CHANGE_ACTOR_VISUALS(actor("Фройз - 5-1-11"), "EP5 PAGE 1 - 3"),
		CHANGE_ACTOR_VISUALS(actor("Ная - 5-1-11"), "EP5 PAGE 1 - 2"),
		TURN_ACTOR(actor("Ная - 5-1-11"), SOUTH),
		SHIFT_ACTOR(actor("Ная - 5-1-11"), 0, 0, 0.5 SECONDS, SINE_EASING|EASE_OUT, null),
		SHIFT_ACTOR(actor("Фройз - 5-1-11"), -20, -5, 0.5 SECONDS, SINE_EASING|EASE_OUT, null),
		TALK_ACTOR(actor("Фройз - 5-1-11"), "...на меня рассчитывать.") = 3 SECONDS,
		CHANGE_VISION,
		PLAY_SOUND(sound('sound/effects/Heart Beat.ogg', volume = 20), null),
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/ambienceNV.ogg', volume = 20), null),
		CHANGE_ACTOR_VISUALS(actor("Фройз - 5-1-11"), "EP5 PAGE 1 - 2"),
		CHANGE_ACTOR_VISUALS(actor("Ная - 5-1-11"), "EP5 PAGE 1 - 3"),
		PLAY_SOUND(sound('packs/infinity/sound/voice/gasp_female4.ogg', volume = 10), null),
		TALK_ACTOR(actor("Ная - 5-1-11"), "!тяжело дышит.") = 4 SECONDS,
		TALK_ACTOR(actor("Ная - 5-1-11"), "!тяжело дышит.") = 4 SECONDS,
		TALK_ACTOR(actor("Фройз - 5-1-11"), "Всё нормально?"),
		PLAY_SOUND(sound('packs/infinity/sound/voice/cough_female.ogg', volume = 10), null),
		TALK_ACTOR(actor("Ная - 5-1-11"), "!выдыхает.") = 6 SECONDS,

		TALK_ACTOR(actor("Ная - 5-1-11"), "Ты...действительно уверен что +хочешь+ идти?") = 6 SECONDS,
		TALK_ACTOR(actor("Фройз - 5-1-11"), "Какая разница, чего я хочу?") = 4 SECONDS,
		CHANGE_ACTOR_VISUALS(actor("Фройз - 5-1-11"), "Current Alt"),
		CHANGE_ACTOR_VISUALS(actor("Ная - 5-1-11"), "EP5 PAGE 1 - 4"),
		TALK_ACTOR(actor("Ная - 5-1-11"), "+Большая+, Фройз. Очень. Я ведь тебе не капитан, и ты мне не солдат.") = 8 SECONDS,
		PLAY_SOUND(sound('packs/infinity/sound/voice/giggle_male_1.ogg', volume = 10), null),
		TALK_ACTOR(actor("Фройз - 5-1-11"), "Ой ли?") = 2 SECONDS,

		PLAY_SOUND(sound('sound/effects/footstep/asteroid1.ogg', volume = 70), null),
		MOVE_ACTOR(actor("Гора - 5-1-11"), NORTH) = 1 SECONDS,
		TALK_ACTOR(actor("Ная - 5-1-11"), "Зачем вообще я это спрашиваю..."),
		PLAY_SOUND(sound('sound/effects/footstep/asteroid4.ogg', volume = 70), null),
		MOVE_ACTOR(actor("Гора - 5-1-11"), NORTH) = 1 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/asteroid3.ogg', volume = 70), null),
		TURN_ACTOR(actor("Фройз - 5-1-11"), SOUTH),
		MOVE_ACTOR(actor("Гора - 5-1-11"), NORTH) = 1 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/asteroid1.ogg', volume = 70), null),
		MOVE_ACTOR(actor("Гора - 5-1-11"), NORTH) = 1 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/asteroid4.ogg', volume = 70), null),
		MOVE_ACTOR(actor("Фройз - 5-1-11"), NORTH),
		TALK_ACTOR(actor("Фройз - 5-1-11"), "Глазам не верю. Неужто пришла?") = 4 SECONDS,
		TALK_ACTOR(actor("Гора - 5-1-11"), "Сделай лицо по-проще. Скулы сведёт."),
		MOVE_ACTOR(actor("Гора - 5-1-11"), NORTH) = 4 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/asteroid2.ogg', volume = 70), null),
		MOVE_ACTOR(actor("Фройз - 5-1-11"), NORTH),
		CHANGE_ACTOR_VISUALS(actor("Фройз - 5-1-11"), "EP5 PAGE 1 - 1"),
		TALK_ACTOR(actor("Гора - 5-1-11"), "Я помогаю ей только из-за личных счётов с Датурой."),
		MOVE_ACTOR(actor("Гора - 5-1-11"), NORTH) = 1 SECONDS,
		TURN_ACTOR(actor("Ная - 5-1-11"), EAST),
		CHANGE_ACTOR_VISUALS(actor("Ная - 5-1-11"), "Final Cool 2"),
		CHANGE_ACTOR_VISUALS(actor("Гора - 5-1-11"), "EP5 PAGE 1 - 1"),
		SHIFT_ACTOR(actor("Гора - 5-1-11"), -8, 0, 0.5 SECONDS, SINE_EASING|EASE_OUT, null) = 3 SECONDS,
		SHIFT_ACTOR(actor("Гора - 5-1-11"), -0, 0, 0.5 SECONDS, SINE_EASING|EASE_OUT, null),
		CHANGE_ACTOR_VISUALS(actor("Гора - 5-1-11"), "Current Alt 2"),
		CHANGE_ACTOR_VISUALS(actor("Ная - 5-1-11"), "EP5 PAGE 1 - 5"),
		TALK_ACTOR(actor("Гора - 5-1-11"), "Как только мы вытащим всех кого поймала эта металлическая сука - я +сама+ его убью.") = 6 SECONDS,
		TALK_ACTOR(actor("Гора - 5-1-11"), "Ты ведь это понимаешь, красноглазка?"),
		TURN_ACTOR(actor("Гора - 5-1-11"), WEST) = 6 SECONDS,
		TALK_ACTOR(actor("Ная - 5-1-11"), "!кивает.") = 2 SECONDS,
		TALK_ACTOR(actor("Ная - 5-1-11"), "Понимаю.") = 2 SECONDS,

		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/ambienceNV.ogg', volume = 20), null),
		MOVE_CAMERA(6, 0, 3 SECONDS, SINE_EASING|EASE_IN) = 2 SECONDS,

		PLAY_SOUND(sound('sound/effects/footstep/asteroid4.ogg', volume = 70), null),
		MOVE_ACTOR(actor("Амелия - 5-1-11"), WEST) = 0.5 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/asteroid2.ogg', volume = 70), null),
		MOVE_ACTOR(actor("Амелия - 5-1-11"), WEST) = 0.5 SECONDS,
		PLAY_SOUND(sound('sound/mecha/mechstep03.ogg', volume = 10), null),
		MOVE_ACTOR(actor("Перси - 5-1-11"), WEST),
		MOVE_ACTOR(actor("Амелия - 5-1-11"), WEST) = 0.5 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/asteroid3.ogg', volume = 70), null),
		MOVE_ACTOR(actor("Амелия - 5-1-11"), WEST) = 0.5 SECONDS,
		PLAY_SOUND(sound('sound/mecha/mechstep03.ogg', volume = 10), null),
		TURN_ACTOR(actor("Гора - 5-1-11"), NORTH),
		MOVE_ACTOR(actor("Перси - 5-1-11"), WEST),
		MOVE_ACTOR(actor("Амелия - 5-1-11"), WEST) = 0.5 SECONDS,
		TALK_ACTOR(actor("Амелия - 5-1-11"), "+Постойте+!"),
		TURN_ACTOR(actor("Гора - 5-1-11"), EAST),
		TURN_ACTOR(actor("Фройз - 5-1-11"), EAST),
		CHANGE_ACTOR_VISUALS(actor("Фройз - 5-1-11"), "Current Alt") = 2 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/asteroid1.ogg', volume = 70), null),
		PLAY_SOUND(sound('packs/infinity/sound/voice/cough_female.ogg', volume = 5), null),
		TALK_ACTOR(actor("Амелия - 5-1-11"), "!пытается отдышаться."),
		MOVE_ACTOR(actor("Гора - 5-1-11"), NORTH),
		CHANGE_ACTOR_MATRIX(actor("Амелия - 5-1-11"), -30, 0.5 SECONDS, SINE_EASING|EASE_IN, null) = 2 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/asteroid4.ogg', volume = 70), null),
		MOVE_ACTOR(actor("Ная - 5-1-11"), EAST) = 2 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/asteroid3.ogg', volume = 70), null),
		MOVE_ACTOR(actor("Ная - 5-1-11"), EAST) = 2 SECONDS,

		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/ambienceNV.ogg', volume = 20), null),

		MOVE_ACTOR(actor("Ная - 5-1-11"), NORTH),
		TALK_ACTOR(actor("Ная - 5-1-11"), "Идите. Я буду следом."),
		TALK_ACTOR(actor("Фройз - 5-1-11"), "!быстро кивнул.") = 2 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/asteroid4.ogg', volume = 70), null),
		MOVE_ACTOR(actor("Фройз - 5-1-11"), WEST) = 1 SECONDS,
		TURN_ACTOR(actor("Фройз - 5-1-11"), SOUTH) = 1 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/asteroid1.ogg', volume = 70), null),
		MOVE_ACTOR(actor("Фройз - 5-1-11"), WEST),
		TALK_ACTOR(actor("Ная - 5-1-11"), "!слегка закатывает рукава."),
		CHANGE_ACTOR_VISUALS(actor("Ная - 5-1-11"), "EP5 PAGE 1 - 6"),
		TURN_ACTOR(actor("Фройз - 5-1-11"), WEST) = 1 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/asteroid3.ogg', volume = 70), null),
		MOVE_ACTOR(actor("Фройз - 5-1-11"), WEST) = 1 SECONDS,
		CHANGE_ACTOR_MATRIX(actor("Амелия - 5-1-11"), 0, 0.5 SECONDS, SINE_EASING|EASE_IN, null),
		TURN_ACTOR(actor("Гора - 5-1-11"), WEST),
		PLAY_SOUND(sound('sound/effects/footstep/asteroid4.ogg', volume = 70), null),
		MOVE_ACTOR(actor("Гора - 5-1-11"), WEST) = 0.5 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/asteroid1.ogg', volume = 70), null),
		MOVE_ACTOR(actor("Фройз - 5-1-11"), WEST) = 0.5 SECONDS,
		TURN_ACTOR(actor("Ная - 5-1-11"), EAST),
		TALK_ACTOR(actor("Ная - 5-1-11"), "Зачем ты пришла?"),
		PLAY_SOUND(sound('sound/effects/footstep/asteroid4.ogg', volume = 70), null),
		MOVE_ACTOR(actor("Гора - 5-1-11"), WEST),
		MOVE_ACTOR(actor("Фройз - 5-1-11"), WEST) = 1 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/asteroid2.ogg', volume = 70), null),
		MOVE_ACTOR(actor("Гора - 5-1-11"), WEST),
		MOVE_ACTOR(actor("Фройз - 5-1-11"), WEST) = 1 SECONDS,
		PLAY_SOUND(sound('sound/mecha/mechstep03.ogg', volume = 10), null),
		MOVE_ACTOR(actor("Гора - 5-1-11"), WEST),
		MOVE_ACTOR(actor("Перси - 5-1-11"), WEST),
		MOVE_ACTOR(actor("Фройз - 5-1-11"), WEST) = 1 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/asteroid4.ogg', volume = 70), null),
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/ambienceNV.ogg', volume = 20), null),
		MOVE_ACTOR(actor("Гора - 5-1-11"), WEST),
		MOVE_ACTOR(actor("Фройз - 5-1-11"), WEST) = 8 SECONDS,
		TALK_ACTOR(actor("Ная - 5-1-11"), "Так и будешь молчать?") = 6 SECONDS,
		TALK_ACTOR(actor("Ная - 5-1-11"), "Послушай, поезд ушёл.") = 4 SECONDS,
		TALK_ACTOR(actor("Ная - 5-1-11"), "Если ты здесь для того чтобы читать мне нотации - уже слишком-") = 4 SECONDS,
		PLAY_SOUND(sound('sound/mecha/mechstep03.ogg', volume = 10), null),
		MOVE_ACTOR(actor("Перси - 5-1-11"), WEST),
		TALK_ACTOR(actor("Амелия - 5-1-11"), "+Я хочу пойти с вами+!") = 4 SECONDS,

		TALK_ACTOR(actor("Ная - 5-1-11"), "...чего?") = 4 SECONDS,
		TALK_ACTOR(actor("Амелия - 5-1-11"), "Речь идёт и о +моих+ близких тоже!") = 6 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/asteroid4.ogg', volume = 70), null),
		MOVE_ACTOR(actor("Амелия - 5-1-11"), WEST),
		TALK_ACTOR(actor("Амелия - 5-1-11"), "По-твоему я буду просто стоять и смотреть на то как вы бросаетесь в пекло?") = 4 SECONDS,
		PLAY_SOUND(sound('packs/infinity/sound/voice/sigh_female.ogg', volume = 10), null),
		TALK_ACTOR(actor("Ная - 5-1-11"), "!вздыхает.") = 4 SECONDS,
		TALK_ACTOR(actor("Ная - 5-1-11"), "Мелкая, мне сейчас не до твоего юношеского максимализма.") = 6 SECONDS,
		TALK_ACTOR(actor("Ная - 5-1-11"), "Ты выбрала ужасное время для того чтобы по-геройствовать. Или это Эндсли тебя надоумил?") = 8 SECONDS,
		PLAY_SOUND(sound('sound/mecha/mechstep03.ogg', volume = 10), null),
		MOVE_ACTOR(actor("Перси - 5-1-11"), WEST),
		TALK_ACTOR(actor("Перси - 5-1-11"), "Меня десять минут назад собрали - сама как думаешь?") = 6 SECONDS,
		TALK_ACTOR(actor("Амелия - 5-1-11"), "Это моя личная инициатива. +Позволь+ мне помочь вам.") = 6 SECONDS,
		TALK_ACTOR(actor("Амелия - 5-1-11"), "Фиддлер прав - идти туда без какого-либо плана слишком опасно-") = 4 SECONDS,
		TALK_ACTOR(actor("Ная - 5-1-11"), "...началось."),
		TURN_ACTOR(actor("Ная - 5-1-11"), SOUTH) = 2 SECONDS,
		TALK_ACTOR(actor("Амелия - 5-1-11"), "...но вместе с моими способностями и новым телом Перси - у нас может быть шанс!") = 4 SECONDS,
		TALK_ACTOR(actor("Ная - 5-1-11"), "Нет.") = 4 SECONDS,
		TURN_ACTOR(actor("Ная - 5-1-11"), EAST) = 2 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/ambienceNV.ogg', volume = 20), null),
		PLAY_SOUND(sound('sound/effects/footstep/asteroid2.ogg', volume = 70), null),
		MOVE_ACTOR(actor("Ная - 5-1-11"), EAST),
		TALK_ACTOR(actor("Ная - 5-1-11"), "Не будет у нас никакого +шанса+.") = 4 SECONDS,
		TALK_ACTOR(actor("Ная - 5-1-11"), "Ты просто убьёшь и себя тоже. А бункер останется без единственного нормального механика.") = 6 SECONDS,
		TALK_ACTOR(actor("Ная - 5-1-11"), "Конец истории.") = 4 SECONDS,
		TALK_ACTOR(actor("Амелия - 5-1-11"), "...") = 2 SECONDS,
		TALK_ACTOR(actor("Амелия - 5-1-11"), "Так это действительно правда?") = 6 SECONDS,
		TALK_ACTOR(actor("Ная - 5-1-11"), "А?") = 3 SECONDS,
		TALK_ACTOR(actor("Амелия - 5-1-11"), "Ты и не планировала возвращаться.") = 6 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/IBO - Trust in Orga.mp3', volume = 50), "Trust in Orga (IBO)"),
		TALK_ACTOR(actor("Ная - 5-1-11"), "!опускает взгляд на куртку в руке.") = 4 SECONDS,
		CHANGE_ACTOR_VISUALS(actor("Ная - 5-1-11"), "EP5 PAGE 1 - 7"),
		SHIFT_ACTOR(actor("Ная - 5-1-11"), 8, 0, 0.5 SECONDS, SINE_EASING|EASE_IN, null) = 2 SECONDS,
		TALK_ACTOR(actor("Ная - 5-1-11"), "Ты их вроде бы коллекционируешь.") = 2 SECONDS,
		SHIFT_ACTOR(actor("Ная - 5-1-11"), 0, 0, 0.5 SECONDS, SINE_EASING|EASE_OUT, null),
		CHANGE_ACTOR_VISUALS(actor("Ная - 5-1-11"), "Final Cool"),
		CHANGE_ACTOR_VISUALS(actor("Амелия - 5-1-11"), "EP5 PAGE 1 - 8") = 4 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/ambienceNV.ogg', volume = 20), null),
		TALK_ACTOR(actor("Амелия - 5-1-11"), "Ная. Это не смешно.") = 6 SECONDS,
		TALK_ACTOR(actor("Ная - 5-1-11"), "Тебе станет легче, если я скажу что дело во мне?") = 6 SECONDS,
		TALK_ACTOR(actor("Амелия - 5-1-11"), "!ворочит головой.") = 6 SECONDS,
		TALK_ACTOR(actor("Ная - 5-1-11"), "Мелкая...я для себя уже +правда+ всё решила.") = 6 SECONDS,
		TALK_ACTOR(actor("Ная - 5-1-11"), "Повезёт - увидимся завтра. Не повезёт...") = 6 SECONDS,
		TALK_ACTOR(actor("Ная - 5-1-11"), "Ну, будет наконец-то повод отдохнуть. Если, конечно, курорты Терры настолько же хороши как их описывают.") = 6 SECONDS,
		TURN_ACTOR(actor("Ная - 5-1-11"), SOUTH) = 2 SECONDS,
		TURN_ACTOR(actor("Ная - 5-1-11"), WEST),
		PLAY_SOUND(sound('sound/effects/footstep/asteroid2.ogg', volume = 70), null),
		MOVE_ACTOR(actor("Ная - 5-1-11"), WEST) = 2 SECONDS,
		TALK_ACTOR(actor("Ная - 5-1-11"), "Месяца через два вы победите этот вездесущий ИИ, и мы снова встретимся - вот увидишь.") = 6 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/asteroid4.ogg', volume = 70), null),
		MOVE_ACTOR(actor("Амелия - 5-1-11"), WEST),
		TALK_ACTOR(actor("Амелия - 5-1-11"), "А если +нет+? Что если с тобой что-то случится? +Или мы проиграем+?! Что насчёт Горы и Фройза? Они о твоих намерениях знают?") = 10 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/ambienceNV.ogg', volume = 20), null),
		TALK_ACTOR(actor("Ная - 5-1-11"), "Я не просила их следовать за мной. Это их личная инициатива.") = 6 SECONDS,
		TALK_ACTOR(actor("Амелия - 5-1-11"), "Да ну?! А мне кажется, что кое-кто просто +боится+ умирать в одиночку!") = 8 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/asteroid2.ogg', volume = 70), null),
		MOVE_ACTOR(actor("Ная - 5-1-11"), WEST),
		TALK_ACTOR(actor("Ная - 5-1-11"), "...") = 2 SECONDS,
		TALK_ACTOR(actor("Амелия - 5-1-11"), "Прости, я-...") = 2 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/asteroid4.ogg', volume = 70), null),
		MOVE_ACTOR(actor("Ная - 5-1-11"), WEST),
		TALK_ACTOR(actor("Ная - 5-1-11"), "Тебе не за что извиняться. Всю жизнь я только и делала что тянула других за собой на дно.") = 8 SECONDS,
		TALK_ACTOR(actor("Ная - 5-1-11"), "Твоего отца в том числе.") = 2 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/asteroid1.ogg', volume = 70), null),
		MOVE_ACTOR(actor("Ная - 5-1-11"), WEST),
		TALK_ACTOR(actor("Амелия - 5-1-11"), "...Ф-Фокс.") = 4 SECONDS,
		TURN_ACTOR(actor("Ная - 5-1-11"), SOUTH),
		CHANGE_ACTOR_VISUALS(actor("Ная - 5-1-11"), "EP5 PAGE 1 - 8"),
		TALK_ACTOR(actor("Ная - 5-1-11"), "Всё нормально, мелкая. Так устроен мир. Одни дохнут чтобы придать мотивацию другим идти.") = 6 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/ambienceNV.ogg', volume = 20), null),
		TALK_ACTOR(actor("Ная - 5-1-11"), "Мне уже вошло в привычку быть во второй половине.") = 4 SECONDS,
		PLAY_SOUND(sound('packs/infinity/sound/voice/giggle_female_1.ogg', volume = 10), null),
		TALK_ACTOR(actor("Ная - 5-1-11"), "Легко проиграть - гораздо сложнее признать поражение, да?") = 6 SECONDS,

		START_CUTSCENE(/datum/modular_cutscene/s2ep5sc12)
	)

/proc/s2ep5sc12_screentext()
	var/message = {"<span style="color: yellow;">Ная</span>: ...вот и я слишком долго витала в облаках."}

	var/obj/screen/player_message/maintext = new /obj/screen/player_message()
	maintext.plane = HUD_PLANE
	maintext.layer = HUD_ABOVE_HUD_LAYER
	maintext.maptext_x = 0
	maintext.maptext_y = -310

	for(var/client/M in GLOB.clients)
		M.screen += maintext
		maintext.set_text(message, COLOR_WHITE)

	spawn(6 SECONDS)
		message = {"<span style="color: yellow;">Ная</span>: Передашь своему старпёру весточку от меня, коли найдёшь?"}
		maintext.set_text(message, COLOR_WHITE)

	spawn(12 SECONDS)
		message = {"<span style="color: yellow;">Ная</span>: Скажи, чтоб не задерживался. Пригрею для него местечко на той стороне."}
		maintext.set_text(message, COLOR_WHITE)

	spawn(18 SECONDS)
		message = ""
		maintext.set_text(message, COLOR_WHITE)

	spawn(20 SECONDS)
		message = {"<span style="color: yellow;">Ная</span>: И удачи. Это уже вам. Всем."}
		maintext.set_text(message, COLOR_WHITE)

	spawn(26 SECONDS)
		message = {"<span style="color: yellow;">Ная</span>: Она вам точно понадобится."}
		maintext.set_text(message, COLOR_WHITE)

	spawn(32 SECONDS)

		for(var/client/M in GLOB.clients)
			for(var/obj/screen/messages in M.screen)
				if(istype(messages, /obj/screen/player_message))
					M.screen -= messages
					qdel(messages)

/datum/modular_cutscene/s2ep5sc12/setup_actions(...)
	actions = list(
		EASY_TRANSFORM_ACTOR(actor("Глаза Наи - 5-1-12"), 6, 0),
		CHANGE_ACTOR_LAYER(actor("Глаза Наи - 5-1-12"), 4.03),

		EASY_TRANSFORM_ACTOR(actor("Ная - 5-1-12"), 12, 0),
		CHANGE_ACTOR_LAYER(actor("Ная - 5-1-12"), 4.02),

		TP_CAMERA("Сцена 5-1 - Кадр 12"),
		MOVE_CAMERA(0, 0, 0, null),
		ADD_SCREEN(/cinema_borders),
		CALL_GLOB(s2ep5sc12_screentext),
		TALK_ACTOR(actor("Ная - 5-1-12"), "...вот и я слишком долго витала в облаках.") = 6 SECONDS,

		SHIFT_ACTOR(actor("Глаза Наи - 5-1-12"), 3, 0, 0.5 SECONDS, SINE_EASING|EASE_IN, null),
		CHANGE_ACTOR_VISUALS(actor("Глаза Наи - 5-1-12"), "Naia Eyes 2"),
		TALK_ACTOR(actor("Ная - 5-1-12"), "Передашь своему старпёру весточку от меня, коли найдёшь?") = 6 SECONDS,

		TALK_ACTOR(actor("Ная - 5-1-12"), "Скажи, чтоб не задерживался. Пригрею для него местечко на +той+ стороне.") = 2 SECONDS,
		CHANGE_ACTOR_VISUALS(actor("Глаза Наи - 5-1-12"), "Naia Eyes 3") = 1 SECONDS,
		CHANGE_ACTOR_VISUALS(actor("Глаза Наи - 5-1-12"), "Naia Eyes 2") = 3 SECONDS,

		TURN_ACTOR(actor("Ная - 5-1-12"), NORTH),
		TURN_ACTOR(actor("Глаза Наи - 5-1-12"), WEST),
		SHIFT_ACTOR(actor("Глаза Наи - 5-1-12"), -20, 6, 0.5 SECONDS, SINE_EASING|EASE_IN, null) = 2 SECONDS,
		TALK_ACTOR(actor("Ная - 5-1-12"), "И удачи. Это уже +вам+. Всем.") = 4 SECONDS,
		CHANGE_ACTOR_VISUALS(actor("Ная - 5-1-12"), "Final Cool"),
		TURN_ACTOR(actor("Глаза Наи - 5-1-12"), NORTH) = 2 SECONDS,
		TALK_ACTOR(actor("Ная - 5-1-12"), "Она вам точно понадобится.") = 4 SECONDS,

		START_CUTSCENE(/datum/modular_cutscene/s2ep5sc13)
	)

/proc/s2ep5sc13_screentext()
	var/message = {"<span style="color: yellow;">Персиваль</span>: Амелия."}

	var/obj/screen/player_message/maintext = new /obj/screen/player_message()
	maintext.plane = HUD_PLANE
	maintext.layer = HUD_ABOVE_HUD_LAYER
	maintext.maptext_x = 0
	maintext.maptext_y = -310

	for(var/client/M in GLOB.clients)
		M.screen += maintext
		maintext.set_text(message, COLOR_WHITE)

	spawn(4 SECONDS)
		message = ""
		maintext.set_text(message, COLOR_WHITE)

	spawn(8 SECONDS)
		message = {"<span style="color: yellow;">Амелия</span>: Да?"}
		maintext.set_text(message, COLOR_WHITE)

	spawn(12 SECONDS)
		message = {"<span style="color: yellow;">Персиваль</span>: ..."}
		maintext.set_text(message, COLOR_WHITE)

	spawn(16 SECONDS)
		message = message = {"<span style="color: yellow;">Персиваль</span>: Пойдём домой."}
		maintext.set_text(message, COLOR_WHITE)

	spawn(20 SECONDS)

		for(var/client/M in GLOB.clients)
			for(var/obj/screen/messages in M.screen)
				if(istype(messages, /obj/screen/player_message))
					M.screen -= messages
					qdel(messages)

/datum/modular_cutscene/s2ep5sc13/setup_actions(...)
	actions = list(
		EASY_TRANSFORM_ACTOR(actor("Глаза Амелии - 5-1-13"), 6, 0),
		CHANGE_ACTOR_LAYER(actor("Глаза Амелии - 5-1-13"), 4.07),

		EASY_TRANSFORM_ACTOR(actor("Стена 5-13"), 7, 0),
		CHANGE_ACTOR_LAYER(actor("Стена 5-13"), 4.01),

		EASY_TRANSFORM_ACTOR(actor("Перси - 5-1-13"), 7, 0),
		CHANGE_ACTOR_LAYER(actor("Перси - 5-1-13"), 4.02),

		EASY_TRANSFORM_ACTOR(actor("Амелия - 5-1-13"), 11, 0),
		CHANGE_ACTOR_LAYER(actor("Амелия - 5-1-13"), 4.06),

		TP_CAMERA("Сцена 5-1 - Кадр 13"),
		ADD_SCREEN(/cinema_borders) = 1 SECONDS,
		MOVE_CAMERA(0, -4, 12 SECONDS, LINEAR_EASING),
		PLAY_SOUND(sound('sound/effects/footstep/asteroid4.ogg', volume = 70), null) = 1 SECONDS,

		PLAY_SOUND(sound('sound/effects/footstep/asteroid4.ogg', volume = 60), null),
		SHIFT_ACTOR(actor("Глаза Амелии - 5-1-13"), -9, -5, 0.5 SECONDS, SINE_EASING|EASE_IN, null),
		CHANGE_ACTOR_VISUALS(actor("Глаза Амелии - 5-1-13"), "Amelia Eyes - Sad"),
		PLAY_SOUND(sound('sound/effects/footstep/asteroid4.ogg', volume = 50), null) = 1 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/asteroid4.ogg', volume = 40), null) = 1 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/asteroid4.ogg', volume = 30), null) = 1 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/asteroid4.ogg', volume = 20), null) = 1 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/asteroid4.ogg', volume = 10), null) = 2 SECONDS,
		MOVE_ACTOR(actor("Глаза Амелии - 5-1-13"), SOUTH),
		MOVE_ACTOR(actor("Амелия - 5-1-13"), SOUTH) = 3 SECONDS,
		CHANGE_ACTOR_VISUALS(actor("Глаза Амелии - 5-1-13"), "Amelia Eyes - Closed Sad"),
		SHIFT_ACTOR(actor("Глаза Амелии - 5-1-13"), -9, -11, 0.5 SECONDS, SINE_EASING|EASE_IN, null) = 2 SECONDS,

		ADD_SCREEN(/blackout) = 4 SECONDS,
		MOVE_CAMERA(0, 0, 0, LINEAR_EASING),
		REMOVE_SCREEN(/cinema_borders, 0),
		CALL_GLOB(s2ep5sc13_screentext) = 12 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/To Luna.mp3', volume = 50), "До Луны") = 6 SECONDS,
		CALL_GLOB(interactive_opening_sequence) = 0.5 SECONDS,
		REMOVE_SCREEN(/blackout, 1 SECONDS) = 0.5 SECONDS,

		RETURN_VIEWERS
	)

/// Called when the eye is modified through the set_eye() setter : /client/proc/set_eye(new_eye)
/obj/effect/cutscene_camera/opening_cameras
	icon_state = "choreo"
	invisibility = 50

/obj/effect/cutscene_camera/opening_cameras/Initialize()
	. = ..()
	alpha = 255

// Этот код - безумие. Но мне лень делать нормальный сейчас

/proc/credits_devs()
	var/novel_message = "НАД КОДОМ РАБОТАЛИ: DOCTOR ALEX, MAXIMUM123, DANILCUS, KCALCUBE"
	var/colored = COLOR_ASSEMBLY_BLACK

	var/obj/screen/novel_message/start_credits/visuals = new /obj/screen/novel_message/start_credits()
	visuals.maptext_x = -110
	visuals.maptext_y = -5
	visuals.maptext_width = 192
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 16 SECONDS)

/proc/credits_mappers()
	var/novel_message = "ПРОЕКТИРОВАЛИ ЛОКАЦИИ: PALERNO, DOCTOR ALEX"
	var/colored = COLOR_ASSEMBLY_BLACK

	var/obj/screen/novel_message/start_credits/visuals = new /obj/screen/novel_message/start_credits()
	visuals.maptext_x = -100
	visuals.maptext_y = -15
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 16 SECONDS)

/proc/credits_spriters()
	var/novel_message = "РИСОВАЛИ ДЛЯ ВАС: FAILU, DARKSOVET"
	var/colored = COLOR_ASSEMBLY_BLACK

	var/obj/screen/novel_message/start_credits/visuals = new /obj/screen/novel_message/start_credits()
	visuals.maptext_x = -110
	visuals.maptext_y = -5
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 16 SECONDS)

/proc/credits_writers_new()
	var/novel_message = "СЦЕНАРИЙ ПИСАЛИ: DOCTOR ALEX, PALERNO"
	var/colored = COLOR_ASSEMBLY_BLACK

	var/obj/screen/novel_message/start_credits/visuals = new /obj/screen/novel_message/start_credits()
	visuals.maptext_x = -110
	visuals.maptext_y = -5
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 16 SECONDS)

/proc/episode5_sponsors()
	var/novel_message = "ФИНАНСИРОВАЛИ НАШ ТРУД:"
	var/colored = COLOR_ASSEMBLY_BLACK

	var/obj/screen/novel_message/start_credits/visuals = new /obj/screen/novel_message/start_credits()
	visuals.maptext_x = -100
	visuals.maptext_y = -10
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 8 SECONDS)

/proc/episode5_sponsors2()
	var/novel_message = "KRABINATIOR3000, RaviolliBorchevidze, illerk, Grigpashtet, DenXays, Aftik, LimboBaggins, Rogver Snott, fast_zummer"
	var/colored = COLOR_ORANGE

	var/obj/screen/novel_message/start_credits/visuals = new /obj/screen/novel_message/start_credits()
	visuals.maptext_x = -110
	visuals.maptext_y = -30
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 8 SECONDS)

/proc/episode5_specials()
	var/novel_message = "ОСОБАЯ БЛАГОДАРНОСТЬ:"
	var/colored = COLOR_ASSEMBLY_BLACK

	var/obj/screen/novel_message/start_credits/visuals = new /obj/screen/novel_message/start_credits()
	visuals.maptext_x = -110
	visuals.maptext_y = -400
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 8 SECONDS)

/proc/episode5_specials2()
	var/novel_message = "CuddleAndTea, techpriest34, Zakterar, GhostGamer, Sliva, HelpMeee"
	var/colored = COLOR_ORANGE

	var/obj/screen/novel_message/start_credits/visuals = new /obj/screen/novel_message/start_credits()
	visuals.maptext_x = -110
	visuals.maptext_y = -420
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 8 SECONDS)

/proc/episode5_name()
	var/novel_message = "ЭП5:"
	var/colored = COLOR_ASSEMBLY_BLACK

	var/obj/screen/novel_message/start_credits/visuals = new /obj/screen/novel_message/start_credits()
	visuals.maptext_x = -110
	visuals.maptext_y = -410
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 10 SECONDS)

/proc/episode5_name2()
	var/novel_message = "ЛИНИИ"
	var/colored = COLOR_SABER_RED

	var/obj/screen/novel_message/start_credits/visuals = new /obj/screen/novel_message/start_credits()
	visuals.maptext_x = -83
	visuals.maptext_y = -410
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 8 SECONDS)

/proc/background_mumble_cycle()
	credits_devs()
	credits_mappers()

	spawn(20 SECONDS)
		credits_spriters()

	spawn(60 SECONDS)
		credits_writers_new()

	spawn(100 SECONDS)
		episode5_sponsors()
		episode5_sponsors2()

	spawn(140 SECONDS)
		episode5_specials()
		episode5_specials2()

	spawn(180 SECONDS)
		episode5_name()

	spawn(182 SECONDS)
		episode5_name2()

/proc/interactive_opening_sequence()

	var/list/obj/effect/cutscene_camera/opening_cameras/cameras_list = list()

	for(var/obj/effect/cutscene_camera/opening_cameras/C in world)
		cameras_list += C

	spawn(2 SECONDS)
		background_mumble_cycle()

		for(var/obj/effect/cutscene_camera/opening_cameras/C in cameras_list) // Прогонит нас через каждую существующую камеру
			for(var/client/client in GLOB.clients)
				client.mob.clear_fullscreen("borders")
				client.mob.overlay_fullscreen("borders", /obj/screen/fullscreen/fd/cinema_borders)

				client.watching_scene = TRUE

				client.adminobs = TRUE
				client.mob.reset_view(C)
			sleep(20 SECONDS)

		for(var/client/client in GLOB.clients)
			client.watching_scene = FALSE

			client.mob.clear_fullscreen("borders")
			client.adminobs = null

/client
	var/ignore_focus = FALSE
	var/watching_scene = FALSE

/client/proc/cmd_admin_camera_focus(mob/living/M as mob in SSmobs.mob_list)
	set category = "Special Verbs"
	set name = "Focus Camera"
	if(!holder)
		to_chat(src, "Only administrators may use this command!")
		return
	if(!mob)
		return
	if(!istype(M))
		alert("Cannot spectate ghost!")
		return

	if(M.client)
		M.client.ignore_focus = TRUE
		M.balloon_alert(M, "|КИНОКАМЕРА НАПРАВЛЕНА НА ВАС|", COLOR_GREEN)

	for(var/client/client in GLOB.clients)
		if(client.ignore_focus)
			continue

		if(client.holder) // Педалям может понадобиться сделать что-то во время сценки
			continue

		client.mob.overlay_fullscreen("borders", /obj/screen/fullscreen/fd/cinema_borders)

		client.watching_scene = TRUE

		client.adminobs = TRUE
		client.mob.reset_view(M)

/client/proc/cmd_admin_camera_unfocus(mob/living/M as mob in SSmobs.mob_list)
	set category = "Special Verbs"
	set name = "Unfocus Camera"
	if(!holder)
		to_chat(src, "Only administrators may use this command!")
		return
	if(!mob)
		return
	if(!istype(M))
		alert("Cannot do this with ghost!")
		return

	for(var/client/client in GLOB.clients)
		if(client.ignore_focus)
			continue
		if(client.holder)
			continue

		client.watching_scene = FALSE

		client.mob.clear_fullscreen("borders")
		client.adminobs = FALSE

	if(M.client)
		M.client.ignore_focus = FALSE
		M.balloon_alert(M, "|ЗА ВАМИ БОЛЬШЕ НЕ НАБЛЮДАЮТ|", COLOR_GOLD)

/mob/living/simple_animal/fd/terra
	universal_speak = TRUE
	universal_understand = TRUE

	name = "Terra"
	desc = "..."

	icon = 'maps/torch_doh/cutscenes/icons/Character_Terra.dmi'
	icon_state = "Current"
	icon_living = "Current"
	icon_dead = "Current"
	ai_holder = null

/mob/living/simple_animal/fd/swift
	universal_speak = TRUE
	universal_understand = TRUE

	name = "S.W.I.F.T."
	desc = "..."

	icon = 'maps/torch_doh/cutscenes/icons/Character_Swift.dmi'
	icon_state = "Final"
	icon_living = "Final"
	icon_dead = "Final"
	ai_holder = null

/obj/temp_visual/swift_electro
	duration = 0.5 SECONDS
	icon = 'mods/_fd/fd_assets/icons/goons/effects.dmi'
	icon_state = "residual_electricity_start"
	layer = 4.5

/obj/structure/fd/cutscene_ep5/manipulator
	name = "machinery"
	desc = "..."

	icon = 'mods/_fd/fd_assets/icons/goons/32x64.dmi'
	icon_state = "drone-charger-idle"

	anchored = TRUE
	layer = 4.10

/obj/structure/fd/cutscene_ep5/manipulator/proc/trigger_stage_1()
	balloon_alert_to_viewers("|ЩЁЛК!|", null, COLOR_WHITE)
	icon_state = "drone-charger-open"

/obj/structure/fd/cutscene_ep5/manipulator/proc/trigger_stage_2()
	icon_state = "drone-charger-charging"
	var/mob/living/swift

	new /obj/temp_visual/swift_electro(get_turf(src))

	for(var/mob/living/L in get_turf(src))
		swift = L

	animate(swift, transform = matrix(rand(-3,3), rand(-3,3), MATRIX_TRANSLATE), time = 0.5, easing = EASE_IN)
	for(var/i in 0 to 100)
		animate(transform = matrix(rand(-4,4), rand(-4,4), MATRIX_TRANSLATE), time = 1)
	animate(transform = matrix(0, 0, MATRIX_TRANSLATE), time = 0.5, easing = EASE_OUT)

/obj/temp_visual/admin_teleport
	duration = 5 SECONDS
	icon = 'mods/_fd/fd_assets/icons/goons/mob.dmi'
	icon_state = "unpull"
	layer = 4.5

/obj/item/fd/cutscene_ep5/teleporter
	name = "device"
	desc = "..."
	w_class = ITEM_SIZE_TINY

	icon = 'mods/_fd/fd_assets/icons/goons/device.dmi'
	icon_state = "hand_tele_s"

	var/active = FALSE

/obj/item/fd/cutscene_ep5/teleporter/attack_self(mob/living/user)
	. = ..()
	if(active)
		active = FALSE

		user.SetTransform(0)
		user.alpha = 0

		var/obj/temp_visual/admin_teleport/A = new /obj/temp_visual/admin_teleport(get_turf(user))
		animate(A, transform = matrix(3, MATRIX_SCALE), time = 1 SECONDS, easing = SINE_EASING|EASE_IN)
		animate(user, transform = matrix(1, MATRIX_SCALE), alpha = 255, time = 1 SECONDS, easing = ELASTIC_EASING|EASE_OUT)

		user.RemoveMovementHandler(/datum/movement_handler/mob/incorporeal)
		sleep(1 SECONDS)
		A.icon_state = "pull"
		user.chasm_free = FALSE

		animate(A, transform = matrix(0, MATRIX_SCALE), time = 0.5 SECONDS, easing = SINE_EASING|EASE_OUT)
		return TRUE

	if(!active)
		active = TRUE

		var/obj/temp_visual/admin_teleport/A = new /obj/temp_visual/admin_teleport(get_turf(user))
		animate(A, transform = matrix(3, MATRIX_SCALE), time = 1 SECONDS, easing = SINE_EASING|EASE_IN)
		user.AddMovementHandler(/datum/movement_handler/mob/incorporeal)

		sleep(1 SECONDS)
		A.icon_state = "pull"
		user.chasm_free = TRUE

		animate(A, transform = matrix(0, MATRIX_SCALE), time = 0.5 SECONDS, easing = SINE_EASING|EASE_OUT)
		animate(user, transform = matrix(0, MATRIX_SCALE), alpha = 0, time = 0.5 SECONDS, easing = ELASTIC_EASING|EASE_IN)

		return TRUE
