/obj/effect/cutscene_camera/s2ep5sc1
	camera_id = "Сцена 5-1 - Кадр 1"

/proc/fds2ep5_cutscene1()
	start_cutscene(/datum/modular_cutscene/s2ep5sc1)

/datum/modular_cutscene/s2ep5sc1/setup_actions(...)
	actions = list(
		ADD_SCREEN(/blackout/animated_better) = 4 SECONDS,
		MOVE_CAMERA(0, -3, 0, null),

		EASY_TRANSFORM_ACTOR(actor("Комп 5"), 7, 0),
		CHANGE_ACTOR_LAYER(actor("Комп 5"), 4.05),

		EASY_TRANSFORM_ACTOR(actor("Глаза Амелии - 5-1-1"), 6, 0),
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
	)
