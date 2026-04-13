/proc/stop_all_shadows()
	for(var/obj/structure/fd/shadow_follower/S in world)
		S.reset_shadow()
		S.currently_active = FALSE

/proc/make_all_shadows_creep_aware()
	for(var/obj/structure/fd/shadow_follower/S in world)
		S.unaware_to_crawl = FALSE

/area/
	var/safe_zone = FALSE // чтобы от теней была передышка хоть где-то

/obj/temporary/shadow_aware/Initialize(mapload, duration = 6, _icon = 'icons/obj/overmap.dmi', _state)
	. = ..()

	alpha = 0
	icon = _icon
	icon_state = "sensor_range"
	color = COLOR_BLACK

	animate(src, transform = matrix(3, MATRIX_SCALE), alpha = 255, time = 4, SINE_EASING|EASE_IN)
	animate(alpha = 0, time = 2, SINE_EASING|EASE_OUT)

	QDEL_IN(src, duration)

/obj/temporary/shadow_consumed/Initialize(mapload, duration = 5, _icon = 'icons/effects/effects.dmi', _state)
	. = ..()

	icon = _icon
	icon_state = "summoning"

	SetTransform(2)

	QDEL_IN(src, duration)

/obj/temporary/shadow_flashed/Initialize(mapload, mob/user, duration = 10, _icon = 'mods/_fd/_maps/collective_nightmare/icons/effects.dmi', _state)
	. = ..()

	alpha = 0
	icon = _icon
	icon_state = "static"
	dir = user.dir

	animate(src, alpha = 255, time = 5, BOUNCE_EASING|EASE_IN)
	animate(alpha = 0, time = 3, SINE_EASING|EASE_OUT)

	QDEL_IN(src, duration)

/obj/temporary/shadow_attack/Initialize(mapload, mob/user, duration = 10, _icon = 'mods/_fd/_maps/collective_nightmare/icons/effects.dmi', _state)
	. = ..()

	icon = _icon
	icon_state = "target_tile"

	spawn(5)
		icon_state = "static_base"
		for(var/mob/living/carbon/human/H in get_turf(src))
			H.recalculate_reality_connection(1)

	QDEL_IN(src, duration)

/obj/screen/fullscreen/screamer
	icon = 'mods/_fd/_maps/collective_nightmare/icons/largenoise.dmi'
	icon_state = "1"
	scale_to_view = TRUE

/obj/screen/fullscreen/connection_damage
	icon = 'mods/_fd/_maps/collective_nightmare/icons/is12_screens.dmi'
	icon_state = "ghost2"
	scale_to_view = TRUE

/obj/screen/fullscreen/underworld_vision
	icon = 'mods/_fd/_maps/collective_nightmare/icons/is12_screens.dmi'
	icon_state = "ghost1"
	scale_to_view = TRUE

/obj/screen/fullscreen/almost_done
	icon = 'mods/_fd/_maps/collective_nightmare/icons/tgmc_screens.dmi'
	icon_state = "bloodlust"
	color = COLOR_BLACK
	scale_to_view = TRUE
	alpha = 0

/obj/screen/fullscreen/almost_done/Initialize()
	. = ..()
	animate(src, alpha = 255, time = 5, LINEAR_EASING)

/obj/structure/fd/shadow_follower/proc/face_atom(atom/A)
	if(!A || !x || !y || !A.x || !A.y) return
	var/dx = A.x - x
	var/dy = A.y - y
	if(!dx && !dy) return

	var/direction
	if(abs(dx) < abs(dy))
		if(dy > 0)	direction = NORTH
		else		direction = SOUTH
	else
		if(dx > 0)	direction = EAST
		else		direction = WEST
	if(direction != dir)
		set_dir(direction)

/obj/structure/fd/shadow_follower
	name = ".. / -.-. .- -. / ... . . / -.-- --- ..-"
	desc = "-.-- --- ..- / -... . - - . .-. / .-. ..- -. / .- - / - .... .. ... / .--. --- .. -. -"

	icon = 'mods/_fd/_maps/small_exoplanet_1/icons/enigma_husks.dmi'
	icon_state = "hollow"
	anchored = TRUE
	density = TRUE

	var/currently_active = FALSE // таких теней будет много, и если каждая тень будет постоянно чекать пространство вокруг себя - это будет явно нехорошо
	var/unaware_to_crawl = TRUE

	var/let_player_go_after = 100
	var/let_player_go_how_fast = 100

	var/flashed = FALSE
	var/flashed_for = 10 SECONDS

	var/hunting_any_player = FALSE

	var/tp_in_process = FALSE
	var/next_tp_to_player = 10
	var/next_tp_to_player_how_fast = 10

	var/preparing_attack = FALSE
	var/try_to_attack_player_in = 60
	var/try_to_attack_player_how_fast = 60

	var/list/mob/living/carbon/human/hunted_players = list()
	var/turf/home

/obj/structure/fd/shadow_follower/Initialize()
	. = ..()

	home = get_turf(src)
	START_PROCESSING(SSobj, src)

/obj/structure/fd/shadow_follower/Process()

	if(currently_active)

		if(hunting_any_player && !length(hunted_players))
			reset_shadow()

		if(hunting_any_player && length(hunted_players))

			if(let_player_go_after <= 0)
				reset_shadow()

			if(next_tp_to_player <= 0 && !preparing_attack && !tp_in_process)
				try_to_move()

			if(try_to_attack_player_in <= 0 && !preparing_attack && !tp_in_process)
				do_attack()

			if(next_tp_to_player > 0)
				next_tp_to_player -= 1

			if(try_to_attack_player_in >= 2)
				var/list/someone_near = list()
				for(var/mob/living/carbon/human/H in view(src))
					someone_near += H
				if(length(someone_near))
					try_to_attack_player_in -= 2

			if(let_player_go_after > 0 && !preparing_attack)
				let_player_go_after -= 1

		if(!hunting_any_player && !flashed)
			for(var/mob/living/carbon/human/H in orange(3,src))
				if(H.stat != CONSCIOUS)
					continue
				if(!H.client)
					continue

				if(unaware_to_crawl)
					if(istype(H.move_intent, /singleton/move_intent/creep) && prob(98)) // очень небольшой шанс того что тень услышит даже крадущегося
						continue

				new /obj/temporary/shadow_aware(get_turf(src))
				hunted_players += H
				hunting_any_player = TRUE

/obj/structure/fd/shadow_follower/proc/reset_shadow()
	let_player_go_after = let_player_go_how_fast

	hunting_any_player = FALSE
	tp_in_process = FALSE
	preparing_attack = FALSE
	hunted_players.Cut()

	next_tp_to_player = next_tp_to_player_how_fast
	try_to_attack_player_in = try_to_attack_player_how_fast

	var/list/remove_overlay_later = list()
	for(var/mob/living/carbon/human/H in view(src))
		var/obj/screen/fullscreen/screen = H.screens["screamer"]

		if(!screen)
			H.overlay_fullscreen("screamer",/obj/screen/fullscreen/screamer)
			remove_overlay_later += H

	forceMove(home)
	sleep(0.5 SECONDS)

	for(var/mob/living/carbon/human/H in remove_overlay_later)
		var/obj/screen/fullscreen/screen = H.screens["screamer"]

		if(screen)
			H.clear_fullscreen("screamer", 0)

/obj/structure/fd/shadow_follower/proc/try_to_move()
	next_tp_to_player = next_tp_to_player_how_fast
	tp_in_process = TRUE

	for(var/mob/living/carbon/human/H in hunted_players)
		if(H.stat != CONSCIOUS)
			hunted_players -= H
			continue
		if(!H.client)
			hunted_players -= H
			continue

		var/area/A = get_area(H)
		if(A.safe_zone)
			hunted_players -= H
			continue

	if(!length(hunted_players))
		reset_shadow()
		return

	var/mob/living/carbon/human/target = pick(hunted_players)

	add_filter("shadow_moving", 1, list("type" = "blur", "size" = 0))

	new /obj/temporary/shadow_consumed(get_turf(src))
	animate(get_filter("shadow_moving"), size = 3, time = 0.2 SECONDS, LINEAR_EASING)
	animate(src, alpha = 0, time = 0.5 SECONDS, LINEAR_EASING)

	sleep(2 SECONDS)

	for(var/mob/living/carbon/human/H in hunted_players)
		var/obj/screen/fullscreen/screen = H.screens["screamer"]

		if(!screen)
			H.overlay_fullscreen("screamer",/obj/screen/fullscreen/screamer)

	var/turf/T = get_step(target, pick(GLOB.cardinal))
	face_atom(get_turf(target))
	forceMove(T)

	sleep(0.5 SECONDS)

	var/x_offset = (x - target.x) * 32
	var/y_offset = (y - target.y) * 32
	if(target.client)
		target.client.pixel_y = y_offset
		target.client.pixel_x = x_offset

	remove_filter("shadow_moving")
	alpha = 255

	for(var/mob/living/carbon/human/H in hunted_players)
		var/obj/screen/fullscreen/screen = H.screens["screamer"]

		if(screen)
			H.clear_fullscreen("screamer", 0)

	sleep(0.5 SECONDS)

	if(target.client)
		animate(target.client, pixel_x = 0, pixel_y = 0, time = 2 SECONDS, easing = SINE_EASING|EASE_OUT)
	tp_in_process = FALSE

/obj/structure/fd/shadow_follower/proc/do_attack()
	preparing_attack = TRUE
	try_to_attack_player_in = try_to_attack_player_how_fast
	try_to_move()

	anchored = FALSE

	for(var/turf/T in range(1, src))
		if(T.density)
			continue
		new /obj/temporary/shadow_attack(T)

	preparing_attack = FALSE
	anchored = TRUE

/obj/structure/fd/shadow_follower/proc/flashed()
	new /obj/temporary/shadow_flashed(get_turf(src), src)
	animate(src, alpha = 0, time = 0.5 SECONDS, LINEAR_EASING)

	flashed = TRUE
	density = FALSE

	let_player_go_after = let_player_go_how_fast

	hunting_any_player = FALSE
	tp_in_process = FALSE
	preparing_attack = FALSE

	next_tp_to_player = next_tp_to_player_how_fast
	try_to_attack_player_in = try_to_attack_player_how_fast

	hunted_players.Cut()
	addtimer(new Callback(src, PROC_REF(unflash)), flashed_for)

/obj/structure/fd/shadow_follower/proc/unflash()
	forceMove(home)

	var/list/remove_overlay_later = list()
	for(var/mob/living/carbon/human/H in view(src))
		var/obj/screen/fullscreen/screen = H.screens["screamer"]

		if(!screen)
			H.overlay_fullscreen("screamer",/obj/screen/fullscreen/screamer)
			remove_overlay_later += H

	alpha = 255
	density = TRUE

	sleep(0.5 SECONDS)

	for(var/mob/living/carbon/human/H in remove_overlay_later)
		var/obj/screen/fullscreen/screen = H.screens["screamer"]

		if(screen)
			H.clear_fullscreen("screamer", 0)

	flashed = FALSE

/obj/screen/fullscreen/blurry/camera
	alpha = 0

/obj/screen/fullscreen/blurry/camera/Initialize()
	. = ..()
	animate(src, alpha = 255, time = 0.8 SECONDS, BOUNCE_EASING|EASE_IN)

/obj/item/fd/magic_camera_chip
	name = "camera chip"
	desc = "Resets camera memory space with fresh slots."

	icon = 'mods/_fd/_maps/collective_nightmare/icons/pda.dmi'
	icon_state = "cart-chem_world"

	w_class = ITEM_SIZE_TINY

/obj/item/fd/magic_camera
	name = "camera"
	desc = "Simple camera in which you can put cartridges."

	icon = 'mods/_fd/_maps/collective_nightmare/icons/pda.dmi'
	icon_state = "pda_world"

	w_class = ITEM_SIZE_SMALL
	var/uses = 0
	var/uses_max = 5

	var/not_in_use = TRUE

	maptext_height = 16
	maptext_width = 96
	maptext_x = 4
	maptext_y = 2

/obj/item/fd/magic_camera/use_tool(obj/item/item, mob/living/user, list/click_params)
	. = ..()
	if(istype(item, /obj/item/fd/magic_camera_chip))
		var/obj/item/fd/magic_camera_chip/C = item

		if(uses >= uses_max)
			return FALSE

		if(do_after(user, 2 SECONDS, C, DO_PUBLIC_UNIQUE))
			user.drop_from_inventory(C)
			C.forceMove(src)
			uses += 1
			visible_message("[user] вставляет в камеру новый чип.", "Ты вставил в [src] новый чип.")
			qdel(C)
			return TRUE
		return FALSE

/obj/item/fd/magic_camera/MouseEntered(location, control, params)
	. = ..()

	if(loc == usr)
		maptext = STYLE_SMALLFONTS_OUTLINE("[uses]/[uses_max]", 7, COLOR_WHITE, COLOR_BLACK)

/obj/item/fd/magic_camera/MouseExited(location, control, params)
	. = ..()

	if(maptext)
		maptext = ""

/obj/item/fd/magic_camera/attack_self(mob/user)
	. = ..()

	if(uses > 0 && not_in_use)
		not_in_use = FALSE

		for(var/obj/structure/fd/shadow_follower/S in view(user))
			S.flashed()

		var/list/remove_overlay_later = list()
		for(var/mob/living/carbon/human/H in view(user))
			H.overlay_fullscreen("flash",/obj/screen/fullscreen/blurry/camera)
			remove_overlay_later += H

		sleep(1 SECONDS)

		for(var/mob/living/carbon/human/H in remove_overlay_later)
			H.clear_fullscreen("flash")

		uses -= 1
		not_in_use = TRUE
		return TRUE

	if(uses <= 0 || !not_in_use)
		return FALSE

/mob/living/carbon/human
	var/current_connection_to_reality = 3
	var/max_connection_to_reality = 3

	var/lost_in_nightmare = FALSE
	var/make_shadow_after = 100

	var/glitching = FALSE
	var/glitches_freq = 40
	var/glitches_freq_base = 40

/mob/living/carbon/human/Life()
	if(current_connection_to_reality < max_connection_to_reality && !lost_in_nightmare)
		if(glitches_freq > 0)
			glitches_freq -= 1

		if(glitches_freq == 10)
			warn_player_about_glitch()

		if(glitches_freq <= 0 && !glitching)
			glitch_out()

	if(current_connection_to_reality <= 0 && !lost_in_nightmare)
		disconnected_from_reality()

	if(lost_in_nightmare && make_shadow_after > 0)
		make_shadow_after -= 1
		maptext = STYLE_SMALLFONTS_OUTLINE("[make_shadow_after]", 7, COLOR_WHITE, COLOR_BLACK)

	if(make_shadow_after <= 0 && lost_in_nightmare)
		if(ckey || client)
			ghostize(0)
		new /obj/structure/fd/shadow_follower(get_turf(src))

		qdel(src)

	. = ..()

/mob/living/carbon/human/proc/warn_player_about_glitch()
	set waitfor = FALSE

	var/text_message = "Ощущаю себя как-то вяло...в чём дело?"
	var/colored = "#000f"
	overlay_fullscreen("underworld_vision",/obj/screen/fullscreen/connection_damage)

	var/obj/screen/novel_message/start_credits/visuals = new /obj/screen/novel_message/start_credits()
	visuals.maptext_x = 0
	visuals.maptext_y = -210

	client.screen += visuals
	visuals.set_text(text_message, colored, time = 2 SECONDS)
	sleep(3 SECONDS)
	clear_fullscreen("underworld_vision")

/mob/living/carbon/human/proc/disconnected_from_reality()
	lost_in_nightmare = TRUE
	stunned = 999999
	overlays += image('mods/_fd/_maps/collective_nightmare/icons/effects.dmi', "static", dir = dir)

	maptext_height = 16
	maptext_width = 96
	maptext_x = 4
	maptext_y = 2

	maptext = STYLE_SMALLFONTS_OUTLINE("[make_shadow_after]", 7, COLOR_WHITE, COLOR_BLACK)

	var/mob/living/simple_animal/connected_player_soul/player_soul = new /mob/living/simple_animal/connected_player_soul(get_turf(src))
	teleop = player_soul

	player_soul.ckey = ckey

/mob/living/carbon/human/proc/glitch_out()
	set waitfor = FALSE
	glitching = TRUE
	glitches_freq = glitches_freq_base
	stunned = 5

	overlays += image('mods/_fd/_maps/collective_nightmare/icons/effects.dmi', "static", dir = dir)
	say(pick("⮸⮌⌥⮎⮃⮃⮀⌃⮌⎋⌥⮎","⮄⮃⮏⭮⮍⮃","⮆⌃⌤⮄⮃⎋⮃","⮆⮍⮆⮎⮑⭿⮌⮎⮸","⮆⌃⮓⮑⮎⮄⮃⮑⎋⌥⌤"))
	sleep(10)
	overlays -= image('mods/_fd/_maps/collective_nightmare/icons/effects.dmi', "static")
	glitching = FALSE

/mob/living/carbon/human/proc/recalculate_reality_connection(amount)
	var/before_calculation = current_connection_to_reality

	current_connection_to_reality = clamp(current_connection_to_reality - amount, 0, max_connection_to_reality)
	if(before_calculation > current_connection_to_reality)
		animation_flash_color(src, "#000000")

		var/obj/screen/fullscreen/screen = screens["connection_damage"]
		if(!screen)
			overlay_fullscreen("connection_damage",/obj/screen/fullscreen/connection_damage)

		sleep(0.5 SECONDS)

		clear_fullscreen("connection_damage", 0)

	if(current_connection_to_reality < 2)
		var/obj/screen/fullscreen/screen = screens["almost_done"]
		if(!screen)
			overlay_fullscreen("almost_done",/obj/screen/fullscreen/almost_done)

	if(current_connection_to_reality > 1)
		var/obj/screen/fullscreen/screen = screens["almost_done"]
		if(screen)
			clear_fullscreen("almost_done")

/mob/living/carbon/human/say(message, datum/language/speaking, whispering)
	if(current_connection_to_reality < max_connection_to_reality && prob(10) && !glitching)
		message = pick("⮸⮌⌥⮎⮃⮃⮀⌃⮌⎋⌥⮎","⮄⮃⮏⭮⮍⮃","⮆⌃⌤⮄⮃⎋⮃","⮆⮍⮆⮎⮑⭿⮌⮎⮸","⮆⌃⮓⮑⮎⮄⮃⮑⎋⌥⌤")

	if(glitching || lost_in_nightmare)
		message = pick("⮸⮌⌥⮎⮃⮃⮀⌃⮌⎋⌥⮎","⮄⮃⮏⭮⮍⮃","⮆⌃⌤⮄⮃⎋⮃","⮆⮍⮆⮎⮑⭿⮌⮎⮸","⮆⌃⮓⮑⮎⮄⮃⮑⎋⌥⌤")

	. = ..()

/mob/living/simple_animal/connected_player_soul
	var/mob/living/carbon/human/soul
	var/last_seconds = FALSE

	name = "soul"
	desc = "Literally your soul!"

	icon = 'mods/_fd/_maps/collective_nightmare/icons/actions_ecult.dmi'
	icon_state = "voidblink"

	density = FALSE
	plane = OBSERVER_PLANE
	invisibility = INVISIBILITY_OBSERVER
	see_invisible = SEE_INVISIBLE_OBSERVER
	sight = SEE_TURFS|SEE_MOBS|SEE_OBJS|SEE_SELF
	simulated = FALSE

	need_to_breath = FALSE

	glide_size = 6
	alpha = 0
	movement_handlers = list(/datum/movement_handler/mob/multiz_connected, /datum/movement_handler/delay = list(0.35), /datum/movement_handler/mob/incorporeal)

/mob/living/simple_animal/connected_player_soul/Initialize()
	. = ..()

	overlay_fullscreen("underworld_vision",/obj/screen/fullscreen/underworld_vision)

	animate(src, transform = matrix(0.01, MATRIX_SCALE), time = 0)
	animate(src, transform = matrix(1, MATRIX_SCALE), alpha = 255, time = 10, BOUNCE_EASING|EASE_IN)

	for(var/mob/living/carbon/human/H in get_turf(src))
		soul = H

/mob/living/simple_animal/connected_player_soul/Life()
	if(soul.make_shadow_after <= 10 && !last_seconds)
		dissapear()

	. = ..()

/mob/living/simple_animal/connected_player_soul/proc/dissapear()
	last_seconds = TRUE

	animate(src, alpha = 0, time = 3 SECONDS, LINEAR_EASING)
	spawn(3.5 SECONDS)
		soul.ckey = ckey
		soul.teleop = null

	QDEL_IN(src, 5 SECONDS)

/mob/living/simple_animal/connected_player_soul/say(message)
	return

/obj/structure/fd/interactive/savepoint_record
	name = "suit record"
	desc = "Vinyl player, used a few generations ago"

	icon = 'mods/_fd/_maps/collective_nightmare/icons/suitrecord.dmi'
	icon_state = "suitrecordbr_closed"
	anchored = TRUE
	density = FALSE

	var/activated = FALSE
	var/regenerative_disc_amount = 0

/obj/structure/fd/interactive/savepoint_record/Click(location, control, params)
	. = ..()

	if(istype(usr, /mob/living/simple_animal/connected_player_soul))
		var/mob/living/simple_animal/connected_player_soul/vessel = usr
		vessel.soul.lost_in_nightmare = FALSE

		animate(vessel.soul, transform = matrix(0.01, MATRIX_SCALE), alpha = 0, time = 10, SINE_EASING|EASE_IN)
		sleep(10)
		vessel.soul.forceMove(get_turf(src))
