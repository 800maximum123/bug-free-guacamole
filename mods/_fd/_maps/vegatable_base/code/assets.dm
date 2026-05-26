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
