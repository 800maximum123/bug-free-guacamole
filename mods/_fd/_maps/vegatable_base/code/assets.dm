/turf/simulated/floor/exoplanet/fd/cyberspace
	name = "..."
	desc = "This is wrong."
	icon = 'mods/_fd/fd_assets/icons/goons/featherzone.dmi'
	icon_state = "floor"

/turf/simulated/floor/exoplanet/fd/cyberspace/animated
	icon_state = "empty"

/turf/simulated/floor/exoplanet/fd/cyberspace/animated/Entered(mob/living/L)
	. = ..()

	if(icon_state != "spawn-wall_dark" && isliving(L))
		icon_state = "spawn-wall_dark"
		addtimer(new Callback(src, PROC_REF(collapse)), 4 SECONDS)

/turf/simulated/floor/exoplanet/fd/cyberspace/animated/proc/collapse()
	var/list/mob/living/mob_in_tile = list()
	for(var/mob/living/L in contents)
		mob_in_tile += L

	if(length(mob_in_tile))
		addtimer(new Callback(src, PROC_REF(collapse)), 4 SECONDS)
		return

	else
		icon_state = "spawn-wall_dark_collapse"

/obj/structure/fd/topdown_walls/cyberspace
	icon = 'mods/_fd/fd_assets/icons/goons/featherzone.dmi'
	icon_state = "0"

/obj/structure/fd/cyberspace
	anchored = TRUE
	mouse_opacity = FALSE

	icon = 'mods/_fd/fd_assets/icons/goons/featherzone.dmi'
	icon_state = "0"

/obj/structure/fd/cyberspace/scanline
	icon = 'icons/effects/effects.dmi'
	icon_state = "malf-scanline"

/obj/structure/fd/cyberspace/protective_shield
	health_max = 100
	icon_state = "cage"
	opacity = TRUE
	density = TRUE
	mouse_opacity = TRUE

	layer = 4.09

/obj/structure/fd/cyberspace/protective_shield/damage_health(damage, damage_type, damage_flags, severity, skip_can_damage_check)
	. = ..()

	animate(src, transform = matrix(0.8, MATRIX_SCALE), time = 0.3 SECONDS, easing = BOUNCE_EASING|EASE_OUT)
	animate(src, transform = matrix(1, MATRIX_SCALE), time = 0.2 SECONDS, easing = SINE_EASING|EASE_IN)

/obj/structure/fd/cyberspace/protective_shield/seethrough
	opacity = FALSE
	icon_state = "barricade-0"

/obj/structure/fd/random_junk/music_station
	name = "old music station"
	desc = "Still usable."
	icon = 'mods/_fd/fd_assets/icons/goons/radiostation.dmi'
	icon_state = "portable_record"

	anchored = TRUE
	density = TRUE

/obj/structure/fd/random_junk/music_additional
	name = "machinery"
	desc = "To work with sounds."
	icon = 'mods/_fd/fd_assets/icons/goons/loudspeakers.dmi'
	icon_state = "amp_stack"

	anchored = TRUE
	density = TRUE

/obj/structure/fd/random_junk/goon_graffiti
	name = "graffiti"
	desc = "So calles street-art."
	icon = 'mods/_fd/fd_assets/icons/goons/graffiti.dmi'
	icon_state = "graffiti-single-13"

	anchored = TRUE

/obj/item/fd/random_junk/music_disks
	name = "record"
	desc = "Stores sounds inside."
	icon = 'mods/_fd/fd_assets/icons/goons/radiostation.dmi'
	icon_state = "sleeve_1"

	w_class = ITEM_SIZE_NORMAL

/obj/item/fd/random_junk/simple_disks
	name = "disk"
	desc = "Stores information inside."
	icon = 'mods/_fd/fd_assets/icons/goons/disks.dmi'
	icon_state = "datadiskmed"

	w_class = ITEM_SIZE_SMALL

/obj/item/fd/random_junk/music_devices
	name = "device"
	desc = "With this thing you are going to make some music."
	icon = 'mods/_fd/fd_assets/icons/goons/device.dmi'
	icon_state = "micstand"

	w_class = ITEM_SIZE_NORMAL

/*/obj/structure/fd/random_junk/whiteboard
	name = "machinery"
	desc = "To work with sounds."
	icon = 'mods/_fd/fd_assets/icons/aurora/whiteboard.dmi'
	icon_state = "amp_stack"

	interactive = TRUE

	anchored = TRUE
	density = TRUE

	bound_width = 64

/obj/structure/fd/random_junk/whiteboard/interact_with(mob/living/user)

	var/list/options = list(
		"НАПИСАТЬ" = image('mods/_fd/_maps/collective_nightmare/icons/radial.dmi', "radial_modify"),
		"СТЕРЕТЬ" = image('mods/_fd/_maps/collective_nightmare/icons/radial.dmi', "radial_reset"),
		"ПРОЧИТАТЬ" = image('mods/_fd/_maps/collective_nightmare/icons/radial.dmi', "radial_examine"),
	)
	var/chosen_option = show_radial_menu(user, src, options, radius = 25, require_near = TRUE)
	if(!chosen_option)
		return FALSE
	switch(chosen_option)
		if("НАПИСАТЬ")
			if(desc_special_show)
				*/
