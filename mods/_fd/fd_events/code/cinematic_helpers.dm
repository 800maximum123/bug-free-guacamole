/client
	var/ignore_focus = FALSE
	var/watching_scene = FALSE

/mob/living
	var/holding_camera = FALSE

/proc/cutscene_cinema_end()
	SSticker.forced_end = TRUE

/client/proc/cmd_admin_camera_focus(mob/living/M as mob in SSmobs.mob_list)
	set category = "Special Verbs"
	set name = "Focus Camera"
	if(!holder)
		to_chat(src, "Only administrators may use this command!")
		return
	if(!mob)
		return
	if(!istype(M))
		alert("Cannot spectate ghost!")
		return

	if(M.holding_camera)
		alert("Already spectating!")
		return

	if(M.client)
		M.client.ignore_focus = TRUE
		M.balloon_alert(M, "|КИНОКАМЕРА НАПРАВЛЕНА НА ВАС|", COLOR_GREEN)

	M.holding_camera = TRUE

	for(var/client/client in GLOB.clients)
		if(client.watching_scene)
			client.mob.clear_fullscreen("borders", /obj/screen/fullscreen/fd/cinema_borders)
			client.watching_scene = TRUE
			client.adminobs = null

			client.mob.reset_view()

		if(client.mob && isliving(client.mob))
			var/mob/living/L = client.mob
			if(L.holding_camera && L != M)
				L.balloon_alert(L, "|ЗА ВАМИ БОЛЬШЕ НЕ НАБЛЮДАЮТ|", COLOR_GOLD)
				L.holding_camera = FALSE

		if(client.ignore_focus)
			continue

		if(client.holder) // Педалям может понадобиться сделать что-то во время сценки
			continue

		client.mob.overlay_fullscreen("borders", /obj/screen/fullscreen/fd/cinema_borders)

		client.watching_scene = TRUE

		client.adminobs = TRUE
		client.mob.reset_view(M)

/client/proc/cmd_admin_camera_unfocus(mob/living/M as mob in SSmobs.mob_list)
	set category = "Special Verbs"
	set name = "Unfocus Camera"
	if(!holder)
		to_chat(src, "Only administrators may use this command!")
		return
	if(!mob)
		return
	if(!istype(M))
		alert("Cannot do this with ghost!")
		return

	if(!M.holding_camera)
		alert("Wrong camera holder!")
		return

	for(var/client/client in GLOB.clients)
		if(client.ignore_focus)
			continue
		if(client.holder)
			continue

		client.watching_scene = FALSE

		client.mob.clear_fullscreen("borders")
		client.adminobs = null

		client.mob.reset_view()

	if(M.client)
		M.client.ignore_focus = FALSE
		M.holding_camera = FALSE
		M.balloon_alert(M, "|ЗА ВАМИ БОЛЬШЕ НЕ НАБЛЮДАЮТ|", COLOR_GOLD)
