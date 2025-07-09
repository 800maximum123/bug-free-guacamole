/obj/screen/novel_message
	icon = null
	icon_state = null
	mouse_opacity = MOUSE_OPACITY_UNCLICKABLE
	alpha = 0
	screen_loc = "TOP, CENTER - 3"
	maptext_width = 256
	maptext_height = 480
	maptext_x = -16
	maptext_y = -10
	plane = HUD_PLANE
	layer = HUD_ABOVE_HUD_LAYER

/obj/screen/novel_message/proc/set_text(text, text_color)
	animate(src, 1 SECOND, alpha = 255)
	maptext = "<span class='maptext' style='text-align: center; font-size: 300%; color: [text_color]'>[text]</span>"

/obj/screen/fullscreen/novel1
	icon = 'mods/_fd/fd_assets/icons/screen_full.dmi'
	icon_state = "novel_test1"
	allstate = 1
	plane = HUD_PLANE
	layer = HUD_ABOVE_HUD_LAYER

/obj/screen/fullscreen/novel2
	icon = 'mods/_fd/fd_assets/icons/screen_full.dmi'
	icon_state = "novel_test2"
	allstate = 1
	plane = HUD_PLANE
	layer = HUD_ABOVE_HUD_LAYER

/proc/start_novel_scene()
	for(var/mob/all in world)
		all.Stun(99999)

	novel_test_page1()
	spawn(10 SECONDS)
		novel_test_page2()
	spawn(18 SECONDS)
		for(var/mob/all in world)
			all.stunned = 0

/proc/novel_test_page1()
	for(var/mob/living/M in GLOB.player_list)
		M.overlay_fullscreen("pilot", /obj/screen/fullscreen/novel2)

	var/novel_message = "АЛЁ! ДИСПЕТЧЕР БЛЯТЬ! МЫ ПАДАЕМ! ПАДАЕМ, СЦУКА!"
	var/colored = "#ffffff"

	var/obj/screen/novel_message/first = new /obj/screen/novel_message()
	first.maptext_y = -380
	first.maptext_x = 20
	for(var/client/M in GLOB.clients)
		M.screen += first
		first.set_text(novel_message, colored)

	spawn(6 SECONDS)
		for(var/mob/living/M in GLOB.player_list)
			M.clear_fullscreen("pilot")
		for(var/obj/screen/novel_message/messages in world)
			animate(messages, 1 SECOND, alpha = 0)
			spawn(1 SECOND)
				qdel(messages)

/proc/novel_test_page2()
	for(var/mob/living/M in GLOB.player_list)
		M.overlay_fullscreen("dispatcher", /obj/screen/fullscreen/novel1)

	var/novel_message = "Понял! Понял! Вычёркиваю!"
	var/colored = "#8f0000"

	var/obj/screen/novel_message/first = new /obj/screen/novel_message()
	first.maptext_y = -380
	first.maptext_x = 20
	for(var/client/M in GLOB.clients)
		M.screen += first
		first.set_text(novel_message, colored)

	spawn(6 SECONDS)
		for(var/mob/living/M in GLOB.player_list)
			M.clear_fullscreen("dispatcher")
		for(var/obj/screen/novel_message/messages in world)
			animate(messages, 1 SECOND, alpha = 0)
			spawn(1 SECOND)
				qdel(messages)
