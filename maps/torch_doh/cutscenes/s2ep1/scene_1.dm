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
	icon_state = "Amelia 2"
	icon_living = "Amelia 2"
	icon_dead = "Amelia 2"

/mob/living/simple_animal/cutscene_character/zlata
	name = "Злата С."
	desc = "..."
	icon = 'maps/torch_doh/cutscenes/icons/characters.dmi'
	icon_state = "Zlata"
	icon_living = "Zlata"
	icon_dead = "Zlata"

/mob/living/simple_animal/cutscene_character/zlata/s2ep1/part1_2
/mob/living/simple_animal/cutscene_character/zlata/s2ep1/part1_3

/mob/living/simple_animal/cutscene_character/maxim
	name = "Максим К."
	desc = "..."
	icon = 'maps/torch_doh/cutscenes/icons/characters.dmi'
	icon_state = "Maxim"
	icon_living = "Maxim"
	icon_dead = "Maxim"

/mob/living/simple_animal/cutscene_character/maxim/s2ep1/part1_2

/mob/living/simple_animal/cutscene_character/gora
	name = "Гора М."
	desc = "..."
	icon = 'maps/torch_doh/cutscenes/icons/characters.dmi'
	icon_state = "Gora"
	icon_living = "Gora"
	icon_dead = "Gora"

/mob/living/simple_animal/cutscene_character/gora/s2ep1/part1_2
	icon_state = "Gora 2 (justincase)"
	icon_living = "Gora 2 (justincase)"
	icon_dead = "Gora 2 (justincase)"

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

	spawn(48 SECONDS)
		animate(src, 3 SECOND, alpha = 255)

	spawn(52 SECONDS)
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

		animate(visuals, maptext_x = 50, 10 SECONDS, easing = SINE_EASING|EASE_IN, flags = ANIMATION_PARALLEL)

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
		playsound(choosen_player, 'maps/torch_doh/cutscenes/sounds/nuclear_klaxon.ogg', 40, FALSE)

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

				spawn(13 SECONDS)
					playsound(get_turf(G), 'sound/mecha/lowpowernano.ogg', 10)

		spawn(26 SECONDS)
			all.move_cutscene_camera(all, 0, -170, 23 SECONDS)

		spawn(28 SECONDS)
			credits_production()

		spawn(34 SECONDS)
			credits_author()

		spawn(51 SECONDS)
			sound_to(all.client, sound(null))

			for(var/obj/structure/fd/players_geter/s2ep1/part1_2/G in world)
				all.alpha = 0
				all.forceMove(G)
				repeating_siren(G)

		spawn(52 SECONDS)
			all.client.pixel_y = 0
			all.client.pixel_x = 160

		spawn(85 SECONDS)
			all.move_cutscene_camera(all, 0, 0, 10 SECONDS)

	spawn(26 SECONDS)
		for(var/mob/living/simple_animal/cutscene_character/C in world)
			if(C.cutscene_id != "s2ep1sc1pt11")
				continue
			C.do_stuff()

	spawn(54 SECONDS)
		for(var/mob/living/simple_animal/cutscene_character/C in world)
			if(C.cutscene_id != "s2ep1sc1pt12")
				continue
			C.do_stuff()

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// СКРИПТ ПЕРСОНАЖЕЙ В СЦЕНЕ //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/mob/living/simple_animal/cutscene_character/amelia/s2ep1/part1_1/do_stuff()
	forceMove(get_step(src, SOUTH))
	playsound(get_turf(src), 'sound/effects/footstep/plating1.ogg', 70)

	spawn(3 SECONDS)
		forceMove(get_step(src, SOUTH))
		playsound(get_turf(src), 'sound/effects/footstep/plating4.ogg', 70)

	spawn(6 SECONDS)
		dir = WEST
		ISay("!слегка пошатывается.")
		forceMove(get_step(src, SOUTH))
		playsound(get_turf(src), 'sound/effects/footstep/plating3.ogg', 70)

	spawn(9 SECONDS)
		dir = SOUTH
		forceMove(get_step(src, SOUTH))
		playsound(get_turf(src), 'sound/effects/footstep/plating1.ogg', 70)

	spawn(12 SECONDS)
		forceMove(get_step(src, SOUTH))
		playsound(get_turf(src), 'sound/effects/footstep/plating5.ogg', 70)

	spawn(15 SECONDS)
		ISay("!спотыкается.")
		animate(src, 0.3 SECONDS, transform = matrix(-15, MATRIX_ROTATE), easing = SINE_EASING, flags = ANIMATION_PARALLEL)
		animate(src, pixel_y = -3, 0.3 SECONDS, easing = JUMP_EASING|EASE_IN, flags = ANIMATION_PARALLEL)
		forceMove(get_step(src, SOUTH))
		playsound(get_turf(src), 'sound/effects/footstep/hull2.ogg', 70)
		playsound(get_turf(src), 'sound/effects/footstep/catwalk5.ogg', 70)
		animate(src, pixel_y = 0, 0.5 SECONDS, easing = SINE_EASING|EASE_OUT)
		animate(src, 0.4 SECONDS, transform = matrix(0, MATRIX_ROTATE), easing = SINE_EASING|EASE_OUT)
		ISay("З-зараза...")

	spawn(18 SECONDS)
		forceMove(get_step(src, SOUTH))
		playsound(get_turf(src), 'sound/effects/footstep/plating2.ogg', 70)

	spawn(21 SECONDS)
		ISay("!придерживает правую руку.")
		icon_state = "Amelia 2"
		forceMove(get_step(src, SOUTH))
		playsound(get_turf(src), 'sound/effects/footstep/plating1.ogg', 70)

	spawn(24 SECONDS)
		forceMove(get_step(src, SOUTH))
		playsound(get_turf(src), 'sound/effects/footstep/plating4.ogg', 70)

	spawn(27 SECONDS)
		forceMove(get_step(src, SOUTH))
		playsound(get_turf(src), 'sound/effects/footstep/plating3.ogg', 70)

/mob/living/simple_animal/cutscene_character/zlata/s2ep1/part1_2/do_stuff()
	forceMove(get_step(src, SOUTH))

	spawn(2 SECONDS)
		forceMove(get_step(src, SOUTH))

	spawn(3 SECONDS)
		dir = WEST
		ISay("Что с ней?")

	spawn(11 SECONDS)
		ISay("Наверное это самое безобидное ранение, которое я видела за сегодня...")

	spawn(14 SECONDS)
		ISay("!достаёт сканер.")
		ISay("Привести в чувства пробовал?")

	spawn(18 SECONDS)
		ISay("!вздыхает.")

	spawn(19 SECONDS)
		ISay("Тащи её на кушетку.")

	spawn(21 SECONDS)
		ISay("Я сейчас подойду.")

	spawn(25 SECONDS)
		dir = NORTH

	spawn(29 SECONDS)
		ISay("!опускает маску.")
		forceMove(get_step(src, SOUTH))
		icon_state = "Zlata 2"

	spawn(33 SECONDS)
		dir = WEST

	spawn(34 SECONDS)
		ISay("Амелия!")
		forceMove(get_step(src, WEST))

	spawn(34.5 SECONDS)
		forceMove(get_step(src, WEST))

	spawn(35 SECONDS)
		forceMove(get_step(src, WEST))

	spawn(35.5 SECONDS)
		forceMove(get_step(src, WEST))

	spawn(36 SECONDS)
		forceMove(get_step(src, WEST))

	spawn(36.5 SECONDS)
		forceMove(get_step(src, WEST))
		ISay("!хватает девушку в объятия.")

/mob/living/simple_animal/cutscene_character/maxim/s2ep1/part1_2/do_stuff()
	spawn(2 SECONDS)
		forceMove(get_step(src, NORTH))

	spawn(5 SECONDS)
		ISay("Кусок корпуса в лоб прилетел.")

	spawn(6 SECONDS)
		ISay("Нашёл уже в отключке.")

	spawn(16 SECONDS)
		ISay("Не отвечает.")

	spawn(23 SECONDS)
		ISay("!кивает.")

	spawn(25 SECONDS)
		forceMove(get_step(src, NORTH))

	spawn(28 SECONDS)
		forceMove(get_step(src, NORTH))

/mob/living/simple_animal/cutscene_character/gora/s2ep1/part1_2/do_stuff()
	spawn(2 SECONDS)
		forceMove(get_step(src, NORTH))
		pixel_y = -11

	spawn(25 SECONDS)
		forceMove(get_step(src, NORTH))
		pixel_y = -11

	spawn(28 SECONDS)
		forceMove(get_step(src, NORTH))
		pixel_y = -11

/mob/living/simple_animal/cutscene_character/amelia/s2ep1/part1_2/do_stuff()
	spawn(29 SECONDS)
		forceMove(get_step(src, EAST))

	spawn(32 SECONDS)
		forceMove(get_step(src, EAST))

	spawn(35 SECONDS)
		forceMove(get_step(src, EAST))

	spawn(36 SECONDS)
		forceMove(get_step(src, EAST))

	spawn(37 SECONDS)
		animate(src, pixel_x = 20, 0.3 SECONDS, easing = SINE_EASING|EASE_OUT)
