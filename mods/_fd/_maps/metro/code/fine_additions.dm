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
	anchored = TRUE

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

/obj/effect/cutscene_camera/jeff_finale
	camera_id = "Блюспейс - Конец игры"

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
		PLAY_SOUND(sound('sound/effects/squelch2.ogg', volume = 100), null),
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

/datum/modular_cutscene/jeff_finale/setup_actions(...)
	actions = list(
		ADD_SCREEN(/blackout/animated_better) = 2 SECONDS,
		REMOVE_SCREEN(/blackout/animated_better, 0.5 SECONDS),
		TP_CAMERA("Блюспейс - Конец игры"),
		ADD_SCREEN(/cinema_borders) = 0.5 SECONDS,
		MOVE_CAMERA(0, 17, 5 SECONDS, SINE_EASING|EASE_IN) = 6 SECONDS,
		MOVE_CAMERA(13, 0, 0, null),
		MOVE_CAMERA(-8, 0, 10 SECONDS, SINE_EASING|EASE_IN) = 11 SECONDS,
		MOVE_CAMERA(-8, 24, 0, null),
		MOVE_CAMERA(13, 24, 10 SECONDS, SINE_EASING|EASE_IN) = 11 SECONDS,

		ADD_SCREEN(/blackout/animated_better) = 2 SECONDS,
		MOVE_CAMERA(0, 0, 0, null) = 1 SECONDS,
		RETURN_VIEWERS
	)

/datum/interactive_note/from_future
	name = "Ты здесь уже умирал"
	note_info = {"Это не первый раз, когда ты оказываешься на перепутье. Все эти тела - твои, но одновременно и нет. Мы не справились, но у тебя ещё есть шанс. \
				Штука в центре - это <b><span style="color: yellow;">стабилизатор материи</span></b>. Он способен нейтрализовать блюспейс-искажение на корню. \
				Поблизости, ты обнаружишь четыре похожих устройства. Каждое из них должно быть приведено в действие специальным <b><span style="color: yellow;">ключом</span></b>. \
				Найди ключи, запитай стабилизатор, и поймай эту тварь. Ради всех нас. Этот цикл возможно прервать."}

/datum/interactive_note/from_future2
	name = "Не ошибись"
	note_info = {"<b><span style="color: red;">У тебя будет только один шанс. Не промахнись.</span></b>"}

/obj/structure/fd/interactive/note/from_future
	name = "Ноутбук"
	icon = 'mods/_fd/fd_assets/icons/vampires/items.dmi'
	icon_state = "comp3"
	attached_text = list(/datum/interactive_note/from_future,/datum/interactive_note/from_future2)

/datum/interactive_note/nightmare/tutorial_ooc_hiding
	name = "Прятки"
	note_info = {"<br /> \
				Некоторые объекты имеют достаточно пространства внутри, чтобы в них спрятался взрослый человек.<br /> \
				Взаимодействуйте с ними так же, как и с любыми другими интерактивными элементами окружения - нажатием <b><span style="color: yellow;">...</span></b>"}

/datum/interactive_note/nightmare/tutorial_ooc_hiding/reveal_note_to_player(mob/living/user)
	note_info = {"<br /> \
				Некоторые объекты имеют достаточно пространства внутри, чтобы в них спрятался взрослый человек.<br /> \
				Взаимодействуйте с ними так же, как и с любыми другими интерактивными элементами окружения - нажатием <b><span style="color: yellow;">[user.retrieve_bind("start_interaction")]</span></b>"}

	. = ..()

/datum/interactive_note/nightmare/tutorial_ooc_weapon
	name = "Убить Джеффа"
	note_info = {""}

/datum/interactive_note/nightmare/tutorial_ooc_weapon/reveal_note_to_player(mob/living/user)
	note_info = {"<br /> \
				Теперь, в вашем распоряжении появилось оружие, способное развернуть ситуацию в чужую пользу. Оно ненадёжно, стационарно, и требует слаженной командной работы, \
				но в руках опытного игрока - если и не убьёт терроризирующего вас монстра, то точно заставит его отступить, выиграв вам время.</b><br /> \
				<br /> \
				<center>Взаимодействуйте с пушкой, используя <b><span style="color: yellow;">[user.retrieve_bind("start_interaction")]</span></b></center><br /> \
				<center>Чтобы выстрелить из пушки - вам необходимо разогнать её на полную мощность. Нажимайте <b><span style="color: yellow;">[user.retrieve_bind("start_interaction")]</span></b>, пока не услышите звук подтверждения.</center><br /> \
				<center>Нажмите на пушку, чтобы встать из-за неё, или вытолкнуть стоящего за ней человека</center><br /> \
				<br /> \
				<center>Мощность пушки падает не сразу. Вы можете поддерживать её периодическими нажатиями, пока не подгадаете нужный момент</center><br /> \
				<center>Вы можете крутить пушку кликом по экрану в нужном вам направлении, но лишь пока управляете ею</center><br /> \
				<center>Нажмите <b><span style="color: yellow;">[user.retrieve_bind("activate_inhand")]</span></b> держа пушку в актвной руке, чтобы разложить её перед собой</center>"}

	user.reading = TRUE

	user.overlay_fullscreen("background_note", note_overlay)
	user.overlay_fullscreen("smallshade", /obj/screen/fullscreen/shade)

	if(connected_note)
		if(!connected_note.ci)
			connected_note.ci = new /obj/screen/cancel_interaction()

		connected_note.ci.connected_mob = user
		user.client.screen += connected_note.ci
		animate(connected_note.ci, transform = matrix(-128, 0, MATRIX_TRANSLATE), alpha = 255, time = 3, easing = SINE_EASING|EASE_IN)

	spawn(0.5 SECONDS)

		var/message = "[note_info]"
		var/message_name = "[name]"

		var/obj/screen/player_message/note_text/maintext = new /obj/screen/player_message/note_text()
		var/obj/screen/novel_message/note_name/nameplate = new /obj/screen/novel_message/note_name()
		maintext.layer = 5.4
		nameplate.layer = 5.4

		nameplate.maptext_x = -75
		nameplate.maptext_y = -15
		maintext.maptext_x = 0
		maintext.maptext_y = -320

		user.client.screen += maintext
		user.client.screen += nameplate
		maintext.set_text(message, COLOR_WHITE)
		nameplate.set_text(message_name, COLOR_WHITE)

/obj/item/grenade/flashbang/anti_jeff
	det_time = 10

/obj/item/grenade/flashbang/anti_jeff/bang()
	playsound(src.loc, 'sound/effects/bang.ogg', 50, 1, 30)

	for(var/mob/living/H in view(src))
		to_chat(H, SPAN_DANGER("BANG"))
		if(istype(H,/mob/living/simple_animal/metro_jeff))
			H.add_status_effect(/datum/simple_status/fixation/timed, 10 SECONDS)

		H.flash_eyes(FLASH_PROTECTION_MODERATE)

/obj/item/projectile/beam/midlaser/jeff_killer
	simple_damage = 200

	status_to_add = /datum/simple_status/fixation/timed
	status_timer_to_add = 30 SECONDS
	status_ignore_armor = TRUE

/obj/item/fd/jeff_killer_gun_undeployed
	name = "compacted weapon"
	desc = "For easier transportation."
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
	name = "stationary weapon"
	desc = "This one can easily penetrate any armor."
	icon = 'mods/_fd/_maps/metro/icons/cool_weapon.dmi'
	icon_state = "weapon_deployed"

	var/obj/item/fd/jeff_killer_gun_undeployed/inside_bag
	var/mob/living/mob_in_charge

	var/recharging = FALSE
	var/recharge_time = 40

	var/power_level = 0
	var/next_power_up = 0
	var/power_up_falloff_in = 10

	var/about_to_shoot = FALSE

	density = TRUE

/obj/structure/fd/interactive/jeff_killer_gun_deployed/Initialize()
	. = ..()
	START_PROCESSING(SSobj,src)

/obj/structure/fd/interactive/jeff_killer_gun_deployed/Process()
	if(mob_in_charge)
		update_direction()

	if(mob_in_charge)
		mob_in_charge.anchored = TRUE

	if(recharging && recharge_time > 0)
		recharge_time -= 1
		maptext = STYLE_SMALLFONTS_OUTLINE("[recharge_time]", 7, COLOR_WHITE, COLOR_BLACK)

	if(recharge_time <= 0 && recharging)
		remove_filter("baked_outline")

		maptext = ""
		recharge_time = initial(recharge_time)
		recharging = FALSE

	if(next_power_up > 0)
		next_power_up -= 1

	if(power_level > 0 && power_up_falloff_in > 0)
		maptext = STYLE_SMALLFONTS_OUTLINE("[power_up_falloff_in]", 7, COLOR_WHITE, COLOR_BLACK)
		power_up_falloff_in -= 1

	if(power_up_falloff_in <= 0)
		power_up_falloff_in = initial(power_up_falloff_in)
		maptext = ""
		power_level -= 1
		change_visuals()

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
		if(mob_in_charge == user)
			desc_special = {"Пушка ещё <b><span style="color: red;">не остыла</span></b>!"}
			desc_special_show = TRUE
			. = ..()

			desc_special_show = FALSE
			return TRUE
		if(!mob_in_charge)
			if(do_after(user, 2 SECONDS, src, DO_PUBLIC_UNIQUE))
				undeploy(user)
				return TRUE

	if(about_to_shoot)
		desc_special = {"<b><span style="color: red;">Сейчас будет залп!</span></b>!"}
		desc_special_show = TRUE
		. = ..()

		desc_special_show = FALSE
		return TRUE

	if(mob_in_charge)

		if(next_power_up > 0)
			balloon_alert(user, "|ЕЩЁ РАНО|", COLOR_RED)
			animation_flash_color(src, COLOR_RED)
			return FALSE

		if(power_level >= 5)
			balloon_alert(user, "|ВЫСТРЕЛ|", COLOR_GREEN)
			playsound(user, 'sound/items/shuttle_beacon_complete.ogg', 100)
			try_to_fire()
			return TRUE

		power_level += 1
		next_power_up = 5
		power_up_falloff_in = initial(power_up_falloff_in)
		balloon_alert(user, "|УРОВЕНЬ [power_level]|", COLOR_GOLD)

		change_visuals()
		return TRUE

	if(!mob_in_charge)
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
	about_to_shoot = TRUE
	playsound(src, 'sound/mecha/nominal.ogg', 100)

	sleep(2 SECONDS)
	power_level = 0
	next_power_up = 0
	power_up_falloff_in = initial(power_up_falloff_in)

	remove_filter("charging")
	remove_filter("charging2")
	remove_filter("charging3")
	remove_filter("charging4")
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

	about_to_shoot = FALSE

/obj/structure/fd/interactive/jeff_killer_gun_deployed/proc/change_visuals()
	if(power_level == 1)
		remove_filter("charging2")

		playsound(src, 'sound/mecha/lowpower.ogg', 100)
		add_filter("charging", 1, list("type" = "outline", , "size" = 1, "color" = COLOR_YELLOW))
		return TRUE
	if(power_level == 2)
		remove_filter("charging")
		remove_filter("charging3")

		playsound(src, 'sound/mecha/lowpower.ogg', 100)
		add_filter("charging2", 1, list("type" = "outline", , "size" = 1, "color" = COLOR_ORANGE))
		return TRUE
	if(power_level == 3)
		remove_filter("charging2")
		remove_filter("charging4")

		playsound(src, 'sound/mecha/lowpower.ogg', 100)
		add_filter("charging3", 1, list("type" = "outline", , "size" = 1, "color" = COLOR_RED))
		return TRUE
	if(power_level == 4)
		remove_filter("charging3")
		remove_filter("charging5")

		playsound(src, 'sound/mecha/lowpower.ogg', 100)
		add_filter("charging4", 1, list("type" = "outline", , "size" = 1, "color" = COMMS_COLOR_ICCG))
		return TRUE
	if(power_level == 5)
		remove_filter("charging4")

		playsound(src, 'sound/mecha/lowpower.ogg', 100)
		add_filter("charging5", 1, list("type" = "outline", , "size" = 1, "color" = COMMS_COLOR_BEARCAT))
		return TRUE

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

/obj/screen/gate_timer
	var/obj/structure/fd/bunker/gate/connected_gate
	maptext_width = 280
	maptext_height = 280
	screen_loc = "CENTER,CENTER+5"

	icon = null
	icon_state = null

/obj/screen/gate_timer/Initialize()
	. = ..()
	SetTransform(2)

/obj/screen/gate_timer/proc/show_screentext(message = {"test"})
	maptext = STYLE_SMALLFONTS_OUTLINE("[message]", 7, COLOR_WHITE, COLOR_BLACK)

/obj/screen/gate_timer/proc/reset_screentext()
	maptext = ""

/obj/structure/fd/bunker/warphole_special_effect
	layer = 4.11
	mouse_opacity = FALSE
	anchored = TRUE
	name = "electricity"
	desc = "electricity"

	icon = 'mods/_fd/_maps/metro/icons/rituals_160x160.dmi'
	icon_state = "rit-elec-aoe2"
	alpha = 0

/obj/structure/fd/bunker/stability_field
	layer = 4.14
	mouse_opacity = FALSE
	anchored = TRUE
	name = "field"
	desc = "field"

	icon = 'mods/_fd/_maps/metro/icons/rituals_160x160.dmi'
	icon_state = "rit-water-aoe2"

	pixel_x = -64
	pixel_y = -64

/obj/structure/fd/bunker/stability_field/Initialize()
	. = ..()

	SetTransform(0)
	animate(src, transform = matrix(1.5, MATRIX_SCALE), time = 0.5 SECONDS, easing = BOUNCE_EASING|EASE_OUT)

/obj/structure/fd/bunker/glitch
	layer = 4.12
	mouse_opacity = FALSE
	anchored = TRUE
	name = "field"
	desc = "field"

	icon = 'mods/_fd/fd_assets/icons/goons/featherzone.dmi'
	icon_state = "hazard"

	layer = SPEECH_INDICATOR_LAYER
	plane = EFFECTS_ABOVE_LIGHTING_PLANE

/obj/structure/fd/bunker/warphole
	layer = 2.4
	mouse_opacity = FALSE
	anchored = TRUE
	name = "warphole"
	desc = "warphole"

	icon = 'mods/_fd/_maps/metro/icons/chaplainRitual.dmi'
	icon_state = "buff-water-obj"

	var/hole_id = "bleh"
	var/mother_hole = FALSE // for future
	var/obj/structure/fd/bunker/warphole/other_hole
	var/obj/structure/fd/bunker/gate/connected_gate

	var/obj/structure/fd/bunker/warphole_special_effect/electricity

	var/opened = FALSE
	var/unstable = TRUE
	var/do_not_trigger = FALSE

	var/offset_x = 64
	var/offset_y = 40

/obj/structure/fd/bunker/warphole/Initialize()
	. = ..()
	SetTransform(0)

	if(unstable)
		electricity = new /obj/structure/fd/bunker/warphole_special_effect(get_turf(src))
		electricity.pixel_y = -offset_y
		electricity.pixel_x = -offset_x
		electricity.SetTransform(0)

	START_PROCESSING(SSobj,src)

/obj/structure/fd/bunker/warphole/Process()
	if(unstable && opened)
		for(var/mob/living/L in range(1,src))
			L.simple_health_calculation(5, 0, 1, 0)

/obj/structure/fd/bunker/warphole/Crossed(mob/living/M)
	. = ..()

	if(opened && isliving(M) && !do_not_trigger)
		animate(M, alpha = 0, time = 0.5 SECONDS, easing = LINEAR_EASING)
		spawn(0.5 SECONDS)

			var/turf/simulated/floor/F = get_step(other_hole,M.dir)
			other_hole.do_not_trigger = TRUE

			M.forceMove(F)
			animate(M, alpha = 255, time = 0.5 SECONDS, easing = LINEAR_EASING)

			if(other_hole.mother_hole)
				M.gate_timer = null
				M.client.screen -= connected_gate.connected_timer
			else
				M.client.screen += connected_gate.connected_timer
				M.gate_timer = connected_gate.connected_timer

			other_hole.do_not_trigger = FALSE

/obj/structure/fd/bunker/warphole/proc/open()
	opened = TRUE
	animate(src, transform = matrix(3, MATRIX_SCALE), time = 1 SECONDS, easing = BOUNCE_EASING|EASE_IN)
	animate(electricity, transform = matrix(1, MATRIX_SCALE), alpha = 255, time = 1 SECONDS, easing = SINE_EASING|EASE_OUT)

	return TRUE

/obj/structure/fd/bunker/warphole/proc/close()

	opened = FALSE
	animate(src, transform = matrix(0, MATRIX_SCALE), time = 1 SECONDS, easing = LINEAR_EASING)
	animate(electricity, transform = matrix(0, MATRIX_SCALE), time = 0.5 SECONDS, easing = LINEAR_EASING)

	return TRUE

/mob/living
	var/obj/screen/gate_timer/gate_timer

/mob/living/Life()
	if(gate_timer && !(gate_timer in client.screen))
		client.screen += gate_timer

	. = ..()



/obj/structure/fd/bunker/gate
	name = "gateway controls"
	desc = "Console for managing gateway connections."

	icon = 'mods/_fd/_maps/metro/icons/console.dmi'
	icon_state = "chemicompiler_st_working"

	anchored = TRUE
	density = TRUE

	var/obj/screen/gate_timer/connected_timer
	var/obj/structure/fd/bunker/warphole/mother_hole
	var/amount_of_uses = 1
	var/connection_open = FALSE
	var/opened_state_timeframe = 600
	var/opened_state_timeframe_current = 600

	interactive = TRUE
	var/can_enter_specific = FALSE

	maptext_x = 10
	maptext_y = 32

/obj/structure/fd/bunker/gate/Initialize()
	. = ..()

	connected_timer = new /obj/screen/gate_timer()
	connected_timer.connected_gate = src
	for(var/obj/structure/fd/bunker/warphole/W in world)
		if(W.mother_hole)
			W.connected_gate = src
			mother_hole = W

	START_PROCESSING(SSobj,src)

/obj/structure/fd/bunker/gate/Process()
	if(connection_open)
		if(opened_state_timeframe_current > -1)
			opened_state_timeframe_current -= 1
			maptext = STYLE_SMALLFONTS_OUTLINE("[opened_state_timeframe_current]", 7, COLOR_WHITE, COLOR_BLACK)
			if(opened_state_timeframe_current > (opened_state_timeframe / 2))
				connected_timer.show_screentext({"До схлопывания: <b><span style="color: yellow;">[opened_state_timeframe_current]</span></b>"})
				connected_timer.maptext_x = -24
				connected_timer.maptext_y = 0
			else
				connected_timer.show_screentext({"До схлопывания: <b><span style="color: red;">[opened_state_timeframe_current]</span></b>"})
				connected_timer.maptext_x = -24
				connected_timer.maptext_y = 0
		if(opened_state_timeframe_current < 0)
			opened_state_timeframe_current = opened_state_timeframe
			connected_timer.reset_screentext()
			severe_all_connections()

/obj/structure/fd/bunker/gate/proc/severe_all_connections()
	connection_open = FALSE
	mother_hole.other_hole.connected_gate = null

	mother_hole.other_hole.close()
	mother_hole.close()

	mother_hole.other_hole.other_hole = null
	mother_hole.other_hole = null

	mother_hole.hole_id = initial(mother_hole.hole_id)
	opened_state_timeframe_current = opened_state_timeframe
	maptext = ""

	for(var/client/clients in GLOB.clients)
		for(var/obj/screen/T in clients.screen)
			if(istype(T, /obj/screen/gate_timer))
				clients.screen -= T

	return TRUE

/obj/structure/fd/bunker/gate/proc/try_to_establish_connection(mob/living/carbon/human/user)
	if(can_enter_specific)
		mother_hole.hole_id = input(user, "Input desired ID", "Connection Menu", mother_hole.hole_id)

	var/obj/structure/fd/bunker/warphole/another_hole

	for(var/obj/structure/fd/bunker/warphole/W in world)
		if(W.hole_id == mother_hole.hole_id)
			another_hole = W

	another_hole.connected_gate = src
	amount_of_uses -= 1

	connection_open = TRUE
	another_hole.other_hole = mother_hole
	mother_hole.other_hole = another_hole

	another_hole.open()
	mother_hole.open()
	return TRUE

/obj/structure/fd/bunker/gate/interact_with(mob/living/carbon/human/user)
	user.client.screen += connected_timer
	if(!connection_open)
		connected_timer.show_screentext({"<center>Гейтвей сможет произвести включений: <b><span style="color: yellow;">[amount_of_uses]</span></b></center><br /> \
										<center>Длительностью: <b><span style="color: yellow;">[opened_state_timeframe]</span></b></center>"})
		connected_timer.maptext_x = -120
		connected_timer.maptext_y = -20

	var/list/options = list(
		"ВКЛЮЧИТЬ" = image('mods/_fd/_maps/collective_nightmare/icons/radial.dmi', "radial_use"),
		"ВЫКЛЮЧИТЬ" = image('mods/_fd/_maps/collective_nightmare/icons/radial.dmi', "radial_pickup"),
	)
	var/chosen_option = show_radial_menu(user, src, options, radius = 25, require_near = TRUE)
	if(!chosen_option)
		user.client.screen -= connected_timer
		return FALSE
	switch(chosen_option)
		if("ВКЛЮЧИТЬ")
			user.client.screen -= connected_timer
			if(amount_of_uses > 0 && !connection_open)
				animate(user, pixel_y = 12, time = 10, easing = LINEAR_EASING | EASE_IN)
				if(do_after(user, 10 SECONDS, src, DO_PUBLIC_UNIQUE))
					playsound(user, 'sound/items/shuttle_beacon_complete.ogg', 100)
					try_to_establish_connection(user)
				animate(user, pixel_y = 0, time = 10, easing = LINEAR_EASING | EASE_IN)
				return TRUE
		if("ВЫКЛЮЧИТЬ")
			user.client.screen -= connected_timer
			if(connection_open)
				animate(user, pixel_y = 12, time = 10, easing = LINEAR_EASING | EASE_IN)
				if(do_after(user, 10 SECONDS, src, DO_PUBLIC_UNIQUE))
					connected_timer.reset_screentext()
					severe_all_connections()
				animate(user, pixel_y = 0, time = 10, easing = LINEAR_EASING | EASE_IN)
			return TRUE

	user.client.screen -= connected_timer
	return

/turf/simulated/floor/bluespace/more_stable/Entered(mob/living/L)
	return

/obj/structure/fd/bunker/stabilizator
	name = "strange device"
	desc = "I wonder what i can do with that..."
	icon = 'mods/_fd/fd_assets/icons/goons/worlds.dmi'
	icon_state = "stabilizator"

	var/active = FALSE
	var/used = FALSE
	var/list/obj/structure/fd/bunker/stabilizator_cell/cells = list()

	interactive = TRUE
	anchored = TRUE
	density = TRUE

/obj/structure/fd/bunker/stabilizator/Initialize()
	. = ..()

	var/area/area = get_area(src)
	for(var/obj/structure/fd/bunker/stabilizator_cell/C in area)
		cells += C

	START_PROCESSING(SSobj,src)

/obj/structure/fd/bunker/stabilizator/Process()

	if(!active)
		var/list/activated_cells = list()

		for(var/obj/structure/fd/bunker/stabilizator_cell/C in cells)
			if(C.activated)
				activated_cells += C

		if(length(activated_cells) == length(cells) && !used)
			active = TRUE
			icon_state = "stabilizator-activating"
			playsound(src, 'sound/machines/bolts_up.ogg', 100)
			spawn(1 SECOND)
				playsound(src, 'sound/machines/boop2.ogg', 100)
				icon_state = "stabilizator-active"

	if(active)
		if(!used)
			var/list/activated_cells = list()

			for(var/obj/structure/fd/bunker/stabilizator_cell/C in cells)
				if(C.activated)
					activated_cells += C

			if(length(activated_cells) != length(cells))
				active = FALSE
				icon_state = "stabilizator-fire"

		else
			for(var/mob/living/L in orange(2,src))
				if(!L.get_status_effect(/datum/simple_status/fixation))
					L.add_status_effect(/datum/simple_status/fixation)
					L.color = COLOR_BLACK

					new /obj/structure/fd/bunker/glitch(get_turf(L))

/obj/structure/fd/bunker/stabilizator/interact_with(mob/living/carbon/human/user)

	if(!active)
		desc_special = {"Странное устройство с несколькими визуальными индикаторами. <b><span style="color: red;">Не похоже, что оно рабочее</span></b>..."}
		desc_special_show = TRUE
		. = ..()

		desc_special_show = FALSE
		return TRUE

	if(active && !used)
		var/list/options = list(
			"НАЖАТЬ НА КНОПКУ" = image('mods/_fd/_maps/collective_nightmare/icons/radial.dmi', "radial_use"))
		var/chosen_option = show_radial_menu(user, src, options, radius = 25, require_near = TRUE)
		if(!chosen_option)
			return 0
		if(chosen_option == "НАЖАТЬ НА КНОПКУ")
			if(do_after(user, 2 SECONDS, src, DO_PUBLIC_UNIQUE))
				setup_field(user)
			return TRUE

/obj/structure/fd/bunker/stabilizator/proc/setup_field(mob/living/carbon/human/user)
	used = TRUE

	playsound(src, 'sound/machines/BSD_interact.ogg', 100)

	icon_state = "stabilizator-fire"
	new /obj/structure/fd/bunker/stability_field(get_turf(src))

	user.pass_flags |= PASS_FLAG_TABLE

	user.throw_at(get_edge_target_turf(user, reverse_direction(user.dir)), 6, 2)
	user.simple_health_calculation(20, 0, 1, 0)
	sleep(5)

	user.pass_flags = initial(pass_flags)

	for(var/mob/living/L in orange(2,src))
		L.add_status_effect(/datum/simple_status/fixation)
		L.color = COLOR_BLACK

		new /obj/structure/fd/bunker/glitch(get_turf(L))

	return TRUE

/obj/item/fd/stabilizator_key/red
	name = "key-like thing"
	desc = "I can totally stick this somewhere"
	icon = 'mods/_fd/fd_assets/icons/goons/worlds.dmi'
	icon_state = "robotkey-red"

	w_class = ITEM_SIZE_TINY

/obj/item/fd/stabilizator_key/blue
	name = "key-like thing"
	desc = "I can totally stick this somewhere"
	icon = 'mods/_fd/fd_assets/icons/goons/worlds.dmi'
	icon_state = "robotkey-blue"

	w_class = ITEM_SIZE_TINY

/obj/structure/fd/bunker/stabilizator_cell
	name = "strange device"
	desc = "I wonder what i can do with that..."
	icon = 'mods/_fd/fd_assets/icons/goons/worlds.dmi'
	icon_state = "redstabilizator"

	var/key_type = /obj/item/fd/stabilizator_key/red
	var/obj/item/fd/stabilizator_key/key = null

	var/activated = FALSE
	density = TRUE
	anchored = TRUE

	interactive = TRUE

/obj/structure/fd/bunker/stabilizator_cell/interact_with(mob/living/carbon/human/user)

	if(!key)
		var/obj/item/I = user.get_active_hand()
		if(!I)
			desc_special = {"Здесь есть небольшой разъём для <span style="color: yellow;">ключа</span>."}
			desc_special_show = TRUE
			. = ..()
			return TRUE
		if(!istype(I, key_type))
			desc_special = {"<span style="color: red;">Не вставляется</span>."}
			desc_special_show = TRUE
			. = ..()
			return TRUE

		if(istype(I, key_type))
			if(do_after(user, 2 SECONDS, src, DO_PUBLIC_UNIQUE))
				user.drop_from_inventory(I)
				I.forceMove(src)
				key = I
				activated = TRUE

				playsound(user, 'sound/items/rped.ogg', 50)
				icon_state = "[icon_state]-active"
			return TRUE

/obj/structure/fd/bunker/stabilizator_cell/blue
	icon_state = "bluestabilizator"
	key_type = /obj/item/fd/stabilizator_key/blue
