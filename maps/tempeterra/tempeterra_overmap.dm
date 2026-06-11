// --- ORIGINAL TORCH INFO -- \\

/obj/overmap/visitable/ship/sfv_tempeterra
	name = "SFV Tempe Terra"
	desc = "A small, fairly modern dagger-shaped Lexington-class corvette, broadcasting SCGF codes and the designation 'SFV Tempe-Terra, LXC-7, Battle Group Bravo'"
	fore_dir = WEST
	vessel_size = SHIP_SIZE_LARGE
	vessel_mass = 40000
	sector_flags = OVERMAP_SECTOR_KNOWN|OVERMAP_SECTOR_IN_SPACE|OVERMAP_SECTOR_BASE
	known_ships = list(

	)

	initial_generic_waypoints = list(
		"nav_tempeterra_one",
		"nav_tempeterra_two",
		"nav_tempeterra_three",
		"nav_tempeterra_four",
		"nav_tempeterra_five",
		"nav_tempeterra_six"
	)
/*
	initial_restricted_waypoints = list(
		"SFC Wolfe" = list("nav_hangar_tempeterra")
	)
*/
	known_ships = list(
		/obj/overmap/visitable/ship/landable/butterfly
	)

// --- BUTTERFLY --- //

/obj/overmap/visitable/ship/landable/butterfly
	name = "Butterfly"
	desc = "An SSE-U09 long range shuttle. Transponder is totally dead. "
	shuttle = "Butterfly"
	max_speed = 1/(2 SECONDS)
	burn_delay = 1 SECONDS
	vessel_mass = 4000
	fore_dir = SOUTH
	dir = SOUTH
	skill_needed = SKILL_BASIC
	vessel_size = SHIP_SIZE_TINY
	known_ships = list(
		/obj/overmap/visitable/ship/sfv_tempeterra
	)

/obj/machinery/computer/shuttle_control/explore/butterfly
	name = "Butterfly control console"
	shuttle_tag = "Butterfly"

/datum/shuttle/autodock/overmap/butterfly
	name = "Butterfly"
	warmup_time = 5
	move_time = 30
	shuttle_area = list(/area/butterfly_hangar,/area/butterfly_hangar/cockpit)
	dock_target = "butterfly_shuttle"
	current_location = "nav_hangar_butterfly"
	// landmark_transition = "nav_transit_butterfly"
	sound_takeoff = 'sound/effects/rocket.ogg'
	sound_landing = 'sound/effects/rocket_backwards.ogg'
	fuel_consumption = 2
	logging_home_tag = "nav_hangar_butterfly"
	// logging_access = access_guppy_helm
	skill_needed = SKILL_UNSKILLED
	ceiling_type = /turf/simulated/floor/shuttle_ceiling/torch

/obj/shuttle_landmark/torch/hangar/butterfly
	name = "Butterfly Hangar"
	landmark_tag = "nav_hangar_butterfly"
	base_area = /area/tempeterra/hangar
	base_turf = /turf/simulated/floor/plating

/obj/shuttle_landmark/torch/deck1/butterfly
	name = "Space near Third Deck (1)"
	landmark_tag = "nav_deck1_butterfly"

/obj/shuttle_landmark/torch/deck2/butterfly
	name = "Space near Third Deck (2)"
	landmark_tag = "nav_deck2_butterfly"

/obj/shuttle_landmark/torch/deck3/butterfly
	name = "Space near Second Deck (1)"
	landmark_tag = "nav_deck3_butterfly"

/obj/shuttle_landmark/torch/deck5/butterfly
	name = "Space near Second Deck (2)"
	landmark_tag = "nav_bridge_butterfly"

/obj/shuttle_landmark/torch/deck4/butterfly
	name = "Space near First Deck"
	landmark_tag = "nav_deck4_butterfly"

/obj/shuttle_landmark/transit/torch/butterfly
	name = "In transit"
	landmark_tag = "nav_transit_butterfly"
