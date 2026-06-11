/obj/machinery/cryopod/big
	icon = 'mods/_fd/fd_assets/icons/machinery/hypersleep.dmi'
	icon_state = "hypersleep_base"
	base_icon_state = "hypersleep_base"
	occupied_icon_state = "hypersleep_base"

	desc = "A man-sized pod for entering suspended animation."
	name = "LTS-23"

	dir = EAST
	density = TRUE
	anchored = TRUE
	time_till_despawn = -1 // Disable auto-despawn to prevent disappearance
	announce_despawn = FALSE
	applies_stasis = FALSE // Optional: no stasis if not needed

	var/image/occupant_image
	var/occupant_angle = 270
	var/occupant_dir = 4 // EAST
	var/occupant_x = 6
	var/occupant_y = 0

/obj/machinery/cryopod/big/Initialize(mapload)
	. = ..()
	update_icon()

/obj/machinery/cryopod/big/update_icon()
	overlays.Cut()
	icon_state = occupant ? occupied_icon_state : base_icon_state

	if(occupant)
		occupant_image = image(occupant.appearance, loc = src, layer = 3.21)
		occupant_image.pixel_x = occupant_x
		occupant_image.pixel_y = occupant_y
		occupant_image.dir = occupant_dir
		if(!occupant.lying)
			var/matrix/M = matrix()
			M.Turn(occupant_angle)
			occupant_image.transform = M
		overlays += occupant_image
		var/image/cover_image = image(icon, icon_state = "cover", layer = 3.22)
		overlays += cover_image
	else
		occupant_image = null
		var/image/cover_image = image(icon, icon_state = "cover_fog", layer = 3.22)
		overlays += cover_image

	return ..()

/obj/machinery/cryopod/big/set_occupant(mob/living/carbon/occupant)
	src.occupant = occupant
	update_icon()
	return ..()

/obj/machinery/cryopod/big/eject()
	. = ..()
	update_icon()

/obj/machinery/cryopod/big/despawn_occupant()
	..()
	update_icon()

/obj/machinery/cryopod/big/flipped
	dir = WEST
	occupant_angle = 90
	occupant_dir = 8
	occupant_x = 10
