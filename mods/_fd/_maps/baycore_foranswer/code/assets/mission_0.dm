/obj/screen/fullscreen/mech
	alpha = 0
	var/matrix/matrix1

/obj/screen/fullscreen/mech/Initialize()
	. = ..()
	matrix1 = new()
	animate(src, 1 SECOND, alpha = 255)

/obj/screen/fullscreen/mech/captain
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/pilots/cutscenes.dmi'
	icon_state = "stain"
	allstate = 1
	plane = HUD_PLANE
	layer = HUD_ABOVE_HUD_LAYER

/obj/screen/fullscreen/mech/lt1
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/pilots/cutscenes.dmi'
	icon_state = "gard"
	allstate = 1
	plane = HUD_PLANE
	layer = HUD_ABOVE_HUD_LAYER

/obj/screen/fullscreen/mech/lt2
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/pilots/cutscenes.dmi'
	icon_state = "kennet"
	allstate = 1
	plane = HUD_PLANE
	layer = HUD_ABOVE_HUD_LAYER

/obj/screen/fullscreen/mech/robot
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/pilots/cutscenes.dmi'
	icon_state = "rk560leo"
	allstate = 1
	plane = HUD_PLANE
	layer = HUD_ABOVE_HUD_LAYER

/obj/screen/fullscreen/mech/document_alexandra
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/pilots/cutscenes.dmi'
	icon_state = "alexandra"
	allstate = 1
	plane = HUD_PLANE
	layer = UNDER_HUD_LAYER

/obj/screen/fullscreen/mech/document_alexandra/Initialize()
	. = ..()
	spawn(12 SECONDS)
		animate(src, transform = matrix1.Update(1,1,0,-280,-250), time = 0.5 SECOND, easing = SINE_EASING)
	spawn(13 SECONDS)
		animate(src, transform = matrix1.Update(0.4, 0.4), time = 1 SECOND, easing = SINE_EASING)

	spawn(58 SECONDS)
		animate(src, 3 SECOND, alpha = 0)

/obj/screen/fullscreen/mech/document_ootsuki
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/pilots/cutscenes.dmi'
	icon_state = "ootsuki"
	allstate = 1
	plane = HUD_PLANE
	layer = UNDER_HUD_LAYER

/obj/screen/fullscreen/mech/document_ootsuki/Initialize()
	. = ..()
	spawn(20 SECONDS)
		animate(src, transform = matrix1.Update(1,1,0,-300,-330), time = 0.5 SECOND, easing = SINE_EASING)
	spawn(21 SECONDS)
		animate(src, transform = matrix1.Update(0.3,0.3), time = 1 SECOND, easing = SINE_EASING)

	spawn(58 SECONDS)
		animate(src, 1 SECOND, alpha = 0)

/obj/screen/fullscreen/mech/document_emilio
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/pilots/cutscenes.dmi'
	icon_state = "emilio"
	allstate = 1
	plane = HUD_PLANE
	layer = UNDER_HUD_LAYER

/obj/screen/fullscreen/mech/document_emilio/Initialize()
	. = ..()
	spawn(18 SECONDS)
		animate(src, transform = matrix1.Update(1,1,0,-250,210), time = 0.5 SECOND, easing = SINE_EASING)
	spawn(19 SECONDS)
		animate(src, transform = matrix1.Update(0.4,0.4), time = 1 SECOND, easing = SINE_EASING)

	spawn(58 SECONDS)
		animate(src, 3 SECOND, alpha = 0)

/obj/screen/fullscreen/mech/document_hat12
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/pilots/cutscenes.dmi'
	icon_state = "hat12"
	allstate = 1
	plane = HUD_PLANE
	layer = UNDER_HUD_LAYER

/obj/screen/fullscreen/mech/document_hat12/Initialize()
	. = ..()
	spawn(28 SECONDS)
		animate(src, transform = matrix1.Update(1,1,0,350,-280), time = 0.5 SECOND, easing = SINE_EASING)
	spawn(29 SECONDS)
		animate(src, transform = matrix1.Update(0.4,0.4), time = 1 SECOND, easing = SINE_EASING)

	spawn(58 SECONDS)
		animate(src, 3 SECOND, alpha = 0)

/obj/screen/fullscreen/mech/document_vladimir
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/pilots/cutscenes.dmi'
	icon_state = "vladimir"
	allstate = 1
	plane = HUD_PLANE
	layer = UNDER_HUD_LAYER

/obj/screen/fullscreen/mech/document_vladimir/Initialize()
	. = ..()
	spawn(22 SECONDS)
		animate(src, transform = matrix1.Update(1,1,0,0,-290), time = 0.5 SECOND, easing = SINE_EASING)
	spawn(23 SECONDS)
		animate(src, transform = matrix1.Update(0.3,0.3), time = 1 SECOND, easing = SINE_EASING)

	spawn(58 SECONDS)
		animate(src, 3 SECOND, alpha = 0)

/obj/screen/fullscreen/mech/document_stella
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/pilots/cutscenes.dmi'
	icon_state = "stella"
	allstate = 1
	plane = HUD_PLANE
	layer = UNDER_HUD_LAYER

/obj/screen/fullscreen/mech/document_stella/Initialize()
	. = ..()
	spawn(16 SECONDS)
		animate(src, transform = matrix1.Update(1,1,0,260,340), time = 0.5 SECOND, easing = SINE_EASING)
	spawn(17 SECONDS)
		animate(src, transform = matrix1.Update(0.3,0.3), time = 1 SECOND, easing = SINE_EASING)

	spawn(58 SECONDS)
		animate(src, 3 SECOND, alpha = 0)

/obj/screen/fullscreen/mech/document_coil
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/pilots/cutscenes.dmi'
	icon_state = "coil"
	allstate = 1
	plane = HUD_PLANE
	layer = UNDER_HUD_LAYER

/obj/screen/fullscreen/mech/document_coil/Initialize()
	. = ..()
	spawn(10 SECONDS)
		animate(src, transform = matrix1.Update(1,1,0,360,-320), time = 0.5 SECOND, easing = SINE_EASING)
	spawn(11 SECONDS)
		animate(src, transform = matrix1.Update(0.3,0.3), time = 1 SECOND, easing = SINE_EASING)

	spawn(58 SECONDS)
		animate(src, 3 SECOND, alpha = 0)

/obj/screen/fullscreen/mech/document_emmy
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/pilots/cutscenes.dmi'
	icon_state = "emmy"
	allstate = 1
	plane = HUD_PLANE
	layer = UNDER_HUD_LAYER

/obj/screen/fullscreen/mech/document_emmy/Initialize()
	. = ..()
	spawn(26 SECONDS)
		animate(src, transform = matrix1.Update(1,1,0,-210,320), time = 0.5 SECOND, easing = SINE_EASING)
	spawn(27 SECONDS)
		animate(src, transform = matrix1.Update(0.3,0.3), time = 1 SECOND, easing = SINE_EASING)

	spawn(65 SECONDS)
		animate(src, 3 SECOND, alpha = 0)

/obj/screen/fullscreen/mech/document_john
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/pilots/cutscenes.dmi'
	icon_state = "john"
	allstate = 1
	plane = HUD_PLANE
	layer = UNDER_HUD_LAYER

/obj/screen/fullscreen/mech/document_john/Initialize()
	. = ..()
	spawn(24 SECONDS)
		animate(src, transform = matrix1.Update(1,1,0,-360,0), time = 0.5 SECOND, easing = SINE_EASING)
	spawn(25 SECONDS)
		animate(src, transform = matrix1.Update(0.4,0.4), time = 1 SECOND, easing = SINE_EASING)

	spawn(65 SECONDS)
		animate(src, 3 SECOND, alpha = 0)

/obj/screen/fullscreen/mech/document_amaryllis
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/pilots/cutscenes.dmi'
	icon_state = "amaryllis"
	allstate = 1
	plane = HUD_PLANE
	layer = UNDER_HUD_LAYER

/obj/screen/fullscreen/mech/document_amaryllis/Initialize()
	. = ..()
	spawn(8 SECONDS)
		animate(src, transform = matrix1.Update(1,1,0,240,-230), time = 0.5 SECOND, easing = SINE_EASING)
	spawn(9 SECONDS)
		animate(src, transform = matrix1.Update(0.4,0.4), time = 1 SECOND, easing = SINE_EASING)

	spawn(65 SECONDS)
		animate(src, 1 SECOND, alpha = 0)

/obj/screen/fullscreen/mech/document_valery
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/pilots/cutscenes.dmi'
	icon_state = "valery"
	allstate = 1
	plane = HUD_PLANE
	layer = UNDER_HUD_LAYER

/obj/screen/fullscreen/mech/document_valery/Initialize()
	. = ..()
	spawn(2 SECONDS)
		animate(src, transform = matrix1.Update(1,1,0,250,-250,), time = 0.5 SECOND, easing = SINE_EASING)
	spawn(3 SECONDS)
		animate(src, transform = matrix1.Update(0.4,0.4), time = 1 SECOND, easing = SINE_EASING)

	spawn(65 SECONDS)
		animate(src, 3 SECOND, alpha = 0)

/obj/screen/fullscreen/mech/document_krass
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/pilots/cutscenes.dmi'
	icon_state = "krass"
	allstate = 1
	plane = HUD_PLANE
	layer = UNDER_HUD_LAYER

/obj/screen/fullscreen/mech/document_krass/Initialize()
	. = ..()
	spawn(14 SECONDS)
		animate(src, transform = matrix1.Update(1,1,0,370,370), time = 0.5 SECOND, easing = SINE_EASING)
	spawn(15 SECONDS)
		animate(src, transform = matrix1.Update(0.4,0.4), time = 1 SECOND, easing = SINE_EASING)

	spawn(65 SECONDS)
		animate(src, 3 SECOND, alpha = 0)

/obj/screen/fullscreen/mech/document_bernard
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/pilots/cutscenes.dmi'
	icon_state = "bernard"
	allstate = 1
	plane = HUD_PLANE
	layer = UNDER_HUD_LAYER

/obj/screen/fullscreen/mech/document_bernard/Initialize()
	. = ..()
	spawn(6 SECONDS)
		animate(src, transform = matrix1.Update(1,1,0,-270,0), time = 0.5 SECOND, easing = SINE_EASING)
	spawn(7 SECONDS)
		animate(src, transform = matrix1.Update(0.4,0.4), time = 1 SECOND, easing = SINE_EASING)

	spawn(65 SECONDS)
		animate(src, 3 SECOND, alpha = 0)

/obj/screen/fullscreen/mech/document_kazi
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/pilots/cutscenes.dmi'
	icon_state = "kazi"
	allstate = 1
	plane = HUD_PLANE
	layer = UNDER_HUD_LAYER

/obj/screen/fullscreen/mech/document_kazi/Initialize()
	. = ..()
	spawn(4 SECONDS)
		animate(src, transform = matrix1.Update(1,1,0,-370,240), time = 0.5 SECOND, easing = SINE_EASING)
	spawn(5 SECONDS)
		animate(src, transform = matrix1.Update(0.3,0.3), time = 1 SECOND, easing = SINE_EASING)

	spawn(65 SECONDS)
		animate(src, 3 SECOND, alpha = 0)

//////////////////////////////////////////////////////////////////////////////////////////////////////
//mech_roster()

//enter_simulation()

//heavy_tutorial()
//heavy_tutorial2()
//heavy_tutorial3()

//scout_tutorial()
//scout_tutorial2()

//engineer_tutorial()
//engineer_tutorial2()
//engineer_tutorial3()

//trooper_tutorial()
//trooper_tutorial2()

//breacher_tutorial()
//breacher_tutorial2()
//breacher_tutorial3()

//exp_tutorial()
//exp_tutorial2()

//final_exam()

/proc/final_exam()
	lt_start()

	spawn(600 SECONDS)
		error_text1()
		lt_end()
	spawn(605 SECONDS)
		error_text2()
	spawn(610 SECONDS)
		error_text3()

	spawn(612 SECONDS)
		lt_end2()

/proc/lt_start()
	for(var/mob/M in GLOB.player_list)
		M.overlay_fullscreen("kennet", /obj/screen/fullscreen/mech/lt2)

	var/novel_message = "Отлично, это последнее испытание. Вам предстоит продержаться N-ое количество времени на этом полигоне, \
	против надвигающихся волн противника. Не бойтесь умереть - вас просто вернёт обратно. Однако, старайтесь показать себя на все сто!"
	var/colored = "#ffffff"

	var/obj/screen/novel_message/first = new /obj/screen/novel_message()
	first.maptext_y = -420
	first.maptext_x = 20
	for(var/client/M in GLOB.clients)
		M.screen += first
		first.set_text(novel_message, colored)

	spawn(10 SECONDS)
		for(var/mob/M in GLOB.player_list)
			M.clear_fullscreen("kennet")
		for(var/obj/screen/novel_message/messages in world)
			animate(messages, 1 SECOND, alpha = 0)
			spawn(1 SECOND)
				qdel(messages)

/proc/lt_end()
	for(var/mob/M in GLOB.player_list)
		M.overlay_fullscreen("kennet", /obj/screen/fullscreen/mech/lt2)

	var/novel_message = "Вот же чёрт...похоже, генератор подстанции вышел из строя от такого количества запросов. \
	М-м...придётся закончить это своевременно! Я вас вытаскиваю!"
	var/colored = "#ffffff"

	var/obj/screen/novel_message/first = new /obj/screen/novel_message()
	first.maptext_y = -400
	first.maptext_x = 20
	for(var/client/M in GLOB.clients)
		M.screen += first
		first.set_text(novel_message, colored)

	spawn(6 SECONDS)
		for(var/mob/M in GLOB.player_list)
			M.clear_fullscreen("kennet")
		for(var/obj/screen/novel_message/messages in world)
			animate(messages, 1 SECOND, alpha = 0)
			spawn(1 SECOND)
				qdel(messages)

/proc/lt_end2()
	for(var/mob/M in GLOB.player_list)
		M.overlay_fullscreen("kennet", /obj/screen/fullscreen/mech/lt2)

	var/novel_message = "Как же мне влетит за это..."
	var/colored = "#ffffff"

	var/obj/screen/novel_message/first = new /obj/screen/novel_message()
	first.maptext_y = -400
	first.maptext_x = 20
	for(var/client/M in GLOB.clients)
		M.screen += first
		first.set_text(novel_message, colored)

	spawn(6 SECONDS)
		for(var/mob/M in GLOB.player_list)
			M.clear_fullscreen("kennet")
		for(var/obj/screen/novel_message/messages in world)
			animate(messages, 1 SECOND, alpha = 0)
			spawn(1 SECOND)
				qdel(messages)

/proc/error_text1()
	var/novel_message = ".../ВНИМАНИЕ: ОШИБКА СИМУЛЯЦИИ/..."
	var/colored = "#db0707"

	var/obj/screen/novel_message/first = new /obj/screen/novel_message()
	first.maptext_y = -160
	for(var/client/M in GLOB.clients)
		M.screen += first
		first.set_text(novel_message, colored)

	spawn(3 SECONDS)
		for(var/obj/screen/novel_message/messages in world)
			animate(messages, 1 SECOND, alpha = 0)
			spawn(1 SECOND)
				qdel(messages)

/proc/error_text2()
	var/novel_message = ".../ВНИМАНИЕ: ОШИБКА СИМУЛЯЦИИ/..."
	var/colored = "#db0707"

	var/obj/screen/novel_message/first = new /obj/screen/novel_message()
	first.maptext_y = -160
	for(var/client/M in GLOB.clients)
		M.screen += first
		first.set_text(novel_message, colored)

	spawn(3 SECONDS)
		for(var/obj/screen/novel_message/messages in world)
			animate(messages, 1 SECOND, alpha = 0)
			spawn(1 SECOND)
				qdel(messages)

/proc/error_text3()
	var/novel_message = ".../ВНИМАНИЕ: ОШИБКА СИМУЛЯЦИИ/..."
	var/colored = "#db0707"

	var/obj/screen/novel_message/first = new /obj/screen/novel_message()
	first.maptext_y = -160
	for(var/client/M in GLOB.clients)
		M.screen += first
		first.set_text(novel_message, colored)

	spawn(3 SECONDS)
		for(var/obj/screen/novel_message/messages in world)
			animate(messages, 1 SECOND, alpha = 0)
			spawn(1 SECOND)
				qdel(messages)

/proc/exp_tutorial()
	for(var/mob/M in GLOB.player_list)
		M.overlay_fullscreen("kennet", /obj/screen/fullscreen/mech/lt2)

	var/novel_message = "А вот ТУТ...уже интереснее! Вам понадобится поднять собственный нагрев, дабы затем использовать его для дальнего перемещения!"
	var/colored = "#ffffff"

	var/obj/screen/novel_message/first = new /obj/screen/novel_message()
	first.maptext_y = -400
	first.maptext_x = 20
	for(var/client/M in GLOB.clients)
		M.screen += first
		first.set_text(novel_message, colored)

	spawn(6 SECONDS)
		for(var/mob/M in GLOB.player_list)
			M.clear_fullscreen("kennet")
		for(var/obj/screen/novel_message/messages in world)
			animate(messages, 1 SECOND, alpha = 0)
			spawn(1 SECOND)
				qdel(messages)

/proc/exp_tutorial2()
	for(var/mob/M in GLOB.player_list)
		M.overlay_fullscreen("kennet", /obj/screen/fullscreen/mech/lt2)

	var/novel_message = "Активируйте свой энергетический щит(MMB по себе), наберите необходимое количество тепла, \
	и пропрыгайте по платформам(Alt+Click), дабы открыть проход дальше!"
	var/colored = "#ffffff"

	var/obj/screen/novel_message/first = new /obj/screen/novel_message()
	first.maptext_y = -400
	first.maptext_x = 20
	for(var/client/M in GLOB.clients)
		M.screen += first
		first.set_text(novel_message, colored)

	spawn(6 SECONDS)
		for(var/mob/M in GLOB.player_list)
			M.clear_fullscreen("kennet")
		for(var/obj/screen/novel_message/messages in world)
			animate(messages, 1 SECOND, alpha = 0)
			spawn(1 SECOND)
				qdel(messages)

/proc/trooper_tutorial()
	for(var/mob/M in GLOB.player_list)
		M.overlay_fullscreen("kennet", /obj/screen/fullscreen/mech/lt2)

	var/novel_message = "Стандартные модели, казалось бы, на то и стандартные - что ничем особенным не отличаются. \
	Впрочем, мы также оснастили вас экспериментальными гравитационными гранатами!(MMB) Попробуйте сбить вот того меха с его позиции!"
	var/colored = "#ffffff"

	var/obj/screen/novel_message/first = new /obj/screen/novel_message()
	first.maptext_y = -420
	first.maptext_x = 20
	for(var/client/M in GLOB.clients)
		M.screen += first
		first.set_text(novel_message, colored)

	spawn(8 SECONDS)
		for(var/mob/M in GLOB.player_list)
			M.clear_fullscreen("kennet")
		for(var/obj/screen/novel_message/messages in world)
			animate(messages, 1 SECOND, alpha = 0)
			spawn(1 SECOND)
				qdel(messages)

/proc/trooper_tutorial2()
	for(var/mob/M in GLOB.player_list)
		M.overlay_fullscreen("kennet", /obj/screen/fullscreen/mech/lt2)

	var/novel_message = "Затем, поставьте на него сенсорную метку(Alt+Click), чтобы дать вашим союзникам преимущество к стрельбе по нему!"
	var/colored = "#ffffff"

	var/obj/screen/novel_message/first = new /obj/screen/novel_message()
	first.maptext_y = -390
	first.maptext_x = 20
	for(var/client/M in GLOB.clients)
		M.screen += first
		first.set_text(novel_message, colored)

	spawn(6 SECONDS)
		for(var/mob/M in GLOB.player_list)
			M.clear_fullscreen("kennet")
		for(var/obj/screen/novel_message/messages in world)
			animate(messages, 1 SECOND, alpha = 0)
			spawn(1 SECOND)
				qdel(messages)

/proc/breacher_tutorial()
	for(var/mob/M in GLOB.player_list)
		M.overlay_fullscreen("kennet", /obj/screen/fullscreen/mech/lt2)

	var/novel_message = "С штурмовиками всё гораздо интереснее! \
	Они, конечно, не способны защитить вас как тяжеловики, но ликвидировав угрозу раньше \
	- вам и не придётся заботиться о том, как принимать удар."
	var/colored = "#ffffff"

	var/obj/screen/novel_message/first = new /obj/screen/novel_message()
	first.maptext_y = -410
	first.maptext_x = 20
	for(var/client/M in GLOB.clients)
		M.screen += first
		first.set_text(novel_message, colored)

	spawn(8 SECONDS)
		for(var/mob/M in GLOB.player_list)
			M.clear_fullscreen("kennet")
		for(var/obj/screen/novel_message/messages in world)
			animate(messages, 1 SECOND, alpha = 0)
			spawn(1 SECOND)
				qdel(messages)

/proc/breacher_tutorial2()
	for(var/mob/M in GLOB.player_list)
		M.overlay_fullscreen("kennet", /obj/screen/fullscreen/mech/lt2)

	var/novel_message = "Их атаки напрямую зависят от движения. Чем быстрее они бегут - тем страшнее и больнее будет итоговый импакт."
	var/colored = "#ffffff"

	var/obj/screen/novel_message/first = new /obj/screen/novel_message()
	first.maptext_y = -390
	first.maptext_x = 20
	for(var/client/M in GLOB.clients)
		M.screen += first
		first.set_text(novel_message, colored)

	spawn(6 SECONDS)
		for(var/mob/M in GLOB.player_list)
			M.clear_fullscreen("kennet")
		for(var/obj/screen/novel_message/messages in world)
			animate(messages, 1 SECOND, alpha = 0)
			spawn(1 SECOND)
				qdel(messages)

/proc/breacher_tutorial3()
	for(var/mob/M in GLOB.player_list)
		M.overlay_fullscreen("kennet", /obj/screen/fullscreen/mech/lt2)

	var/novel_message = "Если вам удалось успешно проткнуть противника и зафиксировать его на месте - \
	вы можете активировать спусковой крючок(Alt+Click) чтобы отправить во врага тяжёлый снаряд!"
	var/colored = "#ffffff"

	var/obj/screen/novel_message/first = new /obj/screen/novel_message()
	first.maptext_y = -400
	first.maptext_x = 20
	for(var/client/M in GLOB.clients)
		M.screen += first
		first.set_text(novel_message, colored)

	spawn(8 SECONDS)
		for(var/mob/M in GLOB.player_list)
			M.clear_fullscreen("kennet")
		for(var/obj/screen/novel_message/messages in world)
			animate(messages, 1 SECOND, alpha = 0)
			spawn(1 SECOND)
				qdel(messages)

/proc/engineer_tutorial()
	for(var/mob/M in GLOB.player_list)
		M.overlay_fullscreen("kennet", /obj/screen/fullscreen/mech/lt2)

	var/novel_message = "Юниты поддержки - не менее важны. Они несут на себе припасы не только для вашего ремонта, но и для пополнения вашего боезапаса."
	var/colored = "#ffffff"

	var/obj/screen/novel_message/first = new /obj/screen/novel_message()
	first.maptext_y = -390
	first.maptext_x = 20
	for(var/client/M in GLOB.clients)
		M.screen += first
		first.set_text(novel_message, colored)

	spawn(6 SECONDS)
		for(var/mob/M in GLOB.player_list)
			M.clear_fullscreen("kennet")
		for(var/obj/screen/novel_message/messages in world)
			animate(messages, 1 SECOND, alpha = 0)
			spawn(1 SECOND)
				qdel(messages)

/proc/engineer_tutorial2()
	for(var/mob/M in GLOB.player_list)
		M.overlay_fullscreen("kennet", /obj/screen/fullscreen/mech/lt2)

	var/novel_message = "Они также оснащены особыми магнитными тросами, способными подтягивать(Alt+Click) и перемещать на себе даже самых ТЯЖЁЛЫХ мехов."
	var/colored = "#ffffff"

	var/obj/screen/novel_message/first = new /obj/screen/novel_message()
	first.maptext_y = -390
	first.maptext_x = 20
	for(var/client/M in GLOB.clients)
		M.screen += first
		first.set_text(novel_message, colored)

	spawn(6 SECONDS)
		for(var/mob/M in GLOB.player_list)
			M.clear_fullscreen("kennet")
		for(var/obj/screen/novel_message/messages in world)
			animate(messages, 1 SECOND, alpha = 0)
			spawn(1 SECOND)
				qdel(messages)

/proc/engineer_tutorial3()
	for(var/mob/M in GLOB.player_list)
		M.overlay_fullscreen("kennet", /obj/screen/fullscreen/mech/lt2)

	var/novel_message = "А встроенные усиленные сенсоры всегда помогут вам вовремя пропинговать скрытого в тени ВРАГА! Т-только не активируйте их слишком часто - сгорите ещё..."
	var/colored = "#ffffff"

	var/obj/screen/novel_message/first = new /obj/screen/novel_message()
	first.maptext_y = -390
	first.maptext_x = 20
	for(var/client/M in GLOB.clients)
		M.screen += first
		first.set_text(novel_message, colored)

	spawn(6 SECONDS)
		for(var/mob/M in GLOB.player_list)
			M.clear_fullscreen("kennet")
		for(var/obj/screen/novel_message/messages in world)
			animate(messages, 1 SECOND, alpha = 0)
			spawn(1 SECOND)
				qdel(messages)

/proc/scout_tutorial()
	for(var/mob/M in GLOB.player_list)
		M.overlay_fullscreen("kennet", /obj/screen/fullscreen/mech/lt2)

	var/novel_message = "Далее у нас - скауты. Ваши мехи были оснащены новейшей маскировкой! \
	С ней, вы с лёгкостью сможете подобраться к врагу, и нанести чёткий удар по их слабому месту."
	var/colored = "#ffffff"

	var/obj/screen/novel_message/first = new /obj/screen/novel_message()
	first.maptext_y = -390
	first.maptext_x = 20
	for(var/client/M in GLOB.clients)
		M.screen += first
		first.set_text(novel_message, colored)

	spawn(8 SECONDS)
		for(var/mob/M in GLOB.player_list)
			M.clear_fullscreen("kennet")
		for(var/obj/screen/novel_message/messages in world)
			animate(messages, 1 SECOND, alpha = 0)
			spawn(1 SECOND)
				qdel(messages)

/proc/scout_tutorial2()
	for(var/mob/M in GLOB.player_list)
		M.overlay_fullscreen("kennet", /obj/screen/fullscreen/mech/lt2)

	var/novel_message = "Вместе с тем, вы также оснащены рядом программных утилит(Alt+Click), которые позволят вам проломить даже лёд Восхождения. \
	Не забывайте, что вне маскировки вас мгновенно раскроют, и чаще сканируйте(Shift+Click) вашего врага чтобы знать, способны ли вы тягаться с таким."
	var/colored = "#ffffff"

	var/obj/screen/novel_message/first = new /obj/screen/novel_message()
	first.maptext_y = -420
	first.maptext_x = 20
	for(var/client/M in GLOB.clients)
		M.screen += first
		first.set_text(novel_message, colored)

	spawn(8 SECONDS)
		for(var/mob/M in GLOB.player_list)
			M.clear_fullscreen("kennet")
		for(var/obj/screen/novel_message/messages in world)
			animate(messages, 1 SECOND, alpha = 0)
			spawn(1 SECOND)
				qdel(messages)

/proc/heavy_tutorial()
	for(var/mob/M in GLOB.player_list)
		M.overlay_fullscreen("kennet", /obj/screen/fullscreen/mech/lt2)

	var/novel_message = "Начнём с простого. Класс тяжёлых мехов - ваша основная защитная единица. \
	Они - буквальная стена между ними и вами. Создайте заграждение, активировав режим бункера и попробуйте ликвидировать превосходящие силы противника."
	var/colored = "#ffffff"

	var/obj/screen/novel_message/first = new /obj/screen/novel_message()
	first.maptext_y = -420
	first.maptext_x = 20
	for(var/client/M in GLOB.clients)
		M.screen += first
		first.set_text(novel_message, colored)

	spawn(6 SECONDS)
		for(var/mob/M in GLOB.player_list)
			M.clear_fullscreen("kennet")
		for(var/obj/screen/novel_message/messages in world)
			animate(messages, 1 SECOND, alpha = 0)
			spawn(1 SECOND)
				qdel(messages)

/proc/heavy_tutorial2()
	for(var/mob/M in GLOB.player_list)
		M.overlay_fullscreen("kennet", /obj/screen/fullscreen/mech/lt2)

	var/novel_message = "Ваши союзники также могут использовать ваш бункерный режим для того, чтобы защититься от урона!"
	var/colored = "#ffffff"

	var/obj/screen/novel_message/first = new /obj/screen/novel_message()
	first.maptext_y = -390
	first.maptext_x = 20
	for(var/client/M in GLOB.clients)
		M.screen += first
		first.set_text(novel_message, colored)

	spawn(6 SECONDS)
		for(var/mob/M in GLOB.player_list)
			M.clear_fullscreen("kennet")
		for(var/obj/screen/novel_message/messages in world)
			animate(messages, 1 SECOND, alpha = 0)
			spawn(1 SECOND)
				qdel(messages)

/proc/heavy_tutorial3()
	for(var/mob/M in GLOB.player_list)
		M.overlay_fullscreen("kennet", /obj/screen/fullscreen/mech/lt2)

	var/novel_message = "Но это далеко не единственное, на что они способны. 'Дрейки' - ещё и сокрушители лёгкой пехоты. Они с лёгкостью способны уничтожать большие группы врагов, если достаточно разгонят своё орудие!"
	var/colored = "#ffffff"

	var/obj/screen/novel_message/first = new /obj/screen/novel_message()
	first.maptext_y = -420
	first.maptext_x = 20
	for(var/client/M in GLOB.clients)
		M.screen += first
		first.set_text(novel_message, colored)

	spawn(6 SECONDS)
		for(var/mob/M in GLOB.player_list)
			M.clear_fullscreen("kennet")
		for(var/obj/screen/novel_message/messages in world)
			animate(messages, 1 SECOND, alpha = 0)
			spawn(1 SECOND)
				qdel(messages)

/proc/enter_simulation()

	lt1_sim_first()

	spawn(7 SECONDS)
		lt1_sim_second()

	spawn(12 SECONDS)
		for(var/mob/living/all in GLOB.player_list)
			all.Stun(99999)
			all.overlay_fullscreen("blackscreen", /obj/screen/fullscreen/fd/blackout/alt)
			all.overlay_fullscreen("fishbed", /obj/screen/fullscreen/fishbed/fd)
		try_to_connect()

	spawn(180 SECONDS)
		lt1_sim_third()
		for(var/mob/living/all in GLOB.player_list)
			all.stunned = 0
			all.clear_fullscreen("blackscreen")
			all.clear_fullscreen("fishbed")

/proc/try_to_connect()
	var/novel_message = ".../УСТАНАВЛИВАЕМ СОЕДИНЕНИЕ/..."
	var/colored = "#4ec908"

	var/obj/screen/novel_message/first = new /obj/screen/novel_message()
	first.maptext_y = -160
	for(var/client/M in GLOB.clients)
		M.screen += first
		first.set_text(novel_message, colored)

	spawn(180 SECONDS)
		for(var/obj/screen/novel_message/messages in world)
			animate(messages, 1 SECOND, alpha = 0)
			spawn(1 SECOND)
				qdel(messages)

/proc/lt1_sim_first()
	for(var/mob/M in GLOB.player_list)
		M.overlay_fullscreen("kennet", /obj/screen/fullscreen/mech/lt2)

	var/novel_message = "Вижу, вы уже готовы? Кольцов, Жукова...12-й...Ага, все в своих машинах!"
	var/colored = "#ffffff"

	var/obj/screen/novel_message/first = new /obj/screen/novel_message()
	first.maptext_y = -390
	first.maptext_x = 20
	for(var/client/M in GLOB.clients)
		M.screen += first
		first.set_text(novel_message, colored)

	spawn(6 SECONDS)
		for(var/mob/M in GLOB.player_list)
			M.clear_fullscreen("kennet")
		for(var/obj/screen/novel_message/messages in world)
			animate(messages, 1 SECOND, alpha = 0)
			spawn(1 SECOND)
				qdel(messages)

/proc/lt1_sim_third()
	for(var/mob/M in GLOB.player_list)
		M.overlay_fullscreen("kennet", /obj/screen/fullscreen/mech/lt2)

	var/novel_message = "Эй? Вы меня слышите? Такие резкие переходы не особо хорошо сказываются на ментальном состоянии некоторых пилотов...как только вы будете готовы - пройдите дальше для начала тренировки!"
	var/colored = "#ffffff"

	var/obj/screen/novel_message/first = new /obj/screen/novel_message()
	first.maptext_y = -390
	first.maptext_x = 20
	for(var/client/M in GLOB.clients)
		M.screen += first
		first.set_text(novel_message, colored)

	spawn(6 SECONDS)
		for(var/mob/M in GLOB.player_list)
			M.clear_fullscreen("kennet")
		for(var/obj/screen/novel_message/messages in world)
			animate(messages, 1 SECOND, alpha = 0)
			spawn(1 SECOND)
				qdel(messages)

/proc/lt1_sim_second()
	for(var/mob/M in GLOB.player_list)
		M.overlay_fullscreen("kennet", /obj/screen/fullscreen/mech/lt2)

	var/novel_message = "Отли-ично! Наши инженеры как раз закончили с подготовкой симуляции! Постарайтесь расслабиться, я погружу вас в искусственный анабиоз через..."
	var/colored = "#ffffff"

	var/obj/screen/novel_message/first = new /obj/screen/novel_message()
	first.maptext_y = -390
	first.maptext_x = 20
	for(var/client/M in GLOB.clients)
		M.screen += first
		first.set_text(novel_message, colored)

	spawn(6 SECONDS)
		for(var/mob/M in GLOB.player_list)
			M.clear_fullscreen("kennet")
		for(var/obj/screen/novel_message/messages in world)
			animate(messages, 1 SECOND, alpha = 0)
			spawn(1 SECOND)
				qdel(messages)

/proc/mech_roster()
	for(var/mob/all in GLOB.player_list)
		all.Stun(99999)
		all.overlay_fullscreen("blackscreen", /obj/screen/fullscreen/fd/blackout/alt)
		all.overlay_fullscreen("fishbed", /obj/screen/fullscreen/fishbed/fd)
		spawn(8 SECONDS)
			all.overlay_fullscreen("alexandra", /obj/screen/fullscreen/mech/document_alexandra) //yes
			all.overlay_fullscreen("ootsuki", /obj/screen/fullscreen/mech/document_ootsuki) //yes
			all.overlay_fullscreen("emilio", /obj/screen/fullscreen/mech/document_emilio) //yes
			all.overlay_fullscreen("hat12", /obj/screen/fullscreen/mech/document_hat12)
			all.overlay_fullscreen("vladimir", /obj/screen/fullscreen/mech/document_vladimir) //yes
			all.overlay_fullscreen("stella", /obj/screen/fullscreen/mech/document_stella) //yes
			all.overlay_fullscreen("coil", /obj/screen/fullscreen/mech/document_coil) //yes
			all.overlay_fullscreen("emmy", /obj/screen/fullscreen/mech/document_emmy) //yes
			all.overlay_fullscreen("john", /obj/screen/fullscreen/mech/document_john) //yes
			all.overlay_fullscreen("amaryllis", /obj/screen/fullscreen/mech/document_amaryllis) //yes
			all.overlay_fullscreen("valery", /obj/screen/fullscreen/mech/document_valery) //yes
			all.overlay_fullscreen("krass", /obj/screen/fullscreen/mech/document_krass) //yes
			all.overlay_fullscreen("bernard", /obj/screen/fullscreen/mech/document_bernard) //yes
			all.overlay_fullscreen("kazi", /obj/screen/fullscreen/mech/document_kazi) //yes

	spawn(1 SECOND)
		time_and_place()
	spawn(2 SECONDS)
		until_end()

	spawn(10 SECONDS)
		captain_first_quote()

	spawn(18 SECONDS)
		robot_first_quote()

	spawn(28 SECONDS)
		robot_second_quote()

	spawn(36 SECONDS)
		lt1_first_quote()

	spawn(44 SECONDS)
		captain_second_quote()

	spawn(51 SECONDS)
		captain_third_quote()

	spawn(58 SECONDS)
		lt2_first_quote()
		for(var/mob/all in GLOB.player_list)
			all.clear_fullscreen("blackscreen")
			all.clear_fullscreen("fishbed")
			all.clear_fullscreen("alexandra")
			all.clear_fullscreen("ootsuki")
			all.clear_fullscreen("emilio")
			all.clear_fullscreen("hat12")
			all.clear_fullscreen("vladimir")
			all.clear_fullscreen("stella")
			all.clear_fullscreen("coil")

	spawn(65 SECONDS)
		captain_fourth_quote()
		for(var/mob/all in GLOB.player_list)
			all.clear_fullscreen("emmy")
			all.clear_fullscreen("john")
			all.clear_fullscreen("amaryllis")
			all.clear_fullscreen("valery")
			all.clear_fullscreen("krass")
			all.clear_fullscreen("krass")
			all.clear_fullscreen("bernard")
			all.clear_fullscreen("kazi")

	spawn(72 SECONDS)
		lt2_second_quote()

	spawn(80 SECONDS)
		lt2_third_quote()
		for(var/mob/all in GLOB.player_list)
			all.stunned = 0

	spawn(96 SECONDS)
		lt2_fourth_quote()

/proc/time_and_place()
	var/novel_message = "2318-05-09|06 ЧАСОВ УТРА| SFV 'БРЕДБЕРИ'"
	var/colored = "#4ec908"

	var/obj/screen/novel_message/first = new /obj/screen/novel_message()
	first.maptext_y = -140
	for(var/client/M in GLOB.clients)
		M.screen += first
		first.set_text(novel_message, colored)

	spawn(6 SECONDS)
		for(var/obj/screen/novel_message/messages in world)
			animate(messages, 1 SECOND, alpha = 0)
			spawn(1 SECOND)
				qdel(messages)

/proc/until_end()
	var/novel_message = "12 ЧАСОВ ДО ПАДЕНИЯ ГАЙИ"
	var/colored = "#4ec908"

	var/obj/screen/novel_message/first = new /obj/screen/novel_message()
	first.maptext_y = -160
	for(var/client/M in GLOB.clients)
		M.screen += first
		first.set_text(novel_message, colored)

	spawn(6 SECONDS)
		for(var/obj/screen/novel_message/messages in world)
			animate(messages, 1 SECOND, alpha = 0)
			spawn(1 SECOND)
				qdel(messages)

/proc/captain_first_quote()
	for(var/mob/M in GLOB.player_list)
		M.overlay_fullscreen("stain", /obj/screen/fullscreen/mech/captain)

	var/novel_message = "И это ваша хвалёная помощь? Инвалиды, дети, и психопаты?"
	var/colored = "#ffffff"

	var/obj/screen/novel_message/first = new /obj/screen/novel_message()
	first.maptext_y = -390
	first.maptext_x = 20
	for(var/client/M in GLOB.clients)
		M.screen += first
		first.set_text(novel_message, colored)

	spawn(6 SECONDS)
		for(var/mob/M in GLOB.player_list)
			M.clear_fullscreen("stain")
		for(var/obj/screen/novel_message/messages in world)
			animate(messages, 1 SECOND, alpha = 0)
			spawn(1 SECOND)
				qdel(messages)

/proc/robot_first_quote()
	for(var/mob/M in GLOB.player_list)
		M.overlay_fullscreen("rk560", /obj/screen/fullscreen/mech/robot)

	var/novel_message = "Добровольцы, сэр. Все, кого удалось найти."
	var/colored = "#ffffff"

	var/obj/screen/novel_message/first = new /obj/screen/novel_message()
	first.maptext_y = -390
	first.maptext_x = 20
	for(var/client/M in GLOB.clients)
		M.screen += first
		first.set_text(novel_message, colored)

	spawn(6 SECONDS)
		for(var/mob/M in GLOB.player_list)
			M.clear_fullscreen("rk560")
		for(var/obj/screen/novel_message/messages in world)
			animate(messages, 1 SECOND, alpha = 0)
			spawn(1 SECOND)
				qdel(messages)

/proc/robot_second_quote()
	for(var/mob/M in GLOB.player_list)
		M.overlay_fullscreen("rk560", /obj/screen/fullscreen/mech/robot)

	var/novel_message = "Если выражаться точнее...все, у кого ещё есть руки и ноги для того чтобы осуществлять управление машиной."
	var/colored = "#ffffff"

	var/obj/screen/novel_message/first = new /obj/screen/novel_message()
	first.maptext_y = -390
	first.maptext_x = 20
	for(var/client/M in GLOB.clients)
		M.screen += first
		first.set_text(novel_message, colored)

	spawn(6 SECONDS)
		for(var/mob/M in GLOB.player_list)
			M.clear_fullscreen("rk560")
		for(var/obj/screen/novel_message/messages in world)
			animate(messages, 1 SECOND, alpha = 0)
			spawn(1 SECOND)
				qdel(messages)

/proc/lt1_first_quote()
	for(var/mob/M in GLOB.player_list)
		M.overlay_fullscreen("gard", /obj/screen/fullscreen/mech/lt1)

	var/novel_message = "Здесь с железкой вынужден согласиться даже я. Другие варианты вам бы не понравились тем более."
	var/colored = "#ffffff"

	var/obj/screen/novel_message/first = new /obj/screen/novel_message()
	first.maptext_y = -390
	first.maptext_x = 20
	for(var/client/M in GLOB.clients)
		M.screen += first
		first.set_text(novel_message, colored)

	spawn(6 SECONDS)
		for(var/mob/M in GLOB.player_list)
			M.clear_fullscreen("gard")
		for(var/obj/screen/novel_message/messages in world)
			animate(messages, 1 SECOND, alpha = 0)
			spawn(1 SECOND)
				qdel(messages)

/proc/captain_second_quote()
	for(var/mob/M in GLOB.player_list)
		M.overlay_fullscreen("stain", /obj/screen/fullscreen/mech/captain)

	var/novel_message = "*тяжело вздыхает*"
	var/colored = "#ffffff"

	var/obj/screen/novel_message/first = new /obj/screen/novel_message()
	first.maptext_y = -390
	first.maptext_x = 20
	for(var/client/M in GLOB.clients)
		M.screen += first
		first.set_text(novel_message, colored)

	spawn(6 SECONDS)
		for(var/mob/M in GLOB.player_list)
			M.clear_fullscreen("stain")
		for(var/obj/screen/novel_message/messages in world)
			animate(messages, 1 SECOND, alpha = 0)
			spawn(1 SECOND)
				qdel(messages)

/proc/captain_third_quote()
	for(var/mob/M in GLOB.player_list)
		M.overlay_fullscreen("stain", /obj/screen/fullscreen/mech/captain)

	var/novel_message = "Хорошо. Посмотрим, на что эти индивиды способны. Кеннет?"
	var/colored = "#ffffff"

	var/obj/screen/novel_message/first = new /obj/screen/novel_message()
	first.maptext_y = -390
	first.maptext_x = 20
	for(var/client/M in GLOB.clients)
		M.screen += first
		first.set_text(novel_message, colored)

	spawn(6 SECONDS)
		for(var/mob/M in GLOB.player_list)
			M.clear_fullscreen("stain")
		for(var/obj/screen/novel_message/messages in world)
			animate(messages, 1 SECOND, alpha = 0)
			spawn(1 SECOND)
				qdel(messages)

/proc/lt2_first_quote()
	for(var/mob/M in GLOB.player_list)
		M.overlay_fullscreen("kennet", /obj/screen/fullscreen/mech/lt2)

	var/novel_message = "Здесь! Сэр!"
	var/colored = "#ffffff"

	var/obj/screen/novel_message/first = new /obj/screen/novel_message()
	first.maptext_y = -390
	first.maptext_x = 20
	for(var/client/M in GLOB.clients)
		M.screen += first
		first.set_text(novel_message, colored)

	spawn(6 SECONDS)
		for(var/mob/M in GLOB.player_list)
			M.clear_fullscreen("kennet")
		for(var/obj/screen/novel_message/messages in world)
			animate(messages, 1 SECOND, alpha = 0)
			spawn(1 SECOND)
				qdel(messages)

/proc/captain_fourth_quote()
	for(var/mob/M in GLOB.player_list)
		M.overlay_fullscreen("stain", /obj/screen/fullscreen/mech/captain)

	var/novel_message = "Прогони их по базовым тестам. Выживших затем направить ко мне."
	var/colored = "#ffffff"

	var/obj/screen/novel_message/first = new /obj/screen/novel_message()
	first.maptext_y = -390
	first.maptext_x = 20
	for(var/client/M in GLOB.clients)
		M.screen += first
		first.set_text(novel_message, colored)

	spawn(6 SECONDS)
		for(var/mob/M in GLOB.player_list)
			M.clear_fullscreen("stain")
		for(var/obj/screen/novel_message/messages in world)
			animate(messages, 1 SECOND, alpha = 0)
			spawn(1 SECOND)
				qdel(messages)

/proc/lt2_second_quote()
	for(var/mob/M in GLOB.player_list)
		M.overlay_fullscreen("kennet", /obj/screen/fullscreen/mech/lt2)

	var/novel_message = "Выполним в кратчайшие сроки!"
	var/colored = "#ffffff"

	var/obj/screen/novel_message/first = new /obj/screen/novel_message()
	first.maptext_y = -390
	first.maptext_x = 20
	for(var/client/M in GLOB.clients)
		M.screen += first
		first.set_text(novel_message, colored)

	spawn(6 SECONDS)
		for(var/mob/M in GLOB.player_list)
			M.clear_fullscreen("kennet")
		for(var/obj/screen/novel_message/messages in world)
			animate(messages, 1 SECOND, alpha = 0)
			spawn(1 SECOND)
				qdel(messages)

/proc/lt2_third_quote()
	for(var/mob/M in GLOB.player_list)
		M.overlay_fullscreen("kennet", /obj/screen/fullscreen/mech/lt2)

	var/novel_message = "Вы слышали капитана, господа! У вас есть несколько минут, чтобы перевести дух с пути, а затем - к машинам!"
	var/colored = "#ffffff"

	var/obj/screen/novel_message/first = new /obj/screen/novel_message()
	first.maptext_y = -390
	first.maptext_x = 20
	for(var/client/M in GLOB.clients)
		M.screen += first
		first.set_text(novel_message, colored)

	spawn(6 SECONDS)
		for(var/mob/M in GLOB.player_list)
			M.clear_fullscreen("kennet")
		for(var/obj/screen/novel_message/messages in world)
			animate(messages, 1 SECOND, alpha = 0)
			spawn(1 SECOND)
				qdel(messages)

/proc/lt2_fourth_quote()
	for(var/mob/M in GLOB.player_list)
		M.overlay_fullscreen("kennet", /obj/screen/fullscreen/mech/lt2)

	var/novel_message = "А, и...если кому-либо из вас нехорошо, я могла бы позвать врачей-"
	var/colored = "#ffffff"

	var/obj/screen/novel_message/first = new /obj/screen/novel_message()
	first.maptext_y = -390
	first.maptext_x = 20
	for(var/client/M in GLOB.clients)
		M.screen += first
		first.set_text(novel_message, colored)

	spawn(6 SECONDS)
		for(var/mob/M in GLOB.player_list)
			M.clear_fullscreen("kennet")
		for(var/obj/screen/novel_message/messages in world)
			animate(messages, 1 SECOND, alpha = 0)
			spawn(1 SECOND)
				qdel(messages)

////// МЕХИ СИМУЛЯКРЫ //////

/mob/living/simple_animal/hostile/fd/mech/napoleon/holo
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/mechs/mechs_sim.dmi'
	icon_state = "TROOPER"
	icon_living = "TROOPER"

	wreck_type = null

	integrity = 250
	integrity_max = 250
	repairs_left = 0

	heat_overflow = 5

/mob/living/simple_animal/hostile/fd/mech/drake/holo
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/mechs/mechs_sim.dmi'
	icon_state = "HEAVY"
	icon_living = "HEAVY"

	wreck_type = null

	integrity = 500
	integrity_max = 500
	repairs_left = 0

	heat_overflow = 5

	pixel_x = -125
	default_pixel_x = -125

/mob/living/simple_animal/hostile/fd/mech/lancaster/holo
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/mechs/mechs_sim.dmi'
	icon_state = "ENGINEER"
	icon_living = "ENGINEER"

	wreck_type = null

	integrity = 250
	integrity_max = 250
	repairs_left = 0

	heat_overflow = 3

/mob/living/simple_animal/hostile/fd/mech/saladin/holo
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/mechs/mechs_sim.dmi'
	icon_state = "EXPERIMENTAL"
	icon_living = "EXPERIMENTAL"

	wreck_type = null
	has_overheated_state = FALSE

	integrity = 150
	integrity_max = 150
	repairs_left = 0

	heat_overflow = 20

/mob/living/simple_animal/hostile/fd/mech/goblintail/holo
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/mechs/mechs_sim.dmi'
	icon_state = "SCOUT"
	icon_living = "SCOUT"

	wreck_type = null

	integrity = 150
	integrity_max = 150
	repairs_left = 0

	heat_overflow = 5

	pixel_x = -110
	default_pixel_x = -110
	pixel_y = -60
	default_pixel_y = -60

/// Без нельсона куз он очень опасный даже с дебаффами, а ещё мне лень снижать урон милишки :P
