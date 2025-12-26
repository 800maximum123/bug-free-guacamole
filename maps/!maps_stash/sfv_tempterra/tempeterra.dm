#include "tempeterra_area.dm"
#include "tempeterra_shuttles.dm"

/datum/map_template/ruin/sfv_tempeterra
	name = "SFV Tempe Terra"
	id = "sfv_tempeterra"
	description = "A small, fairly modern dagger-shaped Lexington-class corvette, broadcasting SCGF codes and the designation 'SFV Tempe-Terra, LXC-7, Battle Group Bravo'"
	suffixes = list("maps/event/sfv_tempeterra/tempeterra-1.dmm","maps/event/sfv_tempeterra/tempeterra-2.dmm","maps/event/sfv_tempeterra/tempeterra-3.dmm")
	shuttles_to_initialise = list()
	apc_test_exempt_areas = list(
//		/area/tempeterra/shuttle/airlock = NO_SCRUBBER|NO_VENT,
		/area/tempeterra/armaments/storage/port = NO_SCRUBBER|NO_VENT,
		/area/tempeterra/armaments/storage/starboard = NO_SCRUBBER|NO_VENT
	)
	apc_test_exempt_areas = list(
		/area/tempeterra/shuttle/airlock = NO_SCRUBBER|NO_VENT,
		/area/tempeterra/armaments/storage/port = NO_SCRUBBER|NO_VENT,
		/area/tempeterra/armaments/storage/starboard = NO_SCRUBBER|NO_VENT
	)

/obj/overmap/visitable/sector/sfv_tempeterra_jump
	name = "Jump Drive Signature"
	desc = "Sensors readings on this sector indicate a jump pattern consistant with that of a fast moving fleet vessel."
	icon_state = "event"
	hide_from_reports = TRUE
	sensor_visibility = 10

/obj/overmap/visitable/ship/sfv_tempeterra
	name = "SFV Tempe Terra"
	desc = "A small, fairly modern dagger-shaped Lexington-class corvette, broadcasting SCGF codes and the designation 'SFV Tempe-Terra, LXC-7, Battle Group Bravo'"
	fore_dir = WEST
	vessel_size = SHIP_SIZE_SMALL
	vessel_mass = 40000

	initial_generic_waypoints = list(
		"nav_tempeterra_one",
		"nav_tempeterra_two",
		"nav_tempeterra_three",
		"nav_tempeterra_four",
		"nav_tempeterra_five",
		"nav_tempeterra_six"
	)

	initial_restricted_waypoints = list(
		"SFC Wolfe" = list("nav_hangar_tempeterra")
	)

/obj/machinery/power/apc/tempeterra
//	req_access = list(access_fleet_engineering)

/obj/machinery/alarm/tempeterra
//	req_access = list(access_fleet_engineering)

/obj/machinery/alarm/tempeterra/cold
	target_temperature = T0C+4

/obj/structure/closet/secure_closet/weapon
	name = "weapon closet"
	desc = "It's a secure wall-mounted storage unit for weapon"
	closet_appearance = /singleton/closet_appearance/wall/bomb
	anchored = TRUE
	density = FALSE
	wall_mounted = TRUE
	storage_types = CLOSET_STORAGE_ITEMS
//	req_access = list(access_medical_equip)

/singleton/closet_appearance/wall/bomb
	color = COLOR_DARK_GREEN_GRAY
	extra_decals = list(
		"stripes_closed" = COLOR_GREEN_GRAY
	)

/obj/machinery/door/airlock/hatch/maintenance
	name = "Maintenance Hatch"
	stripe_color = COLOR_AMBER

/obj/machinery/door/airlock/hatch/medbay
	stripe_color = COLOR_CYAN

/obj/machinery/door/airlock/hatch/security
	stripe_color = "#9d2300"

/obj/machinery/door/airlock/hatch/civilian
	stripe_color = COLOR_CIVIE_GREEN

/area/turbolift/tempeterralift
	name = "Engineer Bay Lift"
	icon_state = "shuttle3"
	base_turf = /turf/simulated/open
	lighting_tone = AREA_LIGHTING_COOL

/datum/shuttle/autodock/ferry/tempeterralift
	name = "engineer lift controls"
	shuttle_area = /area/turbolift/medical_lift
	warmup_time = 3
	waypoint_station = "nav_tempterra_lift_top"
	waypoint_offsite = "nav_tempterra_lift_bottom"
	sound_takeoff = 'sound/effects/lift_heavy_start.ogg'
	sound_landing = 'sound/effects/lift_heavy_stop.ogg'
	ceiling_type = null
	knockdown = 0

/obj/machinery/computer/shuttle_control/lift/tempeterra
	name = "engineer lift controls"
	shuttle_tag = "engineer lift controls"
	ui_template = "shuttle_control_console_lift.tmpl"
	icon_state = "tiny"
	icon_keyboard = "tiny_keyboard"
	icon_screen = "lift"
	density = FALSE

/obj/shuttle_landmark/lift/tempeterralift_top
	name = "Top Deck"
	landmark_tag = "nav_tempterra_lift_top"
	base_area = /area/tempeterra/engineering/reactor/fuel
	base_turf = /turf/simulated/open

/obj/shuttle_landmark/lift/tempeterralift_bottom
	name = "Lower Deck"
	landmark_tag = "nav_tempterra_lift_bottom"
	flags = SLANDMARK_FLAG_AUTOSET
	base_area = /area/tempeterra/atmos
	base_turf = /turf/simulated/floor/plating

/obj/machinery/atmospherics/unary/engine/big
	icon = 'maps/!maps_stash/sfv_tempterra/3x3_engine.dmi'
	icon_state = "huge_engine"
	moles_per_burn = 8.0
	boot_time = 70
	bound_width = 96
	bound_height = 96
	bound_y = -32
	pixel_y = -32

/obj/engine_exhaust/big
	name = "engine exhaust"
	icon = 'icons/obj/machines/ship_engine.dmi'
	icon_state = "nozzle_burn"
	light_color = "#00a2ff"
	anchored = TRUE

/obj/engine_exhaust/big/New(turf/nloc, ndir)
	..(nloc)
	nloc.hotspot_expose(1000,125)
	set_light(4, 0.5)
	set_dir(ndir)
	SetTransform(3)
	bound_width = 96
	bound_height = 96
//	spawn(20)
// 3 вправо
// 1 вверх
//		qdel(src)
