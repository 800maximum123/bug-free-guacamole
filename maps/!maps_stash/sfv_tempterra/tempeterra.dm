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

/obj/machinery/door/airlock/hatch
	airlock_type = "hatch"
	name = "\improper Airtight Hatch"
	icon = 'icons/obj/doors/hatch/door.dmi'
	fill_file = 'icons/obj/doors/hatch/fill_steel.dmi'
	stripe_file = 'icons/obj/doors/hatch/stripe.dmi'
	stripe_fill_file = 'icons/obj/doors/hatch/fill_stripe.dmi'
	bolts_file = 'icons/obj/doors/hatch/lights_bolts.dmi'
	deny_file = 'icons/obj/doors/hatch/lights_deny.dmi'
	lights_file = 'icons/obj/doors/hatch/lights_green.dmi'
	panel_file = 'icons/obj/doors/hatch/panel.dmi'
	welded_file = 'icons/obj/doors/hatch/welded.dmi'
	emag_file = 'icons/obj/doors/hatch/emag.dmi'
	explosion_resistance = 20
	opacity = 1
	assembly_type = /obj/structure/door_assembly/door_assembly_hatch
	paintable = AIRLOCK_PAINTABLE_STRIPE

/obj/machinery/door/airlock/hatch/maintenance
	name = "Maintenance Hatch"
	stripe_color = COLOR_AMBER

/obj/machinery/door/airlock/hatch/medbay
	stripe_color = COLOR_CYAN

/obj/machinery/door/airlock/hatch/security
	stripe_color = "#9d2300"

/obj/machinery/door/airlock/hatch/civilian
	stripe_color = COLOR_CIVIE_GREEN
