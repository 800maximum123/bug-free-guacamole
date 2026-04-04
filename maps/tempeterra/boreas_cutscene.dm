/obj/effect/cutscene_camera/s2op1/sc1
	camera_id = "Опенинг 1 - Кадр 1"

/proc/startingbluejump()
	for(var/obj/overmap/visitable/ship/sfv_tempeterra/tempeterra)
		new /obj/ftl (get_turf(tempeterra))
		animate(tempeterra, time = 0.5 SECONDS)
		animate(alpha = 0, time = 0.5 SECONDS)
		tempeterra.halted = TRUE
		tempeterra.invisibility = INVISIBILITY_OBSERVER
		tempeterra.alpha = 255
	SetUniversalState(/datum/universal_state/bluespace_jump, arguments=list(GLOB.using_map.station_levels))

/proc/endbluejump()
	for(var/obj/overmap/visitable/ship/sfv_tempeterra/tempeterra)
		tempeterra.alpha = 0
		tempeterra.invisibility = initial(tempeterra)
		new /obj/ftl (get_turf(tempeterra))
		animate(tempeterra, time = 0.5 SECONDS)
		animate(alpha = 255, time = 0.5 SECONDS)
		tempeterra.halted = FALSE
	SetUniversalState(/datum/universal_state/bluespace_jump, arguments=list(GLOB.using_map.station_levels))



/proc/boreas_cutscene()
	var/list/map_turfs = block(locate(2,2,GLOB.using_map.overmap_z),locate(GLOB.using_map.overmap_size-2,GLOB.using_map.overmap_size-2,GLOB.using_map.overmap_z))
	for(var/turf/T in map_turfs)
		for(var/obj/npc_ship_spawner/npc in T)
			if(npc)
				npc.appear()

	start_cutscene(/datum/modular_cutscene/boreas_cutscene)

/datum/modular_cutscene/boreas_cutscene/setup_actions(...)
	actions = list(
		TP_CAMERA("Опенинг 1 - Кадр 1"),
		// PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/again.ogg', volume = 50)), // Fuck!!
		// CALL_GLOB()
		// CALL_GLOB()
		MOVE_CAMERA(160, -4, 40 SECONDS, null),
		MOVE_CAMERA(160, 5, 40 SECONDS, null),
		// CALL_GLOB(greetingfromboreas)
		MOVE_CAMERA(384, 0, 100 SECONDS, CUBIC_EASING|EASE_OUT),
		MOVE_CAMERA(64, 0, 50 SECONDS, null),
		// CALL_GLOB() = 5 SECONDS
		MOVE_CAMERA(464, 0, 20 SECONDS, null),
		// CALL_GLOB() = 5 SECONDS
		MOVE_CAMERA(848, 0, 100 SECONDS, CUBIC_EASING|EASE_IN),
		RETURN_VIEWERS
	)
/*
shitcoded_screenalert()*/

/proc/greetingfromboreas()
	shitcoded_screenalert("Капитан Первого Ранга Богачев", "ТРАНСЛЯЦИЯ С КОРАБЛЯ ПРОТИВНИКА", "Всем позывным - выйти на связь и отчитаться в установленном порядке! Командование над отражением атакой переходит ко мне!", , "overwatch_red")
	sleep(150 SECONDS)
	shitcoded_screenalert("Капитан Первого Ранга Богачев", "ТРАНСЛЯЦИЯ С КОРАБЛЯ ПРОТИВНИКА", "")


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
