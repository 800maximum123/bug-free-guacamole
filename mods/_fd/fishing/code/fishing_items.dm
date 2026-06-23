/obj/item
	var/can_fish = FALSE
	var/fishing_range = 1
	var/min_fishing_duration = 1 MINUTES
	var/max_fishing_duration = 2 MINUTES
	var/fishing_timing = 4 SECONDS
	var/last_use_fishing

	var/busy_fishing = FALSE

/obj/item/attack_self(mob/user)
	. = ..()
	last_use_fishing = world.time

/obj/item/material/twohanded/spear
	can_fish = TRUE
	fishing_range = 0
	fishing_timing = 2 SECONDS

/turf/simulated/floor/exoplanet/fd/desertsand/use_tool(obj/item/C, mob/living/user, list/click_params)
	if(istype(C,/obj/item/shovel/spade))

		for(var/i=1,i<=5,i++)
			if(!do_after(user, 1 SECONDS, user, DO_PUBLIC_UNIQUE))
				break

			if(prob(30))
				new /obj/item/fd/fishing/worm(src)
			else
				new /obj/item/ore/glass(src)

			sleep(0.5 SECONDS)

		return TRUE

	. = ..()

/obj/item/fd/fishing/worm_can
	icon = 'mods/_fd/fd_assets/icons/tg/fishing.dmi'
	icon_state = "bait_can_empty"

	w_class = ITEM_SIZE_SMALL
	name = "worm can"
	desc = "It's empty"

	var/list/obj/item/fd/fishing/worm/worms = list()
	var/maximum_capacity = 10

	maptext_height = 16
	maptext_width = 96
	maptext_x = 4
	maptext_y = 2

	can_sunk = FALSE
	var/fishgen = /obj/landmark/fd/fishgen/ocean

/obj/item/fd/fishing/worm_can/Initialize()
	. = ..()
	START_PROCESSING(SSobj,src)

/obj/item/fd/fishing/worm_can/Process()
	if(length(worms))
		var/obj/fd_water/water = locate(/obj/fd_water) in loc
		if(water && !(locate(/obj/structure/fd/makeshift_raft) in loc))
			if(!water.has_fish)
				var/obj/item/fd/fishing/worm/random_worm = pick(worms)
				worms -= random_worm
				qdel(random_worm)

				update_can_sprite()

				if(prob(10) && (fishgen in water.acceptable_fishgens))
					new fishgen(get_turf(water))

/obj/item/fd/fishing/worm_can/MouseEntered(location, control, params)
	. = ..()

	var/mob/living/L = usr
	if(loc == L)
		maptext = STYLE_SMALLFONTS_OUTLINE("[length(worms)]/[maximum_capacity]", 7, COLOR_WHITE, COLOR_BLACK)

/obj/item/fd/fishing/worm_can/MouseExited(location, control, params)
	. = ..()

	if(maptext)
		maptext = ""

/obj/item/fd/fishing/worm_can/use_tool(obj/item/item, mob/living/user, list/click_params)
	if(istype(item,/obj/item/fd/fishing/worm) && length(worms) < maximum_capacity)
		user.drop_from_inventory(item)
		item.forceMove(src)
		worms += item
		update_can_sprite()
		return TRUE

	. = ..()

/obj/item/fd/fishing/worm_can/attack_hand(mob/user)

	if(length(worms) && loc == user)
		var/obj/item/fd/fishing/worm/random_worm = pick(worms)
		worms -= random_worm
		update_can_sprite()

		user.put_in_active_hand(random_worm)
		return TRUE

	. = ..()

/obj/item/fd/fishing/worm_can/proc/update_can_sprite()
	if(!length(worms))
		icon_state = "bait_can_empty"
	if(length(worms) >= maximum_capacity)
		icon_state = "bait_can"
	else
		icon_state = "bait_can_open"

/obj/item/fd/fishing/worm
	icon = 'mods/_fd/fd_assets/icons/tg/fishing.dmi'
	icon_state = "worm"

	w_class = ITEM_SIZE_TINY
	name = "worm"
	desc = "Will you love me even if..."

	can_sunk = FALSE
	var/fishgen = /obj/landmark/fd/fishgen/ocean

/obj/item/fd/fishing/worm/Initialize()
	. = ..()
	START_PROCESSING(SSobj,src)

/obj/item/fd/fishing/worm/Process()
	var/obj/fd_water/water = locate(/obj/fd_water) in loc
	if(water && !(locate(/obj/structure/fd/makeshift_raft) in loc))
		if(!water.has_fish)
			if(prob(10) && (fishgen in water.acceptable_fishgens))
				new fishgen(get_turf(water))

			qdel(src)

/obj/item/fd/fishing/lure
	icon = 'mods/_fd/fd_assets/icons/tg/fishing.dmi'
	icon_state = "buzzbait"

	w_class = ITEM_SIZE_SMALL
	name = "lure"
	desc = "Fishing lure"

/obj/item/fd/fishing/lure/buzz // увеличивает окно QTE

/obj/item/fd/fishing/lure/lucky // даёт шанс получить две рыбы с одного QTE
	icon = 'mods/_fd/fd_assets/icons/tg/fishing.dmi'
	icon_state = "lucky_coin"

/obj/item/fd/fishing/lure/led // даёт шанс получить рыбу даже при провале QTE
	icon = 'mods/_fd/fd_assets/icons/tg/fishing.dmi'
	icon_state = "led"

/obj/item/fd/fishing/reel
	icon = 'mods/_fd/fd_assets/icons/tg/fishing.dmi'
	icon_state = "reel_white"

	w_class = ITEM_SIZE_SMALL
	name = "reel"
	desc = "Fishing reel"
	var/speed_buff = 20 SECONDS

/obj/structre/fd/float
	icon = 'mods/_fd/fd_assets/icons/tg/fishing.dmi'
	icon_state = "float"

	mouse_opacity = FALSE

/obj/structre/fd/float/Initialize()
	. = ..()
	START_PROCESSING(SSobj,src)

/obj/structre/fd/float/Process()
	animate(src, pixel_x = pixel_x, pixel_y = pixel_y - 1, time = 0.5, easing = EASE_IN)
	animate(pixel_x = pixel_x, pixel_y = pixel_y + 1, time = 1)
	animate(pixel_x = pixel_x, pixel_y = pixel_y, time = 0.3, easing = EASE_OUT)

/obj/item/fishing_rod
	icon_state = "pole_inhand"
	icon = 'mods/_fd/fishing/icons/fishing_rod.dmi'
	item_icons = list(
		slot_r_hand_str = 'mods/_fd/fishing/icons/fishing_rod_inhand.dmi',
		slot_l_hand_str = 'mods/_fd/fishing/icons/fishing_rod_inhand.dmi'
		)
	item_state = "pole_inhand"
	name = "fishing rod"
	desc = "Gone fishing."
	slot_flags = SLOT_BACK
	w_class = ITEM_SIZE_LARGE

	can_fish = TRUE
	fishing_range = 5
	min_fishing_duration = 30 SECONDS
	max_fishing_duration = 90 SECONDS
	fishing_timing = 6 SECONDS

	var/obj/structre/fd/float/float
	var/float_reel
	var/last_loc

	var/obj/item/fd/fishing/lure/lure
	var/obj/item/fd/fishing/reel/reel

/obj/item/fishing_rod/Initialize()
	. = ..()

	float = new /obj/structre/fd/float()
	START_PROCESSING(SSobj,src)

/obj/item/fishing_rod/Process()
	if(float_reel && last_loc != loc)
		qdel(float_reel)
		last_loc = loc
		float_reel = loc.Beam(float, "1-full", icon = 'mods/_fd/old_space_cannons/icons/beam.dmi', maxdistance = world.maxx)

	var/mob/living/carbon/human/H = loc

	if(!H)
		H = locate(/mob/living/carbon/human) in get_turf(src)

	if(H)
		if(H.mob_fishing && float.loc == src)
			last_loc = loc
			float.forceMove(get_turf(H.fishing_in))
			float_reel = loc.Beam(float, "1-full", icon = 'mods/_fd/old_space_cannons/icons/beam.dmi', maxdistance = world.maxx)

		if(!H.mob_fishing && float.loc != src)
			qdel(float_reel)
			float_reel = null
			last_loc = null
			float.forceMove(src)

/obj/item/fishing_rod/use_tool(obj/item/item, mob/living/user, list/click_params)
	. = ..()

	if(!busy_fishing)

		if(isScrewdriver(item))
			if(reel)
				if(do_after(user, 1 SECONDS, user, DO_PUBLIC_UNIQUE))
					reel.forceMove(get_turf(src))
					reel = null
			if(lure)
				if(do_after(user, 1 SECONDS, user, DO_PUBLIC_UNIQUE))
					lure.forceMove(get_turf(src))
					lure = null
			return

		if(istype(item,/obj/item/fd/fishing/reel) && !reel)
			if(do_after(user, 1 SECONDS, user, DO_PUBLIC_UNIQUE))
				user.drop_from_inventory(item)
				item.forceMove(src)
				reel = item
			return

		if(istype(item,/obj/item/fd/fishing/lure) && !lure)
			if(do_after(user, 1 SECONDS, user, DO_PUBLIC_UNIQUE))
				user.drop_from_inventory(item)
				item.forceMove(src)
				lure = item
			return
