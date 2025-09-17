//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// АССЕТЫ, НЕОБХОДИМЫЕ СЦЕНЕ //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/obj/structure/fd/players_geter/s2ep1/part1_1 // Шот коридора

/obj/structure/fd/players_geter/s2ep1/part1_2 // Шот предбанника медблока

/obj/structure/fd/players_geter/s2ep1/part1_3 // Шот операционной

/mob/living/simple_animal/cutscene_character/amelia
	name = "Амелия Б."
	desc = "..."
	icon = 'mods/_fd/fd_assets/icons/animals/prime_soul.dmi'
	icon_state = "body"
	icon_living = "body"
	icon_dead = "body"

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
	animate(src, 20 SECOND, alpha = 0)

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
	visuals.maptext_y = -120
	visuals.maptext_x = 40
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 12 SECONDS)

/proc/credits_show()
	var/novel_message = "ПРЕДСТАВЛЯЕТ"
	var/colored = COLOR_ASSEMBLY_BLACK

	var/obj/screen/novel_message/start_credits/big/visuals = new /obj/screen/novel_message/start_credits/big()
	visuals.maptext_y = -150
	visuals.maptext_x = 40
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 12 SECONDS)

/proc/credits_author()
	var/novel_message = "АВТОР ИДЕИ: DOCTOR ALEX"
	var/colored = COLOR_ASSEMBLY_BLACK

	var/obj/screen/novel_message/start_credits/visuals = new /obj/screen/novel_message/start_credits()
	visuals.maptext_x = -110
	visuals.maptext_y = -20
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 12 SECONDS)

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

			for(var/obj/structure/fd/players_geter/s2ep1/part1_1/G in world)
				all.alpha = 0
				all.forceMove(G)

		spawn(7 SECONDS)
			credits_team()
		spawn(10 SECONDS)
			credits_show()

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// СКРИПТ ПЕРСОНАЖЕЙ В СЦЕНЕ //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
