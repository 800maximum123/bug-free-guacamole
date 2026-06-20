// NIGHTMARE MAP STARTS

/obj/screen/fullscreen/screamer
	icon = 'mods/_fd/_maps/collective_nightmare/icons/largenoise.dmi'
	icon_state = "1"
	scale_to_view = TRUE

/obj/screen/fullscreen/connection_damage
	icon = 'mods/_fd/_maps/collective_nightmare/icons/is12_screens.dmi'
	icon_state = "ghost2"
	scale_to_view = TRUE

/obj/screen/fullscreen/underworld_vision
	icon = 'mods/_fd/_maps/collective_nightmare/icons/is12_screens.dmi'
	icon_state = "ghost1"
	scale_to_view = TRUE

/obj/screen/fullscreen/almost_done
	icon = 'mods/_fd/_maps/collective_nightmare/icons/tgmc_screens.dmi'
	icon_state = "bloodlust"
	scale_to_view = TRUE
	alpha = 0

/obj/screen/fullscreen/almost_done/Initialize()
	. = ..()
	animate(src, alpha = 255, time = 5, LINEAR_EASING)

/obj/screen/fullscreen/almost_done/black
	icon = 'mods/_fd/_maps/collective_nightmare/icons/tgmc_screens.dmi'
	icon_state = "bloodlust"
	color = COLOR_BLACK
	scale_to_view = TRUE
	alpha = 0

// NIGHTMARE MAP ENDS

/obj/screen/fullscreen/fd/blackout
	icon = 'mods/_fd/fd_assets/icons/screen_full.dmi'
	icon_state = "fullblack"
	allstate = 1
	plane = HUD_PLANE
	layer = HUD_ABOVE_HUD_LAYER

/obj/screen/fullscreen/fd/blackout/alt
	layer = UNDER_HUD_LAYER

/obj/screen/fullscreen/fd/fishbed
	plane = HUD_PLANE
	layer = 7

	icon_state = "fishbed"
	allstate = 1
	scale_to_view = TRUE

/obj/screen/fullscreen/novel1
	icon = 'mods/_fd/fd_assets/icons/screen_full.dmi'
	icon_state = "novel_test1"
	allstate = 1
	plane = HUD_PLANE
	layer = HUD_ABOVE_HUD_LAYER

/obj/screen/fullscreen/novel2
	icon = 'mods/_fd/fd_assets/icons/screen_full.dmi'
	icon_state = "novel_test2"
	allstate = 1
	plane = HUD_PLANE
	layer = HUD_ABOVE_HUD_LAYER

/obj/screen/fullscreen/snowstorm
	icon = 'mods/_fd/fd_assets/icons/weather.dmi'
	screen_loc = "WEST,SOUTH to EAST,NORTH"
	icon_state = "snowfall_heavy_old"
	alpha = 25

/obj/screen/fullscreen/fd/bluespace_affection
	icon = 'icons/effects/effects.dmi'
	icon_state = "malf-scanline"
	screen_loc = "WEST,SOUTH to EAST,NORTH"
	alpha = 25

/obj/screen/fullscreen/underwater
	icon = 'icons/effects/water.dmi'
	icon_state = "underwater"
	screen_loc = ui_entire_screen
	layer = FULLSCREEN_LAYER
