/obj/structure/bed/hammock
	name = "hammock"
	desc = "A rope bed, hanging from the ceiling."
	material = MATERIAL_ROPE
	icon = 'mods/_fd/fd_assets/icons/obj/bed_chair.dmi'
	icon_state = "hammockf"
	base_icon = "hammockf"

/obj/structure/bed/hammock/update_icon()
	return

/obj/structure/bed/hammock/buckle_mob(mob/living/M)
	if (M)
		icon_state = "hammockf_static"
		if (pixel_y == 0)
			pixel_y = 1
		else if (pixel_y == 1)
			pixel_y = 0
		else if (pixel_y == 0)
			pixel_y = -1
		else // somehow
			pixel_y = 0
		M.pixel_y = pixel_y
	. = ..()

/obj/structure/bed/hammock/unbuckle_mob()
	icon_state = "hammockf"
	. = ..()
