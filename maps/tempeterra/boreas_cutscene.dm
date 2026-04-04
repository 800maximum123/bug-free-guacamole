/obj/effect/cutscene_camera/s2op1/sc1
	camera_id = "Опенинг 1 - Кадр 1"

/proc/startingbluejump
	SetUniversalState(/datum/universal_state/bluespace_jump, arguments=list(GLOB.using_map.station_levels))

/proc/fds2op1()
	var/message_ambush = "<span style='color:red; font-size: 20px;'>На сенсорах происходит странная активность...</span>"
	for(var/mob/M in GLOB.player_list)
		to_chat(M, message_ambush)

	sleep(50)

	everyone_look_at_overmap()

	sleep(120)

	//  --- Истребители
	// Пил1
	// - Знаешь. У нашего Старшины родился Сын, слышал.
	// Пил2
	//




	//  --- Нападение
	// Сенсориум
	// - Центральный!
	// КОМГАРН
	// - Что за? Гарнизон в ружье! Личному составу приготовится к отражению атаки!
	// Первая, вторая авиагруппа - выдвигайтесь на закрепленные за вами позиции.


	// --- Сенсориум Станции
	// Центральный! Странный всплеск Тэла-излучения. Падение нормали!
	// --- КОМГАРН
	// Да неужели... Наконец-то.
	// ---АДМ
	// Всем позывным - выйти на связь и отчитаться в установленном порядке! Командование над отражением атакой переходит ко мне!
	// Суда с боевой эффективностью ниже шестьдесят процентов, перегруппироваться у Гейтвея! Нам не нужны лишние потери.
	//
	// А касательно вас, товарищи гости...
	// ...
	// ...
	// Добро пожаловать в Ад.

	// 	// --- Если ХП 50 и меньше
	// - Тврщ Капитан первого ранга! Мы здесь больше не протянем! Нужно отступать!
	// - Еще не вечер, Лейтенант!
	//  Жизни наших товарищей напрямую зависят от нас
	// - Плевать! Здесь мы или они!! Рулевой! Поворот в точку Мандевиль! Мы уход-
	// *звук выстрела комиссара из Вахи под звук кобуры*
	// - Недорабатываете с личным составом, Замполит! Не-до-ра-ба-ты-вае-те!
	// Еще не вечер, Товарищи! Продолжать бой!

	// --- Корбек уничтожен, Темпетерра удирает в блюспейс
	// - Прекратить преследование! Пусть уходит, черт бы их побрал...
	// Адъютант! Отчеты о потере личного состава гарнизона и эскадры мне на стол...
	// Я хочу запомнить их имена.
	//

	var/list/map_turfs = block(locate(2,2,GLOB.using_map.overmap_z),locate(GLOB.using_map.overmap_size-2,GLOB.using_map.overmap_size-2,GLOB.using_map.overmap_z))
	for(var/turf/T in map_turfs)
		for(var/obj/npc_ship_spawner/npc in T)
			if(npc)
				npc.appear()

	sleep(90)
	start_cutscene(/datum/modular_cutscene/fds2op1sc1)

/datum/modular_cutscene/fds2op1sc1/setup_actions(...)
	actions = list(
		TP_CAMERA("Опенинг 1 - Кадр 1"),
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/again.ogg', volume = 50)), // Fuck!!
		CALL_GLOB()
		CALL_GLOB()
		MOVE_CAMERA(160, -4, 4 SECONDS, null),
		MOVE_CAMERA(160, 5, 4 SECONDS),
		CALL_GLOB()
		MOVE_CAMERA(12*32, 0, 10 SECONDS, CUBIC_EASING|EASE_OUT)
		MOVE_CAMERA(2*32, 0, 5 SECONDS)
		CALL_GLOB() = 5 SECONDS
		MOVE_CAMERA(14*32+16, 0, 20 SECONDS)
		CALL_GLOB() = 5 SECONDS
		MOVE_CAMERA(26*32, 0, 10 SECONDS, CUBIC_EASING|EASE_IN)
	)
