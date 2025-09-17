#define STYLE_FDFONT_OUTLINE(X, S, C1, C2) SPAN_STYLE("text-align: left; font-family: 'Small Fonts'; color: [C1]; -dm-text-outline: 1 [C2]; font-size: [S]px", "[X]")

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
	var/main_color = MANIFEST_COLOR_COMMAND
	var/support_color = COLOR_WHITE

	var/cutscene_id = "bebebe" //Переменная используемая в проке катсцен чтобы понимать хотим мы сейчас этого моба активировать или же нет

/mob/living/simple_animal/cutscene_character/Initialize()
	. = ..()

	maptext_name = image(loc = src, layer = ABOVE_LIGHTING_LAYER)
	maptext_name.plane = RUNECHAT_PLANE
	maptext_name.appearance_flags = APPEARANCE_UI_IGNORE_ALPHA | KEEP_APART
	maptext_name.maptext = STYLE_SMALLFONTS_OUTLINE("<center>[name]</center>", 7, main_color, support_color)
	maptext_name.maptext_height = 26
	maptext_name.maptext_width = 64
	maptext_name.maptext_x = -8
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

/mob/proc/move_cutscene_camera(atom/movable/UNIT, move_by_x = 0, move_by_y = 0, time_frame = 3 SECONDS)
	set waitfor = FALSE

	if(istype(UNIT, /mob))
		var/mob/user = UNIT

		var/client/client = user.client
		ADD_TRANSFORMATION_MOVEMENT_HANDLER(user)
		animate(client, pixel_y = move_by_y, pixel_x = move_by_x, time = time_frame, easing = SINE_EASING|EASE_IN)

		sleep(time_frame)
		DEL_TRANSFORMATION_MOVEMENT_HANDLER(user)
