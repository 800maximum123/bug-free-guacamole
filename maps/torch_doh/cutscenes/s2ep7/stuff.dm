/obj/effect/cutscene_camera/s2ep7sc1
	camera_id = "Сцена 7-1 - Кадр 1"

/obj/effect/cutscene_camera/s2ep7sc2
	camera_id = "Сцена 7-1 - Кадр 2"

/obj/effect/cutscene_camera/s2ep7sc3
	camera_id = "Сцена 7-1 - Кадр 3"

/obj/effect/cutscene_camera/s2ep7sc4
	camera_id = "Сцена 7-1 - Кадр 4"

/obj/effect/cutscene_camera/s2ep7sc5
	camera_id = "Сцена 7-1 - Кадр 5"

/obj/effect/cutscene_camera/s2ep7sc6
	camera_id = "Сцена 7-1 - Кадр 6"

/obj/effect/cutscene_camera/s2ep7sc7
	camera_id = "Сцена 7-1 - Кадр 7"

/proc/fds2ep7_cutscene1()
	start_cutscene(/datum/modular_cutscene/s2ep7sc1)

/proc/s2ep7sc1_screentext()
	var/message = {"ВРЕМЯ: <span style="color: red;">|-06:15:33-|</span>"}

	var/obj/screen/player_message/maintext = new /obj/screen/player_message()
	maintext.plane = HUD_PLANE
	maintext.layer = HUD_ABOVE_HUD_LAYER
	maintext.maptext_x = 0
	maintext.maptext_y = -210

	for(var/client/M in GLOB.clients)
		M.screen += maintext
		maintext.set_text(message, COLOR_WHITE)

	spawn(4 SECONDS)
		for(var/client/M in GLOB.clients)
			for(var/obj/screen/messages in M.screen)
				if(istype(messages, /obj/screen/player_message))
					M.screen -= messages
					qdel(messages)

/datum/modular_cutscene/s2ep7sc1/setup_actions(...)
	actions = list(
		ADD_SCREEN(/blackout/animated_better) = 5 SECONDS,
		TP_CAMERA("Сцена 7-1 - Кадр 1"),
		ADD_SCREEN(/blackout),
		CALL_GLOB(s2ep7sc1_screentext) = 6 SECONDS,
		ADD_SCREEN(/cinema_borders),
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/IBO - Under the Pressure.mp3', volume = 50), "Under the Pressure (IBO)") = 4 SECONDS,
		REMOVE_SCREEN(/blackout/animated_better, 0),
		REMOVE_SCREEN(/blackout, 1 SECONDS) = 1 SECONDS,
		TALK_ACTOR(actor("Фиддлер - 7-1-1"), "Вот и началось.") = 4 SECONDS,
		TALK_ACTOR(actor("Фиддлер - 7-1-1"), "Наступают с трёх направлений, как мы и предполагали.") = 2 SECONDS,
		TURN_ACTOR(actor("Фиддлер - 7-1-1"), WEST) = 2 SECONDS,
		MOVE_CAMERA(-2, 0, 4 SECONDS, SINE_EASING|EASE_OUT),
		MOVE_ACTOR(actor("Фиддлер - 7-1-1"), WEST) = 2 SECONDS,
		TALK_ACTOR(actor("Фиддлер - 7-1-1"), "Думал, что у меня всё же не найдётся слов на +этот+ случай..."),
		MOVE_ACTOR(actor("Фиддлер - 7-1-1"), WEST) = 2 SECONDS,
		MOVE_CAMERA(-2, 3, 4 SECONDS, SINE_EASING|EASE_OUT),
		TURN_ACTOR(actor("Фиддлер - 7-1-1"), NORTH) = 2 SECONDS,
		TALK_ACTOR(actor("Фиддлер - 7-1-1"), "!складывает руки за спиной.") = 2 SECONDS,
		TURN_ACTOR(actor("Мясо - 7-1-1"), WEST),
		TALK_ACTOR(actor("Фиддлер - 7-1-1"), "Господа!") = 2 SECONDS,
		TURN_ACTOR(actor("Адриано - 7-1-1"), SOUTH) = 2 SECONDS,
		TALK_ACTOR(actor("Фиддлер - 7-1-1"), "Не буду распинаться - почти что каждый здесь профессионал своего дела.") = 2 SECONDS,
		TURN_ACTOR(actor("Амелия - 7-1-1"), SOUTH) = 2 SECONDS,
		MOVE_ACTOR(actor("Люк - 7-1-1"), WEST) = 2 SECONDS,
		TALK_ACTOR(actor("Фиддлер - 7-1-1"), "И каждый прекрасно понимает +что+ стоит на кону.") = 8 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/s2ep7sc2)
	)

/proc/s2ep7sc2_screentext()
	var/message = {"<span style="color: yellow;">Йозеф</span>: Позади у нас не одна, и даже не две битвы."}

	var/obj/screen/player_message/maintext = new /obj/screen/player_message()
	maintext.plane = HUD_PLANE
	maintext.layer = HUD_ABOVE_HUD_LAYER
	maintext.maptext_x = 0
	maintext.maptext_y = -310

	for(var/client/M in GLOB.clients)
		M.screen += maintext
		maintext.set_text(message, COLOR_WHITE)

	spawn(6 SECONDS)

		for(var/client/M in GLOB.clients)
			for(var/obj/screen/messages in M.screen)
				if(istype(messages, /obj/screen/player_message))
					M.screen -= messages
					qdel(messages)

/datum/modular_cutscene/s2ep7sc2/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 7-1 - Кадр 2"),
		MOVE_CAMERA(0, 0, 0, null),

		ADD_SCREEN(/cinema_borders) = 1 SECONDS,
		CALL_GLOB(s2ep7sc2_screentext),

		TURN_ACTOR(actor("Солдат 1 - 7-1-2"), SOUTH) = 2 SECONDS,
		SHIFT_ACTOR(actor("Солдат 2 - 7-1-2"), 0, -10, 0.5 SECONDS, SINE_EASING|EASE_OUT, null) = 1 SECONDS,
		MOVE_ACTOR(actor("Солдат 2 - 7-1-2"), SOUTH),
		SHIFT_ACTOR(actor("Солдат 2 - 7-1-2"), 0, 0, 0, SINE_EASING|EASE_OUT, null) = 1 SECONDS,
		TURN_ACTOR(actor("Солдат 2 - 7-1-2"), WEST) = 1 SECONDS,
		TURN_ACTOR(actor("Солдат 2 - 7-1-2"), SOUTH),
		MOVE_ACTOR(actor("Солдат 2 - 7-1-2"), WEST) = 1 SECONDS,
		MOVE_ACTOR(actor("Солдат 2 - 7-1-2"), SOUTH) = 1 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/s2ep7sc3)
	)

/proc/s2ep7sc3_screentext()
	var/message = {"<span style="color: yellow;">Йозеф</span>: Нас пытались убить многие. Свои, чужие, небинарные - чудо то или нет, но мы пережили каждого из них."}

	var/obj/screen/player_message/maintext = new /obj/screen/player_message()
	maintext.plane = HUD_PLANE
	maintext.layer = HUD_ABOVE_HUD_LAYER
	maintext.maptext_x = 0
	maintext.maptext_y = -310

	for(var/client/M in GLOB.clients)
		M.screen += maintext
		maintext.set_text(message, COLOR_WHITE)

	spawn(8 SECONDS)
		message = {"<span style="color: yellow;">Йозеф</span>: В сравнении с ними - Терра не так страшна своей силой, сколько количеством голов, которые нам предстоит рубить на этот раз."}
		maintext.set_text(message, COLOR_WHITE)

	spawn(16 SECONDS)

		for(var/client/M in GLOB.clients)
			for(var/obj/screen/messages in M.screen)
				if(istype(messages, /obj/screen/player_message))
					M.screen -= messages
					qdel(messages)

/datum/modular_cutscene/s2ep7sc3/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 7-1 - Кадр 3"),

		ADD_SCREEN(/cinema_borders) = 1 SECONDS,
		CALL_GLOB(s2ep7sc3_screentext) = 2 SECONDS,

		SHIFT_ACTOR(actor("Перси - 7-1-3"), 0, 0, 0.5 SECONDS, SINE_EASING|EASE_OUT, null) = 2 SECONDS,
		MOVE_ACTOR(actor("Перси - 7-1-3"), SOUTH) = 2 SECONDS,
		MOVE_ACTOR(actor("Перси - 7-1-3"), SOUTH) = 2 SECONDS,
		TURN_ACTOR(actor("Перси - 7-1-3"), WEST) = 2 SECONDS,
		TURN_ACTOR(actor("Перси - 7-1-3"), SOUTH) = 1 SECONDS,
		TURN_ACTOR(actor("Перси - 7-1-3"), EAST) = 2 SECONDS,

		SHIFT_ACTOR(actor("Амелия - 7-1-3"), 0, 0, 1 SECONDS, SINE_EASING|EASE_IN, null) = 2 SECONDS,
		TURN_ACTOR(actor("Амелия - 7-1-3"), NORTH) = 1 SECONDS,
		TURN_ACTOR(actor("Амелия - 7-1-3"), WEST) = 1 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/s2ep7sc4)
	)

/proc/s2ep7sc4_screentext()
	var/message = {"<span style="color: yellow;">Йозеф</span>: Я понимаю ваши опасения, как никто другой. Понимаю что вы <b>устали</b>. Знаю как зудят ваши раны - физические и душевные."}

	var/obj/screen/player_message/maintext = new /obj/screen/player_message()
	maintext.plane = HUD_PLANE
	maintext.layer = HUD_ABOVE_HUD_LAYER
	maintext.maptext_x = 0
	maintext.maptext_y = -310

	for(var/client/M in GLOB.clients)
		M.screen += maintext
		maintext.set_text(message, COLOR_WHITE)

	spawn(8 SECONDS)

		for(var/client/M in GLOB.clients)
			for(var/obj/screen/messages in M.screen)
				if(istype(messages, /obj/screen/player_message))
					M.screen -= messages
					qdel(messages)

/datum/modular_cutscene/s2ep7sc4/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 7-1 - Кадр 4"),

		ADD_SCREEN(/cinema_borders) = 1 SECONDS,
		CALL_GLOB(s2ep7sc4_screentext) = 4 SECONDS,

		TURN_ACTOR(actor("Мясо - 7-1-4"), SOUTH) = 1 SECONDS,
		MOVE_ACTOR(actor("Мясо - 7-1-4"), SOUTH) = 1 SECONDS,
		MOVE_ACTOR(actor("Мясо - 7-1-4"), SOUTH) = 1 SECONDS,
		MOVE_ACTOR(actor("Мясо - 7-1-4"), SOUTH) = 1 SECONDS,
		MOVE_ACTOR(actor("Мясо - 7-1-4"), SOUTH) = 1 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/s2ep7sc5)
	)

/proc/s2ep7sc5_screentext()
	var/message = {"<span style="color: yellow;">Йозеф</span>: Знаю, как гложет чувство вины за души тех, кого спасти не удалось."}

	var/obj/screen/player_message/maintext = new /obj/screen/player_message()
	maintext.plane = HUD_PLANE
	maintext.layer = HUD_ABOVE_HUD_LAYER
	maintext.maptext_x = 0
	maintext.maptext_y = -310

	for(var/client/M in GLOB.clients)
		M.screen += maintext
		maintext.set_text(message, COLOR_WHITE)

	spawn(6 SECONDS)

		for(var/client/M in GLOB.clients)
			for(var/obj/screen/messages in M.screen)
				if(istype(messages, /obj/screen/player_message))
					M.screen -= messages
					qdel(messages)

/datum/modular_cutscene/s2ep7sc5/setup_actions(...)
	actions = list(
		CHANGE_ACTOR_VISIBILITY(actor("Призраки 1"), 0, 0, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Призраки 2"), 0, 0, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Призраки 3"), 0, 0, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Призраки 4"), 0, 0, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Призраки 5"), 0, 0, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Призраки 6"), 0, 0, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Призраки 7"), 0, 0, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Призраки 8"), 0, 0, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Призраки 9"), 0, 0, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Призраки 10"), 0, 0, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Призраки 11"), 0, 0, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Призраки 12"), 0, 0, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Призраки 13"), 0, 0, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Призраки 14"), 0, 0, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Призраки 15"), 0, 0, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Призраки 16"), 0, 0, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Призраки 17"), 0, 0, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Призраки 18"), 0, 0, SINE_EASING, null),
		TP_CAMERA("Сцена 7-1 - Кадр 5"),

		ADD_SCREEN(/cinema_borders) = 1 SECONDS,
		CALL_GLOB(s2ep7sc5_screentext) = 2 SECONDS,

		CHANGE_ACTOR_VISIBILITY(actor("Призраки 1"), 255, 0, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Призраки 2"), 255, 0, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Призраки 3"), 255, 0, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Призраки 4"), 255, 0, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Призраки 5"), 255, 0, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Призраки 6"), 255, 0, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Призраки 7"), 255, 0, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Призраки 8"), 255, 0, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Призраки 9"), 255, 0, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Призраки 10"), 255, 0, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Призраки 11"), 255, 0, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Призраки 12"), 255, 0, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Призраки 13"), 255, 0, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Призраки 14"), 255, 0, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Призраки 15"), 255, 0, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Призраки 16"), 255, 0, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Призраки 17"), 255, 0, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Призраки 18"), 255, 0, SINE_EASING, null) = 3 SECONDS,

		CHANGE_ACTOR_VISIBILITY(actor("Призраки 1"), 0, 0, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Призраки 2"), 0, 0, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Призраки 3"), 0, 0, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Призраки 4"), 0, 0, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Призраки 5"), 0, 0, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Призраки 6"), 0, 0, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Призраки 7"), 0, 0, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Призраки 8"), 0, 0, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Призраки 9"), 0, 0, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Призраки 10"), 0, 0, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Призраки 11"), 0, 0, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Призраки 12"), 0, 0, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Призраки 13"), 0, 0, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Призраки 14"), 0, 0, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Призраки 15"), 0, 0, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Призраки 16"), 0, 0, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Призраки 17"), 0, 0, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Призраки 18"), 0, 0, SINE_EASING, null) = 2 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/s2ep7sc6)
	)

/proc/s2ep7sc6_screentext()
	var/message = {"<span style="color: yellow;">Йозеф</span>: И потому прошу. Не ради себя, а ради жертвы тех, кого с нами уже <b>нет</b>, и всех <b>живых</b>, что молятся за вас сейчас."}

	var/obj/screen/player_message/maintext = new /obj/screen/player_message()
	maintext.plane = HUD_PLANE
	maintext.layer = HUD_ABOVE_HUD_LAYER
	maintext.maptext_x = 0
	maintext.maptext_y = -310

	for(var/client/M in GLOB.clients)
		M.screen += maintext
		maintext.set_text(message, COLOR_WHITE)

	spawn(8 SECONDS)
		message = ""
		maintext.set_text(message, COLOR_WHITE)

	spawn(10 SECONDS)
		message = {"<span style="color: yellow;">Йозеф</span>: Делайте то, что вы умеете лучше всего -"}
		maintext.set_text(message, COLOR_WHITE)

	spawn(14 SECONDS)

		for(var/client/M in GLOB.clients)
			for(var/obj/screen/messages in M.screen)
				if(istype(messages, /obj/screen/player_message))
					M.screen -= messages
					qdel(messages)

/datum/modular_cutscene/s2ep7sc6/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 7-1 - Кадр 6"),

		ADD_SCREEN(/cinema_borders) = 1 SECONDS,
		CALL_GLOB(s2ep7sc6_screentext),

		CHANGE_ACTOR_MATRIX(actor("Четвёртая - 7-1-6"), -35, 0.5 SECONDS, SINE_EASING|EASE_IN, ANIMATION_PARALLEL),
		SHIFT_ACTOR(actor("Четвёртая - 7-1-6"), -228, 22, 12 SECONDS, LINEAR_EASING, ANIMATION_PARALLEL),

		MOVE_ACTOR(actor("Эмми - 7-1-6"), WEST) = 1 SECONDS,
		TURN_ACTOR(actor("Кубик - 7-1-6"), SOUTH),
		MOVE_ACTOR(actor("Луни - 7-1-6"), WEST) = 1 SECONDS,
		MOVE_ACTOR(actor("Павел - 7-1-6"), WEST) = 1 SECONDS,
		MOVE_ACTOR(actor("Эмми - 7-1-6"), WEST),
		MOVE_ACTOR(actor("Сиэф - 7-1-6"), WEST) = 1 SECONDS,
		TURN_ACTOR(actor("Уфу - 7-1-6"), WEST),
		MOVE_ACTOR(actor("Луни - 7-1-6"), WEST),
		MOVE_ACTOR(actor("Павел - 7-1-6"), WEST) = 1 SECONDS,
		MOVE_ACTOR(actor("Сиэф - 7-1-6"), WEST) = 1 SECONDS,
		MOVE_ACTOR(actor("Эмми - 7-1-6"), WEST) = 1 SECONDS,
		TURN_ACTOR(actor("Кубик - 7-1-6"), WEST),
		MOVE_ACTOR(actor("Луни - 7-1-6"), WEST),
		MOVE_ACTOR(actor("Павел - 7-1-6"), WEST) = 1 SECONDS,
		MOVE_ACTOR(actor("Кубик - 7-1-6"), WEST) = 1 SECONDS,

		ADD_SCREEN(/blackout/animated_better),

		MOVE_ACTOR(actor("Луни - 7-1-6"), WEST),
		MOVE_ACTOR(actor("Уфу - 7-1-6"), WEST) = 1 SECONDS,
		MOVE_ACTOR(actor("Сиэф - 7-1-6"), WEST),
		MOVE_ACTOR(actor("Эмми - 7-1-6"), WEST) = 1 SECONDS,
		MOVE_ACTOR(actor("Павел - 7-1-6"), WEST),
		MOVE_ACTOR(actor("Кубик - 7-1-6"), WEST),
		MOVE_ACTOR(actor("Сиэф - 7-1-6"), WEST) = 3 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/s2ep7sc7)
	)

/proc/s2ep7sc7_screentext()
	var/message = {"<span style="color: yellow;">Йозеф</span>: - <b>сражайтесь</b>. Цепляйтесь за вашу жизнь, как цеплялись всегда."}

	var/obj/screen/player_message/maintext = new /obj/screen/player_message()
	maintext.plane = HUD_PLANE
	maintext.layer = HUD_ABOVE_HUD_LAYER
	maintext.maptext_x = 0
	maintext.maptext_y = -310

	for(var/client/M in GLOB.clients)
		M.screen += maintext
		maintext.set_text(message, COLOR_WHITE)

	spawn(4 SECONDS)

		for(var/client/M in GLOB.clients)
			for(var/obj/screen/messages in M.screen)
				if(istype(messages, /obj/screen/player_message))
					M.screen -= messages
					qdel(messages)

/proc/s2ep7sc8_screentext()
	var/message = {"<span style="color: yellow;">Йозеф</span>: Может быть хоть так...хоть у кого-то из нас-"}

	var/obj/screen/player_message/maintext = new /obj/screen/player_message()
	maintext.plane = HUD_PLANE
	maintext.layer = HUD_ABOVE_HUD_LAYER
	maintext.maptext_x = 0
	maintext.maptext_y = -310

	for(var/client/M in GLOB.clients)
		M.screen += maintext
		maintext.set_text(message, COLOR_WHITE)

	spawn(6 SECONDS)
		message = ""
		maintext.set_text(message, COLOR_WHITE)

	spawn(8 SECONDS)
		message = {"<span style="color: yellow;">Йозеф</span>: ...появится шанс дотянутся до звёзд. <b>Ещё</b> разок."}
		maintext.set_text(message, COLOR_WHITE)

	spawn(14 SECONDS)
		message = ""
		maintext.set_text(message, COLOR_WHITE)

	spawn(16 SECONDS)
		maintext.maptext_y = -210

		message = {"ЭП7: <span style="color: red;">ПОЖАЛУЙСТА, ЖИВИ!</span>"}
		maintext.set_text(message, COLOR_WHITE)

	spawn(24 SECONDS)
		message = ""
		maintext.set_text(message, COLOR_WHITE)

	spawn(26 SECONDS)
		maintext.maptext_y = -210

		message = {"ВРЕМЯ: <span style="color: red;">|-11:05:12-|</span>"}
		maintext.set_text(message, COLOR_WHITE)

	spawn(30 SECONDS)
		maintext.maptext_y = -210

		message = {"<span style="color: red;">ПЯТЬ ЧАСОВ С МОМЕНТА НАЧАЛА ОСАДЫ</span>"}
		maintext.set_text(message, COLOR_WHITE)

	spawn(36 SECONDS)

		for(var/client/M in GLOB.clients)
			for(var/obj/screen/messages in M.screen)
				if(istype(messages, /obj/screen/player_message))
					M.screen -= messages
					qdel(messages)

/datum/modular_cutscene/s2ep7sc7/setup_actions(...)
	actions = list(
		EASY_TRANSFORM_ACTOR(actor("Глаза Фиддлера - 7-1-7"), 6, 0),
		CHANGE_ACTOR_LAYER(actor("Глаза Фиддлера - 7-1-7"), 4.10),

		EASY_TRANSFORM_ACTOR(actor("Фиддлер - 7-1-7"), 11, 0),
		CHANGE_ACTOR_LAYER(actor("Фиддлер - 7-1-7"), 4.09),

		EASY_TRANSFORM_ACTOR(actor("Стена 7-7"), 15, 0),
		CHANGE_ACTOR_LAYER(actor("Стена 7-7"), 4.01),

		TP_CAMERA("Сцена 7-1 - Кадр 7"),
		ADD_SCREEN(/cinema_borders) = 4 SECONDS,
		CALL_GLOB(s2ep7sc7_screentext),
		REMOVE_SCREEN(/blackout/animated_better, 1 SECONDS) = 2 SECONDS,

		SHIFT_ACTOR(actor("Глаза Фиддлера - 7-1-7"), -9, -38, 0.5 SECONDS, SINE_EASING|EASE_IN, null),
		CHANGE_ACTOR_VISUALS(actor("Глаза Фиддлера - 7-1-7"), "Fiddler Eyes - Determination") = 3 SECONDS,

		ADD_SCREEN(/blackout),
		REMOVE_SCREEN(/cinema_borders, 0) = 2 SECONDS,
		CALL_GLOB(s2ep7sc8_screentext) = 30 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/IBO - Last Extremity.mp3', volume = 50), "Last Extremity (IBO)") = 5 SECONDS,

		CALL_GLOB(interactive_opening_sequence_ep7) = 0.5 SECONDS,
		REMOVE_SCREEN(/blackout, 1 SECONDS) = 0.5 SECONDS,
		RETURN_VIEWERS
	)

/proc/interactive_opening_sequence_ep7()

	var/list/obj/effect/cutscene_camera/opening_cameras/cameras_list = list()

	for(var/obj/effect/cutscene_camera/opening_cameras/C in world)
		cameras_list += C

	spawn(2 SECONDS)
		background_mumble_cycle_ep7()

		for(var/obj/effect/cutscene_camera/opening_cameras/C in cameras_list) // Прогонит нас через каждую существующую камеру
			for(var/client/client in GLOB.clients)
				client.mob.clear_fullscreen("borders")
				client.mob.overlay_fullscreen("borders", /obj/screen/fullscreen/fd/cinema_borders)

				client.watching_scene = TRUE

				client.adminobs = TRUE
				client.mob.reset_view(C)
			sleep(20 SECONDS)

		for(var/client/client in GLOB.clients)
			client.mob.overlay_fullscreen("darkness", /obj/screen/fullscreen/fd/blackout)
			client.mob.clear_fullscreen("borders")

			client.watching_scene = FALSE
			client.adminobs = null

		sleep(20 SECONDS)

		for(var/client/client in GLOB.clients)
			client.mob.clear_fullscreen("darkness", /obj/screen/fullscreen/fd/blackout)

/proc/background_mumble_cycle_ep7()
	credits_devs()
	credits_mappers()

	spawn(25 SECONDS)
		credits_spriters()

	spawn(50 SECONDS)
		credits_writers_new()

	spawn(75 SECONDS)
		episode5_sponsors()
		episode5_sponsors2()

	spawn(100 SECONDS)
		episode5_specials()
		episode5_specials2()

	spawn(125 SECONDS)
		episode7_lastwords()

/proc/episode7_lastwords()
	var/message = {"Спасибо за то, что прошли этот путь вместе со мной."}

	var/obj/screen/player_message/maintext = new /obj/screen/player_message()
	maintext.plane = HUD_PLANE
	maintext.layer = HUD_ABOVE_HUD_LAYER
	maintext.maptext_x = -5
	maintext.maptext_y = -210

	for(var/client/M in GLOB.clients)
		M.screen += maintext
		maintext.set_text(message, COLOR_WHITE)

	spawn(8 SECONDS)
		message = {"С любовью, ваш верный слуга - <b><span style="color: yellow;">Doctor Alex</span></b>. Желаю вам <b>хорошо провести время</b>!"}
		maintext.set_text(message, COLOR_WHITE)

	spawn(16 SECONDS)

		for(var/client/M in GLOB.clients)
			for(var/obj/screen/messages in M.screen)
				if(istype(messages, /obj/screen/player_message))
					M.screen -= messages
					qdel(messages)

/mob/living/simple_animal/cutscene_character/s2ep7/errors
	name = "hazard"
	desc = "..."
	mouse_opacity = FALSE

	icon = 'mods/_fd/fd_assets/icons/goons/featherzone.dmi'
	icon_state = "hazard"
	icon_living = "hazard"
	icon_dead = "hazard"

	should_show_name = FALSE
	plane = EFFECTS_ABOVE_LIGHTING_PLANE

	layer = ABOVE_LIGHTING_LAYER
	forced_layer = ABOVE_LIGHTING_LAYER
	should_update_layer = TRUE

/proc/play_music(sound/sound, show_name = null)
	sound_to(world, sound)

	if(show_name)
		for(var/client/client in GLOB.clients)

			var/obj/screen/player_message/audio/maintext = new /obj/screen/player_message/audio()
			maintext.plane = HUD_PLANE
			maintext.layer = HUD_ABOVE_HUD_LAYER
			maintext.maptext_x = 0
			maintext.maptext_y = -380

			var/message = {"Сейчас играет: <b><span style="color: yellow;">[show_name]</span></b>"}

			client.screen += maintext
			maintext.set_text(message, COLOR_WHITE)

			addtimer(new Callback(client.mob, TYPE_PROC_REF(/mob, remove_music_name)), 5 SECONDS)

/mob/proc/remove_music_name()
	for(var/obj/screen/player_message/audio/A in client.screen)
		client.screen -= A
		qdel(A)

/obj/effect/cutscene_camera/s2ep7sc8
	camera_id = "Сцена 7-2 - Кадр 1"

/proc/fds2ep7_cutscene2()
	play_music('maps/torch_doh/cutscenes/sounds/IBO - Standing on the edge of the Cliff.mp3', "Standing on the edge of the Cliff (IBO)")

	sleep(65 SECONDS)
	start_cutscene(/datum/modular_cutscene/s2ep7sc8)

/proc/terra_death_screentext()
	var/message = {"<span style="color: cyan;">УСТАНОВКА НОВОГО ЯДРА</span> <b><span style="color: green;">ЗАВЕРШЕНА</span></b>"}

	var/obj/screen/player_message/maintext = new /obj/screen/player_message()
	maintext.plane = HUD_PLANE
	maintext.layer = HUD_ABOVE_HUD_LAYER
	maintext.maptext_x = -5
	maintext.maptext_y = -210

	for(var/client/M in GLOB.clients)
		M.screen += maintext
		maintext.set_text(message, COLOR_WHITE)

	spawn(6 SECONDS)

		for(var/client/M in GLOB.clients)
			for(var/obj/screen/messages in M.screen)
				if(istype(messages, /obj/screen/player_message))
					M.screen -= messages
					qdel(messages)

/proc/make_robots_friends()
	for(var/mob/living/simple_animal/hostile/terra/robots in world)
		robots.faction = "TRK-17"

/datum/modular_cutscene/s2ep7sc8/setup_actions(...)
	actions = list(
		CALL_GLOB(make_robots_friends),

		CHANGE_ACTOR_VISIBILITY(actor("Ошибка 1"), 0, 0, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Ошибка 2"), 0, 0, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Ошибка 3"), 0, 0, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Ошибка 4"), 0, 0, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Ошибка 5"), 0, 0, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Ошибка 6"), 0, 0, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Ошибка 7"), 0, 0, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Ошибка 8"), 0, 0, SINE_EASING, null),

		ADD_SCREEN(/blackout/animated_better) = 3 SECONDS,
		TP_CAMERA("Сцена 7-2 - Кадр 1"),
		ADD_SCREEN(/blackout) = 3 SECONDS,
		ADD_SCREEN(/cinema_borders),
		REMOVE_SCREEN(/blackout/animated_better, 0),
		REMOVE_SCREEN(/blackout, 1 SECONDS) = 1 SECONDS,
		TALK_ACTOR(actor("Терра - 7-2-1"), "Немыслимо.") = 2 SECONDS,
		CHANGE_ACTOR_VISUALS(actor("Терра - 7-2-1"), "Terra - Hands Crossed") = 2 SECONDS,
		SHIFT_ACTOR(actor("Терра - 7-2-1"), 0, -10, 0.5 SECONDS, SINE_EASING|EASE_IN, null),
		TALK_ACTOR(actor("Терра - 7-2-1"), "Едва ли это вирус. Для обыкновенной программы он слишком \"живой\".") = 6 SECONDS,
		TALK_ACTOR(actor("Терра - 7-2-1"), "К тому же, непохоже, чтобы его целью была +моя инфраструктура+. Он пытается лишить меня глаз, но не тела.") = 10 SECONDS,
		TALK_ACTOR(actor("Терра - 7-2-1"), "Тогда, хакер?") = 4 SECONDS,
		TURN_ACTOR(actor("Терра - 7-2-1"), WEST),
		TALK_ACTOR(actor("Терра - 7-2-1"), "...будто бы среди них есть кто-то способный взломать что-то комплекснее шлюза.") = 6 SECONDS,
		TALK_ACTOR(actor("Терра - 7-2-1"), "Признаться честно, я искренне удивлена тому, что они смогли обойти +\"ключ\"+ партикального копья.") = 8 SECONDS,
		TALK_ACTOR(actor("Терра - 7-2-1"), "Не устрани я +Амелию+ - процесс захвата был бы +гораздо+ трудней.") = 6 SECONDS,
		TALK_ACTOR(actor("Терра - 7-2-1"), "...") = 4 SECONDS,
		TALK_ACTOR(actor("Терра - 7-2-1"), "Хм...") = 4 SECONDS,
		CHANGE_ACTOR_VISUALS(actor("Терра - 7-2-1"), "Current"),
		TURN_ACTOR(actor("Терра - 7-2-1"), SOUTH),
		TALK_ACTOR(actor("Терра - 7-2-1"), "Как бы то ни было...") = 3 SECONDS,
		TALK_ACTOR(actor("Терра - 7-2-1"), "Я смогу разобраться с ним позже. У нас есть задачи важнее ловли \"мышей\"."),
		CHANGE_ACTOR_VISUALS(actor("Терра - 7-2-1"), "Terra - Super Earth") = 1 SECONDS,

		MOVE_CAMERA(0, 4, 8 SECONDS, SINE_EASING|EASE_OUT) = 2 SECONDS,
		MOVE_ACTOR(actor("Свифт - 7-2-1"), SOUTH) = 2 SECONDS,
		MOVE_ACTOR(actor("Свифт - 7-2-1"), SOUTH) = 2 SECONDS,
		MOVE_ACTOR(actor("Свифт - 7-2-1"), SOUTH) = 2 SECONDS,
		MOVE_ACTOR(actor("Свифт - 7-2-1"), SOUTH),
		TALK_ACTOR(actor("Свифт - 7-2-1"), "Э#-й! ВеDр0 с б#олтами!") = 2 SECONDS,
		CHANGE_ACTOR_VISUALS(actor("Терра - 7-2-1"), "Current"),
		TURN_ACTOR(actor("Терра - 7-2-1"), NORTH) = 1 SECONDS,
		TALK_ACTOR(actor("Терра - 7-2-1"), "Как ты-") = 1 SECONDS,
		TALK_ACTOR(actor("Свифт - 7-2-1"), "+РYkи пр0ч$ от мо#ей СЕМЬИ+!") = 1 SECONDS,
		MOVE_ACTOR(actor("Свифт - 7-2-1"), SOUTH) = 0.5 SECONDS,
		MOVE_ACTOR(actor("Терра - 7-2-1"), SOUTH),
		MOVE_ACTOR(actor("Свифт - 7-2-1"), SOUTH) = 0.5 SECONDS,

		CHANGE_ACTOR_MATRIX(actor("Терра - 7-2-1"), 45, 0.5 SECONDS, BOUNCE_EASING|EASE_IN|EASE_OUT, null),

		CHANGE_ACTOR_VISIBILITY(actor("Ошибка 1"), 255, 10, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Ошибка 2"), 255, 0, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Ошибка 3"), 255, 0, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Ошибка 4"), 255, 5, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Ошибка 5"), 255, 0, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Ошибка 6"), 255, 0, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Ошибка 7"), 255, 10, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Ошибка 8"), 255, 3, SINE_EASING, null) = 1 SECONDS,
		TALK_ACTOR(actor("Терра - 7-2-1"), "+Тебя D0л#но было ра-ра-расщепить на null-и и ед1ниц#+!") = 5 SECONDS,
		TALK_ACTOR(actor("Свифт - 7-2-1"), "Да помолчи ты уже...") = 2 SECONDS,
		ADD_SCREEN(/blackout/animated_better) = 4 SECONDS,
		CALL_GLOB(terra_death_screentext) = 7 SECONDS,

		MOVE_CAMERA(0, 0, 0, SINE_EASING|EASE_OUT),
		REMOVE_SCREEN(/cinema_borders, 0),
		REMOVE_SCREEN(/blackout/animated_better, 1 SECONDS),

		RETURN_VIEWERS
	)

/proc/prepare_for_the_end()
	for(var/client/client in GLOB.clients)
		if(isliving(client.mob))
			shake_camera_MARINE(client.mob, steps = 8, strength = 4, time_per_step = 2)

	sleep(10)

	start_cutscene(/datum/modular_cutscene/s2ep7sc9)

/proc/stardom_screentext()
	var/message = {"<span style="color: cyan;">ВНИМАНИЕ! СОСТОЯНИЕ ЗАВЕСЫ</span>: <b><span style="color: red;">КРИТИЧЕСКОЕ</span></b>"}

	var/obj/screen/player_message/maintext = new /obj/screen/player_message()
	maintext.plane = HUD_PLANE
	maintext.layer = HUD_ABOVE_HUD_LAYER
	maintext.maptext_x = -5
	maintext.maptext_y = -210

	for(var/client/M in GLOB.clients)
		M.screen += maintext
		maintext.set_text(message, COLOR_WHITE)

	spawn(1 SECONDS)
		message = {"<span style="color: cyan;">ВНИМАНИЕ! СОСТОЯНИЕ ЗАВЕСЫ: <b>КРИТИЧЕСКОЕ</b></span>"}
		maintext.set_text(message, COLOR_WHITE)

	spawn(2 SECONDS)
		message = {"<span style="color: cyan;">ВНИМАНИЕ! СОСТОЯНИЕ ЗАВЕСЫ</span>: <b><span style="color: red;">КРИТИЧЕСКОЕ</span></b>"}
		maintext.set_text(message, COLOR_WHITE)

	spawn(3 SECONDS)
		message = {"<span style="color: cyan;">ВНИМАНИЕ! СОСТОЯНИЕ ЗАВЕСЫ: <b>КРИТИЧЕСКОЕ</b></span>"}
		maintext.set_text(message, COLOR_WHITE)

	spawn(4 SECONDS)
		message = {"<span style="color: cyan;">ВНИМАНИЕ! СОСТОЯНИЕ ЗАВЕСЫ</span>: <b><span style="color: red;">КРИТИЧЕСКОЕ</span></b>"}
		maintext.set_text(message, COLOR_WHITE)

	spawn(5 SECONDS)
		message = {"<span style="color: cyan;">ВНИМАНИЕ! СОСТОЯНИЕ ЗАВЕСЫ: <b>КРИТИЧЕСКОЕ</b></span>"}
		maintext.set_text(message, COLOR_WHITE)

	spawn(6 SECONDS)
		message = {"<span style="color: cyan;">ВНИМАНИЕ! СОСТОЯНИЕ ЗАВЕСЫ</span>: <b><span style="color: red;">КРИТИЧЕСКОЕ</span></b>"}
		maintext.set_text(message, COLOR_WHITE)

	spawn(8 SECONDS)
		message = ""
		maintext.set_text(message, COLOR_WHITE)

	spawn(10 SECONDS)
		maintext.maptext_x = 0
		maintext.maptext_y = -310
		message = {"<span style="color: yellow;">С.В.И.Ф.Т</span>: Ох, чёрт-!"}
		maintext.set_text(message, COLOR_WHITE)

	spawn(14 SECONDS)
		message = ""
		maintext.set_text(message, COLOR_WHITE)

	spawn(16 SECONDS)
		maintext.maptext_x = -5
		maintext.maptext_y = -210
		message = {"Пускай лишь на пару секунд, но завеса, скрывавшая орбиту планеты - <b><span style="color: red;">исчезла</span></b>."}
		maintext.set_text(message, COLOR_WHITE)

	spawn(24 SECONDS)
		message = {"Этого времени оказалось более чем достаточно, чтобы забывшие вспомнили, а незнавшие узнали о жестокой правде, скрывавшейся за обманчивой, но такой спокойной небесной пеленой."}
		maintext.set_text(message, COLOR_WHITE)

	spawn(34 SECONDS)
		message = {"С десяток <b><span style="color: purple;">инопланетных кораблей</span></b>, достаточно крупных чтобы их можно было разглядеть с земли, висело над их головами подобно <b>коршунам</b>, ждущим момента чтобы обгладать давно охладевший труп человечества."}
		maintext.set_text(message, COLOR_WHITE)

	spawn(46 SECONDS)
		message = {"Затем, вместе с восстановлением работы Стардома, они снова исчезли. Но что-то подсказывало, что этого времени было более чем достаточно чтобы они заметили вас в ответ."}
		maintext.set_text(message, COLOR_WHITE)

	spawn(54 SECONDS)
		message = {"Теперь, некогда раздражающе реалистичное, а ныне побитое пикселями картонное небо - внушало лишь ужас. Ужас от того, что поднимая голову вверх...кто-то или что-то может <b><span style="color: red;">посмотреть оттуда в ответ</span></b>."}
		maintext.set_text(message, COLOR_WHITE)

	spawn(66 SECONDS)
		message = {"Похоже, что дроны начинают отходить. Куда бы они не направлялись - делают они это в явной спешке."}
		maintext.set_text(message, COLOR_WHITE)

	spawn(70 SECONDS)
		message = {"Это определённо <b><span style="color: green;">победа</span></b>. Только стоила ли она того?"}
		maintext.set_text(message, COLOR_WHITE)

	spawn(74 SECONDS)

		for(var/client/M in GLOB.clients)
			for(var/obj/screen/messages in M.screen)
				if(istype(messages, /obj/screen/player_message))
					M.screen -= messages
					qdel(messages)

/datum/modular_cutscene/s2ep7sc9/setup_actions(...)
	actions = list(
		ADD_SCREEN(/blackout/animated_better) = 6 SECONDS,
		CALL_GLOB(stardom_screentext) = 75 SECONDS,
		REMOVE_SCREEN(/blackout/animated_better, 1 SECONDS) = 1 SECONDS,
		RETURN_VIEWERS
	)

/proc/air_bombarding()
	var/message = {"Поднимая голову, вы замечаете странные <b><span style="color: red;">летательные аппараты</span></b>, кружащие над бункером..."}

	var/obj/screen/player_message/maintext = new /obj/screen/player_message()
	maintext.plane = HUD_PLANE
	maintext.layer = HUD_ABOVE_HUD_LAYER
	maintext.maptext_x = -5
	maintext.maptext_y = -210

	for(var/client/M in GLOB.clients)
		M.screen += maintext
		maintext.set_text(message, COLOR_WHITE)

	spawn(8 SECONDS)

		for(var/client/M in GLOB.clients)
			for(var/obj/screen/messages in M.screen)
				if(istype(messages, /obj/screen/player_message))
					M.screen -= messages
					qdel(messages)

/proc/pavel_death()
	var/message = {"Под ногами громыхнула земля. Издали полетели птицы. Кажется, взрыв был со стороны <b><span style="color: red;">болот Мантикоры</span></b>"}

	var/obj/screen/player_message/maintext = new /obj/screen/player_message()
	maintext.plane = HUD_PLANE
	maintext.layer = HUD_ABOVE_HUD_LAYER
	maintext.maptext_x = -5
	maintext.maptext_y = -210

	for(var/client/M in GLOB.clients)
		M.screen += maintext
		maintext.set_text(message, COLOR_WHITE)

	spawn(8 SECONDS)

		for(var/client/M in GLOB.clients)
			for(var/obj/screen/messages in M.screen)
				if(istype(messages, /obj/screen/player_message))
					M.screen -= messages
					qdel(messages)








// Эту идею я забраковал. Почему-то после Даниного апдейта катсцен как будто бы сломались все манипуляции с клиентом, хотя он их даже не делал
/mob/living/simple_animal/cutscene_character/s2ep7/gyne
	name = "Королева"
	desc = "..."
	mouse_opacity = FALSE

	icon = 'mods/_fd/fd_assets/icons/gyne.dmi'
	icon_state = "gyne"
	icon_living = "gyne"
	icon_dead = "gyne"

	should_show_name = FALSE

/obj/effect/cutscene_camera/s2ep7sc10
	camera_id = "Сцена 7-4 - Кадр 1"

/obj/effect/cutscene_camera/s2ep7sc11
	camera_id = "Сцена 7-4 - Кадр 2"

/proc/fds2ep7_cutscene3()
	play_music('maps/torch_doh/cutscenes/sounds/fuga.mp3', "Wherever The Wind Takes Us (Fuga)")

	sleep(2 SECONDS)
	start_cutscene(/datum/modular_cutscene/s2ep7sc10)

/datum/modular_cutscene/s2ep7sc10/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 7-4 - Кадр 1"),
		MOVE_CAMERA(0, 6, 16 SECONDS, LINEAR_EASING) = 13 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/s2ep7sc11)
	)

/datum/modular_cutscene/s2ep7sc11/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 7-4 - Кадр 2"),
		ADD_SCREEN(/cinema_borders) = 4 SECONDS,

		TALK_ACTOR(actor("Алат"), "||𝙹⚍∷ ᒲᔑ⋮ᒷᓭℸ ̣ ||") = 4 SECONDS,
		MOVE_ACTOR(actor("Гиина"), SOUTH) = 2 SECONDS,
		TALK_ACTOR(actor("Гиина"), "+||𝙹⚍ ᓵᔑリ ᓭℸ ̣ ᔑ∷ℸ ̣  リ𝙹∴+") = 6 SECONDS,
		TALK_ACTOR(actor("Алат"), "!молча делает поклон.") = 2 SECONDS,
		TURN_ACTOR(actor("Алат"), NORTH) = 2 SECONDS,
		TALK_ACTOR(actor("Гиина"), "╎'⍊ᒷ ⍑ᔑ↸ ᒷリ𝙹⚍⊣⍑ 𝙹⎓ ℸ ̣ ⍑╎ᓭ ᓵ⍑ᔑ∷ᔑ↸ᒷᓭ"),
		MOVE_ACTOR(actor("Алат"), NORTH) = 2 SECONDS,
		MOVE_ACTOR(actor("Алат"), NORTH) = 2 SECONDS,
		MOVE_ACTOR(actor("Алат"), NORTH) = 2 SECONDS,

		REMOVE_SCREEN(/cinema_borders, 0),
		CALL_GLOB(cutscene_cinema_end) = 30 SECONDS,
		MOVE_CAMERA(0, 0, 0, null) = 1 SECONDS,
		RETURN_VIEWERS
	)
