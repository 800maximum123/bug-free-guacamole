/mob/living
	var/mob_fishing = FALSE

/atom
	var/allow_fishing = FALSE
	var/image/fishing_overlay
	var/list/fish_types = list(
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

/*/atom/use_tool(obj/item/tool, mob/living/user, list/click_params)
	. = ..()
	if(can_fish(user, tool))
		if(currently_fishing)
			stop_fishing(click_params)
			return TRUE
		else
			do_fishing(tool, user, click_params)*/

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
	fisherman.mob_fishing = TRUE
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
	user.currently_fishing = TRUE
	fisherman = user

	fisherman_tool = tool

	addtimer(new Callback(src, PROC_REF(fishing_qte), user, fisherman_tool), rand(fisherman_tool.min_fishing_duration, fisherman_tool.max_fishing_duration))

/atom/proc/can_fish(mob/living/user, obj/item/tool)
	if(!allow_fishing)
		return FALSE

	if(!tool.can_fish)
		return FALSE

	if(user.mob_fishing)
		return FALSE

	if(currently_fishing && user != fisherman)
		to_chat(user, SPAN_WARNING("Тут уже кто-то рыбачит."))
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

/atom/proc/fishing_qte(mob/living/carbon/user, obj/item/tool)
	set waitfor = FALSE

	if(!fisherman || !currently_fishing || !fisherman_tool)
		return FALSE

	var/new_fish_type = pickweight(fish_types)
	prefish = new new_fish_type(src)

	prefish_icon = new /obj/screen/fish()
	prefish_icon.icon = prefish.icon
	prefish_icon.icon_state = prefish.icon_state
	prefish_icon.dir = WEST

	prefish_icon.connected_pool = src

	animate(prefish_icon, transform = matrix(0, MATRIX_SCALE), time = 0, SINE_EASING|EASE_IN)

	var/ui_position = rand(1,4)
	switch(ui_position)
		if(1)
			prefish_icon.screen_loc = "CENTER+3,CENTER+1"
		if(2)
			prefish_icon.screen_loc = "CENTER,CENTER-3"
		if(3)
			prefish_icon.screen_loc = "CENTER+3,CENTER+3"
		if(4)
			prefish_icon.screen_loc = "CENTER-3,CENTER-1"

	user.client.screen += prefish_icon
	animate(prefish_icon, transform = matrix(3, MATRIX_SCALE), time = 5, BOUNCE_EASING|EASE_IN)

	addtimer(new Callback(src, PROC_REF(fail_qte), user, fisherman_tool), fisherman_tool.fishing_timing)
	playsound(get_turf(src), 'packs/infinity/sound/effects/Splash_Small_01_mono.ogg', 100, TRUE)

/atom/proc/fail_qte(mob/living/carbon/user, obj/item/tool)
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

/atom/proc/catch_fish(mob/living/carbon/user, obj/item/tool)

	user.client.connected_fish = null

	prefish.kill_health()
	prefish.update_icon()

	prefish.forceMove(get_turf(user))
	playsound(get_turf(src), 'sound/effects/watersplash.ogg', 100, TRUE)
	sleep(5)

	for(var/obj/screen/F in user.client.screen)
		if(istype(F, /obj/screen/fish))
			user.client.screen -= F

	qdel(prefish_icon)

	prefish = null
	prefish_icon = null
	addtimer(new Callback(src, PROC_REF(fishing_qte), user, fisherman_tool), rand(fisherman_tool.min_fishing_duration, fisherman_tool.max_fishing_duration))

/client/
	var/obj/screen/fish/connected_fish

/client/MouseMove(object, location, control, params)
	. = ..()

	if(connected_fish)
		handle_fishloc(params)

		if(location == get_turf(mob))
			connected_fish.connected_pool.catch_fish(mob, connected_fish.connected_pool.fisherman_tool)

/client/proc/handle_fishloc(params)
	var/list/coords = screen_loc2pixels(params, view)

	var/anim_time = abs(pixel_x - coords[1]) + abs(pixel_y - coords[2]) / 48
	animate(connected_fish, anim_time, transform = matrix(coords[1], coords[2], MATRIX_TRANSLATE), easing = LINEAR_EASING, flags = ANIMATION_PARALLEL|ANIMATION_LINEAR_TRANSFORM)

/proc/screen_loc2pixels(params, view_range = 7)
	RETURN_TYPE(/list)

	var/list/screen_loc = splittext(params2list(params)["screen-loc"], ",")
	screen_loc = splittext(screen_loc[1], ":") + splittext(screen_loc[2], ":")

	var/list/view_size = getviewsize(view_range)

	var/screen_pixel_x = text2num(screen_loc[1]) * WORLD_ICON_SIZE + text2num(screen_loc[2]) - view_size[1] * 16 - WORLD_ICON_SIZE
	var/screen_pixel_y = text2num(screen_loc[3]) * WORLD_ICON_SIZE + text2num(screen_loc[4]) - view_size[2] * 16 - WORLD_ICON_SIZE

	return list(screen_pixel_x, screen_pixel_y)

/obj/screen/fish
	name = "РЫБА"
	desc = "ТАЩИ ЕЁ БЛЯТЬ!!!"

	plane = HUD_PLANE
	layer = 5.3

	screen_loc = "CENTER-0.2,CENTER"
	var/atom/connected_pool

/obj/screen/fish/Initialize()
	. = ..()
	SetTransform(2)

/obj/screen/fish/Click(location, control, params)
	. = ..()

	usr.client.connected_fish = src

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
