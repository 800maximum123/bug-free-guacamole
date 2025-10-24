/proc/episode2_name()
	var/novel_message = "ЭП2:"
	var/colored = COLOR_ASSEMBLY_BLACK

	var/obj/screen/novel_message/start_credits/visuals = new /obj/screen/novel_message/start_credits()
	visuals.maptext_x = -110
	visuals.maptext_y = -5
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 6 SECONDS)

/proc/episode2_name2()
	var/novel_message = "ПЕПЕЛЬНЫЕ ЦВЕТЫ"
	var/colored = COLOR_SABER_RED

	var/obj/screen/novel_message/start_credits/visuals = new /obj/screen/novel_message/start_credits()
	visuals.maptext_x = -85
	visuals.maptext_y = -5
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 6 SECONDS)

/proc/episode2_meatteller1()
	var/novel_message = "Похоже, что это наше прощанье, старый друг?"
	var/colored = MANIFEST_COLOR_EXPLORER

	var/obj/screen/novel_message/start_credits/nofade/visuals = new /obj/screen/novel_message/start_credits/nofade()
	visuals.maptext_x = 5
	visuals.maptext_y = -410
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 8 SECONDS)

/proc/episode2_meatteller2()
	var/novel_message = "Подумать только... два десятка минуло? И только?"
	var/colored = MANIFEST_COLOR_EXPLORER

	var/obj/screen/novel_message/start_credits/nofade/visuals = new /obj/screen/novel_message/start_credits/nofade()
	visuals.maptext_x = 5
	visuals.maptext_y = -410
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 8 SECONDS)

/proc/episode2_meatteller3()
	var/novel_message = "Чувство такое, словно мы были связаны веками."
	var/colored = MANIFEST_COLOR_EXPLORER

	var/obj/screen/novel_message/start_credits/nofade/visuals = new /obj/screen/novel_message/start_credits/nofade()
	visuals.maptext_x = 5
	visuals.maptext_y = -410
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 8 SECONDS)

/proc/episode2_meatteller4()
	var/novel_message = "Я что, действительно стал сентиментальней?"
	var/colored = MANIFEST_COLOR_EXPLORER

	var/obj/screen/novel_message/start_credits/nofade/visuals = new /obj/screen/novel_message/start_credits/nofade()
	visuals.maptext_x = 5
	visuals.maptext_y = -410
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 8 SECONDS)

/proc/episode2_meatteller5()
	var/novel_message = "Так неспокойно на душе..."
	var/colored = MANIFEST_COLOR_EXPLORER

	var/obj/screen/novel_message/start_credits/nofade/visuals = new /obj/screen/novel_message/start_credits/nofade()
	visuals.maptext_x = 5
	visuals.maptext_y = -410
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 8 SECONDS)

/proc/episode2_meatteller6()
	var/novel_message = "Я не удивлюсь тому, что твою жертву забудут уже через месяц."
	var/colored = MANIFEST_COLOR_EXPLORER

	var/obj/screen/novel_message/start_credits/nofade/visuals = new /obj/screen/novel_message/start_credits/nofade()
	visuals.maptext_x = 5
	visuals.maptext_y = -410
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 8 SECONDS)

/proc/episode2_meatteller7()
	var/novel_message = "Не расстраивайся. В движении - жизнь, и с этим мало что сделаешь."
	var/colored = MANIFEST_COLOR_EXPLORER

	var/obj/screen/novel_message/start_credits/nofade/visuals = new /obj/screen/novel_message/start_credits/nofade()
	visuals.maptext_x = 5
	visuals.maptext_y = -410
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 8 SECONDS)

/proc/episode2_meatteller8()
	var/novel_message = "Обещаю, что буду приносить на твою могилу цветы. Домашние."
	var/colored = MANIFEST_COLOR_EXPLORER

	var/obj/screen/novel_message/start_credits/nofade/visuals = new /obj/screen/novel_message/start_credits/nofade()
	visuals.maptext_x = 5
	visuals.maptext_y = -410
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 8 SECONDS)

/proc/episode2_meatteller9()
	var/novel_message = "Знаю, ты их любишь. Хоть и выделывался первое время."
	var/colored = MANIFEST_COLOR_EXPLORER

	var/obj/screen/novel_message/start_credits/nofade/visuals = new /obj/screen/novel_message/start_credits/nofade()
	visuals.maptext_x = 5
	visuals.maptext_y = -410
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 8 SECONDS)

/proc/episode2_meatteller10()
	var/novel_message = "А пока - отдохни. Ты и так превзошёл все возможные лимиты."
	var/colored = MANIFEST_COLOR_EXPLORER

	var/obj/screen/novel_message/start_credits/nofade/visuals = new /obj/screen/novel_message/start_credits/nofade()
	visuals.maptext_x = 5
	visuals.maptext_y = -410
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 8 SECONDS)

/proc/episode2_meatteller11()
	var/novel_message = "Пора бы и нам приложить чуточку усилий. Согласен?"
	var/colored = MANIFEST_COLOR_EXPLORER

	var/obj/screen/novel_message/start_credits/nofade/visuals = new /obj/screen/novel_message/start_credits/nofade()
	visuals.maptext_x = 5
	visuals.maptext_y = -410
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 8 SECONDS)

/obj/effect/cutscene_camera/s2ep2sc1
	camera_id = "Сцена 2-1 - Кадр 1"

/obj/effect/cutscene_camera/s2ep2sc2
	camera_id = "Сцена 2-1 - Кадр 2"

/obj/effect/cutscene_camera/s2ep2sc3
	camera_id = "Сцена 2-1 - Кадр 3"

/obj/effect/cutscene_camera/s2ep2sc4
	camera_id = "Сцена 2-1 - Кадр 4"

/obj/effect/cutscene_camera/s2ep2sc5
	camera_id = "Сцена 2-1 - Кадр 5"

/obj/effect/cutscene_camera/s2ep2sc6
	camera_id = "Сцена 2-1 - Кадр 6"

/obj/effect/cutscene_camera/s2ep2sc7
	camera_id = "Сцена 2-1 - Кадр 7"

/obj/effect/cutscene_camera/s2ep2sc8
	camera_id = "Сцена 2-1 - Кадр 8"

/obj/effect/cutscene_camera/s2ep2sc9
	camera_id = "Сцена 2-1 - Кадр 9"

/proc/fds2ep2_cutscene1()
	start_cutscene(/datum/modular_cutscene/s2ep2sc1)

/datum/modular_cutscene/s2ep2sc1/setup_actions(...)
	actions = list(
		ADD_SCREEN(/blackout/animated_better) = 2 SECONDS,
		CALL_GLOB(episode2_name),
		CALL_GLOB(episode2_name2) = 6 SECONDS,
		REMOVE_SCREEN(/blackout/animated_better, 1 SECONDS),
		TP_CAMERA("Сцена 2-1 - Кадр 1"),
		ADD_SCREEN(/cinema_borders),
		MOVE_CAMERA(-5, 0, 0, null),
		ADD_SCREEN(/blackout/animated_better/nofade) = 1 SECONDS,
		REMOVE_SCREEN(/blackout/animated_better/nofade, 3 SECONDS) = 3 SECONDS,
		MOVE_CAMERA(0, 0, 10 SECONDS, SINE_EASING|EASE_IN),
		CALL_GLOB(episode2_meatteller1),
		MOVE_ACTOR(actor("Мешок 1 - 2-1-1"), SOUTH),
		MOVE_ACTOR(actor("Гора - 2-1-1"), SOUTH) = 3 SECONDS,
		TURN_ACTOR(actor("Мясо - 2-1-1"), SOUTH),
		MOVE_ACTOR(actor("Мешок 2 - 2-1-1"), SOUTH),
		MOVE_ACTOR(actor("Луни - 2-1-1"), SOUTH) = 0.5 SECONDS,
		MOVE_ACTOR(actor("Мешок 1 - 2-1-1"), SOUTH),
		MOVE_ACTOR(actor("Гора - 2-1-1"), SOUTH),
		MOVE_ACTOR(actor("Мешок 2 - 2-1-1"), SOUTH),
		MOVE_ACTOR(actor("Луни - 2-1-1"), SOUTH) = 1 SECONDS,
		MOVE_ACTOR(actor("Мешок 1 - 2-1-1"), SOUTH),
		TURN_ACTOR(actor("Гора - 2-1-1"), WEST),
		MOVE_ACTOR(actor("Гора - 2-1-1"), EAST),
		MOVE_ACTOR(actor("Мешок 2 - 2-1-1"), SOUTH),
		MOVE_ACTOR(actor("Луни - 2-1-1"), SOUTH) = 0.5 SECONDS,
		MOVE_ACTOR(actor("Мешок 1 - 2-1-1"), EAST),
		TURN_ACTOR(actor("Гора - 2-1-1"), NORTH),
		MOVE_ACTOR(actor("Гора - 2-1-1"), SOUTH) = 1 SECONDS,
		MOVE_ACTOR(actor("Мешок 2 - 2-1-1"), SOUTH),
		MOVE_ACTOR(actor("Мешок 1 - 2-1-1"), SOUTH),
		TURN_ACTOR(actor("Мясо - 2-1-1"), EAST),
		MOVE_ACTOR(actor("Гора - 2-1-1"), SOUTH) = 1 SECONDS,
		MOVE_ACTOR(actor("Мешок 1 - 2-1-1"), SOUTH),
		MOVE_ACTOR(actor("Гора - 2-1-1"), SOUTH) = 1 SECONDS,
		MOVE_ACTOR(actor("Мешок 1 - 2-1-1"), SOUTH),
		MOVE_ACTOR(actor("Гора - 2-1-1"), SOUTH) = 0.5 SECONDS,
		MOVE_ACTOR(actor("Мешок 1 - 2-1-1"), SOUTH),
		MOVE_ACTOR(actor("Гора - 2-1-1"), SOUTH) = 0.5 SECONDS,
		MOVE_ACTOR(actor("Мясо - 2-1-1"), EAST) = 0.5 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/s2ep2sc2)
	)

/datum/modular_cutscene/s2ep2sc2/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 2-1 - Кадр 2"),
		ADD_SCREEN(/cinema_borders),
		MOVE_CAMERA(5, 0, 10 SECONDS, SINE_EASING|EASE_IN),
		CALL_GLOB(episode2_meatteller2),
		MOVE_ACTOR(actor("Ная - 2-1-2"), WEST),
		MOVE_ACTOR(actor("Фиддлер - 2-1-2"), WEST) = 2 SECONDS,
		MOVE_ACTOR(actor("Ная - 2-1-2"), WEST),
		MOVE_ACTOR(actor("Фиддлер - 2-1-2"), WEST) = 2 SECONDS,
		MOVE_ACTOR(actor("Ная - 2-1-2"), WEST),
		MOVE_ACTOR(actor("Фиддлер - 2-1-2"), WEST) = 2 SECONDS,
		MOVE_ACTOR(actor("Ная - 2-1-2"), WEST),
		MOVE_ACTOR(actor("Фиддлер - 2-1-2"), WEST) = 2 SECONDS,
		MOVE_ACTOR(actor("Ная - 2-1-2"), WEST),
		MOVE_ACTOR(actor("Фиддлер - 2-1-2"), WEST) = 0.5 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/s2ep2sc3)
	)

/datum/modular_cutscene/s2ep2sc3/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 2-1 - Кадр 3"),
		MOVE_CAMERA(0, 0, 0, null),
		ADD_SCREEN(/cinema_borders),
		CALL_GLOB(episode2_meatteller3) = 0.5 SECONDS,
		TURN_ACTOR(actor("Датура - 2-1-3"), SOUTH) = 2 SECONDS,
		MOVE_ACTOR(actor("Датура - 2-1-3"), SOUTH) = 4 SECONDS,
		MOVE_CAMERA(0, -5, 2 SECONDS, SINE_EASING|EASE_IN),
		TURN_ACTOR(actor("Датура - 2-1-3"), WEST) = 2 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/s2ep2sc4)
	)

/datum/modular_cutscene/s2ep2sc4/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 2-1 - Кадр 4"),
		ADD_SCREEN(/cinema_borders),
		MOVE_CAMERA(0, 5, 0, null),
		MOVE_CAMERA(0, 0, 10 SECONDS, SINE_EASING|EASE_IN),
		CALL_GLOB(episode2_meatteller4),
		MOVE_ACTOR(actor("Ящик - 1"), SOUTH),
		MOVE_ACTOR(actor("Злата - 2-1-4"), SOUTH),
		MOVE_ACTOR(actor("Ящик - 2"), NORTH),
		MOVE_ACTOR(actor("Фройз - 2-1-4"), NORTH) = 2 SECONDS,
		MOVE_ACTOR(actor("Ящик - 3"), EAST),
		MOVE_ACTOR(actor("Лира - 2-1-4"), EAST),
		TURN_ACTOR(actor("Амелия - 2-1-4"), EAST),
		MOVE_ACTOR(actor("Ящик - 1"), SOUTH),
		MOVE_ACTOR(actor("Злата - 2-1-4"), SOUTH),
		MOVE_ACTOR(actor("Ящик - 2"), NORTH),
		MOVE_ACTOR(actor("Фройз - 2-1-4"), NORTH) = 2 SECONDS,
		MOVE_ACTOR(actor("Ящик - 1"), SOUTH),
		MOVE_ACTOR(actor("Злата - 2-1-4"), SOUTH),
		MOVE_ACTOR(actor("Ящик - 2"), NORTH),
		MOVE_ACTOR(actor("Фройз - 2-1-4"), NORTH) = 2 SECONDS,
		MOVE_ACTOR(actor("Ящик - 3"), EAST),
		MOVE_ACTOR(actor("Лира - 2-1-4"), EAST),
		TURN_ACTOR(actor("Лира - 2-1-4"), EAST) = 2 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/s2ep2sc5)
	)

/datum/modular_cutscene/s2ep2sc5/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 2-1 - Кадр 5"),
		ADD_SCREEN(/cinema_borders),
		CALL_GLOB(episode2_meatteller5) = 8 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/s2ep2sc6)
	)

/datum/modular_cutscene/s2ep2sc6/setup_actions(...)
	actions = list()
