//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// АССЕТЫ, НЕОБХОДИМЫЕ СЦЕНЕ //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/obj/structure/fd/players_geter/s2ep1/part1_1 // Шот коридора

/obj/structure/fd/players_geter/s2ep1/part1_2 // Шот предбанника медблока

/obj/structure/fd/players_geter/s2ep1/part1_3 // Шот операционной

/obj/screen/fullscreen/fd/blackout/animated/s2ep1sc1/Initialize()
	. = ..()
	spawn(25 SECONDS)
		animate(src, 3 SECOND, alpha = 0)

	spawn(48 SECONDS)
		animate(src, 3 SECOND, alpha = 255)

	spawn(52 SECONDS)
		animate(src, 3 SECOND, alpha = 0)

	spawn(153 SECONDS)
		animate(src, 3 SECOND, alpha = 255)

	spawn(175 SECONDS)
		animate(src, 3 SECOND, alpha = 0)

	spawn(560 SECONDS)
		animate(src, 3 SECOND, alpha = 255)

	spawn(572 SECONDS)
		animate(src, 3 SECOND, alpha = 0)

	spawn(792 SECONDS)
		animate(src, 3 SECOND, alpha = 255)

	spawn(803 SECONDS)
		animate(src, 3 SECOND, alpha = 0)

	spawn(935 SECONDS)
		animate(src, 3 SECOND, alpha = 255)

	spawn(950 SECONDS)
		animate(src, 3 SECOND, alpha = 0)

	spawn(1000 SECONDS)
		animate(src, 3 SECOND, alpha = 255)

	spawn(1008 SECONDS)
		animate(src, 3 SECOND, alpha = 0)

/proc/time_of_death()
	var/novel_message = "ВРЕМЯ СМЕРТИ..."
	var/colored = COLOR_SABER_RED

	var/obj/screen/novel_message/start_credits/blinking/visuals = new /obj/screen/novel_message/start_credits/blinking()
	visuals.maptext_y = -60
	visuals.maptext_x = -80
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored)

/proc/perci_lastwords()
	var/novel_message = "ТОЖЕ УМИРАТЬ СОБРАЛАСЬ?"
	var/colored = "#e28d2b"

	var/obj/screen/novel_message/start_credits/big_nofade/visuals = new /obj/screen/novel_message/start_credits/big_nofade()
	visuals.maptext_y = -90
	visuals.maptext_x = 2
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 5 SECONDS)

/proc/perci_lastwords2()
	var/novel_message = "ДАВАЙ СО МНОЙ ХОТЬ, У МЕНЯ И ВЫПИТЬ ЕСТЬ"
	var/colored = "#e28d2b"

	var/obj/screen/novel_message/start_credits/big_nofade/visuals = new /obj/screen/novel_message/start_credits/big_nofade()
	visuals.maptext_y = -90
	visuals.maptext_x = -50
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 8 SECONDS)


/proc/amelia_woe()
	var/novel_message = "...ОН ВЕДЬ ДО СИХ ПОР НЕ ВЕРНУЛСЯ?"
	var/colored = "#1199c2"

	var/obj/screen/novel_message/start_credits/big_nofade/visuals = new /obj/screen/novel_message/start_credits/big_nofade()
	visuals.maptext_y = -90
	visuals.maptext_x = -15
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 6 SECONDS)

/proc/credits_team()
	var/novel_message = "КОМАНДА \"UNDERGROUND FRONT\""
	var/colored = COLOR_ASSEMBLY_BLACK

	var/obj/screen/novel_message/start_credits/big/visuals = new /obj/screen/novel_message/start_credits/big()
	visuals.maptext_y = -80
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 12 SECONDS)

/proc/credits_show()
	var/novel_message = "ПРЕДСТАВЛЯЕТ"
	var/colored = COLOR_ASSEMBLY_BLACK

	var/obj/screen/novel_message/start_credits/big/visuals = new /obj/screen/novel_message/start_credits/big()
	visuals.maptext_y = -100
	visuals.maptext_x = 25
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 12 SECONDS)

/proc/credits_production()
	var/novel_message = "ПРОДЮСИРОВАНИЕ DOCTOR ALEX'A"
	var/colored = COLOR_ASSEMBLY_BLACK

	var/obj/screen/novel_message/start_credits/visuals = new /obj/screen/novel_message/start_credits()
	visuals.maptext_x = -110
	visuals.maptext_y = -5
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 16 SECONDS)

/proc/credits_author()
	var/novel_message = "ФИЛЬМ SWIFT0"
	var/colored = COLOR_ASSEMBLY_BLACK

	var/obj/screen/novel_message/start_credits/visuals = new /obj/screen/novel_message/start_credits()
	visuals.maptext_x = -100
	visuals.maptext_y = -15
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 10 SECONDS)

		animate(visuals, maptext_x = 50, 10 SECONDS, easing = SINE_EASING|EASE_IN, flags = ANIMATION_PARALLEL)

/proc/credits_television()
	var/novel_message = "ПРИ ПОДДЕРЖКЕ CUDDLEANDTEA ENTERTAINMENT"
	var/colored = COLOR_ASSEMBLY_BLACK

	var/obj/screen/novel_message/start_credits/visuals = new /obj/screen/novel_message/start_credits()
	visuals.maptext_x = 90
	visuals.maptext_y = -410
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 16 SECONDS)

/proc/credits_name()
	var/novel_message = "\"FINAL DESTINATION\""
	var/colored = COLOR_ASSEMBLY_BLACK

	var/obj/screen/novel_message/start_credits/big/visuals = new /obj/screen/novel_message/start_credits/big()
	visuals.maptext_y = -80
	visuals.maptext_x = 15
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 12 SECONDS)

/proc/credits_name2()
	var/novel_message = "АКТ II"
	var/colored = COLOR_ASSEMBLY_BLACK

	var/obj/screen/novel_message/start_credits/big/visuals = new /obj/screen/novel_message/start_credits/big()
	visuals.maptext_y = -100
	visuals.maptext_x = 50
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 12 SECONDS)

/proc/repeating_siren(atom/play_it_on)

	playsound(get_turf(play_it_on), 'maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', 5, FALSE)

	spawn(5 SECONDS)
		if(GLOB.stop_the_siren)
			return
		repeating_siren(play_it_on)

/obj/effect/cutscene_camera/s2ep1sc1
	camera_id = "Сцена 1"

/obj/effect/cutscene_camera/s2ep1sc2
	camera_id = "Сцена 2"

/obj/effect/cutscene_camera/s2ep1sc3
	camera_id = "Сцена 3"

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// СКРИПТ СЦЕНЫ //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Новая катсцена порублена на более мелкие куски для более лёгкого управления. Спасибо Дане за очень удобную утилиту!

/proc/fds2ep1_newcutscene()
	start_cutscene(/datum/modular_cutscene/s2ep1sc1)

/datum/modular_cutscene/s2ep1sc1/setup_actions(...)
	actions = list(
		ADD_SCREEN(/blackout/animated_better) = 5 SECONDS,
		CALL_GLOB(perci_lastwords) = 6 SECONDS,
		CALL_GLOB(perci_lastwords2) = 12 SECONDS,
		REMOVE_SCREEN(/blackout/animated_better, 1 SECONDS) = 0.1 SECONDS,
		TP_CAMERA("Сцена 1"),
		ADD_SCREEN(/cinema_borders),
		ADD_SCREEN(/blackout/animated_better/nofade) = 1 SECONDS,
		REMOVE_SCREEN(/blackout/animated_better/nofade, 3 SECONDS) = 1 SECONDS,

		PLAY_SOUND(sound('sound/mecha/lowpowernano.ogg', volume = 10)),

		TALK_ACTOR(actor("Амелия - Сцена 1"), "М-мам?"),
		PLAY_SOUND(sound('sound/effects/footstep/plating1.ogg', volume = 70)),
		MOVE_ACTOR(actor("Амелия - Сцена 1"), SOUTH) = 4 SECONDS,

		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),

		CALL_GLOB(credits_production),

		MOVE_CAMERA(0, -3, 20 SECONDS, SINE_EASING|EASE_IN),

		PLAY_SOUND(sound('sound/effects/footstep/plating4.ogg', volume = 70)),
		MOVE_ACTOR(actor("Амелия - Сцена 1"), SOUTH) = 4 SECONDS,

		CALL_GLOB(credits_author),

		TALK_ACTOR(actor("Амелия - Сцена 1"), "...папа?"),
		TALK_ACTOR(actor("Амелия - Сцена 1"), "!слегка пошатывается."),
		TURN_ACTOR(actor("Амелия - Сцена 1"), WEST),
		PLAY_SOUND(sound('sound/effects/footstep/plating5.ogg', volume = 70)),
		MOVE_ACTOR(actor("Амелия - Сцена 1"), SOUTH) = 4 SECONDS,

		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),

		TURN_ACTOR(actor("Амелия - Сцена 1"), SOUTH),
		PLAY_SOUND(sound('sound/effects/footstep/plating2.ogg', volume = 70)),
		MOVE_ACTOR(actor("Амелия - Сцена 1"), SOUTH) = 4 SECONDS,

		PLAY_SOUND(sound('sound/effects/footstep/plating1.ogg', volume = 70)),
		MOVE_ACTOR(actor("Амелия - Сцена 1"), SOUTH),
		TALK_ACTOR(actor("Амелия - Сцена 1"), "Кто-нибу-..."),
		TALK_ACTOR(actor("Амелия - Сцена 1"), "!задевает выступ ногой."),

// ЛОЖИМСЯ //
		CHANGE_ACTOR_VISUALS(actor("Амелия - Сцена 1"), "Amelia 5"),
		TURN_ACTOR(actor("Амелия - Сцена 1"), NORTH),

		SHIFT_ACTOR(actor("Амелия - Сцена 1"), 0, -5, 0.3 SECONDS, JUMP_EASING|EASE_IN, ANIMATION_PARALLEL),
		CHANGE_ACTOR_MATRIX(actor("Амелия - Сцена 1"), 90, 0.5 SECONDS, SINE_EASING, ANIMATION_PARALLEL) = 4 SECONDS,
// ЛОЖИМСЯ //

		TALK_ACTOR(actor("Амелия - Сцена 1"), "!пытается приподняться.") = 2 SECONDS,

		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),

// ПОЛЗЁМ //
		SHIFT_ACTOR(actor("Амелия - Сцена 1"), 0, -10, 0.3 SECONDS, SINE_EASING|EASE_IN, null) = 2 SECONDS,
		SHIFT_ACTOR(actor("Амелия - Сцена 1"), 0, -15, 0.3 SECONDS, SINE_EASING|EASE_IN, null) = 3 SECONDS,
		TALK_ACTOR(actor("Амелия - Сцена 1"), "!скалится."),
		TALK_ACTOR(actor("Амелия - Сцена 1"), "Д-должен же был..."),
		SHIFT_ACTOR(actor("Амелия - Сцена 1"), 0, -20, 0.3 SECONDS, SINE_EASING|EASE_IN, null) = 4 SECONDS,
// ПОЛЗЁМ //

		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		MOVE_CAMERA(0, -6, 20 SECONDS, SINE_EASING|EASE_IN),

// ПОВОРАЧИВАЕМСЯ НА БОК //
		TALK_ACTOR(actor("Амелия - Сцена 1"), "!кашляет."),
		TURN_ACTOR(actor("Амелия - Сцена 1"), EAST),
// ПОВОРАЧИВАЕМСЯ НА БОК //

// ВСТАЁМ //
		PLAY_SOUND(sound('sound/effects/footstep/plating4.ogg', volume = 70)),
		MOVE_ACTOR(actor("Амелия - Сцена 1"), SOUTH) = 4 SECONDS,
		TALK_ACTOR(actor("Амелия - Сцена 1"), "!придерживает правую руку."),

		CHANGE_ACTOR_VISUALS(actor("Амелия - Сцена 1"), "Amelia 2"),
		TURN_ACTOR(actor("Амелия - Сцена 1"), SOUTH),

		CHANGE_ACTOR_MATRIX(actor("Амелия - Сцена 1"), 0, 2 SECONDS, SINE_EASING, null) = 6 SECONDS,
// ВСТАЁМ //

		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),

		PLAY_SOUND(sound('sound/effects/footstep/plating5.ogg', volume = 70)),
		MOVE_ACTOR(actor("Амелия - Сцена 1"), SOUTH) = 4 SECONDS,
		SHIFT_ACTOR(actor("Амелия - Сцена 1"), 0, 0, 0, null, null),
		PLAY_SOUND(sound('sound/effects/footstep/plating2.ogg', volume = 70)),
		MOVE_ACTOR(actor("Амелия - Сцена 1"), SOUTH) = 4 SECONDS,

		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),

		ADD_SCREEN(/blackout/animated_better),

		PLAY_SOUND(sound('sound/effects/footstep/plating3.ogg', volume = 70)),
		MOVE_ACTOR(actor("Амелия - Сцена 1"), SOUTH) = 4 SECONDS,

		TALK_ACTOR(actor("Амелия - Сцена 1"), "...остаться х-хоть кто-то!"),
		PLAY_SOUND(sound('sound/effects/footstep/plating1.ogg', volume = 70)),
		MOVE_ACTOR(actor("Амелия - Сцена 1"), SOUTH) = 4 SECONDS,

		CALL_GLOB(credits_team) = 5 SECONDS,
		MOVE_CAMERA(0, 0, 0, null),
		CALL_GLOB(credits_show) = 16 SECONDS,
		REMOVE_SCREEN(/blackout/animated_better, 1 SECONDS) = 0.1 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/s2ep1sc2)
	)

/datum/modular_cutscene/s2ep1sc2/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 2"),
		ADD_SCREEN(/cinema_borders),
		MOVE_CAMERA(5, 0, 0, null),
		ADD_SCREEN(/blackout/animated_better/nofade) = 1 SECONDS,
		REMOVE_SCREEN(/blackout/animated_better/nofade, 3 SECONDS) = 1 SECONDS,

		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),

		PLAY_SOUND(sound('sound/effects/footstep/plating5.ogg', volume = 70)),
		MOVE_ACTOR(actor("Злата - Сцена 2"), SOUTH),
		MOVE_ACTOR(actor("Максим - Сцена 2"), NORTH),
		MOVE_ACTOR(actor("Гора - Сцена 2"), NORTH) = 2 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/plating2.ogg', volume = 70)),
		MOVE_ACTOR(actor("Злата - Сцена 2"), SOUTH) = 1 SECONDS,
		TURN_ACTOR(actor("Злата - Сцена 2"), WEST),
		TALK_ACTOR(actor("Злата - Сцена 2"), "Что с ней?") = 3 SECONDS,
		TALK_ACTOR(actor("Максим - Сцена 2"), "Избранная. Шрам на лбу не видно?"),
		TALK_ACTOR(actor("Максим - Сцена 2"), "!слегка подтягивает кошку.") = 4 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		TALK_ACTOR(actor("Максим - Сцена 2"), "Нашёл уже в отключке.") = 5 SECONDS,
		TALK_ACTOR(actor("Злата - Сцена 2"), "Очень остроумно, Максим.") = 2 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		TALK_ACTOR(actor("Злата - Сцена 2"), "!достаёт сканер."),
		CHANGE_ACTOR_VISUALS(actor("Злата - Сцена 2"), "Zlata 2") = 4 SECONDS,
		PLAY_SOUND(sound('sound/effects/fastbeep.ogg', volume = 70)),
		TALK_ACTOR(actor("Злата - Сцена 2"), "Привести в чувства пытался?") = 4 SECONDS,
		TALK_ACTOR(actor("Максим - Сцена 2"), "Ага...абонент не отвечает.") = 2 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		TALK_ACTOR(actor("Злата - Сцена 2"), "!вздыхает.") = 4 SECONDS,
		TALK_ACTOR(actor("Злата - Сцена 2"), "Тащи её в зал.") = 2 SECONDS,
		TALK_ACTOR(actor("Злата - Сцена 2"), "Лира разберётся...") = 2 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		TALK_ACTOR(actor("Максим - Сцена 2"), "!кивает."),
		MOVE_ACTOR(actor("Максим - Сцена 2"), NORTH),
		MOVE_ACTOR(actor("Гора - Сцена 2"), NORTH) = 4 SECONDS,
		MOVE_ACTOR(actor("Максим - Сцена 2"), NORTH),
		MOVE_ACTOR(actor("Гора - Сцена 2"), NORTH) = 2 SECONDS,
		TURN_ACTOR(actor("Злата - Сцена 2"), NORTH) = 1 SECONDS,
		TALK_ACTOR(actor("Злата - Сцена 2"), "!опускает маску."),
		MOVE_ACTOR(actor("Злата - Сцена 2"), SOUTH),
		PLAY_SOUND(sound('sound/effects/footstep/plating5.ogg', volume = 70)),
		MOVE_ACTOR(actor("Амелия - Сцена 2"), EAST),
		CHANGE_ACTOR_VISUALS(actor("Злата - Сцена 2"), "Zlata 3") = 2 SECONDS,
		MOVE_CAMERA(0, 0, 10 SECONDS, SINE_EASING|EASE_IN),
		TURN_ACTOR(actor("Злата - Сцена 2"), WEST) = 1 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		MOVE_ACTOR(actor("Амелия - Сцена 2"), EAST),
		TALK_ACTOR(actor("Злата - Сцена 2"), "Амелия!") = 1 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/plating2.ogg', volume = 70)),
		MOVE_ACTOR(actor("Злата - Сцена 2"), WEST) = 0.5 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/plating4.ogg', volume = 70)),
		MOVE_ACTOR(actor("Злата - Сцена 2"), WEST) = 0.5 SECONDS,
		MOVE_ACTOR(actor("Амелия - Сцена 2"), EAST),
		PLAY_SOUND(sound('sound/effects/footstep/plating3.ogg', volume = 70)),
		MOVE_ACTOR(actor("Злата - Сцена 2"), WEST) = 0.5 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/plating1.ogg', volume = 70)),
		MOVE_ACTOR(actor("Злата - Сцена 2"), WEST) = 0.5 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/plating5.ogg', volume = 70)),
		MOVE_ACTOR(actor("Злата - Сцена 2"), WEST) = 0.5 SECONDS,
		TALK_ACTOR(actor("Амелия - Сцена 2"), "Ма-!"),
		MOVE_ACTOR(actor("Злата - Сцена 2"), WEST) = 0.5 SECONDS,
		MOVE_ACTOR(actor("Амелия - Сцена 2"), EAST),
		TALK_ACTOR(actor("Злата - Сцена 2"), "!хватает девушку в объятия."),
		CHANGE_ACTOR_VISUALS(actor("Злата - Сцена 2"), "Zlata 4"),
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		SHIFT_ACTOR(actor("Амелия - Сцена 2"), 24, 0, 0.3 SECONDS, SINE_EASING|EASE_OUT, null) = 2 SECONDS,
		CALL_GLOB(credits_television),
		TALK_ACTOR(actor("Злата - Сцена 2"), "Живая...") = 8 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		TALK_ACTOR(actor("Злата - Сцена 2"), "Столько крови...все погибшие ребята-...") = 6 SECONDS,
		TALK_ACTOR(actor("Злата - Сцена 2"), "...я так боялась увидеть тебя среди них.") = 8 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		SHIFT_ACTOR(actor("Злата - Сцена 2"), 4, 0, 0.3 SECONDS, SINE_EASING|EASE_IN, null),
		CHANGE_ACTOR_VISUALS(actor("Злата - Сцена 2"), "Zlata 5") = 2 SECONDS,
		TALK_ACTOR(actor("Злата - Сцена 2"), "Выглядишь неважно...") = 4 SECONDS,
		TALK_ACTOR(actor("Злата - Сцена 2"), "...костюм так тем более.") = 4 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		TALK_ACTOR(actor("Амелия - Сцена 2"), "П-прости...я обещала что на нём не будет и царапинки...") = 6 SECONDS,
		TALK_ACTOR(actor("Злата - Сцена 2"), "Сущие пустяки.") = 4 SECONDS,
		TALK_ACTOR(actor("Злата - Сцена 2"), "Главное что ты сама цела. Ну...не считая этого.") = 1 SECONDS,
		TALK_ACTOR(actor("Злата - Сцена 2"), "!кивает на правую руку девушки.") = 6 SECONDS,
		TALK_ACTOR(actor("Злата - Сцена 2"), "А металл мы всегда найдём чем заменить, согласна?") = 4 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		TALK_ACTOR(actor("Амелия - Сцена 2"), "!неуверенно кивает.") = 4 SECONDS,
		TALK_ACTOR(actor("Злата - Сцена 2"), "!поглаживает ту по голове.") = 2 SECONDS,
		TALK_ACTOR(actor("Злата - Сцена 2"), "Вот и славно.") = 4 SECONDS,
		MOVE_CAMERA(2, 0, 5 SECONDS, SINE_EASING|EASE_IN),
		TALK_ACTOR(actor("Злата - Сцена 2"), "Поставим тебя на ноги в два счёта, и глазом не моргнёшь!") = 4 SECONDS,
		TURN_ACTOR(actor("Злата - Сцена 2"), EAST),
		SHIFT_ACTOR(actor("Злата - Сцена 2"), 8, 0, 0.3 SECONDS, SINE_EASING|EASE_IN, null),
		MOVE_ACTOR(actor("Амелия - Сцена 2"), EAST),
		PLAY_SOUND(sound('sound/effects/footstep/plating3.ogg', volume = 70)),
		MOVE_ACTOR(actor("Злата - Сцена 2"), EAST) = 0.5 SECONDS,
		MOVE_ACTOR(actor("Амелия - Сцена 2"), EAST),
		PLAY_SOUND(sound('sound/effects/footstep/plating5.ogg', volume = 70)),
		MOVE_ACTOR(actor("Злата - Сцена 2"), EAST) = 0.5 SECONDS,
		TALK_ACTOR(actor("Амелия - Сцена 2"), "!вырывается."),
		MOVE_CAMERA(1, 0, 1 SECONDS, SINE_EASING|EASE_IN) = 0.5 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		SHIFT_ACTOR(actor("Злата - Сцена 2"), 0, 0, 0.3 SECONDS, SINE_EASING|EASE_OUT, null),
		SHIFT_ACTOR(actor("Амелия - Сцена 2"), 0, 0, 0.3 SECONDS, SINE_EASING|EASE_IN, null),
		TURN_ACTOR(actor("Злата - Сцена 2"), WEST),
		MOVE_ACTOR(actor("Амелия - Сцена 2"), WEST),
		CHANGE_ACTOR_VISUALS(actor("Амелия - Сцена 2"), "Amelia 2"),
		CHANGE_ACTOR_VISUALS(actor("Злата - Сцена 2"), "Zlata 3") = 1 SECONDS,
		TALK_ACTOR(actor("Злата - Сцена 2"), "Мель?") = 2 SECONDS,
		TALK_ACTOR(actor("Злата - Сцена 2"), "Что-то не так? Может я случайно-..."),
		TALK_ACTOR(actor("Амелия - Сцена 2"), "...с-скажи.") = 4 SECONDS,
		ADD_SCREEN(/blackout/animated_better/nofade),
		TURN_ACTOR(actor("Злата - Сцена 2"), NORTH),
		CALL_GLOB(amelia_woe) = 7 SECONDS,
		REMOVE_SCREEN(/cinema_borders, 0),
		REMOVE_SCREEN(/blackout/animated_better/nofade, 0) = 0.5 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/s2ep1sc3)
	)

/datum/modular_cutscene/s2ep1sc3/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 3"),
		ADD_SCREEN(/cinema_borders),
		CALL_GLOB(time_of_death),
		TALK_ACTOR(actor("Луни - Сцена 3"), "!пялится."),
		TALK_ACTOR(actor("Злата - Сцена 3"), "!сжимает воротник мужчины."),
		SHIFT_ACTOR(actor("Реймонд - Сцена 3"), 0, 0, 0.2 SECONDS, SINE_EASING|EASE_OUT, null) = 0.2 SECONDS,
		PLAY_SOUND(sound('sound/machines/flatline.ogg', volume = 15)),
		TALK_ACTOR(actor("Злата - Сцена 3"), "Ну не стой же ты столбом! Сделай что-нибудь!"),
		TALK_ACTOR(actor("Реймонд - Сцена 3"), "!скалится."),
		SHIFT_ACTOR(actor("Реймонд - Сцена 3"), -1, 0, 0.2 SECONDS, SINE_EASING|EASE_IN, null) = 0.2 SECONDS,
		SHIFT_ACTOR(actor("Реймонд - Сцена 3"), 0, 0, 0.2 SECONDS, SINE_EASING|EASE_OUT, null) = 0.2 SECONDS,
		SHIFT_ACTOR(actor("Реймонд - Сцена 3"), -1, 0, 0.2 SECONDS, SINE_EASING|EASE_IN, null) = 0.2 SECONDS,
		SHIFT_ACTOR(actor("Реймонд - Сцена 3"), 0, 0, 0.2 SECONDS, SINE_EASING|EASE_OUT, null) = 0.2 SECONDS,
		SHIFT_ACTOR(actor("Реймонд - Сцена 3"), -1, 0, 0.2 SECONDS, SINE_EASING|EASE_IN, null) = 0.2 SECONDS,
		SHIFT_ACTOR(actor("Реймонд - Сцена 3"), 0, 0, 0.2 SECONDS, SINE_EASING|EASE_OUT, null) = 0.2 SECONDS,
		SHIFT_ACTOR(actor("Реймонд - Сцена 3"), -1, 0, 0.2 SECONDS, SINE_EASING|EASE_IN, null) = 0.2 SECONDS,
		SHIFT_ACTOR(actor("Реймонд - Сцена 3"), 0, 0, 0.2 SECONDS, SINE_EASING|EASE_OUT, null) = 0.2 SECONDS,
		SHIFT_ACTOR(actor("Реймонд - Сцена 3"), -1, 0, 0.2 SECONDS, SINE_EASING|EASE_IN, null) = 0.2 SECONDS,
		CHANGE_ACTOR_VISUALS(actor("Реймонд - Сцена 3"), "Datura 2"),
		SHIFT_ACTOR(actor("Реймонд - Сцена 3"), 0, 0, 0.2 SECONDS, SINE_EASING|EASE_OUT, null) = 2 SECONDS,
		TALK_ACTOR(actor("Реймонд - Сцена 3"), "Да не помочь ему уже!") = 0.5 SECONDS,
		TALK_ACTOR(actor("Реймонд - Сцена 3"), "НИЧЕМ!") = 0.5 SECONDS,
		REMOVE_SCREEN(/cinema_borders, 0),
		START_CUTSCENE(/datum/modular_cutscene/s2ep1sc4)
	)

/datum/modular_cutscene/s2ep1sc4/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 2"),
		ADD_SCREEN(/cinema_borders),
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		TALK_ACTOR(actor("Злата - Сцена 2"), "!сжимает пальцы в кулак.") = 4 SECONDS,
		TURN_ACTOR(actor("Злата - Сцена 2"), WEST),
		MOVE_ACTOR(actor("Амелия - Сцена 2"), WEST) = 2 SECONDS,
		CHANGE_ACTOR_VISUALS(actor("Амелия - Сцена 2"), "Amelia 6"),
		TALK_ACTOR(actor("Амелия - Сцена 2"), "!бессильно опускает голову.") = 2 SECONDS,
		TALK_ACTOR(actor("Амелия - Сцена 2"), "П-понятно..."),
		ADD_SCREEN(/blackout/animated_better) = 2 SECONDS,
		CALL_GLOB(credits_name),
		CALL_GLOB(credits_name2) = 18 SECONDS,
		MOVE_CAMERA(0, 0, 0, null),
		REMOVE_SCREEN(/blackout/animated_better, 1 SECONDS) = 0.1 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/s2ep1sc5)
	)























































/proc/fds2ep1_sc1()
	var/sound/opening_minus = sound('maps/torch_doh/cutscenes/sounds/opening2_inst.ogg', repeat = 0, wait = 1, channel = GLOB.admin_sound_channel)
	opening_minus.priority = 255
	opening_minus.volume = 3

	for(var/mob/all in GLOB.player_list)
		sound_to(all, opening_minus)

		all.remember_position = get_turf(all.loc)
		all.remember_camera_size = all.client.view

		all.overlay_fullscreen("borders", /obj/screen/fullscreen/fd/cinema_borders)
		all.overlay_fullscreen("blackscreen", /obj/screen/fullscreen/fd/blackout/animated/s2ep1sc1)
		all.SetStunned(999999)

		all.client.view = 7

		spawn(5 SECONDS)
			credits_team()
		spawn(7 SECONDS)
			credits_show()

		spawn(25 SECONDS)

			for(var/obj/structure/fd/players_geter/s2ep1/part1_1/G in world)
				all.alpha = 0
				all.forceMove(G)
				repeating_siren(G)

				spawn(13 SECONDS)
					playsound(get_turf(G), 'sound/mecha/lowpowernano.ogg', 10)

		spawn(26 SECONDS)
			all.move_cutscene_camera(all, 0, -170, 23 SECONDS)

		spawn(28 SECONDS)
			credits_production()

		spawn(34 SECONDS)
			credits_author()

		spawn(51 SECONDS)

			for(var/obj/structure/fd/players_geter/s2ep1/part1_2/G in world)
				all.alpha = 0
				all.forceMove(G)
				repeating_siren(G)

		spawn(52 SECONDS)
			all.client.pixel_y = 0
			all.client.pixel_x = 160

		spawn(80 SECONDS)
			credits_television()

		spawn(85 SECONDS)
			all.move_cutscene_camera(all, 0, 0, 10 SECONDS)

		spawn(120 SECONDS)
			all.move_cutscene_camera(all, 64, 0, 5 SECONDS)

		spawn(128 SECONDS)
			all.move_cutscene_camera(all, 32, 0, 1 SECONDS)

		spawn(136 SECONDS)
			GLOB.stop_the_siren = TRUE

			for(var/obj/structure/fd/players_geter/s2ep1/part1_3/G in world)
				all.alpha = 0
				all.forceMove(G)
				all.overlay_fullscreen("glitch", /obj/screen/fullscreen/bluespace_affection)

		spawn(138 SECONDS)
			time_of_death()

		spawn(142 SECONDS)

			for(var/obj/structure/fd/players_geter/s2ep1/part1_2/G in world)
				all.alpha = 0
				all.forceMove(G)

			all.clear_fullscreen("glitch")

		spawn(150 SECONDS)
			GLOB.stop_the_siren = FALSE

			for(var/obj/structure/fd/players_geter/s2ep1/part1_2/G in world)
				repeating_siren(G)

		spawn(160 SECONDS)
			credits_name()
		spawn(163 SECONDS)
			credits_name2()

		spawn(170 SECONDS)
			fds2ep1_sc2()

	spawn(26 SECONDS)
		for(var/mob/living/simple_animal/cutscene_character/C in world)
			if(C.cutscene_id != "s2ep1sc1pt11")
				continue
			C.do_stuff()

	spawn(54 SECONDS)
		for(var/mob/living/simple_animal/cutscene_character/C in world)
			if(C.cutscene_id != "s2ep1sc1pt12")
				continue
			C.do_stuff()

	spawn(137 SECONDS)
		for(var/mob/living/simple_animal/cutscene_character/C in world)
			if(C.cutscene_id != "s2ep1sc1pt13")
				continue
			C.do_stuff()

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// СКРИПТ ПЕРСОНАЖЕЙ В СЦЕНЕ //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/mob/living/simple_animal/cutscene_character/amelia/s2ep1/part1_1/do_stuff()
	forceMove(get_step(src, SOUTH))
	playsound(get_turf(src), 'sound/effects/footstep/plating1.ogg', 70)

	spawn(3 SECONDS)
		forceMove(get_step(src, SOUTH))
		playsound(get_turf(src), 'sound/effects/footstep/plating4.ogg', 70)

	spawn(6 SECONDS)
		dir = WEST
		ISay("!слегка пошатывается.")
		forceMove(get_step(src, SOUTH))
		playsound(get_turf(src), 'sound/effects/footstep/plating3.ogg', 70)

	spawn(9 SECONDS)
		dir = SOUTH
		forceMove(get_step(src, SOUTH))
		playsound(get_turf(src), 'sound/effects/footstep/plating1.ogg', 70)

	spawn(12 SECONDS)
		forceMove(get_step(src, SOUTH))
		playsound(get_turf(src), 'sound/effects/footstep/plating5.ogg', 70)

	spawn(15 SECONDS)
		ISay("!спотыкается.")
		animate(src, 0.3 SECONDS, transform = matrix(-15, MATRIX_ROTATE), easing = SINE_EASING, flags = ANIMATION_PARALLEL)
		animate(src, pixel_y = -3, 0.3 SECONDS, easing = JUMP_EASING|EASE_IN, flags = ANIMATION_PARALLEL)
		forceMove(get_step(src, SOUTH))
		playsound(get_turf(src), 'sound/effects/footstep/hull2.ogg', 70)
		playsound(get_turf(src), 'sound/effects/footstep/catwalk5.ogg', 70)
		animate(src, pixel_y = 0, 0.5 SECONDS, easing = SINE_EASING|EASE_OUT)
		animate(src, 0.4 SECONDS, transform = matrix(0, MATRIX_ROTATE), easing = SINE_EASING|EASE_OUT)
		ISay("З-зараза...")

	spawn(18 SECONDS)
		forceMove(get_step(src, SOUTH))
		playsound(get_turf(src), 'sound/effects/footstep/plating2.ogg', 70)

	spawn(21 SECONDS)
		ISay("!придерживает правую руку.")
		icon_state = "Amelia 2"
		forceMove(get_step(src, SOUTH))
		playsound(get_turf(src), 'sound/effects/footstep/plating1.ogg', 70)

	spawn(24 SECONDS)
		forceMove(get_step(src, SOUTH))
		playsound(get_turf(src), 'sound/effects/footstep/plating4.ogg', 70)

	spawn(27 SECONDS)
		forceMove(get_step(src, SOUTH))
		playsound(get_turf(src), 'sound/effects/footstep/plating3.ogg', 70)

/mob/living/simple_animal/cutscene_character/zlata/s2ep1/part1_2/do_stuff()
	forceMove(get_step(src, SOUTH))
	playsound(get_turf(src), 'sound/effects/footstep/plating2.ogg', 70)

	spawn(2 SECONDS)
		forceMove(get_step(src, SOUTH))
		playsound(get_turf(src), 'sound/effects/footstep/plating1.ogg', 70)

	spawn(3 SECONDS)
		dir = WEST
		ISay("Что с ней?")

	spawn(11 SECONDS)
		ISay("Наверное это самое безобидное ранение, которое я видела за сегодня...")

	spawn(14 SECONDS)
		icon_state = "Zlata 2"
		ISay("!достаёт сканер.")
		ISay("Привести в чувства пробовал?")

	spawn(18 SECONDS)
		playsound(get_turf(src), 'sound/effects/fastbeep.ogg', 20)
		ISay("!вздыхает.")

	spawn(19 SECONDS)
		ISay("Тащи её на кушетку.")

	spawn(21 SECONDS)
		ISay("Я сейчас подойду.")

	spawn(25 SECONDS)
		dir = NORTH

	spawn(29 SECONDS)
		ISay("!опускает маску.")
		forceMove(get_step(src, SOUTH))
		playsound(get_turf(src), 'sound/effects/footstep/plating5.ogg', 70)
		icon_state = "Zlata 3"

	spawn(33 SECONDS)
		dir = WEST

	spawn(34 SECONDS)
		ISay("Амелия!")
		forceMove(get_step(src, WEST))
		playsound(get_turf(src), 'sound/effects/footstep/plating1.ogg', 70)

	spawn(34.5 SECONDS)
		forceMove(get_step(src, WEST))
		playsound(get_turf(src), 'sound/effects/footstep/plating3.ogg', 70)

	spawn(35 SECONDS)
		forceMove(get_step(src, WEST))
		playsound(get_turf(src), 'sound/effects/footstep/plating1.ogg', 70)

	spawn(35.5 SECONDS)
		forceMove(get_step(src, WEST))
		playsound(get_turf(src), 'sound/effects/footstep/plating4.ogg', 70)

	spawn(36 SECONDS)
		forceMove(get_step(src, WEST))
		playsound(get_turf(src), 'sound/effects/footstep/plating5.ogg', 70)

	spawn(36.5 SECONDS)
		forceMove(get_step(src, WEST))
		playsound(get_turf(src), 'sound/effects/footstep/plating2.ogg', 70)
		ISay("!хватает девушку в объятия.")

	spawn(37 SECONDS)
		icon_state = "Zlata 4"

	spawn(39 SECONDS)
		ISay("Если бы ты только знала, как я рада тебя видеть...")

	spawn(41 SECONDS)
		ISay("Во всём этом хаосе я даже-...")

	spawn(44 SECONDS)
		ISay("Не важно. Главное что ты в порядке.")

	spawn(46 SECONDS)
		ISay("Ну...почти.")
		animate(src, pixel_x = 4, 0.3 SECONDS, easing = SINE_EASING|EASE_IN)
		icon_state = "Zlata 5"

	spawn(50 SECONDS)
		ISay("Руку придётся обработать.")

	spawn(53 SECONDS)
		ISay("Помимо этого ничего? Головная боль? Головокружение?")

	spawn(61 SECONDS)
		ISay("...обвалился проход на третью. Знаю.")

	spawn(66 SECONDS)
		ISay("!хлопает по плечу.")
		ISay("Ничего что не исправила бы современная медицина, значит?")

	spawn(70 SECONDS)
		ISay("Не переживай, поставим тебя на ноги в два счёта.")
		animate(src, pixel_x = 8, 0.3 SECONDS, easing = SINE_EASING|EASE_IN)
		dir = EAST
		forceMove(get_step(src, EAST))
		playsound(get_turf(src), 'sound/effects/footstep/plating3.ogg', 70)

	spawn(72 SECONDS)
		forceMove(get_step(src, EAST))
		playsound(get_turf(src), 'sound/effects/footstep/plating1.ogg', 70)

	spawn(74 SECONDS)
		icon_state = "Zlata 3"
		dir = WEST
		animate(src, pixel_x = 0, 0.3 SECONDS, easing = SINE_EASING|EASE_OUT)

	spawn(76 SECONDS)
		ISay("В чём дело?")

	spawn(84 SECONDS)
		dir = NORTH

	spawn(90 SECONDS)
		ISay("!сжимает пальцы в кулак.")

	spawn(94 SECONDS)
		dir = WEST

	spawn(103 SECONDS)
		CutOverlays(maptext_name)

/mob/living/simple_animal/cutscene_character/maxim/s2ep1/part1_2/do_stuff()
	spawn(2 SECONDS)
		forceMove(get_step(src, NORTH))

	spawn(5 SECONDS)
		ISay("Кусок корпуса в лоб прилетел.")

	spawn(6 SECONDS)
		ISay("Нашёл уже в отключке.")

	spawn(16 SECONDS)
		ISay("Не отвечает.")

	spawn(23 SECONDS)
		ISay("!кивает.")

	spawn(25 SECONDS)
		forceMove(get_step(src, NORTH))

	spawn(28 SECONDS)
		forceMove(get_step(src, NORTH))

/mob/living/simple_animal/cutscene_character/gora/s2ep1/part1_2/do_stuff()
	spawn(2 SECONDS)
		forceMove(get_step(src, NORTH))
		pixel_y = -11

	spawn(25 SECONDS)
		forceMove(get_step(src, NORTH))
		pixel_y = -11

	spawn(28 SECONDS)
		forceMove(get_step(src, NORTH))
		pixel_y = -11

/mob/living/simple_animal/cutscene_character/amelia/s2ep1/part1_2/do_stuff()
	spawn(29 SECONDS)
		forceMove(get_step(src, EAST))
		playsound(get_turf(src), 'sound/effects/footstep/plating4.ogg', 70)

	spawn(32 SECONDS)
		forceMove(get_step(src, EAST))
		playsound(get_turf(src), 'sound/effects/footstep/plating1.ogg', 70)

	spawn(35 SECONDS)
		forceMove(get_step(src, EAST))

	spawn(36 SECONDS)
		forceMove(get_step(src, EAST))

	spawn(37 SECONDS)
		animate(src, pixel_x = 24, 0.3 SECONDS, easing = SINE_EASING|EASE_OUT)

	spawn(56 SECONDS)
		ISay("!ворочит головой.")

	spawn(58 SECONDS)
		ISay("Просто не повезло оказаться на лестничном пролёте, когда-...")

	spawn(70 SECONDS)
		icon_state = "Amelia 3"
		forceMove(get_step(src, EAST))

	spawn(72 SECONDS)
		forceMove(get_step(src, EAST))

	spawn(73 SECONDS)
		ISay("П-погоди!")

	spawn(74 SECONDS)
		icon_state = "Amelia 2"
		forceMove(get_step(src, WEST))
		animate(src, pixel_x = 0, 0.3 SECONDS, easing = SINE_EASING|EASE_IN)

	spawn(80 SECONDS)
		ISay("От Эндсли...до сих пор ничего не слышно.")

	spawn(88.5 SECONDS)
		ISay("Я боюсь, что он мог застрять т-там, внизу, и-...")

	spawn(91 SECONDS)
		ISay("Если кто-нибудь в госпитале сейчас свободен чтобы помочь мне...!")

	spawn(94 SECONDS)
		forceMove(get_step(src, WEST))
		playsound(get_turf(src), 'sound/effects/footstep/plating5.ogg', 70)

	spawn(100 SECONDS)
		ISay("...мам?")

	spawn(103 SECONDS)
		CutOverlays(maptext_name)

/mob/living/simple_animal/cutscene_character/zlata/s2ep1/part1_3/do_stuff()
	ISay("!сжимает воротник мужчины.")
	ISay("Ну не стой же ты столбом! Сделай что-нибудь!")

/mob/living/simple_animal/cutscene_character/datura/s2ep1/part1_3/do_stuff()

	spawn(0.2 SECONDS)
		animate(src, pixel_x = -1, 0.2 SECONDS, easing = SINE_EASING|EASE_OUT)
	spawn(0.4 SECONDS)
		animate(src, pixel_x = 0, 0.2 SECONDS, easing = SINE_EASING|EASE_IN)
	spawn(0.6 SECONDS)
		animate(src, pixel_x = -1, 0.2 SECONDS, easing = SINE_EASING|EASE_OUT)
	spawn(0.8 SECONDS)
		animate(src, pixel_x = 0, 0.2 SECONDS, easing = SINE_EASING|EASE_IN)
	spawn(1 SECONDS)
		animate(src, pixel_x = -1, 0.2 SECONDS, easing = SINE_EASING|EASE_OUT)
	spawn(1.2 SECONDS)
		animate(src, pixel_x = 0, 0.2 SECONDS, easing = SINE_EASING|EASE_IN)
	spawn(1.4 SECONDS)
		animate(src, pixel_x = -1, 0.2 SECONDS, easing = SINE_EASING|EASE_OUT)
	spawn(1.6 SECONDS)
		animate(src, pixel_x = 0, 0.2 SECONDS, easing = SINE_EASING|EASE_IN)
	spawn(1.8 SECONDS)
		animate(src, pixel_x = -1, 0.2 SECONDS, easing = SINE_EASING|EASE_OUT)
	spawn(2 SECONDS)
		animate(src, pixel_x = 0, 0.2 SECONDS, easing = SINE_EASING|EASE_IN)

	spawn(2.2 SECONDS)
		icon_state = "Datura 2"

	spawn(4 SECONDS)
		ISay("Да не помочь ему уже! НИЧЕМ!")

/mob/living/simple_animal/cutscene_character/luny/s2ep1/part1_3/do_stuff()
	spawn(2 SECONDS)
		ISay("...")
