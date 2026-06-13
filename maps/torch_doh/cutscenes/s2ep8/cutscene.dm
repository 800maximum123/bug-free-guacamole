/obj/effect/cutscene_camera/s2ep8sc1
	camera_id = "Сцена 8-1 - Кадр 1"

/obj/effect/cutscene_camera/s2ep8sc2
	camera_id = "Сцена 8-1 - Кадр 2"

/obj/effect/cutscene_camera/s2ep8sc3
	camera_id = "Сцена 8-1 - Кадр 3"

/obj/effect/cutscene_camera/s2ep8sc4
	camera_id = "Сцена 8-1 - Кадр 4"

/obj/effect/cutscene_camera/s2ep8sc5
	camera_id = "Сцена 8-1 - Кадр 5"

/obj/effect/cutscene_camera/s2ep8sc6
	camera_id = "Сцена 8-1 - Кадр 6"

/obj/effect/cutscene_camera/s2ep8sc7
	camera_id = "Сцена 8-1 - Кадр 7"

/obj/effect/cutscene_camera/s2ep8sc8
	camera_id = "Сцена 8-1 - Кадр 8"

/obj/effect/cutscene_camera/s2ep8sc9
	camera_id = "Сцена 8-1 - Кадр 9"

/obj/effect/cutscene_camera/s2ep8sc10
	camera_id = "Сцена 8-1 - Кадр 10"

/obj/effect/cutscene_camera/s2ep8sc11
	camera_id = "Сцена 8-1 - Кадр 11"

/obj/effect/cutscene_camera/s2ep8sc12
	camera_id = "Сцена 8-1 - Кадр 12"

/proc/fds2ep8_cutscene1()
	play_music('maps/torch_doh/cutscenes/sounds/Cyberpank2077 - newer fade away.ogg', "Cyberpunk 2077 — Never Fade Away by P T Adamczyk & Olga Jankowska")
	start_cutscene(/datum/modular_cutscene/s2ep8sc1)

/proc/s2ep8sc1m1_screentext()
	var/message = {"<span style="color: yellow;">ВРЕМЯ</span>      "}

	var/obj/screen/player_message/maintext = new /obj/screen/player_message()
	maintext.plane = HUD_PLANE
	maintext.layer = HUD_ABOVE_HUD_LAYER
	maintext.maptext_x = -50
	maintext.maptext_y = -100
	maintext.SetTransform(2)
	maintext.alpha = 0

	for(var/client/M in GLOB.clients)
		animate(maintext, 3 SECOND, alpha = 255)
		M.screen += maintext
		maintext.set_text(message, COLOR_WHITE)

	spawn(8 SECONDS)
		message = {"<span style="color: yellow;">ВРЕМЯ</span> .    "}
		maintext.set_text(message, COLOR_WHITE)

	spawn(16 SECONDS)
		message = {"<span style="color: yellow;">ВРЕМЯ</span> . .  "}
		maintext.set_text(message, COLOR_WHITE)

	spawn(21 SECONDS)
		message = {"<span style="color: yellow;">ВРЕМЯ</span> . . ."}
		maintext.set_text(message, COLOR_WHITE)

	spawn(33 SECONDS)
		message = {"<span style="color: yellow;">ВРЕМЯ</span> . . ."}
		animate(maintext, 7 SECOND, alpha = 0)
		maintext.set_text(message, COLOR_WHITE)

	spawn(40 SECONDS)
		for(var/client/M in GLOB.clients)
			for(var/obj/screen/messages in M.screen)
				if(istype(messages, /obj/screen/player_message))
					M.screen -= messages
					qdel(messages)


/proc/s2ep8sc1m2_screentext()
	var/message = {"Последнее время"}

	var/obj/screen/player_message/maintext = new /obj/screen/player_message()
	maintext.plane = HUD_PLANE
	maintext.layer = HUD_ABOVE_HUD_LAYER
	maintext.maptext_x = -5
	maintext.maptext_y = -110
	maintext.alpha = 0

	for(var/client/M in GLOB.clients)
		M.screen += maintext
		maintext.set_text(message, COLOR_WHITE)

	spawn(1 SECONDS)
		animate(maintext, 3 SECOND, alpha = 255)
		maintext.set_text(message, COLOR_WHITE)

	spawn(7 SECONDS)
		animate(maintext, 1 SECOND, alpha = 0)
		maintext.set_text(message, COLOR_WHITE)

	spawn(8 SECONDS)
		for(var/client/M in GLOB.clients)
			for(var/obj/screen/messages in M.screen)
				if(istype(messages, /obj/screen/player_message))
					M.screen -= messages
					qdel(messages)


/proc/s2ep8sc1m3_screentext()
	var/message = {"<b>ОНО</b>"}

	var/obj/screen/player_message/maintext = new /obj/screen/player_message()
	maintext.plane = HUD_PLANE
	maintext.layer = HUD_ABOVE_HUD_LAYER
	maintext.maptext_x = -25
	maintext.maptext_y = -115
	maintext.SetTransform(1.1)
	maintext.alpha = 0

	for(var/client/M in GLOB.clients)
		M.screen += maintext
		maintext.set_text(message, COLOR_WHITE)

	spawn(0.5 SECONDS)
		animate(maintext, 2 SECOND, alpha = 255)
		maintext.set_text(message, COLOR_WHITE)

	spawn(5.5 SECONDS)
		animate(maintext, 0.5 SECOND, alpha = 0)
		maintext.set_text(message, COLOR_WHITE)

	spawn(6 SECONDS)
		for(var/client/M in GLOB.clients)
			for(var/obj/screen/messages in M.screen)
				if(istype(messages, /obj/screen/player_message))
					M.screen -= messages
					qdel(messages)


/proc/s2ep8sc1m4_screentext()
	var/message = {"так быстро..."}

	var/obj/screen/player_message/maintext = new /obj/screen/player_message()
	maintext.plane = HUD_PLANE
	maintext.layer = HUD_ABOVE_HUD_LAYER
	maintext.maptext_x = -5
	maintext.maptext_y = -142
	maintext.alpha = 0

	for(var/client/M in GLOB.clients)
		M.screen += maintext
		maintext.set_text(message, COLOR_WHITE)

	spawn(0.25 SECONDS)
		animate(maintext, 1 SECOND, alpha = 255)
		maintext.set_text(message, COLOR_WHITE)

	spawn(3.75 SECONDS)
		animate(maintext, 0.25 SECOND, alpha = 0)
		maintext.set_text(message, COLOR_WHITE)

	spawn(4 SECONDS)
		for(var/client/M in GLOB.clients)
			for(var/obj/screen/messages in M.screen)
				if(istype(messages, /obj/screen/player_message))
					M.screen -= messages
					qdel(messages)


/proc/s2ep8sc1m5_screentext()
	var/message = {"<span style="color: yellow;">идёт</span>"}

	var/obj/screen/player_message/maintext = new /obj/screen/player_message()
	maintext.plane = HUD_PLANE
	maintext.layer = HUD_ABOVE_HUD_LAYER
	maintext.maptext_x = -47
	maintext.maptext_y = -133
	maintext.SetTransform(1.5)

	for(var/client/M in GLOB.clients)
		M.screen += maintext
		maintext.set_text(message, COLOR_WHITE)

	spawn(0.25 SECONDS)
		for(var/client/M in GLOB.clients)
			for(var/obj/screen/messages in M.screen)
				if(istype(messages, /obj/screen/player_message))
					M.screen -= messages
					qdel(messages)

/proc/s2ep8sc1m6_screentext()
	var/message = {"<span style="color: red;">БЕЖИТ</span>"}

	var/obj/screen/player_message/maintext = new /obj/screen/player_message()
	maintext.plane = HUD_PLANE
	maintext.layer = HUD_ABOVE_HUD_LAYER
	maintext.maptext_x = -72
	maintext.maptext_y = -78
	maintext.SetTransform(2.5)

	for(var/client/M in GLOB.clients)
		M.screen += maintext
		maintext.set_text(message, COLOR_WHITE)

	spawn(0.25 SECONDS)
		for(var/client/M in GLOB.clients)
			for(var/obj/screen/messages in M.screen)
				if(istype(messages, /obj/screen/player_message))
					M.screen -= messages
					qdel(messages)

/proc/s2ep8sc1m7_screentext()
	var/message = {"<span style="color: red;">ЛЕТИТ</span>"}

	var/obj/screen/player_message/maintext = new /obj/screen/player_message()
	maintext.plane = HUD_PLANE
	maintext.layer = HUD_ABOVE_HUD_LAYER
	maintext.maptext_x = -100
	maintext.maptext_y = -10
	maintext.SetTransform(2.5)

	for(var/client/M in GLOB.clients)
		M.screen += maintext
		maintext.set_text(message, COLOR_WHITE)

	spawn(0.25 SECONDS)
		for(var/client/M in GLOB.clients)
			for(var/obj/screen/messages in M.screen)
				if(istype(messages, /obj/screen/player_message))
					M.screen -= messages
					qdel(messages)

/proc/s2ep8sc1m8_screentext()
	var/message = {"<span style="color: red;">УТЕКАЕТ</span>"}

	var/obj/screen/player_message/maintext = new /obj/screen/player_message()
	maintext.plane = HUD_PLANE
	maintext.layer = HUD_ABOVE_HUD_LAYER
	maintext.maptext_x = 10
	maintext.maptext_y = -140
	maintext.SetTransform(2.5)

	for(var/client/M in GLOB.clients)
		M.screen += maintext
		maintext.set_text(message, COLOR_WHITE)

	spawn(0.25 SECONDS)
		for(var/client/M in GLOB.clients)
			for(var/obj/screen/messages in M.screen)
				if(istype(messages, /obj/screen/player_message))
					M.screen -= messages
					qdel(messages)

/proc/s2ep8sc1m9_screentext()
	var/message = {"<span style="color: red;">ПРОПАДАЕТ</span>"}

	var/obj/screen/player_message/maintext = new /obj/screen/player_message()
	maintext.plane = HUD_PLANE
	maintext.layer = HUD_ABOVE_HUD_LAYER
	maintext.maptext_x = -70
	maintext.maptext_y = -78
	maintext.SetTransform(2.5)

	for(var/client/M in GLOB.clients)
		M.screen += maintext
		maintext.set_text(message, COLOR_WHITE)

	spawn(0.25 SECONDS)
		for(var/client/M in GLOB.clients)
			for(var/obj/screen/messages in M.screen)
				if(istype(messages, /obj/screen/player_message))
					M.screen -= messages
					qdel(messages)

/proc/s2ep8sc1m10_screentext()
	var/message = {"<b>вот бы</b>"}

	var/obj/screen/player_message/maintext = new /obj/screen/player_message()
	maintext.plane = HUD_PLANE
	maintext.layer = HUD_ABOVE_HUD_LAYER
	maintext.maptext_x = -72
	maintext.maptext_y = -78
	maintext.SetTransform(1.5)
	maintext.alpha = 0

	for(var/client/M in GLOB.clients)
		M.screen += maintext
		maintext.set_text(message, COLOR_WHITE)

	spawn(0.25 SECONDS)
		animate(maintext, 5 SECOND, alpha = 255)
		maintext.set_text(message, COLOR_WHITE)

	spawn(14 SECONDS)
		animate(maintext, 5 SECOND, alpha = 5)
		maintext.set_text(message, COLOR_WHITE)

	spawn(20 SECONDS)
		for(var/client/M in GLOB.clients)
			for(var/obj/screen/messages in M.screen)
				if(istype(messages, /obj/screen/player_message))
					M.screen -= messages
					qdel(messages)

/proc/s2ep8sc1m11_screentext()
	var/message = {"<b>ОНО</b>"}

	var/obj/screen/player_message/maintext = new /obj/screen/player_message()
	maintext.plane = HUD_PLANE
	maintext.layer = HUD_ABOVE_HUD_LAYER
	maintext.maptext_x = -25
	maintext.maptext_y = -140
	maintext.SetTransform(1.1)
	maintext.alpha = 0

	for(var/client/M in GLOB.clients)
		M.screen += maintext
		maintext.set_text(message, COLOR_WHITE)

	spawn(0.5 SECONDS)
		animate(maintext, 2 SECOND, alpha = 255)
		maintext.set_text(message, COLOR_WHITE)

	spawn(7.5 SECONDS)
		animate(maintext, 2.5 SECOND, alpha = 5)
		maintext.set_text(message, COLOR_WHITE)

	spawn(10 SECONDS)
		for(var/client/M in GLOB.clients)
			for(var/obj/screen/messages in M.screen)
				if(istype(messages, /obj/screen/player_message))
					M.screen -= messages
					qdel(messages)

/proc/s2ep8sc1m12_screentext()
	var/message = {"<b>ОСТАНОВИЛОСЬ</b>"}

	var/obj/screen/player_message/maintext = new /obj/screen/player_message()
	maintext.plane = HUD_PLANE
	maintext.layer = HUD_ABOVE_HUD_LAYER
	maintext.maptext_x = -35
	maintext.maptext_y = -70
	maintext.SetTransform(2.5)
	maintext.alpha = 0

	for(var/client/M in GLOB.clients)
		M.screen += maintext
		maintext.set_text(message, COLOR_WHITE)

	spawn(0.25 SECONDS)
		animate(maintext, 5 SECOND, alpha = 255)
		maintext.set_text(message, COLOR_WHITE)

	spawn(8 SECONDS)
		animate(maintext, 4 SECOND, alpha = 5)
		maintext.set_text(message, COLOR_WHITE)

	spawn(10 SECONDS)
		for(var/client/M in GLOB.clients)
			for(var/obj/screen/messages in M.screen)
				if(istype(messages, /obj/screen/player_message))
					M.screen -= messages
					qdel(messages)


/datum/modular_cutscene/s2ep8sc1/setup_actions(...)
	actions = list(
		ADD_SCREEN(/blackout/animated_better) = 5 SECONDS,
		CALL_GLOB(s2ep8sc1m1_screentext) = 40 SECONDS,
		CALL_GLOB(s2ep8sc1m2_screentext) = 2 SECONDS,
		CALL_GLOB(s2ep8sc1m3_screentext) = 2 SECONDS,
		CALL_GLOB(s2ep8sc1m4_screentext) = 2 SECONDS,
		CALL_GLOB(s2ep8sc1m5_screentext) = 0.25 SECONDS,
		CALL_GLOB(s2ep8sc1m6_screentext) = 0.25 SECONDS,
		CALL_GLOB(s2ep8sc1m5_screentext) = 0.25 SECONDS,
		CALL_GLOB(s2ep8sc1m7_screentext) = 0.25 SECONDS,
		CALL_GLOB(s2ep8sc1m5_screentext) = 0.25 SECONDS,
		CALL_GLOB(s2ep8sc1m6_screentext) = 0.25 SECONDS,
		CALL_GLOB(s2ep8sc1m5_screentext) = 0.25 SECONDS,
		CALL_GLOB(s2ep8sc1m8_screentext) = 0.25 SECONDS,
		CALL_GLOB(s2ep8sc1m5_screentext) = 0.25 SECONDS,
		CALL_GLOB(s2ep8sc1m6_screentext) = 0.25 SECONDS,
		CALL_GLOB(s2ep8sc1m5_screentext) = 0.25 SECONDS,
		CALL_GLOB(s2ep8sc1m9_screentext) = 0.25 SECONDS,
		CALL_GLOB(s2ep8sc1m10_screentext) = 5 SECONDS,
		CALL_GLOB(s2ep8sc1m11_screentext) = 5 SECONDS,
		CALL_GLOB(s2ep8sc1m12_screentext) = 10 SECONDS,
		REMOVE_SCREEN(/blackout/animated_better, 5),
		START_CUTSCENE(/datum/modular_cutscene/s2ep8sc2)
	)


/proc/credits_devss2ep8()
	var/novel_message = "НАД КОДОМ РАБОТАЛИ: DOCTOR ALEX, AHMOQ"
	var/colored = COLOR_ASSEMBLY_BLACK

	var/obj/screen/novel_message/start_credits/visuals = new /obj/screen/novel_message/start_credits()
	visuals.maptext_x = -110
	visuals.maptext_y = -420
	visuals.maptext_width = 192
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 16 SECONDS)

/proc/credits_mapperss2ep8()
	var/novel_message = "ПРОЕКТИРОВАЛИ ЛОКАЦИИ: PALERNO, IVAN2004FANTOM, KANARYSS"
	var/colored = COLOR_ASSEMBLY_BLACK

	var/obj/screen/novel_message/start_credits/visuals = new /obj/screen/novel_message/start_credits()
	visuals.maptext_x = 120
	visuals.maptext_y = -5
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 16 SECONDS)

/proc/credits_spriterss2ep8()
	var/novel_message = "РИСОВАЛИ ДЛЯ ВАС: DARKSOVET"
	var/colored = COLOR_ASSEMBLY_BLACK

	var/obj/screen/novel_message/start_credits/visuals = new /obj/screen/novel_message/start_credits()
	visuals.maptext_x = -110
	visuals.maptext_y = -420
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 16 SECONDS)

/proc/credits_writers_news2ep8()
	var/novel_message = "СЦЕНАРИЙ ПИСАЛИ: DOCTOR ALEX"
	var/colored = COLOR_ASSEMBLY_BLACK

	var/obj/screen/novel_message/start_credits/visuals = new /obj/screen/novel_message/start_credits()
	visuals.maptext_x = 130
	visuals.maptext_y = -5
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 16 SECONDS)

/proc/episode8_sponsors()
	var/novel_message = "ФИНАНСИРОВАЛИ НАШ ТРУД:"
	var/colored = COLOR_ASSEMBLY_BLACK

	var/obj/screen/novel_message/start_credits/visuals = new /obj/screen/novel_message/start_credits()
	visuals.maptext_x = -100
	visuals.maptext_y = -410
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 8 SECONDS)

/proc/episode8_sponsors2()
	var/novel_message = "KRABINATIOR3000, RaviolliBorchevidze, illerk, Grigpashtet, DenXays, Aftik, LimboBaggins, Rogver Snott, fast_zummer"
	var/colored = COLOR_RED

	var/obj/screen/novel_message/start_credits/visuals = new /obj/screen/novel_message/start_credits()
	visuals.maptext_x = -110
	visuals.maptext_y = -430
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 8 SECONDS)

/proc/episode8_specials()
	var/novel_message = "ОСОБАЯ БЛАГОДАРНОСТЬ:"
	var/colored = COLOR_ASSEMBLY_BLACK

	var/obj/screen/novel_message/start_credits/visuals = new /obj/screen/novel_message/start_credits()
	visuals.maptext_x = 120
	visuals.maptext_y = -2
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 8 SECONDS)

/proc/episode8_specials2()
	var/novel_message = "CuddleAndTea, techpriest34, Zakterar, GhostGamer, Sliva, HelpMeee, Maximum123"
	var/colored = COLOR_RED

	var/obj/screen/novel_message/start_credits/visuals = new /obj/screen/novel_message/start_credits()
	visuals.maptext_x = 100
	visuals.maptext_y = -22
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 8 SECONDS)

/proc/s2ep8sc2m1_screentext()
	var/message = {"мы так много сделали..."}

	var/obj/screen/player_message/maintext = new /obj/screen/player_message()
	maintext.plane = HUD_PLANE
	maintext.layer = HUD_ABOVE_HUD_LAYER
	maintext.maptext_x = -140
	maintext.maptext_y = -15
	maintext.SetTransform(1.5)
	maintext.alpha = 0

	for(var/client/M in GLOB.clients)
		M.screen += maintext
		maintext.set_text(message, COLOR_WHITE)

	spawn(0.1 SECONDS)
		animate(maintext, 3 SECOND, alpha = 255)

	spawn(9 SECONDS)
		animate(maintext, 3 SECOND, alpha = 0)

	spawn(12 SECONDS)
		for(var/client/M in GLOB.clients)
			for(var/obj/screen/messages in M.screen)
				if(istype(messages, /obj/screen/player_message))
					M.screen -= messages
					qdel(messages)

/datum/modular_cutscene/s2ep8sc2/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 8-1 - Кадр 1"),
		ADD_SCREEN(/cinema_borders),
		MOVE_CAMERA(-4, 0, 14 SECONDS, SINE_EASING|EASE_IN) = 12 SECONDS,
		ADD_SCREEN(/blackout/animated_better) = 2 SECONDS,
		MOVE_CAMERA(0, 0, 0, null),
		START_CUTSCENE(/datum/modular_cutscene/s2ep8sc3)
	)

/proc/s2ep8sc3m1_screentext()
	var/message = {"...что бы просто выжить"}

	var/obj/screen/player_message/maintext = new /obj/screen/player_message()
	maintext.plane = HUD_PLANE
	maintext.layer = HUD_ABOVE_HUD_LAYER
	maintext.maptext_x = 45
	maintext.maptext_y = -270
	maintext.SetTransform(1.5)
	maintext.alpha = 0

	for(var/client/M in GLOB.clients)
		M.screen += maintext
		animate(maintext, 3 SECOND, alpha = 255)
		maintext.set_text(message, COLOR_WHITE)

	spawn(9 SECONDS)
		animate(maintext, 3 SECOND, alpha = 0)

	spawn(12 SECONDS)
		for(var/client/M in GLOB.clients)
			for(var/obj/screen/messages in M.screen)
				if(istype(messages, /obj/screen/player_message))
					M.screen -= messages
					qdel(messages)

/datum/modular_cutscene/s2ep8sc3/setup_actions(...)
	actions = list(
		CALL_GLOB(credits_devss2ep8),
		REMOVE_SCREEN(/blackout/animated_better, 2 SECONDS),
		TP_CAMERA("Сцена 8-1 - Кадр 2"),
		ADD_SCREEN(/cinema_borders),
		CALL_GLOB(s2ep8sc2m1_screentext),
		MOVE_CAMERA(-4, 0, 14 SECONDS, SINE_EASING|EASE_IN) = 6 SECONDS,
		CALL_GLOB(s2ep8sc3m1_screentext) = 6 SECONDS,
		ADD_SCREEN(/blackout/animated_better) = 2 SECONDS,
		MOVE_CAMERA(0, 0, 0, null),
		START_CUTSCENE(/datum/modular_cutscene/s2ep8sc4)
	)

/proc/s2ep8sc4m1_screentext()
	var/message = {"находили..."}

	var/obj/screen/player_message/maintext = new /obj/screen/player_message()
	maintext.plane = HUD_PLANE
	maintext.layer = HUD_ABOVE_HUD_LAYER
	maintext.maptext_x = -160
	maintext.maptext_y = -15
	maintext.SetTransform(1.5)
	maintext.alpha = 0

	for(var/client/M in GLOB.clients)
		M.screen += maintext
		animate(maintext, 3 SECOND, alpha = 255)
		maintext.set_text(message, COLOR_WHITE)

	spawn(9 SECONDS)
		animate(maintext, 3 SECOND, alpha = 0)

	spawn(12 SECONDS)
		for(var/client/M in GLOB.clients)
			for(var/obj/screen/messages in M.screen)
				if(istype(messages, /obj/screen/player_message))
					M.screen -= messages
					qdel(messages)

/datum/modular_cutscene/s2ep8sc4/setup_actions(...)
	actions = list(
		REMOVE_SCREEN(/blackout/animated_better, 2 SECONDS),
		TP_CAMERA("Сцена 8-1 - Кадр 3"),
		ADD_SCREEN(/cinema_borders),
		CALL_GLOB(s2ep8sc4m1_screentext),
		MOVE_CAMERA(4, 0, 14 SECONDS, SINE_EASING|EASE_IN) = 12 SECONDS,
		ADD_SCREEN(/blackout/animated_better) = 2 SECONDS,
		MOVE_CAMERA(0, 0, 0, null),
		START_CUTSCENE(/datum/modular_cutscene/s2ep8sc5)
	)

/proc/s2ep8sc5m1_screentext()
	var/message = {"...и теряли"}

	var/obj/screen/player_message/maintext = new /obj/screen/player_message()
	maintext.plane = HUD_PLANE
	maintext.layer = HUD_ABOVE_HUD_LAYER
	maintext.maptext_x = 60
	maintext.maptext_y = -270
	maintext.SetTransform(1.5)
	maintext.alpha = 0

	for(var/client/M in GLOB.clients)
		M.screen += maintext
		animate(maintext, 3 SECOND, alpha = 255)
		maintext.set_text(message, COLOR_WHITE)

	spawn(9 SECONDS)
		animate(maintext, 3 SECOND, alpha = 0)

	spawn(12 SECONDS)
		for(var/client/M in GLOB.clients)
			for(var/obj/screen/messages in M.screen)
				if(istype(messages, /obj/screen/player_message))
					M.screen -= messages
					qdel(messages)

/datum/modular_cutscene/s2ep8sc5/setup_actions(...)
	actions = list(
		CALL_GLOB(credits_mapperss2ep8),
		REMOVE_SCREEN(/blackout/animated_better, 2 SECONDS),
		TP_CAMERA("Сцена 8-1 - Кадр 4"),
		ADD_SCREEN(/cinema_borders),
		CALL_GLOB(s2ep8sc5m1_screentext),
		MOVE_CAMERA(4, 0, 14 SECONDS, SINE_EASING|EASE_IN) = 12 SECONDS,
		ADD_SCREEN(/blackout/animated_better) = 2 SECONDS,
		MOVE_CAMERA(0, 0, 0, null),
		START_CUTSCENE(/datum/modular_cutscene/s2ep8sc6)
	)

/proc/s2ep8sc6m1_screentext()
	var/message = {"влюблялись..."}

	var/obj/screen/player_message/maintext = new /obj/screen/player_message()
	maintext.plane = HUD_PLANE
	maintext.layer = HUD_ABOVE_HUD_LAYER
	maintext.maptext_x = -150
	maintext.maptext_y = -15
	maintext.SetTransform(1.5)
	maintext.alpha = 0

	for(var/client/M in GLOB.clients)
		M.screen += maintext
		animate(maintext, 3 SECOND, alpha = 255)
		maintext.set_text(message, COLOR_WHITE)

	spawn(9 SECONDS)
		animate(maintext, 3 SECOND, alpha = 0)

	spawn(12 SECONDS)
		for(var/client/M in GLOB.clients)
			for(var/obj/screen/messages in M.screen)
				if(istype(messages, /obj/screen/player_message))
					M.screen -= messages
					qdel(messages)

/datum/modular_cutscene/s2ep8sc6/setup_actions(...)
	actions = list(
		REMOVE_SCREEN(/blackout/animated_better, 2 SECONDS),
		TP_CAMERA("Сцена 8-1 - Кадр 5"),
		ADD_SCREEN(/cinema_borders),
		CALL_GLOB(s2ep8sc6m1_screentext),
		MOVE_CAMERA(4, 0, 14 SECONDS, SINE_EASING|EASE_IN) = 12 SECONDS,
		ADD_SCREEN(/blackout/animated_better) = 2 SECONDS,
		MOVE_CAMERA(0, 0, 0, null),
		START_CUTSCENE(/datum/modular_cutscene/s2ep8sc7)
	)

/proc/s2ep8sc7m1_screentext()
	var/message = {"...и ненавидели"}

	var/obj/screen/player_message/maintext = new /obj/screen/player_message()
	maintext.plane = HUD_PLANE
	maintext.layer = HUD_ABOVE_HUD_LAYER
	maintext.maptext_x = 60
	maintext.maptext_y = -270
	maintext.SetTransform(1.5)
	maintext.alpha = 0

	for(var/client/M in GLOB.clients)
		M.screen += maintext
		animate(maintext, 3 SECOND, alpha = 255)
		maintext.set_text(message, COLOR_WHITE)

	spawn(9 SECONDS)
		animate(maintext, 3 SECOND, alpha = 0)

	spawn(12 SECONDS)
		for(var/client/M in GLOB.clients)
			for(var/obj/screen/messages in M.screen)
				if(istype(messages, /obj/screen/player_message))
					M.screen -= messages
					qdel(messages)

/datum/modular_cutscene/s2ep8sc7/setup_actions(...)
	actions = list(
		CALL_GLOB(credits_spriterss2ep8),
		REMOVE_SCREEN(/blackout/animated_better, 2 SECONDS),
		TP_CAMERA("Сцена 8-1 - Кадр 6"),
		ADD_SCREEN(/cinema_borders),
		CALL_GLOB(s2ep8sc7m1_screentext),
		MOVE_CAMERA(4, 0, 14 SECONDS, SINE_EASING|EASE_IN) = 12 SECONDS,
		ADD_SCREEN(/blackout/animated_better) = 2 SECONDS,
		MOVE_CAMERA(0, 0, 0, null),
		START_CUTSCENE(/datum/modular_cutscene/s2ep8sc8)
	)

/proc/s2ep8sc8m1_screentext()
	var/message = {"бежали..."}

	var/obj/screen/player_message/maintext = new /obj/screen/player_message()
	maintext.plane = HUD_PLANE
	maintext.layer = HUD_ABOVE_HUD_LAYER
	maintext.maptext_x = -150
	maintext.maptext_y = -15
	maintext.SetTransform(1.5)
	maintext.alpha = 0

	for(var/client/M in GLOB.clients)
		M.screen += maintext
		animate(maintext, 3 SECOND, alpha = 255)
		maintext.set_text(message, COLOR_WHITE)

	spawn(9 SECONDS)
		animate(maintext, 3 SECOND, alpha = 0)

	spawn(12 SECONDS)
		for(var/client/M in GLOB.clients)
			for(var/obj/screen/messages in M.screen)
				if(istype(messages, /obj/screen/player_message))
					M.screen -= messages
					qdel(messages)

/datum/modular_cutscene/s2ep8sc8/setup_actions(...)
	actions = list(
		REMOVE_SCREEN(/blackout/animated_better, 2 SECONDS),
		TP_CAMERA("Сцена 8-1 - Кадр 7"),
		ADD_SCREEN(/cinema_borders),
		CALL_GLOB(s2ep8sc8m1_screentext),
		MOVE_CAMERA(0, 4, 14 SECONDS, SINE_EASING|EASE_IN) = 12 SECONDS,
		ADD_SCREEN(/blackout/animated_better) = 2 SECONDS,
		MOVE_CAMERA(0, 0, 0, null),
		START_CUTSCENE(/datum/modular_cutscene/s2ep8sc9)
	)

/proc/s2ep8sc9m1_screentext()
	var/message = {"...и давали бой"}

	var/obj/screen/player_message/maintext = new /obj/screen/player_message()
	maintext.plane = HUD_PLANE
	maintext.layer = HUD_ABOVE_HUD_LAYER
	maintext.maptext_x = 50
	maintext.maptext_y = -280
	maintext.SetTransform(1.5)
	maintext.alpha = 0

	for(var/client/M in GLOB.clients)
		M.screen += maintext
		animate(maintext, 3 SECOND, alpha = 255)
		maintext.set_text(message, COLOR_WHITE)

	spawn(9 SECONDS)
		animate(maintext, 3 SECOND, alpha = 0)

	spawn(12 SECONDS)
		for(var/client/M in GLOB.clients)
			for(var/obj/screen/messages in M.screen)
				if(istype(messages, /obj/screen/player_message))
					M.screen -= messages
					qdel(messages)

/datum/modular_cutscene/s2ep8sc9/setup_actions(...)
	actions = list(
		CALL_GLOB(credits_writers_news2ep8),
		REMOVE_SCREEN(/blackout/animated_better, 2 SECONDS),
		TP_CAMERA("Сцена 8-1 - Кадр 8"),
		ADD_SCREEN(/cinema_borders),
		CALL_GLOB(s2ep8sc9m1_screentext),
		MOVE_CAMERA(0, -4, 14 SECONDS, SINE_EASING|EASE_IN) = 12 SECONDS,
		ADD_SCREEN(/blackout/animated_better) = 2 SECONDS,
		MOVE_CAMERA(0, 0, 0, null),
		START_CUTSCENE(/datum/modular_cutscene/s2ep8sc10)
	)

/proc/s2ep8sc10m1_screentext()
	var/message = {"побеждали..."}

	var/obj/screen/player_message/maintext = new /obj/screen/player_message()
	maintext.plane = HUD_PLANE
	maintext.layer = HUD_ABOVE_HUD_LAYER
	maintext.maptext_x = -150
	maintext.maptext_y = -15
	maintext.SetTransform(1.5)
	maintext.alpha = 0

	for(var/client/M in GLOB.clients)
		M.screen += maintext
		animate(maintext, 3 SECOND, alpha = 255)
		maintext.set_text(message, COLOR_WHITE)

	spawn(9 SECONDS)
		animate(maintext, 3 SECOND, alpha = 0)

	spawn(12 SECONDS)
		for(var/client/M in GLOB.clients)
			for(var/obj/screen/messages in M.screen)
				if(istype(messages, /obj/screen/player_message))
					M.screen -= messages
					qdel(messages)

/datum/modular_cutscene/s2ep8sc10/setup_actions(...)
	actions = list(
		REMOVE_SCREEN(/blackout/animated_better, 2 SECONDS),
		TP_CAMERA("Сцена 8-1 - Кадр 9"),
		ADD_SCREEN(/cinema_borders),
		CALL_GLOB(s2ep8sc10m1_screentext),
		MOVE_CAMERA(0, -4, 14 SECONDS, SINE_EASING|EASE_IN) = 12 SECONDS,
		ADD_SCREEN(/blackout/animated_better) = 2 SECONDS,
		MOVE_CAMERA(0, 0, 0, null),
		START_CUTSCENE(/datum/modular_cutscene/s2ep8sc11)
	)

/proc/s2ep8sc11m1_screentext()
	var/message = {"...и умирали"}

	var/obj/screen/player_message/maintext = new /obj/screen/player_message()
	maintext.plane = HUD_PLANE
	maintext.layer = HUD_ABOVE_HUD_LAYER
	maintext.maptext_x = 50
	maintext.maptext_y = -270
	maintext.SetTransform(1.5)
	maintext.alpha = 0

	for(var/client/M in GLOB.clients)
		M.screen += maintext
		animate(maintext, 3 SECOND, alpha = 255)
		maintext.set_text(message, COLOR_WHITE)

	spawn(9 SECONDS)
		animate(maintext, 3 SECOND, alpha = 0)

	spawn(12 SECONDS)
		for(var/client/M in GLOB.clients)
			for(var/obj/screen/messages in M.screen)
				if(istype(messages, /obj/screen/player_message))
					M.screen -= messages
					qdel(messages)

/datum/modular_cutscene/s2ep8sc11/setup_actions(...)
	actions = list(
		REMOVE_SCREEN(/blackout/animated_better, 2 SECONDS),
		TP_CAMERA("Сцена 8-1 - Кадр 10"),
		ADD_SCREEN(/cinema_borders),
		CALL_GLOB(s2ep8sc11m1_screentext),
		MOVE_CAMERA(2, 0, 6 SECONDS, SINE_EASING|EASE_IN) = 8 SECONDS,
		ADD_SCREEN(/blackout/animated_better) = 2 SECONDS,
		MOVE_CAMERA(0, 0, 0, null),
		START_CUTSCENE(/datum/modular_cutscene/s2ep8sc12)
	)

/proc/s2ep8sc12m1_screentext()
	var/message = {"столько всего случилось..."}

	var/obj/screen/player_message/maintext = new /obj/screen/player_message()
	maintext.plane = HUD_PLANE
	maintext.layer = HUD_ABOVE_HUD_LAYER
	maintext.maptext_x = -140
	maintext.maptext_y = -15
	maintext.SetTransform(1.5)
	maintext.alpha = 0

	for(var/client/M in GLOB.clients)
		M.screen += maintext
		animate(maintext, 3 SECOND, alpha = 255)
		maintext.set_text(message, COLOR_WHITE)

	spawn(9 SECONDS)
		animate(maintext, 3 SECOND, alpha = 0)

	spawn(12 SECONDS)
		for(var/client/M in GLOB.clients)
			for(var/obj/screen/messages in M.screen)
				if(istype(messages, /obj/screen/player_message))
					M.screen -= messages
					qdel(messages)

/datum/modular_cutscene/s2ep8sc12/setup_actions(...)
	actions = list(
		REMOVE_SCREEN(/blackout/animated_better, 2 SECONDS),
		CALL_GLOB(episode8_sponsors),
		CALL_GLOB(episode8_specials),
		TP_CAMERA("Сцена 8-1 - Кадр 11"),
		ADD_SCREEN(/cinema_borders),
		CALL_GLOB(s2ep8sc12m1_screentext),
		MOVE_CAMERA(0, -5, 4 SECONDS, SINE_EASING|EASE_IN) = 3 SECONDS,
		ADD_SCREEN(/blackout/animated_better) = 2 SECONDS,
		MOVE_CAMERA(0, 0, 0, null),
		START_CUTSCENE(/datum/modular_cutscene/s2ep8sc13)
	)

/proc/s2ep8sc13m1_screentext()
	var/message = {"...за столь короткий срок..."}

	var/obj/screen/player_message/maintext = new /obj/screen/player_message()
	maintext.plane = HUD_PLANE
	maintext.layer = HUD_ABOVE_HUD_LAYER
	maintext.maptext_x = -10
	maintext.maptext_y = -260
	maintext.SetTransform(1.5)
	maintext.alpha = 0

	for(var/client/M in GLOB.clients)
		M.screen += maintext
		animate(maintext, 3 SECOND, alpha = 255)
		maintext.set_text(message, COLOR_WHITE)

	spawn(9 SECONDS)
		animate(maintext, 3 SECOND, alpha = 0)

	spawn(12 SECONDS)
		for(var/client/M in GLOB.clients)
			for(var/obj/screen/messages in M.screen)
				if(istype(messages, /obj/screen/player_message))
					M.screen -= messages
					qdel(messages)

/proc/s2ep8sc13m2_screentext()
	var/message = {"Пожалуй..."}

	var/obj/screen/player_message/maintext = new /obj/screen/player_message()
	maintext.plane = HUD_PLANE
	maintext.layer = HUD_ABOVE_HUD_LAYER
	maintext.maptext_x = -20
	maintext.maptext_y = -100
	maintext.SetTransform(2)
	maintext.alpha = 0

	for(var/client/M in GLOB.clients)
		M.screen += maintext
		animate(maintext, 3 SECOND, alpha = 255)
		maintext.set_text(message, COLOR_WHITE)

	spawn(9 SECONDS)
		animate(maintext, 3 SECOND, alpha = 0)

	spawn(27 SECONDS)
		for(var/client/M in GLOB.clients)
			for(var/obj/screen/messages in M.screen)
				if(istype(messages, /obj/screen/player_message))
					M.screen -= messages
					qdel(messages)
/proc/s2ep8sc13m3_screentext()

	var/message = {"Мы заслужили это..."}

	var/obj/screen/player_message/maintext = new /obj/screen/player_message()
	maintext.plane = HUD_PLANE
	maintext.layer = HUD_ABOVE_HUD_LAYER
	maintext.maptext_x = -40
	maintext.maptext_y = -140
	maintext.SetTransform(1.9)
	maintext.alpha = 0

	for(var/client/M in GLOB.clients)
		M.screen += maintext
		animate(maintext, 3 SECOND, alpha = 255)
		maintext.set_text(message, COLOR_WHITE)

	spawn(8 SECONDS)
		animate(maintext, 3 SECOND, alpha = 0)

	spawn(26 SECONDS)
		for(var/client/M in GLOB.clients)
			for(var/obj/screen/messages in M.screen)
				if(istype(messages, /obj/screen/player_message))
					M.screen -= messages
					qdel(messages)

/proc/s2ep8sc13m4_screentext()
	var/message = {"<span style="color: green;">передышку</span>"}

	var/obj/screen/player_message/maintext = new /obj/screen/player_message()
	maintext.plane = HUD_PLANE
	maintext.layer = HUD_ABOVE_HUD_LAYER
	maintext.maptext_x = -30
	maintext.maptext_y = -120
	maintext.SetTransform(2.5)
	maintext.alpha = 0

	for(var/client/M in GLOB.clients)
		M.screen += maintext
		animate(maintext, 3 SECOND, alpha = 50)
		maintext.set_text(message, COLOR_WHITE)

	spawn(3.01 SECONDS)
		animate(maintext, 7 SECOND, alpha = 255)

	spawn(15 SECONDS)
		animate(maintext, 5 SECONDS, alpha = 0)

	spawn(20 SECONDS)
		for(var/client/M in GLOB.clients)
			for(var/obj/screen/messages in M.screen)
				if(istype(messages, /obj/screen/player_message))
					M.screen -= messages
					qdel(messages)

/datum/modular_cutscene/s2ep8sc13/setup_actions(...)
	actions = list(
		REMOVE_SCREEN(/blackout/animated_better, 2 SECONDS),
		TP_CAMERA("Сцена 8-1 - Кадр 12"),
		ADD_SCREEN(/cinema_borders),
		CALL_GLOB(s2ep8sc13m1_screentext),
		MOVE_CAMERA(0, -1, 2 SECONDS, SINE_EASING|EASE_IN) = 0.5 SECONDS,
		CALL_GLOB(episode8_sponsors2) = 1 SECONDS,
		CALL_GLOB(episode8_specials2) = 18.5 SECONDS,
		ADD_SCREEN(/blackout/animated_better) = 2 SECONDS,
		REMOVE_SCREEN(/cinema_borders, 5),
		CALL_GLOB(s2ep8sc13m2_screentext) = 5 SECONDS,
		CALL_GLOB(s2ep8sc13m3_screentext) = 5 SECONDS,
		CALL_GLOB(s2ep8sc13m4_screentext) = 15 SECONDS,
		MOVE_CAMERA(0, 0, 0, null),
		RETURN_VIEWERS,
		REMOVE_SCREEN(/blackout/animated_better, 3 SECONDS)
	)
