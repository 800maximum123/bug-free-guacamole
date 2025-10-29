/obj/effect/cutscene_camera/s2ep2sc13
	camera_id = "Сцена 2-2 - Кадр 1"

/proc/fds2ep2_cutscene2()
	start_cutscene(/datum/modular_cutscene/s2ep2sc13)

/datum/modular_cutscene/s2ep2sc13/setup_actions(...)
	actions = list(
		ADD_SCREEN(/blackout/animated_better) = 4 SECONDS,
		REMOVE_SCREEN(/blackout/animated_better, 1 SECONDS),
		TP_CAMERA("Сцена 2-2 - Кадр 1"),
		ADD_SCREEN(/cinema_borders),
		TALK_ACTOR(actor("Вильгельм - 2-2-1"), "Выглядишь неважно. Тяжёлый день?"),
		TALK_ACTOR(actor("Амелия - 2-2-1"), "Тяжёлая неделя."),
		TALK_ACTOR(actor("Амелия - 2-2-1"), "А вы что? Удивительно хорошо держитесь для кого-то в вашей кондиции."),
		TALK_ACTOR(actor("Вильгельм - 2-2-1"), "Дело навыка..."),
		TALK_ACTOR(actor("Вильгельм - 2-2-1"), "Вообще-то, я должен поблагодарить плешивую за то время, которое у меня УЖЕ есть."),
		TALK_ACTOR(actor("Вильгельм - 2-2-1"), "Я ведь должен был умереть примерно на месяц раньше."),
	)
