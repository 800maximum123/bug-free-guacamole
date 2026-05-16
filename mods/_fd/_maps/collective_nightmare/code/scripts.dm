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

/proc/nightmare_teleport(desired_chapter = "fuck", mob/living/specific_mob)
	var/list/tp_points = list()

	for(var/obj/structure/fd/nightmare_telepoint/T in world)
		if(T.chapter_id != desired_chapter)
			continue
		tp_points += T

	if(!specific_mob)
		for(var/mob/living/carbon/human/H in world)
			H.forceMove(get_turf(pick(tp_points)))

	else
		specific_mob.forceMove(get_turf(pick(tp_points)))

/obj/screen/player_message/mail

/obj/effect/add_note
	name = "note adder"
	desc = "note adder"
	icon = 'mods/_fd/fd_utilities/icons/newsource.dmi'
	icon_state = "target_info"
	mouse_opacity = FALSE
	anchored = TRUE
	invisibility = 50
	var/list/already_triggered = list()
	var/datum/interactive_note/note_to_add = null
	var/trigger_id = "test"

/obj/effect/add_note/Crossed(mob/living/user)
	. = ..()

	if(ishuman(user))
		if(!(user in already_triggered) && !istype(user,/mob/living/simple_animal/connected_player_soul))

			already_triggered += user
			for(var/obj/effect/add_note/A in world)
				if(A.trigger_id == trigger_id)
					A.already_triggered += user

			new note_to_add(null, user)

			var/message = {"<b><span style="color: yellow;">В архив добавлена новая запись!</span></b>"}

			var/obj/screen/player_message/mail/maintext = new /obj/screen/player_message/mail()
			maintext.plane = HUD_PLANE
			maintext.layer = HUD_ABOVE_HUD_LAYER
			maintext.maptext_x = 0
			maintext.maptext_y = -380

			user.client.screen += maintext
			maintext.set_text(message, COLOR_WHITE)
			addtimer(new Callback(src, PROC_REF(remove_message), user), 10 SECONDS)

/obj/effect/add_note/proc/remove_message(mob/living/user)
	for(var/obj/screen/messages in user.client.screen)
		if(istype(messages, /obj/screen/player_message/mail))
			user.client.screen -= messages
			qdel(messages)

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

	spawn(64 SECONDS)
		for(var/obj/screen/messages in client.screen)
			if(istype(messages, /obj/screen/player_message))
				client.screen -= messages
				qdel(messages)

/mob/proc/nightmare_escape_resomi()
	anchored = TRUE
	overlay_fullscreen("eyesclosed",/obj/screen/fullscreen/fd/falling_asleep)

	var/message = {"Ты начинаешь ползти по шахте вперёд."}

	var/obj/screen/player_message/maintext = new /obj/screen/player_message()
	maintext.plane = HUD_PLANE
	maintext.layer = HUD_ABOVE_HUD_LAYER
	maintext.maptext_x = 0
	maintext.maptext_y = -210

	spawn(2 SECONDS)
		client.screen += maintext
		maintext.set_text(message, COLOR_WHITE)

	spawn(12 SECONDS)
		message = {"Постепенно, до тебя доходит, почему об этом пути писали как о слишком опасном для человека маршруте."}
		maintext.set_text(message, COLOR_WHITE)

	spawn(22 SECONDS)
		message = {"Ощущение клаустрафобной сдавленности <span style="color: red;">душит</span> даже тебя, несмотря на более маленькие габариты."}
		maintext.set_text(message, COLOR_WHITE)

	spawn(32 SECONDS)
		message = {"Вскоре, приходит ветер, нежно обвивая твоё тело. Следуя за этим внезапным потоком, ты находишь заветный <span style="color: green;">выход</span>."}
		maintext.set_text(message, COLOR_WHITE)

		nightmare_teleport("resomi_escape", src)

	spawn(41 SECONDS)
		overlay_fullscreen("eyesopen",/obj/screen/fullscreen/fd/awakening)

	spawn(42 SECONDS)
		clear_fullscreen("eyesclosed")
		overlay_fullscreen("framing",/obj/screen/fullscreen/fd/cinema_borders)
		message = {"<span style="color: red;">Глава 2:</span> Спуск"}
		maintext.set_text(message, COLOR_WHITE)

		maintext.SetTransform(2)
		anchored = FALSE

	spawn(48 SECONDS)
		overlay_fullscreen("background",/obj/screen/fullscreen/fd/blackout)
		maintext.SetTransform(1)
		message = {"<b><span style="color: red;">TO BE CONTINUED...</span></b>"}
		maintext.set_text(message, COLOR_WHITE)

	spawn(54 SECONDS)
		qdel(src)

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

/proc/nightmare_screentext2()
	var/message = {"Лифт начинает медленно спускаться вниз."}

	var/obj/screen/player_message/maintext = new /obj/screen/player_message()
	maintext.plane = HUD_PLANE
	maintext.layer = HUD_ABOVE_HUD_LAYER
	maintext.maptext_x = 0
	maintext.maptext_y = -210

	for(var/client/M in GLOB.clients)
		M.screen += maintext
		maintext.set_text(message, COLOR_WHITE)

	spawn(6 SECONDS)
		message = {"Госпиталь наконец позади, но теперь перед вами стоит ещё более пугающая <span style="color: red;">неизвестность</span>."}
		maintext.set_text(message, COLOR_WHITE)

	spawn(18 SECONDS)
		message = {"Куда бы он не вёл, очевидно лишь одно - ваш <span style="color: red;">кошмар</span> был ещё очень далёк от завершения."}
		maintext.set_text(message, COLOR_WHITE)

	spawn(30 SECONDS)
		message = {"И разбудить вас, к сожалению, <span style="color: red;">некому</span>."}
		maintext.set_text(message, COLOR_WHITE)

	spawn(40 SECONDS)
		message = {"<span style="color: red;">Глава 2:</span> Спуск"}
		maintext.set_text(message, COLOR_WHITE)

		maintext.SetTransform(2)

	spawn(48 SECONDS)
		maintext.SetTransform(1)
		message = {"<b><span style="color: red;">TO BE CONTINUED...</span></b>"}
		maintext.set_text(message, COLOR_WHITE)

	spawn(54 SECONDS)

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

/proc/nightmare_continues()
	start_cutscene(/datum/modular_cutscene/second_chapter)

/datum/modular_cutscene/second_chapter/setup_actions(...)
	actions = list(
		ADD_SCREEN(/falling_asleep),
		MOVE_CAMERA(0, -12, 6 SECONDS, LINEAR_EASING|EASE_OUT) = 6 SECONDS,
		CALL_GLOB(nightmare_screentext2) = 18 SECONDS,
		CALL_GLOB(nightmare_teleport, "normal_escape") = 16 SECONDS,
		MOVE_CAMERA(0, 0, 0, null),
		REMOVE_SCREEN(/falling_asleep, 0 SECONDS),
		ADD_SCREEN(/awakening) = 6 SECONDS,
		PLAY_SOUND(sound('sound/ambience/ominous2.ogg', volume = 20)),
		ADD_SCREEN(/cinema_borders) = 8 SECONDS,
		REMOVE_SCREEN(/cinema_borders, 0 SECONDS),
		ADD_SCREEN(/blackout) = 6 SECONDS,
		CALL_GLOB(cutscene_cinema_end),
		REMOVE_SCREEN(/blackout, 0 SECONDS),
		REMOVE_SCREEN(/awakening, 0 SECONDS) = 30 SECONDS,
		RETURN_VIEWERS
	)
