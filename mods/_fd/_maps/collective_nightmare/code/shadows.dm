/area/
	var/safe_zone = FALSE // чтобы от теней была передышка хоть где-то

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
			if(H.current_connection_to_reality > 0)
				H.current_connection_to_reality -= 1
				animation_flash_color(H, "#000000")

	QDEL_IN(src, duration)

/obj/screen/fullscreen/screamer
	icon = 'mods/_fd/_maps/collective_nightmare/icons/effects.dmi'
	icon_state = "static_base"
	screen_loc = ui_entire_screen

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
		if(!H.client)
			hunted_players -= H

		var/area/A = get_area(H)
		if(A.safe_zone)
			hunted_players -= H

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
	target.client.pixel_y = y_offset
	target.client.pixel_x = x_offset

	remove_filter("shadow_moving")
	alpha = 255

	for(var/mob/living/carbon/human/H in hunted_players)
		var/obj/screen/fullscreen/screen = H.screens["screamer"]

		if(screen)
			H.clear_fullscreen("screamer", 0)

	sleep(0.5 SECONDS)
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
	var/glitches_freq = 50
	var/glitches_freq_base = 50

/mob/living/carbon/human/Life()
	. = ..()

	if(current_connection_to_reality < max_connection_to_reality && !lost_in_nightmare)
		if(glitches_freq > 0)
			glitches_freq -= 1

		if(glitches_freq <= 0 && !glitching)
			glitch_out()

	if(current_connection_to_reality <= 0 && !lost_in_nightmare)
		disconnected_from_reality()

	if(lost_in_nightmare && make_shadow_after > 0)
		make_shadow_after -= 1

	if(make_shadow_after <= 0 && lost_in_nightmare)
		ghostize(0)
		new /obj/structure/fd/shadow_follower(get_turf(src))

		qdel(src)

/mob/living/carbon/human/proc/disconnected_from_reality()
	set waitfor = FALSE

	lost_in_nightmare = TRUE
	stunned = 999999
	overlays += image('mods/_fd/_maps/collective_nightmare/icons/effects.dmi', "static", dir = dir)

/mob/living/carbon/human/proc/glitch_out()
	set waitfor = FALSE
	glitching = TRUE
	glitches_freq = glitches_freq_base
	stunned = 5

	overlays += image('mods/_fd/_maps/collective_nightmare/icons/effects.dmi', "static", dir = dir)
	say(pick("⮸⮌⌥⮎⮃⮃⮀⌃⮌⎋⌥⮎","⮄⮃⮏⭮⮍⮃","⮆⌃⌤⮄⮃⎋⮃","⮆⮍⮆⮎⮑⭿⮌⮎⮸","⮆⌃⮓⮑⮎⮄⮃⮑⎋⌥⌤"))
	sleep(5)
	overlays -= image('mods/_fd/_maps/collective_nightmare/icons/effects.dmi', "static")
	glitching = FALSE

/mob/living/carbon/human/say(message, datum/language/speaking, whispering)
	if(glitching)
		message = pick("⮸⮌⌥⮎⮃⮃⮀⌃⮌⎋⌥⮎","⮄⮃⮏⭮⮍⮃","⮆⌃⌤⮄⮃⎋⮃","⮆⮍⮆⮎⮑⭿⮌⮎⮸","⮆⌃⮓⮑⮎⮄⮃⮑⎋⌥⌤")

	. = ..()
