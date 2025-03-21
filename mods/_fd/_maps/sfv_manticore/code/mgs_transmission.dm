
/obj/screen/fullscreen/alert_transmission
	icon = 'mods/_fd/_maps/sfv_manticore/icons/transmissions.dmi'
	scale_to_view = TRUE
	icon_state = "alert"

/obj/screen/fullscreen/alert_transmission/Initialize()
	. = ..()
	alpha = 0
	animate(src, transform = matrix(0.01, MATRIX_SCALE), time = 1 SECOND, easing = BOUNCE_EASING)
	spawn(2 SECONDS)
		animate(src, 1 SECOND, alpha = 150)
		animate(src, transform = matrix(), time = 1 SECOND, easing = LINEAR_EASING)
	spawn(4 SECONDS)
		animate(src, pixel_x = -128, time = 1 SECOND, easing = SINE_EASING | EASE_OUT)

/obj/screen/fullscreen/alert_transmission/Destroy()
	animate(src, 0.5 SECOND, alpha = 0)
	severity = 0
	return ..()

/obj/screen/fullscreen/gyne_transmission
	icon = 'mods/_fd/_maps/sfv_manticore/icons/transmissions.dmi'
	scale_to_view = TRUE
	icon_state = "gyne"

/obj/screen/fullscreen/gyne_transmission/Initialize()
	. = ..()
	alpha = 0
	spawn(1 SECOND)
		animate(src, 1 SECOND, alpha = 255)

/obj/screen/fullscreen/gyne_transmission/Destroy()
	animate(src, 0.5 SECOND, alpha = 0)
	severity = 0
	return ..()

/proc/gyne_transmission()
	for(var/mob/M in GLOB.player_list)
		M.overlay_fullscreen("incoming", /obj/screen/fullscreen/alert_transmission)
		spawn(8 SECONDS)
			M.clear_fullscreen("incoming")
			M.overlay_fullscreen("gyne", /obj/screen/fullscreen/gyne_transmission)
		spawn(18 SECONDS)
			M.clear_fullscreen("gyne")
