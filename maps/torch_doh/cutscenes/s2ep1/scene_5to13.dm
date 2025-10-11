//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// АССЕТЫ, НЕОБХОДИМЫЕ СЦЕНЕ //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/obj/smoke_wall_notimer
	icon_state = "smoke wall"
	anchored = TRUE
	layer = ABOVE_HUMAN_LAYER
	icon = 'icons/effects/smoke.dmi'
	icon_state = "smoke"
	pixel_x = -9
	pixel_y = -6

/obj/turf_fire/prop
	interact_with_atmos = FALSE
	passive_loss = FALSE
	color = COLOR_MEDICAL_BURN

/mob/living/simple_animal/cutscene_character/airlock/s2ep1/part2_1
	name = "Airlock"
	desc = "..."
	icon = 'icons/obj/doors/station/door.dmi'
	icon_state = "closed"
	icon_living = "closed"
	icon_dead = "closed"

	opacity = TRUE
	should_show_name = FALSE

/obj/structure/fd/players_geter/s2ep1/part2_1 // Мостик

/obj/structure/fd/players_geter/s2ep1/part2_2 // Инженерный отсек

/obj/structure/fd/players_geter/s2ep1/part2_3 // Коридор третьей

/obj/structure/fd/players_geter/s2ep1/part2_4 // Кошки помирают

/obj/structure/fd/players_geter/s2ep1/part2_5 // Ганбоат

/obj/structure/fd/players_geter/s2ep1/part2_6 // Госпиталь

/obj/structure/fd/players_geter/s2ep1/part2_7 // Фиддлер

/obj/structure/fd/players_geter/s2ep1/part2_8 // Неизвестные

/proc/amper_lastwords()
	var/novel_message = "НОВОГО ЦИКЛА?"
	var/colored = "#ebac00"

	var/obj/screen/novel_message/start_credits/big_nofade/visuals = new /obj/screen/novel_message/start_credits/big_nofade()
	visuals.maptext_y = -90
	visuals.maptext_x = -2
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 2 SECONDS)

/proc/naia_promise()
	var/novel_message = "ОБЕЩАЮ"
	var/colored = "#7a0000"

	var/obj/screen/novel_message/start_credits/big_nofade/visuals = new /obj/screen/novel_message/start_credits/big_nofade()
	visuals.maptext_y = -90
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 6 SECONDS)

/proc/credits_mapper()
	var/novel_message = "РАБОТА НАД ЛОКАЦИЯМИ: PALERNO"
	var/colored = COLOR_ASSEMBLY_BLACK

	var/obj/screen/novel_message/start_credits/visuals = new /obj/screen/novel_message/start_credits()
	visuals.maptext_x = -110
	visuals.maptext_y = -5
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 16 SECONDS)

/proc/credits_headdev()
	var/novel_message = "ТЕХНИЧЕСКАЯ ЧАСТЬ: DANILCUS"
	var/colored = COLOR_ASSEMBLY_BLACK

	var/obj/screen/novel_message/start_credits/visuals = new /obj/screen/novel_message/start_credits()
	visuals.maptext_x = -100
	visuals.maptext_y = -15
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 16 SECONDS)

/proc/credits_writers()
	var/novel_message = "ПОМОЩНИКИ СЦЕНАРИСТА: TECHPRIEST34, HELPMEEE, LOZARI, KANARYSS"
	var/colored = COLOR_ASSEMBLY_BLACK

	var/obj/screen/novel_message/start_credits/visuals = new /obj/screen/novel_message/start_credits()
	visuals.maptext_x = 110
	visuals.maptext_y = -10
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 16 SECONDS)

/proc/credits_investors()
	var/novel_message = "ФИНАНСОВУЮ ПОМОЩЬ ОКАЗЫВАЛИ: DENXAYS, TREESISS, VISTA1, TACKCARD, DELTA23, GRIGPASHTET, KRABINATOR3000"
	var/colored = COLOR_ASSEMBLY_BLACK

	var/obj/screen/novel_message/start_credits/visuals = new /obj/screen/novel_message/start_credits()
	visuals.maptext_x = 5
	visuals.maptext_y = -420
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 16 SECONDS)

/obj/effect/cutscene_camera/s2ep1sc4
	camera_id = "Сцена 4"

/obj/effect/cutscene_camera/s2ep1sc5
	camera_id = "Сцена 5"

#define CREATE_SPARK(actor) CALL(src, create_spark, actor) //используется только в этой катсцене потому сюда и вынес
/datum/modular_cutscene/proc/create_spark(mob/living/actor)
	var/datum/effect/spark_spread/spark_system = new /datum/effect/spark_spread()
	spark_system.set_up(5, 0, actor)
	spark_system.start()

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// СКРИПТ СЦЕНЫ //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/datum/modular_cutscene/s2ep1sc5/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 4"),
		ADD_SCREEN(/cinema_borders),
		MOVE_CAMERA(6, 0, 0, null),
		ADD_SCREEN(/blackout/animated_better/nofade) = 1 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		REMOVE_SCREEN(/blackout/animated_better/nofade, 3 SECONDS) = 1 SECONDS,
		CHANGE_ACTOR_VISUALS(actor("Дверь"), "construction"),
		PLAY_SOUND(sound('sound/weapons/pushhiss.ogg', volume = 50)),
		PLAY_SOUND(sound("sparks", volume = 50)),
		CREATE_SPARK(actor("Дверь")),
		MOVE_ACTOR(actor("Дверь"), WEST),
		CHANGE_ACTOR_MATRIX(actor("Дверь"), 90, 0.2 SECONDS, SINE_EASING, null) = 0.2 SECONDS,
		MOVE_ACTOR(actor("Дверь"), WEST),
		CHANGE_ACTOR_MATRIX(actor("Дверь"), 90, 0.2 SECONDS, SINE_EASING, null) = 0.2 SECONDS,
		MOVE_ACTOR(actor("Дверь"), WEST),
		PLAY_SOUND(sound('sound/effects/footstep/plating5.ogg', volume = 70)),
		MOVE_ACTOR(actor("Мясо - Сцена 5"), WEST),
		CHANGE_ACTOR_MATRIX(actor("Дверь"), 90, 0.2 SECONDS, SINE_EASING, null) = 0.2 SECONDS,
		MOVE_ACTOR(actor("Дверь"), WEST),
		CHANGE_ACTOR_MATRIX(actor("Дверь"), 90, 0.2 SECONDS, SINE_EASING, null) = 0.2 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/plating3.ogg', volume = 70)),
		MOVE_ACTOR(actor("Мясо - Сцена 5"), WEST) = 1 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/plating5.ogg', volume = 70)),
		MOVE_ACTOR(actor("Мясо - Сцена 5"), WEST) = 1 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		TURN_ACTOR(actor("Мясо - Сцена 5"), SOUTH) = 0.5 SECONDS,
		SHIFT_ACTOR(actor("Мясо - Сцена 5"), 0, 15, 0.5 SECONDS, SINE_EASING|EASE_IN, null),
		PLAY_SOUND(sound('sound/effects/footstep/plating2.ogg', volume = 70)),
		MOVE_ACTOR(actor("Ная - Сцена 5"), WEST) = 1 SECONDS,
		TALK_ACTOR(actor("Ная - Сцена 5"), "Церемониться ты не любишь, как погляжу?"),
		PLAY_SOUND(sound('sound/effects/footstep/plating4.ogg', volume = 70)),
		MOVE_ACTOR(actor("Ная - Сцена 5"), WEST) = 1 SECONDS,
		TURN_ACTOR(actor("Ная - Сцена 5"), SOUTH),
		PLAY_SOUND(sound('sound/effects/footstep/plating3.ogg', volume = 70)),
		MOVE_ACTOR(actor("Ная - Сцена 5"), SOUTH) = 0.5 SECONDS,
		TURN_ACTOR(actor("Ная - Сцена 5"), WEST) = 2 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		TALK_ACTOR(actor("Ная - Сцена 5"), "!усмехается."),
		TALK_ACTOR(actor("Ная - Сцена 5"), "А мне ещё говорили, что дионам свойственно терпение.") = 2 SECONDS,
		CALL_GLOB(credits_mapper),
		CALL_GLOB(credits_headdev),
		PLAY_SOUND(sound('sound/effects/footstep/plating5.ogg', volume = 70)),
		MOVE_ACTOR(actor("Ная - Сцена 5"), WEST) = 1 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/plating3.ogg', volume = 70)),
		MOVE_ACTOR(actor("Ная - Сцена 5"), WEST) = 1 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/plating4.ogg', volume = 70)),
		MOVE_ACTOR(actor("Ная - Сцена 5"), WEST) = 1 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/plating1.ogg', volume = 70)),
		MOVE_ACTOR(actor("Ная - Сцена 5"), WEST) = 1 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		MOVE_CAMERA(0, 0, 10 SECONDS, SINE_EASING|EASE_IN),
		TALK_ACTOR(actor("Мясо - Сцена 5"), "Уж точно не мне."),
		PLAY_SOUND(sound('sound/effects/footstep/plating5.ogg', volume = 70)),
		MOVE_ACTOR(actor("Ная - Сцена 5"), WEST) = 1 SECONDS,
		TURN_ACTOR(actor("Ная - Сцена 5"), SOUTH) = 2 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/plating2.ogg', volume = 70)),
		MOVE_ACTOR(actor("Ная - Сцена 5"), SOUTH) = 1 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/plating4.ogg', volume = 70)),
		MOVE_ACTOR(actor("Ная - Сцена 5"), SOUTH) = 1 SECONDS,
		TURN_ACTOR(actor("Ная - Сцена 5"), WEST) = 2 SECONDS,
		TALK_ACTOR(actor("Ная - Сцена 5"), "!наклонилась к роботу, водя взглядом по его монитору.") = 2 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		TALK_ACTOR(actor("Ная - Сцена 5"), "Не думал податься в секс-индустрию?") = 6 SECONDS,
		TALK_ACTOR(actor("Ная - Сцена 5"), "Уверена, твоим отросткам там бы точно нашли применение."),
		SHIFT_ACTOR(actor("Ная - Сцена 5"), -22, -12, 0.5 SECONDS, SINE_EASING|EASE_IN, null) = 1 SECONDS,
		TALK_ACTOR(actor("Мясо - Сцена 5"), "!угрюмо перекрестил корни.") = 4 SECONDS,
		TALK_ACTOR(actor("Мясо - Сцена 5"), "Сосредоточься.") = 4 SECONDS,
		TALK_ACTOR(actor("Ная - Сцена 5"), "На чём? Металлоломе?") = 2 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		TALK_ACTOR(actor("Ная - Сцена 5"), "!начинает раскачивать того."),
		CHANGE_ACTOR_MATRIX(actor("Свифт - Сцена 5"), -5, 0.2 SECONDS, BOUNCE_EASING|EASE_IN, null) = 0.2 SECONDS,
		CHANGE_ACTOR_MATRIX(actor("Свифт - Сцена 5"), 0, 0.2 SECONDS, BOUNCE_EASING|EASE_OUT, null) = 0.2 SECONDS,
		CHANGE_ACTOR_MATRIX(actor("Свифт - Сцена 5"), -5, 0.2 SECONDS, BOUNCE_EASING|EASE_IN, null) = 0.2 SECONDS,
		CHANGE_ACTOR_MATRIX(actor("Свифт - Сцена 5"), 0, 0.2 SECONDS, BOUNCE_EASING|EASE_OUT, null) = 0.2 SECONDS,
		CHANGE_ACTOR_MATRIX(actor("Свифт - Сцена 5"), -5, 0.2 SECONDS, BOUNCE_EASING|EASE_IN, null) = 0.2 SECONDS,
		CHANGE_ACTOR_MATRIX(actor("Свифт - Сцена 5"), 0, 0.2 SECONDS, BOUNCE_EASING|EASE_OUT, null) = 0.2 SECONDS,
		TALK_ACTOR(actor("Ная - Сцена 5"), "Дровосек, ты ещё с нами?"),
		CHANGE_ACTOR_MATRIX(actor("Свифт - Сцена 5"), -5, 0.2 SECONDS, BOUNCE_EASING|EASE_IN, null) = 0.2 SECONDS,
		CHANGE_ACTOR_MATRIX(actor("Свифт - Сцена 5"), 0, 0.2 SECONDS, BOUNCE_EASING|EASE_OUT, null) = 0.2 SECONDS,
		CHANGE_ACTOR_MATRIX(actor("Свифт - Сцена 5"), -15, 2 SECONDS, BOUNCE_EASING|EASE_IN, null) = 2 SECONDS,
		CHANGE_ACTOR_MATRIX(actor("Свифт - Сцена 5"), 0, 0.5 SECONDS, BOUNCE_EASING|EASE_OUT, null) = 0.5 SECONDS,
		TALK_ACTOR(actor("Ная - Сцена 5"), "Зараза!"),
		TURN_ACTOR(actor("Ная - Сцена 5"), SOUTH),
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		PLAY_SOUND(sound('sound/effects/footstep/plating3.ogg', volume = 70)),
		MOVE_ACTOR(actor("Ная - Сцена 5"), NORTH),
		SHIFT_ACTOR(actor("Ная - Сцена 5"), 0, 0, 0.2 SECONDS, SINE_EASING|EASE_IN, null),
		CHANGE_ACTOR_MATRIX(actor("Свифт - Сцена 5"), 90, 1 SECONDS, BACK_EASING|EASE_OUT, ANIMATION_PARALLEL),
		SHIFT_ACTOR(actor("Свифт - Сцена 5"), 0, -15, 1 SECONDS, SINE_EASING|EASE_OUT, ANIMATION_PARALLEL) = 0.5 SECONDS,
		CHANGE_ACTOR_VISUALS(actor("Свифт - Сцена 5"), "S.W.I.F.T 4") = 2 SECONDS,
		SHIFT_ACTOR(actor("Мясо - Сцена 5"), 0, 0, 0.2 SECONDS, SINE_EASING|EASE_IN, null),
		TALK_ACTOR(actor("Мясо - Сцена 5"), "Замечательно.") = 4 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/plating5.ogg', volume = 70)),
		MOVE_ACTOR(actor("Мясо - Сцена 5"), SOUTH),
		TURN_ACTOR(actor("Мясо - Сцена 5"), WEST),
		CALL_GLOB(credits_writers),
		TALK_ACTOR(actor("Мясо - Сцена 5"), "Значит, капитана у нас нет.") = 2 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		TURN_ACTOR(actor("Ная - Сцена 5"), EAST),
		PLAY_SOUND(sound('sound/effects/footstep/plating3.ogg', volume = 70)),
		MOVE_ACTOR(actor("Мясо - Сцена 5"), WEST) = 2 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/plating2.ogg', volume = 70)),
		MOVE_ACTOR(actor("Мясо - Сцена 5"), WEST) = 2 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/plating5.ogg', volume = 70)),
		MOVE_ACTOR(actor("Мясо - Сцена 5"), WEST) = 2 SECONDS,
		TURN_ACTOR(actor("Мясо - Сцена 5"), SOUTH),
		PLAY_SOUND(sound('sound/effects/footstep/plating4.ogg', volume = 70)),
		MOVE_ACTOR(actor("Ная - Сцена 5"), SOUTH),
		TURN_ACTOR(actor("Ная - Сцена 5"), SOUTH),
		TALK_ACTOR(actor("Мясо - Сцена 5"), "Что теперь?") = 4 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		TALK_ACTOR(actor("Ная - Сцена 5"), "Так далеко я не думала.") = 4 SECONDS,
		TALK_ACTOR(actor("Ная - Сцена 5"), "Ещё и Фиддлер молчит... Как назло.") = 2 SECONDS,
		TALK_ACTOR(actor("Ная - Сцена 5"), "!тяжело вздыхает.") = 4 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		TALK_ACTOR(actor("Ная - Сцена 5"), "!глядит на позитроника.") = 6 SECONDS,
		TURN_ACTOR(actor("Ная - Сцена 5"), WEST),
		TALK_ACTOR(actor("Ная - Сцена 5"), "!бросает взгляд на кресло.") = 6 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		PLAY_SOUND(sound('sound/effects/footstep/plating5.ogg', volume = 70)),
		MOVE_ACTOR(actor("Ная - Сцена 5"), SOUTH),
		TALK_ACTOR(actor("Ная - Сцена 5"), "... В подобной ситуации остаётся только смеяться.") = 6 SECONDS,
		TURN_ACTOR(actor("Ная - Сцена 5"), WEST),
		TALK_ACTOR(actor("Ная - Сцена 5"), "Судьба - непостоянная сука, а?") = 2 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/plating3.ogg', volume = 70)),
		MOVE_ACTOR(actor("Ная - Сцена 5"), WEST),
		CHANGE_ACTOR_VISUALS(actor("Ная - Сцена 5"), "Naia 3"),
		SHIFT_ACTOR(actor("Ная - Сцена 5"), -15, 0, 0.2 SECONDS, SINE_EASING|EASE_IN, null) = 2 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		TALK_ACTOR(actor("Ная - Сцена 5"), "!тарабанит по клавишам.") = 2 SECONDS,
		TALK_ACTOR(actor("Ная - Сцена 5"), "Мостик инженерному отсеку! Кто-нибудь меня слышит?") = 6 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/s2ep1sc6)
	)

/datum/modular_cutscene/s2ep1sc6/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 5"),
		ADD_SCREEN(/cinema_borders),
		PLAY_SOUND(sound("sparks", volume = 50)),
		TALK_ACTOR(actor("Пауль - Сцена 6"), "!сплёвывает кровь."),
		TALK_ACTOR(actor("Ная - Сцена 6"), "Ампер! Каз!") = 4 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		TALK_ACTOR(actor("Ная - Сцена 6"), "Да не молчите же вы как убитые!") = 2 SECONDS,
		TALK_ACTOR(actor("Абигейл - Сцена 6"), "!подносит трубку интеркома к мужчине.") = 1 SECONDS,
		TALK_ACTOR(actor("Пауль - Сцена 6"), "!хрипит.") = 2 SECONDS,
		TALK_ACTOR(actor("Пауль - Сцена 6"), "... Да здесь я!") = 2 SECONDS,
		TALK_ACTOR(actor("Пауль - Сцена 6"), "!кашляет."),
		TALK_ACTOR(actor("Пауль - Сцена 6"), "Ч-чего разорались-то?") = 4 SECONDS,
		PLAY_SOUND(sound("sparks", volume = 50)),
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		START_CUTSCENE(/datum/modular_cutscene/s2ep1sc7)
	)

/datum/modular_cutscene/s2ep1sc7/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 4"),
		ADD_SCREEN(/cinema_borders),
		TALK_ACTOR(actor("Ная - Сцена 5"), "Слава Богам. В живых остался хотя бы один человек, на которого можно положиться.") = 6 SECONDS,
		TALK_ACTOR(actor("Мясо - Сцена 5"), "Я бы закатил глаза, если бы мог."),
		TURN_ACTOR(actor("Мясо - Сцена 5"), WEST) = 2 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		TALK_ACTOR(actor("Ная - Сцена 5"), "У меня здесь корабль как Титаник трещит, а Свифт решил прикурнуть.") = 8 SECONDS,
		TALK_ACTOR(actor("Ная - Сцена 5"), "Я пытаюсь достучаться до любой помощи, которую только смогу найти, но коммуникациям на третьей видно досталось не меньше.") = 8 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		TALK_ACTOR(actor("Ная - Сцена 5"), "Тебе есть чем меня порадовать?") = 4 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/s2ep1sc8)
	)

/datum/modular_cutscene/s2ep1sc8/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 5"),
		ADD_SCREEN(/cinema_borders),
		TALK_ACTOR(actor("Пауль - Сцена 6"), "Ну-...") = 1 SECONDS,
		TALK_ACTOR(actor("Пауль - Сцена 6"), "!сжался от боли."),
		SHIFT_ACTOR(actor("Абигейл - Сцена 6"), 4, 3, 0.5 SECONDS, SINE_EASING|EASE_IN, null) = 0.3 SECONDS,
		CHANGE_ACTOR_VISUALS(actor("Абигейл - Сцена 6"), "Abigail 3"),
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		CALL_GLOB(credits_investors),
		TALK_ACTOR(actor("Пауль - Сцена 6"), "... Т-теперь мы точно знаем, что на инструктаже нам напиздели.") = 4 SECONDS,
		TALK_ACTOR(actor("Пауль - Сцена 6"), "Сесть Факел всё-таки очень даже может.") = 4 SECONDS,
		PLAY_SOUND(sound("sparks", volume = 50)),
		TALK_ACTOR(actor("Ная - Сцена 6"), "То что ты ещё находишь силы отшучиваться - внушает надежду.") = 6 SECONDS,
		TALK_ACTOR(actor("Пауль - Сцена 6"), "Эт мы даже до панчлайна не дошли.") = 2 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		TALK_ACTOR(actor("Пауль - Сцена 6"), "!болезненно улыбается.") = 4 SECONDS,
		TALK_ACTOR(actor("Пауль - Сцена 6"), "От корабля остались одни рожки. Даже б-без ножек.") = 6 SECONDS,
		TALK_ACTOR(actor("Пауль - Сцена 6"), "Вся... биомасса, которая держала к-корабль вместе - выгорела при входе в атмосферу планеты.") = 4 SECONDS,
		TALK_ACTOR(actor("Пауль - Сцена 6"), "Кормы В ПРИНЦИПЕ больше нет.") = 4 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		TALK_ACTOR(actor("Пауль - Сцена 6"), "А эта т-трёхсталетная радиоактивная куча, доверху набитая микрочастицами суперматерии и урана...") = 8 SECONDS,
		TALK_ACTOR(actor("Пауль - Сцена 6"), "... теперь медленно спускается пеплом н-нам на головы.") = 4 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		START_CUTSCENE(/datum/modular_cutscene/s2ep1sc9)
	)

/datum/modular_cutscene/s2ep1sc9/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 4"),
		ADD_SCREEN(/cinema_borders),
		TALK_ACTOR(actor("Пауль - Сцена 9"), "Не поторопимся, и...") = 2 SECONDS,
		TALK_ACTOR(actor("Ная - Сцена 5"), "Сколько у нас времени?") = 4 SECONDS,
		TALK_ACTOR(actor("Пауль - Сцена 9"), "...") = 4 SECONDS,
		TALK_ACTOR(actor("Пауль - Сцена 9"), "Явно меньше, чем хотелось бы.") = 4 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		START_CUTSCENE(/datum/modular_cutscene/s2ep1sc10)
	)

/datum/modular_cutscene/s2ep1sc10/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 5"),
		ADD_SCREEN(/cinema_borders),
		CHANGE_ACTOR_VISUALS(actor("Пауль - Сцена 6"), "Paul 3"),
		TALK_ACTOR(actor("Пауль - Сцена 6"), "Час... от силы. М-может даже меньше.") = 4 SECONDS,
		TALK_ACTOR(actor("Ная - Сцена 6"), "... Бывало и хуже.") = 2 SECONDS,
		PLAY_SOUND(sound("sparks", volume = 50)),
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		TALK_ACTOR(actor("Ная - Сцена 6"), "!вздыхает.") = 4 SECONDS,
		TALK_ACTOR(actor("Ная - Сцена 6"), "Направляю к вам Реймонда и Фройза. Держитесь, скоро-...") = 2 SECONDS,
		CHANGE_ACTOR_VISUALS(actor("Пауль - Сцена 6"), "Paul 2"),
		TALK_ACTOR(actor("Пауль - Сцена 6"), "!сплёвывает кровь."),
		PLAY_SOUND(sound("sparks", volume = 50)),
		SHIFT_ACTOR(actor("Пауль - Сцена 6"), -15, 0, 0.2 SECONDS, SINE_EASING|EASE_OUT, null) = 0.2 SECONDS,
		SHIFT_ACTOR(actor("Пауль - Сцена 6"), -14, 0, 0.2 SECONDS, SINE_EASING|EASE_IN, null) = 0.2 SECONDS,
		SHIFT_ACTOR(actor("Пауль - Сцена 6"), -15, 0, 0.2 SECONDS, SINE_EASING|EASE_OUT, null) = 0.2 SECONDS,
		SHIFT_ACTOR(actor("Пауль - Сцена 6"), -14, 0, 0.2 SECONDS, SINE_EASING|EASE_IN, null) = 0.2 SECONDS,
		TALK_ACTOR(actor("Пауль - Сцена 6"), "... в этом нет необходимости.") = 2 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/s2ep1sc11)
	)

/datum/modular_cutscene/s2ep1sc11/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 4"),
		ADD_SCREEN(/cinema_borders),
		TALK_ACTOR(actor("Ная - Сцена 5"), "Что ты-...") = 2 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		TALK_ACTOR(actor("Пауль - Сцена 9"), "Осколок, к-кажется, мне позвоночник перебил. Абигейл сказала, что там... нарост какой-то.") = 8 SECONDS,
		TALK_ACTOR(actor("Пауль - Сцена 9"), "Ф-фиолетовый.") = 4 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		TALK_ACTOR(actor("Пауль - Сцена 9"), "Не могу пошевелить ничем кроме головы... Вот уже как минут двадцать точно.") = 6 SECONDS,
		TALK_ACTOR(actor("Пауль - Сцена 9"), "!едва слышно смеётся.") = 2 SECONDS,
		TALK_ACTOR(actor("Пауль - Сцена 9"), "Чувство такое, будто бы это то самое место.") = 4 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		TALK_ACTOR(actor("Ная - Сцена 5"), "Не говори глупостей. Наверняка в медблоке найдётся, чем тебе помочь.") = 6 SECONDS,
		TALK_ACTOR(actor("Пауль - Сцена 9"), "Поберегите силы, ш-шеф.") = 2 SECONDS,
		TALK_ACTOR(actor("Ная - Сцена 5"), "Но!...") = 6 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		CHANGE_ACTOR_VISUALS(actor("Ная - Сцена 5"), "Naia 4"),
		TALK_ACTOR(actor("Ная - Сцена 5"), "!оскалившись, ударяет по консоли.") = 6 SECONDS,
		TALK_ACTOR(actor("Ная - Сцена 5"), "Без твоей помощи, мы-...") = 2 SECONDS,
		TALK_ACTOR(actor("Пауль - Сцена 9"), "К-Каз сделает всё за меня.") = 4 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		TALK_ACTOR(actor("Пауль - Сцена 9"), "Я покажу и расскажу ей в-всё, что нужно.") = 8 SECONDS,
		TALK_ACTOR(actor("Пауль - Сцена 9"), "!вздыхает.") = 2 SECONDS,
		TALK_ACTOR(actor("Пауль - Сцена 9"), "... знаю, жизнь сосёт.") = 4 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		TALK_ACTOR(actor("Пауль - Сцена 9"), "Вообще, я ещё столько х-хотел бы сделать...") = 6 SECONDS,
		TALK_ACTOR(actor("Пауль - Сцена 9"), "Д-да и Мири запланировала не меньше...") = 4 SECONDS,
		TALK_ACTOR(actor("Пауль - Сцена 9"), "... Б-бедная кошка тяжелее всего переживёт этот переезд.") = 6 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		TALK_ACTOR(actor("Ная - Сцена 5"), "... Пауль.") = 6 SECONDS,
		TALK_ACTOR(actor("Пауль - Сцена 9"), "Столько пережито... И ради чего?") = 6 SECONDS,
		ADD_SCREEN(/blackout/animated_better/nofade),
		CALL_GLOB(amper_lastwords) = 2 SECONDS,
		REMOVE_SCREEN(/blackout/animated_better/nofade, 0) = 1 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		TALK_ACTOR(actor("Пауль - Сцена 9"), "...") = 4 SECONDS,
		TALK_ACTOR(actor("Пауль - Сцена 9"), "... Шеф.") = 6 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		TALK_ACTOR(actor("Пауль - Сцена 9"), "К-когда всё это наконец закончится...") = 6 SECONDS,
		TALK_ACTOR(actor("Пауль - Сцена 9"), "Не забудьте о нас. Всех.") = 2 SECONDS,
		CHANGE_ACTOR_VISUALS(actor("Пауль - Сцена 6"), "Paul 4"),
		CHANGE_ACTOR_VISUALS(actor("Абигейл - Сцена 6"), "Abigail 4"),
		START_CUTSCENE(/datum/modular_cutscene/s2ep1sc12)
	)

/datum/modular_cutscene/s2ep1sc12/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 5"),
		PLAY_SOUND(sound("sparks", volume = 50)),
		ADD_SCREEN(/cinema_borders) = 2 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		CHANGE_ACTOR_VISUALS(actor("Абигейл - Сцена 6"), "Abigail 2"),
		PLAY_SOUND(sound('sound/mecha/lowpowernano.ogg', volume = 10)),
		SHIFT_ACTOR(actor("Абигейл - Сцена 6"), 15, 3, 1 SECONDS, SINE_EASING|EASE_IN, null) = 4 SECONDS,
		SHIFT_ACTOR(actor("Абигейл - Сцена 6"), 0, 0, 0, null, null),
		PLAY_SOUND(sound('sound/effects/footstep/plating3.ogg', volume = 70)),
		MOVE_ACTOR(actor("Абигейл - Сцена 6"), EAST),
		CHANGE_ACTOR_VISUALS(actor("Абигейл - Сцена 6"), "Abigail 5"),
		TALK_ACTOR(actor("Абигейл - Сцена 6"), "!утирает нос.") = 1 SECONDS,
		CHANGE_ACTOR_VISUALS(actor("Абигейл - Сцена 6"), "Abigail 2") = 2 SECONDS,
		ADD_SCREEN(/blackout/animated_better/nofade),
		MOVE_ACTOR(actor("Мясо - Сцена 5"), WEST),
		MOVE_ACTOR(actor("Мясо - Сцена 5"), WEST),
		CALL_GLOB(naia_promise) = 8 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		START_CUTSCENE(/datum/modular_cutscene/s2ep1sc13)
	)

/datum/modular_cutscene/s2ep1sc13/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 4"),
		ADD_SCREEN(/cinema_borders),
		PLAY_SOUND(sound('sound/effects/footstep/plating5.ogg', volume = 70)),
		MOVE_ACTOR(actor("Мясо - Сцена 5"), WEST) = 2 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		TALK_ACTOR(actor("Мясо - Сцена 5"), "Я ожидал от него подобного. Весьма самоотверженный конец.") = 4 SECONDS,
		TALK_ACTOR(actor("Мясо - Сцена 5"), "Как ни прискорбно, но для остальных он действительно был бы лишь обузой.") = 6 SECONDS,
		SHIFT_ACTOR(actor("Ная - Сцена 5"), -5, 0, 0.5 SECONDS, SINE_EASING|EASE_IN, null),
		CHANGE_ACTOR_VISUALS(actor("Ная - Сцена 5"), "Naia 5") = 2 SECONDS,
		TURN_ACTOR(actor("Ная - Сцена 5"), NORTH),
		TALK_ACTOR(actor("Ная - Сцена 5"), "Ты действительно так думаешь?") = 4 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		TALK_ACTOR(actor("Мясо - Сцена 5"), "Не нужно строить из себя святую.") = 6 SECONDS,
		TALK_ACTOR(actor("Мясо - Сцена 5"), "Ты и сама была готова пожертвовать многим и многим-и ради достижения собственных целей, разве я не прав?") = 10 SECONDS,
		TALK_ACTOR(actor("Ная - Сцена 5"), "!морщит нос") = 2 SECONDS,
		TALK_ACTOR(actor("Ная - Сцена 5"), "Тц-...") = 1 SECONDS,
		TURN_ACTOR(actor("Ная - Сцена 5"), EAST),
		SHIFT_ACTOR(actor("Ная - Сцена 5"), 0, 0, 0.2 SECONDS, SINE_EASING|EASE_IN, null) = 0.5 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/plating3.ogg', volume = 70)),
		MOVE_ACTOR(actor("Ная - Сцена 5"), EAST) = 3 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		TURN_ACTOR(actor("Ная - Сцена 5"), NORTH),
		PLAY_SOUND(sound('sound/effects/footstep/plating4.ogg', volume = 70)),
		MOVE_ACTOR(actor("Ная - Сцена 5"), NORTH) = 3 SECONDS,
		TURN_ACTOR(actor("Мясо - Сцена 5"), EAST),
		TALK_ACTOR(actor("Ная - Сцена 5"), "... Но это не значит, что до этих жизней мне не было никакого дела.") = 4 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/plating5.ogg', volume = 70)),
		MOVE_ACTOR(actor("Ная - Сцена 5"), NORTH) = 3 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/plating1.ogg', volume = 70)),
		MOVE_ACTOR(actor("Ная - Сцена 5"), NORTH) = 3 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		TURN_ACTOR(actor("Ная - Сцена 5"), EAST),
		TURN_ACTOR(actor("Мясо - Сцена 5"), EAST),
		TALK_ACTOR(actor("Мясо - Сцена 5"), "Куда ты идёшь?") = 4 SECONDS,
		TALK_ACTOR(actor("Ная - Сцена 5"), "Постараюсь сделать всё для того, чтобы оправдать чужую смерть. Как обычно.") = 6 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		PLAY_SOUND(sound('sound/effects/footstep/plating3.ogg', volume = 70)),
		MOVE_ACTOR(actor("Ная - Сцена 5"), EAST) = 2 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/plating4.ogg', volume = 70)),
		MOVE_ACTOR(actor("Ная - Сцена 5"), EAST) = 2 SECONDS,
		TALK_ACTOR(actor("Ная - Сцена 5"), "Оставляю мостик на тебе."),
		PLAY_SOUND(sound('sound/effects/footstep/plating5.ogg', volume = 70)),
		MOVE_ACTOR(actor("Ная - Сцена 5"), EAST) = 2 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/plating1.ogg', volume = 70)),
		MOVE_ACTOR(actor("Ная - Сцена 5"), EAST) = 2 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/plating4.ogg', volume = 70)),
		MOVE_ACTOR(actor("Ная - Сцена 5"), EAST) = 2 SECONDS,
		TALK_ACTOR(actor("Ная - Сцена 5"), "Придумай, что делать с железным!"),
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		TURN_ACTOR(actor("Ная - Сцена 5"), NORTH),
		ADD_SCREEN(/blackout/animated_better),
		MOVE_ACTOR(actor("Ная - Сцена 5"), NORTH) = 2 SECONDS,
		TURN_ACTOR(actor("Ная - Сцена 5"), EAST),
		START_CUTSCENE(/datum/modular_cutscene/s2ep1sc14)
	)
