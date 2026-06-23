/datum/keybinding/living/fd/fishing_eye
	hotkey_keys = list("F")
	name = "fishing_eye"
	full_name = "General: FISHING EYE"
	description = ""

/datum/keybinding/living/fd/fishing_eye/can_use(client/user)
	. = ..()
	var/mob/living/L = user.mob

	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		if(H.get_skill_value(SKILL_COOKING) < SKILL_EXPERIENCED)
			H.balloon_alert(H, "|НЕДОСТАТОЧНЫЙ УРОВЕНЬ: ГОТОВКА|", COLOR_RED)
			return FALSE

/datum/keybinding/living/fd/fishing_eye/down(client/user)
	var/mob/living/L = user.mob
	user.view = 30
	L.overlay_fullscreen(/obj/screen/fullscreen/fd/blackout/alt)
	L.show_fisherman(L)

	for(var/obj/landmark/fd/fishgen/F in world)
		if(F.fishing_spot_richness == 0)
			continue
		L.show_spot(F)

	return TRUE

/datum/keybinding/living/fd/fishing_eye/up(client/user)
	var/mob/living/L = user.mob
	user.view = 7
	L.clear_fullscreen(/obj/screen/fullscreen/fd/blackout/alt)

	for(var/obj/landmark/fd/fishgen/F in world)
		L.hide_spot(F)

	L.hide_fisherman(L)

	return TRUE

/image/fishing_spot
/image/fisherman

/mob/living
	var/mob_fishing = FALSE
	var/atom/fishing_in

	var/list/revealed_fishspots = list()
	var/list/revealed_fishermans = list()

/mob/living/proc/show_fisherman(atom/A)
	if(!client || (A in revealed_fishermans))
		return

	var/image/fisherman/new_fisherman = new /image/hint('mods/_fd/fd_assets/icons/aurora/overmap_effects.dmi', A, "globe", layer = HUD_PLANE)

	new_fisherman.plane = HUD_PLANE
	new_fisherman.color = COLOR_CYAN
	new_fisherman.filters = list(filter(type = "outline", size = 2, color = COLOR_WHITE))

	var/matrix/M = matrix()
	M.Scale(6)

	new_fisherman.transform = M

	client.images += new_fisherman
	revealed_fishermans[A] = new_fisherman

/mob/living/proc/hide_fisherman(atom/A)
	if(!client || !(A in revealed_fishermans))
		return

	var/image/fisherman/the_fisherman = revealed_fishermans[A]
	if(client)
		client.images -= the_fisherman
	revealed_fishermans -= A

/mob/living/proc/show_spot(atom/A)
	if(!client || (A in revealed_fishspots))
		return

	var/image/fishing_spot/new_spot = new /image/hint('mods/_fd/fd_assets/icons/aurora/overmap_effects.dmi', A, "carp", layer = HUD_PLANE)

	new_spot.plane = HUD_PLANE

	var/matrix/M = matrix()
	M.Scale(6)

	new_spot.transform = M

	client.images += new_spot
	revealed_fishspots[A] = new_spot

/mob/living/proc/hide_spot(atom/A)
	if(!client || !(A in revealed_fishspots))
		return

	var/image/fishing_spot/the_spot = revealed_fishspots[A]
	if(client)
		client.images -= the_spot
	revealed_fishspots -= A

/obj/effect/fd/fishing_spot_clues
	mouse_opacity = FALSE
	icon = 'mods/_fd/fd_assets/icons/overmap_eris.dmi'
	icon_state = "carps_school0_g"
	layer = 2.21

	color = COLOR_BLACK

/obj/effect/fd/fishing_spot_clues/Initialize()
	. = ..()
	SetTransform(2)
	add_filter("fish", 2, list("type" = "outline", , "size" = 1, "color" = COLOR_WHITE))

/obj/landmark/fd/fishgen
	name = "fishing spot"
	icon_state = "carp"
	icon = 'mods/_fd/fd_assets/icons/aurora/overmap_effects.dmi'

	var/list/possible_fish_spawns = list(
		/mob/living/simple_animal/aquatic/fish = 100,
		/mob/living/simple_animal/aquatic/fish/grump = 100,
		/mob/living/simple_animal/aquatic/fish/judge = 100,
		/mob/living/simple_animal/aquatic/fish/pike = 100,
		/mob/living/simple_animal/aquatic/fish/murkin = 100,
		/mob/living/simple_animal/aquatic/fish/solarfin = 100,
		/mob/living/simple_animal/aquatic/fish/sifbass = 100,
		/mob/living/simple_animal/aquatic/fish/trout = 100,
		/mob/living/simple_animal/aquatic/fish/salmon = 100,
		/mob/living/simple_animal/aquatic/fish/bass = 100
		)

	var/fishing_spot_richness = -1 // means there is infinite fish amount
	var/regenerate = TRUE

	var/generation_radius = 3
	var/list/atom/connected_atoms = list()

/obj/landmark/fd/fishgen/Initialize()
	. = ..()

	if(regenerate)

		for(var/atom/A in range(generation_radius,src))
			if(!A.allow_fishing)
				continue
			if(A.has_fish)
				continue

			A.has_fish = TRUE
			A.connected_landmark = src
			connected_atoms += A

			if(prob(10))
				new /obj/effect/fd/fishing_spot_clues(get_turf(A))

		if(fishing_spot_richness > 0)
			fishing_spot_richness = rand(1,fishing_spot_richness)

/obj/landmark/fd/fishgen/proc/update_fishing_spot_status()
	if(fishing_spot_richness == 0)
		for(var/atom/A in connected_atoms)
			for(var/obj/effect/fd/fishing_spot_clues/C in get_turf(A))
				qdel(C)

			A.has_fish = FALSE
			A.connected_landmark = null
			connected_atoms -= A

/obj/landmark/fd/fishgen/dionacave
	possible_fish_spawns = list(
		/mob/living/simple_animal/aquatic/fish = 100,
		/mob/living/simple_animal/aquatic/fish/grump = 100,
		/mob/living/simple_animal/aquatic/fish/judge = 100,
		)
	generation_radius = 5

/obj/landmark/fd/fishgen/dionacave/Initialize()
	. = ..()
	regenerate = FALSE

/obj/landmark/fd/fishgen/ocean
	fishing_spot_richness = 20

/proc/regenerate_fishspots(minimum_needed)
	var/current_regenerated = 0
	for(var/obj/landmark/fd/fishgen/F in world)
		if(current_regenerated < minimum_needed)
			F.fishing_spot_richness = initial(F.fishing_spot_richness)
			F.Initialize()

			current_regenerated++
		else
			if(prob(40))
				F.fishing_spot_richness = initial(F.fishing_spot_richness)
				F.Initialize()

/atom
	var/allow_fishing = FALSE
	var/has_fish = FALSE
	var/image/fishing_overlay
	var/obj/landmark/fd/fishgen/connected_landmark
	var/currently_fishing = FALSE
	var/mob/living/fisherman
	var/obj/item/fisherman_tool

	var/mob/living/prefish
	var/obj/screen/fish/prefish_icon

/obj/item/afterattack(atom/A as mob|obj|turf|area, mob/living/user as mob, proximity)

	if(A.can_fish(user, src))
		if(A.currently_fishing)
			A.stop_fishing()
			return TRUE
		else
			A.do_fishing(src, user)

	..()

/atom/proc/stop_fishing()
	CutOverlays(fishing_overlay)
	currently_fishing = FALSE

	for(var/obj/screen/F in fisherman.client.screen)
		if(istype(F, /obj/screen/fish))
			fisherman.client.screen -= F

	fisherman.client.connected_fish = null

	qdel(prefish)
	qdel(prefish_icon)

	prefish = null
	prefish_icon = null

	fisherman.anchored = FALSE
	fisherman.mob_fishing = FALSE
	fisherman.fishing_in = null
	fisherman = null

	fisherman_tool = null

/atom/proc/do_fishing(obj/item/tool, mob/living/carbon/user)
	set waitfor = FALSE
	fishing_overlay = image(icon = 'mods/_fd/fd_assets/icons/goons/64x64.dmi', icon_state = "scream")
	fishing_overlay.pixel_x = -16
	fishing_overlay.pixel_y = -16
	fishing_overlay.alpha = 100

	AddOverlays(fishing_overlay)
	currently_fishing = TRUE

	user.anchored = TRUE
	user.mob_fishing = TRUE
	user.fishing_in = src
	fisherman = user

	fisherman_tool = tool

	addtimer(new Callback(src, PROC_REF(fishing_qte), user, fisherman_tool), rand(fisherman_tool.min_fishing_duration, fisherman_tool.max_fishing_duration))

/atom/proc/can_fish(mob/living/user, obj/item/tool)
	if(!allow_fishing)
		return FALSE

	if(!has_fish)
		return FALSE

	if(!tool.can_fish)
		return FALSE

	if(currently_fishing && user != fisherman)
		to_chat(user, SPAN_WARNING("Тут уже кто-то рыбачит."))
		return FALSE

	if(user.mob_fishing && user.fishing_in != src)
		return FALSE

	if(tool.fishing_range < get_dist(user, src))
		return FALSE

	if(!iscarbon(user))
		return FALSE

	if(isturf(src)) // Проверка на размер водоёма, пока-что только для турфов
		var/adjacent_duplicates = 0
		for(var/new_direction in GLOB.alldirs)
			if(!istype(get_step(src, new_direction), src.type))
				continue
			adjacent_duplicates++

		if(adjacent_duplicates < 5)
			to_chat(user, SPAN_WARNING("Водоём слишком мал для рыбалки."))
			return FALSE

	return TRUE

/atom/proc/fishing_qte(mob/living/carbon/human/user, obj/item/tool)
	set waitfor = FALSE

	if(!fisherman || !currently_fishing || !fisherman_tool)
		return FALSE

	if(!has_fish)
		stop_fishing()
		return FALSE

	var/new_fish_type = pickweight(connected_landmark.possible_fish_spawns)
	prefish = new new_fish_type(src)

	prefish_icon = new /obj/screen/fish()
	prefish_icon.icon = prefish.icon
	prefish_icon.icon_state = prefish.icon_state
	prefish_icon.dir = WEST
	prefish_icon.connected_pool = src

	user.client.screen += prefish_icon

	addtimer(new Callback(src, PROC_REF(fail_qte), user, fisherman_tool), fisherman_tool.fishing_timing)
	playsound(get_turf(src), 'packs/infinity/sound/effects/Splash_Small_01_mono.ogg', 100, TRUE)

	animate(prefish_icon, tool.fishing_timing/2, easing = SINE_EASING|EASE_OUT, transform = matrix().Update(scale_x = 2.5, scale_y = 2.5, rotation = 30))
	sleep(tool.fishing_timing/2)
	animate(prefish_icon, tool.fishing_timing/2, easing = SINE_EASING|EASE_IN, transform = matrix())

/atom/proc/fail_qte(mob/living/carbon/human/user, obj/item/tool)
	if(prefish)

		for(var/obj/screen/F in user.client.screen)
			if(istype(F, /obj/screen/fish))
				user.client.screen -= F

		user.client.connected_fish = null

		qdel(prefish)
		qdel(prefish_icon)

		prefish = null
		prefish_icon = null

		addtimer(new Callback(src, PROC_REF(fishing_qte), user, fisherman_tool), rand(fisherman_tool.min_fishing_duration, fisherman_tool.max_fishing_duration))

/atom/proc/catch_fish(mob/living/carbon/human/user, obj/item/tool)

	user.client.connected_fish = null
	prefish.kill_health()
	prefish.update_icon()

	if(user.raft)
		prefish.layer += 0.01
		prefish.glide_size = user.raft.glide_size

		prefish.do_water_overlay = FALSE
		prefish.toggle_water_overlay(FALSE)

		prefish.pass_flags |= PASS_FLAG_TABLE

		prefish.can_sunk = FALSE

		prefish.sunking = FALSE
		prefish.update_sunking(FALSE)

		user.raft.raft_storage += prefish
		prefish.forceMove(get_turf(user))
		playsound(get_turf(src), 'sound/effects/watersplash.ogg', 100, TRUE)

	else
		prefish.forceMove(get_turf(user))
		playsound(get_turf(src), 'sound/effects/watersplash.ogg', 100, TRUE)

	sleep(5)

	for(var/obj/screen/F in user.client.screen)
		if(istype(F, /obj/screen/fish))
			user.client.screen -= F

	qdel(prefish_icon)

	prefish = null
	prefish_icon = null

	if(connected_landmark.fishing_spot_richness > 0)
		connected_landmark.fishing_spot_richness = clamp(connected_landmark.fishing_spot_richness - 1, 0,connected_landmark.fishing_spot_richness)
		connected_landmark.update_fishing_spot_status()

	addtimer(new Callback(src, PROC_REF(fishing_qte), user, fisherman_tool), rand(fisherman_tool.min_fishing_duration, fisherman_tool.max_fishing_duration))

/client
	var/obj/screen/fish/connected_fish

/obj/screen/fish
	name = "РЫБА"
	desc = "ТАЩИ ЕЁ БЛЯТЬ!!!"

	plane = HUD_PLANE
	layer = 5.3

	mouse_opacity = 2
	screen_loc = "TOP-1, CENTER"

	var/atom/connected_pool

/obj/screen/fish/Initialize()
	. = ..()
	add_filter("lefish", 1, list("type" = "outline", "size" = 1, "color" = COLOR_GREEN))

/obj/screen/fish/Click(location, control, params)
	. = ..()
	animate(src, transform = matrix(0, -96, MATRIX_TRANSLATE), alpha = 0, time = 5, easing = SINE_EASING|EASE_IN, flags = ANIMATION_PARALLEL)
	connected_pool.catch_fish(usr, connected_pool.fisherman_tool)

// RAFT

/client/
	var/atom/raft_moving_atom

/client/Click(object,location,control,params)
	if(raft_moving_atom)
		var/list/coords = screen_loc2pixels(params)

		animate(raft_moving_atom, pixel_y = coords[2], pixel_x = coords[1], 5, SINE_EASING|EASE_OUT)
		raft_moving_atom = null
		return TRUE

	. = ..()

/proc/screen_loc2pixels(params, view_range = 7, max_range = view_range)
	RETURN_TYPE(/list)

	var/list/screen_loc = splittext(params2list(params)["screen-loc"], ",")
	screen_loc = splittext(screen_loc[1], ":") + splittext(screen_loc[2], ":")

	var/list/view_size = getviewsize(view_range)

	var/screen_pixel_x = text2num(screen_loc[1]) * WORLD_ICON_SIZE + text2num(screen_loc[2]) - view_size[1] * 16 - WORLD_ICON_SIZE
	var/screen_pixel_y = text2num(screen_loc[3]) * WORLD_ICON_SIZE + text2num(screen_loc[4]) - view_size[2] * 16 - WORLD_ICON_SIZE

	if(max_range)
		var/limit = max_range * WORLD_ICON_SIZE
		screen_pixel_x = clamp(screen_pixel_x, -limit, limit)
		screen_pixel_y = clamp(screen_pixel_y, -limit, limit)

	return list(screen_pixel_x, screen_pixel_y)

/mob/living/carbon/human
	var/obj/structure/fd/makeshift_raft/raft

/mob/living/carbon/human/movement_delay()
	. = ..()

	if(raft)
		. += 3

	for(var/obj/structure/fd/makeshift_raft/R in loc)
		if(src in R.raft_storage)
			. += 3

/mob/living/carbon/human/SelfMove(direction)
	var/turf/old_location = get_turf(src)
	var/list/atom/connected_elements = list()
	if(raft)
		connected_elements += raft.raft_storage

	. = ..()

	if(raft)
		var/turf/new_location = get_turf(src)
		var/raft_newdir = get_dir(old_location,new_location)

		raft.forceMove(get_step(raft,raft_newdir))

		if(length(connected_elements))
			for(var/obj/F in connected_elements)
				F.forceMove(get_step(F,raft_newdir))
			for(var/mob/F in connected_elements)
				F.forceMove(get_step(F,raft_newdir))

/obj/structure/fd/makeshift_raft
	var/mob/living/carbon/human/ship_captain
	icon = 'mods/_fd/fd_assets/icons/aurora/wood.dmi'
	icon_state = "plank_deep"
	name = "makeshift raft"
	desc = "Are you sure it will NOT break?"

	var/list/atom/raft_storage = list()
	var/list/exclude_this_types = list(/obj/effect,
									/obj/temp_visual,
									/obj/decal,
									/obj/fd_water,
									/obj/machinery/atmospherics/pipe,
									/obj/structure/cable)

	bound_height = 128
	bound_width = 128

	pixel_x = 48
	pixel_y = 48

	do_water_overlay = FALSE
	glide_size = 0.9

/obj/structure/fd/makeshift_raft/Initialize()
	. = ..()
	SetTransform(4)

/obj/structure/fd/makeshift_raft/Move()
	var/turf/old_location = get_turf(src)
	var/list/atom/connected_elements = list()
	connected_elements += raft_storage

	. = ..()

	var/turf/new_location = get_turf(src)
	var/direction = get_dir(old_location,new_location)

	if(!ship_captain && length(connected_elements))
		for(var/obj/F in connected_elements)
			F.forceMove(get_step(F,direction))

		for(var/mob/F in connected_elements)
			F.forceMove(get_step(F,direction))

/obj/structure/fd/makeshift_raft/AltClick(mob/user)
	. = ..()

	var/list/atom/candidates = list()
	for(var/atom/A in raft_storage)
		var/image/radial_button = image(icon = A.icon, icon_state = A.icon_state)
		radial_button.name = "[A.name]"
		LAZYSET(candidates, A, radial_button)

	var/atom/movable/selected = show_radial_menu(user, user, candidates, radius = 45, require_near = TRUE, use_labels = TRUE)
	if(!selected)
		return FALSE

	var/list/what_to_do = list(
		"ИЗМЕНИТЬ ПОЛОЖЕНИЕ" = image('mods/_fd/_maps/collective_nightmare/icons/radial.dmi', "radial_point"),
		"ИЗМЕНИТЬ ПРИВЯЗКУ" = image('mods/_fd/_maps/collective_nightmare/icons/radial.dmi', "radial_lock"),
		"ИЗМЕНИТЬ ПЛОТНОСТЬ" = image('mods/_fd/_maps/collective_nightmare/icons/radial.dmi', "radial_pull"),
	)
	var/chosen_option = show_radial_menu(user, user, what_to_do, radius = 45, require_near = TRUE)
	if(!chosen_option)
		return FALSE
	switch(chosen_option)
		if("ИЗМЕНИТЬ ПРИВЯЗКУ")
			if(do_after(user, 1 SECONDS, user, DO_PUBLIC_UNIQUE))

				selected.anchored = !selected.anchored
				return TRUE
			return FALSE
		if("ИЗМЕНИТЬ ПЛОТНОСТЬ")
			if(do_after(user, 1 SECONDS, user, DO_PUBLIC_UNIQUE))

				selected.density = !selected.density
				return TRUE
			return FALSE
		if("ИЗМЕНИТЬ ПОЛОЖЕНИЕ")
			user.client.raft_moving_atom = selected
			return TRUE

/obj/structure/fd/makeshift_raft/attack_hand(mob/living/user)
	if(!ship_captain && ishuman(user))
		var/mob/living/carbon/human/H = user
		if(do_after(user, 5 SECONDS, user, DO_PUBLIC_UNIQUE))
			if(H in raft_storage)
				raft_storage -= H
			ship_captain = H

			H.raft = src
			H.pixel_y += 10
			H.do_water_overlay = FALSE
			H.can_sunk = FALSE
			H.toggle_water_overlay(FALSE)

			H.pass_flags |= PASS_FLAG_TABLE

			if(H.sunking)
				H.sunking = FALSE
				H.update_sunking(FALSE)

			H.forceMove(get_turf(src))

			return TRUE
		return FALSE

	if(ship_captain)
		if(do_after(user, 5 SECONDS, user, DO_PUBLIC_UNIQUE))
			ship_captain.raft = null
			ship_captain.pixel_y = initial(ship_captain.pixel_y)

			if(ship_captain in loc)
				ship_captain.layer += 0.01
				ship_captain.glide_size = glide_size

				raft_storage += ship_captain
			else
				ship_captain.do_water_overlay = TRUE
				ship_captain.can_sunk = initial(ship_captain.can_sunk)
				ship_captain.pass_flags = initial(pass_flags)

			ship_captain = null

			return TRUE
		return FALSE

	. = ..()

// Experimental

/obj/structure/fd/makeshift_raft/Crossed(O)
	. = ..()
	if(O != ship_captain && !(O in raft_storage))
		var/atom/movable/A = O
		if(!(A.type in exclude_this_types))

			A.layer += 0.01
			A.glide_size = glide_size

			A.do_water_overlay = FALSE
			A.can_sunk = FALSE
			A.toggle_water_overlay(FALSE)

			A.pass_flags |= PASS_FLAG_TABLE

			A.sunking = FALSE
			A.update_sunking(FALSE)

			raft_storage += A

/obj/structure/fd/makeshift_raft/Uncrossed(O)
	. = ..()
	if(O in raft_storage)
		var/atom/movable/A = O

		A.pixel_y = initial(A.pixel_y)
		A.pixel_x = initial(A.pixel_x)

		A.do_water_overlay = TRUE
		A.can_sunk = initial(A.can_sunk)
		A.glide_size = initial(A.glide_size)
		A.layer = initial(A.layer)

		A.pass_flags = initial(pass_flags)

		A.density = initial(A.density)
		A.anchored = FALSE

		raft_storage -= A


// FISH TYPES

/mob/living/simple_animal/aquatic/fish/bass
	icon = 'mods/_fd/fishing/icons/fish.dmi'
	icon_state = "bass-swim"
	icon_living = "bass-swim"
	icon_dead = "bass-dead"

/mob/living/simple_animal/aquatic/fish/trout
	icon = 'mods/_fd/fishing/icons/fish.dmi'
	icon_state = "trout-swim"
	icon_living = "trout-swim"
	icon_dead = "trout-dead"

/mob/living/simple_animal/aquatic/fish/salmon
	icon = 'mods/_fd/fishing/icons/fish.dmi'
	icon_state = "salmon-swim"
	icon_living = "salmon-swim"
	icon_dead = "salmon-dead"

/mob/living/simple_animal/aquatic/fish/sifbass
	icon = 'mods/_fd/fishing/icons/fish.dmi'
	icon_state = "sifbass-swim"
	icon_living = "sifbass-swim"
	icon_dead = "sifbass-dead"
	meat_amount = 2

/mob/living/simple_animal/aquatic/fish/solarfin
	icon = 'mods/_fd/fishing/icons/fish.dmi'
	icon_state = "solarfin-swim"
	icon_living = "solarfin-swim"
	icon_dead = "solarfin-dead"

/mob/living/simple_animal/aquatic/fish/murkin
	icon = 'mods/_fd/fishing/icons/fish.dmi'
	icon_state = "murkin-swim"
	icon_living = "murkin-swim"
	icon_dead = "murkin-dead"

/mob/living/simple_animal/aquatic/fish/pike
	icon = 'mods/_fd/fishing/icons/fish.dmi'
	icon_state = "pike-swim"
	icon_living = "pike-swim"
	icon_dead = "pike-dead"
