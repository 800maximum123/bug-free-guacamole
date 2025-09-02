/client/var/vector/last_mouse_position
/client/MouseMove(object, location, control, params)
	. = ..()

	var/mob/living/simple_animal/fd/lancer/mech = mob

	if(!istype(mech))
		return

	if(!(mech.zoom && mech.precise_zoom))
		return

	var/list/PM = params2list(params)
	var/list/screen_loc = splittext(PM["screen-loc"], ",")
	screen_loc = splittext(screen_loc[1], ":") + splittext(screen_loc[2], ":")

	var/list/view_size = getviewsize(view)

	var/screen_pixels_x = text2num(screen_loc[1]) * WORLD_ICON_SIZE + text2num(screen_loc[2]) - view_size[1] * 16
	var/screen_pixels_y = text2num(screen_loc[3]) * WORLD_ICON_SIZE + text2num(screen_loc[4]) - view_size[2] * 16

	if(istype(last_mouse_position))
		pixel_x += screen_pixels_x - last_mouse_position.x
		pixel_y += screen_pixels_y - last_mouse_position.y

		var/vector/viewoffset = mech.dir2viewoffset(mech.dir)

		pixel_x = clamp(pixel_x, viewoffset.x - 32*4, viewoffset.x + 32*4)
		pixel_y = clamp(pixel_y, viewoffset.y - 32*4, viewoffset.y + 32*4)

	last_mouse_position = vector(screen_pixels_x, screen_pixels_y)

/mob/living/simple_animal/fd/lancer/proc/dir2viewoffset(direction)
	var/tilesize = 35
	var/viewoffset = tilesize * 6

	switch(direction)
		if (NORTH)
			return vector(0, viewoffset)
		if (SOUTH)
			return vector(0, -viewoffset)
		if (EAST)
			return vector(viewoffset, 0)
		if (WEST)
			return vector(-viewoffset, 0)

/mob/living/simple_animal/fd/lancer/proc/set_zoom(newZoom)
	set category = "IC"
	set name = "Мех - Настроить оптику"

	if(!client)
		return FALSE

	if(mech_condition != CONSCIOUS)
		to_chat(src, SPAN_WARNING("Прямо сейчас линза не может сфокусироваться!"))
		newZoom = FALSE

	if(newZoom)
		toggle_zoom_hud()
		client.view = 9

		if(zoom != newZoom)
			visible_message("[src] прицеливается.")

		zoom = TRUE

		var/vector/viewoffset = dir2viewoffset(dir)
		animate(client, pixel_x = viewoffset.x, pixel_y = viewoffset.y, time = 2)

		set_face_dir()

		return TRUE

	toggle_zoom_hud()
	client.view = world.view
	zoom = FALSE

	animate(client, pixel_x = 0, pixel_y = 0, time = 3)

	set_face_dir(newdir = null)

	return FALSE
