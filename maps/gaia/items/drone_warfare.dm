/image/friendlies_spot

/mob/living/carbon/human
	var/operating_drone = FALSE
	var/list/revealed_friendlies = list()

/mob/living/carbon/human/proc/show_friendlies(atom/A)
	if(!client || (A in revealed_friendlies))
		return

	var/image/friendlies_spot/new_spot = new /image/friendlies_spot(A.icon, A, A.icon_state, layer = HUD_PLANE)
	new_spot.CopyOverlays(A, TRUE)
	new_spot.icon = null
	new_spot.alpha = 255
	new_spot.dir = SOUTH
	new_spot.maptext_height = 16
	new_spot.maptext_width = 96
	new_spot.maptext_x = 4
	new_spot.maptext_y = 2
	new_spot.maptext = STYLE_SMALLFONTS_OUTLINE("[A.name]", 7, COLOR_WHITE, COLOR_BLACK)

	new_spot.plane = HUD_PLANE

	var/matrix/M = matrix()
	M.Scale(3)

	new_spot.transform = M

	client.images += new_spot
	revealed_friendlies[A] = new_spot

/mob/living/carbon/human/proc/hide_friendlies(atom/A)
	if(!client || !(A in revealed_friendlies))
		return

	var/image/friendlies_spot/the_spot = revealed_friendlies[A]
	if(client)
		client.images -= the_spot
	revealed_friendlies -= A

/mob/living/carbon/human/Life()
	. = ..()

	if(operating_drone)
		update_dead_sight()

/obj/structure/gaia/controlled_drone
	mouse_opacity = FALSE
	layer = 4.11

	icon = 'mods/_fd/fd_assets/icons/structures/holopad.dmi'
	icon_state = "holopad1"

/obj/item/gaia/controller
	var/obj/structure/gaia/controlled_drone/drone
	var/mob/living/carbon/human/drone_operator
	icon = 'mods/_fd/fd_assets/icons/obj/items/device_eris.dmi'
	icon_state = "forensic1"

	w_class = ITEM_SIZE_SMALL

/obj/item/gaia/controller/Initialize()
	. = ..()

	drone = new /obj/structure/gaia/controlled_drone(src)

/obj/item/gaia/controller/proc/check_for_op(mob/living/carbon/user)

	if(!drone_operator && user)
		drone_operator = user
		drone_operator.operating_drone = TRUE

		drone_operator.client.adminobs = TRUE
		drone_operator.reset_view(drone)

		drone_operator.client.view = 30
		drone_operator.overlay_fullscreen("tacmap", /obj/screen/fullscreen/fd/blackout/alt)

		for(var/mob/living/carbon/human/H in view(drone_operator.client))
			if(H.faction != MOB_FACTION_ICCG) // if you want to, you can replace this define with simple drone_operator.faction, cause currently it will show ICCGN position whatever operator faction is(SCG can take the device and see where every indie currently is)
				continue
			drone_operator.show_friendlies(H)
		return TRUE

	if(drone_operator)
		for(var/mob/living/carbon/human/H in view(drone_operator.client))
			drone_operator.hide_friendlies(H)

		drone_operator.client.adminobs = null

		drone_operator.reset_view()
		drone_operator.client.view = 7
		drone_operator.clear_fullscreen("tacmap")

		drone_operator.operating_drone = FALSE
		return TRUE

/obj/item/gaia/controller/dropped(mob/user)
	..()

	if(!(drone in contents))
		check_for_op()

/obj/item/gaia/controller/attack_self(mob/living/carbon/user)
	. = ..()

	if(!(drone in contents))
		check_for_op(user)

/obj/item/gaia/controller/AltClick(mob/living/carbon/human/user)
	. = ..()
	if(drone in contents)
		drone.forceMove(get_turf(user))
		animate(drone, pixel_y = 96, alpha = 0, transform = matrix(3, MATRIX_SCALE), time = 1 SECONDS, easing = SINE_EASING | EASE_OUT)
		check_for_op(user)
		return TRUE

	if(!(drone in contents))
		check_for_op()
		drone.forceMove(get_turf(user))
		animate(drone, pixel_y = 0, alpha = 255, transform = matrix(1, MATRIX_SCALE), time = 1 SECONDS, easing = SINE_EASING | EASE_IN)
		sleep(1 SECONDS)
		drone.forceMove(src)
		return TRUE
