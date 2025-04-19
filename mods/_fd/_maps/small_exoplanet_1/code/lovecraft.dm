/obj/overmap/visitable/sector/lovecraft
	name = "Innsmouth"
	desc = "Old city in the mist."
	sector_flags = OVERMAP_SECTOR_KNOWN
	color = COLOR_DARK_GREEN_GRAY
	icon_state = "globe"
	initial_generic_waypoints = list()

	var/list/lightmain
	var/list/lightupper

/obj/overmap/visitable/sector/lovecraft/Initialize()
	..()

	lightmain = block(locate(world.maxx, world.maxy, max(map_z)), locate(1, 1, min(map_z)))
	lightupper = block(locate(world.maxx, world.maxy, max(map_z)), locate(1, 1, min(map_z)))
	for(var/atom/A as anything in lightmain)
		if(!istype(A.loc, /area/lovecraft/main_level) || A.density || istype(A.loc, /area/lovecraft/below_level))
			lightmain -= A
	for(var/atom/A as anything in lightupper)
		if(!istype(A.loc, /area/lovecraft/upper_level) || A.density || istype(A.loc, /area/lovecraft/below_level) || istype(A.loc, /area/lovecraft/main_level))
			lightupper -= A
	update_daynight()

/obj/overmap/visitable/sector/lovecraft/proc/update_daynight(light = 0.7, light_color_m = "#65856f")
	for(var/turf/T as anything in lightmain)
		T.set_light(1, light, l_color = light_color_m)
	for(var/turf/T as anything in lightupper)
		T.set_light(1, light, l_color = light_color_m)

/datum/map_template/ruin/away_site/lovecraft
	name = "Innsmouth"
	id = "awaysite_lovecraft"
	spawn_cost = INFINITY
	player_cost = 2
	description = "Old city in the mist."
	prefix = "mods/_fd/_maps/small_exoplanet_1/map/"
	suffixes = list("lovecraft.dmm")
	area_usage_test_exempted_root_areas = list(/area/lovecraft/)
	apc_test_exempt_areas = list(
		/area/lovecraft/ = NO_SCRUBBER|NO_VENT|NO_APC
	)

/area/lovecraft
	var/add_overlay = FALSE
	requires_power = FALSE

/area/lovecraft/indoors/main
	base_turf = /turf/simulated/floor/exoplanet/grim_dirt
	ambience =  list(
		'mods/_fd/_maps/small_exoplanet_1/sounds/various/TitleRollRain.wav'
	)

/area/lovecraft/indoors/main/adm
	name = "Innsmouth Admiralty (MAIN)"

/area/lovecraft/indoors/main/lib
	name = "Innsmouth Great Library (MAIN)"

/area/lovecraft/indoors/main/hotel
	name = "Innsmouth Mossberry Hotel (MAIN)"

/area/lovecraft/indoors/main/cargo
	name = "Innsmouth Docking Cargo (MAIN)"

/area/lovecraft/indoors/main/cargo/stores
	name = "Innsmouth Bazar (MAIN)"
	add_overlay = TRUE

/area/lovecraft/indoors/main/cargo/stores/Entered(mob/living/L)
	..()
	if(istype(L) && add_overlay)
		L.overlay_fullscreen("mist", /obj/screen/fullscreen/mist)

/area/lovecraft/indoors/main/cargo/stores/Exited(mob/living/L)
	..()
	if(istype(L) && add_overlay)
		L.clear_fullscreen("mist")

/area/lovecraft/indoors/main/home1
	name = "Traw's family House (MAIN)"

/area/lovecraft/indoors/main/home2
	name = "Smith's family House (MAIN)"

/area/lovecraft/indoors/main/home3
	name = "Baxter's family House (MAIN)"

/area/lovecraft/indoors/main/home4
	name = "Anderson's family House (MAIN)"

/area/lovecraft/indoors/main/home5
	name = "Teodor's family House (MAIN)"

/area/lovecraft/indoors/main/ship_lower
	name = "Ship Lower Deck (MAIN)"

/area/lovecraft/indoors/main/cave
	name = "Innsmouth Mineshaft (MAIN)"

/area/lovecraft/indoors/main/fisherman
	name = "Fisherman House (MAIN)"

/area/lovecraft/indoors/main/fisherman/balcony
	add_overlay = TRUE

/area/lovecraft/indoors/main/fisherman/balcony/Entered(mob/living/L)
	..()
	if(istype(L) && add_overlay)
		L.overlay_fullscreen("mist", /obj/screen/fullscreen/mist)

/area/lovecraft/indoors/main/fisherman/balcony/Exited(mob/living/L)
	..()
	if(istype(L) && add_overlay)
		L.clear_fullscreen("mist")

/area/lovecraft/indoors/second
	base_turf = /turf/simulated/open
	ambience =  list(
		'mods/_fd/_maps/small_exoplanet_1/sounds/various/TitleRollRain.wav'
	)

/area/lovecraft/indoors/second/adm
	name = "Innsmouth Admiralty (ABOVE)"

/area/lovecraft/indoors/second/lib
	name = "Innsmouth Great Library (ABOVE)"

/area/lovecraft/indoors/second/home1
	name = "Traw's family House (ABOVE)"

/area/lovecraft/indoors/second/home2
	name = "Smith's family House (ABOVE)"

/area/lovecraft/indoors/second/home2/balcony
	add_overlay = TRUE

/area/lovecraft/indoors/second/home2/balcony/Entered(mob/living/L)
	..()
	if(istype(L) && add_overlay)
		L.overlay_fullscreen("mist", /obj/screen/fullscreen/mist)

/area/lovecraft/indoors/second/home2/balcony/Exited(mob/living/L)
	..()
	if(istype(L) && add_overlay)
		L.clear_fullscreen("mist")

/area/lovecraft/indoors/second/home3
	name = "Baxter's family House (ABOVE)"

/area/lovecraft/indoors/second/home4
	name = "Anderson's family House (ABOVE)"

/area/lovecraft/indoors/second/home5
	name = "Teodor's family House (ABOVE)"

/area/lovecraft/indoors/second/ship_upper
	name = "Ship First Deck (ABOVE)"

/area/lovecraft/main_level
	name = "Innsmouth (MAIN)"
	dynamic_lighting = 1
	add_overlay = TRUE
	base_turf = /turf/simulated/open
	ambience =  list(
		'mods/_fd/_maps/small_exoplanet_1/sounds/AAA_HP_1.ogg',
		'mods/_fd/_maps/small_exoplanet_1/sounds/AAA_HP_3.ogg',
		'mods/_fd/_maps/small_exoplanet_1/sounds/AAA_HP_4.ogg',
		'mods/_fd/_maps/small_exoplanet_1/sounds/various/Docks.ogg',
		'mods/_fd/_maps/small_exoplanet_1/sounds/various/Rain_and_waves.ogg',
		'mods/_fd/_maps/small_exoplanet_1/sounds/AAA_HP_2.ogg'
	)

/area/lovecraft/main_level/Entered(mob/living/L)
	..()
	if(istype(L) && add_overlay)
		L.overlay_fullscreen("rain", /obj/screen/fullscreen/light_rain)
		L.overlay_fullscreen("mist", /obj/screen/fullscreen/mist)

/area/lovecraft/main_level/Exited(mob/living/L)
	..()
	if(istype(L) && add_overlay)
		L.clear_fullscreen("rain")
		L.clear_fullscreen("mist")

/area/lovecraft/upper_level
	name = "Innsmouth (ABOVE)"
	dynamic_lighting = 1
	add_overlay = TRUE
	base_turf = /turf/simulated/open
	ambience =  list(
		'mods/_fd/_maps/small_exoplanet_1/sounds/AAA_HP_1.ogg',
		'mods/_fd/_maps/small_exoplanet_1/sounds/AAA_HP_3.ogg',
		'mods/_fd/_maps/small_exoplanet_1/sounds/AAA_HP_4.ogg',
		'mods/_fd/_maps/small_exoplanet_1/sounds/various/Docks.ogg',
		'mods/_fd/_maps/small_exoplanet_1/sounds/various/Rain_and_waves.ogg',
		'mods/_fd/_maps/small_exoplanet_1/sounds/AAA_HP_2.ogg'
	)

/area/lovecraft/upper_level/Entered(mob/living/L)
	..()
	if(istype(L) && add_overlay)
		L.overlay_fullscreen("rain", /obj/screen/fullscreen/light_rain)
		L.overlay_fullscreen("mist", /obj/screen/fullscreen/mist)

/area/lovecraft/upper_level/Exited(mob/living/L)
	..()
	if(istype(L) && add_overlay)
		L.clear_fullscreen("rain")
		L.clear_fullscreen("mist")

/area/lovecraft/below_level
	name = "Innsmouth Sea (BELOW)"
	dynamic_lighting = 1
	add_overlay = TRUE
	base_turf = /turf/simulated/ocean

/area/lovecraft/below_level/Entered(mob/living/L)
	..()
	if(istype(L) && add_overlay)
		L.overlay_fullscreen("underwater", /obj/screen/fullscreen/underwater)

/area/lovecraft/below_level/Exited(mob/living/L)
	..()
	if(istype(L) && add_overlay)
		L.clear_fullscreen("underwater")

/area/lovecraft/below_level/cave
	name = "Innsmouth Mineshaft (BELOW)"
	add_overlay = FALSE
	ambience =  list(
		'mods/_fd/_maps/small_exoplanet_1/sounds/various/Cave.ogg',
		'mods/_fd/_maps/small_exoplanet_1/sounds/various/cavewater_1.ogg',
		'mods/_fd/_maps/small_exoplanet_1/sounds/various/cavewater_2.ogg',
		'mods/_fd/_maps/small_exoplanet_1/sounds/various/cavewater_3.ogg'
	)
