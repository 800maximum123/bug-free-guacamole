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
	invisibility = 101
	anchored = TRUE
	density = TRUE

/proc/teleport_to_nightmare()
	var/area/target_area = locate(/area/nightmare/unreal/bar_nightmare)
	var/list/tp_points = list()

	for(var/obj/structure/fd/nightmare_telepoint/T in target_area)
		tp_points += T

	for(var/mob/living/carbon/human/H in world)
		H.forceMove(get_turf(pick(tp_points)))

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
		CALL_GLOB(teleport_to_nightmare) = 6 SECONDS,
		REMOVE_SCREEN(/falling_asleep, 0 SECONDS),
		ADD_SCREEN(/awakening) = 8 SECONDS,
		PLAY_SOUND(sound('sound/ambience/ominous2.ogg', volume = 20)),
		ADD_SCREEN(/cinema_borders) = 8 SECONDS,
		REMOVE_SCREEN(/cinema_borders, 0 SECONDS),
		RETURN_VIEWERS
	)
