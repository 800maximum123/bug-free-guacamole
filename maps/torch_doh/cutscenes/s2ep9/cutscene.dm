/mob/living/simple_animal/cutscene_character/rini
	name = "Ринирили"
	desc = "..."
	icon = 'maps/torch_doh/cutscenes/icons/Character_Rinirili.dmi'
	icon_state = "Current"
	icon_living = "Current"
	icon_dead = "Current"


/obj/effect/cutscene_camera/s2ep9sc1
	camera_id = "Сцена 9-1 - Кадр 1"

/obj/effect/cutscene_camera/s2ep9sc2
	camera_id = "Сцена 9-1 - Кадр 2"

/obj/effect/cutscene_camera/s2ep9sc3
	camera_id = "Сцена 9-1 - Кадр 3"

/obj/effect/cutscene_camera/s2ep9sc4
	camera_id = "Сцена 9-1 - Кадр 4"

/obj/effect/cutscene_camera/s2ep9sc5
	camera_id = "Сцена 9-1 - Кадр 5"

/obj/effect/cutscene_camera/s2ep9sc6
	camera_id = "Сцена 9-1 - Кадр 6"

/obj/effect/cutscene_camera/s2ep9sc7
	camera_id = "Сцена 9-1 - Кадр 7"

/obj/effect/cutscene_camera/s2ep9sc8
	camera_id = "Сцена 9-1 - Кадр 8"

/obj/effect/cutscene_camera/s2ep9sc9
	camera_id = "Сцена 9-1 - Кадр 9"


/proc/credits_writers_news2ep9()
	var/novel_message = "СЦЕНАРИЙ ПИСАЛИ: DOCTOR ALEX, KANARYSS, AHMOQ"
	var/colored = COLOR_ASSEMBLY_BLACK

	var/obj/screen/novel_message/start_credits/visuals = new /obj/screen/novel_message/start_credits()
	visuals.maptext_x = 130
	visuals.maptext_y = -5
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 16 SECONDS)

/proc/s2ep9epname_screentext()
	var/message = {"<b>ЭП 8: Эхо прошлого</b>"}

	var/obj/screen/player_message/maintext = new /obj/screen/player_message()
	maintext.plane = HUD_PLANE
	maintext.layer = HUD_ABOVE_HUD_LAYER
	maintext.maptext_x = -60
	maintext.maptext_y = -70
	maintext.SetTransform(1.8)
	maintext.alpha = 0

	for(var/client/M in GLOB.clients)
		M.screen += maintext
		maintext.set_text(message, COLOR_WHITE)

	spawn(0.5 SECONDS)
		animate(maintext, 4 SECOND, alpha = 255)
		maintext.set_text(message, COLOR_WHITE)

	spawn(10 SECONDS)
		animate(maintext, 4 SECOND, alpha = 0)
		maintext.set_text(message, COLOR_WHITE)

	spawn(14 SECONDS)
		for(var/client/M in GLOB.clients)
			for(var/obj/screen/messages in M.screen)
				if(istype(messages, /obj/screen/player_message))
					M.screen -= messages
					qdel(messages)


/proc/fds2ep9_cutscene1()
	start_cutscene(/datum/modular_cutscene/s2ep9sc1)

/datum/modular_cutscene/s2ep9sc1/setup_actions(...)
	actions = list(
		ADD_SCREEN(/blackout/animated_better) = 5 SECONDS,
		TP_CAMERA("Сцена 9-1 - Кадр 1"),
		MOVE_CAMERA(0, -2, 0 SECONDS, SINE_EASING|EASE_IN),
		ADD_SCREEN(/cinema_borders),
		REMOVE_SCREEN(/blackout/animated_better, 5),
		TALK_ACTOR(actor("Ринирили - 9-1-1"), "!заправляет генератор листами форона") = 3 SECONDS,
		TALK_ACTOR(actor("Ринирили - 9-1-1"), "Последние...") = 4 SECONDS,
		CALL_GLOB(credits_devss2ep8),
		SHIFT_ACTOR(actor("Ринирили - 9-1-1"), 12, -10, 1 SECONDS, SINE_EASING|EASE_IN, null) = 0.75 SECONDS,
		TALK_ACTOR(actor("Ринирили - 9-1-1"), "!Слезает с табуретки"),
		TURN_ACTOR(actor("Ринирили - 9-1-1"), SOUTH) = 2 SECONDS,
		TALK_ACTOR(actor("Ринирили - 9-1-1"), "Что там с реактором Ветерка...") = 2 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/plating2.ogg', volume = 50), null),
		MOVE_ACTOR(actor("Ринирили - 9-1-1"), SOUTH),
		MOVE_CAMERA(0, 4, 16 SECONDS, SINE_EASING|EASE_IN) = 0.5 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/plating2.ogg', volume = 50), null),
		MOVE_ACTOR(actor("Ринирили - 9-1-1"), SOUTH),
		SHIFT_ACTOR(actor("Ринирили - 9-1-1"), 2, 10, 2 SECONDS, SINE_EASING|EASE_IN, null) = 1 SECONDS,
		TALK_ACTOR(actor("Максим - 9-1-1"), "Хорошо, что так собрались...") = 1.5 SECONDS,
		TURN_ACTOR(actor("Ринирили - 9-1-1"), EAST) = 0.1 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/plating2.ogg', volume = 45), null),
		MOVE_ACTOR(actor("Ринирили - 9-1-1"), EAST) = 0.6 SECONDS,
		TALK_ACTOR(actor("Максим - 9-1-1"), "!делает затяжку, после чего выдыхает облачко дыма") = 1.5 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/plating2.ogg', volume = 40), null),
		MOVE_ACTOR(actor("Ринирили - 9-1-1"), EAST) = 0.6 SECONDS,
		TALK_ACTOR(actor("Мортимер - 9-1-1"), "Ну-уус...") = 1 SECONDS,
		TURN_ACTOR(actor("Ринирили - 9-1-1"), NORTH) = 0.3 SECONDS,
		TALK_ACTOR(actor("Мортимер - 9-1-1"), "!выдыхает облачко дыма, поглядывая в окно") = 1 SECONDS,
		SHIFT_ACTOR(actor("Ринирили - 9-1-1"), -2, 12, 0.5 SECONDS, SINE_EASING|EASE_IN, null) = 0.2 SECONDS,
		MOVE_ACTOR(actor("Ринирили - 9-1-1"), NORTH) = 0.3 SECONDS,
		TALK_ACTOR(actor("Ринирили - 9-1-1"), "!запрыгивает на стул") = 1 SECONDS,
		TURN_ACTOR(actor("Ринирили - 9-1-1"), WEST) = 1 SECONDS,
		TALK_ACTOR(actor("Мортимер - 9-1-1"), "Кто раздаёт?") = 0.45 SECONDS,
		ADD_SCREEN(/blackout/animated_better) = 2 SECONDS,
		MOVE_CAMERA(0, 0, 0, null),
		START_CUTSCENE(/datum/modular_cutscene/s2ep9sc2)
	)

/datum/modular_cutscene/s2ep9sc2/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 9-1 - Кадр 2"),
		MOVE_CAMERA(-8, 0, 36 SECONDS, SINE_EASING|EASE_IN),
		CALL_GLOB(credits_mapperss2ep8),
		REMOVE_SCREEN(/blackout/animated_better, 5) = 3 SECONDS,
		TALK_ACTOR(actor("Фиддлер - 9-1-2"), "В четвёртый раз спрашиваю!") = 3 SECONDS,
		TALK_ACTOR(actor("Фиддлер - 9-1-2"), "Что вы тут +опять+ устроили?!") = 4 SECONDS,
		TALK_ACTOR(actor("Оливия - 9-1-2"), "Ну а я в четвёртый раз повторяю") = 2 SECONDS,
		TURN_ACTOR(actor("Фиддлер - 9-1-2"), SOUTH) = 2 SECONDS,
		TALK_ACTOR(actor("Оливия - 9-1-2"), "Это всё Року!") = 1 SECONDS,
		CHANGE_ACTOR_VISUALS(actor("Оливия - 9-1-2"), "EP2 PAGE 1 - 1"),
		TALK_ACTOR(actor("Оливия - 9-1-2"), "!указывает за спину Фиддлеру") = 4 SECONDS,
		TALK_ACTOR(actor("Фиддлер - 9-1-2"), "Ну и я в четвёртый раз спрошу:") = 2 SECONDS,
		TALK_ACTOR(actor("Фиддлер - 9-1-2"), "Мы в детском саду по-вашему?") = 4 SECONDS,
		TALK_ACTOR(actor("Року - 9-1-2"), "!утирает нос рукавом") = 2 SECONDS,
		TALK_ACTOR(actor("Оливия - 9-1-2"), "Ну ты бы сам попробовал её остановить!!") = 4 SECONDS,
		TALK_ACTOR(actor("Фиддлер - 9-1-2"), "А ты решила и не пробовать?"),
		ADD_SCREEN(/blackout/animated_better) = 2 SECONDS,
		CALL_GLOB(credits_spriterss2ep8),
		MOVE_CAMERA(0, 0, 0, null),
		START_CUTSCENE(/datum/modular_cutscene/s2ep9sc3)
	)

/datum/modular_cutscene/s2ep9sc3/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 9-1 - Кадр 3"),
		CHANGE_ACTOR_LAYER(actor("Амелия - 9-1-3"), 2.6),
		MOVE_CAMERA(0, 5, 20 SECONDS, SINE_EASING|EASE_IN),
		REMOVE_SCREEN(/blackout/animated_better, 3.5) = 2 SECONDS,
		SHIFT_ACTOR(actor("Амелия - 9-1-3"), 8, 18, 1 SECONDS, SINE_EASING|EASE_IN, null),
		TALK_ACTOR(actor("Амелия - 9-1-3"), "!откладывает отвёртку и делает глубокий вдох, откидываясь на стуле") = 3 SECONDS,
		TALK_ACTOR(actor("Амелия - 9-1-3"), "фу-у-у-у-ух...") = 4 SECONDS,
		TALK_ACTOR(actor("Амелия - 9-1-3"), "И этот в труху... Хотя...") = 3 SECOND,
		SHIFT_ACTOR(actor("Амелия - 9-1-3"), 10, 23, 0.5 SECONDS, SINE_EASING|EASE_IN, null) = 2 SECONDS,
		TALK_ACTOR(actor("Амелия - 9-1-3"), "!прищуривается") = 4 SECONDS,
		ADD_SCREEN(/blackout/animated_better) = 2 SECONDS,
		TALK_ACTOR(actor("Амелия - 9-1-3"), "может мозг не так побит...") = 1 SECONDS,
		MOVE_CAMERA(0, 0, 0, null),
		START_CUTSCENE(/datum/modular_cutscene/s2ep9sc4)
	)

/datum/modular_cutscene/s2ep9sc4/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 9-1 - Кадр 4"),
		REMOVE_SCREEN(/blackout/animated_better, 3.5) = 5 SECONDS,
		TALK_ACTOR(actor("Канарис - 9-1-4"), "!медленно покуривает сигаретку, блаженно глядя в море") = 5 SECONDS,
		TALK_ACTOR(actor("Канарис - 9-1-4"), "Да-а-а-а...") = 5 SECONDS,
		ADD_SCREEN(/blackout/animated_better) = 3 SECONDS,
		TP_CAMERA("Сцена 9-1 - Кадр 5"),
		REMOVE_SCREEN(/blackout/animated_better, 2) = 1 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/asteroid4.ogg', volume = 50), null),
		MOVE_ACTOR(actor("Уфу - 9-1-4"), WEST) = 1.2 SECONDS,
		TALK_ACTOR(actor("Уфу - 9-1-4"), "Диких тр-р-рав нет...") = 2.5 SECONDS,
		TURN_ACTOR(actor("Уфу - 9-1-4"), NORTH) = 1.7 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/asteroid2.ogg', volume = 50), null),
		TURN_ACTOR(actor("Уфу - 9-1-4"), SOUTH),
		MOVE_ACTOR(actor("Уфу - 9-1-4"), WEST) = 2 SECONDS,
		TALK_ACTOR(actor("Уфу - 9-1-4"), "!издаёт недовольное 'м-м-р-р-р-ь-ях...'") = 2.5 SECONDS,
		TURN_ACTOR(actor("Уфу - 9-1-4"), WEST) = 2 SECONDS,
		ADD_SCREEN(/blackout/animated_better),
		TALK_ACTOR(actor("Уфу - 9-1-4"), "За то ор-р-риентир-р..."),
		PLAY_SOUND(sound('sound/effects/footstep/asteroid4.ogg', volume = 50), null),
		MOVE_ACTOR(actor("Уфу - 9-1-4"), WEST) = 2 SECONDS,
		TP_CAMERA("Сцена 9-1 - Кадр 4"),
		REMOVE_SCREEN(/blackout/animated_better, 2) = 1 SECONDS,
		TALK_ACTOR(actor("Канарис - 9-1-4"), "!закашливается, роняя сигарету в воду"),
		CHANGE_ACTOR_VISUALS(actor("Канарис - 9-1-4"), "Current") = 2 SECONDS,
		MOVE_ACTOR(actor("Уфу - 9-1-4"), WEST),
		SHIFT_ACTOR(actor("Уфу - 9-1-4"), -8, 0, 0, SINE_EASING|EASE_IN, null),
		TALK_ACTOR(actor("Канарис - 9-1-4"), "Блять..."),
		ADD_SCREEN(/blackout/animated_better) = 1 SECONDS,
		TALK_ACTOR(actor("Канарис - 9-1-4"), "!кашляет") = 2 SECONDS,
		TALK_ACTOR(actor("Канарис - 9-1-4"), "Сука!...") = 3 SECONDS,
		TP_CAMERA("Сцена 9-1 - Кадр 5"),
		REMOVE_SCREEN(/blackout/animated_better, 1),
		TALK_ACTOR(actor("Уфу - 9-1-4"), "!повёл ухом"),
		SHIFT_ACTOR(actor("Уфу - 9-1-4"), 16, 0, 3 SECONDS, SINE_EASING|EASE_IN, null),
		TURN_ACTOR(actor("Уфу - 9-1-4"), NORTH) = 3.7 SECONDS,
		TP_CAMERA("Сцена 9-1 - Кадр 4"),
		TALK_ACTOR(actor("Канарис - 9-1-4"), "+А-АБЛЯДЬ!!+") = 3 SECONDS,
		SHIFT_ACTOR(actor("Уфу - 9-1-4"), 0, 0, 0, SINE_EASING|EASE_IN, null),
		MOVE_ACTOR(actor("Уфу - 9-1-4"), EAST),
		TALK_ACTOR(actor("Канарис - 9-1-4"), "!опирается руками о колени"),
		SHIFT_ACTOR(actor("Канарис - 9-1-4"), 1, -2, 0.5 SECONDS, SINE_EASING|EASE_IN, null) = 2 SECONDS,
		TALK_ACTOR(actor("Канарис - 9-1-4"), "!харкает кровью"),
		MOVE_CAMERA(0, -30, 1.4 SECONDS, SINE_EASING|EASE_IN) = 1.5 SECONDS,
		TP_CAMERA("Сцена 9-1 - Кадр 5"),
		MOVE_CAMERA(0, 0, 0, null),
		TALK_ACTOR(actor("Уфу - 9-1-4"), "Дер-ржись, кто бы ты ни был!") = 1 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/asteroid4.ogg', volume = 50), null),
		MOVE_ACTOR(actor("Уфу - 9-1-4"), NORTH) = 1.25 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/asteroid2.ogg', volume = 50), null),
		MOVE_ACTOR(actor("Уфу - 9-1-4"), NORTH) = 1.25 SECONDS,
		MOVE_CAMERA(0, 30, 6 SECONDS, SINE_EASING|EASE_IN),
		PLAY_SOUND(sound('sound/effects/footstep/asteroid4.ogg', volume = 50), null),
		MOVE_ACTOR(actor("Уфу - 9-1-4"), NORTH) = 1.25 SECONDS,
		TALK_ACTOR(actor("Уфу - 9-1-4"), "Мрьях!") = 0.35 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/asteroid2.ogg', volume = 50), null),
		MOVE_ACTOR(actor("Уфу - 9-1-4"), NORTH) = 0.4 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/asteroid4.ogg', volume = 50), null),
		MOVE_ACTOR(actor("Уфу - 9-1-4"), NORTH) = 0.75 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/asteroid2.ogg', volume = 50), null),
		MOVE_ACTOR(actor("Уфу - 9-1-4"), NORTH) = 1.25 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/asteroid4.ogg', volume = 50), null),
		MOVE_ACTOR(actor("Уфу - 9-1-4"), NORTH) = 1.25 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/asteroid2.ogg', volume = 50), null),
		MOVE_ACTOR(actor("Уфу - 9-1-4"), NORTH) = 1.25 SECONDS,
		TP_CAMERA("Сцена 9-1 - Кадр 4"),
		MOVE_CAMERA(0, 0, 0, null),
		MOVE_ACTOR(actor("Уфу - 9-1-4"), NORTH),
		MOVE_ACTOR(actor("Уфу - 9-1-4"), NORTH),
		MOVE_ACTOR(actor("Уфу - 9-1-4"), NORTH),
		MOVE_ACTOR(actor("Уфу - 9-1-4"), NORTH),
		MOVE_ACTOR(actor("Уфу - 9-1-4"), NORTH),
		MOVE_ACTOR(actor("Уфу - 9-1-4"), NORTH),
		MOVE_ACTOR(actor("Уфу - 9-1-4"), NORTH),
		MOVE_ACTOR(actor("Уфу - 9-1-4"), NORTH),
		MOVE_ACTOR(actor("Уфу - 9-1-4"), NORTH),
		MOVE_ACTOR(actor("Уфу - 9-1-4"), NORTH),
		MOVE_ACTOR(actor("Уфу - 9-1-4"), NORTH),
		MOVE_ACTOR(actor("Уфу - 9-1-4"), NORTH),
		MOVE_ACTOR(actor("Уфу - 9-1-4"), NORTH),
		MOVE_ACTOR(actor("Уфу - 9-1-4"), NORTH),
		MOVE_ACTOR(actor("Уфу - 9-1-4"), NORTH),
		SHIFT_ACTOR(actor("Канарис - 9-1-4"), -8, 20, 1 SECONDS, SINE_EASING|EASE_IN, null) = 2 SECONDS,
		SHIFT_ACTOR(actor("Канарис - 9-1-4"), 2, 15, 1 SECONDS, SINE_EASING|EASE_IN, null) = 1 SECONDS,
		SHIFT_ACTOR(actor("Канарис - 9-1-4"), 20, 20, 1 SECONDS, SINE_EASING|EASE_IN, null) = 2 SECONDS,
		SHIFT_ACTOR(actor("Канарис - 9-1-4"), -14, 0, 1.5 SECONDS, SINE_EASING|EASE_IN, null) = 2 SECONDS,
		TALK_ACTOR(actor("Канарис - 9-1-4"), "Докурился...") = 0.5 SECONDS,
		SHIFT_ACTOR(actor("Канарис - 9-1-4"), 16, -2, 2 SECONDS, SINE_EASING|EASE_IN, null) = 1 SECONDS,
		TALK_ACTOR(actor("Канарис - 9-1-4"), "!теряет сознание и падает лицом в песок."),
		CHANGE_ACTOR_MATRIX(actor("Канарис - 9-1-4"), 90, 0.5 SECONDS, SINE_EASING|EASE_IN, ANIMATION_PARALLEL),
		PLAY_SOUND(sound('sound/effects/footstep/asteroid1.ogg', volume = 50), null),
		MOVE_ACTOR(actor("Уфу - 9-1-4"), NORTH) = 1.5 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/asteroid1.ogg', volume = 50), null),
		MOVE_ACTOR(actor("Уфу - 9-1-4"), NORTH) = 1.5 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/asteroid1.ogg', volume = 50), null),
		MOVE_ACTOR(actor("Уфу - 9-1-4"), NORTH) = 1.5 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/asteroid1.ogg', volume = 50), null),
		MOVE_ACTOR(actor("Уфу - 9-1-4"), NORTH) = 1.5 SECONDS,
		ADD_SCREEN(/blackout/animated_better),
		PLAY_SOUND(sound('sound/effects/footstep/asteroid1.ogg', volume = 50), null),
		MOVE_ACTOR(actor("Уфу - 9-1-4"), NORTH) = 1.5 SECONDS,
		CALL_GLOB(s2ep9epname_screentext) = 16 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/s2ep9sc5)
	)

/datum/modular_cutscene/s2ep9sc5/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 9-1 - Кадр 6"),
		CHANGE_ACTOR_MATRIX(actor("Канарис - 9-1-6"), 90, 0, SINE_EASING|EASE_IN, ANIMATION_PARALLEL) = 3 SECONDS,
		REMOVE_SCREEN(/blackout/animated_better, 5) = 5 SECONDS,
		TALK_ACTOR(actor("Кристиана - 9-1-6"), "И-и-и... Что же, с-совсем?...") = 3 SECONDS,
		TALK_ACTOR(actor("Лира - 9-1-6"), "Да, я +совсем+ не знаю.") = 3 SECONDS,
		TALK_ACTOR(actor("Кристиана - 9-1-6"), "И-и-и... С-сдел...-") = 1.5 SECONDS,
		TALK_ACTOR(actor("Лира - 9-1-6"), "+НЕ ЗНАЮ!+") = 4 SECONDS,
		TALK_ACTOR(actor("Лира - 9-1-6"), "я не знаю...") = 6 SECONDS,
		TALK_ACTOR(actor("Лира - 9-1-6"), "Если бы я знала, что с ним, я бы уже пыталась это решить...") = 2 SECONDS,
		ADD_SCREEN(/blackout/animated_better) = 3 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/s2ep9sc6)
	)


/datum/modular_cutscene/s2ep9sc6/setup_actions(...)
	actions = list(
		CHANGE_ACTOR_MATRIX(actor("Адриано - 9-1-8"), 15, 0 SECONDS, SINE_EASING|EASE_IN, ANIMATION_PARALLEL),
		TP_CAMERA("Сцена 9-1 - Кадр 7"),
		REMOVE_SCREEN(/blackout/animated_better, 5) = 5 SECONDS,
		TALK_ACTOR(actor("Фиддлер - 9-1-7"), "И чего такого ты вытащила из дронов, что...-") = 2 SECONDS,
		TURN_ACTOR(actor("Амелия - 9-1-7"), EAST) = 0.3 SECONDS,
		TALK_ACTOR(actor("Амелия - 9-1-7"), "Точку интереса!") = 2 SECONDS,
		TURN_ACTOR(actor("Амелия - 9-1-7"), SOUTH) = 1 SECONDS,
		TALK_ACTOR(actor("Фиддлер - 9-1-7"), "!одобрительно кивает.") = 2 SECONDS,
		TALK_ACTOR(actor("Фиддлер - 9-1-7"), "только быстрее. Не знаю, как на долго хватит генератора.") = 3 SECONDS,
		SHIFT_ACTOR(actor("Амелия - 9-1-7"), -4, -6, 1 SECONDS, SINE_EASING|EASE_IN, null) = 0.5 SECONDS,
		TALK_ACTOR(actor("Амелия - 9-1-7"), "!кратко кивнула, вставляя флешку в порт.") = 3 SECONDS,
		TALK_ACTOR(actor("Амелия - 9-1-7"), "Смо-о-отри...") = 2 SECONDS,
		TALK_ACTOR(actor("Амелия - 9-1-7"), "Вот эти точки:") = 1 SECONDS,
		TALK_ACTOR(actor("Амелия - 9-1-7"), "!указывает на горящие красным отметки на карте.") = 2 SECONDS,
		TALK_ACTOR(actor("Амелия - 9-1-7"), "Вот эти точки записаны как точки для отступления на случай потери связи.") = 4 SECONDS,
		TALK_ACTOR(actor("Амелия - 9-1-7"), "Они...") = 1 SECONDS,
		TALK_ACTOR(actor("Адриано - 9-1-7"), "Фиддлер") = 2 SECONDS,
		TALK_ACTOR(actor("Фиддлер - 9-1-7"), "Минутку...") = 2 SECONDS,
		TURN_ACTOR(actor("Фиддлер - 9-1-7"), EAST) = 1 SECONDS,
		SHIFT_ACTOR(actor("Фиддлер - 9-1-7"), 10, -6, 4 SECONDS, SINE_EASING|EASE_IN, null) = 2 SECONDS,
		TALK_ACTOR(actor("Фиддлер - 9-1-7"), "!нажимает на кнопку на рации") = 1 SECONDS,
		TALK_ACTOR(actor("Фиддлер - 9-1-7"), "Ты всё проверил?") = 2 SECONDS,

		TP_CAMERA("Сцена 9-1 - Кадр 8") = 2 SECONDS,
		MOVE_CAMERA(-2, 0, 18 SECONDS, SINE_EASING|EASE_IN),
		TURN_ACTOR(actor("Амелия - 9-1-7"), EAST),
		TALK_ACTOR(actor("Адриано - 9-1-8"), "Да. Без питания ничего не работает") = 4 SECONDS,
		TALK_ACTOR(actor("Адриано - 9-1-8"), "У нас ни света, ни медицинсского, ни даже...") = 4 SECONDS,
		TALK_ACTOR(actor("Адриано - 9-1-8"), "!стучит по кнопкам") = 2 SECONDS,
		TALK_ACTOR(actor("Адриано - 9-1-8"), "!вздыхает") = 2 SECONDS,
		TALK_ACTOR(actor("Адриано - 9-1-8"), "Закрытого входа...") = 4 SECONDS,
		CHANGE_ACTOR_MATRIX(actor("Адриано - 9-1-8"), 0, 0 SECONDS, SINE_EASING|EASE_IN, ANIMATION_PARALLEL) = 4 SECONDS,

		MOVE_CAMERA(0, 0, 0, null),
		TP_CAMERA("Сцена 9-1 - Кадр 7") = 2 SECONDS,
		TALK_ACTOR(actor("Фиддлер - 9-1-7"), "Принял. Собери всех на брифинг через 20 минут. Отбой.") = 4 SECONDS,
		TALK_ACTOR(actor("Амелия - 9-1-7"), "Всё без питания?") = 3 SECONDS,
		TALK_ACTOR(actor("Фиддлер - 9-1-7"), "Даже ворота не работают.") = 2 SECONDS,
		TURN_ACTOR(actor("Фиддлер - 9-1-7"), WEST) = 2 SECONDS,
		TALK_ACTOR(actor("Амелия - 9-1-7"), "Контур из тунне...-") = 1 SECONDS,
		TALK_ACTOR(actor("Фиддлер - 9-1-7"), "Как обрубили.") = 3 SECONDS,
		TALK_ACTOR(actor("Амелия - 9-1-7"), "Ну а...") = 1 SECONDS,
		TALK_ACTOR(actor("Амелия - 9-1-7"), "!усмехается") = 2 SECONDS,
		TALK_ACTOR(actor("Амелия - 9-1-7"), "Подземное Солнце Ветерка?") = 3 SECONDS,
		TALK_ACTOR(actor("Фиддлер - 9-1-7"), "Он пошёл разобраться, что не так.") = 3 SECONDS,

		TP_CAMERA("Сцена 9-1 - Кадр 9") = 1.5 SECONDS,
		MOVE_CAMERA(0, 2, 15 SECONDS, SINE_EASING|EASE_IN),
		TALK_ACTOR(actor("Ветерок - 9-1-9"), "М-м-м-я-я-я-с-с-с-а-а-о, что-о ты-ы де-е-ела-аеешь?") = 3 SECONDS,
		TALK_ACTOR(actor("Мясо - 9-1-9"), "А на что это похоже?") = 2 SECONDS,
		TALK_ACTOR(actor("Мясо - 9-1-9"), "Восстанавливаю силы, пытаюсь не умереть после того случая.") = 4 SECONDS,
		TALK_ACTOR(actor("Ветерок - 9-1-9"), "Но-о-о-о М-м-м-м-м-я-я-я-я-я-с-с-с-с-с-с-о-о-о-о-а-о...") = 3 SECONDS,
		TALK_ACTOR(actor("Мясо - 9-1-9"), "Знаю, что последний, но мне нужно.") = 2 SECONDS,
		TALK_ACTOR(actor("Мясо - 9-1-9"), "!отростком подтягивает урановую таблетку") = 1 SECONDS,

		MOVE_CAMERA(0, 0, 0, null),
		TP_CAMERA("Сцена 9-1 - Кадр 7") = 2 SECONDS,
		TALK_ACTOR(actor("Фиддлер - 9-1-7"), "Что бы там ни было — давай вернёмся к твоему вопросу.") = 3 SECONDS,
		SHIFT_ACTOR(actor("Фиддлер - 9-1-7"), -8, -6, 3 SECONDS, SINE_EASING|EASE_IN, null) = 2 SECONDS,
		TALK_ACTOR(actor("Фиддлер - 9-1-7"), "Время генератора тикает.") = 2 SECONDS,
		TALK_ACTOR(actor("Амелия - 9-1-7"), "!кивает") = 2 SECONDS,
		TURN_ACTOR(actor("Амелия - 9-1-7"), SOUTH) = 1 SECONDS,
		TALK_ACTOR(actor("Амелия - 9-1-7"), "Так вот...") = 2 SECONDS,
		TALK_ACTOR(actor("Амелия - 9-1-7"), "Есть одна неактивная точка.") = 2 SECONDS,
		TALK_ACTOR(actor("Амелия - 9-1-7"), "!указывает на серую отметку") = 2 SECONDS,
		TALK_ACTOR(actor("Амелия - 9-1-7"), "С минимальным приоритетом.") = 4 SECONDS,
		TALK_ACTOR(actor("Амелия - 9-1-7"), "Судя по информации она не укреплена по сравнению с другими.") = 3 SECONDS,
		TALK_ACTOR(actor("Фиддлер - 9-1-7"), "По карте на этой точке какая-то территория, должно быть ещё старая...") = 5 SECONDS,
		TALK_ACTOR(actor("Амелия - 9-1-7"), "Да!") = 1 SECONDS,
		TALK_ACTOR(actor("Амелия - 9-1-7"), "Я спросила у местных.") = 2 SECONDS,
		TALK_ACTOR(actor("Амелия - 9-1-7"), "Изначально там распологался развлекательный центр. То-ли казино, то-ли ещё что...") = 6 SECONDS,
		TALK_ACTOR(actor("Амелия - 9-1-7"), "'Для поддержания морального духа в условиях изоляции'") = 2 SECONDS,
		TALK_ACTOR(actor("Амелия - 9-1-7"), "!хихикает") = 5 SECONDS,
		TALK_ACTOR(actor("Амелия - 9-1-7"), "Туда можно добраться по туннелям.") = 2 SECONDS,
		TALK_ACTOR(actor("Амелия - 9-1-7"), "Иных вариантов действий у нас...") = 3 SECONDS,
		MOVE_CAMERA(0, 5, 15 SECONDS, SINE_EASING|EASE_IN),
		TALK_ACTOR(actor("Амелия - 9-1-7"), "!разводит руками") = 4 SECONDS,
		TALK_ACTOR(actor("Фиддлер - 9-1-7"), "!кивает") = 3 SECONDS,
		TALK_ACTOR(actor("Фиддлер - 9-1-7"), "Принял. Созываем брифинг") = 3 SECONDS,

		ADD_SCREEN(/blackout/animated_better) = 3 SECONDS,
		REMOVE_SCREEN(/cinema_borders, 5) = 2 SECONDS,
		RETURN_VIEWERS,
		MOVE_CAMERA(0, 0, 0, null),
		REMOVE_SCREEN(/blackout/animated_better, 3 SECONDS)
	)
