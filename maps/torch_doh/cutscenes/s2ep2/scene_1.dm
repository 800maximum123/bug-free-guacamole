/proc/episode2_team()
	var/novel_message = "ПРОИЗВОДСТВО ТО \"UNDERGROUND FRONT\""
	var/colored = COLOR_ASSEMBLY_BLACK

	var/obj/screen/novel_message/start_credits/visuals = new /obj/screen/novel_message/start_credits()
	visuals.maptext_x = -110
	visuals.maptext_y = -410
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 6 SECONDS)

/proc/episode2_team2()
	var/novel_message = "\"FINAL DESTINATION\""
	var/colored = COLOR_SABER_RED

	var/obj/screen/novel_message/start_credits/visuals = new /obj/screen/novel_message/start_credits()
	visuals.maptext_x = -110
	visuals.maptext_y = -410
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 10 SECONDS)

/proc/episode2_sponsors()
	var/novel_message = "ДАННЫЙ ЗАПУСК СУЩЕСТВУЕТ БЛАГОДАРЯ:"
	var/colored = COLOR_ASSEMBLY_BLACK

	var/obj/screen/novel_message/start_credits/visuals = new /obj/screen/novel_message/start_credits()
	visuals.maptext_x = -110
	visuals.maptext_y = -5
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 6 SECONDS)

/proc/episode2_sponsors2()
	var/novel_message = "Sliva, Aftik, Vista1, Farewellsainty, DenXays, Grigpashtet, RaviolliBorchevidze"
	var/colored = COLOR_ORANGE

	var/obj/screen/novel_message/start_credits/visuals = new /obj/screen/novel_message/start_credits()
	visuals.maptext_x = -110
	visuals.maptext_y = -30
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 6 SECONDS)

/proc/episode2_meatteller1()
	var/novel_message = "Сколько прошло? Лет двадцать?"
	var/colored = MANIFEST_COLOR_EXPLORER

	var/obj/screen/novel_message/start_credits/nofade/visuals = new /obj/screen/novel_message/start_credits/nofade()
	visuals.maptext_x = 0
	visuals.maptext_y = -410
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 8 SECONDS)

/proc/episode2_meatteller2()
	var/novel_message = "Я и отвык от того как это - стоять на своих двоих."
	var/colored = MANIFEST_COLOR_EXPLORER

	var/obj/screen/novel_message/start_credits/nofade/visuals = new /obj/screen/novel_message/start_credits/nofade()
	visuals.maptext_x = 0
	visuals.maptext_y = -410
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 8 SECONDS)

/proc/episode2_meatteller3()
	var/novel_message = "Не то что бы я вовсе хотел это вспоминать. Уж точно не так."
	var/colored = MANIFEST_COLOR_EXPLORER

	var/obj/screen/novel_message/start_credits/nofade/visuals = new /obj/screen/novel_message/start_credits/nofade()
	visuals.maptext_x = 0
	visuals.maptext_y = -410
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 8 SECONDS)

/proc/episode2_meatteller4()
	var/novel_message = "Но, раз выбора у меня всё равно нет - позволишь задать последний вопрос?"
	var/colored = MANIFEST_COLOR_EXPLORER

	var/obj/screen/novel_message/start_credits/nofade/visuals = new /obj/screen/novel_message/start_credits/nofade()
	visuals.maptext_x = 0
	visuals.maptext_y = -410
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 8 SECONDS)

/proc/episode2_meatteller5()
	var/novel_message = "Сделали ли я достаточно? Мог ли сделать больше?"
	var/colored = MANIFEST_COLOR_EXPLORER

	var/obj/screen/novel_message/start_credits/nofade/visuals = new /obj/screen/novel_message/start_credits/nofade()
	visuals.maptext_x = 0
	visuals.maptext_y = -410
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 4 SECONDS)

/proc/episode2_meatteller6()
	var/novel_message = "Мог ли... итог быть другим? Или мы просто оттягивали неизбежное?"
	var/colored = MANIFEST_COLOR_EXPLORER

	var/obj/screen/novel_message/start_credits/nofade/visuals = new /obj/screen/novel_message/start_credits/nofade()
	visuals.maptext_x = 0
	visuals.maptext_y = -410
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 6 SECONDS)

/proc/episode2_meatteller7()
	var/novel_message = "...Ная права. После смерти Лили я слишком сильно закрылся в себе."
	var/colored = MANIFEST_COLOR_EXPLORER

	var/obj/screen/novel_message/start_credits/nofade/visuals = new /obj/screen/novel_message/start_credits/nofade()
	visuals.maptext_x = 0
	visuals.maptext_y = -410
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 4 SECONDS)

/proc/episode2_meatteller8()
	var/novel_message = "Лишь моё безразличие несёт ответственность за то, что их с нами больше нет."
	var/colored = MANIFEST_COLOR_EXPLORER

	var/obj/screen/novel_message/start_credits/nofade/visuals = new /obj/screen/novel_message/start_credits/nofade()
	visuals.maptext_x = 0
	visuals.maptext_y = -410
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 4 SECONDS)

/proc/episode2_meatteller9()
	var/novel_message = "Может, если бы это осознание озарило меня чуточку раньше..."
	var/colored = MANIFEST_COLOR_EXPLORER

	var/obj/screen/novel_message/start_credits/nofade/visuals = new /obj/screen/novel_message/start_credits/nofade()
	visuals.maptext_x = 0
	visuals.maptext_y = -410
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 6 SECONDS)

/proc/episode2_meatteller10()
	var/novel_message = "Смотрите далее, в \"FINAL DESTINATION\""
	var/colored = MANIFEST_COLOR_EXPLORER

	var/obj/screen/novel_message/start_credits/nofade/visuals = new /obj/screen/novel_message/start_credits/nofade()
	visuals.maptext_x = 0
	visuals.maptext_y = -410
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 8 SECONDS)

/proc/episode2_name()
	var/novel_message = "ЭП2:"
	var/colored = COLOR_ASSEMBLY_BLACK

	var/obj/screen/novel_message/start_credits/visuals = new /obj/screen/novel_message/start_credits()
	visuals.maptext_x = -110
	visuals.maptext_y = -410
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 10 SECONDS)

/proc/episode2_name2()
	var/novel_message = "ОТГОЛОСКИ"
	var/colored = COLOR_SABER_RED

	var/obj/screen/novel_message/start_credits/visuals = new /obj/screen/novel_message/start_credits()
	visuals.maptext_x = -88
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

/obj/effect/cutscene_camera/s2ep2sc10
	camera_id = "Сцена 2-1 - Кадр 10"

/obj/effect/cutscene_camera/s2ep2sc11
	camera_id = "Сцена 2-1 - Кадр 11"

/obj/effect/cutscene_camera/s2ep2sc12
	camera_id = "Сцена 2-1 - Кадр 12"

/proc/fds2ep2_cutscene1()
	start_cutscene(/datum/modular_cutscene/s2ep2sc1)

/datum/modular_cutscene/s2ep2sc1/setup_actions(...)
	actions = list(
		ADD_SCREEN(/blackout/animated_better) = 2 SECONDS,
		CALL_GLOB(episode2_sponsors),
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/ambienceriver.ogg', volume = 50)),
		CALL_GLOB(episode2_sponsors2) = 4 SECONDS,
		REMOVE_SCREEN(/blackout/animated_better, 1 SECONDS),
		TP_CAMERA("Сцена 2-1 - Кадр 1"),
		ADD_SCREEN(/cinema_borders),
		MOVE_CAMERA(-5, 0, 0, null),
		ADD_SCREEN(/blackout/animated_better/nofade) = 1 SECONDS,
		REMOVE_SCREEN(/blackout/animated_better/nofade, 3 SECONDS) = 3 SECONDS,
		MOVE_CAMERA(0, 0, 10 SECONDS, SINE_EASING|EASE_IN),
		MOVE_ACTOR(actor("Мешок 1 - 2-1-1"), SOUTH),
		PLAY_SOUND(sound('sound/effects/footstep/plating3.ogg', volume = 70)),
		MOVE_ACTOR(actor("Гора - 2-1-1"), SOUTH) = 3 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/plating5.ogg', volume = 70)),
		MOVE_ACTOR(actor("Мешок 2 - 2-1-1"), SOUTH),
		MOVE_ACTOR(actor("Луни - 2-1-1"), SOUTH) = 0.5 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/plating3.ogg', volume = 70)),
		MOVE_ACTOR(actor("Мешок 1 - 2-1-1"), SOUTH),
		MOVE_ACTOR(actor("Гора - 2-1-1"), SOUTH),
		MOVE_ACTOR(actor("Мешок 2 - 2-1-1"), SOUTH),
		TALK_ACTOR(actor("Мясо - 2-1-1"), "!стучит по поручню."),
		MOVE_ACTOR(actor("Луни - 2-1-1"), SOUTH) = 1 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/plating1.ogg', volume = 70)),
		MOVE_ACTOR(actor("Мешок 1 - 2-1-1"), SOUTH),
		TURN_ACTOR(actor("Гора - 2-1-1"), WEST),
		MOVE_ACTOR(actor("Гора - 2-1-1"), EAST),
		MOVE_ACTOR(actor("Мешок 2 - 2-1-1"), SOUTH),
		MOVE_ACTOR(actor("Луни - 2-1-1"), SOUTH) = 0.5 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/plating2.ogg', volume = 70)),
		MOVE_ACTOR(actor("Мешок 1 - 2-1-1"), EAST),
		TURN_ACTOR(actor("Гора - 2-1-1"), NORTH),
		MOVE_ACTOR(actor("Гора - 2-1-1"), SOUTH) = 1 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/plating3.ogg', volume = 70)),
		MOVE_ACTOR(actor("Мешок 2 - 2-1-1"), SOUTH),
		MOVE_ACTOR(actor("Мешок 1 - 2-1-1"), SOUTH),
		MOVE_ACTOR(actor("Гора - 2-1-1"), SOUTH) = 1 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/plating4.ogg', volume = 70)),
		MOVE_ACTOR(actor("Мешок 1 - 2-1-1"), SOUTH),
		MOVE_ACTOR(actor("Гора - 2-1-1"), SOUTH) = 1 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/plating5.ogg', volume = 70)),
		MOVE_ACTOR(actor("Мешок 1 - 2-1-1"), SOUTH),
		MOVE_ACTOR(actor("Гора - 2-1-1"), SOUTH) = 0.5 SECONDS,
		TALK_ACTOR(actor("Мясо - 2-1-1"), "Вот и всё, значит?"),
		PLAY_SOUND(sound('sound/effects/footstep/plating1.ogg', volume = 70)),
		MOVE_ACTOR(actor("Мешок 1 - 2-1-1"), SOUTH),
		MOVE_ACTOR(actor("Гора - 2-1-1"), SOUTH) = 0.5 SECONDS,
		TURN_ACTOR(actor("Мясо - 2-1-1"), SOUTH),
		TALK_ACTOR(actor("Мясо - 2-1-1"), "!вздыхает.") = 4 SECONDS,
		TALK_ACTOR(actor("Мясо - 2-1-1"), "Пора и нам сказать своё \"прощай\"?") = 2 SECONDS,
		TURN_ACTOR(actor("Мясо - 2-1-1"), EAST) = 0.5 SECONDS,
		MOVE_ACTOR(actor("Мясо - 2-1-1"), EAST) = 0.5 SECONDS,
		ADD_SCREEN(/blackout),
		CALL_GLOB(episode2_team2) = 6 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/Survivor.mp3', volume = 50)) = 4 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/s2ep2sc2)
	)

/datum/modular_cutscene/s2ep2sc2/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 2-1 - Кадр 2"),
		ADD_SCREEN(/cinema_borders),
		MOVE_CAMERA(5, 0, 10 SECONDS, SINE_EASING|EASE_IN),
		TALK_ACTOR(actor("Ная - 2-1-2"), "...Не хочу показаться грубой, но-"),
		PLAY_SOUND(sound('sound/effects/footstep/plating2.ogg', volume = 70)),
		MOVE_ACTOR(actor("Ная - 2-1-2"), WEST) = 0.2 SECONDS,
		MOVE_ACTOR(actor("Фиддлер - 2-1-2"), WEST) = 2 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/plating1.ogg', volume = 70)),
		MOVE_ACTOR(actor("Ная - 2-1-2"), WEST) = 0.2 SECONDS,
		MOVE_ACTOR(actor("Фиддлер - 2-1-2"), WEST) = 2 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/plating4.ogg', volume = 70)),
		TALK_ACTOR(actor("Ная - 2-1-2"), "...-кому-то здесь явно пора садиться на диету."),
		MOVE_ACTOR(actor("Ная - 2-1-2"), WEST) = 0.2 SECONDS,
		MOVE_ACTOR(actor("Фиддлер - 2-1-2"), WEST) = 2 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/plating1.ogg', volume = 70)),
		MOVE_ACTOR(actor("Ная - 2-1-2"), WEST) = 0.2 SECONDS,
		MOVE_ACTOR(actor("Фиддлер - 2-1-2"), WEST) = 2 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/plating5.ogg', volume = 70)),
		MOVE_ACTOR(actor("Ная - 2-1-2"), WEST) = 0.2 SECONDS,
		TALK_ACTOR(actor("Фиддлер - 2-1-2"), "К-r-Кк-р%1не о0Rиг1нально, Ф-Ф-Фокс."),
		ADD_SCREEN(/blackout),
		MOVE_ACTOR(actor("Фиддлер - 2-1-2"), WEST),
		CALL_GLOB(episode2_team) = 8 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/s2ep2sc3)
	)

/datum/modular_cutscene/s2ep2sc3/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 2-1 - Кадр 3"),
		MOVE_CAMERA(10, 0, 10 SECONDS, SINE_EASING|EASE_OUT),
		ADD_SCREEN(/cinema_borders),
		CALL_GLOB(episode2_meatteller1) = 2 SECONDS,
		TURN_ACTOR(actor("Датура - 2-1-3"), SOUTH) = 3 SECONDS,
		MOVE_ACTOR(actor("Датура - 2-1-3"), SOUTH) = 1 SECONDS,
		TURN_ACTOR(actor("Датура - 2-1-3"), WEST) = 3 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/s2ep2sc4)
	)

/datum/modular_cutscene/s2ep2sc4/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 2-1 - Кадр 4"),
		ADD_SCREEN(/cinema_borders),
		MOVE_CAMERA(-5, 0, 0, null),
		MOVE_CAMERA(16, 0, 20 SECONDS, SINE_EASING|EASE_IN),
		CALL_GLOB(episode2_meatteller2),
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
		MOVE_ACTOR(actor("Ящик - 1"), SOUTH),
		MOVE_ACTOR(actor("Злата - 2-1-4"), SOUTH),
		MOVE_ACTOR(actor("Ящик - 3"), EAST),
		MOVE_ACTOR(actor("Лира - 2-1-4"), EAST),
		TURN_ACTOR(actor("Лира - 2-1-4"), EAST) = 2 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/s2ep2sc5)
	)

/datum/modular_cutscene/s2ep2sc5/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 2-1 - Кадр 5"),
		ADD_SCREEN(/cinema_borders),
		CALL_GLOB(episode2_meatteller3) = 8 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/s2ep2sc6)
	)

/datum/modular_cutscene/s2ep2sc6/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 2-1 - Кадр 6"),
		MOVE_CAMERA(0, 5, 0, null),
		MOVE_CAMERA(0, 0, 12 SECONDS, SINE_EASING|EASE_OUT),
		ADD_SCREEN(/cinema_borders),
		CALL_GLOB(episode2_meatteller4),
		MOVE_ACTOR(actor("Амелия - 2-1-6"), SOUTH),
		MOVE_ACTOR(actor("Свифт - 2-1-6"), SOUTH) = 2 SECONDS,
		MOVE_ACTOR(actor("Амелия - 2-1-6"), SOUTH),
		MOVE_ACTOR(actor("Свифт - 2-1-6"), SOUTH) = 2 SECONDS,
		TURN_ACTOR(actor("Амелия - 2-1-6"), WEST),
		MOVE_ACTOR(actor("Амелия - 2-1-6"), SOUTH),
		MOVE_ACTOR(actor("Свифт - 2-1-6"), SOUTH) = 2 SECONDS,
		MOVE_ACTOR(actor("Амелия - 2-1-6"), SOUTH),
		MOVE_ACTOR(actor("Свифт - 2-1-6"), SOUTH) = 2 SECONDS,
		MOVE_ACTOR(actor("Амелия - 2-1-6"), SOUTH),
		MOVE_ACTOR(actor("Свифт - 2-1-6"), SOUTH) = 0.5 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/s2ep2sc7)
	)

/datum/modular_cutscene/s2ep2sc7/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 2-1 - Кадр 7"),
		ADD_SCREEN(/cinema_borders),
		CALL_GLOB(episode2_meatteller5) = 2 SECONDS,
		SHIFT_ACTOR(actor("Луни - 2-1-7"), -6, -3, 0.5 SECONDS, SINE_EASING|EASE_OUT, null) = 1 SECONDS,
		TURN_ACTOR(actor("Луни - 2-1-7"), NORTH) = 0.5 SECONDS,
		MOVE_CAMERA(3, 0, 3 SECONDS, SINE_EASING|EASE_IN),
		TURN_ACTOR(actor("Луни - 2-1-7"), EAST) = 0.5 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/s2ep2sc8)
	)

/datum/modular_cutscene/s2ep2sc8/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 2-1 - Кадр 8"),
		ADD_SCREEN(/cinema_borders),
		MOVE_CAMERA(-3, 0, 0, null),
		MOVE_CAMERA(3, 0, 10 SECONDS, SINE_EASING|EASE_OUT),
		CALL_GLOB(episode2_meatteller6) = 2 SECONDS,
		TURN_ACTOR(actor("Датура - 2-1-8"), EAST) = 2 SECONDS,
		TURN_ACTOR(actor("Фиддлер - 2-1-8"), WEST) = 2 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/s2ep2sc9)
	)

/datum/modular_cutscene/s2ep2sc9/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 2-1 - Кадр 9"),
		ADD_SCREEN(/cinema_borders),
		CALL_GLOB(episode2_meatteller7) = 4 SECONDS,
		CHANGE_ACTOR_VISUALS(actor("Оливия - 2-1-9"), "Current Alt"),
		MOVE_CAMERA(-6, 0, 10 SECONDS, SINE_EASING|EASE_IN),
		SHIFT_ACTOR(actor("Оливия - 2-1-9"), 5, 15, 0.3 SECONDS, SINE_EASING|EASE_OUT, null) = 2 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/s2ep2sc10)
	)

/datum/modular_cutscene/s2ep2sc10/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 2-1 - Кадр 10"),
		ADD_SCREEN(/cinema_borders),
		CALL_GLOB(episode2_meatteller8),
		MOVE_CAMERA(-12, 0, 18 SECONDS, SINE_EASING|EASE_OUT) = 6 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/s2ep2sc11)
	)

/datum/modular_cutscene/s2ep2sc11/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 2-1 - Кадр 11"),
		ADD_SCREEN(/cinema_borders),
		CALL_GLOB(episode2_meatteller9) = 1 SECONDS,
		MOVE_ACTOR(actor("Райфлер - 2-1-10"), WEST) = 0.5 SECONDS,
		MOVE_ACTOR(actor("Солдат 1 - 2-1-10"), WEST),
		MOVE_ACTOR(actor("Солдат 2 - 2-1-10"), WEST) = 0.2 SECONDS,
		MOVE_ACTOR(actor("Солдат 3 - 2-1-10"), WEST) = 0.5 SECONDS,
		MOVE_ACTOR(actor("Солдат 4 - 2-1-10"), WEST),
		MOVE_ACTOR(actor("Райфлер - 2-1-10"), WEST) = 1 SECONDS,
		MOVE_ACTOR(actor("Солдат 2 - 2-1-10"), WEST),
		MOVE_ACTOR(actor("Солдат 4 - 2-1-10"), WEST) = 0.2 SECONDS,
		MOVE_ACTOR(actor("Солдат 1 - 2-1-10"), WEST) = 1 SECONDS,
		MOVE_ACTOR(actor("Солдат 3 - 2-1-10"), WEST),
		MOVE_ACTOR(actor("Райфлер - 2-1-10"), WEST) = 0.5 SECONDS,
		MOVE_ACTOR(actor("Солдат 2 - 2-1-10"), WEST),
		MOVE_ACTOR(actor("Солдат 1 - 2-1-10"), WEST) = 0.2 SECONDS,
		MOVE_ACTOR(actor("Солдат 3 - 2-1-10"), WEST) = 1 SECONDS,
		MOVE_ACTOR(actor("Солдат 4 - 2-1-10"), WEST),
		MOVE_ACTOR(actor("Солдат 2 - 2-1-10"), WEST) = 0.5 SECONDS,
		MOVE_ACTOR(actor("Солдат 4 - 2-1-10"), WEST),
		MOVE_ACTOR(actor("Солдат 3 - 2-1-10"), WEST) = 0.2 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/s2ep2sc12)
	)

/datum/modular_cutscene/s2ep2sc12/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 2-1 - Кадр 12"),
		ADD_SCREEN(/cinema_borders),
		CALL_GLOB(episode2_meatteller10),
		MOVE_CAMERA(0, -6, 0, null),
		MOVE_CAMERA(0, 0, 10 SECONDS, SINE_EASING|EASE_IN),
		MOVE_ACTOR(actor("Оливия - 2-1-10"), NORTH),
		TURN_ACTOR(actor("Фиддлер - 2-1-10"), SOUTH),
		TURN_ACTOR(actor("Свифт - 2-1-10"), WEST),
		MOVE_ACTOR(actor("Оливия - 2-1-10"), NORTH) = 1 SECONDS,
		MOVE_ACTOR(actor("Гора - 2-1-10"), WEST),
		MOVE_ACTOR(actor("Оливия - 2-1-10"), NORTH) = 1 SECONDS,
		TURN_ACTOR(actor("Фиддлер - 2-1-10"), NORTH),
		TURN_ACTOR(actor("Гора - 2-1-10"), NORTH),
		MOVE_ACTOR(actor("Оливия - 2-1-10"), NORTH) = 1 SECONDS,
		TURN_ACTOR(actor("Свифт - 2-1-10"), NORTH),
		MOVE_ACTOR(actor("Оливия - 2-1-10"), NORTH) = 2 SECONDS,
		TURN_ACTOR(actor("Оливия - 2-1-10"), WEST) = 1 SECONDS,
		TURN_ACTOR(actor("Максим - 2-1-10"), EAST) = 0.5 SECONDS,
		ADD_SCREEN(/blackout),
		CALL_GLOB(episode2_name) = 2 SECONDS,
		CALL_GLOB(episode2_name2) = 8 SECONDS,
		RETURN_VIEWERS
	)
