/mob
	var/zoomed = FALSE

/mob/proc/do_zoom(dx, dy)
	var/do_normal_zoom = TRUE
	if(!zoomed)
		if(lying)
			return
		var/obj/item/gun/S = get_active_hand()
		if(istype(S) && S.scope_zoom > 0)
			do_normal_zoom = FALSE
			S.toggle_scope(src)

		if(do_normal_zoom)
			var/_x = dx * 7
			var/_y = dy * 7

			animate(client, pixel_x = world.icon_size*_x, pixel_y = world.icon_size*_y, time = 3, easing = SINE_EASING)

			var/facing_dir
			if(abs(dx) > abs(dy))
				if(dx > 0)
					facing_dir = EAST
				else
					facing_dir = WEST
			else
				if(dy > 0)
					facing_dir = NORTH
				else
					facing_dir = SOUTH
			if(!src.facing_dir)
				set_face_dir(facing_dir)

		zoomed = TRUE


	else
		var/obj/item/gun/S = get_active_hand()
		if(istype(S))
			if(S.zoom)//Only do this if we're zoomed in please.
				do_normal_zoom = FALSE
				S.toggle_scope(src)
				set_face_dir(FALSE)//Reset us back to normal.
		S = get_inactive_hand()//Then check if it's in our inactive hand instead. That way you can swap hands and still unzoom normally.
		if(istype(S))
			if(S.zoom)
				do_normal_zoom = FALSE
				S.toggle_scope(src)
				set_face_dir(FALSE)//Reset us back to normal.

		if(do_normal_zoom)
			animate(client, pixel_x = 0, pixel_y = 0, time = 3, easing = SINE_EASING)
			set_face_dir(FALSE)//Reset us back to normal.
		zoomed = FALSE


/atom/AltClick(mob/user)
	..()
	zoomintodistance(src, user)

/proc/zoomintodistance(atom/turf, mob/user)
	if(!istype(user))
		return
	if(user.lying)
		return

	visible_message("<span class='notice'>[user] peers into the distance.</span>")

	// Calculate the direction to the clicked tile.
	var/dx = turf.x - user.x
	var/dy = turf.y - user.y
	var/max_dist = max(abs(dx), abs(dy))
	dx = dx / max_dist
	dy = dy / max_dist

	user.do_zoom(dx, dy)
