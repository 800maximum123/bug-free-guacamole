//remap
/area/map_template/dead_sea
	name = "\improper Dead Sea"
	icon_state = "3"
	ambience = list('sound/ambience/spookyspace1.ogg', 'sound/ambience/spookyspace2.ogg')

/area/map_template/dead_sea/surface
	name = "\improper Desert Planet Surface"
	icon_state = "2"
	ambience = list('mods/_fd/_maps/dead_sea/sounds/desert_ambient.ogg')
	base_turf = /turf/simulated/floor/exoplanet/dead_sea
	planetary_surface = TRUE

/area/map_template/dead_sea/surface/Entered(mob/living/L)
    ..()
    if(istype(L))
        L.overlay_fullscreen("heat", /obj/screen/fullscreen/heat)

/area/map_template/dead_sea/surface/Exited(mob/living/L)
    ..()
    if(istype(L))
        L.clear_fullscreen("heat")

/obj/screen/fullscreen/heat
    icon = 'mods/_fd/_maps/dead_sea/icons/heat_overlay.dmi'
    icon_state = "overlay"
    screen_loc = ui_entire_screen
    layer = FULLSCREEN_LAYER

/area/map_template/dead_sea/underground
	name = "\improper Desert Planet Underground"
	icon_state = "18"
	sound_env = CAVE
	ambience = list('mods/_fd/_maps/dead_sea/sounds/under_ambience.ogg')
	base_turf = /turf/simulated/floor/exoplanet/dead_sea_under
	planetary_surface = TRUE

/area/map_template/dead_sea/underground/Entered(mob/living/L)
    ..()
    if(istype(L))
        L.overlay_fullscreen("underwater", /obj/screen/fullscreen/underwater)

/area/map_template/dead_sea/underground/Exited(mob/living/L)
    ..()
    if(istype(L))
        L.clear_fullscreen("underwater")

/obj/screen/fullscreen/underwater
    icon = 'mods/_fd/_maps/dead_sea/icons/water.dmi'
    icon_state = "water_deep"
    screen_loc = ui_entire_screen
    layer = FULLSCREEN_LAYER
    alpha = 50

/area/map_template/dead_sea/underground/cave
	name = "\improper Underground Cave"
	icon_state = "17"
