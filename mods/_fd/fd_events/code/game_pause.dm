/obj/screen/player_message
	icon = null
	icon_state = null
	mouse_opacity = MOUSE_OPACITY_UNCLICKABLE
	alpha = 255
	screen_loc = "TOP, CENTER - 3"
	maptext_width = 256
	maptext_height = 480
	maptext_x = -16
	maptext_y = -10
	plane = HUD_PLANE
	layer = HUD_ABOVE_HUD_LAYER

/obj/screen/player_message/proc/set_text(text, text_color)
	maptext = "<span class='maptext' style='text-align: center; font-size: 32px; color: [text_color]'>[text]</span>"

/obj/screen/fullscreen/city
	icon = 'mods/_fd/fd_assets/icons/screen_full.dmi'
	icon_state = "city"
	allstate = 1

/obj/screen/fullscreen/loophole
	icon = 'mods/_fd/fd_assets/icons/screen_full.dmi'
	icon_state = "curse1"
	allstate = 1

/proc/player_discussion(pixelmove = 0)
	var/current_pixel = pixelmove

	var/client/PC = input("Выберите игрока", "Чей спотлайт?") as null|anything in GLOB.clients
	if(!PC)
		for(var/mob/living/M in GLOB.player_list)
			M.clear_fullscreen("hole")
			M.clear_fullscreen("background")
			for(var/mob/all in world)
				all.stunned = 0
			return 1

	var/send_message = input(PC, "Что же случилось?", "Начните писать...", "...от лица своего персонажа!") as null|text
	if(!send_message)
		for(var/mob/living/M in GLOB.player_list)
			M.clear_fullscreen("hole")
			M.clear_fullscreen("background")
			for(var/mob/all in world)
				all.stunned = 0
			return 1

	var/colored = input(PC, "Выберите цвет вашего текста.", "Каким он будет?") as color
	if(!colored)
		colored = "#868686"
	var/placement = input(PC, "Расположение", "Где должен быть текст?") in list("По центру", "Слева", "Справа")
	var/move_maptext_by = 0
	if(!placement)
		placement = "По центру"
	switch(placement)
		if("По центру")
			move_maptext_by = -16
		if("Слева")
			move_maptext_by = -64
		if("Справа")
			move_maptext_by = 50

	var/obj/screen/player_message/second = new /obj/screen/player_message()
	second.maptext_y = current_pixel
	second.maptext_x = move_maptext_by
	for(var/client/M in GLOB.clients)
		M.screen += second
		second.set_text(send_message, colored)

	var/answer = alert(usr, "Хотите повторить прок?", "Диалог", "Да", "Нет")

	switch(answer)
		if("Да")
			player_discussion(pixelmove = current_pixel - 50)
		else
			for(var/mob/living/M in GLOB.player_list)
				M.clear_fullscreen("hole")
				M.clear_fullscreen("background")
				for(var/mob/all in world)
					all.stunned = 0
			for(var/obj/screen/player_message/messages in world)
				animate(messages, 1 SECOND, alpha = 0)
				spawn(1 SECOND)
					qdel(messages)
			return 1

/proc/discuss()
	for(var/mob/all in world)
		all.Stun(99999)
	for(var/mob/living/M in GLOB.player_list)
		M.overlay_fullscreen("background", /obj/screen/fullscreen/city)
		M.overlay_fullscreen("hole", /obj/screen/fullscreen/loophole)

	var/client/GM = input("Выберите рассказчика", "Того, кто начнёт речь") as null|anything in GLOB.clients
	if(!GM)
		for(var/mob/living/M in GLOB.player_list)
			M.clear_fullscreen("hole")
			M.clear_fullscreen("background")
			for(var/mob/all in world)
				all.stunned = 0
			return 1

	var/starting_message = input(GM, "Что же случилось?", "Начните писать...", "...о том, о чём считаете нужным!") as null|text
	if(!starting_message)
		for(var/mob/living/M in GLOB.player_list)
			M.clear_fullscreen("hole")
			M.clear_fullscreen("background")
			for(var/mob/all in world)
				all.stunned = 0
			return 1

	var/colored = input(GM, "Выберите цвет вашего текста.", "Каким он будет?") as color
	if(!colored)
		colored = "#868686"

	var/obj/screen/player_message/first = new /obj/screen/player_message()
	for(var/client/M in GLOB.clients)
		M.screen += first
		first.set_text(starting_message, colored)

	player_discussion(pixelmove = -40)
