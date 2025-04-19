
/obj/machinery/computer/shuttle_control/explore/sultan
	name = "shuttle control console"
	shuttle_tag = "PM-13 \"Sultan\" Shuttle"

/obj/shuttle_landmark/sultan
	name = "Sultan Landing Zone"
	landmark_tag = "nav_sultan_start"
	docking_controller = "sultan_dock"
	movable_flags = MOVABLE_FLAG_EFFECTMOVE

/obj/shuttle_landmark/transit/sultan
	name = "In transit"
	landmark_tag = "nav_transit_sultan"

/area/ship/sultan/central
	name = "\improper PM-13 \"Sultan\" Shuttle | Central"
	icon_state = "bridge"

/area/ship/sultan/cockpit
	name = "\improper PM-13 \"Sultan\" Shuttle | Cockpit "
	icon_state = "bridge_hall"

/area/ship/sultan/rear
	name = "\improper PM-13 \"Sultan\" Shuttle | Rear"
	icon_state = "yellow"

/area/ship/sultan/engibay
	name = "\improper PM-13 \"Sultan\" Shuttle | EngiBay "
	icon_state = "engine"

/obj/overmap/visitable/ship/landable/sultan
	name = "PM-13 \"Sultan\" Shuttle"
	shuttle = "PM-13 \"Sultan\" Shuttle"
	desc = "Wake signature indicates a small armed vessel, broadcasting registration codes \"SCGFV-3471-S-463\"."
	fore_dir = NORTH
	color = "#0751f3"
	alpha = 155
//	integrity_failure_cap = 150
	skill_needed = SKILL_TRAINED
	vessel_mass = 2500
	vessel_size = SHIP_SIZE_SMALL
	max_speed = 1/(2 SECONDS)
	burn_delay = 1 SECONDS
	hide_from_reports = TRUE
	known_ships = list(
		/obj/overmap/visitable/ship/sfv_warspite,
		/obj/overmap/visitable/ship/landable/lifepod,
		/obj/overmap/visitable/ship/landable/lifepod/two,
		/obj/overmap/visitable/ship/landable/lifepod/three,
		/obj/overmap/visitable/ship/landable/lifepod/four,
		/obj/overmap/visitable/ship/landable/lifepod/five,
		/obj/overmap/visitable/ship/landable/lifepod/six
	)
//	known = 0

/datum/shuttle/autodock/overmap/sultan
	name = "PM-13 \"Sultan\" Shuttle"
	warmup_time = 3
	range = 0
	shuttle_area = list(
//		/area/ship/sultan,
		/area/ship/sultan/central,
		/area/ship/sultan/rear,
		/area/ship/sultan/cockpit,
		/area/ship/sultan/engibay
	)
	defer_initialisation = TRUE
//	landmark_transition = "nav_transit_sultan"
	skill_needed = SKILL_TRAINED
	ceiling_type = /turf/simulated/floor/reinforced
	current_location = "nav_sultan_start"
