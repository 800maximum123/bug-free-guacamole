/proc/episode4_maxteller1()
	var/novel_message = "Зараза! Ну неужели нельзя просто дать старику отдохнуть!?"
	var/colored = COLOR_MEDICAL_BURN

	var/obj/screen/novel_message/start_credits/nofade/visuals = new /obj/screen/novel_message/start_credits/nofade()
	visuals.maptext_x = 0
	visuals.maptext_y = -410
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 6 SECONDS)

/proc/episode4_maxteller2()
	var/novel_message = "Шаг в лес сделал, а у бункера уже оборванцы какие-то!"
	var/colored = COLOR_MEDICAL_BURN

	var/obj/screen/novel_message/start_credits/nofade/visuals = new /obj/screen/novel_message/start_credits/nofade()
	visuals.maptext_x = 0
	visuals.maptext_y = -410
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 6 SECONDS)

/proc/episode4_maxteller3()
	var/novel_message = "Ещё и Датура со Свифтом как сквозь землю провалились... (рычит)"
	var/colored = COLOR_MEDICAL_BURN

	var/obj/screen/novel_message/start_credits/nofade/visuals = new /obj/screen/novel_message/start_credits/nofade()
	visuals.maptext_x = 0
	visuals.maptext_y = -410
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 6 SECONDS)

/proc/episode4_maxteller4()
	var/novel_message = "Хотя бы пацанёнок своей халабудой доволен. Из-за этого дождя - устанавливать её было той ещё пыткой."
	var/colored = COLOR_MEDICAL_BURN

	var/obj/screen/novel_message/start_credits/nofade/visuals = new /obj/screen/novel_message/start_credits/nofade()
	visuals.maptext_x = 0
	visuals.maptext_y = -410
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 8 SECONDS)

/proc/episode4_maxteller5()
	var/novel_message = "Как не взгляну на него - всё время патлатого вспоминаю."
	var/colored = COLOR_MEDICAL_BURN

	var/obj/screen/novel_message/start_credits/nofade/visuals = new /obj/screen/novel_message/start_credits/nofade()
	visuals.maptext_x = 0
	visuals.maptext_y = -410
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 6 SECONDS)

/proc/episode4_maxteller6()
	var/novel_message = "Интересно...а у него дети были вообще? Есть? (отмахивается) На вряд ли..."
	var/colored = COLOR_MEDICAL_BURN

	var/obj/screen/novel_message/start_credits/nofade/visuals = new /obj/screen/novel_message/start_credits/nofade()
	visuals.maptext_x = 0
	visuals.maptext_y = -410
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 6 SECONDS)

/proc/episode4_maxteller7()
	var/novel_message = "Ему пачка сигарет, кажется, и то дороже была."
	var/colored = COLOR_MEDICAL_BURN

	var/obj/screen/novel_message/start_credits/nofade/visuals = new /obj/screen/novel_message/start_credits/nofade()
	visuals.maptext_x = 0
	visuals.maptext_y = -410
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 6 SECONDS)

/proc/episode2_maxteller8()
	var/novel_message = "Смотрите далее, в \"FINAL DESTINATION\""
	var/colored = COLOR_MEDICAL_BURN

	var/obj/screen/novel_message/start_credits/nofade/visuals = new /obj/screen/novel_message/start_credits/nofade()
	visuals.maptext_x = 0
	visuals.maptext_y = -410
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 4 SECONDS)

/proc/episode4_name()
	var/novel_message = "ЭП4:"
	var/colored = COLOR_ASSEMBLY_BLACK

	var/obj/screen/novel_message/start_credits/visuals = new /obj/screen/novel_message/start_credits()
	visuals.maptext_x = -110
	visuals.maptext_y = -410
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 10 SECONDS)

/proc/episode4_name2()
	var/novel_message = "РОДСТВЕННЫЕ СВЯЗИ"
	var/colored = COLOR_SABER_RED

	var/obj/screen/novel_message/start_credits/visuals = new /obj/screen/novel_message/start_credits()
	visuals.maptext_x = -83
	visuals.maptext_y = -410
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 8 SECONDS)

/obj/effect/cutscene_camera/s2ep4sc2
	camera_id = "Сцена 4-2 - Кадр 1"

/obj/effect/cutscene_camera/s2ep4sc3
	camera_id = "Сцена 4-2 - Кадр 2"

/proc/fds2ep4_cutscene2()
	start_cutscene(/datum/modular_cutscene/s2ep4sc2)

/datum/modular_cutscene/s2ep4sc2/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 4-2 - Кадр 1"),
		ADD_SCREEN(/blackout),
		MOVE_CAMERA(0, 5, 0, null) = 2 SECONDS,
		REMOVE_SCREEN(/blackout, 0 SECONDS),
		ADD_SCREEN(/cinema_borders),
		CALL_GLOB(episode4_maxteller1),
		MOVE_CAMERA(0, 0, 10 SECONDS, LINEAR_EASING|EASE_IN),
		CHANGE_ACTOR_VISIBILITY(actor("Максим - 4-2-1"), 255, 1 SECONDS, SINE_EASING, ANIMATION_PARALLEL),
		SHIFT_ACTOR(actor("Максим - 4-2-1"), 0, 0, 1 SECONDS, CUBIC_EASING|EASE_OUT, ANIMATION_PARALLEL) = 1 SECONDS,
		TURN_ACTOR(actor("Максим - 4-2-1"), WEST) = 1 SECONDS,
		CHANGE_ACTOR_VISIBILITY(actor("Фиддлер - 4-2-1"), 255, 1 SECONDS, SINE_EASING, ANIMATION_PARALLEL),
		SHIFT_ACTOR(actor("Фиддлер - 4-2-1"), 0, 0, 1 SECONDS, CUBIC_EASING|EASE_OUT, ANIMATION_PARALLEL) = 2 SECONDS,
		TURN_ACTOR(actor("Максим - 4-2-1"), EAST),
		TURN_ACTOR(actor("Фиддлер - 4-2-1"), EAST),
		CHANGE_ACTOR_VISIBILITY(actor("Оливия - 4-2-1"), 255, 1 SECONDS, SINE_EASING, ANIMATION_PARALLEL),
		SHIFT_ACTOR(actor("Оливия - 4-2-1"), 0, 0, 3 SECONDS, CUBIC_EASING|EASE_OUT, ANIMATION_PARALLEL) = 4 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/s2ep4sc3)
	)

/datum/modular_cutscene/s2ep4sc3/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 4-2 - Кадр 2"),
		ADD_SCREEN(/cinema_borders),
		CALL_GLOB(episode4_maxteller2),
	)
