/*
* -- SCG Trucks --
*/
/obj/machinery/computer/shuttle_control/scg_truck
	name = "alpha truck control console"
	shuttle_tag = "SCG Truck Alpha"
	req_access = list(access_heads)

/obj/machinery/computer/shuttle_control/scg_truck/bravo
	name = "bravo truck control console"
	shuttle_tag = "SCG Truck Bravo"

/area/turbolift/scg_truck
	name = "SCG Truck Alpha"
	base_turf = /turf/simulated/floor/plating
	req_access = list(access_solgov_crew)

/area/turbolift/scg_truck/bravo
	name = "SCG Truck Bravo"

/datum/shuttle/autodock/ferry/scg_truck
	name = "SCG Truck Alpha"
	shuttle_area = /area/turbolift/scg_truck
	warmup_time = 6
	arrive_time = 10
	waypoint_station = "nav_scg_truck_a_camp"
	waypoint_offsite = "nav_scg_truck_a_areaofop"
	sound_takeoff = 'maps/gaia/sounds/truck_start.ogg'
	sound_landing = 'maps/gaia/sounds/truck_stop.ogg'
	ceiling_type = /turf/simulated/floor/reinforced/airmix
	knockdown = 0

/datum/shuttle/autodock/ferry/scg_truck/bravo
	name = "SCG Truck Bravo"
	shuttle_area = /area/turbolift/scg_truck/bravo
	waypoint_station = "nav_scg_truck_b_camp"
	waypoint_offsite = "nav_scg_truck_b_areaofop"

// Landmarks for the SCG Trucks
/obj/shuttle_landmark/lift/scg_truck_camp
	name = "Boxcutters Platoon HQ"
	landmark_tag = "nav_scg_truck_a_camp"
	base_area = /area/gaia/scg
	base_turf = /turf/simulated/floor/exoplanet/concrete/reinforced

/obj/shuttle_landmark/lift/scg_truck_transit
	name = "In transit"
	landmark_tag = "nav_scg_truck_a_transit"
	base_area = /area/gaia/scg
	base_turf = /turf/simulated/floor/exoplanet/concrete/reinforced

/obj/shuttle_landmark/lift/scg_truck_areaofop
	name = "Area of Operations"
	landmark_tag = "nav_scg_truck_a_areaofop"
	flags = SLANDMARK_FLAG_AUTOSET
	base_area = /area/gaia
	base_turf = /turf/simulated/floor/exoplanet/barren

/obj/shuttle_landmark/lift/scg_truck_camp/bravo
	name = "Boxcutters Platoon HQ"
	landmark_tag = "nav_scg_truck_b_camp"

/obj/shuttle_landmark/lift/scg_truck_transit/bravo
	name = "In transit"
	landmark_tag = "nav_scg_truck_b_transit"

/obj/shuttle_landmark/lift/scg_truck_areaofop/bravo
	name = "Area of Operations"
	landmark_tag = "nav_scg_truck_b_areaofop"

/*
* -- ICCG Shuttle --
*/
/obj/machinery/computer/shuttle_control/iccg_stopa_shuttle
	name = "ICCGN 'Stopa' control console"
	shuttle_tag = "ICCGN 'Stopa' Shuttle"
	req_access = list(access_iccg_com)

/area/turbolift/iccg_stopa_shuttle
	name = "ICCGN 'Stopa' Shuttle"
	base_turf = /turf/simulated/floor/plating
	req_access = list(access_iccg)

/datum/shuttle/autodock/ferry/iccg_stopa_shuttle
	name = "ICCGN 'Stopa' Shuttle"
	shuttle_area = /area/turbolift/iccg_stopa_shuttle
	warmup_time = 4
	arrive_time = 7
	waypoint_station = "nav_iccg_stopa_shuttle_camp"
	waypoint_offsite = "nav_iccg_stopa_shuttle_areaofop"
	ceiling_type = /turf/simulated/floor/shuttle_ceiling/air

// Landmarks for the ICCG Shuttle
/obj/shuttle_landmark/lift/iccg_stopa_shuttle_base
	name = "ICCG Garrison"
	landmark_tag = "nav_iccg_stopa_shuttle_camp"
	base_area = /area/gaia/iccg
	base_turf = /turf/simulated/floor/armored

/obj/shuttle_landmark/lift/iccg_stopa_shuttle_transit
	name = "In transit"
	landmark_tag = "nav_iccg_stopa_shuttle_transit"
	base_area = /area/gaia/iccg
	base_turf = /turf/space/transit/east

/obj/shuttle_landmark/lift/iccg_stopa_shuttle_op
	name = "Area of Operations"
	landmark_tag = "nav_iccg_stopa_shuttle_areaofop"
	flags = SLANDMARK_FLAG_AUTOSET
	base_area = /area/gaia
	base_turf = /turf/simulated/floor/exoplanet/barren

/*
* -- ICCG Boat --
*/
/obj/machinery/computer/shuttle_control/iccg_masha_boat
	name = "ICCGN 'Masha' control console"
	shuttle_tag = "ICCGN 'Masha' Patrol Boat"
	req_access = list(access_iccg_com)


/area/turbolift/iccg_masha_boat
	name = "ICCGN 'Masha' Patrol Boat"
	base_turf = /turf/simulated/floor/plating
	req_access = list(access_iccg)

/datum/shuttle/autodock/ferry/iccg_masha_boat
	name = "ICCGN 'Masha' Patrol Boat"
	shuttle_area = /area/turbolift/iccg_masha_boat
	warmup_time = 10
	arrive_time = 10
	waypoint_station = "nav_iccg_masha_boat_camp"
	waypoint_offsite = "nav_iccg_masha_boat_areaofop"
	sound_takeoff = 'maps/gaia/sounds/boat_start.ogg'
	sound_landing = 'maps/gaia/sounds/boat_stop.ogg'
	knockdown = 0
	ceiling_type = /turf/simulated/open

// Landmarks for the ICCG Boat
/obj/shuttle_landmark/lift/iccg_masha_boat/base
	name = "ICCG Garrison"
	landmark_tag = "nav_iccg_masha_boat_camp"
	base_area = /area/gaia/scg
	base_turf = /turf/simulated/floor/exoplanet/water/shallow

/obj/shuttle_landmark/lift/iccg_masha_boat/transit
	name = "In transit"
	landmark_tag = "nav_iccg_masha_boat_transit"
	base_area = /area/gaia/scg
	base_turf = /turf/simulated/floor/exoplanet/water/shallow //TODO: Change this to transit turf

/obj/shuttle_landmark/lift/iccg_masha_boat/op
	name = "Area of Operations"
	landmark_tag = "nav_iccg_masha_boat_areaofop"
	flags = SLANDMARK_FLAG_AUTOSET
	base_area = /area/gaia
	base_turf = /turf/simulated/floor/exoplanet/water/shallow
