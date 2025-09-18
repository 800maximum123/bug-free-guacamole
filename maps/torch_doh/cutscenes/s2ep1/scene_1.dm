//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// АССЕТЫ, НЕОБХОДИМЫЕ СЦЕНЕ //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/obj/structure/fd/players_geter/s2ep1/part1_1 // Шот коридора

/obj/structure/fd/players_geter/s2ep1/part1_2 // Шот предбанника медблока

/obj/structure/fd/players_geter/s2ep1/part1_3 // Шот операционной

/mob/living/simple_animal/cutscene_character/amelia
	name = "Амелия Б."
	desc = "..."
	icon = 'maps/torch_doh/cutscenes/icons/characters.dmi'
	icon_state = "Amelia"
	icon_living = "Amelia"
	icon_dead = "Amelia"

/mob/living/simple_animal/cutscene_character/amelia/s2ep1/part1_1
/mob/living/simple_animal/cutscene_character/amelia/s2ep1/part1_2

/mob/living/simple_animal/cutscene_character/zlata
	name = "Злата С."
	desc = "..."
	icon = 'mods/_fd/fd_assets/icons/animals/prime_soul.dmi'
	icon_state = "body"
	icon_living = "body"
	icon_dead = "body"

/mob/living/simple_animal/cutscene_character/zlata/s2ep1/part1_2
/mob/living/simple_animal/cutscene_character/zlata/s2ep1/part1_3

/mob/living/simple_animal/cutscene_character/maxim
	name = "Максим К."
	desc = "..."
	icon = 'mods/_fd/fd_assets/icons/animals/prime_soul.dmi'
	icon_state = "body"
	icon_living = "body"
	icon_dead = "body"

/mob/living/simple_animal/cutscene_character/maxim/s2ep1/part1_2

/mob/living/simple_animal/cutscene_character/gora
	name = "Гора М."
	desc = "..."
	icon = 'mods/_fd/fd_assets/icons/animals/prime_soul.dmi'
	icon_state = "body"
	icon_living = "body"
	icon_dead = "body"

/mob/living/simple_animal/cutscene_character/gora/s2ep1/part1_2

/mob/living/simple_animal/cutscene_character/datura
	name = "Реймонд Д."
	desc = "..."
	icon = 'mods/_fd/fd_assets/icons/animals/prime_soul.dmi'
	icon_state = "body"
	icon_living = "body"
	icon_dead = "body"

/mob/living/simple_animal/cutscene_character/datura/s2ep1/part1_3

/mob/living/simple_animal/cutscene_character/perci
	name = "Персиваль Э."
	desc = "..."
	icon = 'mods/_fd/fd_assets/icons/animals/prime_soul.dmi'
	icon_state = "body"
	icon_living = "body"
	icon_dead = "body"

/mob/living/simple_animal/cutscene_character/perci/s2ep1/part1_3

/mob/living/simple_animal/cutscene_character/luny
	name = "Луни"
	desc = "..."
	icon = 'mods/_fd/fd_assets/icons/animals/prime_soul.dmi'
	icon_state = "body"
	icon_living = "body"
	icon_dead = "body"

/mob/living/simple_animal/cutscene_character/luny/s2ep1/part1_3

/obj/screen/fullscreen/fd/blackout/animated/s2ep1sc1/Initialize()
	. = ..()
	spawn(25 SECONDS)
		animate(src, 3 SECOND, alpha = 0)

	spawn(44 SECONDS)
		animate(src, 3 SECOND, alpha = 255)

	spawn(48 SECONDS)
		animate(src, 3 SECOND, alpha = 0)

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

/proc/credits_team()
	var/novel_message = "КОМАНДА \"UNDERGROUND FRONT\""
	var/colored = COLOR_ASSEMBLY_BLACK

	var/obj/screen/novel_message/start_credits/big/visuals = new /obj/screen/novel_message/start_credits/big()
	visuals.maptext_y = -80
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 12 SECONDS)

/proc/credits_show()
	var/novel_message = "ПРЕДСТАВЛЯЕТ"
	var/colored = COLOR_ASSEMBLY_BLACK

	var/obj/screen/novel_message/start_credits/big/visuals = new /obj/screen/novel_message/start_credits/big()
	visuals.maptext_y = -100
	visuals.maptext_x = 25
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 12 SECONDS)

/proc/credits_production()
	var/novel_message = "ПРОДЮСИРОВАНИЕ DOCTOR ALEX'A"
	var/colored = COLOR_ASSEMBLY_BLACK

	var/obj/screen/novel_message/start_credits/visuals = new /obj/screen/novel_message/start_credits()
	visuals.maptext_x = -110
	visuals.maptext_y = -5
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 16 SECONDS)

/proc/credits_author()
	var/novel_message = "ФИЛЬМ SWIFT0"
	var/colored = COLOR_ASSEMBLY_BLACK

	var/obj/screen/novel_message/start_credits/visuals = new /obj/screen/novel_message/start_credits()
	visuals.maptext_x = -100
	visuals.maptext_y = -15
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 18 SECONDS)

		animate(visuals, maptext_x = 30, 3 SECONDS, easing = SINE_EASING|EASE_IN, flags = ANIMATION_PARALLEL)

/proc/credits_writer()
	var/novel_message = "СЦЕНАРИСТ И РЕЖИССЁР ПОСТАНОВКИ: DOCTOR ALEX"
	var/colored = COLOR_ASSEMBLY_BLACK

	var/obj/screen/novel_message/start_credits/visuals = new /obj/screen/novel_message/start_credits()
	visuals.maptext_x = -110
	visuals.maptext_y = -40
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 12 SECONDS)

/proc/credits_mapper()
	var/novel_message = "АРХИТЕКТОР И ПРОЕКТИРОВЩИК ЛОКАЦИЙ: PALERNO"
	var/colored = COLOR_ASSEMBLY_BLACK

	var/obj/screen/novel_message/start_credits/visuals = new /obj/screen/novel_message/start_credits()
	visuals.maptext_x = -110
	visuals.maptext_y = -60
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored)

/proc/repeating_siren(atom/search_in)
	var/atom/play_on_next = search_in

	for(var/mob/all in search_in)
		var/list/players_on_point = list()
		players_on_point += all

		var/mob/choosen_player = pick(players_on_point)
		playsound(choosen_player, 'maps/torch_doh/cutscenes/sounds/nuclear_klaxon.ogg', 70, FALSE)

	spawn(14 SECONDS)
		if(GLOB.stop_the_siren)
			return
		repeating_siren(play_on_next)

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// СКРИПТ СЦЕНЫ //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/proc/fds2ep1_sc1()

	for(var/mob/all in GLOB.player_list)
		all.remember_position = get_turf(all.loc)
		all.remember_camera_size = all.client.view

		all.overlay_fullscreen("borders", /obj/screen/fullscreen/fd/cinema_borders)
		all.overlay_fullscreen("blackscreen", /obj/screen/fullscreen/fd/blackout/animated/s2ep1sc1)
		all.SetStunned(999999)

		all.client.view = 7

		spawn(5 SECONDS)
			credits_team()
		spawn(7 SECONDS)
			credits_show()

		spawn(25 SECONDS)

			for(var/obj/structure/fd/players_geter/s2ep1/part1_1/G in world)
				all.alpha = 0
				all.forceMove(G)
				repeating_siren(G)

		spawn(26 SECONDS)
			all.move_cutscene_camera(all, 0, -160, 20 SECONDS)

		spawn(28 SECONDS)
			credits_production()

		spawn(34 SECONDS)
			credits_author()

		spawn(47 SECONDS)

			for(var/obj/structure/fd/players_geter/s2ep1/part1_2/G in world)
				all.alpha = 0
				all.forceMove(G)
				repeating_siren(G)

		spawn(48 SECONDS)
			all.client.pixel_y = 0
			all.client.pixel_x = 160

	spawn(26 SECONDS)
		for(var/mob/living/simple_animal/cutscene_character/C in world)
			if(C.cutscene_id != "s2ep1sc1pt11")
				continue
			C.do_stuff()

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// СКРИПТ ПЕРСОНАЖЕЙ В СЦЕНЕ //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/mob/living/simple_animal/cutscene_character/amelia/s2ep1/part1_1/do_stuff()
	forceMove(get_step(src, SOUTH))

	spawn(3 SECONDS)
		forceMove(get_step(src, SOUTH))

	spawn(6 SECONDS)
		dir = WEST
		ISay("!слегка пошатывается.")
		forceMove(get_step(src, SOUTH))

	spawn(9 SECONDS)
		dir = SOUTH
		forceMove(get_step(src, SOUTH))

	spawn(12 SECONDS)
		forceMove(get_step(src, SOUTH))

	spawn(15 SECONDS)
		ISay("!спотыкается.")
		animate(src, 0.3 SECONDS, transform = matrix(-15, MATRIX_ROTATE), easing = SINE_EASING, flags = ANIMATION_PARALLEL)
		animate(src, pixel_y = -3, 0.3 SECONDS, easing = JUMP_EASING|EASE_IN, flags = ANIMATION_PARALLEL)
		forceMove(get_step(src, SOUTH))
		animate(src, pixel_y = 0, 0.5 SECONDS, easing = SINE_EASING|EASE_OUT)
		animate(src, 0.4 SECONDS, transform = matrix(0, MATRIX_ROTATE), easing = SINE_EASING|EASE_OUT)
		ISay("З-зараза...")

	spawn(18 SECONDS)
		forceMove(get_step(src, SOUTH))

	spawn(21 SECONDS)
		ISay("!придерживает правую руку.")
		forceMove(get_step(src, SOUTH))

	spawn(24 SECONDS)
		forceMove(get_step(src, SOUTH))
