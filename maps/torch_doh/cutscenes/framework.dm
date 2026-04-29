#define STYLE_FDFONT_OUTLINE(X, S, C1, C2) SPAN_STYLE("text-align: left; font-family: 'Small Fonts'; color: [C1]; -dm-text-outline: 1 [C2]; font-size: [S]px", "[X]")

GLOBAL_VAR_INIT(stop_the_siren, FALSE)

/mob
	var/turf/remember_position
	var/remember_camera_size

	var/should_update_layer = FALSE
	var/forced_layer

/mob/living/simple_animal/cutscene_character
	name = "TEST"
	desc = "TEST"
	icon = 'mods/_fd/fd_assets/icons/animals/prime_soul.dmi'
	icon_state = "body"
	icon_living = "body"
	icon_dead = "body"
	response_help = "tries to poke"
	response_disarm = "shoves"
	response_harm = "hits"
	speed = 0
	movement_cooldown = 0
	maxHealth = 999999
	health = 999999
	a_intent = I_HELP
	faction = "cutscene"
	status_flags = GODMODE
	does_spin = FALSE
	density = FALSE
	anchored = TRUE
	pass_flags = PASS_FLAG_TABLE|PASS_FLAG_GLASS|PASS_FLAG_GRILLE
	mob_size = MOB_SMALL

	var/image/maptext_name
	var/should_show_name = TRUE
	var/main_color = MANIFEST_COLOR_COMMAND
	var/support_color = COLOR_WHITE

	var/cutscene_id = "bebebe" //Переменная используемая в проке катсцен чтобы понимать хотим мы сейчас этого моба активировать или же нет

/mob/living/simple_animal/cutscene_character/Initialize()
	. = ..()

	if(should_show_name)

		maptext_name = image(loc = src, layer = HUD_BASE_LAYER)
		maptext_name.plane = HUD_PLANE
		maptext_name.appearance_flags = APPEARANCE_UI_IGNORE_ALPHA | KEEP_APART
		maptext_name.maptext = STYLE_SMALLFONTS_OUTLINE("<center>[name]</center>", 7, main_color, support_color)
		maptext_name.maptext_height = 26
		maptext_name.maptext_width = 64
		maptext_name.maptext_x = -15
		maptext_name.maptext_y = -10

		AddOverlays(maptext_name)

/mob/living/simple_animal/cutscene_character/Life()
	. = ..()

	if(should_update_layer)
		layer = forced_layer

/mob/living/simple_animal/cutscene_character/proc/do_stuff() //Сюда писать всё что должен этот моб в сцене сделать
	return

/obj/screen/fullscreen/fd/blackout/animated // Отдельный вид блэкскрина, который нужен для плавного перехода сцены
	alpha = 0

	layer = 5.1

/obj/screen/fullscreen/fd/blackout/animated/Initialize()
	. = ..()
	SetTransform(10)
	animate(src, 3 SECOND, alpha = 255)

/obj/screen/fullscreen/fd/cinema_borders
	icon = 'maps/torch_doh/cutscenes/icons/fullscreen.dmi'
	icon_state = "cinematic_borders"
	allstate = 1
	plane = HUD_PLANE
	layer = HUD_ABOVE_HUD_LAYER

	scale_to_view = TRUE

/*/obj/screen/fullscreen/fd/cinema_borders/Initialize()
	. = ..()
	animate(src, 3 SECOND, alpha = 255)*/


/obj/screen/novel_message/start_credits
	layer = 5.2

/obj/screen/novel_message/start_credits/set_text(text, text_color, time = 5 SECONDS)
	var/countdown = time + 6 SECONDS

	animate(src, 3 SECOND, alpha = 255)
	maptext = STYLE_FDFONT_OUTLINE("[text]", 7, text_color, COLOR_WHITE)

	spawn(time)
		animate(src, 3 SECOND, alpha = 0)

		spawn(3 SECONDS)
			for(var/client/players in GLOB.clients)
				players.screen -= src

	QDEL_IN(src, countdown)

/obj/screen/novel_message/start_credits/nofade
	alpha = 255
/obj/screen/novel_message/start_credits/nofade/set_text(text, text_color, time = 5 SECONDS)
	maptext = STYLE_FDFONT_OUTLINE("[text]", 7, text_color, COLOR_WHITE)

	spawn(time)
		alpha = 0
		for(var/client/players in GLOB.clients)
			players.screen -= src

	QDEL_IN(src, time)

/obj/screen/novel_message/start_credits/nofade_simple
	alpha = 255
/obj/screen/novel_message/start_credits/nofade_simple/set_text(text, text_color, time = 5 SECONDS)
	maptext = "<span class='maptext' style='text-align: center; font-size: 300%; color: [text_color]'>[text]</span>"

	spawn(time)
		alpha = 0
		for(var/client/players in GLOB.clients)
			players.screen -= src

	QDEL_IN(src, time)

/obj/screen/novel_message/start_credits/big/set_text(text, text_color, time = 5 SECONDS)
	SetTransform(2)
	var/countdown = time + 6 SECONDS

	animate(src, 3 SECOND, alpha = 255)
	maptext = STYLE_FDFONT_OUTLINE("[text]", 7, text_color, COLOR_WHITE)

	spawn(time)
		animate(src, 3 SECOND, alpha = 0)

		spawn(3 SECONDS)
			for(var/client/players in GLOB.clients)
				players.screen -= src

	QDEL_IN(src, countdown)

/obj/screen/novel_message/start_credits/big_nofade
	alpha = 255

/obj/screen/novel_message/start_credits/big_nofade/set_text(text, text_color, time = 5 SECONDS)
	SetTransform(2)

	maptext = STYLE_FDFONT_OUTLINE("[text]", 7, text_color, COLOR_WHITE)

	spawn(time)
		alpha = 0
		for(var/client/players in GLOB.clients)
			players.screen -= src

	QDEL_IN(src, time)

/obj/screen/novel_message/start_credits/blinking
	layer = 5.4
	plane = 7

/obj/screen/novel_message/start_credits/blinking/set_text(text, text_color, time = 5 SECONDS)
	SetTransform(3)

	animate(src, 0.2 SECOND, alpha = 255)
	maptext = STYLE_SMALLFONTS_OUTLINE("<center>[text]</center>", 7, text_color, COLOR_WHITE)
	spawn(0.2 SECOND)
		animate(src, 0.2 SECOND, alpha = 0)
	spawn(0.4 SECOND)
		animate(src, 0.2 SECOND, alpha = 255)
	spawn(0.6 SECOND)
		animate(src, 0.2 SECOND, alpha = 0)
	spawn(0.8 SECOND)
		animate(src, 0.2 SECOND, alpha = 255)
	spawn(1 SECOND)
		animate(src, 0.2 SECOND, alpha = 0)
	spawn(1.2 SECOND)
		animate(src, 0.2 SECOND, alpha = 255)
	spawn(1.4 SECOND)
		animate(src, 0.2 SECOND, alpha = 0)
	spawn(1.6 SECOND)
		animate(src, 0.2 SECOND, alpha = 255)
	spawn(1.8 SECOND)
		animate(src, 0.2 SECOND, alpha = 0)
	spawn(2 SECOND)
		animate(src, 0.2 SECOND, alpha = 255)
	spawn(2.2 SECOND)
		animate(src, 0.2 SECOND, alpha = 0)
	spawn(2.4 SECOND)
		animate(src, 0.2 SECOND, alpha = 255)
	spawn(2.6 SECOND)
		animate(src, 0.2 SECOND, alpha = 0)
	spawn(2.8 SECOND)
		animate(src, 0.2 SECOND, alpha = 255)
	spawn(3 SECOND)
		animate(src, 0.2 SECOND, alpha = 0)
	spawn(3.2 SECOND)
		animate(src, 0.2 SECOND, alpha = 255)
	spawn(3.4 SECOND)
		animate(src, 0.2 SECOND, alpha = 0)
	spawn(3.6 SECOND)
		animate(src, 0.2 SECOND, alpha = 255)
	spawn(3.8 SECOND)
		animate(src, 0.2 SECOND, alpha = 0)
	spawn(4 SECOND)
		animate(src, 0.2 SECOND, alpha = 255)
	spawn(4.2 SECOND)
		animate(src, 0.2 SECOND, alpha = 0)
	spawn(4.4 SECOND)
		animate(src, 0.2 SECOND, alpha = 255)
	spawn(4.6 SECOND)
		animate(src, 0.2 SECOND, alpha = 0)
	spawn(4.8 SECOND)
		animate(src, 0.2 SECOND, alpha = 255)
	spawn(5 SECOND)
		animate(src, 0.2 SECOND, alpha = 0)
	spawn(5.2 SECOND)
		animate(src, 0.2 SECOND, alpha = 255)
	spawn(5.4 SECOND)
		animate(src, 0.2 SECOND, alpha = 0)
	spawn(5.6 SECOND)
		animate(src, 0.2 SECOND, alpha = 255)
	spawn(5.8 SECOND)
		animate(src, 0.2 SECOND, alpha = 0)
	spawn(6 SECOND)
		animate(src, 0.2 SECOND, alpha = 255)
	spawn(6.2 SECOND)
		animate(src, 0.2 SECOND, alpha = 0)
	spawn(6.4 SECOND)
		animate(src, 0.2 SECOND, alpha = 255)
	spawn(6.6 SECOND)
		animate(src, 0.2 SECOND, alpha = 0)

		spawn(0.2 SECONDS)
			for(var/client/players in GLOB.clients)
				players.screen -= src

	QDEL_IN(src, 6.8 SECONDS)

/obj/structure/fd/bodybag
	name = "body bag (UNKNOWN)"
	desc = "A plastic bag designed for the storage and transportation of cadavers. There's lies UNKNOWN."
	icon = 'icons/obj/closets/bodybag.dmi'
	icon_state = "closed"
	anchored = FALSE
	density = FALSE

/obj/structure/fd/bodybag/perci
	name = "body bag (Персиваль Эндсли)"
	desc = "A plastic bag designed for the storage and transportation of cadavers. В нём лежит Персиваль Эндсли."

/obj/structure/fd/bodybag/amper
	name = "body bag (Пауль Ампер)"
	desc = "A plastic bag designed for the storage and transportation of cadavers. В нём лежит Пауль Ампер."

/obj/structure/fd/bodybag/ranja
	name = "body bag (Ранжна Миин'хша)"
	desc = "A plastic bag designed for the storage and transportation of cadavers. В нём лежит Ранжна Миин'хша."

/obj/structure/fd/bodybag/ashira
	name = "body bag (Ашира Ми'Рахун)"
	desc = "A plastic bag designed for the storage and transportation of cadavers. В нём лежит Ашира Ми'Рахун."

/obj/structure/fd/bodybag/miriam
	name = "body bag (Мири'ам Йир'Хаару)"
	desc = "A plastic bag designed for the storage and transportation of cadavers. В нём лежит Мири'ам Йир'Хаару."

/obj/structure/fd/bodybag/kassius
	name = "body bag (Кассий Вейлдорн)"
	desc = "A plastic bag designed for the storage and transportation of cadavers. В нём лежит Кассий Вейлдорн."

/obj/structure/fd/bodybag/kassandra
	name = "body bag (Кассандра Де Виго)"
	desc = "A plastic bag designed for the storage and transportation of cadavers. В нём лежит Кассандра Де Виго."

/obj/structure/fd/bodybag/numeri
	name = "body bag (Нумерий Де Виго)"
	desc = "A plastic bag designed for the storage and transportation of cadavers. В нём лежит Нумерий Де Виго."

/obj/item/fd/perci_mvi
	name = "MVI Implant"
	desc = "Устройство, собранное Ампером и Мири'ам перед смертью. Что оно вообще делает?..."
	icon = 'mods/_fd/fd_assets/icons/obj/items/stock_parts.dmi'
	icon_state = "adv_scan_module"
	w_class = ITEM_SIZE_TINY
