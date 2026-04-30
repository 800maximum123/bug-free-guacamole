/obj/effect/cutscene_camera/s2ep5sc1
	camera_id = "Сцена 5-1 - Кадр 1"

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

	spawn(3 SECONDS)
		message = {"<span style="color: yellow;">Амелия</span>: Кажется...всё."}
		maintext.set_text(message, COLOR_WHITE)

	spawn(7 SECONDS)
		message = {"<span style="color: yellow;">Амелия</span>: Попробуй встать."}
		maintext.set_text(message, COLOR_WHITE)

	spawn(14 SECONDS)

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

		SHIFT_ACTOR(actor("Амелия - 5-1-1"), 15, 0, 1 SECONDS, SINE_EASING|EASE_OUT, null),
		CHANGE_ACTOR_VISUALS(actor("Амелия - 5-1-1"), "EP5 PAGE 1 - 1NOEYES"),

		SHIFT_ACTOR(actor("Глаза Амелии - 5-1-1"), 30, 17, 1 SECONDS, SINE_EASING|EASE_OUT, null) = 0.5 SECONDS,

		CHANGE_ACTOR_VISIBILITY(actor("Клава 1"), 255, 1 SECONDS, LINEAR_EASING, null) = 0.5 SECONDS,

		CHANGE_ACTOR_VISIBILITY(actor("Клава 4"), 255, 0.5 SECONDS, LINEAR_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Клава 1"), 0, 1 SECONDS, LINEAR_EASING, null) = 0.5 SECONDS,

		CHANGE_ACTOR_VISIBILITY(actor("Клава 2"), 255, 0.5 SECONDS, LINEAR_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Клава 4"), 0, 1 SECONDS, LINEAR_EASING, null) = 0.5 SECONDS,

		CHANGE_ACTOR_VISIBILITY(actor("Клава 1"), 255, 0.5 SECONDS, LINEAR_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Клава 2"), 0, 1 SECONDS, LINEAR_EASING, null) = 0.5 SECONDS,

		CHANGE_ACTOR_VISIBILITY(actor("Клава 3"), 255, 0.5 SECONDS, LINEAR_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Клава 1"), 0, 1 SECONDS, LINEAR_EASING, null) = 0.5 SECONDS,

		CHANGE_ACTOR_VISIBILITY(actor("Клава 3"), 0, 0.5 SECONDS, LINEAR_EASING, null),

		CHANGE_ACTOR_VISUALS(actor("Глаза Амелии - 5-1-1"), "Amelia Eyes - Really"),

		SHIFT_ACTOR(actor("Глаза Амелии - 5-1-1"), 36, 19, 0.5 SECONDS, LINEAR_EASING, null),
		EASY_TRANSFORM_ACTOR(actor("Глаза Амелии - 5-1-1"), 4, 2),
		EASY_TRANSFORM_ACTOR(actor("Амелия - 5-1-1"), 9, 1) = 0.05 SECONDS,
		EASY_TRANSFORM_ACTOR(actor("Глаза Амелии - 5-1-1"), 4, 4),
		EASY_TRANSFORM_ACTOR(actor("Амелия - 5-1-1"), 9, 2) = 0.05 SECONDS,
		EASY_TRANSFORM_ACTOR(actor("Глаза Амелии - 5-1-1"), 4, 6),
		EASY_TRANSFORM_ACTOR(actor("Амелия - 5-1-1"), 9, 3) = 0.05 SECONDS,
		EASY_TRANSFORM_ACTOR(actor("Глаза Амелии - 5-1-1"), 4, 8),
		EASY_TRANSFORM_ACTOR(actor("Амелия - 5-1-1"), 9, 4) = 0.05 SECONDS,
		EASY_TRANSFORM_ACTOR(actor("Амелия - 5-1-1"), 9, 5) = 1 SECONDS,
		CHANGE_ACTOR_VISUALS(actor("Глаза Амелии - 5-1-1"), "Amelia Eyes - Really") = 1 SECONDS,

		TURN_ACTOR(actor("Глаза Амелии - 5-1-1"), NORTH),
		CHANGE_ACTOR_VISUALS(actor("Амелия - 5-1-1"), "EP5 PAGE 1 - 2NOEYES") = 100 SECONDS,

	)
