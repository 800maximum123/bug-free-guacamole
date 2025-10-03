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
	A.toggle_water_overlay(TRUE)

	if(isliving(A))
		var/random_watersound = pick('sound/effects/footstep/water1.ogg', 'sound/effects/footstep/water2.ogg', 'sound/effects/footstep/water3.ogg', 'sound/effects/footstep/water4.ogg')
		playsound(get_turf(src), random_watersound, 40)

/obj/fd_water/Uncrossed(atom/movable/A)
	. = ..()
	A.toggle_water_overlay(FALSE)

/obj/fd_water/alt_ver1
	icon_state = "water3"
	alpha = 70

/obj/fd_water/alt_ver2
	icon_state = "water4"
	alpha = 70

/atom/movable
	var/image/water_overlay
	var/do_submerge_overlay = FALSE

/atom/movable/proc/toggle_water_overlay(state)
	if(state)
		if(do_submerge_overlay)
			appearance_flags |= KEEP_TOGETHER
			add_filter("underwater", 1, list("type" = "alpha", "icon" = icon('mods/_fd/fd_assets/icons/watermask.dmi', "watermask"), "flags" = MASK_INVERSE))
	else
		remove_filter("underwater")

/mob/living
	do_submerge_overlay = TRUE

/obj
	do_submerge_overlay = TRUE
