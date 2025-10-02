/mob/living/proc/update_water_overlay()
	if(!get_filter("underwater"))
		add_filter("underwater", 1, list("type" = "alpha", "icon" = icon('mods/_fd/fd_assets/icons/watermask.dmi', "watermask")))
	else
		remove_filter("underwater")

/obj/fd_water
	name = "water"
	desc = "Shrimple as that."

	icon = 'mods/_fd/fd_assets/icons/water.dmi'
	icon_state = "water2"
	alpha = 100
	var/reagent_type = /datum/reagent/water

	var/watermask_type = /obj/fd_water/down // это уёбищно, это отвратительно, но во времена когда аватар куб спит - это лучшее, что я смог придумать
	var/var/obj/fd_water/down/watermask_connected

	var/top_part = TRUE

	layer = 2.22

/obj/fd_water/Initialize()
	. = ..()
	if(top_part)
		icon_state = "[initial(icon_state)]_top"
		watermask_connected = new watermask_type(get_turf(src))

/obj/fd_water/Destroy()
	qdel(watermask_connected)
	. = ..()

/obj/fd_water/use_tool(obj/item/O, mob/living/user, list/click_params)
	var/obj/item/reagent_containers/RG = O
	if (reagent_type && istype(RG) && RG.is_open_container() && RG.reagents)
		RG.reagents.add_reagent(reagent_type, min(RG.volume - RG.reagents.total_volume, RG.amount_per_transfer_from_this))
		user.visible_message(SPAN_NOTICE("[user] fills \the [RG] from \the [src]."),SPAN_NOTICE("You fill \the [RG] from \the [src]."))
		return TRUE

	. = ..()

/obj/fd_water/down // Вот этой вот залупой мы будем манипулировать чтобы создавать ВИДИМОСТЬ
	top_part = FALSE
	icon_state = "water2_down"

	var/var/obj/fd_water/connected_to

/obj/fd_water/down/Initialize()
	. = ..()
	for(var/obj/fd_water/W in get_turf(src))
		if(W.top_part)
			connected_to = W

/obj/fd_water/down/Destroy()
	qdel(connected_to)
	. = ..()

/obj/fd_water/down/Crossed(atom/movable/O)
	if(isobserver(O) || isghost(O))
		return

	var/random_watersound = pick('sound/effects/footstep/water1.ogg', 'sound/effects/footstep/water2.ogg', 'sound/effects/footstep/water3.ogg', 'sound/effects/footstep/water4.ogg')
	playsound(get_turf(src), random_watersound, 20)

	layer = 4.2

/obj/fd_water/down/Uncrossed()
	layer = initial(layer)

/obj/fd_water/alt_ver1
	icon_state = "water3"
	alpha = 70

	watermask_type = /obj/fd_water/down/alt_ver1

/obj/fd_water/down/alt_ver1
	icon_state = "water3_down"
	top_part = FALSE
	alpha = 70

/obj/fd_water/alt_ver2
	icon_state = "water4"
	alpha = 70

	watermask_type = /obj/fd_water/down/alt_ver2

/obj/fd_water/down/alt_ver2
	icon_state = "water4_down"
	top_part = FALSE
	alpha = 70

////////////////////////
