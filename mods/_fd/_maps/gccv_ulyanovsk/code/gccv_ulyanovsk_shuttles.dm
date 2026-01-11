// GCCV ULYANOVSK SHUTTLES

/obj/machinery/computer/ship/helm/ulyanovsk
	accellimit = 0.005
	req_access = list(access_iccg)

/obj/machinery/computer/ship/helm/ulyanovsk/command
	req_access = list(access_iccg_com)

/obj/item/stock_parts/circuitboard/helm/ulyanovsk
	name = "C.B. (helm control console) - GCCV Ulyanovsk"
	build_path = /obj/machinery/computer/ship/helm/ulyanovsk

/obj/item/stock_parts/circuitboard/helm/ulyanovsk/command
	name = "C.B. (helm control console) - GCCV Ulyanovsk (Command)"
	build_path = /obj/machinery/computer/ship/helm/ulyanovsk/command

/turf/simulated/floor/shuttle_ceiling/ulyanovsk
	color = COLOR_DARK_BLUE_GRAY
	icon = 'mods/_fd/_maps/gccv_ulyanovsk/icons/ulyanovsk.dmi'
	icon_state = "reinforced"
	initial_flooring = /singleton/flooring/armored

/obj/shuttle_landmark/ulyanovsk
	base_area = /area/map_template/gccv_ulyanovsk
	base_turf = /turf/space

// -= S H U T T L E S =-

/datum/shuttle/autodock/overmap/ul_typhoon //shuttle datum
	name = "GCCS TYPHOON"
	shuttle_area = list(/area/ship/ulyanovsk/ul_typhoon/central,/area/ship/ulyanovsk/ul_typhoon/fore,/area/ship/ulyanovsk/ul_typhoon/aft)
	dock_target = "typhoon1_dock"
	current_location = "nav_ul_typhoon_start"
	flags = SHUTTLE_FLAGS_PROCESS
	ceiling_type = /turf/simulated/floor/shuttle_ceiling/ulyanovsk
	warmup_time = 5
	range = 0
	skill_needed = SKILL_BASIC
	defer_initialisation = TRUE

/obj/overmap/visitable/ship/landable/ul_typhoon //shuttle overmap object
	name = "GCCS TYPHOON"
	desc = {"%#0&#%01#<br>
			RECEIVING CODES... ... ...<br>
			GCCS TYPHOON<br>
			REQUESTING TECHNICAL PARAMETERS... ... ...<br>
			BASE:<br>
			Combat Scout Interceptor<br>
			Gilgamesh Colonial Confederation<br>
			C.O.L Shipyards<br>
			OTHER:<br>
			%# RECEIVING INTERRUPTED... ... ...<br>
			ABORTING... ... COMPLETED"}
	shuttle = "GCCS TYPHOON"
	fore_dir = WEST
	vessel_size = SHIP_SIZE_SMALL
	vessel_mass = 4000
	color = "#304b86"
	known_ships = list(
		/obj/overmap/visitable/ship/gccv_ulyanovsk,
		/obj/overmap/visitable/ship/landable/ul_uragan,
		/obj/overmap/visitable/ship/landable/ul_hyacinth,
		/obj/overmap/visitable/ship/landable/ul_tachyon
	)

/obj/machinery/computer/shuttle_control/explore/ul_typhoon //shuttle control console
	name = "GCCS TYPHOON Control"
	shuttle_tag = "GCCS TYPHOON"
	req_access = list(access_iccg)

/obj/shuttle_landmark/ulyanovsk/typhoon //shuttle NAV landmarks
	landmark_tag = "nav_ul_typhoon_start"
	name = "GCCS TYPHOON Dock"
	docking_controller = "typhoon1_dock_base"

/area/ship/ulyanovsk/ul_typhoon
	name = "\improper GCCS TYPHOON"
	icon_state = "yellow"
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED
	req_access = list(access_iccg)

/area/ship/ulyanovsk/ul_typhoon/central //shuttle areas
	name = "\improper GCCS TYPHOON Main"

/area/ship/ulyanovsk/ul_typhoon/fore
	name = "\improper GCCS TYPHOON Fore"

/area/ship/ulyanovsk/ul_typhoon/aft
	name = "\improper GCCS TYPHOON Aft"



/datum/shuttle/autodock/overmap/ul_uragan //shuttle datum
	name = "GCCS URAGAN"
	shuttle_area = list(/area/ship/ulyanovsk/ul_uragan/central,/area/ship/ulyanovsk/ul_uragan/fore,/area/ship/ulyanovsk/ul_uragan/aft)
	dock_target = "uragan1_dock"
	current_location = "nav_ul_uragan_start"
	flags = SHUTTLE_FLAGS_PROCESS
	ceiling_type = /turf/simulated/floor/shuttle_ceiling/ulyanovsk
	warmup_time = 5
	range = 0
	skill_needed = SKILL_BASIC
	defer_initialisation = TRUE

/obj/overmap/visitable/ship/landable/ul_uragan //shuttle overmap object
	name = "GCCS URAGAN"
	desc = {"%#0&#%01#<br>
			RECEIVING CODES... ... ...<br>
			GCCS URAGAN<br>
			REQUESTING TECHNICAL PARAMETERS... ... ...<br>
			BASE:<br>
			Combat Support Interceptor<br>
			Gilgamesh Colonial Confederation<br>
			C.O.L Shipyards<br>
			OTHER:<br>
			%# RECEIVING INTERRUPTED... ... ...<br>
			ABORTING... ... COMPLETED"}
	shuttle = "GCCS URAGAN"
	fore_dir = WEST
	vessel_size = SHIP_SIZE_SMALL
	vessel_mass = 4000
	color = "#183064"
	known_ships = list(
		/obj/overmap/visitable/ship/landable/ul_typhoon,
		/obj/overmap/visitable/ship/gccv_ulyanovsk,
		/obj/overmap/visitable/ship/landable/ul_hyacinth,
		/obj/overmap/visitable/ship/landable/ul_tachyon
	)

/obj/machinery/computer/shuttle_control/explore/ul_uragan //shuttle control console
	name = "GCCS URAGAN Control"
	shuttle_tag = "GCCS URAGAN"
	req_access = list(access_iccg)

/obj/shuttle_landmark/ulyanovsk/uragan //shuttle NAV landmarks
	landmark_tag = "nav_ul_uragan_start"
	name = "GCCS URAGAN Dock"
	docking_controller = "uragan1_dock_base"

/area/ship/ulyanovsk/ul_uragan
	name = "\improper GCCS URAGAN"
	icon_state = "yellow"
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED
	req_access = list(access_iccg)

/area/ship/ulyanovsk/ul_uragan/central //shuttle areas
	name = "\improper GCCS URAGAN Main"

/area/ship/ulyanovsk/ul_uragan/fore
	name = "\improper GCCS URAGAN Fore"

/area/ship/ulyanovsk/ul_uragan/aft
	name = "\improper GCCS URAGAN Aft"



/datum/shuttle/autodock/overmap/ul_hyacinth //shuttle datum
	name = "GCCS HYACINTH"
	shuttle_area = list(/area/ship/ulyanovsk/ul_hyacinth/central,/area/ship/ulyanovsk/ul_hyacinth/fore,/area/ship/ulyanovsk/ul_hyacinth/aft)
	dock_target = "hyacinth1_dock"
	current_location = "nav_ul_hyacinth_start"
	flags = SHUTTLE_FLAGS_PROCESS
	ceiling_type = /turf/simulated/floor/shuttle_ceiling/ulyanovsk
	warmup_time = 5
	range = 0
	knockdown = FALSE
	skill_needed = SKILL_BASIC
	defer_initialisation = TRUE

/obj/overmap/visitable/ship/landable/ul_hyacinth //shuttle overmap object
	name = "GCCS HYACINTH"
	desc = {"%#0&#%01#<br>
			RECEIVING CODES... ... ...<br>
			GCCS HYACINTH<br>
			REQUESTING TECHNICAL PARAMETERS... ... ...<br>
			BASE:<br>
			Boarding Craft<br>
			Gilgamesh Colonial Confederation<br>
			C.O.L Shipyards<br>
			OTHER:<br>
			%# RECEIVING INTERRUPTED... ... ...<br>
			ABORTING... ... COMPLETED"}
	shuttle = "GCCS HYACINTH"
	fore_dir = NORTH
	vessel_size = SHIP_SIZE_SMALL
	vessel_mass = 4000
	color = "#1e502d"
	known_ships = list(
		/obj/overmap/visitable/ship/landable/ul_typhoon,
		/obj/overmap/visitable/ship/landable/ul_uragan,
		/obj/overmap/visitable/ship/gccv_ulyanovsk,
		/obj/overmap/visitable/ship/landable/ul_tachyon
	)

/obj/machinery/computer/shuttle_control/explore/ul_hyacinth //shuttle control console
	name = "GCCS HYACINTH Control"
	shuttle_tag = "GCCS HYACINTH"
	req_access = list(access_iccg)

/obj/shuttle_landmark/ulyanovsk/hyacinth //shuttle NAV landmarks
	landmark_tag = "nav_ul_hyacinth_start"
	name = "GCCS HYACINTH Dock"
	docking_controller = "hyacinth1_dock_base"

/area/ship/ulyanovsk/ul_hyacinth
	name = "\improper GCCS HYACINTH"
	icon_state = "yellow"
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED
	req_access = list(access_iccg)

/area/ship/ulyanovsk/ul_hyacinth/central //shuttle areas
	name = "\improper GCCS HYACINTH Main"

/area/ship/ulyanovsk/ul_hyacinth/fore
	name = "\improper GCCS HYACINTH Fore"

/area/ship/ulyanovsk/ul_hyacinth/aft
	name = "\improper GCCS HYACINTH Aft"



/datum/shuttle/autodock/overmap/ul_tachyon //shuttle datum
	name = "GCCS TACHYON"
	shuttle_area = list(/area/ship/ulyanovsk/ul_tachyon/central,/area/ship/ulyanovsk/ul_tachyon/fore,/area/ship/ulyanovsk/ul_tachyon/aft)
	dock_target = "tachyon1_dock"
	current_location = "nav_ul_tachyon_start"
	flags = SHUTTLE_FLAGS_PROCESS
	ceiling_type = /turf/simulated/floor/shuttle_ceiling/ulyanovsk
	warmup_time = 5
	range = 0
	skill_needed = SKILL_BASIC
	defer_initialisation = TRUE

/obj/overmap/visitable/ship/landable/ul_tachyon //shuttle overmap object
	name = "GCCS TACHYON"
	desc = {"%#0&#%01#<br>
			RECEIVING CODES... ... ...<br>
			GCCS TACHYON<br>
			REQUESTING TECHNICAL PARAMETERS... ... ...<br>
			BASE:<br>
			Heavy Fighter<br>
			Gilgamesh Colonial Confederation<br>
			C.O.L Shipyards<br>
			OTHER:<br>
			%# RECEIVING INTERRUPTED... ... ...<br>
			ABORTING... ... COMPLETED"}
	shuttle = "GCCS TACHYON"
	fore_dir = SOUTH
	vessel_size = SHIP_SIZE_SMALL
	vessel_mass = 4000
	color = "#940004"
	known_ships = list(
		/obj/overmap/visitable/ship/landable/ul_typhoon,
		/obj/overmap/visitable/ship/landable/ul_uragan,
		/obj/overmap/visitable/ship/landable/ul_hyacinth,
		/obj/overmap/visitable/ship/gccv_ulyanovsk
	)

/obj/machinery/computer/shuttle_control/explore/ul_tachyon //shuttle control console
	name = "GCCS TACHYON Control"
	shuttle_tag = "GCCS TACHYON"
	req_access = list(access_iccg)

/obj/shuttle_landmark/ulyanovsk/tachyon //shuttle NAV landmarks
	landmark_tag = "nav_ul_tachyon_start"
	name = "GCCS TACHYON Dock"
	docking_controller = "tachyon1_dock_base"

/area/ship/ulyanovsk/ul_tachyon
	name = "\improper GCCS TACHYON"
	icon_state = "yellow"
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED
	req_access = list(access_iccg)

/area/ship/ulyanovsk/ul_tachyon/central //shuttle areas
	name = "\improper GCCS TACHYON Main"

/area/ship/ulyanovsk/ul_tachyon/fore
	name = "\improper GCCS TACHYON Fore"

/area/ship/ulyanovsk/ul_tachyon/aft
	name = "\improper GCCS TACHYON Aft"
