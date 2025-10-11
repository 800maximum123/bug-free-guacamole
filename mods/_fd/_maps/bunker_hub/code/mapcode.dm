/obj/overmap/visitable/sector/bunker_hub
	name = "TRK-17"
	desc = "Green terraformed world with rich flora and fauna"
	sector_flags = OVERMAP_SECTOR_KNOWN
	icon_state = "globe"
	color = "#63c2c2"
	initial_generic_waypoints = list(
		"nav_alab_1"
	)
	var/list/lightmain

/obj/overmap/visitable/sector/bunker_hub/Initialize()
	..()

	lightmain = block(locate(world.maxx, world.maxy, max(map_z)), locate(1, 1, min(map_z)))
	for(var/atom/A as anything in lightmain)
		if(!istype(A.loc, /area/bunker/jungle) || !istype(A, /turf/) || A.density)
			lightmain -= A
	update_daynight()

/obj/overmap/visitable/sector/bunker_hub/proc/update_daynight(light = 2, light_color_m = "#b3afab")
	for(var/turf/T as anything in lightmain)
		T.set_light(1, light, l_color = light_color_m)

/datum/map_template/ruin/away_site/bunker_hub
	name = "TRK-17 HUB (Campaign)"
	id = "awaysite_bunker_hub"
	spawn_cost = 2
	description = "..."
	prefix = "mods/_fd/_maps/bunker_hub/map/"
	suffixes = list("bunker.dmm")
	area_usage_test_exempted_root_areas = list(/area/bunker)
	apc_test_exempt_areas = list(
		/area/bunker = NO_SCRUBBER|NO_VENT|NO_APC
	)

/obj/shuttle_landmark/nav_bunker_hub
	name = "Nearest Beach"
	landmark_tag = "nav_bunker_hub"
	base_area = /area/bunker/jungle


/area/bunker/


/area/bunker/jungle
	name = "Jungle"
	icon = 'mods/_fd/_maps/small_exoplanet_1/icons/weather.dmi'
	icon_state = "rain"
	requires_power = 0

/area/bunker/jungle/lz
	name = "Landing Zone"

/area/bunker/kpp
	name = "Bunker - KPP"

/area/bunker/kitchen
	name = "Bunker - Kitchen"

/area/bunker/kitchen/bufet
	name = "Bunker - Bufet"

/area/bunker/kitchen/freezer
	name = "Bunker - Freezer"

/area/bunker/command
	name = "Bunker - Command Room"

/area/bunker/barracks
	name = "Bunker - Bravo Barracks"

/area/bunker/barracks/preporation
	name = "Bunker - Preporation Room"

/area/bunker/barracks/gvardiya
	name = "Bunker - Gvardiya Barracks"

/area/bunker/barracks/preporation_gvardiya
	name = "Bunker - Gvardiya Preporation Room"

/area/bunker/corridors
	name ="Corridors"

/area/bunker/corridors/north
	name = "Bunker - North Corridor"

/area/bunker/corridors/center
	name = "Bunker - Center Corridor"

/area/bunker/corridors/west
	name = "Bunker - West Corridor"

/area/bunker/corridors/south
	name = "Bunker - South Corridor"

/area/bunker/corridors/south
	name = "Bunker - South Corridor"

/area/bunker/corridors/east
	name = "Bunker - East Corridor"

/area/bunker/eng
	name = "Bunker - Technical Room"

/area/bunker/eng/workshop
	name = "Bunker - Workshop"

/area/bunker/rooms
	name = "Bunker - Room 0"

/area/bunker/rooms/room1
	name = "Bunker - Room 1"

/area/bunker/rooms/room2
	name = "Bunker - Room 2"

/area/bunker/rooms/room3
	name = "Bunker - Room 3"

/area/bunker/rooms/room4
	name = "Bunker - Room 4"

/area/bunker/rooms/room5
	name = "Bunker - Room 5"

/area/bunker/rooms/room6
	name = "Bunker - Room 6"

/area/bunker/rooms/room6
	name = "Bunker - Room 6"

/area/bunker/rooms/room7
	name = "Bunker - Room 7"

/area/bunker/rooms/room8
	name = "Bunker - Room 8"

/area/bunker/rooms/room9
	name = "Bunker - Room 9"

/area/bunker/rooms/room10
	name = "Bunker - Room 10"

/area/bunker/rooms/room11
	name = "Bunker - Room 11"

/area/bunker/rooms/room12
	name = "Bunker - Room 12"

/area/bunker/rooms/room13
	name = "Bunker - Room 13"

/area/bunker/rooms/room14
	name = "Bunker - Room 14"
