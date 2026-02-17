#define FLASH_EVERYONE CALL(src, flash_everyone)
/datum/modular_cutscene/proc/flash_everyone()
	for(var/mob/viewer as() in camera_mobs)
		viewer.flash_eyes(FLASH_PROTECTION_MAJOR)

/proc/something_wrong()
	var/novel_message = "ЧТО-ТО НЕ ТАК"
	var/colored = COLOR_SABER_RED

	var/obj/screen/novel_message/start_credits/blinking/visuals = new /obj/screen/novel_message/start_credits/blinking()
	visuals.maptext_y = -60
	visuals.maptext_x = -80
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored)

/obj/effect/cutscene_camera/s2ep3sc12
	camera_id = "Сцена 3-2 - Кадр 1"

/obj/effect/cutscene_camera/s2ep3sc13
	camera_id = "Сцена 3-2 - Кадр 2"

/obj/effect/cutscene_camera/s2ep3sc14
	camera_id = "Сцена 3-2 - Кадр 3"

/proc/fds2ep3_cutscene2()
	start_cutscene(/datum/modular_cutscene/s2ep3sc12)

/datum/modular_cutscene/s2ep3sc12/setup_actions(...)
	actions = list(
		ADD_SCREEN(/blackout/animated_better) = 4 SECONDS,
		REMOVE_SCREEN(/blackout/animated_better, 1 SECONDS),
		TP_CAMERA("Сцена 3-2 - Кадр 1"),
		ADD_SCREEN(/cinema_borders),
		TALK_ACTOR(actor("Крис - 3-2-1"), "Куда же он..."),
		PLAY_SOUND(sound('sound/effects/footstep/plating3.ogg', volume = 70)),
		MOVE_ACTOR(actor("Крис - 3-2-1"), NORTH),
		TURN_ACTOR(actor("Крис - 3-2-1"), NORTH) = 4 SECONDS,
		TALK_ACTOR(actor("Крис - 3-2-1"), "Не могла же я его потерять?"),
		PLAY_SOUND(sound('sound/effects/footstep/plating1.ogg', volume = 70)),
		MOVE_ACTOR(actor("Крис - 3-2-1"), NORTH),
		TURN_ACTOR(actor("Крис - 3-2-1"), EAST) = 2 SECONDS,
		MOVE_ACTOR(actor("Крис - 3-2-1"), NORTH),
		PLAY_SOUND(sound('sound/effects/footstep/plating4.ogg', volume = 70)),
		TURN_ACTOR(actor("Крис - 3-2-1"), NORTH) = 2 SECONDS,
		TURN_ACTOR(actor("Крис - 3-2-1"), WEST) = 1 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/plating3.ogg', volume = 70)),
		MOVE_ACTOR(actor("Крис - 3-2-1"), WEST) = 2 SECONDS,
		TURN_ACTOR(actor("Крис - 3-2-1"), NORTH),
		PLAY_SOUND(sound('sound/effects/footstep/plating1.ogg', volume = 70)),
		MOVE_ACTOR(actor("Крис - 3-2-1"), WEST) = 2 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/plating3.ogg', volume = 70)),
		MOVE_ACTOR(actor("Крис - 3-2-1"), NORTH) = 2 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/plating3.ogg', volume = 70)),
		MOVE_ACTOR(actor("Крис - 3-2-1"), NORTH) = 1 SECONDS,
		TURN_ACTOR(actor("Крис - 3-2-1"), EAST) = 1 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/plating4.ogg', volume = 70)),
		MOVE_ACTOR(actor("Крис - 3-2-1"), EAST) = 2 SECONDS,
		TURN_ACTOR(actor("Крис - 3-2-1"), SOUTH),
		TALK_ACTOR(actor("Крис - 3-2-1"), "!опускается под стол, рыская в ящиках.") = 4 SECONDS,
		PLAY_SOUND(sound('packs/infinity/sound/effects/radio4.ogg', volume = 20)),
		TALK_ACTOR(actor("Радио - 3-2-1"), "$̶̷̲̅5̶̷̲̅8̶̷̲̅2̶̷̲̅9̶̷̲̅ᴜ̶̷̲̅5̶̷̲̅8̶̷̲̅9̶̷̲̅@̶̷̲̅$̶̷̲̅&̶̷̲̅#̶̷̲̅#̶̷̲̅-̶̷̲̅-̶̷̲̅ᴏ̶̷̲̅-̶̷̲̅^̶̷̲̅*̶̷̲̅1̶̷̲̅!̶̷̲̅ ") = 1 SECONDS,
		TALK_ACTOR(actor("Крис - 3-2-1"), "!резко поворачивает голову к интеркому."),
		TURN_ACTOR(actor("Крис - 3-2-1"), EAST) = 4 SECONDS,
		PLAY_SOUND(sound('packs/infinity/sound/effects/radio1.ogg', volume = 20)),
		TALK_ACTOR(actor("Радио - 3-2-1"), "@̶̷̲̅$̶̷̲̅&̶̷̲̅5̶̷̲̅8̶̷̲̅9̶̷̲̅@̶̷̲̅$̶̷̲̅&̶̷̲̅#̶̷̲̅$̶̷̲̅5̶̷̲̅8̶̷̲̅-̶̷̲̅-̶̷̲̅ᴏ̶̷̲̅-̶̷̲̅^̶̷̲̅*̶̷̲̅1̶̷̲̅!̶̷̲̅9̶̷̲̅@̶̷̲̅$̶̷̲̅&̶̷̲̅#̶̷̲̅#̶̷̲̅!̶̷̲̅!̶̷̲̅!̶̷̲̅ "),
		TALK_ACTOR(actor("Крис - 3-2-1"), "!подскакивает к устройству, начиная крутить тумблеры."),
		TURN_ACTOR(actor("Крис - 3-2-1"), NORTH),
		SHIFT_ACTOR(actor("Крис - 3-2-1"), 32, 15, 0.5 SECONDS, SINE_EASING|EASE_IN, null) = 2 SECONDS,
		PLAY_SOUND(sound('sound/effects/walkieon.ogg', volume = 20)),
		TALK_ACTOR(actor("Крис - 3-2-1"), "Приём?! Говорит форт \"Мантикора\"!") = 4 SECONDS,
		TALK_ACTOR(actor("Крис - 3-2-1"), "Приём! Мы едва вас слышим!") = 2 SECONDS,
		PLAY_SOUND(sound('packs/infinity/sound/effects/radio4.ogg', volume = 20)),
		TALK_ACTOR(actor("Радио - 3-2-1"), "Г̶̷̲̅о̶̷̲̅в̶̷̲̅0̶̷̲̅р̶̷̲̅и̶̷̲̅т̶̷̲̅ ̶̷̲̅#̶̷̲̅Э̶̷̲̅К̶̷̲̅ ̶̷̲̅Ф̶̷̲̅а̶̷̲̅к̶̷̲̅е̶̷̲̅л̶̷̲̅!̶̷̲̅ ̶̷̲̅М̶̷̲̅ы̶̷̲̅.̶̷̲̅.̶̷̲̅.̶̷̲̅-̶̷̲̅-̶̷̲̅-̶̷̲̅-̶̷̲̅-̶̷̲̅-̶̷̲̅-̶̷̲̅ ") = 2 SECONDS,
		PLAY_SOUND(sound('packs/infinity/sound/effects/radio1.ogg', volume = 20)),
		TALK_ACTOR(actor("Радио - 3-2-1"), "-̶̷̲̅-̶̷̲̅-̶̷̲̅-̶̷̲̅.̶̷̲̅.̶̷̲̅.̶̷̲̅к̶̷̲̅р̶̷̲̅у̶̷̲̅#̶̷̲̅е̶̷̲̅N̶̷̲̅и̶̷̲̅е̶̷̲̅.̶̷̲̅.̶̷̲̅.̶̷̲̅-̶̷̲̅-̶̷̲̅ ") = 2 SECONDS,
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/hathaway.ogg', volume = 30)),
		PLAY_SOUND(sound('sound/effects/explosionfar.ogg', volume = 40)),
		FLASH_EVERYONE,
		ADD_SCREEN(bluespace_affection) = 0.5 SECONDS,
		SHAKE_SCENE(10, 1),
		SHIFT_ACTOR(actor("Крис - 3-2-1"), 32, 0, 0.5 SECONDS, SINE_EASING|EASE_IN, null) = 2 SECONDS,
		CALL_GLOB(something_wrong) = 2 SECONDS,
		TURN_ACTOR(actor("Крис - 3-2-1"), WEST),
		TALK_ACTOR(actor("Крис - 3-2-1"), "Срань господня...") = 2 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/s2ep3sc13)
	)

/datum/modular_cutscene/s2ep3sc13/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 3-2 - Кадр 2"),
		ADD_SCREEN(/cinema_borders),
		MOVE_CAMERA(0, 5, 0, null),
		MOVE_CAMERA(0, 0, 10 SECONDS, SINE_EASING|EASE_IN),
		PLAY_SOUND(sound('sound/effects/footstep/asteroid2.ogg', volume = 70)),
		MOVE_ACTOR(actor("Люк - 3-2-2"), SOUTH) = 1 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/asteroid3.ogg', volume = 70)),
		MOVE_ACTOR(actor("Люк - 3-2-2"), SOUTH) = 1 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/asteroid4.ogg', volume = 70)),
		MOVE_ACTOR(actor("Уфурзар - 3-2-2"), SOUTH),
		MOVE_ACTOR(actor("Люк - 3-2-2"), SOUTH) = 2 SECONDS,
		TALK_ACTOR(actor("Люк - 3-2-2"), "Это ведь-...") = 2 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/asteroid1.ogg', volume = 70)),
		MOVE_ACTOR(actor("Павел - 3-2-2"), NORTH),
		TALK_ACTOR(actor("Люк - 3-2-2"), "Пап, это же те падающие звёзды, о которых ты мне рассказывал!"),
		TALK_ACTOR(actor("Люк - 3-2-2"), "!радостно тычет пальцем в небо."),
		TURN_ACTOR(actor("Люк - 3-2-2"), EAST) = 2 SECONDS,
		MOVE_ACTOR(actor("Павел - 3-2-2"), NORTH),
		PLAY_SOUND(sound('sound/effects/footstep/asteroid4.ogg', volume = 70)),
		MOVE_ACTOR(actor("Уфурзар - 3-2-2"), SOUTH) = 2 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/asteroid2.ogg', volume = 70)),
		MOVE_ACTOR(actor("Павел - 3-2-2"), NORTH),
		TALK_ACTOR(actor("Уфурзар - 3-2-2"), "!хмурится, принюхиваясь к воздуху.") = 2 SECONDS,
		PLAY_SOUND(sound('sound/effects/footstep/asteroid1.ogg', volume = 70)),
		MOVE_ACTOR(actor("Павел - 3-2-2"), NORTH),
		TURN_ACTOR(actor("Павел - 3-2-2"), EAST),
		TALK_ACTOR(actor("Уфурзар - 3-2-2"), "Не похожи.") = 2 SECONDS,
		TURN_ACTOR(actor("Павел - 3-2-2"), SOUTH) = 2 SECONDS,
		TALK_ACTOR(actor("Люк - 3-2-2"), "Что?... Но ведь-!"),
		MOVE_ACTOR(actor("Люк - 3-2-2"), EAST),
		TURN_ACTOR(actor("Люк - 3-2-2"), NORTH),
		TALK_ACTOR(actor("Эмми - 3-2-2"), "!снимает шлем."),
		CHANGE_ACTOR_VISUALS(actor("Эмми - 3-2-2"), "EP3 PAGE 1 - 12") = 2 SECONDS,
		TURN_ACTOR(actor("Люк - 3-2-2"), SOUTH),
		TALK_ACTOR(actor("Павел - 3-2-2"), "Он прав... звёзды так не падают.") = 4 SECONDS,
		TALK_ACTOR(actor("Павел - 3-2-2"), "Тут явно что-то нечистое.") = 2 SECONDS,
		TALK_ACTOR(actor("Эмми - 3-2-2"), "!кивает.") = 2 SECONDS,
		TALK_ACTOR(actor("Эмми - 3-2-2"), "Боюсь что...") = 2 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/s2ep3sc14)
	)

/datum/modular_cutscene/s2ep3sc14/setup_actions(...)
	actions = list(
		TP_CAMERA("Сцена 3-2 - Кадр 3"),
		ADD_SCREEN(/cinema_borders),
		TALK_ACTOR(actor("СиЭф - 3-2-3"), "...это нечто гораздо хуже.") = 4 SECONDS,
		ADD_SCREEN(/blackout/animated_better) = 6 SECONDS,
		RETURN_VIEWERS
	)
