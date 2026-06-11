/mob/living
	var/mob_fishing = FALSE
	var/atom/fishing_in

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

	user.client.screen += prefish_icon

	addtimer(new Callback(src, PROC_REF(fail_qte), user, fisherman_tool), fisherman_tool.fishing_timing)
	playsound(get_turf(src), 'packs/infinity/sound/effects/Splash_Small_01_mono.ogg', 100, TRUE)

	animate(prefish_icon, tool.fishing_timing/2, easing = SINE_EASING|EASE_OUT, transform = matrix().Update(scale_x = 2.5, scale_y = 2.5, rotation = 30))
	sleep(tool.fishing_timing/2)
	animate(prefish_icon, tool.fishing_timing/2, easing = SINE_EASING|EASE_IN, transform = matrix())

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
