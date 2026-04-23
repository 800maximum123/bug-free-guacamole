/obj/screen/fullscreen/fd/falling_asleep
	icon = 'mods/_fd/_maps/collective_nightmare/icons/is12_screens.dmi'
	icon_state = "fadesleeptest"
	allstate = 1
	plane = HUD_PLANE
	layer = HUD_ABOVE_HUD_LAYER

	scale_to_view = TRUE

/obj/screen/fullscreen/fd/awakening
	icon = 'mods/_fd/_maps/collective_nightmare/icons/is12_screens.dmi'
	icon_state = "fadewaketest"
	allstate = 1
	plane = HUD_PLANE
	layer = HUD_ABOVE_HUD_LAYER

	scale_to_view = TRUE

/obj/structure/fd/nightmare_telepoint
	name = "there is nothing"
	icon = 'mods/_fd/fd_utilities/icons/newsource.dmi'
	icon_state = "landmark"
	var/chapter_id = "chapter_one"
	invisibility = 101
	anchored = TRUE
	density = FALSE

/proc/nightmare_teleport(desired_chapter = "fuck")
	var/list/tp_points = list()

	for(var/obj/structure/fd/nightmare_telepoint/T in world)
		if(T.chapter_id != desired_chapter)
			continue
		tp_points += T

	for(var/mob/living/carbon/human/H in world)
		H.forceMove(get_turf(pick(tp_points)))

/datum/job/submap/collective_nightmare/post_equip_rank(mob/person, alt_title)
	. = ..()
	person.show_nightmare_lore(person)

/mob/proc/show_nightmare_lore()
	anchored = TRUE

	overlay_fullscreen("background",/obj/screen/fullscreen/fd/blackout)
	var/message = {"Обыкновенный день. Такой же как и всегда."}

	var/obj/screen/player_message/maintext = new /obj/screen/player_message()
	maintext.plane = HUD_PLANE
	maintext.layer = HUD_ABOVE_HUD_LAYER
	maintext.maptext_x = 0
	maintext.maptext_y = -210

	client.screen += maintext
	maintext.set_text(message, COLOR_WHITE)

	spawn(8 SECONDS)
		message = {"Пятница? Понедельник? Среда? Ты с трудом мог вспомнить своё собственное имя, что уж говорить о днях недели."}
		maintext.set_text(message, COLOR_WHITE)

	spawn(18 SECONDS)
		message = {"Последний месяц твоей жизни витает словно в тумане. Были взлёты, были падения. Последних, впрочем, <span style="color: red;">гораздо больше</span>."}
		maintext.set_text(message, COLOR_WHITE)

	spawn(30 SECONDS)
		message = {"Когда ты повернул не туда? Что такого ты сотворил, чтоб Боги единогласно решили низвергнуть тебя во тьму самобичевания и уныния? Без надежды на <span style="color: yellow;">свет</span>, или чужую ласку."}
		maintext.set_text(message, COLOR_WHITE)

	spawn(40 SECONDS)
		message = {"Сейчас это уже не имеет значения."}
		maintext.set_text(message, COLOR_WHITE)

	spawn(48 SECONDS)
		message = {"Тебе просто нужно немного расслабиться. Забыться в алкогольной дрёме. <span style="color: yellow;">Неподалёку как раз был какой-то бар</span>. Стоит заглянуть в него."}
		maintext.set_text(message, COLOR_WHITE)

	spawn(56 SECONDS)
		message = ""
		maintext.set_text(message, COLOR_WHITE)

		overlay_fullscreen("eyesopen",/obj/screen/fullscreen/fd/awakening)

	spawn(56.5 SECONDS)
		clear_fullscreen("background")

	spawn(59 SECONDS)
		clear_fullscreen("eyesopen")
		generate_binds()

		anchored = FALSE

	spawn(61 SECONDS)
		message = {"\
		<b>УПРАВЛЕНИЕ:</b><br />\
		Вы можете открыть интерактивное взаимодействие с определёнными объектами нажав <b><span style="color: yellow;">[retrieve_bind("start_interaction")]</span></b><br />\
		<br />\
		Чаще всего, объекты с которыми можно взаимодействовать - выделяются <span style="color: yellow;">лупой</span><br />\
		В некоторых случаях, внутри интеракции может быть спрятан <span style="color: yellow;">секрет</span>. Чтобы его обнаружить - попробуйте поводить мышкой по экрану, пока не увидите новый значок"}

		maintext.maptext_width = 360
		maintext.maptext_x = -80
		maintext.maptext_y = -100

		maintext.set_text(message, COLOR_WHITE)

	spawn(81 SECONDS)
		for(var/obj/screen/messages in client.screen)
			if(istype(messages, /obj/screen/player_message))
				client.screen -= messages
				qdel(messages)

/mob
	var/list/player_bind_dict = list()

/// Generate a dictionary of button : action for use of referencing what keys to press
/mob/proc/generate_binds()
	if(!client?.prefs)
		return

	for(var/bind in client.prefs.key_bindings)
		var/action = client.prefs.key_bindings[bind]
		// We presume the first action under a certain binding is the one we want.
		if(action[1] in player_bind_dict)
			player_bind_dict[action[1]] += bind
		else
			player_bind_dict[action[1]] = list(bind)

/// Getter for player_bind_dict. Provide an action name like "North" or "quick_equip"
/mob/proc/retrieve_bind(action_name)
	if(!action_name)
		return

	if(!(action_name in player_bind_dict))
		return "Undefined"

	return player_bind_dict[action_name][1]

/proc/nightmare_screentext1()
	var/message = {"Ты ощущаешь, как твоё тело слабеет, а глаза постепенно слипаются. Что-то очень быстро клонит тебя в <span style="color: red;">сон</span>."}

	var/obj/screen/player_message/maintext = new /obj/screen/player_message()
	maintext.plane = HUD_PLANE
	maintext.layer = HUD_ABOVE_HUD_LAYER
	maintext.maptext_x = 0
	maintext.maptext_y = -210

	for(var/client/M in GLOB.clients)
		M.screen += maintext
		maintext.set_text(message, COLOR_WHITE)

	spawn(8 SECONDS)
		message = {"Всю ночь ты корчишься в неописуемой <span style="color: red;">агонии</span>. По всему твоему телу разряд за разрядом пропускают ток, а в мозг, будто бы, вставляют спицы."}
		maintext.set_text(message, COLOR_WHITE)

	spawn(16 SECONDS)
		message = {"Ты не помнишь, в какой именно момент, но тебя наконец-то <span style="color: green;">отпускает</span>."}
		maintext.set_text(message, COLOR_WHITE)

	spawn(22 SECONDS)
		message = {"И ты, нехотя, начинаешь открывать глаза."}
		maintext.set_text(message, COLOR_WHITE)

	spawn(30 SECONDS)
		message = {"Лишь для того чтобы осознать - <span style="color: red;">кошмар</span> только начинается."}
		maintext.set_text(message, COLOR_WHITE)

	spawn(38 SECONDS)
		message = {"<span style="color: red;">Глава 1:</span> Прибытие"}
		maintext.set_text(message, COLOR_WHITE)

		maintext.SetTransform(2)

	spawn(46 SECONDS)

		for(var/client/M in GLOB.clients)
			for(var/obj/screen/messages in M.screen)
				if(istype(messages, /obj/screen/player_message))
					M.screen -= messages
					qdel(messages)

/proc/nightmare_begins()
	start_cutscene(/datum/modular_cutscene/nightmare_begins)

/datum/modular_cutscene/nightmare_begins/setup_actions(...)
	actions = list(
		ADD_SCREEN(/falling_asleep) = 4 SECONDS,
		CALL_GLOB(nightmare_screentext1) = 24 SECONDS,
		CALL_GLOB(nightmare_teleport, "chapter_one") = 6 SECONDS,
		REMOVE_SCREEN(/falling_asleep, 0 SECONDS),
		ADD_SCREEN(/awakening) = 8 SECONDS,
		PLAY_SOUND(sound('sound/ambience/ominous2.ogg', volume = 20)),
		ADD_SCREEN(/cinema_borders) = 8 SECONDS,
		REMOVE_SCREEN(/cinema_borders, 0 SECONDS),
		RETURN_VIEWERS
	)
