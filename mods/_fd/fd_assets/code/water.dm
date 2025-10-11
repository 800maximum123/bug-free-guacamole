/obj/fd_water
	name = "water"
	desc = "Shrimple as that."

	icon = 'mods/_fd/fd_assets/icons/water.dmi'
	icon_state = "water2"
	alpha = 100

	anchored = TRUE

	var/reagent_type = /datum/reagent/water

	//var/watermask_type = /obj/fd_water/down // ~~это уёбищно, это отвратительно, но во времена когда аватар куб спит - это лучшее, что я смог придумать~~
	// Аватар данилкус проснулся, теперь всё хорошо

	layer = 2.22

/obj/fd_water/Initialize()
	. = ..()

/obj/fd_water/Destroy()
	. = ..()

/obj/fd_water/use_tool(obj/item/O, mob/living/user, list/click_params)
	var/obj/item/reagent_containers/RG = O
	if (reagent_type && istype(RG) && RG.is_open_container() && RG.reagents)
		RG.reagents.add_reagent(reagent_type, min(RG.volume - RG.reagents.total_volume, RG.amount_per_transfer_from_this))
		user.visible_message(SPAN_NOTICE("[user] fills \the [RG] from \the [src]."),SPAN_NOTICE("You fill \the [RG] from \the [src]."))
		return TRUE

	. = ..()

/obj/fd_water/Crossed(atom/movable/A)
	// нам похуй на тайпкастинг, потому что прок теперь может быть исполнен на любом атоме
	A.toggle_water_overlay(src)

	if(isliving(A))
		var/random_watersound = pick('sound/effects/footstep/water1.ogg', 'sound/effects/footstep/water2.ogg', 'sound/effects/footstep/water3.ogg', 'sound/effects/footstep/water4.ogg')
		playsound(get_turf(src), random_watersound, 40)

/obj/fd_water/Uncrossed(atom/movable/A)
	. = ..()
	A.toggle_water_overlay(FALSE)

/obj/fd_water/deep
	water_overlay_height = 23

/obj/fd_water/alt_ver1
	icon_state = "water3"
	alpha = 70

/obj/fd_water/alt_ver2
	icon_state = "water4"
	alpha = 70

/atom
	var/water_overlay_height = 12

/atom/movable
	var/image/water_overlay
	var/do_water_overlay = FALSE

/atom/movable/proc/toggle_water_overlay(atom/source)
	if(source)
		if(do_water_overlay)
			appearance_flags |= KEEP_TOGETHER

			water_overlay = image(source.icon, src, source.icon_state)

			water_overlay.appearance_flags |= KEEP_TOGETHER
			water_overlay.blend_mode = BLEND_INSET_OVERLAY
			water_overlay.alpha = source.alpha
			water_overlay.color = source.color

			water_overlay.pixel_y = source.water_overlay_height - 32
			water_overlay.add_filter("alpha_mask", 1, list("type" = "alpha", "icon" = icon('icons/turf/space.dmi', "black")))

			AddOverlays(water_overlay)
	else
		CutOverlays(water_overlay)

/mob/living
	do_water_overlay = TRUE

/obj
	do_water_overlay = TRUE
