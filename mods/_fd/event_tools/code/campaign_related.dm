// Вступительная сцена второго акта

// Фейковые пропы кораблей. Нужны будут для анимации на фоне

/obj/structure/fd/fake_torch
	name = "SEV 'TORCH'"
	desc = "Это заглушка для фоновой анимации"
	icon = 'mods/_fd/ai_overmap_objects/icons/scg/sfv64.dmi'
	icon_state = "tigris"

/obj/structure/fd/fake_ascent_ship
	name = "Ascent Fighter"
	desc = "Это заглушка для фоновой анимации"
	icon = 'mods/_fd/ai_overmap_objects/icons/ascent/ascent_ships.dmi'
	icon_state = "fighter"

//Контроллер, в который мы позже запихнём камеру наших игроков. Вот бы только понять, как её потом обратно вернуть пиздец

/obj/structure/fd/camera_controller
	icon = 'mods/_fd/event_tools/icons/landmarks_static.dmi'
	icon_state = "generic_event"

	invisibility = 50

// Фуллскрины
/obj/screen/fullscreen/blackout/fd
	plane = HUD_PLANE
	layer = HUD_ABOVE_HUD_LAYER

/obj/screen/fullscreen/fishbed/fd
	plane = HUD_PLANE
	layer = 7

// Логика самой катсцены

/proc/campaign_act_two()
	var/obj/structure/fd/camera_controller/controller

	for(var/obj/structure/fd/camera_controller/searching in world)
		controller = searching

	spawn(0.2 SECOND)
		for(var/mob/all in world)
			all.overlay_fullscreen("blackscreen", /obj/screen/fullscreen/blackout/fd)
			all.overlay_fullscreen("fishbed", /obj/screen/fullscreen/fishbed/fd)
			all.Stun(99999)

			spawn(20 SECONDS)
				all.clear_fullscreen("blackscreen")
				all.clear_fullscreen("fishbed")

			all.reset_view(controller)

	spawn(1 SECOND)
		blackbox_pt1()
	spawn(5 SECONDS)
		blackbox_pt2()
	spawn(7 SECONDS)
		blackbox_pt3()

	spawn(22 SECOND)
		for(var/obj/structure/fd/fake_torch/FT in world)
			animate(FT, pixel_x = 150, time = 20 SECONDS, easing = LINEAR_EASING | EASE_IN)

	spawn(23 SECONDS)
		bridge_scene_pt1()

// Новельные реплики

/proc/blackbox_pt1()
	var/novel_message = "2337 г, 8 марта. ГЭК 'Факел' покидает систему |XXX| - 16:39:07"
	var/colored = "#4ec908"

	var/obj/screen/novel_message/first = new /obj/screen/novel_message()
	first.maptext_y = -140
	for(var/client/M in GLOB.clients)
		M.screen += first
		first.set_text(novel_message, colored)

	spawn(12 SECONDS)
		for(var/obj/screen/novel_message/messages in world)
			animate(messages, 1 SECOND, alpha = 0)
			spawn(1 SECOND)
				qdel(messages)

/proc/blackbox_pt2()
	var/novel_message = "2337 г, 8 марта. ГЭК 'Факел' прибывает в систему |EZ-107| - 20:10:44"
	var/colored = "#4ec908"

	var/obj/screen/novel_message/first = new /obj/screen/novel_message()
	first.maptext_y = -160
	for(var/client/M in GLOB.clients)
		M.screen += first
		first.set_text(novel_message, colored)

	spawn(10 SECONDS)
		for(var/obj/screen/novel_message/messages in world)
			animate(messages, 1 SECOND, alpha = 0)
			spawn(1 SECOND)
				qdel(messages)

/proc/blackbox_pt3()
	var/novel_message = "2337 г, 8 марта. Факел вступает в бой - 20:31:05"
	var/colored = "#4ec908"

	var/obj/screen/novel_message/first = new /obj/screen/novel_message()
	first.maptext_y = -180
	for(var/client/M in GLOB.clients)
		M.screen += first
		first.set_text(novel_message, colored)

	spawn(8 SECONDS)
		for(var/obj/screen/novel_message/messages in world)
			animate(messages, 1 SECOND, alpha = 0)
			spawn(1 SECOND)
				qdel(messages)

/proc/bridge_scene_pt1()
	for(var/mob/living/M in GLOB.player_list)
		M.overlay_fullscreen("pilot", /obj/screen/fullscreen/novel2) // Заменить

	var/novel_message = "Что...Какого чёрта только что произошло?"
	var/colored = "#ffffff"

	var/obj/screen/novel_message/first = new /obj/screen/novel_message()
	first.maptext_y = -380
	first.maptext_x = 20
	for(var/client/M in GLOB.clients)
		M.screen += first
		first.set_text(novel_message, colored)

	spawn(6 SECONDS)
		for(var/mob/living/M in GLOB.player_list)
			M.clear_fullscreen("pilot") // Заменить
		for(var/obj/screen/novel_message/messages in world)
			animate(messages, 1 SECOND, alpha = 0)
			spawn(1 SECOND)
				qdel(messages)
