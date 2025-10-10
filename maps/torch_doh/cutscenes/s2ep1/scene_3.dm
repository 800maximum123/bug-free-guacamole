//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// АССЕТЫ, НЕОБХОДИМЫЕ СЦЕНЕ //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/obj/effect/cutscene_camera/s2ep1sc9
	camera_id = "Сцена 9"

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// СКРИПТ СЦЕНЫ //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/datum/modular_cutscene/s2ep1sc9/setup_actions(...)
	actions = list(
		ADD_SCREEN(/blackout/animated_better) = 6 SECONDS,
		REMOVE_SCREEN(/blackout/animated_better, 1 SECONDS) = 0.1 SECONDS,
		TP_CAMERA("Сцена 3"),
		ADD_SCREEN(/blackout/animated_better/nofade) = 1 SECONDS,
		REMOVE_SCREEN(/blackout/animated_better/nofade, 3 SECONDS) = 1 SECONDS,
		MOVE_ACTOR(actor("Неизвестный 2"), SOUTH) = 2 SECONDS,

		TALK_ACTOR(actor("Неизвестный 3"), "!запихивает самокрутку в щель шлема."),

		MOVE_ACTOR(actor("Неизвестный 2"), SOUTH),
		TURN_ACTOR(actor("Неизвестный 2"), WEST) = 2 SECONDS,
		TALK_ACTOR(actor("Неизвестный 2"), "!забрасывает ружьё на плечо."),
		MOVE_ACTOR(actor("Неизвестный 2"), SOUTH),
		TURN_ACTOR(actor("Неизвестный 2"), SOUTH) = 1 SECONDS,

		TALK_ACTOR(actor("Неизвестный 4"), "...ты серьёзно?"),

		TALK_ACTOR(actor("Неизвестный 2"), "Капитан?") = 2 SECONDS,

		CHANGE_ACTOR_VISUALS(actor("Рифлер"), "Leader 3"),
		TALK_ACTOR(actor("Рифлер"), "Перекур окончен.") = 4 SECONDS,
		TURN_ACTOR(actor("Рифлер"), NORTH),

		TURN_ACTOR(actor("Неизвестный 2"), WEST),

		MOVE_ACTOR(actor("Рифлер"), NORTH) = 1 SECONDS,
		TALK_ACTOR(actor("Рифлер"), "Выдвигаемся немедленно."),

		ADD_SCREEN(/blackout/animated_better),

		MOVE_ACTOR(actor("Рифлер"), NORTH) = 1 SECONDS,
		MOVE_ACTOR(actor("Рифлер"), NORTH) = 5 SECONDS,
	)
