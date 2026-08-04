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

/mob/living/Move(a, b, flag)
	if(mob_fishing && fishing_in)
		fishing_in.stop_fishing()

	. = ..()

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

	var/image/fishing_spot/new_spot = new /image/hint(A.icon, A, A.icon_state, layer = HUD_PLANE)

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
	SetTransform(1.2)
	add_filter("fish", 2, list("type" = "outline", , "size" = 1, "color" = COLOR_WHITE))
	START_PROCESSING(SSobj,src)

/obj/effect/fd/fishing_spot_clues/Process()
	animate(src, pixel_x = pixel_x - pick(0,1), pixel_y = pixel_y - pick(0,1), time = 0.5, easing = EASE_IN)
	animate(pixel_x = pixel_x + pick(0,1), pixel_y = pixel_y + pick(0,1), time = 1)
	animate(pixel_x = initial(pixel_x), pixel_y = initial(pixel_y), time = 0.3, easing = EASE_OUT)

/obj/landmark/fd/fishgen
	name = "fishing spot"
	icon_state = "carp"
	icon = 'mods/_fd/fd_assets/icons/aurora/overmap_effects.dmi'

	var/list/possible_fish_spawns = list(
		/mob/living/simple_animal/aquatic/fish/bass = 100,
		/mob/living/simple_animal/aquatic/fish/anchovy = 100,
		/mob/living/simple_animal/aquatic/fish/angelfish = 100,
		/mob/living/simple_animal/aquatic/fish/arctic_char = 100,
		/mob/living/simple_animal/aquatic/fish/baby_carp = 100,
		/mob/living/simple_animal/aquatic/fish/bc_angel = 100,
		/mob/living/simple_animal/aquatic/fish/betta = 100,
		/mob/living/simple_animal/aquatic/fish/blue_tang = 100,
		/mob/living/simple_animal/aquatic/fish/bumpy = 100,
		/mob/living/simple_animal/aquatic/fish/cardinalfish = 100,
		/mob/living/simple_animal/aquatic/fish/carp = 100,
		/mob/living/simple_animal/aquatic/fish/catfish = 100,
		/mob/living/simple_animal/aquatic/fish/chub = 100,
		/mob/living/simple_animal/aquatic/fish/clownfish = 100,
		/mob/living/simple_animal/aquatic/fish/cod = 100,
		/mob/living/simple_animal/aquatic/fish/code_worm = 100,
		/mob/living/simple_animal/aquatic/fish/coelacanth = 100,
		/mob/living/simple_animal/aquatic/fish/dace = 100,
		/mob/living/simple_animal/aquatic/fish/damselfish = 100,
		/mob/living/simple_animal/aquatic/fish/dwarf_moonfish = 100,
		/mob/living/simple_animal/aquatic/fish/eel = 100,
		/mob/living/simple_animal/aquatic/fish/emulsijack = 100,
		/mob/living/simple_animal/aquatic/fish/eyefish = 100,
		/mob/living/simple_animal/aquatic/fish/firefish = 100,
		/mob/living/simple_animal/aquatic/fish/flounder = 100,
		/mob/living/simple_animal/aquatic/fish/goldenfish = 100,
		/mob/living/simple_animal/aquatic/fish/goldfish = 100,
		/mob/living/simple_animal/aquatic/fish/greenchromis = 100,
		/mob/living/simple_animal/aquatic/fish/guppy = 100,
		/mob/living/simple_animal/aquatic/fish/herring = 100,
		/mob/living/simple_animal/aquatic/fish/jumpercable = 100,
		/mob/living/simple_animal/aquatic/fish/lanternfish = 100,
		/mob/living/simple_animal/aquatic/fish/lava_loop = 100,
		/mob/living/simple_animal/aquatic/fish/lavafish = 100,
		/mob/living/simple_animal/aquatic/fish/lionfish = 100,
		/mob/living/simple_animal/aquatic/fish/mahimahi = 100,
		/mob/living/simple_animal/aquatic/fish/mandarin_fish = 100,
		/mob/living/simple_animal/aquatic/fish/meat = 100,
		/mob/living/simple_animal/aquatic/fish/minnow = 100,
		/mob/living/simple_animal/aquatic/fish/moltenfish = 100,
		/mob/living/simple_animal/aquatic/fish/needlefish = 100,
		/mob/living/simple_animal/aquatic/fish/plasma_loop = 100,
		/mob/living/simple_animal/aquatic/fish/plastetra = 100,
		/mob/living/simple_animal/aquatic/fish/pufferfish = 100,
		/mob/living/simple_animal/aquatic/fish/red_herring = 100,
		/mob/living/simple_animal/aquatic/fish/rosefin_shiner = 100,
		/mob/living/simple_animal/aquatic/fish/royal_gramma = 100,
		/mob/living/simple_animal/aquatic/fish/salmon = 100,
		/mob/living/simple_animal/aquatic/fish/sand_surfer = 100,
		/mob/living/simple_animal/aquatic/fish/sardine = 100,
		/mob/living/simple_animal/aquatic/fish/sockeye = 100,
		/mob/living/simple_animal/aquatic/fish/stingray = 100,
		/mob/living/simple_animal/aquatic/fish/sun_fish = 100,
		/mob/living/simple_animal/aquatic/fish/three_eyes = 100,
		/mob/living/simple_animal/aquatic/fish/tiger_oscar = 100,
		/mob/living/simple_animal/aquatic/fish/tizira_moonfish = 100,
		/mob/living/simple_animal/aquatic/fish/trout = 100,
		/mob/living/simple_animal/aquatic/fish/tuna = 100,
		/mob/living/simple_animal/aquatic/fish/void_fish = 100,
		/mob/living/simple_animal/aquatic/fish/yellow_tang = 100,
		/mob/living/simple_animal/aquatic/fish/zipzap = 100
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
		/mob/living/simple_animal/aquatic/fish/anchovy = 100,
		/mob/living/simple_animal/aquatic/fish/plastetra = 100,
		/mob/living/simple_animal/aquatic/fish/sardine = 100,
		)
	generation_radius = 5

/obj/landmark/fd/fishgen/dionacave/Initialize()
	. = ..()
	regenerate = FALSE

/obj/landmark/fd/fishgen/ocean
	possible_fish_spawns = list(
		/mob/living/simple_animal/aquatic/fish/bass = 80,
		/mob/living/simple_animal/aquatic/fish/anchovy = 80,
		/mob/living/simple_animal/aquatic/fish/bc_angel = 50,
		/mob/living/simple_animal/aquatic/fish/betta = 20,
		/mob/living/simple_animal/aquatic/fish/blue_tang = 50,
		/mob/living/simple_animal/aquatic/fish/cardinalfish = 50,
		/mob/living/simple_animal/aquatic/fish/carp = 80,
		/mob/living/simple_animal/aquatic/fish/catfish = 80,
		/mob/living/simple_animal/aquatic/fish/chub = 80,
		/mob/living/simple_animal/aquatic/fish/clownfish = 50,
		/mob/living/simple_animal/aquatic/fish/cod = 80,
		/mob/living/simple_animal/aquatic/fish/coelacanth = 50,
		/mob/living/simple_animal/aquatic/fish/dace = 50,
		/mob/living/simple_animal/aquatic/fish/damselfish = 50,
		/mob/living/simple_animal/aquatic/fish/dwarf_moonfish = 20,
		/mob/living/simple_animal/aquatic/fish/firefish = 20,
		/mob/living/simple_animal/aquatic/fish/goldfish = 20,
		/mob/living/simple_animal/aquatic/fish/greenchromis = 80,
		/mob/living/simple_animal/aquatic/fish/herring = 50,
		/mob/living/simple_animal/aquatic/fish/lionfish = 50,
		/mob/living/simple_animal/aquatic/fish/mahimahi = 80,
		/mob/living/simple_animal/aquatic/fish/mandarin_fish = 50,
		/mob/living/simple_animal/aquatic/fish/plastetra = 80,
		/mob/living/simple_animal/aquatic/fish/pufferfish = 80,
		/mob/living/simple_animal/aquatic/fish/red_herring = 20,
		/mob/living/simple_animal/aquatic/fish/rosefin_shiner = 20,
		/mob/living/simple_animal/aquatic/fish/royal_gramma = 50,
		/mob/living/simple_animal/aquatic/fish/salmon = 80,
		/mob/living/simple_animal/aquatic/fish/sardine = 80,
		/mob/living/simple_animal/aquatic/fish/stingray = 50,
		/mob/living/simple_animal/aquatic/fish/tizira_moonfish = 20,
		/mob/living/simple_animal/aquatic/fish/trout = 80,
		/mob/living/simple_animal/aquatic/fish/tuna = 80,
		/mob/living/simple_animal/aquatic/fish/yellow_tang = 50,
		)
	fishing_spot_richness = 20

/obj/landmark/fd/fishgen/swamp
	possible_fish_spawns = list(
		/mob/living/simple_animal/aquatic/fish/bass = 80,
		/mob/living/simple_animal/aquatic/fish/angelfish = 50,
		/mob/living/simple_animal/aquatic/fish/arctic_char = 80,
		/mob/living/simple_animal/aquatic/fish/greenchromis = 50,
		/mob/living/simple_animal/aquatic/fish/carp = 80,
		/mob/living/simple_animal/aquatic/fish/catfish = 80,
		/mob/living/simple_animal/aquatic/fish/cod = 50,
		/mob/living/simple_animal/aquatic/fish/eel = 50,
		/mob/living/simple_animal/aquatic/fish/flounder = 50,
		/mob/living/simple_animal/aquatic/fish/guppy = 20,
		/mob/living/simple_animal/aquatic/fish/minnow = 20,
		/mob/living/simple_animal/aquatic/fish/needlefish = 80,
		/mob/living/simple_animal/aquatic/fish/salmon = 50,
		/mob/living/simple_animal/aquatic/fish/sockeye = 50,
		/mob/living/simple_animal/aquatic/fish/trout = 50,
		/mob/living/simple_animal/aquatic/fish/tuna = 50,
		)
	fishing_spot_richness = 20

/obj/landmark/fd/fishgen/eldritch
	icon_state = "carp_dark"
	possible_fish_spawns = list(
		/mob/living/simple_animal/aquatic/fish/bass = 80,
		/mob/living/simple_animal/aquatic/fish/baby_carp = 20,
		/mob/living/simple_animal/aquatic/fish/bumpy = 20,
		/mob/living/simple_animal/aquatic/fish/carp = 80,
		/mob/living/simple_animal/aquatic/fish/catfish = 80,
		/mob/living/simple_animal/aquatic/fish/cod = 80,
		/mob/living/simple_animal/aquatic/fish/code_worm = 20,
		/mob/living/simple_animal/aquatic/fish/emulsijack = 20,
		/mob/living/simple_animal/aquatic/fish/eyefish = 20,
		/mob/living/simple_animal/aquatic/fish/goldenfish = 20,
		/mob/living/simple_animal/aquatic/fish/greenchromis = 80,
		/mob/living/simple_animal/aquatic/fish/jumpercable = 20,
		/mob/living/simple_animal/aquatic/fish/lanternfish = 20,
		/mob/living/simple_animal/aquatic/fish/lava_loop = 20,
		/mob/living/simple_animal/aquatic/fish/lavafish = 20,
		/mob/living/simple_animal/aquatic/fish/meat = 20,
		/mob/living/simple_animal/aquatic/fish/moltenfish = 20,
		/mob/living/simple_animal/aquatic/fish/plasma_loop = 20,
		/mob/living/simple_animal/aquatic/fish/salmon = 80,
		/mob/living/simple_animal/aquatic/fish/sand_surfer = 20,
		/mob/living/simple_animal/aquatic/fish/sun_fish = 20,
		/mob/living/simple_animal/aquatic/fish/three_eyes = 20,
		/mob/living/simple_animal/aquatic/fish/tiger_oscar = 20,
		/mob/living/simple_animal/aquatic/fish/trout = 80,
		/mob/living/simple_animal/aquatic/fish/tuna = 80,
		/mob/living/simple_animal/aquatic/fish/void_fish = 20,
		/mob/living/simple_animal/aquatic/fish/zipzap = 20
		)
	fishing_spot_richness = 5

/obj/landmark/fd/fishgen/eldritch/Initialize()
	. = ..()
	regenerate = FALSE

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

	fisherman.mob_fishing = FALSE
	fisherman.fishing_in = null
	fisherman = null

	fisherman_tool.busy_fishing = FALSE
	fisherman_tool = null

/atom/proc/do_fishing(obj/item/tool, mob/living/carbon/user)
	set waitfor = FALSE
	fishing_overlay = image(icon = 'mods/_fd/fd_assets/icons/goons/64x64.dmi', icon_state = "scream")
	fishing_overlay.pixel_x = -16
	fishing_overlay.pixel_y = -16
	fishing_overlay.alpha = 100

	AddOverlays(fishing_overlay)
	currently_fishing = TRUE

	user.mob_fishing = TRUE
	user.fishing_in = src
	fisherman = user

	fisherman_tool = tool
	fisherman_tool.busy_fishing = TRUE

	var/min_speed = fisherman_tool.min_fishing_duration
	var/max_speed = fisherman_tool.max_fishing_duration
	if(istype(fisherman_tool,/obj/item/fishing_rod))
		var/obj/item/fishing_rod/F = fisherman_tool
		if(F.reel)
			min_speed = clamp(min_speed - F.reel.speed_buff, 10 SECONDS, INFINITY)
			max_speed = clamp(max_speed - F.reel.speed_buff, min_speed + 10 SECONDS, INFINITY)

	addtimer(new Callback(src, PROC_REF(fishing_qte), user, fisherman_tool), rand(min_speed, max_speed))

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

	var/obj/structure/fd/makeshift_raft/raft = locate(/obj/structure/fd/makeshift_raft) in user.loc
	if(raft && raft.ship_captain == user)
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

	if(istype(fisherman_tool,/obj/item/fishing_rod))
		var/obj/item/fishing_rod/F = fisherman_tool
		if(F.lure && istype(F.lure,/obj/item/fd/fishing/lure/algae) && prob(50))
			var/list/strange_fish = list(
				/mob/living/simple_animal/aquatic/fish/baby_carp = 20,
				/mob/living/simple_animal/aquatic/fish/bumpy = 80,
				/mob/living/simple_animal/aquatic/fish/code_worm = 20,
				/mob/living/simple_animal/aquatic/fish/emulsijack = 80,
				/mob/living/simple_animal/aquatic/fish/eyefish = 20,
				/mob/living/simple_animal/aquatic/fish/goldenfish = 80,
				/mob/living/simple_animal/aquatic/fish/jumpercable = 20,
				/mob/living/simple_animal/aquatic/fish/lanternfish = 50,
				/mob/living/simple_animal/aquatic/fish/lava_loop = 50,
				/mob/living/simple_animal/aquatic/fish/lavafish = 80,
				/mob/living/simple_animal/aquatic/fish/meat = 50,
				/mob/living/simple_animal/aquatic/fish/moltenfish = 80,
				/mob/living/simple_animal/aquatic/fish/plasma_loop = 50,
				/mob/living/simple_animal/aquatic/fish/sand_surfer = 50,
				/mob/living/simple_animal/aquatic/fish/sun_fish = 80,
				/mob/living/simple_animal/aquatic/fish/three_eyes = 20,
				/mob/living/simple_animal/aquatic/fish/tiger_oscar = 50,
				/mob/living/simple_animal/aquatic/fish/void_fish = 20,
				/mob/living/simple_animal/aquatic/fish/zipzap = 80
			)
			new_fish_type = pickweight(strange_fish)

	prefish = new new_fish_type(src)

	prefish_icon = new /obj/screen/fish()
	prefish_icon.icon = prefish.icon
	prefish_icon.icon_state = prefish.icon_state
	prefish_icon.dir = WEST
	prefish_icon.connected_pool = src

	user.client.screen += prefish_icon

	var/qte_timing = fisherman_tool.fishing_timing
	if(istype(fisherman_tool,/obj/item/fishing_rod))
		var/obj/item/fishing_rod/F = fisherman_tool
		if(F.lure && istype(F.lure,/obj/item/fd/fishing/lure/buzz))
			qte_timing += 10 SECONDS

	addtimer(new Callback(src, PROC_REF(fail_qte), user, fisherman_tool), qte_timing)
	playsound(get_turf(src), 'packs/infinity/sound/effects/Splash_Small_01_mono.ogg', 100, TRUE)

	animate(prefish_icon, qte_timing/2, easing = SINE_EASING|EASE_OUT, transform = matrix().Update(scale_x = 2.5, scale_y = 2.5, rotation = 30))
	sleep(qte_timing/2)
	animate(prefish_icon, qte_timing/2, easing = SINE_EASING|EASE_IN, transform = matrix())

/atom/proc/fail_qte(mob/living/carbon/human/user, obj/item/tool)
	if(prefish)

		for(var/obj/screen/F in user.client.screen)
			if(istype(F, /obj/screen/fish))
				user.client.screen -= F

		if(istype(fisherman_tool,/obj/item/fishing_rod))
			var/obj/item/fishing_rod/F = fisherman_tool
			if(F.lure && istype(F.lure,/obj/item/fd/fishing/lure/led) && prob(50))
				catch_fish(user, fisherman_tool)
				return

		user.client.connected_fish = null

		qdel(prefish)
		qdel(prefish_icon)

		prefish = null
		prefish_icon = null

		var/min_speed = fisherman_tool.min_fishing_duration
		var/max_speed = fisherman_tool.max_fishing_duration
		if(istype(fisherman_tool,/obj/item/fishing_rod))
			var/obj/item/fishing_rod/F = fisherman_tool
			if(F.reel)
				min_speed = clamp(min_speed - F.reel.speed_buff, 10 SECONDS, INFINITY)
				max_speed = clamp(max_speed - F.reel.speed_buff, min_speed + 10 SECONDS, INFINITY)

		if(!has_fish)
			stop_fishing()
			return FALSE

		addtimer(new Callback(src, PROC_REF(fishing_qte), user, fisherman_tool), rand(min_speed, max_speed))

/atom/proc/catch_fish(mob/living/carbon/human/user, obj/item/tool)

	animate(prefish_icon, 5, easing = SINE_EASING|EASE_IN, transform = matrix(), alpha = 0)

	user.client.connected_fish = null
	prefish.kill_health()
	prefish.update_icon()

	var/obj/structure/fd/makeshift_raft/raft = locate(/obj/structure/fd/makeshift_raft) in user.loc

	if(raft)
		prefish.forceMove(get_turf(user))
		prefish.layer += 0.01
		prefish.glide_size = raft.glide_size

		prefish.do_water_overlay = FALSE
		prefish.toggle_water_overlay(FALSE)

		prefish.pass_flags |= PASS_FLAG_TABLE

		prefish.can_sunk = FALSE

		prefish.sunking = FALSE
		prefish.update_sunking(FALSE)

		raft.raft_storage += prefish
		playsound(get_turf(src), 'sound/effects/watersplash.ogg', 100, TRUE)

		if(istype(fisherman_tool,/obj/item/fishing_rod))
			var/obj/item/fishing_rod/F = fisherman_tool
			if(F.lure && istype(F.lure,/obj/item/fd/fishing/lure/lucky) && prob(50))
				var/new_fish_type = pickweight(connected_landmark.possible_fish_spawns)
				var/mob/living/additional_fish = new new_fish_type(get_turf(user))
				additional_fish.kill_health()
				additional_fish.update_icon()

				additional_fish.layer += 0.01
				additional_fish.glide_size = raft.glide_size

				additional_fish.do_water_overlay = FALSE
				additional_fish.toggle_water_overlay(FALSE)

				additional_fish.pass_flags |= PASS_FLAG_TABLE

				additional_fish.can_sunk = FALSE

				additional_fish.sunking = FALSE
				additional_fish.update_sunking(FALSE)

				raft.raft_storage += additional_fish
				playsound(get_turf(src), 'sound/effects/watersplash.ogg', 100, TRUE)

	else
		prefish.forceMove(get_turf(user))
		playsound(get_turf(src), 'sound/effects/watersplash.ogg', 100, TRUE)

		if(istype(fisherman_tool,/obj/item/fishing_rod))
			var/obj/item/fishing_rod/F = fisherman_tool
			if(F.lure && istype(F.lure,/obj/item/fd/fishing/lure/lucky) && prob(50))
				var/new_fish_type = pickweight(connected_landmark.possible_fish_spawns)
				var/mob/living/additional_fish = new new_fish_type(get_turf(user))

				additional_fish.kill_health()
				additional_fish.update_icon()
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

	var/min_speed = fisherman_tool.min_fishing_duration
	var/max_speed = fisherman_tool.max_fishing_duration
	if(istype(fisherman_tool,/obj/item/fishing_rod))
		var/obj/item/fishing_rod/F = fisherman_tool
		if(F.reel)
			min_speed = clamp(min_speed - F.reel.speed_buff, 10 SECONDS, INFINITY)
			max_speed = clamp(max_speed - F.reel.speed_buff, min_speed + 10 SECONDS, INFINITY)

	if(!has_fish)
		stop_fishing()
		return FALSE

	addtimer(new Callback(src, PROC_REF(fishing_qte), user, fisherman_tool), rand(min_speed, max_speed))

/client
	var/obj/screen/fish/connected_fish

/client/MouseMove(object, location, control, params)
	. = ..()

	if(connected_fish)
		var/list/coords = screen_loc2pixels(params)
		connected_fish.set_position(coords[1],coords[2])

		if(abs(connected_fish.x_off) < 10 && abs(connected_fish.y_off) < 10)
			connected_fish.connected_pool.catch_fish(connected_fish.connected_pool.fisherman, connected_fish.connected_pool.fisherman_tool)

/obj/screen/fish
	name = "РЫБА"
	desc = "ТАЩИ ЕЁ БЛЯТЬ!!!"

	plane = HUD_PLANE
	layer = 5.3

	mouse_opacity = 2
	screen_loc = "CENTER, CENTER"

	var/atom/connected_pool
	var/x_off
	var/y_off

/obj/screen/fish/Initialize()
	. = ..()
	set_position(rand(-200,200), rand(-200,200))

/obj/screen/fish/Click(location, control, params)
	. = ..()
	if(!usr.client.connected_fish)

		add_filter("lefish", 1, list("type" = "outline", "size" = 1, "color" = COLOR_GREEN))
		usr.client.connected_fish = src
		return TRUE
	else
		usr.client.connected_fish = null
		remove_filter("lefish")

/obj/screen/fish/proc/update_screen_loc()
	var/tile_size = world.icon_size
	var/tx = round(x_off / tile_size)
	var/px = x_off - tx * tile_size
	var/ty = round(y_off / tile_size)
	var/py = y_off - ty * tile_size
	screen_loc = "CENTER+[tx]:[px], CENTER+[ty]:[py]"

/// Set a new position and refresh
/obj/screen/fish/proc/set_position(px_off, py_off)
	x_off = px_off
	y_off = py_off
	update_screen_loc()

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

/mob/living/carbon/human/proc/raft_movement_check(turf/our_turf)
	var/list/turfs_to_check = list()
	switch(dir)
		if(NORTH)
			turfs_to_check = block(locate(our_turf.x, our_turf.y + raft.raft_y_positive, our_turf.z), locate((our_turf.x + raft.raft_x_positive) - 1, our_turf.y + raft.raft_y_positive, our_turf.z))
		if(SOUTH)
			turfs_to_check = block(locate(our_turf.x, our_turf.y - raft.raft_y_negative, our_turf.z), locate((our_turf.x + raft.raft_x_positive) - 1, our_turf.y - raft.raft_y_negative, our_turf.z))
		if(EAST)
			turfs_to_check = block(locate(our_turf.x + raft.raft_x_positive, our_turf.y, our_turf.z), locate(our_turf.x + raft.raft_x_positive, (our_turf.y + raft.raft_y_positive) - 1, our_turf.z))
		if(WEST)
			turfs_to_check = block(locate(our_turf.x - raft.raft_x_negative, our_turf.y, our_turf.z), locate(our_turf.x - raft.raft_x_negative, (our_turf.y + raft.raft_y_positive) - 1, our_turf.z))

	var/list/possible_blockers = list()
	var/list/roadblockers = list()
	for(var/turf/T in turfs_to_check)
		for(var/atom/blockers in T)
			possible_blockers += blockers
		if(T.density)
			possible_blockers += T

	for(var/atom/A in possible_blockers)
		if(A.density && (!(A in raft.raft_storage) && !istype(A,/obj/structure/platform) && !ismob(A)))
			roadblockers += A

	if(length(roadblockers))
		animation_flash_color(raft, COLOR_RED)
		raft.raft_health = clamp(raft.raft_health - 10, 0, 100)
		raft.check_integrity()
		return FALSE

	return TRUE

/mob/living/carbon/human/Move(a, b, flag)
	var/turf/old_location = get_turf(src)
	var/list/atom/connected_elements = list()
	if(raft)
		if(!raft.flying && !raft_movement_check(old_location))
			return FALSE

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
									/obj/structure/cable,
									/mob/observer,
									/mob/observer/ghost,
									/atom/movable/openspace/mimic)

	bound_height = 128
	bound_width = 128

	var/raft_x_positive = 4
	var/raft_y_positive = 4
	var/raft_x_negative = 1
	var/raft_y_negative = 1

	var/flying = FALSE

	pixel_x = 48
	pixel_y = 48

	do_water_overlay = FALSE
	glide_size = 0.9

	var/raft_health = 100

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

/obj/structure/fd/makeshift_raft/proc/check_integrity()
	if(raft_health <= 0)

		if(ship_captain)
			if(ship_captain.mob_fishing && ship_captain.fishing_in)
				ship_captain.fishing_in.stop_fishing()

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

		for(var/atom/movable/A in raft_storage)
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

		qdel(src)


/obj/structure/fd/makeshift_raft/attack_hand(mob/living/user)
	if(!ship_captain && ishuman(user))
		var/mob/living/carbon/human/H = user
		if(user.mob_fishing && user.fishing_in)
			user.fishing_in.stop_fishing()

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
		if(user.mob_fishing && user.fishing_in)
			user.fishing_in.stop_fishing()
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
	icon_state = "bass"
	icon_living = "bass"
	icon_dead = "bass"

/mob/living/simple_animal/aquatic/fish/trout
	icon = 'mods/_fd/fishing/icons/fish.dmi'
	icon_state = "trout"
	icon_living = "trout"
	icon_dead = "trout"

/mob/living/simple_animal/aquatic/fish/salmon
	icon = 'mods/_fd/fishing/icons/fish.dmi'
	icon_state = "salmon"
	icon_living = "salmon"
	icon_dead = "salmon"

/mob/living/simple_animal/aquatic/fish/carp
	icon = 'mods/_fd/fishing/icons/fish.dmi'
	icon_state = "carp"
	icon_living = "carp"
	icon_dead = "carp"

/mob/living/simple_animal/aquatic/fish/cod
	icon = 'mods/_fd/fishing/icons/fish.dmi'
	icon_state = "cod"
	icon_living = "cod"
	icon_dead = "cod"

/mob/living/simple_animal/aquatic/fish/tuna
	icon = 'mods/_fd/fishing/icons/fish.dmi'
	icon_state = "tuna"
	icon_living = "tuna"
	icon_dead = "tuna"

/mob/living/simple_animal/aquatic/fish/greenchromis
	icon = 'mods/_fd/fishing/icons/fish.dmi'
	icon_state = "greenchromis"
	icon_living = "greenchromis"
	icon_dead = "greenchromis"

/mob/living/simple_animal/aquatic/fish/catfish
	icon = 'mods/_fd/fishing/icons/fish.dmi'
	icon_state = "catfish"
	icon_living = "catfish"
	icon_dead = "catfish"

/mob/living/simple_animal/aquatic/fish/royal_gramma
	icon = 'mods/_fd/fishing/icons/fish.dmi'
	icon_state = "royal_gramma"
	icon_living = "royal_gramma"
	icon_dead = "royal_gramma"

/mob/living/simple_animal/aquatic/fish/bc_angel
	icon = 'mods/_fd/fishing/icons/fish.dmi'
	icon_state = "bc_angel"
	icon_living = "bc_angel"
	icon_dead = "bc_angel"

/mob/living/simple_animal/aquatic/fish/blue_tang
	icon = 'mods/_fd/fishing/icons/fish.dmi'
	icon_state = "blue_tang"
	icon_living = "blue_tang"
	icon_dead = "blue_tang"

/mob/living/simple_animal/aquatic/fish/firefish
	icon = 'mods/_fd/fishing/icons/fish.dmi'
	icon_state = "firefish"
	icon_living = "firefish"
	icon_dead = "firefish"

/mob/living/simple_animal/aquatic/fish/yellow_tang
	icon = 'mods/_fd/fishing/icons/fish.dmi'
	icon_state = "yellow_tang"
	icon_living = "yellow_tang"
	icon_dead = "yellow_tang"

/mob/living/simple_animal/aquatic/fish/mandarin_fish
	icon = 'mods/_fd/fishing/icons/fish.dmi'
	icon_state = "mandarin_fish"
	icon_living = "mandarin_fish"
	icon_dead = "mandarin_fish"

/mob/living/simple_animal/aquatic/fish/cardinalfish
	icon = 'mods/_fd/fishing/icons/fish.dmi'
	icon_state = "cardinalfish"
	icon_living = "cardinalfish"
	icon_dead = "cardinalfish"

/mob/living/simple_animal/aquatic/fish/clownfish
	icon = 'mods/_fd/fishing/icons/fish.dmi'
	icon_state = "clownfish"
	icon_living = "clownfish"
	icon_dead = "clownfish"

/mob/living/simple_animal/aquatic/fish/damselfish
	icon = 'mods/_fd/fishing/icons/fish.dmi'
	icon_state = "damselfish"
	icon_living = "damselfish"
	icon_dead = "damselfish"

/mob/living/simple_animal/aquatic/fish/sardine
	icon = 'mods/_fd/fishing/icons/fish.dmi'
	icon_state = "sardine"
	icon_living = "sardine"
	icon_dead = "sardine"

/mob/living/simple_animal/aquatic/fish/anchovy
	icon = 'mods/_fd/fishing/icons/fish.dmi'
	icon_state = "anchovy"
	icon_living = "anchovy"
	icon_dead = "anchovy"

/mob/living/simple_animal/aquatic/fish/plastetra
	icon = 'mods/_fd/fishing/icons/fish.dmi'
	icon_state = "plastetra"
	icon_living = "plastetra"
	icon_dead = "plastetra"

/mob/living/simple_animal/aquatic/fish/pufferfish
	icon = 'mods/_fd/fishing/icons/fish.dmi'
	icon_state = "pufferfish"
	icon_living = "pufferfish"
	icon_dead = "pufferfish"

/mob/living/simple_animal/aquatic/fish/goldfish
	icon = 'mods/_fd/fishing/icons/fish.dmi'
	icon_state = "goldfish"
	icon_living = "goldfish"
	icon_dead = "goldfish"

/mob/living/simple_animal/aquatic/fish/chub
	icon = 'mods/_fd/fishing/icons/fish.dmi'
	icon_state = "chub"
	icon_living = "chub"
	icon_dead = "chub"

/mob/living/simple_animal/aquatic/fish/herring
	icon = 'mods/_fd/fishing/icons/fish.dmi'
	icon_state = "herring"
	icon_living = "herring"
	icon_dead = "herring"

/mob/living/simple_animal/aquatic/fish/red_herring
	icon = 'mods/_fd/fishing/icons/fish.dmi'
	icon_state = "red_herring"
	icon_living = "red_herring"
	icon_dead = "red_herring"

/mob/living/simple_animal/aquatic/fish/betta
	icon = 'mods/_fd/fishing/icons/fish.dmi'
	icon_state = "betta"
	icon_living = "betta"
	icon_dead = "betta"

/mob/living/simple_animal/aquatic/fish/lionfish
	icon = 'mods/_fd/fishing/icons/fish.dmi'
	icon_state = "lionfish"
	icon_living = "lionfish"
	icon_dead = "lionfish"

/mob/living/simple_animal/aquatic/fish/dace
	icon = 'mods/_fd/fishing/icons/fish.dmi'
	icon_state = "dace"
	icon_living = "dace"
	icon_dead = "dace"

/mob/living/simple_animal/aquatic/fish/rosefin_shiner
	icon = 'mods/_fd/fishing/icons/fish.dmi'
	icon_state = "rosefin_shiner"
	icon_living = "rosefin_shiner"
	icon_dead = "rosefin_shiner"

/mob/living/simple_animal/aquatic/fish/mahimahi
	icon = 'mods/_fd/fishing/icons/fish.dmi'
	icon_state = "mahimahi"
	icon_living = "mahimahi"
	icon_dead = "mahimahi"

/mob/living/simple_animal/aquatic/fish/coelacanth
	icon = 'mods/_fd/fishing/icons/fish.dmi'
	icon_state = "coelacanth"
	icon_living = "coelacanth"
	icon_dead = "coelacanth"

/mob/living/simple_animal/aquatic/fish/dwarf_moonfish
	icon = 'mods/_fd/fishing/icons/fish.dmi'
	icon_state = "dwarf_moonfish"
	icon_living = "dwarf_moonfish"
	icon_dead = "dwarf_moonfish"

/mob/living/simple_animal/aquatic/fish/tizira_moonfish
	icon = 'mods/_fd/fishing/icons/fish.dmi'
	icon_state = "tizira_moonfish"
	icon_living = "tizira_moonfish"
	icon_dead = "tizira_moonfish"

/mob/living/simple_animal/aquatic/fish/stingray
	icon = 'mods/_fd/fishing/icons/fish.dmi'
	icon_state = "stingray"
	icon_living = "stingray"
	icon_dead = "stingray"

/mob/living/simple_animal/aquatic/fish/needlefish
	icon = 'mods/_fd/fishing/icons/fish.dmi'
	icon_state = "needlefish"
	icon_living = "needlefish"
	icon_dead = "needlefish"

/mob/living/simple_animal/aquatic/fish/angelfish
	icon = 'mods/_fd/fishing/icons/fish.dmi'
	icon_state = "angelfish"
	icon_living = "angelfish"
	icon_dead = "angelfish"

/mob/living/simple_animal/aquatic/fish/eel
	icon = 'mods/_fd/fishing/icons/fish.dmi'
	icon_state = "eel"
	icon_living = "eel"
	icon_dead = "eel"

/mob/living/simple_animal/aquatic/fish/minnow
	icon = 'mods/_fd/fishing/icons/fish.dmi'
	icon_state = "minnow"
	icon_living = "minnow"
	icon_dead = "minnow"

/mob/living/simple_animal/aquatic/fish/flounder
	icon = 'mods/_fd/fishing/icons/fish.dmi'
	icon_state = "flounder"
	icon_living = "flounder"
	icon_dead = "flounder"

/mob/living/simple_animal/aquatic/fish/guppy
	icon = 'mods/_fd/fishing/icons/fish.dmi'
	icon_state = "guppy"
	icon_living = "guppy"
	icon_dead = "guppy"

/mob/living/simple_animal/aquatic/fish/arctic_char
	icon = 'mods/_fd/fishing/icons/fish.dmi'
	icon_state = "arctic_char"
	icon_living = "arctic_char"
	icon_dead = "arctic_char"

/mob/living/simple_animal/aquatic/fish/sockeye
	icon = 'mods/_fd/fishing/icons/fish.dmi'
	icon_state = "sockeye"
	icon_living = "sockeye"
	icon_dead = "sockeye"

/mob/living/simple_animal/aquatic/fish/eyefish
	icon = 'mods/_fd/fishing/icons/fish.dmi'
	icon_state = "eyefish"
	icon_living = "eyefish"
	icon_dead = "eyefish"

/mob/living/simple_animal/aquatic/fish/void_fish
	icon = 'mods/_fd/fishing/icons/fish.dmi'
	icon_state = "void_fish"
	icon_living = "void_fish"
	icon_dead = "void_fish"

/mob/living/simple_animal/aquatic/fish/sun_fish
	icon = 'mods/_fd/fishing/icons/fish.dmi'
	icon_state = "sun_fish"
	icon_living = "sun_fish"
	icon_dead = "sun_fish"

/mob/living/simple_animal/aquatic/fish/meat
	icon = 'mods/_fd/fishing/icons/fish.dmi'
	icon_state = "meat"
	icon_living = "meat"
	icon_dead = "meat"

/mob/living/simple_animal/aquatic/fish/code_worm
	icon = 'mods/_fd/fishing/icons/fish.dmi'
	icon_state = "code_worm"
	icon_living = "code_worm"
	icon_dead = "code_worm"

/mob/living/simple_animal/aquatic/fish/tiger_oscar
	icon = 'mods/_fd/fishing/icons/fish.dmi'
	icon_state = "tiger_oscar"
	icon_living = "tiger_oscar"
	icon_dead = "tiger_oscar"

/mob/living/simple_animal/aquatic/fish/goldenfish
	icon = 'mods/_fd/fishing/icons/fish.dmi'
	icon_state = "goldenfish"
	icon_living = "goldenfish"
	icon_dead = "goldenfish"

/mob/living/simple_animal/aquatic/fish/lavafish
	icon = 'mods/_fd/fishing/icons/fish.dmi'
	icon_state = "lavafish"
	icon_living = "lavafish"
	icon_dead = "lavafish"

/mob/living/simple_animal/aquatic/fish/moltenfish
	icon = 'mods/_fd/fishing/icons/fish.dmi'
	icon_state = "moltenfish"
	icon_living = "moltenfish"
	icon_dead = "moltenfish"

/mob/living/simple_animal/aquatic/fish/lanternfish
	icon = 'mods/_fd/fishing/icons/fish.dmi'
	icon_state = "lanternfish"
	icon_living = "lanternfish"
	icon_dead = "lanternfish"

/mob/living/simple_animal/aquatic/fish/emulsijack
	icon = 'mods/_fd/fishing/icons/fish.dmi'
	icon_state = "emulsijack"
	icon_living = "emulsijack"
	icon_dead = "emulsijack"

/mob/living/simple_animal/aquatic/fish/lava_loop
	icon = 'mods/_fd/fishing/icons/fish.dmi'
	icon_state = "lava_loop"
	icon_living = "lava_loop"
	icon_dead = "lava_loop"

/mob/living/simple_animal/aquatic/fish/plasma_loop
	icon = 'mods/_fd/fishing/icons/fish.dmi'
	icon_state = "plasma_loop"
	icon_living = "plasma_loop"
	icon_dead = "plasma_loop"

/mob/living/simple_animal/aquatic/fish/zipzap
	icon = 'mods/_fd/fishing/icons/fish.dmi'
	icon_state = "zipzap"
	icon_living = "zipzap"
	icon_dead = "zipzap"

/mob/living/simple_animal/aquatic/fish/jumpercable
	icon = 'mods/_fd/fishing/icons/fish.dmi'
	icon_state = "jumpercable"
	icon_living = "jumpercable"
	icon_dead = "jumpercable"

/mob/living/simple_animal/aquatic/fish/bumpy
	icon = 'mods/_fd/fishing/icons/fish.dmi'
	icon_state = "bumpy"
	icon_living = "bumpy"
	icon_dead = "bumpy"

/mob/living/simple_animal/aquatic/fish/sand_surfer
	icon = 'mods/_fd/fishing/icons/fish.dmi'
	icon_state = "sand_surfer"
	icon_living = "sand_surfer"
	icon_dead = "sand_surfer"

/mob/living/simple_animal/aquatic/fish/three_eyes
	icon = 'mods/_fd/fishing/icons/fish.dmi'
	icon_state = "three_eyes"
	icon_living = "three_eyes"
	icon_dead = "three_eyes"

/mob/living/simple_animal/aquatic/fish/baby_carp
	icon = 'mods/_fd/fishing/icons/fish.dmi'
	icon_state = "baby_carp"
	icon_living = "baby_carp"
	icon_dead = "baby_carp"
