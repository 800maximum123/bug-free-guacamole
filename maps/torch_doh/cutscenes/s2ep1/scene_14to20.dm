//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// АССЕТЫ, НЕОБХОДИМЫЕ СЦЕНЕ //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/obj/effect/cutscene_camera/s2ep1sc6
	camera_id = "Сцена 6"

/obj/effect/cutscene_camera/s2ep1sc7
	camera_id = "Сцена 7"

/obj/effect/cutscene_camera/s2ep1sc8
	camera_id = "Сцена 8"

/obj/effect/cutscene_camera/s2ep1sc9
	camera_id = "Сцена 9"

/obj/effect/cutscene_camera/s2ep1sc10
	camera_id = "Сцена 10"

/obj/effect/cutscene_camera/s2ep1sc11
	camera_id = "Сцена 11"

/proc/swift_name()
	var/novel_message = "СВИФТ:"
	var/colored = "#129c00"

	var/obj/screen/novel_message/start_credits/big_nofade/visuals = new /obj/screen/novel_message/start_credits/big_nofade()
	visuals.maptext_y = -10
	visuals.maptext_x = -40
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 22 SECONDS)

/proc/swift_status()
	var/novel_message = "ПРИШЁЛ В СЕБЯ"
	var/colored = "#eba100"

	var/obj/screen/novel_message/start_credits/big_nofade/visuals = new /obj/screen/novel_message/start_credits/big_nofade()
	visuals.maptext_y = -10
	visuals.maptext_x = -30
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 22 SECONDS)

/proc/wilhelm_name()
	var/novel_message = "ВИЛЬГЕЛЬМ:"
	var/colored = "#129c00"

	var/obj/screen/novel_message/start_credits/big_nofade/visuals = new /obj/screen/novel_message/start_credits/big_nofade()
	visuals.maptext_y = -20
	visuals.maptext_x = -40
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 20 SECONDS)

/proc/wilhelm_status()
	var/novel_message = "СТАБИЛИЗИРОВАН"
	var/colored = "#eba100"

	var/obj/screen/novel_message/start_credits/big_nofade/visuals = new /obj/screen/novel_message/start_credits/big_nofade()
	visuals.maptext_y = -20
	visuals.maptext_x = -30
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 20 SECONDS)

/proc/fiddler_name()
	var/novel_message = "ДЖОЗЕФ:"
	var/colored = "#129c00"

	var/obj/screen/novel_message/start_credits/big_nofade/visuals = new /obj/screen/novel_message/start_credits/big_nofade()
	visuals.maptext_y = -30
	visuals.maptext_x = -40
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 18 SECONDS)

/proc/fiddler_status()
	var/novel_message = "МЕСТОПОЛОЖЕНИЕ НЕИЗВЕСТНО"
	var/colored = "#b60000"

	var/obj/screen/novel_message/start_credits/big_nofade/visuals = new /obj/screen/novel_message/start_credits/big_nofade()
	visuals.maptext_y = -30
	visuals.maptext_x = -30
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 18 SECONDS)

/proc/kyler_name()
	var/novel_message = "КАЙЛЕР:"
	var/colored = "#129c00"

	var/obj/screen/novel_message/start_credits/big_nofade/visuals = new /obj/screen/novel_message/start_credits/big_nofade()
	visuals.maptext_y = -40
	visuals.maptext_x = -40
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 16 SECONDS)

/proc/kyler_status()
	var/novel_message = "МЕСТОПОЛОЖЕНИЕ НЕИЗВЕСТНО"
	var/colored = "#b60000"

	var/obj/screen/novel_message/start_credits/big_nofade/visuals = new /obj/screen/novel_message/start_credits/big_nofade()
	visuals.maptext_y = -40
	visuals.maptext_x = -30
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 16 SECONDS)

/proc/abi_name()
	var/novel_message = "АБИГЕЙЛ:"
	var/colored = "#129c00"

	var/obj/screen/novel_message/start_credits/big_nofade/visuals = new /obj/screen/novel_message/start_credits/big_nofade()
	visuals.maptext_y = -50
	visuals.maptext_x = -40
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 14 SECONDS)

/proc/abi_status()
	var/novel_message = "МЕСТОПОЛОЖЕНИЕ НЕИЗВЕСТНО"
	var/colored = "#b60000"

	var/obj/screen/novel_message/start_credits/big_nofade/visuals = new /obj/screen/novel_message/start_credits/big_nofade()
	visuals.maptext_y = -50
	visuals.maptext_x = -30
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 14 SECONDS)

/proc/fuel_status()
	var/novel_message = "ПОВРЕЖДЕНИЕ ТОПЛИВНОЙ СИСТЕМЫ"
	var/colored = "#b60000"

	var/obj/screen/novel_message/start_credits/big_nofade/visuals = new /obj/screen/novel_message/start_credits/big_nofade()
	visuals.maptext_y = -60
	visuals.maptext_x = -40
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 12 SECONDS)

/proc/fire_detected()
	var/novel_message = "ВОЗГОРАНИЕ:"
	var/colored = "#129c00"

	var/obj/screen/novel_message/start_credits/big_nofade/visuals = new /obj/screen/novel_message/start_credits/big_nofade()
	visuals.maptext_y = -70
	visuals.maptext_x = -40
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 10 SECONDS)

/proc/fire_where()
	var/novel_message = "ПАЛУБЫ 3 - 2 - 1"
	var/colored = "#eba100"

	var/obj/screen/novel_message/start_credits/big_nofade/visuals = new /obj/screen/novel_message/start_credits/big_nofade()
	visuals.maptext_y = -70
	visuals.maptext_x = -30
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 10 SECONDS)

/proc/radiation_incoming()
	var/novel_message = "РИСК РАДИАЦИОННОГО ЗАРАЖЕНИЯ"
	var/colored = "#eba100"

	var/obj/screen/novel_message/start_credits/big_nofade/visuals = new /obj/screen/novel_message/start_credits/big_nofade()
	visuals.maptext_y = -80
	visuals.maptext_x = -40
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 8 SECONDS)

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// СКРИПТ СЦЕНЫ //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/datum/modular_cutscene/s2ep1sc14/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 6"),
		ADD_SCREEN(/cinema_borders),
		MOVE_CAMERA(9, 0, 0, null),
		ADD_SCREEN(/blackout/animated_better/nofade) = 1 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		REMOVE_SCREEN(/blackout/animated_better/nofade, 3 SECONDS) = 1 SECONDS,
		MOVE_CAMERA(0, 0, 5 SECONDS, SINE_EASING|EASE_IN),
		MOVE_ACTOR(actor("Ветерок - Сцена 14"), WEST),
		MOVE_ACTOR(actor("Фройз - Сцена 14"), WEST) = 0.3 SECONDS,
		MOVE_ACTOR(actor("Ветерок - Сцена 14"), WEST),
		MOVE_ACTOR(actor("Фройз - Сцена 14"), WEST) = 0.3 SECONDS,
		MOVE_ACTOR(actor("Ветерок - Сцена 14"), WEST),
		MOVE_ACTOR(actor("Фройз - Сцена 14"), WEST) = 0.3 SECONDS,
		MOVE_ACTOR(actor("Ветерок - Сцена 14"), WEST),
		MOVE_ACTOR(actor("Фройз - Сцена 14"), WEST) = 0.3 SECONDS,
		MOVE_ACTOR(actor("Ветерок - Сцена 14"), WEST),
		MOVE_ACTOR(actor("Фройз - Сцена 14"), WEST) = 0.3 SECONDS,
		MOVE_ACTOR(actor("Ветерок - Сцена 14"), WEST),
		MOVE_ACTOR(actor("Фройз - Сцена 14"), WEST) = 0.3 SECONDS,
		MOVE_ACTOR(actor("Ветерок - Сцена 14"), WEST),
		MOVE_ACTOR(actor("Фройз - Сцена 14"), WEST) = 0.3 SECONDS,
		MOVE_ACTOR(actor("Ветерок - Сцена 14"), WEST),
		MOVE_ACTOR(actor("Фройз - Сцена 14"), WEST) = 0.3 SECONDS,
		MOVE_ACTOR(actor("Ветерок - Сцена 14"), WEST),
		TALK_ACTOR(actor("Фройз - Сцена 14"), "!хлопает по крышке меха."),
		TALK_ACTOR(actor("Фройз - Сцена 14"), "Притормози слегка!"),
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		MOVE_ACTOR(actor("Фройз - Сцена 14"), WEST) = 0.3 SECONDS,
		MOVE_ACTOR(actor("Ветерок - Сцена 14"), WEST),
		MOVE_ACTOR(actor("Фройз - Сцена 14"), WEST) = 0.3 SECONDS,
		MOVE_ACTOR(actor("Ветерок - Сцена 14"), WEST),
		MOVE_ACTOR(actor("Фройз - Сцена 14"), WEST) = 0.3 SECONDS,
		MOVE_ACTOR(actor("Ветерок - Сцена 14"), WEST),
		MOVE_ACTOR(actor("Фройз - Сцена 14"), WEST) = 0.3 SECONDS,
		MOVE_ACTOR(actor("Ветерок - Сцена 14"), WEST),
		MOVE_ACTOR(actor("Фройз - Сцена 14"), WEST) = 0.3 SECONDS,
		MOVE_ACTOR(actor("Ветерок - Сцена 14"), WEST),
		MOVE_ACTOR(actor("Фройз - Сцена 14"), WEST) = 0.3 SECONDS,
		MOVE_ACTOR(actor("Ветерок - Сцена 14"), WEST),
		MOVE_ACTOR(actor("Фройз - Сцена 14"), WEST) = 0.3 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		MOVE_ACTOR(actor("Ветерок - Сцена 14"), WEST),
		MOVE_ACTOR(actor("Фройз - Сцена 14"), WEST) = 0.3 SECONDS,
		SHIFT_ACTOR(actor("Ветерок - Сцена 14"), -16, 0, 0.4 SECONDS, SINE_EASING|EASE_OUT, null),
		SHIFT_ACTOR(actor("Фройз - Сцена 14"), 0, 10, 0.4 SECONDS, SINE_EASING|EASE_OUT, null) = 0.4 SECONDS,
		SHIFT_ACTOR(actor("Ветерок - Сцена 14"), -8, 0, 0.1 SECONDS, SINE_EASING|EASE_IN, null),
		SHIFT_ACTOR(actor("Фройз - Сцена 14"), 8, 10, 0.1 SECONDS, SINE_EASING|EASE_IN, null) = 2 SECONDS,
		CHANGE_ACTOR_VISUALS(actor("Фройз - Сцена 14"), "Alexander 3"),
		TALK_ACTOR(actor("Фройз - Сцена 14"), "!достаёт КПК.") = 2 SECONDS,
		TALK_ACTOR(actor("Ветерок - Сцена 14"), "В чё-ё-ё-ё-ём де-ело-о?") = 4 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		TALK_ACTOR(actor("Фройз - Сцена 14"), "Сообщение от Мяса.") = 2 SECONDS,
		SHIFT_ACTOR(actor("Фройз - Сцена 14"), 0, 0, 0.4 SECONDS, SINE_EASING|EASE_OUT, null) = 0.2 SECONDS,
		TURN_ACTOR(actor("Фройз - Сцена 14"), EAST),
		CHANGE_ACTOR_VISUALS(actor("Фройз - Сцена 14"), "Alexander 4") = 2 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/plating5.ogg', volume = 70)),
		MOVE_ACTOR(actor("Фройз - Сцена 14"), EAST) = 2 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/plating2.ogg', volume = 70)),
		MOVE_ACTOR(actor("Фройз - Сцена 14"), EAST) = 2 SECONDS,
		TALK_ACTOR(actor("Фройз - Сцена 14"), "Они планируют вывезти всех уцелевших на переоборудованной канонерке.") = 8 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		TALK_ACTOR(actor("Фройз - Сцена 14"), "Оставшихся механиков собирают неподалёку... Даже знаю, как нам туда попасть.") = 6 SECONDS,
		CHANGE_ACTOR_VISUALS(actor("Фройз - Сцена 14"), "Alexander 5") = 1 SECONDS,
		TURN_ACTOR(actor("Фройз - Сцена 14"), SOUTH),
		TALK_ACTOR(actor("Фройз - Сцена 14"), "Ветерок!") = 2 SECONDS,
		TALK_ACTOR(actor("Фройз - Сцена 14"), "Слегка изменим маршрут! Твоя помощь там тоже не помешает.") = 4 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		TURN_ACTOR(actor("Фройз - Сцена 14"), WEST),
		PLAY_SOUND(sound('sound/effects/footstep/plating3.ogg', volume = 70)),
		MOVE_ACTOR(actor("Фройз - Сцена 14"), WEST),
		TALK_ACTOR(actor("Фройз - Сцена 14"), "!убирает устройство.") = 1 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/plating1.ogg', volume = 70)),
		MOVE_ACTOR(actor("Фройз - Сцена 14"), WEST) = 1 SECONDS,
		MOVE_CAMERA(0, 2.5, 3 SECONDS, SINE_EASING|EASE_IN),
		TURN_ACTOR(actor("Фройз - Сцена 14"), NORTH),
		SHIFT_ACTOR(actor("Фройз - Сцена 14"), 0, 10, 1 SECONDS, SINE_EASING|EASE_OUT, null) = 3 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/s2ep1sc15)
	)

/datum/modular_cutscene/s2ep1sc15/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 7"),
		ADD_SCREEN(/cinema_borders),
		MOVE_CAMERA(0, 5, 2 SECONDS, SINE_EASING|EASE_IN) = 2 SECONDS,
		TALK_ACTOR(actor("Ашира - Сцена 15"), "Ног почти не чувствутю...") = 2 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		TALK_ACTOR(actor("Ашира - Сцена 15"), "!жмурится.") = 4 SECONDS,
		CHANGE_ACTOR_VISUALS(actor("Ашира - Сцена 15"), "Ashira 3"),
		TALK_ACTOR(actor("Ашира - Сцена 15"), "Наверрняка в-все уже в точке сбора...") = 4 SECONDS,
		TALK_ACTOR(actor("Ашира - Сцена 15"), "М-может, если поторрропимся... ещё с-сможем успеть.") = 2 SECONDS,
		CHANGE_ACTOR_VISUALS(actor("Ашира - Сцена 15"), "Ashira 4"),
		CHANGE_ACTOR_MATRIX(actor("Ашира - Сцена 15"), 30, 1 SECONDS, BACK_EASING|EASE_IN, ANIMATION_PARALLEL),
		SHIFT_ACTOR(actor("Ашира - Сцена 15"), -20, 8, 1 SECONDS, SINE_EASING|EASE_IN, ANIMATION_PARALLEL) = 1 SECONDS,
		SHIFT_ACTOR(actor("Ашира - Сцена 15"), 0, 8, 0, null, null) = 0.2 SECONDS,
		CHANGE_ACTOR_MATRIX(actor("Ашира - Сцена 15"), 0, 0.5 SECONDS, BACK_EASING|EASE_OUT, null),
		PLAY_SOUND(sound('sound/effects/footstep/water1.ogg', volume = 70)),
		MOVE_ACTOR(actor("Ашира - Сцена 15"), WEST) = 1 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		CHANGE_ACTOR_VISUALS(actor("Ашира - Сцена 15"), "Ashira 5"),
		SHIFT_ACTOR(actor("Ашира - Сцена 15"), -8, 8, 0.5 SECONDS, SINE_EASING|EASE_OUT, null) = 1 SECONDS,
		TALK_ACTOR(actor("Ашира - Сцена 15"), "В-вставай! Я тебя нести не-") = 2 SECONDS,
		TALK_ACTOR(actor("Мириам - Сцена 15"), "... В этом нет никакого смысла.") = 2 SECONDS,
		TALK_ACTOR(actor("Ашира - Сцена 15"), "!повела ухом.") = 2 SECONDS,
		CHANGE_ACTOR_VISUALS(actor("Ашира - Сцена 15"), "Ashira 6"),
		TALK_ACTOR(actor("Ашира - Сцена 15"), "Ррано ещё лапы опускать!") = 4 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		TALK_ACTOR(actor("Ашира - Сцена 15"), "Не ты ли прро благословение духов трепалась?!") = 6 SECONDS,
		TALK_ACTOR(actor("Ашира - Сцена 15"), "То что мы всё ещё живы-...") = 6 SECONDS,
		CHANGE_ACTOR_VISUALS(actor("Мириам - Сцена 15"), "Miri'am 3"),
		TALK_ACTOR(actor("Мириам - Сцена 15"), "!поднимает одну лапу вверх.") = 2 SECONDS,
		TALK_ACTOR(actor("Мириам - Сцена 15"), "Видишь эти фиолетовые полосы?") = 4 SECONDS,
		TALK_ACTOR(actor("Мириам - Сцена 15"), "Это последствия рранения одним из кристаллов.") = 8 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		CHANGE_ACTOR_VISUALS(actor("Мириам - Сцена 15"), "Miri'am 2"),
		TALK_ACTOR(actor("Мириам - Сцена 15"), "Его незначительные харррактеристики с лихвой компенсирруются начинкой.") = 8 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		TALK_ACTOR(actor("Мириам - Сцена 15"), "Одного маленького осколка уже будет вполне достаточно для того, чтобы ты начинала писать завещание.") = 10 SECONDS,
		TALK_ACTOR(actor("Ашира - Сцена 15"), "Откуда-...") = 2 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		TALK_ACTOR(actor("Мириам - Сцена 15"), "Слышала от Ворронцова. Ему не повезло застать... перррвые месяцы войны.") = 8 SECONDS,
		CHANGE_ACTOR_VISUALS(actor("Ашира - Сцена 15"), "Ashira 5"),
		TALK_ACTOR(actor("Мириам - Сцена 15"), "... коваррный внеземной яд, жизни с которым ты скорее пррредпочтёшь пулю.") = 6 SECONDS,
		CHANGE_ACTOR_VISUALS(actor("Ашира - Сцена 15"), "Ashira 7"),
		SHIFT_ACTOR(actor("Ашира - Сцена 15"), -13, 8, 0.5 SECONDS, SINE_EASING|EASE_OUT, null),
		TALK_ACTOR(actor("Мириам - Сцена 15"), "Именно так его описывали солдаты и вррачи...") = 4 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		TALK_ACTOR(actor("Мириам - Сцена 15"), "!закрывает лицо лапами."),
		CHANGE_ACTOR_VISUALS(actor("Мириам - Сцена 15"), "Miri'am 4") = 2 SECONDS,
		TALK_ACTOR(actor("Мириам - Сцена 15"), "И я кррайне сомневаюсь, что духи попрут прротив статистики...") = 4 SECONDS,
		TALK_ACTOR(actor("Мириам - Сцена 15"), "!скалится.") = 4 SECONDS,
		TALK_ACTOR(actor("Мириам - Сцена 15"), "!слегка дрожит."),
		TALK_ACTOR(actor("Мириам - Сцена 15"), "Если б-бы я только возрразила против твоего участия в бою-...") = 2 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		TALK_ACTOR(actor("Ашира - Сцена 15"), "... Я всё рравно бы не послушалась.") = 1 SECONDS,
		TURN_ACTOR(actor("Ашира - Сцена 15"), EAST) = 0.5 SECONDS,
		CHANGE_ACTOR_VISUALS(actor("Ашира - Сцена 15"), "Ashira 8"),
		SHIFT_ACTOR(actor("Ашира - Сцена 15"), -13, -10, 5 SECONDS, SINE_EASING|EASE_IN, null) = 2 SECONDS,
		CHANGE_ACTOR_VISUALS(actor("Ашира - Сцена 15"), "Ashira 9"),
		TALK_ACTOR(actor("Мириам - Сцена 15"), "!едва слышно всхлипывает.") = 1 SECONDS,
		TALK_ACTOR(actor("Ашира - Сцена 15"), "Не нужно винить себя за то, на ч-что ты изначально не могла повлиять...") = 6 SECONDS,
		TALK_ACTOR(actor("Ашира - Сцена 15"), "К тому же...") = 4 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		TALK_ACTOR(actor("Ашира - Сцена 15"), "Что бы я без тебя д-делала?") = 6 SECONDS,
		TALK_ACTOR(actor("Ашира - Сцена 15"), "Доррогих людей у меня больше и не осталось...") = 8 SECONDS,
		TALK_ACTOR(actor("Ашира - Сцена 15"), "!вздыхает.") = 2 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		TALK_ACTOR(actor("Ашира - Сцена 15"), "Ты п-позволила мне сблизиться с тобой несмотря на пррошлые боли. Впустила меня в свою душу.") = 6 SECONDS,
		TALK_ACTOR(actor("Ашира - Сцена 15"), "Может... Я и н-не очень рразбираюсь в ваших обычаях, но даже так могу сказать, что это дорогого стоит-...") = 4 SECONDS,
		TALK_ACTOR(actor("Мириам - Сцена 15"), "!шмыгает носом.") = 4 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		TALK_ACTOR(actor("Ашира - Сцена 15"), "Наврряд ли, даже если бы я и выжила-... Мне довелось бы в-встрретить кого-то врроде тебя ещё раз.") = 10 SECONDS,
		CHANGE_ACTOR_VISUALS(actor("Ашира - Сцена 15"), "Ashira 10"),
		TALK_ACTOR(actor("Ашира - Сцена 15"), "...") = 2 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		TALK_ACTOR(actor("Ашира - Сцена 15"), "Получается, я победила?") = 4 SECONDS,
		TALK_ACTOR(actor("Мириам - Сцена 15"), "... Ч-что?") = 2 SECONDS,
		TALK_ACTOR(actor("Ашира - Сцена 15"), "Б-Боги нам, никакие, в итоге не помогли...") = 4 SECONDS,
		TALK_ACTOR(actor("Ашира - Сцена 15"), "Следственно... Их нет?") = 2 SECONDS,
		PLAY_SOUND(sound('mods/emote_panel/sound/laugh_female_2.ogg', volume = 20)),
		TALK_ACTOR(actor("Мириам - Сцена 15"), "!громко рассмеялась.") = 4 SECONDS,
		CHANGE_ACTOR_VISUALS(actor("Ашира - Сцена 15"), "Ashira 9"),
		TALK_ACTOR(actor("Ашира - Сцена 15"), "Ч-что смешного?!") = 2 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		CHANGE_ACTOR_VISUALS(actor("Ашира - Сцена 15"), "Ashira 8"),
		SHIFT_ACTOR(actor("Ашира - Сцена 15"), 0, 0, 0.5 SECONDS, SINE_EASING|EASE_IN, null),
		TALK_ACTOR(actor("Ашира - Сцена 15"), "Я же серьёзно-!...") = 2 SECONDS,
		TALK_ACTOR(actor("Мириам - Сцена 15"), "... Аширра.") = 4 SECONDS,
		CHANGE_ACTOR_VISUALS(actor("Мириам - Сцена 15"), "Miri'am 2"),
		ADD_SCREEN(/blackout/animated_better),
		TALK_ACTOR(actor("Мириам - Сцена 15"), "К-какая же ты всё-таки...") = 4 SECONDS,
		TALK_ACTOR(actor("Мириам - Сцена 15"), "... д-дуррочка...") = 1 SECONDS,
		TALK_ACTOR(actor("Ашира - Сцена 15"), "!с трудом улыбнулась.") = 1 SECONDS,
		PLAY_SOUND(sound('mods/emote_panel/sound/giggle_female_1.ogg', volume = 20)) = 3 SECONDS,
		MOVE_CAMERA(0, 0, 0, null) = 1 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/s2ep1sc16)
	)

/datum/modular_cutscene/s2ep1sc16/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 8"),
		ADD_SCREEN(/cinema_borders),
		ADD_SCREEN(/blackout/animated_better/nofade) = 1 SECONDS,
		REMOVE_SCREEN(/blackout/animated_better/nofade, 3 SECONDS) = 1 SECONDS,
		PLAY_SOUND(sound('sound/items/welderactivate.ogg', volume = 20)),
		TALK_ACTOR(actor("Ная - Сцена 16"), "Теперь, пожалуйста, можно повторить для людей?") = 2 SECONDS,
		TALK_ACTOR(actor("Оливия - Сцена 16"), "!тяжело вздыхает.") = 2 SECONDS,
		PLAY_SOUND(sound('sound/items/Welder2.ogg', volume = 20)) = 1 SECONDS,
		PLAY_SOUND(sound('sound/items/welderdeactivate.ogg', volume = 20)),
		TALK_ACTOR(actor("Оливия - Сцена 16"), "Радиоактивные отходы - это МЕНЬШАЯ из наших проблем.") = 4 SECONDS,
		PLAY_SOUND(sound('sound/items/rped.ogg', volume = 20)),
		TALK_ACTOR(actor("Оливия - Сцена 16"), "Куда больше меня волнует состояние БСД. Мы правда просто оставим рабочий генератор чёрных дыр ЗДЕСЬ?") = 8 SECONDS,
		TALK_ACTOR(actor("Оливия - Сцена 16"), "Насколько же оптимистом нужно быть, чтобы считать что с ним ничего не произойдёт?") = 4 SECONDS,
		PLAY_SOUND(sound('sound/items/welderactivate.ogg', volume = 20)),
		TALK_ACTOR(actor("Оливия - Сцена 16"), "В лучшем случае - он просто выйдет из под контроля. В худшем - его приберёт к рукам кто-то ещё!") = 6 SECONDS,
		PLAY_SOUND(sound('sound/items/Welder.ogg', volume = 20)),
		TALK_ACTOR(actor("Оливия - Сцена 16"), "Где, вообще, гарантия того, что мы найдём на этой планете замену в случае чего?") = 4 SECONDS,
		PLAY_SOUND(sound('sound/items/welderdeactivate.ogg', volume = 20)),
		TALK_ACTOR(actor("Максим - Сцена 16"), "!что-то бубнит."),
		TALK_ACTOR(actor("Ная - Сцена 16"), "В карман его положить предлагаешь?") = 2 SECONDS,
		TALK_ACTOR(actor("Оливия - Сцена 16"), "Нет, просто-...") = 2 SECONDS,
		TURN_ACTOR(actor("Ная - Сцена 16"), EAST),
		TALK_ACTOR(actor("Максим - Сцена 16"), "!кивает сам себе."),
		CHANGE_ACTOR_VISUALS(actor("Максим - Сцена 16"), "Maxim 5"),
		TALK_ACTOR(actor("Ная - Сцена 16"), "Я не стану рисковать нашими жизнями только ради того, чтобы тебе спалось спокойнее.") = 8 SECONDS,
		TURN_ACTOR(actor("Максим - Сцена 16"), WEST),
		TALK_ACTOR(actor("Оливия - Сцена 16"), "Да мы даже знать-то не знаем, КАКОЙ будет его дестабилизация! Может, и рисковать будет-!") = 6 SECONDS,
		TALK_ACTOR(actor("Максим - Сцена 16"), "Вы закончили?") = 4 SECONDS,
		TALK_ACTOR(actor("Максим - Сцена 16"), "Прекрасно. А теперь, Оливия, притащи мне ключ на шестнадцать.") = 6 SECONDS,
		MOVE_ACTOR(actor("Оливия - Сцена 16"), EAST) = 1 SECONDS,
		TALK_ACTOR(actor("Оливия - Сцена 16"), "... Но!...") = 1 SECONDS,
		MOVE_ACTOR(actor("Оливия - Сцена 16"), EAST) = 1 SECONDS,
		TALK_ACTOR(actor("Максим - Сцена 16"), "И без ноканья.") = 4 SECONDS,
		TURN_ACTOR(actor("Максим - Сцена 16"), NORTH),
		CHANGE_ACTOR_VISUALS(actor("Максим - Сцена 16"), "Maxim 6"),
		TALK_ACTOR(actor("Максим - Сцена 16"), "Если этот кусок мусора не поплывёт - мы в любом случае покойники.") = 4 SECONDS,
		TURN_ACTOR(actor("Ная - Сцена 16"), SOUTH),
		TALK_ACTOR(actor("Ная - Сцена 16"), "!вздыхает.") = 4 SECONDS,
		MOVE_ACTOR(actor("Ная - Сцена 16"), SOUTH) = 1 SECONDS,
		TURN_ACTOR(actor("Ная - Сцена 16"), EAST),
		TURN_ACTOR(actor("Оливия - Сцена 16"), SOUTH),
		CHANGE_ACTOR_VISUALS(actor("Ная - Сцена 16"), "Naia 7"),
		CHANGE_ACTOR_VISUALS(actor("Оливия - Сцена 16"), "Olivia 3"),
		SHIFT_ACTOR(actor("Ная - Сцена 16"), 8, 0, 0.5 SECONDS, SINE_EASING|EASE_IN, null) = 1 SECONDS,
		TALK_ACTOR(actor("Максим - Сцена 16"), "И где вообще Ветра носит?! Я сварщик, а не физик-ядерщик!"),
		PLAY_SOUND(sound('sound/items/scrape_clunk.ogg', volume = 20)),
		TALK_ACTOR(actor("Ная - Сцена 16"), "Давай просто отложим этот разговор?") = 4 SECONDS,
		TALK_ACTOR(actor("Ная - Сцена 16"), "Хорошо?") = 4 SECONDS,
		TALK_ACTOR(actor("Максим - Сцена 16"), "... и вообще шаттлы никогда не строил."),
		TURN_ACTOR(actor("Оливия - Сцена 16"), EAST),
		CHANGE_ACTOR_VISUALS(actor("Оливия - Сцена 16"), "Olivia 4"),
		TALK_ACTOR(actor("Оливия - Сцена 16"), "!закрывает лицо рукой.") = 2 SECONDS,
		TALK_ACTOR(actor("Оливия - Сцена 16"), "Нам это точно аукнется..."),
		MOVE_CAMERA(4, 0, 3 SECONDS, SINE_EASING|EASE_IN) = 3 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/s2ep1sc17)
	)

/datum/modular_cutscene/s2ep1sc17/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 9"),
		ADD_SCREEN(/cinema_borders),
		MOVE_CAMERA(5, 0, 2 SECONDS, SINE_EASING|EASE_IN) = 2 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		TALK_ACTOR(actor("Амелия - Сцена 17"), "Н-нет..."),
		TALK_ACTOR(actor("Лира - Сцена 17"), "Поразительно...") = 2 SECONDS,
		MOVE_ACTOR(actor("Амелия - Сцена 17"), WEST),
		PLAY_SOUND(sound('sound/effects/footstep/plating5.ogg', volume = 70)),
		TALK_ACTOR(actor("Амелия - Сцена 17"), "Этого не может-...") = 2 SECONDS,
		SHIFT_ACTOR(actor("Луни - Сцена 17"), 0, 6, 0.5 SECONDS, SINE_EASING|EASE_IN, null),
		TURN_ACTOR(actor("Луни - Сцена 17"), NORTH),
		PLAY_SOUND(sound('sound/effects/footstep/plating3.ogg', volume = 70)),
		MOVE_ACTOR(actor("Злата - Сцена 17"), WEST),
		MOVE_ACTOR(actor("Амелия - Сцена 17"), WEST) = 2 SECONDS,
		TALK_ACTOR(actor("Лира - Сцена 17"), "Стараний двух мета-пользователей оказалось недостаточно, чтобы централизовать очаг заражения...") = 2 SECONDS,
		TALK_ACTOR(actor("Гора - Сцена 17"), "Можем ли мы попробовать что-то ещё?") = 4 SECONDS,
		MOVE_ACTOR(actor("Луни - Сцена 17"), NORTH),
		CHANGE_ACTOR_VISUALS(actor("Злата - Сцена 17"), "Zlata 5"),
		SHIFT_ACTOR(actor("Злата - Сцена 17"), 0, 17, 0.5 SECONDS, SINE_EASING|EASE_IN, null),
		TALK_ACTOR(actor("Злата - Сцена 17"), "Амелия-!"),
		PLAY_SOUND(sound('sound/effects/footstep/plating1.ogg', volume = 70)),
		MOVE_ACTOR(actor("Амелия - Сцена 17"), WEST) = 0.5 SECONDS,
		MOVE_ACTOR(actor("Луни - Сцена 17"), NORTH),
		TURN_ACTOR(actor("Луни - Сцена 17"), EAST),
		CHANGE_ACTOR_VISUALS(actor("Злата - Сцена 17"), "Zlata 7"),
		SHIFT_ACTOR(actor("Злата - Сцена 17"), 10, 17, 0.5 SECONDS, SINE_EASING|EASE_IN, null),
		PLAY_SOUND(sound('sound/effects/footstep/plating4.ogg', volume = 70)),
		MOVE_ACTOR(actor("Амелия - Сцена 17"), WEST) = 0.5 SECONDS,
		TALK_ACTOR(actor("Лира - Сцена 17"), "Можно было бы ампутировать ногу, но я сомневаюсь-..."),
		TALK_ACTOR(actor("Амелия - Сцена 17"), "ПЕРСИВАЛЬ!"),
		TALK_ACTOR(actor("Луни - Сцена 17"), "!перехватывает девушку."),
		TURN_ACTOR(actor("Реймонд - Сцена 17"), SOUTH),
		CHANGE_ACTOR_VISUALS(actor("Амелия - Сцена 17"), "Amelia 4"),
		CHANGE_ACTOR_VISUALS(actor("Лира - Сцена 17"), "Lira 4"),
		CHANGE_ACTOR_VISUALS(actor("Гора - Сцена 17"), "Gora 5"),
		SHIFT_ACTOR(actor("Амелия - Сцена 17"), -25, 0, 0.5 SECONDS, SINE_EASING|EASE_IN, null) = 2 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		TALK_ACTOR(actor("Амелия - Сцена 17"), "!шмыгает носом."),
		TURN_ACTOR(actor("Гора - Сцена 17"), SOUTH),
		TALK_ACTOR(actor("Амелия - Сцена 17"), "П-пусти меня к нему!") = 4 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/plating2.ogg', volume = 70)),
		MOVE_ACTOR(actor("Гора - Сцена 17"), SOUTH),
		TALK_ACTOR(actor("Луни - Сцена 17"), "Не могу. Поверь, если я пропущу тебя - будет только больнее.") = 6 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		CHANGE_ACTOR_VISUALS(actor("Амелия - Сцена 17"), "Amelia"),
		TALK_ACTOR(actor("Амелия - Сцена 17"), "!утыкается парню в плечо, перейдя на взрыд.") = 1 SECONDS,
		TALK_ACTOR(actor("Луни - Сцена 17"), "... Он не хотел бы чтобы ты видела его таким.") = 2 SECONDS,
		ADD_SCREEN(/blackout/animated_better),
		MOVE_CAMERA(0, 0, 0, null) = 3 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/s2ep1sc18)
	)

/datum/modular_cutscene/s2ep1sc18/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 10"),
		ADD_SCREEN(/cinema_borders),
		ADD_SCREEN(/blackout/animated_better/nofade) = 1 SECONDS,
		REMOVE_SCREEN(/blackout/animated_better/nofade, 3 SECONDS) = 1 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		CHANGE_ACTOR_VISUALS(actor("Джозеф - Сцена 18"), "Fiddler 3") = 4 SECONDS,
		CHANGE_ACTOR_VISUALS(actor("Джозеф - Сцена 18"), "Fiddler"),
		TURN_ACTOR(actor("Джозеф - Сцена 18"), SOUTH) = 2 SECONDS,
		CHANGE_ACTOR_MATRIX(actor("Джозеф - Сцена 18"), 0, 5 SECONDS, BACK_EASING|EASE_OUT, null) = 5 SECONDS,
		TALK_ACTOR(actor("Джозеф - Сцена 18"), "!щёлкает затвор на шее."),
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		PLAY_SOUND(sound('sound/mecha/lowpowernano.ogg', volume = 10)),
		TURN_ACTOR(actor("Джозеф - Сцена 18"), NORTH) = 1 SECONDS,
		CHANGE_ACTOR_VISUALS(actor("Джозеф - Сцена 18"), "Fiddler 4") = 3 SECONDS,
		TURN_ACTOR(actor("Джозеф - Сцена 18"), EAST) = 1 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/plating5.ogg', volume = 70)),
		MOVE_ACTOR(actor("Джозеф - Сцена 18"), EAST),
		TALK_ACTOR(actor("Джозеф - Сцена 18"), "Шо%ф--л1д?") = 3 SECONDS,
		TURN_ACTOR(actor("Джозеф - Сцена 18"), SOUTH) = 1 SECONDS,
		TURN_ACTOR(actor("Джозеф - Сцена 18"), WEST),
		PLAY_SOUND(sound('sound/effects/footstep/plating3.ogg', volume = 70)),
		MOVE_ACTOR(actor("Джозеф - Сцена 18"), EAST) = 3 SECONDS,
		TALK_ACTOR(actor("Джозеф - Сцена 18"), "М4йор!") = 4 SECONDS,
		TALK_ACTOR(actor("Джозеф - Сцена 18"), "!стучит по шлему.") = 2 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		CHANGE_ACTOR_VISUALS(actor("Джозеф - Сцена 18"), "Fiddler 5"),
		SHIFT_ACTOR(actor("Джозеф - Сцена 18"), 5, 0, 0.5 SECONDS, SINE_EASING|EASE_IN, null) = 1 SECONDS,
		TURN_ACTOR(actor("Джозеф - Сцена 18"), NORTH) = 2 SECONDS,
		TALK_ACTOR(actor("Джозеф - Сцена 18"), "... Его трость."),
		PLAY_SOUND(sound('sound/effects/footstep/plating4.ogg', volume = 70)),
		MOVE_ACTOR(actor("Джозеф - Сцена 18"), NORTH) = 4 SECONDS,
		SHIFT_ACTOR(actor("Джозеф - Сцена 18"), 0, 0, 0.5 SECONDS, SINE_EASING|EASE_IN, null),
		TURN_ACTOR(actor("Джозеф - Сцена 18"), EAST),
		TALK_ACTOR(actor("Джозеф - Сцена 18"), "Кайлер, где ты чёрт возьми?...") = 6 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/shorter_siren.ogg', volume = 5)),
		MOVE_CAMERA(0, 6, 5 SECONDS, SINE_EASING|EASE_IN) = 3 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/s2ep1sc19)
	)

/datum/modular_cutscene/s2ep1sc19/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 11"),
		ADD_SCREEN(/cinema_borders),
		MOVE_CAMERA(0, 0, 0, null),
		MOVE_CAMERA(0, 3, 2 SECONDS, SINE_EASING|EASE_IN) = 2 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/asteroid3.ogg', volume = 70)),
		MOVE_ACTOR(actor("Неизвестный 2 - Сцена 19"), SOUTH) = 2 SECONDS,

		TALK_ACTOR(actor("Неизвестный 3 - Сцена 19"), "!запихивает самокрутку в щель шлема."),

		PLAY_SOUND(sound('sound/effects/footstep/asteroid1.ogg', volume = 70)),
		MOVE_ACTOR(actor("Неизвестный 2 - Сцена 19"), SOUTH),
		TURN_ACTOR(actor("Неизвестный 2 - Сцена 19"), WEST) = 2 SECONDS,
		TALK_ACTOR(actor("Неизвестный 2 - Сцена 19"), "!забрасывает ружьё на плечо."),
		PLAY_SOUND(sound('sound/effects/footstep/asteroid4.ogg', volume = 70)),
		MOVE_ACTOR(actor("Неизвестный 2 - Сцена 19"), SOUTH),
		TURN_ACTOR(actor("Неизвестный 2 - Сцена 19"), SOUTH) = 1 SECONDS,

		TALK_ACTOR(actor("Неизвестный 4 - Сцена 19"), "... Ты серьёзно?"),

		TALK_ACTOR(actor("Неизвестный 2 - Сцена 19"), "Капитан?") = 2 SECONDS,

		CHANGE_ACTOR_VISUALS(actor("Рифлер - Сцена 19"), "Leader 3"),
		TALK_ACTOR(actor("Рифлер - Сцена 19"), "Перекур окончен.") = 4 SECONDS,
		TURN_ACTOR(actor("Рифлер - Сцена 19"), NORTH),

		TURN_ACTOR(actor("Неизвестный 2 - Сцена 19"), WEST),

		PLAY_SOUND(sound('sound/effects/footstep/asteroid2.ogg', volume = 70)),
		MOVE_ACTOR(actor("Рифлер - Сцена 19"), NORTH) = 1 SECONDS,
		TALK_ACTOR(actor("Рифлер - Сцена 19"), "Выдвигаемся немедленно."),

		ADD_SCREEN(/blackout/animated_better),

		PLAY_SOUND(sound('sound/effects/footstep/asteroid5.ogg', volume = 70)),
		MOVE_ACTOR(actor("Рифлер - Сцена 19"), NORTH) = 1 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/asteroid1.ogg', volume = 70)),
		MOVE_ACTOR(actor("Рифлер - Сцена 19"), NORTH) = 5 SECONDS,
		MOVE_CAMERA(0, 0, 0, null) = 3 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/s2ep1sc20)
	)

/datum/modular_cutscene/s2ep1sc20/setup_actions(...)
	actions = list(
		ADD_SCREEN(/blackout/animated_better/nofade) = 2 SECONDS,
		CALL_GLOB(swift_name),
		CALL_GLOB(swift_status) = 2 SECONDS,
		CALL_GLOB(wilhelm_name),
		CALL_GLOB(wilhelm_status) = 2 SECONDS,
		CALL_GLOB(fiddler_name),
		CALL_GLOB(fiddler_status) = 2 SECONDS,
		CALL_GLOB(kyler_name),
		CALL_GLOB(kyler_status) = 2 SECONDS,
		CALL_GLOB(abi_name),
		CALL_GLOB(abi_status) = 2 SECONDS,
		CALL_GLOB(fuel_status) = 2 SECONDS,
		CALL_GLOB(fire_detected),
		CALL_GLOB(fire_where) = 2 SECONDS,
		CALL_GLOB(radiation_incoming) = 2 SECONDS,
		REMOVE_SCREEN(/blackout/animated_better/nofade, 3 SECONDS) = 10 SECONDS,
		RETURN_VIEWERS
	)
