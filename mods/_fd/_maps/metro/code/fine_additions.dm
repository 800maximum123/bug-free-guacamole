/obj/structure/fd/interactive/basic_power/fuse_box/filtration/turn_on()
	area.unbreathable = FALSE
	. = ..()

/obj/structure/fd/interactive/basic_power/fuse_box/filtration/turn_off()
	area.unbreathable = TRUE
	. = ..()

/obj/structure/fd/decorative_pipes
	name = "pipe"
	desc = "Simple pipe."
	icon = 'mods/_fd/_maps/metro/icons/pipes.dmi'
	icon_state = "large_pipe_ground"

/particles/gasleak
	name = "gasleak"

	icon = 'icons/effects/particles.dmi'
	icon_state = list("steam_1" = 1, "steam_2" = 1, "steam_3" = 1)

	width = 200
	height = 500
	count = 2400
	spawning = 20
	lifespan = 40
	fade = 40
	position = generator("box", list(-8, -8), list(8, 0), NORMAL_RAND)
	friction = 0.1
	color = COLOR_PALE_BTL_GREEN
	gravity = list(0, 1)
	drift = generator("vector", list(-0.3, -0.4), list(0.3, 0.4))
	velocity = generator("box", list(-2, 3), list(2, 3), NORMAL_RAND)

/obj/particle_emitter/gasleak
	particle_type = "gasleak"
	appearance_flags = NO_CLIENT_COLOR
	layer = FIRE_LAYER
	alpha = 100

/obj/structure/fd/interactive/leak
	name = "pipe"
	desc = "Шипит...."

	desc_special_show = TRUE
	desc_special = {"Похоже, <span style="color: green;">газ</span> идёт отсюда."}

	icon = 'mods/_fd/_maps/metro/icons/pipes.dmi'
	icon_state = "large_pipe_ground"

	var/datum/sound_token/sound_token
	var/sound_id

	var/obj/particle_emitter/P
	var/area/A

/obj/structure/fd/interactive/leak/Initialize()
	. = ..()

	A = get_area(src)
	START_PROCESSING(SSobj,src)

/obj/structure/fd/interactive/leak/Process()
	update_sound()

	if(A.unbreathable && !P)
		P = new /obj/particle_emitter/gasleak(get_turf(src))
		switch(dir)
			if(NORTH)
				P.pixel_y = pixel_y + 15
				layer = FIRE_LAYER + 0.1
			if(SOUTH)
				P.pixel_y = pixel_y + 5
			if(WEST)
				P.pixel_x = pixel_x - 15
				P.pixel_y = pixel_y + 5
			if(EAST)
				P.pixel_x = pixel_x + 15
				P.pixel_y = pixel_y + 5

	if(!A.unbreathable && P)
		qdel(P)

/obj/structure/fd/interactive/leak/proc/update_sound()
	if(!sound_id)
		sound_id = "[type]_[sequential_id(/obj/structure/fd/interactive/leak)]"
	if(A.unbreathable)
		if(!sound_token)
			sound_token = GLOB.sound_player.PlayLoopingSound(src, sound_id, 'sound/machines/pipeleak.ogg', volume = 50)
		sound_token.SetVolume(50)
	else if(sound_token)
		QDEL_NULL(sound_token)

/obj/structure/plasticflaps/rocks
	name = "\improper falling rocks"
	desc = "A pile of rocks. Maybe you can crawl under them?"
	icon = 'mods/_fd/_maps/metro/icons/walls.dmi'
	icon_state = "rock-dark"
	obj_flags = ATOM_FLAG_NO_TOOLS

/obj/structure/fd/dead_bodies_goon
	name = "\improper dead body"
	desc = "Whatever did this to him..."
	icon = 'mods/_fd/_maps/metro/icons/bodies.dmi'
	icon_state = "seccorpse1"

/mob/living/simple_animal/cutscene_character/big_airlock
	name = "\improper airlock"
	desc = "You can't read this"
	mouse_opacity = FALSE
	opacity = TRUE
	icon = 'icons/obj/doors/double/door.dmi'
	icon_state = "preview"
	icon_living = "preview"
	icon_dead = "preview"

	should_show_name = FALSE

/mob/living/simple_animal/cutscene_character/dead_body
	name = "\improper dead body"
	desc = "Whatever did this to him..."
	icon = 'mods/_fd/_maps/metro/icons/bodies.dmi'
	icon_state = "seccorpse5"

	should_show_name = FALSE

/obj/structure/fd/mapping/cutscene_trigger
	name = "cutscene trigger"
	desc = "cutscene trigger"
	icon = 'mods/_fd/fd_utilities/icons/newsource.dmi'
	icon_state = "sequence"
	mouse_opacity = FALSE
	anchored = TRUE

	var/fired = FALSE

	var/datum/modular_cutscene/cutscene_to_play = null
	var/trigger_id = "test"

/obj/structure/fd/mapping/cutscene_trigger/Crossed(mob/living/user)
	. = ..()

	if(ishuman(user) && !fired)

		fired = TRUE
		for(var/obj/structure/fd/mapping/cutscene_trigger/A in world)
			if(A.trigger_id == trigger_id)
				A.fired = TRUE

		start_cutscene(cutscene_to_play)

/obj/effect/cutscene_camera/metro1
	camera_id = "Метро - Первая встреча"

/obj/effect/cutscene_camera/metro2
	camera_id = "Метро - Атака"

/proc/metro_cutscene1()
	start_cutscene(/datum/modular_cutscene/metro1)

/proc/metro_cutscene2()
	start_cutscene(/datum/modular_cutscene/metro2)

/datum/modular_cutscene/metro1/setup_actions(...)
	actions = list(
		ADD_SCREEN(/blackout/animated_better) = 2 SECONDS,
		REMOVE_SCREEN(/blackout/animated_better, 0.5 SECONDS),
		TP_CAMERA("Метро - Первая встреча"),
		ADD_SCREEN(/cinema_borders) = 0.5 SECONDS,

		MOVE_CAMERA(0, 4, 10 SECONDS, SINE_EASING|EASE_OUT) = 12 SECONDS,
		PLAY_SOUND(sound('sound/effects/squelch2.ogg', volume = 100)),
		SHIFT_ACTOR(actor("Мёртвое тело"), -96, 0, 0.5 SECONDS, SINE_EASING|EASE_IN, null) = 0.5 SECONDS,
		MOVE_ACTOR(actor("Мёртвое тело"), WEST) = 0.2 SECONDS,
		MOVE_ACTOR(actor("Мёртвое тело"), WEST) = 0.2 SECONDS,
		CHANGE_ACTOR_VISIBILITY(actor("Мёртвое тело"), 0, 0, null, null),
		MOVE_CAMERA(0, 0, 2 SECONDS, SINE_EASING|EASE_IN) = 2 SECONDS,

		RETURN_VIEWERS
	)

/proc/metro_screentext()
	var/mob/living/speaker
	var/list/candidats = list()
	var/area/metro/maintain/south/area = locate() in world
	for(var/mob/living/carbon/human/H in area)
		H.forceMove(get_turf(speaker))
		H.forceMove(get_step(H, pick(GLOB.alldirs)))
		candidats += H

	speaker = pick(candidats)
	candidats -= speaker

	var/message = {"<span style="color: yellow;">[speaker.name]</span>: Похоже, они лежат здесь уже некоторое время..."}

	var/obj/screen/player_message/maintext = new /obj/screen/player_message()
	maintext.plane = HUD_PLANE
	maintext.layer = HUD_ABOVE_HUD_LAYER
	maintext.maptext_x = 0
	maintext.maptext_y = -310

	for(var/client/M in GLOB.clients)
		M.screen += maintext
		maintext.set_text(message, COLOR_WHITE)

	spawn(6 SECONDS)
		if(length(candidats))
			speaker = pick(candidats)
			candidats -= speaker
		else
			for(var/mob/living/carbon/human/H in orange(30,speaker))
				H.forceMove(get_turf(speaker))
				H.forceMove(get_step(H, pick(GLOB.alldirs)))
				candidats += H
			speaker = pick(candidats)
			candidats -= speaker

		message = {"<span style="color: yellow;">[speaker.name]</span>: Думаете, Терра?"}
		maintext.set_text(message, COLOR_WHITE)

	spawn(12 SECONDS)
		speaker = pick(candidats)
		message = {"<span style="color: yellow;">[speaker.name]</span>: Исключено."}
		maintext.set_text(message, COLOR_WHITE)

	spawn(16 SECONDS)
		message = {"<span style="color: yellow;">[speaker.name]</span>: Смотрите в оба. Что бы их не убило - оно всё ещё где-то рядом."}
		maintext.set_text(message, COLOR_WHITE)

	spawn(22 SECONDS)

		for(var/client/M in GLOB.clients)
			for(var/obj/screen/messages in M.screen)
				if(istype(messages, /obj/screen/player_message))
					M.screen -= messages
					qdel(messages)

/datum/modular_cutscene/metro2/setup_actions(...)
	actions = list(
		ADD_SCREEN(/blackout/animated_better) = 2 SECONDS,
		MOVE_CAMERA(6, 0, 0, null),
		REMOVE_SCREEN(/blackout/animated_better, 0.5 SECONDS),
		TP_CAMERA("Метро - Атака"),
		ADD_SCREEN(/cinema_borders) = 0.5 SECONDS,

		CHANGE_ACTOR_VISIBILITY(actor("Дверь"), 255, 0, null, null),

		CALL_GLOB(metro_screentext),
		MOVE_CAMERA(0, 0, 10 SECONDS, SINE_EASING|EASE_OUT) = 12 SECONDS,
		MOVE_CAMERA(0, 6, 10 SECONDS, SINE_EASING|EASE_OUT) = 12 SECONDS,
		CHANGE_ACTOR_VISUALS(actor("Дверь"), "opening") = 0.5 SECONDS,
		CHANGE_ACTOR_VISUALS(actor("Дверь"), "open") = 1 SECONDS,
		ADD_SCREEN(/blackout/animated_better) = 2 SECONDS,
		MOVE_CAMERA(0, 0, 0, null) = 1 SECONDS,
		RETURN_VIEWERS
	)

/datum/interactive_note/nightmare/tutorial_ooc_hiding
	name = "Прятки"
	note_info = {"<br /> \
				Некоторые объекты имеют достаточно пространства внутри, чтобы в них спрятался взрослый человек.<br /> \
				Взаимодействуйте с ними так же, как и с любыми другими интерактивными элементами окружения -<br /> \
				нажатием <b><span style="color: yellow;">...</span></b>"}

/datum/interactive_note/nightmare/tutorial_ooc_hiding/reveal_note_to_player(mob/living/user)
	name = "Прятки"
	note_info = {"<br /> \
				Некоторые объекты имеют достаточно пространства внутри, чтобы в них спрятался взрослый человек.<br /> \
				Взаимодействуйте с ними так же, как и с любыми другими интерактивными элементами окружения -<br /> \
				нажатием <b><span style="color: yellow;">[user.retrieve_bind("start_interaction")]</span></b>"}

	. = ..()
