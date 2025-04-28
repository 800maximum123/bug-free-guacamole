
/proc/thing_to_icon(thing = null, dir = null, decor = null)
	RETURN_TYPE(/icon)
	if(thing == null)
		return
	if(!(dir in GLOB.alldirs))
		dir = NORTH
	var/icon/baked_icon = new /icon()

	var/icon/flat = getFlatIcon(thing, dir, always_use_defdir = 1)

	if(decor == null)
		baked_icon.Insert(flat, dir = dir)
	else
		baked_icon.Insert(getHologramIcon(flat, hologram_color = decor), dir = dir)

	return baked_icon

/atom/proc/save_atom_as_dmi(filename = null, decor = null)
	var/icon/saved_icon = new /icon()

	if(filename == null)
		filename = src.name

	for(var/dir in GLOB.alldirs)
		saved_icon.Insert(thing_to_icon(src, dir, decor), filename, dir)

	/*send_rsc(usr, saved_icon, filename + ".dmi")

	var/html = {"
		<!doctype html>
		<meta charset=utf-8>
		<a href='[filename + ".dmi"]' download>Скачать [filename + ".dmi"]</a>
	"}

	show_browser(usr, html, "file_download")
	return TRUE*/
	var/success = FALSE

	var/full_path = "_export_things/[filename + ".dmi"]"
	if(!fexists("_export_things/"))
		fcopy("", "_export_things/")

	success = fcopy(saved_icon, full_path)
	if(success)
		log_and_message_admins(SPAN_WARNING("<b> \[DMI Exporter\] Атом [src.name] был сохранён в файл [full_path]</i></b>"))
	else
		log_and_message_admins(SPAN_WARNING("<b> \[DMI Exporter\] Атом [src.name] не был сохранён</i></b>"))
	return success


// CAPTURE_MODE_REGULAR 0
// CAPTURE_MODE_ALL 1
// CAPTURE_MODE_PARTIAL 3 (Wtf bay-devs???)
/atom/proc/save_area_as_dmi(range_x = 3, range_y = 3, cappy_mode = CAPTURE_MODE_PARTIAL, filename = null, decor = null)
	var/icon/saved_icon = new /icon()

	if(filename == null)
		filename = src.name

	saved_icon = upgraded_generate_image(src.loc.x, src.loc.y, src.loc.z, range_x, range_y, cappy_mode, usr, lighting = 0, suppress_errors = 1)

	var/success = FALSE
	var/full_path = "_export_things/[filename + ".dmi"]"
	if(!fexists("_export_things/"))
		fcopy("", "_export_things/")
	success = fcopy(saved_icon, full_path)
	if(success)
		log_and_message_admins(SPAN_WARNING("<b> \[DMI Exporter\] Зона была сохранёна в файл [full_path]</i></b>"))
	else
		log_and_message_admins(SPAN_WARNING("<b> \[DMI Exporter\] Зона не была сохранёна</i></b>"))
	return success

// code/_helpers/icons.dm
// The difference is that this one is not square. Simply as that
/proc/upgraded_generate_image(tx as num, ty as num, tz as num, rangex as num, rangey as num, cap_mode = CAPTURE_MODE_PARTIAL, mob/living/user, lighting = 1, suppress_errors = 1)
	RETURN_TYPE(/icon)
	var/list/turfstocapture = list()
	//Lines below determine what tiles will be rendered
	for(var/xoff = 0 to rangex)
		for(var/yoff = 0 to rangey)
			var/turf/T = locate(tx + xoff,ty + yoff,tz)
			if(T)
				if(cap_mode == CAPTURE_MODE_REGULAR)
					if(user.can_capture_turf(T))
						turfstocapture.Add(T)
						continue
				else
					turfstocapture.Add(T)
			else
				//Capture includes non-existan turfs
				if(!suppress_errors)
					return
	//Lines below determine what objects will be rendered
	var/list/atoms = list()
	for(var/turf/T in turfstocapture)
		atoms.Add(T)
		for(var/atom/A in T)
			if(istype(A, /atom/movable/lighting_overlay) && lighting) //Special case for lighting
				atoms.Add(A)
				continue
			if(A.invisibility) continue
			atoms.Add(A)
	//Lines below actually render all colected data
	atoms = sort_atoms_by_layer(atoms)
	var/icon/cap = icon('icons/effects/96x96.dmi', "")
	cap.Scale(rangex*32, rangey*32)
	cap.Blend("#000", ICON_OVERLAY)
	for(var/atom/A in atoms)
		if(A)
			var/icon/img = getFlatIcon(A)
			if(istype(img, /icon))
				if(istype(A, /mob/living) && A:lying)
					img.BecomeLying()
				var/xoff = (A.x - tx) * 32
				var/yoff = (A.y - ty) * 32
				cap.Blend(img, blendMode2iconMode(A.blend_mode),  A.pixel_x + xoff, A.pixel_y + yoff)

	return cap
