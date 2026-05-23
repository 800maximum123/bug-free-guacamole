/obj/structure/flora
	var/react_to_movement = FALSE
	var/do_the_sound = FALSE

	var/rand_steps = FALSE
	var/lower_steps = 1
	var/top_steps = 4

	var/multiple_steps
	var/multiple_icons = FALSE
	var/base_icon_name = "bleh"

	var/has_drop = FALSE
	var/regrowth_after_harvesting = FALSE
	var/regrowing = FALSE
	var/obj/item/item_to_drop = null

	var/list/allowed_harvest_tools = list(/obj/item/material/hatchet,
										/obj/item/material/hatchet/unbreakable,
										/obj/item/material/hatchet/machete,
										/obj/item/material/hatchet/machete/deluxe,
										/obj/item/material/hatchet/machete/facility,
										/obj/item/material/hatchet/machete/mech,
										/obj/item/material/hatchet/machete/plasteel,
										/obj/item/material/hatchet/machete/steel,
										/obj/item/material/hatchet/machete/uranium,
										/obj/item/material/hatchet/machete/unbreakable,
										/obj/item/material/twohanded/fireaxe,
										/obj/item/material/scythe)

/obj/structure/flora/Initialize()
	. = ..()
	if(multiple_icons && rand_steps)
		multiple_steps = rand(lower_steps,top_steps)

		icon_state = "[base_icon_name]_[multiple_steps]"

/obj/structure/flora/proc/regrowth()
	animate(src, transform = matrix(1, MATRIX_SCALE), time = 0.5 SECONDS, easing = BOUNCE_EASING|EASE_OUT)
	mouse_opacity = 1

	regrowing = FALSE

/obj/structure/flora/use_weapon(obj/item/weapon, mob/living/user, list/click_params)
	. = ..()

	if(multiple_steps > 0 && !regrowing)
		if(weapon.type in allowed_harvest_tools)
			user.cool_attack_on(src)
			multiple_steps -= 1

			animate(src, pixel_x = pixel_x - 1, pixel_y = pixel_y, time = 0.5, easing = EASE_IN)
			animate(pixel_x = pixel_x + 1, pixel_y = pixel_y, time = 1)
			animate(pixel_x = pixel_x, pixel_y = pixel_y, time = 0.3, easing = EASE_OUT)

			if(multiple_icons)
				icon_state = "[base_icon_name]_[multiple_steps]"

			if(multiple_steps <= 0)
				if(has_drop)
					new item_to_drop(get_turf(src))

				if(regrowth_after_harvesting)
					var/obj/structure/flora/F = new type(get_turf(src))
					F.SetTransform(0.01)
					F.mouse_opacity = 0
					F.regrowing = TRUE
					addtimer(new Callback(F, TYPE_PROC_REF(/obj/structure/flora, regrowth)), 5 MINUTE)
				qdel(src)

/obj/structure/flora/Crossed(mob/living/M)
	. = ..()

	if(react_to_movement && isliving(M) && !regrowing)
		if(MOVING_QUICKLY(M) && do_the_sound && ishuman(M))
			balloon_alert_to_viewers("|ШОРХ!|", null, COLOR_WHITE)

		animate(src, pixel_x = pixel_x - 1, pixel_y = pixel_y, time = 0.5, easing = EASE_IN)
		animate(pixel_x = pixel_x + 1, pixel_y = pixel_y, time = 1)
		animate(pixel_x = pixel_x, pixel_y = pixel_y, time = 0.3, easing = EASE_OUT)

/obj/structure/flora/tree

	multiple_steps = 10
	has_drop = TRUE
	item_to_drop = /obj/item/stack/material/wood/ten

/obj/structure/vines
	var/react_to_movement = TRUE
	var/do_the_sound = TRUE

/obj/structure/vines/Crossed(mob/living/M)
	. = ..()

	if(react_to_movement && isliving(M))
		if(MOVING_QUICKLY(M) && do_the_sound)
			balloon_alert_to_viewers("|ШОРХ!|", null, COLOR_WHITE)

		animate(src, pixel_x = pixel_x - 1, pixel_y = pixel_y, time = 0.5, easing = EASE_IN)
		animate(pixel_x = pixel_x + 1, pixel_y = pixel_y, time = 1)
		animate(pixel_x = pixel_x, pixel_y = pixel_y, time = 0.3, easing = EASE_OUT)

/obj/structure/flora/jungle/bush
	react_to_movement = TRUE
	do_the_sound = TRUE

/obj/structure/flora/ausbushes
	react_to_movement = TRUE

/obj/structure/flora/seaweed
	react_to_movement = TRUE

/obj/structure/flora/seaweed/fd
	icon = 'mods/_fd/fd_assets/icons/goons/sealab_objects.dmi'
	icon_state = "kelp"

/obj/structure/flora/tall
	name = "plant"
	icon = 'mods/_fd/fd_assets/icons/vampires/flora32x48.dmi'
	icon_state = "tallgrass_4"
	layer = 4.07
	anchored = TRUE

	rand_steps = TRUE

	react_to_movement = TRUE
	do_the_sound = TRUE

	multiple_icons = TRUE
	base_icon_name = "tallgrass"

/obj/structure/flora/tall/second
	icon_state = "drytallgrass_4"
	base_icon_name = "drytallgrass"

/obj/structure/flora/tall/third
	icon_state = "redplant_4"
	base_icon_name = "redplant"

	regrowth_after_harvesting = TRUE
	rand_steps = FALSE

	multiple_steps = 4
	has_drop = TRUE
	item_to_drop = /obj/item/reagent_containers/food/snacks/fd_crops/tastycactus

/obj/structure/flora/tall/fourth
	icon_state = "grass_4"
	base_icon_name = "grass"

	regrowth_after_harvesting = TRUE
	rand_steps = FALSE

	multiple_steps = 4
	has_drop = TRUE
	item_to_drop = /obj/item/reagent_containers/food/snacks/fd_crops/corn

/obj/structure/flora/trk17_simple
	anchored = TRUE

	name = "plant"
	react_to_movement = TRUE
	icon = 'mods/_fd/fd_assets/icons/vampires/flowers.dmi'
	icon_state = "velvet_turtleback"

/obj/structure/flora/trk17_simple/alt
	icon_state = "wooly_bluestar"

/obj/structure/flora/trk17_regrowing
	name = "plant"
	icon = 'mods/_fd/fd_assets/icons/vampires/flowers.dmi'
	icon_state = "marigold"
	regrowth_after_harvesting = TRUE

	anchored = TRUE

	react_to_movement = TRUE

	multiple_steps = 1
	has_drop = TRUE
	item_to_drop = null

/obj/structure/flora/trk17_regrowing/cucumber
	icon_state = "evening_primrose"
	item_to_drop = /obj/item/reagent_containers/food/snacks/fd_crops/saltygreen

/obj/structure/flora/trk17_regrowing/sugar
	icon_state = "yerba_mansa"
	item_to_drop = /obj/item/reagent_containers/food/snacks/fd_crops/sugarcrop

/obj/structure/flora/trk17_regrowing/ice_tricord
	icon_state = "prairie_flax"
	item_to_drop = /obj/item/reagent_containers/food/snacks/fd_crops/coldcrop

/obj/structure/flora/trk17_regrowing/hot_dylov
	icon_state = "indian_paintbrush"
	item_to_drop = /obj/item/reagent_containers/food/snacks/fd_crops/firecrop

/obj/structure/flora/trk17_regrowing/coffee
	item_to_drop = /obj/item/reagent_containers/food/snacks/fd_crops/coffecrop
