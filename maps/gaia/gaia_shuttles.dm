/*
* -- SCG Trucks --
*/
/obj/machinery/computer/shuttle_control/scg_truck
	name = "alpha truck control console"
	shuttle_tag = "SCG Truck A"

/obj/machinery/computer/shuttle_control/scg_truck/bravo
	name = "bravo truck control console"
	shuttle_tag = "SCG Truck B"

/area/turbolift/scg_truck
	name = "SCG Truck Alpha"
	base_turf = /turf/simulated/floor/plating

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
