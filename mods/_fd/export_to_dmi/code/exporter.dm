/atom/proc/save_atom_as_dmi(filename = null, decor = null)
	var/icon/saved_icon = new /icon()

	if(filename == null)
		filename = src.name + ".dmi"
	else
		filename = filename + ".dmi"

	var/dirs = list(NORTH, SOUTH, EAST, WEST)
	for(var/dir in dirs)
		var/icon/flat = getFlatIcon(src, dir, always_use_defdir = 1)

		if(decor == null)
			saved_icon.Insert(flat, dir = dir)
		else
			saved_icon.Insert(getHologramIcon(flat, hologram_color = decor), dir = dir)

		qdel(flat)

	var/success = FALSE
	success = fcopy(saved_icon, filename)
	if(success)
		log_and_message_admins(SPAN_WARNING("<b> \[DMI Exporter\] Атом [src.name] был сохранён в файл [filename]</i></b>"))
	else
		log_and_message_admins(SPAN_WARNING("<b> \[DMI Exporter\] Атом [src.name] не был сохранён</i></b>"))
	return success


// Я начал делать, но мне стало ДИКО лень. По хорошему нужно исправить чтобы он не сохранял
// ненужного, по типу зон, или же объектов которые игрок видеть не должен (Трубы под полом).
// В связи с тем что эта фича пока не требуется - оставляю на совесть будущего меня или кто там заниматься будет
// - Теч
/*
proc/save_area_to_dmi(turf/A, turf/B, filename, should_render_turfs = TRUE)
	if(!A || !B || A.z != B.z)
		return

	var/min_x = min(A.x, B.x)
	var/min_y = min(A.y, B.y)
	var/max_x = max(A.x, B.x)
	var/max_y = max(A.y, B.y)
	var/width = (max_x - min_x + 1) * 32
	var/height = (max_y - min_y + 1) * 32

	var/icon/area_icon = null

	for(var/turf/T in block(locate(min_x, min_y, A.z), locate(max_x, max_y, A.z)))
		if(T.contents.len > 0)
			area_icon = getFlatIcon(T.contents[1])
			break
		else
			area_icon = getFlatIcon(T)
			break

	if(!area_icon)
		area_icon = new /icon('icons/prototype.dmi', "white")
		area_icon.Blend(rgb(0,0,0,0), ICON_SUBTRACT)

	area_icon.Scale(width, height)
	area_icon.Blend(rgb(0,0,0,0), ICON_MULTIPLY)

	for(var/turf/T in block(locate(min_x, min_y, A.z), locate(max_x, max_y, A.z)))
		var/icon/turf_icon = getFlatIcon(T)
		if(should_render_turfs)
			if(turf_icon)
				area_icon.Blend(turf_icon, ICON_OVERLAY, (T.x-min_x)*32, (T.y-min_y)*32)

		for(var/atom/movable/AM in T)
			var/icon/obj_icon = getFlatIcon(AM)
			if(obj_icon)
				area_icon.Blend(obj_icon, ICON_OVERLAY, (AM.x-min_x)*32, (AM.y-min_y)*32)

	var/icon/final_icon = new /icon()
	final_icon.Insert(area_icon, "area")
	fcopy(final_icon, filename)

/mob/proc/save_area_around_me(filename, should_render_turfs = TRUE)
	if(!src || !isturf(loc))
		return

	var/turf/center = get_turf(src)

	var/turf/corner_A = locate(center.x - 2, center.y - 2, center.z)
	var/turf/corner_B = locate(center.x + 2, center.y + 2, center.z)

	save_area_to_dmi(corner_A, corner_B, filename, should_render_turfs)

proc/save_visible_area_to_dmi(turf/A, turf/B, filename, mob/viewer)
	if(!A || !B || A.z != B.z)
		return
	if(!viewer || !viewer.client)
		return

	var/min_x = min(A.x, B.x)
	var/min_y = min(A.y, B.y)
	var/max_x = max(A.x, B.x)
	var/max_y = max(A.y, B.y)
	var/width = (max_x - min_x + 1) * 32
	var/height = (max_y - min_y + 1) * 32


	var/icon/area_icon = getFlatIcon(viewer)
	area_icon.Scale(width, height)
	area_icon.Blend(rgb(0,0,0,0), ICON_MULTIPLY)

	for(var/turf/T in block(locate(min_x, min_y, A.z), locate(max_x, max_y, A.z)))
		if(T in view(viewer.client.view, viewer))
			var/icon/turf_icon = getFlatIcon(T)
			if(turf_icon)
				area_icon.Blend(turf_icon, ICON_OVERLAY, (T.x-min_x)*32, (T.y-min_y)*32)

			for(var/atom/movable/AM in T)
				if(AM.invisibility > viewer.see_invisible)
					continue

				var/icon/obj_icon = getFlatIcon(AM)
				if(obj_icon)
					area_icon.Blend(obj_icon, ICON_OVERLAY, (AM.x-min_x)*32, (AM.y-min_y)*32)

	var/icon/final_icon = new /icon()
	final_icon.Insert(area_icon, "visible_area")
	fcopy(final_icon, filename)

/mob/proc/save_visible_area(filename, radius = 5)
	if(!client)
		return

	var/turf/center = get_turf(src)
	save_visible_area_to_dmi(
		locate(center.x-radius, center.y-radius, center.z),
		locate(center.x+radius, center.y+radius, center.z),
		filename,
		src
	)
	to_chat(src, "<span class='notice'>Область сохранена: [filename]</span>")
*/
