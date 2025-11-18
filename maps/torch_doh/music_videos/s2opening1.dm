/*

00:01-00:02: По левой части экрана, снизу вверх, скользит лого ЦПСС
00:03-00:04: По правой части экрана, сверху вниз, скользит лого ГКК
00:05-00:06: По центру между ними появляется Браун. Он поворачивает голову влево
00:07-00:12: Камера делает пролёт в направлении его взгляда, демонстрируя нам коридор. С одной стороны стоит экипаж Факела, с другой он же (и возможно его команда)
00:13-00:22: Большой пролёт камеры наверх через окна над улицами. Появляется надпись "FINAL DESTINATION", и так же быстро исчезает

- Всегда казалось мне, что за поворотом встречу свой рассвет
00:23-00:28: Камера справа налево летит мимо Эмми, стоящей около сломанного меха. Справа выскакивает она же крупным планом

- Но осознала вдруг, что всю жизнь натыкаюсь на людской запрет
00:29-00:35: Кадр резко переключается на Лиру крупным планом(делать ли ей фейд?), которая чуть-чуть продолжает движение спрайта следом за Эмми.
Затем, резко поворачивается направо и камера улетает

- Пора оставить в покое дней минувших тени
00:36-00:38: Окита в толпе смотрит направо. Поверх накидываем крупняк

- Небо что-то да потеряло, манящее
00:39-00:42: Кадр резко переключается на другую сторону улицы и Луни. Он тянет руку в сторону Окиты и появляется его спрайт крупным планом

- Зачем же горести утраты мне подкосили колени
00:43-00:45: Кладбище. Адриано стоит перед мемориалом

- И омрачили сердце...
00:46-00:47:

- ...ГОРЯЩЕЕ?
00:48-00:49:


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


/mob/living/simple_animal/cutscene_character/amelia/s2ep2/big_version
	plane = HUD_PLANE
	mouse_opacity = FALSE
	alpha = 0

/mob/living/simple_animal/cutscene_character/amelia/s2ep2/big_version/Initialize()
	. = ..()
	SetTransform(13)

/mob/living/simple_animal/cutscene_character/amelia/s2ep2/big_version/Life()
	. = ..()
	layer = 4.9

/mob/living/simple_animal/cutscene_character/emmy/big_version
	plane = HUD_PLANE
	mouse_opacity = FALSE
	alpha = 0

/mob/living/simple_animal/cutscene_character/emmy/big_version/Initialize()
	. = ..()
	SetTransform(13)

/mob/living/simple_animal/cutscene_character/emmy/big_version/Life()
	. = ..()
	layer = 4.9

/mob/living/simple_animal/cutscene_character/luny/s2ep2/big_version
	plane = HUD_PLANE
	mouse_opacity = FALSE
	alpha = 0

/mob/living/simple_animal/cutscene_character/luny/s2ep2/big_version/Initialize()
	. = ..()
	SetTransform(13)

/mob/living/simple_animal/cutscene_character/luny/s2ep2/big_version/Life()
	. = ..()
	layer = 4.9

/mob/living/simple_animal/cutscene_character/lira/s2ep2/big_version
	plane = HUD_PLANE
	mouse_opacity = FALSE
	alpha = 0

/mob/living/simple_animal/cutscene_character/lira/s2ep2/big_version/Initialize()
	. = ..()
	SetTransform(13)

/mob/living/simple_animal/cutscene_character/lira/s2ep2/big_version/Life()
	. = ..()
	layer = 4.9

/mob/living/simple_animal/cutscene_character/actor
	name = "Массовка"
	desc = "..."
	icon = 'maps/torch_doh/cutscenes/icons/actor.dmi'
	icon_state = "actor"
	icon_living = "actor"
	icon_dead = "actor"
	should_show_name = FALSE

/mob/living/simple_animal/cutscene_character/actor/Initialize()
	. = ..()
	add_filter("distortion", 1, list("type" = "blur", "size" = 1))

/mob/living/simple_animal/cutscene_character/actor/downed/Initialize()
	. = ..()
	SetTransform(rotation = 90)

/mob/living/simple_animal/cutscene_character/okita
	name = "Окита Т."
	desc = "..."
	icon = 'maps/torch_doh/cutscenes/icons/npc_and_past_characters.dmi'
	icon_state = "okita_combat2"
	icon_living = "okita_combat2"
	icon_dead = "okita_combat2"
	should_show_name = FALSE

/mob/living/simple_animal/cutscene_character/okita/big_version
	plane = HUD_PLANE
	mouse_opacity = FALSE
	alpha = 0

/mob/living/simple_animal/cutscene_character/okita/big_version/Initialize()
	. = ..()
	SetTransform(13)

/mob/living/simple_animal/cutscene_character/okita/big_version/Life()
	. = ..()
	layer = 4.9

/mob/living/simple_animal/cutscene_character/adriano
	name = "Адриано М."
	desc = "..."
	icon = 'maps/torch_doh/cutscenes/icons/Character_Adriano.dmi'
	icon_state = "Current"
	icon_living = "Current"
	icon_dead = "Current"
	should_show_name = FALSE

/mob/living/simple_animal/cutscene_character/perci_robot
	name = "Персиваль 2.0"
	desc = "..."
	icon = 'maps/torch_doh/cutscenes/icons/Character_Perci.dmi'
	icon_state = "Current"
	icon_living = "Current"
	icon_dead = "Current"
	should_show_name = FALSE

/mob/living/simple_animal/cutscene_character/brownteam/ostin
	name = "Остин Г."
	desc = "..."
	icon = 'maps/torch_doh/cutscenes/icons/npc_and_past_characters.dmi'
	icon_state = "ostin equipped"
	icon_living = "ostin equipped"
	icon_dead = "ostin equipped"
	should_show_name = FALSE

/mob/living/simple_animal/cutscene_character/brownteam/anri
	name = "Анри"
	desc = "..."
	icon = 'maps/torch_doh/cutscenes/icons/npc_and_past_characters.dmi'
	icon_state = "anri clothing"
	icon_living = "anri clothing"
	icon_dead = "anri clothing"
	should_show_name = FALSE

/mob/living/simple_animal/cutscene_character/brownteam/ser
	name = "Сэр"
	desc = "..."
	icon = 'maps/torch_doh/cutscenes/icons/npc_and_past_characters.dmi'
	icon_state = "S.E.R"
	icon_living = "S.E.R"
	icon_dead = "S.E.R"
	should_show_name = FALSE

/mob/living/simple_animal/cutscene_character/brownteam/ser/Initialize()
	. = ..()
	SetTransform(2)

/mob/living/simple_animal/cutscene_character/brownteam/stan
	name = "Стэнли В."
	desc = "..."
	icon = 'maps/torch_doh/cutscenes/icons/npc_and_past_characters.dmi'
	icon_state = "stanley clothing"
	icon_living = "stanley clothing"
	icon_dead = "stanley clothing"
	should_show_name = FALSE

/mob/living/simple_animal/cutscene_character/brownteam/stone
	name = "Эмми С."
	desc = "..."
	icon = 'maps/torch_doh/cutscenes/icons/npc_and_past_characters.dmi'
	icon_state = "ammy clothing"
	icon_living = "ammy clothing"
	icon_dead = "ammy clothing"
	should_show_name = FALSE

/mob/living/simple_animal/cutscene_character/brownteam/baxter
	name = "Декстер Б."
	desc = "..."
	icon = 'maps/torch_doh/cutscenes/icons/npc_and_past_characters.dmi'
	icon_state = "baxter clothing"
	icon_living = "baxter clothing"
	icon_dead = "baxter clothing"
	should_show_name = FALSE

/mob/living/simple_animal/cutscene_character/brownteam/willhelm_original
	name = "Вильгельм К."
	desc = "..."
	icon = 'maps/torch_doh/cutscenes/icons/npc_and_past_characters.dmi'
	icon_state = "canaris_canon"
	icon_living = "canaris_canon"
	icon_dead = "canaris_canon"
	should_show_name = FALSE

/mob/living/simple_animal/cutscene_character/brownteam/bassow
	name = "Данил Б."
	desc = "..."
	icon = 'maps/torch_doh/cutscenes/icons/npc_and_past_characters.dmi'
	icon_state = "bassow"
	icon_living = "bassow"
	icon_dead = "bassow"
	should_show_name = FALSE

/mob/living/simple_animal/cutscene_character/brown
	name = "Майкл Б."
	desc = "..."
	icon = 'maps/torch_doh/cutscenes/icons/Character_Brown.dmi'
	icon_state = "Current"
	icon_living = "Current"
	icon_dead = "Current"
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
	layer = 4.9

/mob/living/simple_animal/cutscene_character/brown/big_version/shadow
	color = "#b40000"

/mob/living/simple_animal/cutscene_character/brown/big_version/shadow/Initialize()
	. = ..()

/mob/living/simple_animal/cutscene_character/brown/big_version/shadow/Life()
	. = ..()
	layer = 4.3

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

/obj/effect/cutscene_camera/s2op1/sc2
	camera_id = "Опенинг 1 - Кадр 2"

/obj/effect/cutscene_camera/s2op1/sc3
	camera_id = "Опенинг 1 - Кадр 3"

/obj/effect/cutscene_camera/s2op1/sc4
	camera_id = "Опенинг 1 - Кадр 4"

/obj/effect/cutscene_camera/s2op1/sc5
	camera_id = "Опенинг 1 - Кадр 5"

/proc/fds2op1()
	start_cutscene(/datum/modular_cutscene/fds2op1sc1)

/datum/modular_cutscene/fds2op1sc1/setup_actions(...)
	actions = list(
		ADD_SCREEN(/blackout/animated_better) = 4 SECONDS,
		REMOVE_SCREEN(/blackout/animated_better, 1 SECONDS),
		TP_CAMERA("Опенинг 1 - Кадр 1"),
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/again.ogg', volume = 50)),
		MOVE_CAMERA(40, -3, 0, null) = 1 SECOND,
		CHANGE_ACTOR_VISIBILITY(actor("Лого ЦПСС"), 255, 2 SECONDS, SINE_EASING, ANIMATION_PARALLEL),
		SHIFT_ACTOR(actor("Лого ЦПСС"), 32, 352, 12 SECONDS, LINEAR_EASING|EASE_IN, ANIMATION_PARALLEL) = 2 SECONDS,
		CHANGE_ACTOR_VISIBILITY(actor("Лого ГКК"), 255, 2 SECONDS, SINE_EASING, ANIMATION_PARALLEL),
		SHIFT_ACTOR(actor("Лого ГКК"), 32, -352, 12 SECONDS, LINEAR_EASING|EASE_IN, ANIMATION_PARALLEL) = 1 SECONDS,
		CHANGE_ACTOR_VISIBILITY(actor("Тень Брауна - Опенинг-1"), 150, 1 SECONDS, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Браун - Опенинг-1"), 255, 1 SECONDS, SINE_EASING, null) = 1 SECONDS,
		TURN_ACTOR(actor("Тень Брауна - Опенинг-1"), WEST),
		TURN_ACTOR(actor("Браун - Опенинг-1"), WEST) = 2 SECONDS,
		ADD_SCREEN(/cinema_borders),
		MOVE_CAMERA(0, -3, 3 SECONDS, CUBIC_EASING|EASE_OUT) = 4 SECONDS,
		MOVE_ACTOR(actor("Амелия - Опенинг-1"), EAST) = 0.5 SECONDS,
		CHANGE_ACTOR_VISIBILITY(actor("Браун - Опенинг-2"), 255, 0.5 SECONDS, LINEAR_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Амелия - Опенинг-2"), 255, 0.5 SECONDS, LINEAR_EASING, null) = 0.5 SECONDS,
		TURN_ACTOR(actor("Амелия - Опенинг-2"), NORTH),
		TURN_ACTOR(actor("Амелия - Опенинг-1"), NORTH),
		MOVE_ACTOR(actor("Амелия - Опенинг-1"), EAST) = 1 SECONDS,
		CALL_GLOB(fd_titledrop),
		MOVE_CAMERA(0, 30, 5 SECONDS, CUBIC_EASING|EASE_IN) = 3 SECONDS,
		CHANGE_ACTOR_VISIBILITY(actor("Лого ЦПСС"), 0, 0, null, null),
		CHANGE_ACTOR_VISIBILITY(actor("Лого ГКК"), 0, 0, null, null),
		ADD_SCREEN(/blackout/animated_better) = 7 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/fds2op1sc2)
	)

/datum/modular_cutscene/fds2op1sc2/setup_actions(...)
	actions = list(
		TP_CAMERA("Опенинг 1 - Кадр 2"),
		ADD_SCREEN(/cinema_borders),
		MOVE_CAMERA(15, 0, 0, null),
		MOVE_CAMERA(-1, 0, 10 SECONDS, CUBIC_EASING|EASE_OUT) = 2 SECONDS,
		CHANGE_ACTOR_VISIBILITY(actor("Эмми - Опенинг-1"), 255, 0.5 SECONDS, SINE_EASING, ANIMATION_PARALLEL),
		SHIFT_ACTOR(actor("Эмми - Опенинг-1"), 0, -96, 10 SECONDS, LINEAR_EASING|EASE_IN, ANIMATION_PARALLEL) = 4 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/fds2op1sc3)
	)

/datum/modular_cutscene/fds2op1sc3/setup_actions(...)
	actions = list(
		TP_CAMERA("Опенинг 1 - Кадр 3"),
		ADD_SCREEN(/cinema_borders),
		CHANGE_ACTOR_VISIBILITY(actor("Лира - Опенинг-1"), 255, 0, null, null),
		SHIFT_ACTOR(actor("Лира - Опенинг-1"), 0, -32, 20 SECONDS, LINEAR_EASING|EASE_IN, ANIMATION_PARALLEL) = 3 SECONDS,
		TURN_ACTOR(actor("Лира - Опенинг-1"), EAST) = 1 SECONDS,
		MOVE_CAMERA(20, 0, 5 SECONDS, SINE_EASING|EASE_OUT) = 3 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/fds2op1sc4)
	)

/datum/modular_cutscene/fds2op1sc4/setup_actions(...)
	actions = list(
		TP_CAMERA("Опенинг 1 - Кадр 4"),
		ADD_SCREEN(/cinema_borders),
		MOVE_CAMERA(0, 0, 0, null),
		MOVE_CAMERA(3, 0, 7 SECONDS, LINEAR_EASING|EASE_IN),
		CHANGE_ACTOR_VISIBILITY(actor("Окита - Опенинг-1"), 255, 0, null, null) = 3 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/fds2op1sc5)
	)

/datum/modular_cutscene/fds2op1sc5/setup_actions(...)
	actions = list(
		TP_CAMERA("Опенинг 1 - Кадр 5"),
		ADD_SCREEN(/cinema_borders),
		MOVE_ACTOR(actor("Луни - Опенинг-1"), WEST) = 1 SECONDS,
		CHANGE_ACTOR_VISUALS(actor("Луни - Опенинг-1"), "OP 1 - 1"),
		SHIFT_ACTOR(actor("Луни - Опенинг-1"), -16, 0, 2 SECONDS, SINE_EASING|EASE_IN, null) = 0.5 SECONDS,
		CHANGE_ACTOR_VISIBILITY(actor("Луни - Опенинг-2"), 255, 1 SECONDS, SINE_EASING, ANIMATION_PARALLEL),
		SHIFT_ACTOR(actor("Луни - Опенинг-2"), -16, -64, 2 SECONDS, SINE_EASING|EASE_IN, ANIMATION_PARALLEL) = 2.5 SECONDS,
	)
