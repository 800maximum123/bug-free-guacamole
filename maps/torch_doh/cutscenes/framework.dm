#define STYLE_FDFONT_OUTLINE(X, S, C1, C2) SPAN_STYLE("text-align: left; font-family: 'Small Fonts'; color: [C1]; -dm-text-outline: 1 [C2]; font-size: [S]px", "[X]")

GLOBAL_VAR_INIT(stop_the_siren, FALSE)

/mob
	var/turf/remember_position
	var/remember_camera_size

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

		maptext_name = image(loc = src, layer = ABOVE_LIGHTING_LAYER)
		maptext_name.plane = RUNECHAT_PLANE
		maptext_name.appearance_flags = APPEARANCE_UI_IGNORE_ALPHA | KEEP_APART
		maptext_name.maptext = STYLE_SMALLFONTS_OUTLINE("<center>[name]</center>", 7, main_color, support_color)
		maptext_name.maptext_height = 26
		maptext_name.maptext_width = 64
		maptext_name.maptext_x = -15
		maptext_name.maptext_y = -10

		AddOverlays(maptext_name)

/mob/living/simple_animal/cutscene_character/proc/do_stuff() //Сюда писать всё что должен этот моб в сцене сделать
	return

/obj/structure/fd/players_geter // Для каждой катсцены создаём свой отдельный сабтайп!!! Нужен только для того чтобы телепортировать на него
	icon = 'mods/_fd/event_tools/icons/landmarks_static.dmi'
	icon_state = "generic_event"

	invisibility = 50

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
	alpha = 0

/obj/screen/fullscreen/fd/cinema_borders/Initialize()
	. = ..()
	animate(src, 3 SECOND, alpha = 255)


/obj/screen/novel_message/start_credits
	layer = 5.2

/obj/screen/novel_message/start_credits/set_text(text, text_color, time = 5 SECONDS)
	var/countdown = time + 6 SECONDS

	animate(src, 3 SECOND, alpha = 255)
	maptext = STYLE_FDFONT_OUTLINE("[text]", 7, text_color, COLOR_WHITE)

	spawn(time)
		animate(src, 3 SECOND, alpha = 0)

	QDEL_IN(src, countdown)

/obj/screen/novel_message/start_credits/big/set_text(text, text_color, time = 5 SECONDS)
	SetTransform(2)
	var/countdown = time + 6 SECONDS

	animate(src, 3 SECOND, alpha = 255)
	maptext = STYLE_FDFONT_OUTLINE("[text]", 7, text_color, COLOR_WHITE)

	spawn(time)
		animate(src, 3 SECOND, alpha = 0)

	QDEL_IN(src, countdown)

/obj/screen/novel_message/start_credits/blinking
	layer = 5.4

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

	QDEL_IN(src, 1.6 SECONDS)
