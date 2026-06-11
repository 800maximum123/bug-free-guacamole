/proc/episode4_maxteller1()
	var/novel_message = "Зараза! У местных совсем такта нет, что ли!? А ну прочь поди!"
	var/colored = COLOR_MEDICAL_BURN

	var/obj/screen/novel_message/start_credits/nofade_simple/visuals = new /obj/screen/novel_message/start_credits/nofade_simple()
	visuals.maptext_x = 0
	visuals.maptext_y = -410
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 6 SECONDS)

/proc/episode4_maxteller2()
	var/novel_message = "Только за порог шагнул, в лесочек-то...а бункер уже какие-то чудики облепили!"
	var/colored = COLOR_MEDICAL_BURN

	var/obj/screen/novel_message/start_credits/nofade_simple/visuals = new /obj/screen/novel_message/start_credits/nofade_simple()
	visuals.maptext_x = 0
	visuals.maptext_y = -410
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 6 SECONDS)

/proc/episode4_maxteller3()
	var/novel_message = "Эй! Кто-нибудь видел Свифта или Реймонда?! Где их носит вообще в такое-то время?"
	var/colored = COLOR_MEDICAL_BURN

	var/obj/screen/novel_message/start_credits/nofade_simple/visuals = new /obj/screen/novel_message/start_credits/nofade_simple()
	visuals.maptext_x = 0
	visuals.maptext_y = -410
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 6 SECONDS)

/proc/episode4_maxteller4()
	var/novel_message = "Что? Я был занят важным делом! ...Помогал пацану халабуду строить."
	var/colored = COLOR_MEDICAL_BURN

	var/obj/screen/novel_message/start_credits/nofade_simple/visuals = new /obj/screen/novel_message/start_credits/nofade_simple()
	visuals.maptext_x = 0
	visuals.maptext_y = -410
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 6 SECONDS)

/proc/episode4_maxteller5()
	var/novel_message = "С кузней Дворфа она на вряд ли сравнится, но слухай - главное что он сам доволен, да?"
	var/colored = COLOR_MEDICAL_BURN

	var/obj/screen/novel_message/start_credits/nofade_simple/visuals = new /obj/screen/novel_message/start_credits/nofade_simple()
	visuals.maptext_x = 0
	visuals.maptext_y = -410
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 6 SECONDS)

/proc/episode4_maxteller6()
	var/novel_message = "Он, наверное, сейчас в этом возрасте... когда пространство личное нужно."
	var/colored = COLOR_MEDICAL_BURN

	var/obj/screen/novel_message/start_credits/nofade_simple/visuals = new /obj/screen/novel_message/start_credits/nofade_simple()
	visuals.maptext_x = 0
	visuals.maptext_y = -410
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 6 SECONDS)

/proc/episode4_maxteller7()
	var/novel_message = "Седина не делает человека мудрее, ладно? О подобном лучше спросить у Златы. Или у На-... Нет, у Наи точно не стоит."
	var/colored = COLOR_MEDICAL_BURN

	var/obj/screen/novel_message/start_credits/nofade_simple/visuals = new /obj/screen/novel_message/start_credits/nofade_simple()
	visuals.maptext_x = 0
	visuals.maptext_y = -410
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 6 SECONDS)

/proc/episode4_maxteller8()
	var/novel_message = "Смотрите далее, в \"FINAL DESTINATION\""
	var/colored = COLOR_MEDICAL_BURN

	var/obj/screen/novel_message/start_credits/nofade_simple/visuals = new /obj/screen/novel_message/start_credits/nofade_simple()
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

/obj/effect/cutscene_camera/s2ep4sc4
	camera_id = "Сцена 4-2 - Кадр 3"

/obj/effect/cutscene_camera/s2ep4sc5
	camera_id = "Сцена 4-2 - Кадр 4"

/obj/effect/cutscene_camera/s2ep4sc6
	camera_id = "Сцена 4-2 - Кадр 5"

/obj/effect/cutscene_camera/s2ep4sc7
	camera_id = "Сцена 4-2 - Кадр 6"

/obj/effect/cutscene_camera/s2ep4sc8
	camera_id = "Сцена 4-2 - Кадр 7"

/obj/effect/cutscene_camera/s2ep4sc9
	camera_id = "Сцена 4-2 - Кадр 8"

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
		MOVE_CAMERA(0, 0, 12 SECONDS, LINEAR_EASING|EASE_IN),
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/orphansmaintheme.ogg', volume = 20), null),
		CHANGE_ACTOR_VISIBILITY(actor("Максим - 4-2-1"), 255, 2 SECONDS, SINE_EASING, ANIMATION_PARALLEL),
		SHIFT_ACTOR(actor("Максим - 4-2-1"), 0, 0, 6 SECONDS, CUBIC_EASING|EASE_OUT, ANIMATION_PARALLEL) = 2 SECONDS,
		TURN_ACTOR(actor("Максим - 4-2-1"), WEST) = 1 SECONDS,
		TURN_ACTOR(actor("Максим - 4-2-1"), SOUTH) = 1 SECONDS,
		TURN_ACTOR(actor("Максим - 4-2-1"), EAST) = 1 SECONDS,
		TURN_ACTOR(actor("Максим - 4-2-1"), SOUTH) = 0.5 SECONDS,
		MOVE_ACTOR(actor("Максим - 4-2-1"), SOUTH) = 0.5 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/s2ep4sc3)
	)

/datum/modular_cutscene/s2ep4sc3/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 4-2 - Кадр 2"),
		ADD_SCREEN(/cinema_borders),
		CALL_GLOB(episode4_maxteller2),
		MOVE_ACTOR(actor("Фиддлер - 4-2-2"), SOUTH) = 1 SECONDS,
		MOVE_ACTOR(actor("Фиддлер - 4-2-2"), SOUTH) = 1 SECONDS,
		MOVE_ACTOR(actor("Фиддлер - 4-2-2"), SOUTH) = 0.5 SECONDS,
		TURN_ACTOR(actor("Фиддлер - 4-2-2"), EAST),
		SHIFT_ACTOR(actor("Фиддлер - 4-2-2"), 15, 10, 0.5 SECONDS, CUBIC_EASING|EASE_OUT, null) = 3.5 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/s2ep4sc4)
	)

/datum/modular_cutscene/s2ep4sc4/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 4-2 - Кадр 3"),
		ADD_SCREEN(/cinema_borders),
		CALL_GLOB(episode4_maxteller3),
		MOVE_CAMERA(0, 0, 0, null),
		MOVE_ACTOR(actor("Амелия - 4-2-3"), SOUTH) = 2 SECONDS,
		TURN_ACTOR(actor("Канарис - 4-2-3"), SOUTH),
		TURN_ACTOR(actor("Адриано - 4-2-3"), WEST) = 1 SECONDS,
		CHANGE_ACTOR_VISUALS(actor("Амелия - 4-2-3"), "OP 1 - 2"),
		TURN_ACTOR(actor("Уфу - 4-2-3"), EAST) = 1 SECONDS,
		MOVE_CAMERA(-6, 0, 10 SECONDS, LINEAR_EASING|EASE_IN) = 2.5 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/s2ep4sc5)
	)

/datum/modular_cutscene/s2ep4sc5/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 4-2 - Кадр 4"),
		ADD_SCREEN(/cinema_borders),
		CALL_GLOB(episode4_maxteller4) = 8 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/s2ep4sc6)
	)

/datum/modular_cutscene/s2ep4sc6/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 4-2 - Кадр 5"),
		ADD_SCREEN(/cinema_borders),
		MOVE_CAMERA(5, 1, 0, null),
		MOVE_CAMERA(-6, 1, 10 SECONDS, LINEAR_EASING|EASE_IN),
		CALL_GLOB(episode4_maxteller5) = 3 SECONDS,
		SHIFT_ACTOR(actor("Луни - 4-2-5"), 0, 18, 0.5 SECONDS, CUBIC_EASING|EASE_OUT, null),
		CHANGE_ACTOR_VISUALS(actor("Луни - 4-2-5"), "EP4 PAGE 2 - 1") = 1 SECONDS,
		TURN_ACTOR(actor("Мясо - 4-2-5"), WEST) = 2 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/s2ep4sc7)
	)

/datum/modular_cutscene/s2ep4sc7/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 4-2 - Кадр 6"),
		ADD_SCREEN(/cinema_borders),
		CALL_GLOB(episode4_maxteller6),
		MOVE_CAMERA(5, 0, 0, null),
		MOVE_CAMERA(-6, 0, 12 SECONDS, LINEAR_EASING|EASE_IN) = 6 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/s2ep4sc8)
	)

/datum/modular_cutscene/s2ep4sc8/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 4-2 - Кадр 7"),
		ADD_SCREEN(/cinema_borders),
		CALL_GLOB(episode4_maxteller7),
		MOVE_ACTOR(actor("Оливия - 4-2-7"), NORTH),
		MOVE_ACTOR(actor("Фиддлер - 4-2-7"), NORTH) = 1 SECONDS,
		MOVE_ACTOR(actor("Оливия - 4-2-7"), NORTH) = 1 SECONDS,
		TURN_ACTOR(actor("Фиддлер - 4-2-7"), EAST),
		MOVE_ACTOR(actor("Оливия - 4-2-7"), NORTH),
		TURN_ACTOR(actor("Оливия - 4-2-7"), EAST) = 2 SECONDS,
		TURN_ACTOR(actor("Оливия - 4-2-7"), SOUTH) = 1 SECONDS,
		TURN_ACTOR(actor("Фиддлер - 4-2-7"), NORTH) = 1 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/s2ep4sc9)
	)

/datum/modular_cutscene/s2ep4sc9/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 4-2 - Кадр 8"),
		ADD_SCREEN(/cinema_borders),
		MOVE_CAMERA(0, 0, 0, null),
		CALL_GLOB(episode4_maxteller8) = 4 SECONDS,
		CHANGE_ACTOR_VISUALS(actor("Лира - 4-2-5"), "Current Alt"),
		SHIFT_ACTOR(actor("Луни - 4-2-5"), 0, 0, 0.5 SECONDS, CUBIC_EASING|EASE_OUT, null) = 2 SECONDS,
		ADD_SCREEN(/blackout),
		CALL_GLOB(episode4_name),
		CALL_GLOB(episode4_name2) = 10 SECONDS,
		RETURN_VIEWERS
	)
