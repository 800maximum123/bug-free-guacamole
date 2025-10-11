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
	visuals.maptext_x = -20
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
		REMOVE_SCREEN(/blackout/animated_better, 1 SECONDS),
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

		MOVE_CAMERA(0, -3, 33 SECONDS, SINE_EASING|EASE_IN),

		PLAY_SOUND(sound('sound/effects/footstep/plating4.ogg', volume = 70)),
		MOVE_ACTOR(actor("Амелия - Сцена 1"), SOUTH) = 4 SECONDS,

		CALL_GLOB(credits_author),

		TALK_ACTOR(actor("Амелия - Сцена 1"), "... Папа?"),
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
		SHIFT_ACTOR(actor("Амелия - Сцена 1"), 0, -10, 0.3 SECONDS, SINE_EASING|EASE_IN, null) = 3 SECONDS,
		SHIFT_ACTOR(actor("Амелия - Сцена 1"), 0, -15, 0.3 SECONDS, SINE_EASING|EASE_IN, null) = 3 SECONDS,
		SHIFT_ACTOR(actor("Амелия - Сцена 1"), 0, -20, 0.3 SECONDS, SINE_EASING|EASE_IN, null) = 2 SECONDS,
		SHIFT_ACTOR(actor("Амелия - Сцена 1"), 0, -25, 0.3 SECONDS, SINE_EASING|EASE_IN, null) = 2 SECONDS,
		TALK_ACTOR(actor("Амелия - Сцена 1"), "!скалится."),
		TALK_ACTOR(actor("Амелия - Сцена 1"), "Д-должен же был..."),
		SHIFT_ACTOR(actor("Амелия - Сцена 1"), 0, -30, 0.3 SECONDS, SINE_EASING|EASE_IN, null) = 4 SECONDS,
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

		ADD_SCREEN(/blackout/animated_better),

		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),

		PLAY_SOUND(sound('sound/effects/footstep/plating5.ogg', volume = 70)),
		TALK_ACTOR(actor("Амелия - Сцена 1"), "... остаться х-хоть кто-то!"),
		MOVE_ACTOR(actor("Амелия - Сцена 1"), SOUTH) = 4 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/plating2.ogg', volume = 70)),
		MOVE_ACTOR(actor("Амелия - Сцена 1"), SOUTH) = 4 SECONDS,

		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),

		PLAY_SOUND(sound('sound/effects/footstep/plating3.ogg', volume = 70)),
		MOVE_ACTOR(actor("Амелия - Сцена 1"), SOUTH) = 4 SECONDS,

		CALL_GLOB(credits_team) = 5 SECONDS,
		MOVE_CAMERA(6, 0, 0, null),
		CALL_GLOB(credits_show) = 16 SECONDS,
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
		TALK_ACTOR(actor("Максим - Сцена 2"), "Ага... Абонент не отвечает.") = 2 SECONDS,
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
		TALK_ACTOR(actor("Злата - Сцена 2"), "Столько крови... все погибшие ребята-...") = 6 SECONDS,
		TALK_ACTOR(actor("Злата - Сцена 2"), "... Я так боялась увидеть тебя среди них.") = 8 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		SHIFT_ACTOR(actor("Злата - Сцена 2"), 4, 0, 0.3 SECONDS, SINE_EASING|EASE_IN, null),
		CHANGE_ACTOR_VISUALS(actor("Злата - Сцена 2"), "Zlata 5") = 2 SECONDS,
		TALK_ACTOR(actor("Злата - Сцена 2"), "Выглядишь неважно...") = 4 SECONDS,
		TALK_ACTOR(actor("Злата - Сцена 2"), "... костюм так тем более.") = 4 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		TALK_ACTOR(actor("Амелия - Сцена 2"), "П-прости... Я обещала что на нём не будет и царапинки...") = 6 SECONDS,
		TALK_ACTOR(actor("Злата - Сцена 2"), "Сущие пустяки.") = 4 SECONDS,
		TALK_ACTOR(actor("Злата - Сцена 2"), "Главное что ты сама цела. Ну... не считая этого.") = 1 SECONDS,
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
		TALK_ACTOR(actor("Злата - Сцена 2"), "Что-то не так? Если я вдруг-...") = 1.5 SECONDS,
		TALK_ACTOR(actor("Амелия - Сцена 2"), "... С-скажи.") = 4 SECONDS,
		ADD_SCREEN(/blackout/animated_better/nofade),
		TURN_ACTOR(actor("Злата - Сцена 2"), NORTH),
		CALL_GLOB(amelia_woe) = 7 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/s2ep1sc3)
	)

/datum/modular_cutscene/s2ep1sc3/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 3"),
		ADD_SCREEN(bluespace_affection),
		ADD_SCREEN(/cinema_borders),
		TALK_ACTOR(actor("Луни - Сцена 3"), "!пялится."),
		TALK_ACTOR(actor("Злата - Сцена 3"), "!сжимает воротник мужчины."),
		SHIFT_ACTOR(actor("Реймонд - Сцена 3"), 0, 0, 0.2 SECONDS, SINE_EASING|EASE_OUT, null) = 0.2 SECONDS,
		PLAY_SOUND(sound('sound/machines/flatline.ogg', volume = 15)),
		CALL_GLOB(time_of_death),
		SHIFT_ACTOR(actor("Реймонд - Сцена 3"), -1, 0, 0.2 SECONDS, SINE_EASING|EASE_IN, null) = 0.2 SECONDS,
		SHIFT_ACTOR(actor("Реймонд - Сцена 3"), 0, 0, 0.2 SECONDS, SINE_EASING|EASE_OUT, null) = 0.2 SECONDS,
		SHIFT_ACTOR(actor("Реймонд - Сцена 3"), -1, 0, 0.2 SECONDS, SINE_EASING|EASE_IN, null) = 0.2 SECONDS,
		SHIFT_ACTOR(actor("Реймонд - Сцена 3"), 0, 0, 0.2 SECONDS, SINE_EASING|EASE_OUT, null) = 0.2 SECONDS,
		SHIFT_ACTOR(actor("Реймонд - Сцена 3"), -1, 0, 0.2 SECONDS, SINE_EASING|EASE_IN, null) = 0.2 SECONDS,
		TALK_ACTOR(actor("Злата - Сцена 3"), "Ну не стой же ты столбом! Сделай что-нибудь!"),
		TALK_ACTOR(actor("Реймонд - Сцена 3"), "!скалится."),
		SHIFT_ACTOR(actor("Реймонд - Сцена 3"), 0, 0, 0.2 SECONDS, SINE_EASING|EASE_OUT, null) = 0.2 SECONDS,
		SHIFT_ACTOR(actor("Реймонд - Сцена 3"), -1, 0, 0.2 SECONDS, SINE_EASING|EASE_IN, null) = 0.2 SECONDS,
		SHIFT_ACTOR(actor("Реймонд - Сцена 3"), 0, 0, 0.2 SECONDS, SINE_EASING|EASE_OUT, null) = 0.2 SECONDS,
		SHIFT_ACTOR(actor("Реймонд - Сцена 3"), -1, 0, 0.2 SECONDS, SINE_EASING|EASE_IN, null) = 0.2 SECONDS,
		CHANGE_ACTOR_VISUALS(actor("Реймонд - Сцена 3"), "Datura 2"),
		PLAY_SOUND(sound('sound/machines/flatline.ogg', volume = 15)),
		TALK_ACTOR(actor("Реймонд - Сцена 3"), "Да не помочь ему уже!"),
		SHIFT_ACTOR(actor("Реймонд - Сцена 3"), 0, 0, 0.2 SECONDS, SINE_EASING|EASE_OUT, null) = 2 SECONDS,
		PLAY_SOUND(sound('sound/machines/flatline.ogg', volume = 15)) = 2 SECONDS,
		TALK_ACTOR(actor("Реймонд - Сцена 3"), "НИЧЕМ!") = 0.5 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/s2ep1sc4)
	)

/datum/modular_cutscene/s2ep1sc4/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 2"),
		ADD_SCREEN(/cinema_borders),
		TALK_ACTOR(actor("Злата - Сцена 2"), "!сжимает пальцы в кулак.") = 8 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		TURN_ACTOR(actor("Злата - Сцена 2"), WEST),
		MOVE_ACTOR(actor("Амелия - Сцена 2"), WEST) = 4 SECONDS,
		CHANGE_ACTOR_VISUALS(actor("Амелия - Сцена 2"), "Amelia 6"),
		TALK_ACTOR(actor("Амелия - Сцена 2"), "!бессильно опускает голову.") = 2 SECONDS,
		TALK_ACTOR(actor("Амелия - Сцена 2"), "П-прошу..."),
		TALK_ACTOR(actor("Амелия - Сцена 2"), "... просто с-скажи как есть."),
		ADD_SCREEN(/blackout/animated_better) = 2 SECONDS,
		CALL_GLOB(credits_name),
		CALL_GLOB(credits_name2) = 18 SECONDS,
		MOVE_CAMERA(0, 0, 0, null),
		START_CUTSCENE(/datum/modular_cutscene/s2ep1sc5)
	)
