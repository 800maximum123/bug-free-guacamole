/proc/terrascan1()
	var/novel_message = "/...PROCESSING DATA ||"
	var/colored = COLOR_ORANGE

	var/obj/screen/novel_message/start_credits/nofade_simple/visuals = new /obj/screen/novel_message/start_credits/nofade_simple()
	visuals.maptext_x = -110
	visuals.maptext_y = -160
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 5 SECONDS)

/proc/terrascan2()
	var/novel_message = "/...SCANNING RELATED AREA |||||"
	var/colored = COLOR_ORANGE

	var/obj/screen/novel_message/start_credits/nofade_simple/visuals = new /obj/screen/novel_message/start_credits/nofade_simple()
	visuals.maptext_x = -110
	visuals.maptext_y = -170
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 5 SECONDS)

/proc/terrascan3()
	var/novel_message = "/...CALCULATING POSSIBLE ROUTES |||||||"
	var/colored = COLOR_ORANGE

	var/obj/screen/novel_message/start_credits/nofade_simple/visuals = new /obj/screen/novel_message/start_credits/nofade_simple()
	visuals.maptext_x = -110
	visuals.maptext_y = -180
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 5 SECONDS)

/proc/terrascan4()
	var/novel_message = "|||SENDING DATA TO THE MAIN CORE|||"
	var/colored = COLOR_GREEN

	var/obj/screen/novel_message/start_credits/nofade_simple/visuals = new /obj/screen/novel_message/start_credits/nofade_simple()
	visuals.maptext_x = -110
	visuals.maptext_y = -200
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 5 SECONDS)

/obj/effect/cutscene_camera/s2ep4sc10
	camera_id = "Сцена 4-3 - Кадр 1"

/obj/effect/cutscene_camera/s2ep4sc11
	camera_id = "Сцена 4-3 - Кадр 2"

/obj/effect/cutscene_camera/s2ep4sc12
	camera_id = "Сцена 4-3 - Кадр 3"

/obj/effect/cutscene_camera/s2ep4sc13
	camera_id = "Сцена 4-3 - Кадр 4"

/obj/effect/cutscene_camera/s2ep4sc14
	camera_id = "Сцена 4-3 - Кадр 5"

/obj/effect/cutscene_camera/s2ep4sc15
	camera_id = "Сцена 4-3 - Кадр 6"

/obj/structure/fd/tacmap
	name = "tactical map"
	desc = "..."
	icon = 'maps/torch_doh/cutscenes/icons/wartable.dmi'
	icon_state = "wartable_on"

/proc/fds2ep4_cutscene3()
	start_cutscene(/datum/modular_cutscene/s2ep4sc10)

/datum/modular_cutscene/s2ep4sc10/setup_actions(...)
	actions = list(
		ADD_SCREEN(/blackout/animated_better) = 4 SECONDS,
		REMOVE_SCREEN(/blackout/animated_better, 1 SECONDS),
		TP_CAMERA("Сцена 4-3 - Кадр 1"),
		CALL_GLOB(terrascan1),
		ADD_SCREEN(/fishbed),
		ADD_SCREEN(/cinema_borders) = 6 SECONDS,
		CHANGE_VISION = 1 SECONDS,
		ADD_SCREEN(/blackout) = 0.5 SECONDS,
		CHANGE_VISION = 0.5 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/s2ep4sc11)
	)

/datum/modular_cutscene/s2ep4sc11/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 4-3 - Кадр 2"),
		REMOVE_SCREEN(/blackout, 0),
		CALL_GLOB(terrascan2),
		ADD_SCREEN(/fishbed),
		ADD_SCREEN(/cinema_borders) = 6 SECONDS,
		CHANGE_VISION = 1 SECONDS,
		ADD_SCREEN(/blackout) = 0.5 SECONDS,
		CHANGE_VISION = 0.5 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/s2ep4sc12)
	)

/datum/modular_cutscene/s2ep4sc12/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 4-3 - Кадр 3"),
		REMOVE_SCREEN(/blackout, 0),
		CALL_GLOB(terrascan3),
		ADD_SCREEN(/fishbed),
		ADD_SCREEN(/cinema_borders) = 6 SECONDS,
		CHANGE_VISION = 1 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/Steel.mp3', volume = 10)),
		ADD_SCREEN(/blackout) = 0.5 SECONDS,
		CHANGE_VISION = 0.5 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/s2ep4sc13)
	)

/datum/modular_cutscene/s2ep4sc13/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 4-3 - Кадр 4"),
		REMOVE_SCREEN(/blackout, 0),
		CALL_GLOB(terrascan4),
		ADD_SCREEN(/fishbed),
		ADD_SCREEN(/cinema_borders) = 6 SECONDS,

		MOVE_CAMERA(0, -5, 10 SECONDS, LINEAR_EASING|EASE_IN) = 5 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/s2ep4sc14)
	)

/datum/modular_cutscene/s2ep4sc14/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 4-3 - Кадр 5"),
		REMOVE_SCREEN(/fishbed, 0),
		TALK_ACTOR(actor("Терра"), "!опускает голову к голограмме.") = 2 SECONDS,
		TALK_ACTOR(actor("Терра"), "Главнокомандующий...") = 4 SECONDS,
		TALK_ACTOR(actor("Терра"), "...в какую же странную игру вы со мной играете?") = 4 SECONDS,
		ADD_SCREEN(/blackout) = 2 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/s2ep4sc15)
	)

/proc/cutscene_cinema_end()
	SSticker.forced_end = TRUE

/datum/modular_cutscene/s2ep4sc15/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 4-3 - Кадр 6"),
		REMOVE_SCREEN(/blackout, 0),
		MOVE_CAMERA(0, 0, 0, null),
		MOVE_CAMERA(0, -86, 56 SECONDS, LINEAR_EASING|EASE_IN) = 53 SECONDS,
		ADD_SCREEN(/blackout/animated_better) = 2 SECONDS,
		REMOVE_SCREEN(/blackout/animated_better, 0),
		CALL_GLOB(cutscene_cinema_end) = 31 SECONDS,
		MOVE_CAMERA(0, 0, 0, null) = 1 SECONDS,
		RETURN_VIEWERS
	)
