//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// АССЕТЫ, НЕОБХОДИМЫЕ СЦЕНЕ //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/obj/effect/cutscene_camera/s2ep1sc3
	camera_id = "Сцена 3"

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// СКРИПТ СЦЕНЫ //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/proc/fds2ep1_sc3()
	start_cutscene(/datum/modular_cutscene/s2ep1sc3)

/datum/modular_cutscene/s2ep1sc3/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 3") = 3 SECONDS,
		MOVE_ACTOR(actor("Неизвестный 2"), SOUTH) = 2 SECONDS,

		MAKE_ACTOR_TALK(actor("Неизвестный 3"), "!запихивает самокрутку в щель шлема."),

		MOVE_ACTOR(actor("Неизвестный 2"), SOUTH),
		ROTATE_ACTOR(actor("Неизвестный 2"), WEST) = 2 SECONDS,
		MAKE_ACTOR_TALK(actor("Неизвестный 2"), "!забрасывает ружьё на плечо."),
		MOVE_ACTOR(actor("Неизвестный 2"), SOUTH),
		ROTATE_ACTOR(actor("Неизвестный 2"), SOUTH) = 1 SECONDS,

		MAKE_ACTOR_TALK(actor("Неизвестный 4"), "...ты серьёзно?"),

		MAKE_ACTOR_TALK(actor("Неизвестный 2"), "Капитан?"),

		CHANGE_ACTOR_VISUALS(actor("Рифлер"), "Leader 3") = 4 SECONDS,
		MAKE_ACTOR_TALK(actor("Рифлер"), "Перекур окончен.") = 4 SECONDS,
		MAKE_ACTOR_TALK(actor("Рифлер"), "Мы выдвигаемся немедленно."),
		ROTATE_ACTOR(actor("Рифлер"), NORTH),

		ROTATE_ACTOR(actor("Неизвестный 2"), WEST),

		MOVE_ACTOR(actor("Рифлер"), NORTH) = 1 SECONDS,

		MOVE_ACTOR(actor("Рифлер"), NORTH) = 1 SECONDS,
		MOVE_ACTOR(actor("Рифлер"), NORTH) = 5 SECONDS,
	)
