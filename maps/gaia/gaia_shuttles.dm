/datum/shuttle/autodock/ferry/gaia
	name = "base gaian shuttle"
	// Whether we should show a launch msg
	var/launch_msg_toggle = TRUE
	// Whether we've shown the initial launch message to occupants
	var/launch_msg_shown = FALSE
	// Dramatic musical sting when shuttle lands
	var/sting = 'maps/gaia/sounds/arrivesting.ogg'

// Show a one-time start credits style message to all occupants when the truck first launches
/datum/shuttle/autodock/ferry/gaia/short_jump(destination)
	..()

	if(!launch_msg_shown)
		launch_msg_shown = TRUE
		var/area_name = istype(destination, /obj/shuttle_landmark) ? "[destination]" : "Area of Operations"
		var/time_text = stationtime2text()
		var/date_text = GLOB.using_map.game_year ? "Galactic Year [GLOB.using_map.game_year]" : "Unknown Date"

		var/obj/screen/novel_message/start_credits/big_nofade/visuals = new /obj/screen/novel_message/start_credits/nofade_simple()
		visuals.maptext_x = -10
		visuals.maptext_y = -70
		for(var/area/A in src.shuttle_area)
			for(var/mob/M in A)
				if(M.client)
					M.client.screen += visuals
//					playsound(M, sting, 70, 0, -1)
					sound_to(M, sting)

		visuals.set_text("[area_name]", COLOR_WHITE, time = 15 SECONDS)
		sleep(3)
		visuals.set_text("[area_name]\nTime: [time_text]", COLOR_WHITE, time = 15 SECONDS)
		sleep(3)
		visuals.set_text("[area_name]\nTime: [time_text]\nDate: [date_text]", COLOR_WHITE, time = 30 SECONDS)

/*
* -- SCG Trucks --
*/
/obj/machinery/computer/shuttle_control/scg_truck
	icon = 'maps/gaia/icons/truck.dmi'
	icon_state = "half_computer"
	icon_keyboard = "car_key"
	icon_screen = "car"
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

/datum/shuttle/autodock/ferry/gaia/scg_truck
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

/datum/shuttle/autodock/ferry/gaia/scg_truck/bravo
	name = "SCG Truck Bravo"
	shuttle_area = /area/turbolift/scg_truck/bravo
	waypoint_station = "nav_scg_truck_b_camp"
	waypoint_offsite = "nav_scg_truck_b_areaofop"

// Landmarks for the SCG Trucks
/obj/shuttle_landmark/lift/scg_truck/base
	name = "Boxcutters Platoon HQ"
	landmark_tag = "nav_scg_truck_a_camp"
	base_area = /area/gaia/scg
	base_turf = /turf/simulated/floor/exoplanet/concrete/reinforced

/obj/shuttle_landmark/lift/scg_truck/transit
	name = "In transit"
	landmark_tag = "nav_scg_truck_a_transit"
	base_area = /area/gaia/scg
	base_turf = /turf/simulated/floor/exoplanet/concrete/reinforced

/obj/shuttle_landmark/lift/scg_truck/areaofop
	name = "Area of Operations"
	landmark_tag = "nav_scg_truck_a_areaofop"
	flags = SLANDMARK_FLAG_AUTOSET
	base_area = /area/gaia
	base_turf = /turf/simulated/floor/exoplanet/barren

/obj/shuttle_landmark/lift/scg_truck/base/bravo
	name = "Boxcutters Platoon HQ"
	landmark_tag = "nav_scg_truck_b_camp"

/obj/shuttle_landmark/lift/scg_truck/transit/bravo
	name = "In transit"
	landmark_tag = "nav_scg_truck_b_transit"

/obj/shuttle_landmark/lift/scg_truck/areaofop/bravo
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

/datum/shuttle/autodock/ferry/gaia/iccg_stopa_shuttle
	name = "ICCGN 'Stopa' Shuttle"
	shuttle_area = /area/turbolift/iccg_stopa_shuttle
	warmup_time = 4
	arrive_time = 7
	waypoint_station = "nav_iccg_stopa_shuttle_camp"
	waypoint_offsite = "nav_iccg_stopa_shuttle_areaofop"
	ceiling_type = /turf/simulated/floor/shuttle_ceiling/air

// Landmarks for the ICCG Shuttle
/obj/shuttle_landmark/lift/iccg_stopa_shuttle/base
	name = "ICCG Garrison"
	landmark_tag = "nav_iccg_stopa_shuttle_camp"
	base_area = /area/gaia/iccg
	base_turf = /turf/simulated/floor/armored

/obj/shuttle_landmark/lift/iccg_stopa_shuttle/transit
	name = "In transit"
	landmark_tag = "nav_iccg_stopa_shuttle_transit"
	base_area = /area/gaia/iccg
	base_turf = /turf/space/transit/east

/obj/shuttle_landmark/lift/iccg_stopa_shuttle/op
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

/datum/shuttle/autodock/ferry/gaia/iccg_masha_boat
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

/*
* -- ICCG Trucks --
*/
/obj/machinery/computer/shuttle_control/iccg_truck
	icon = 'maps/gaia/icons/truck.dmi'
	icon_state = "half_computer"
	icon_keyboard = "car_key"
	icon_screen = "car"
	name = "MP truck control console"
	shuttle_tag = "ICCG MP Truck"
	req_access = list(access_iccg_com)

/obj/machinery/computer/shuttle_control/iccg_truck/medical
	name = "medical truck control console"
	shuttle_tag = "ICCG Medical Truck"

/area/turbolift/iccg_truck
	name = "ICCG baseline Truck area"
	base_turf = /turf/simulated/floor/plating
	req_access = list(access_iccg)

/area/turbolift/iccg_truck/mp
	name = "ICCG MP Truck"

/area/turbolift/iccg_truck/medical
	name = "ICCG Medical Truck"

/datum/shuttle/autodock/ferry/gaia/iccg_truck
	name = "ICCG MP Truck"
	shuttle_area = /area/turbolift/iccg_truck/mp
	warmup_time = 6
	arrive_time = 10
	waypoint_station = "nav_iccg_truck_mp_camp"
	waypoint_offsite = "nav_iccg_truck_mp_areaofop"
	sound_takeoff = 'maps/gaia/sounds/truck_start.ogg'
	sound_landing = 'maps/gaia/sounds/truck_stop.ogg'
	ceiling_type = /turf/simulated/floor/reinforced/airmix
	knockdown = 0

/datum/shuttle/autodock/ferry/gaia/iccg_truck/medical
	name = "ICCG Medical Truck"
	shuttle_area = /area/turbolift/iccg_truck/medical
	waypoint_station = "nav_iccg_truck_medical_camp"
	waypoint_offsite = "nav_iccg_truck_medical_areaofop"

// Landmarks for the ICCG Trucks
/obj/shuttle_landmark/lift/iccg_truck/base
	name = "Morskiye Draguny HQ"
	landmark_tag = "nav_iccg_truck_mp_camp"
	base_area = /area/gaia/iccg
	base_turf = /turf/simulated/floor/exoplanet/concrete/reinforced

/obj/shuttle_landmark/lift/iccg_truck/transit
	name = "In transit"
	landmark_tag = "nav_iccg_truck_mp_transit"
	base_area = /area/gaia/iccg
	base_turf = /turf/simulated/floor/exoplanet/concrete/reinforced

/obj/shuttle_landmark/lift/iccg_truck/areaofop
	name = "Area of Operations"
	landmark_tag = "nav_iccg_truck_mp_areaofop"
	flags = SLANDMARK_FLAG_AUTOSET
	base_area = /area/gaia
	base_turf = /turf/simulated/floor/exoplanet/barren

/obj/shuttle_landmark/lift/iccg_truck/base/medical
	name = "Morskiye Draguny HQ"
	landmark_tag = "nav_iccg_truck_medical_camp"

/obj/shuttle_landmark/lift/iccg_truck/transit/medical
	name = "In transit"
	landmark_tag = "nav_iccg_truck_medical_transit"

/obj/shuttle_landmark/lift/iccg_truck/areaofop/medical
	name = "Area of Operations"
	landmark_tag = "nav_iccg_truck_medical_areaofop"
