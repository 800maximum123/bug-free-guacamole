/*

00:01-00:02: По левой части экрана, снизу вверх, скользит лого ЦПСС
00:03-00:04: По правой части экрана, сверху вниз, скользит лого ГКК
00:05-00:06: По центру между ними появляется Браун. Он поворачивает голову влево
00:07-00:12: Камера делает пролёт в направлении его взгляда, демонстрируя нам коридор. С одной стороны стоит экипаж Факела, с другой он же и его команда
00:13-00:22: Большой пролёт камеры наверх через окна над улицами. Появляется надпись "FINAL DESTINATION", и так же быстро исчезает

*/

/proc/fd_titledrop()
	var/novel_message = "\"FINAL DESTINATION\""
	var/colored = COLOR_ASSEMBLY_BLACK

	var/obj/screen/novel_message/start_credits/big/visuals = new /obj/screen/novel_message/start_credits/big()
	visuals.maptext_y = -80
	visuals.maptext_x = 15
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 6 SECONDS)

/mob/living/simple_animal/cutscene_character/brown
	name = "Майкл Б."
	desc = "..."
	icon = 'maps/torch_doh/cutscenes/icons/Character_Brown.dmi'
	icon_state = "Naked"
	icon_living = "Naked"
	icon_dead = "Naked"
	should_show_name = FALSE

/mob/living/simple_animal/cutscene_character/brown/big_version
	plane = HUD_PLANE
	mouse_opacity = FALSE
	alpha = 0

/mob/living/simple_animal/cutscene_character/brown/big_version/Initialize()
	. = ..()
	SetTransform(13)

/mob/living/simple_animal/cutscene_character/brown/big_version/Life()
	. = ..()
	layer = 4.10

// Да, это персонажи. Почему? Потому что таким образом мне проще манипулировать анимациями
/mob/living/simple_animal/cutscene_character/scg_seal
	icon = 'maps/torch/icons/obj/solgov-decals.dmi'
	icon_state = "solgov_realseal"
	plane = HUD_PLANE

	name = "Лого ЦПСС"
	mouse_opacity = FALSE
	should_show_name = FALSE
	alpha = 0

/mob/living/simple_animal/cutscene_character/scg_seal/Initialize()
	. = ..()
	SetTransform(11)

/mob/living/simple_animal/cutscene_character/iccgn_seal
	icon = 'mods/_fd/_maps/gccv_ulyanovsk/icons/ulyanovsk.dmi'
	icon_state = "iccg_seal"
	plane = HUD_PLANE

	name = "Лого ГКК"
	mouse_opacity = FALSE
	should_show_name = FALSE
	alpha = 0

/mob/living/simple_animal/cutscene_character/iccgn_seal/Initialize()
	. = ..()
	SetTransform(11)

/obj/effect/cutscene_camera/s2op1/sc1
	camera_id = "Опенинг 1 - Кадр 1"

/proc/fds2op1()
	start_cutscene(/datum/modular_cutscene/fds2op1sc1)

/datum/modular_cutscene/fds2op1sc1/setup_actions(...)
	actions = list(
		ADD_SCREEN(/blackout/animated_better) = 4 SECONDS,
		REMOVE_SCREEN(/blackout/animated_better, 1 SECONDS),
		TP_CAMERA("Опенинг 1 - Кадр 1"),
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/again.ogg', volume = 50)),
		MOVE_CAMERA(40, 0, 0, null) = 1 SECOND,
		CHANGE_ACTOR_VISIBILITY(actor("Лого ЦПСС"), 255, 2 SECONDS, SINE_EASING, ANIMATION_PARALLEL),
		SHIFT_ACTOR(actor("Лого ЦПСС"), 32, 352, 12 SECONDS, LINEAR_EASING|EASE_IN, ANIMATION_PARALLEL) = 2 SECONDS,
		CHANGE_ACTOR_VISIBILITY(actor("Лого ГКК"), 255, 2 SECONDS, SINE_EASING, ANIMATION_PARALLEL),
		SHIFT_ACTOR(actor("Лого ГКК"), 32, -352, 12 SECONDS, LINEAR_EASING|EASE_IN, ANIMATION_PARALLEL) = 1 SECONDS,
		CHANGE_ACTOR_VISIBILITY(actor("Браун - Опенинг-1"), 255, 1 SECONDS, SINE_EASING, null) = 1 SECONDS,
		TURN_ACTOR(actor("Браун - Опенинг-1"), WEST) = 2 SECONDS,
		ADD_SCREEN(/cinema_borders),
		MOVE_CAMERA(0, 0, 3 SECONDS, CUBIC_EASING|EASE_OUT) = 6 SECONDS,
		CALL_GLOB(fd_titledrop),
		MOVE_CAMERA(0, 30, 5 SECONDS, CUBIC_EASING|EASE_IN) = 3 SECONDS,
		ADD_SCREEN(/blackout/animated_better) = 7 SECONDS,
		REMOVE_SCREEN(/blackout/animated_better, 0)
	)
