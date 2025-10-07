//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// АССЕТЫ, НЕОБХОДИМЫЕ СЦЕНЕ //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/obj/effect/cutscene_camera/s2ep1sc3
	camera_id = "Сцена 3"

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// СКРИПТ СЦЕНЫ //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/proc/fds2ep1_sc3()

	for(var/mob/all in GLOB.player_list)
		all.move_cutscene_camera(all, 0, 0, 10 SECONDS)

	start_cutscene(/datum/modular_cutscene/s2ep1sc3)

/datum/modular_cutscene/s2ep1sc3/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 3"),
		MOVE_ACTOR(actor("Неизвестный 2"), SOUTH) = 1 SECONDS,

		MAKE_ACTOR_TALK(actor("Неизвестный 3"), "!запихивает самокрутку в щель шлема."),

		ROTATE_ACTOR(actor("Неизвестный 2"), WEST),
		MOVE_ACTOR(actor("Неизвестный 2"), SOUTH) = 1 SECONDS,
		MAKE_ACTOR_TALK(actor("Неизвестный 2"), "!забрасывает ружьё на плечо."),
		ROTATE_ACTOR(actor("Неизвестный 2"), SOUTH),
		MOVE_ACTOR(actor("Неизвестный 2"), SOUTH) = 1 SECONDS,

		MAKE_ACTOR_TALK(actor("Неизвестный 4"), "...ты серьёзно?"),

		MAKE_ACTOR_TALK(actor("Неизвестный 2"), "Капитан?"),
	)
