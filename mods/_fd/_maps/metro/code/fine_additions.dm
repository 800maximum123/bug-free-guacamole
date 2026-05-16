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
		candidats += H

	for(var/obj/structure/fd/mapping/cutscene_trigger/C in world)
		if(C.trigger_id == "metro2")
			for(var/mob/living/carbon/human/H in range(10,C))
				if(!speaker)
					speaker = H

	candidats -= speaker
	for(var/mob/living/carbon/human/H in candidats)
		H.forceMove(get_turf(speaker))
		H.forceMove(get_step(H, pick(GLOB.alldirs)))

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
				if(H == speaker)
					continue
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
				Взаимодействуйте с ними так же, как и с любыми другими интерактивными элементами окружения - нажатием <b><span style="color: yellow;">...</span></b>"}

/datum/interactive_note/nightmare/tutorial_ooc_hiding/reveal_note_to_player(mob/living/user)
	name = "Прятки"
	note_info = {"<br /> \
				Некоторые объекты имеют достаточно пространства внутри, чтобы в них спрятался взрослый человек.<br /> \
				Взаимодействуйте с ними так же, как и с любыми другими интерактивными элементами окружения - нажатием <b><span style="color: yellow;">[user.retrieve_bind("start_interaction")]</span></b>"}

	. = ..()

/obj/item/grenade/flashbang/anti_jeff

/obj/item/grenade/flashbang/anti_jeff/bang()
	playsound(src.loc, 'sound/effects/bang.ogg', 50, 1, 30)

	var/list/remove_overlay_later = list()
	for(var/mob/living/H in view(src))
		to_chat(H, SPAN_DANGER("BANG"))

		if(istype(H,/mob/living/simple_animal/metro_jeff))
			H.add_status_effect(/datum/simple_status/fixation/timed, 10 SECONDS)

		H.overlay_fullscreen("flash",/obj/screen/fullscreen/blurry/camera)
		remove_overlay_later += H

	sleep(1 SECONDS)

	for(var/mob/living/H in remove_overlay_later)
		H.clear_fullscreen("flash")

/obj/item/projectile/beam/midlaser/jeff_killer
	simple_damage = 70

	status_to_add = /datum/simple_status/fixation/timed
	status_timer_to_add = 20 SECONDS
	status_ignore_armor = TRUE

/obj/item/fd/jeff_killer_gun_undeployed
	icon = 'mods/_fd/_maps/metro/icons/cool_weapon.dmi'
	icon_state = "weapon_undeployed"
	slot_flags = SLOT_BACK

	item_icons = list(
		slot_back_str = 'mods/_fd/_maps/metro/icons/cool_weapon.dmi')
	item_state_slots = list(
		slot_back_str = "weapon_onback")

	var/obj/structure/fd/interactive/jeff_killer_gun_deployed/inside_gun

/obj/item/fd/jeff_killer_gun_undeployed/attack_self(mob/user)
	. = ..()

	if(do_after(user, 2 SECONDS, src, DO_PUBLIC_UNIQUE))
		deploy(user)

/obj/item/fd/jeff_killer_gun_undeployed/proc/deploy(mob/living/caller)

	if(!inside_gun)
		inside_gun = new /obj/structure/fd/interactive/jeff_killer_gun_deployed(src)
		inside_gun.inside_bag = src

	inside_gun.forceMove(get_step(caller,caller.dir))
	inside_gun.dir = caller.dir

	caller.drop_from_inventory(src)
	forceMove(inside_gun)

/obj/structure/fd/interactive/jeff_killer_gun_deployed
	icon = 'mods/_fd/_maps/metro/icons/cool_weapon.dmi'
	icon_state = "weapon_deployed"

	var/obj/item/fd/jeff_killer_gun_undeployed/inside_bag
	var/mob/living/mob_in_charge
	var/charging = FALSE

	var/recharging = FALSE
	var/recharge_time = 20

/obj/structure/fd/interactive/jeff_killer_gun_deployed/Initialize()
	. = ..()
	START_PROCESSING(SSobj,src)

/obj/structure/fd/interactive/jeff_killer_gun_deployed/Process()
	if(mob_in_charge)
		update_direction()

	if(recharging && recharge_time > 0)
		recharge_time -= 1
		maptext = STYLE_SMALLFONTS_OUTLINE("[recharge_time]", 7, COLOR_WHITE, COLOR_BLACK)

	if(recharge_time <= 0 && recharging)
		remove_filter("baked_outline")

		maptext = ""
		recharge_time = initial(recharge_time)
		recharging = FALSE

/obj/structure/fd/interactive/jeff_killer_gun_deployed/attack_hand(mob/living/user)
	. = ..()
	if(mob_in_charge)
		mob_in_charge.forceMove(get_step(src,reverse_direction(dir)))
		mob_in_charge.anchored = FALSE

		mob_in_charge.pixel_y = 0
		mob_in_charge.pixel_x = 0

		mob_in_charge = null

/obj/structure/fd/interactive/jeff_killer_gun_deployed/interact_with(mob/living/carbon/human/user)

	if(recharging)
		desc_special = {"Пушка ещё <b><span style="color: red;">не остыла</span></b>!"}
		desc_special_show = TRUE
		. = ..()

		if(mob_in_charge == user)
			mob_in_charge.anchored = TRUE
		desc_special_show = FALSE
		return TRUE

	if(charging)
		if(mob_in_charge == user)
			charging = FALSE
			return TRUE

		desc_special = {"<b><span style="color: red;">Сейчас пушку лучше не трогать!</span></b>"}
		desc_special_show = TRUE
		. = ..()

		desc_special_show = FALSE
		return TRUE

	if(!charging)
		if(mob_in_charge)
			playsound(user, 'sound/items/shuttle_beacon_complete.ogg', 100)
			start_chagring()
			return TRUE

		var/list/options = list(
			"ВСТАТЬ ЗА ПУШКУ" = image('mods/_fd/_maps/collective_nightmare/icons/radial.dmi', "radial_use"),
			"СОБРАТЬ ПУШКУ" = image('mods/_fd/_maps/collective_nightmare/icons/radial.dmi', "radial_pickup"),
		)
		var/chosen_option = show_radial_menu(user, src, options, radius = 25, require_near = TRUE)
		if(!chosen_option)
			return 0
		switch(chosen_option)
			if("ВСТАТЬ ЗА ПУШКУ")
				put_mob_in_charge(user)
				return TRUE
			if("СОБРАТЬ ПУШКУ")
				if(do_after(user, 2 SECONDS, src, DO_PUBLIC_UNIQUE))
					undeploy(user)
					return TRUE

/obj/structure/fd/interactive/jeff_killer_gun_deployed/proc/try_to_fire()
	if(!charging)
		return

	playsound(src, 'sound/mecha/nominal.ogg', 100)

	sleep(2.5 SECONDS)
	remove_filter("charging5")

	if(mob_in_charge)
		var/recoil_angle = SIMPLIFY_DEGREES(Get_Angle(get_step(mob_in_charge, mob_in_charge.dir), mob_in_charge) + 90)
		recoil_camera(mob_in_charge, 5, recoil_angle, 2)

	var/obj/item/projectile/pew
	var/pew_sound

	pew = new /obj/item/projectile/beam/midlaser/jeff_killer(get_turf(src))
	pew_sound = 'sound/machines/disperser_fire.ogg'

	var/atom/target = get_turf(get_step(src, dir))

	if(istype(pew))
		playsound(pew.loc, pew_sound, 50, 1)
		pew.original = target
		pew.current = target
		pew.starting = get_turf(src)
		pew.shot_from = src
		pew.launch(target)

	recharging = TRUE
	add_filter("baked_outline", 1, list("type" = "outline", , "size" = 1, "color" = COLOR_RED))

	for(var/i=1, i<=3, i++)
		var/obj/particle_emitter/smoke/flare = new /obj/particle_emitter/smoke(src.loc, recharge_time)
		var/rand_x = rand(-2,2)
		var/rand_y = rand(-2,2)

		switch(dir)
			if(SOUTH)
				flare.pixel_y = -6 + rand_y
				flare.pixel_x = rand_x
			if(NORTH)
				flare.pixel_y = 12 + rand_y
				flare.pixel_x = rand_x
			if(WEST)
				flare.pixel_y = 8 + rand_y
				flare.pixel_x = -12 + rand_x
			if(EAST)
				flare.pixel_y = 8 + rand_y
				flare.pixel_x = 12 + rand_x

	charging = FALSE

/obj/structure/fd/interactive/jeff_killer_gun_deployed/proc/cancel_charging()
	remove_filter("charging")
	remove_filter("charging2")
	remove_filter("charging3")
	remove_filter("charging4")
	remove_filter("charging5")

/obj/structure/fd/interactive/jeff_killer_gun_deployed/proc/start_chagring()
	charging = TRUE
	addtimer(new Callback(src, PROC_REF(try_to_fire)), 10 SECONDS)

	if(!charging)
		cancel_charging()
		return

	playsound(src, 'sound/mecha/lowpower.ogg', 100)
	add_filter("charging", 1, list("type" = "outline", , "size" = 1, "color" = COLOR_YELLOW))
	spawn(2 SECONDS)
		if(!charging)
			cancel_charging()
			return
		playsound(src, 'sound/mecha/lowpower.ogg', 100)
		remove_filter("charging")
		add_filter("charging2", 1, list("type" = "outline", , "size" = 1, "color" = COLOR_ORANGE))
	spawn(4 SECONDS)
		if(!charging)
			cancel_charging()
			return
		playsound(src, 'sound/mecha/lowpower.ogg', 100)
		remove_filter("charging2")
		add_filter("charging3", 1, list("type" = "outline", , "size" = 1, "color" = COLOR_RED))
	spawn(6 SECONDS)
		if(!charging)
			cancel_charging()
			return
		playsound(src, 'sound/mecha/lowpower.ogg', 100)
		remove_filter("charging3")
		add_filter("charging4", 1, list("type" = "outline", , "size" = 1, "color" = COMMS_COLOR_ICCG))
	spawn(8 SECONDS)
		if(!charging)
			cancel_charging()
			return
		playsound(src, 'sound/mecha/lowpower.ogg', 100)
		remove_filter("charging4")
		add_filter("charging5", 1, list("type" = "outline", , "size" = 1, "color" = COMMS_COLOR_BEARCAT))

/obj/structure/fd/interactive/jeff_killer_gun_deployed/proc/put_mob_in_charge(mob/living/in_charge)
	in_charge.forceMove(get_turf(src))
	in_charge.anchored = TRUE

	mob_in_charge = in_charge
	update_direction()

/obj/structure/fd/interactive/jeff_killer_gun_deployed/proc/update_direction()
	switch(mob_in_charge.dir)
		if(SOUTH)
			layer = 4.10
			dir = SOUTH
			mob_in_charge.pixel_y = 16
			mob_in_charge.pixel_x = 10
		if(NORTH)
			layer = initial(layer)
			dir = NORTH
			mob_in_charge.pixel_y = -16
			mob_in_charge.pixel_x = -10
		if(WEST)
			layer = initial(layer)
			dir = WEST
			mob_in_charge.pixel_y = -10
			mob_in_charge.pixel_x = 10
		if(EAST)
			layer = 4.10
			dir = EAST
			mob_in_charge.pixel_y = 10
			mob_in_charge.pixel_x = -10

/obj/structure/fd/interactive/jeff_killer_gun_deployed/proc/undeploy(mob/living/caller)
	if(!inside_bag)
		inside_bag = new /obj/item/fd/jeff_killer_gun_undeployed(src)
		inside_bag.inside_gun = src

	caller.put_in_active_hand(inside_bag)
	forceMove(inside_bag)
