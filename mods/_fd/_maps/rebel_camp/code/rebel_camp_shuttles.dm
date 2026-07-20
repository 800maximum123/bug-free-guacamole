// STAR #1

/obj/overmap/visitable/ship/landable/rebel_camp/malekov
	name = "Ma-12"
	shuttle = "Ma-12"
	desc = "An experimental aircraft that never left the hangar. Call sign: \"Project P\"."
	fore_dir = SOUTH
	icon = 'mods/_fd/fd_assets/icons/overmap.dmi'
	color = "#4682B4"
	icon_state = "sfv-star"
	moving_state = "sfv-star_moving"
	skill_needed = SKILL_TRAINED
	free_landing = FALSE
	vessel_mass = 3500
	vessel_size = SHIP_SIZE_SMALL
	max_speed = 0.5/(3 SECONDS)
	burn_delay = 0.5 SECONDS
	hide_from_reports = TRUE

/obj/machinery/computer/shuttle_control/explore/rebel_camp/ma_12
	name = "landing control console"
	shuttle_tag = "Ma-12 Project P"

/datum/shuttle/autodock/overmap/malekov
	name = "PM-55-L Star #1"
	move_time = 20
	shuttle_area = list(/area/ship/airfield/star1)
	current_location = "nav_airfield_star_1"
	landmark_transition = "nav_transit_star_1"
	dock_target = "star_1_shuttle_dock_airlock"
	range = 1
	fuel_consumption = 1
	ceiling_type = /turf/simulated/floor/shuttle_ceiling/merc
	flags = SHUTTLE_FLAGS_PROCESS
	defer_initialisation = TRUE

/area/ship/rebel_camp/malekov
	name = "\improper Ma-12 Project P"

/obj/shuttle_landmark/airfield/star1
	name = "Ma-12 Project P Position"
	landmark_tag = "nav_airfield_star_1"
	docking_controller = "star_1_shuttle_dock_airlock"
	base_area = /area/ship/airfield/outdoors

/obj/shuttle_landmark/transit/airfield/star1
	name = "In transit"
	landmark_tag = "nav_transit_star_1"
