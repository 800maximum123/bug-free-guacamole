/* //nope.
/obj/turbolift_map_holder/lightbrigade
	name = "Lightbrigade turbolift map placeholder"
	depth = 3
	lift_size_x = 6
	lift_size_y = 4

	areas_to_use = list(
		/area/turbolift/lbrig_lower,
		/area/turbolift/lbrig_middle,
		/area/turbolift/lbrig_upper
		)
*/

/obj/machinery/computer/shuttle_control/lift/supplymain
	name = "cargo lift controls"
	shuttle_tag = "Primary Cargo Lift"
	ui_template = "shuttle_control_console_lift.tmpl"
	icon_state = "tiny"
	icon_keyboard = "tiny_keyboard"
	icon_screen = "lift"
	density = FALSE

/obj/machinery/computer/shuttle_control/lift/ammo_port
	name = "munitions lift controls"
	shuttle_tag = "Robotics Lift"
	ui_template = "shuttle_control_console_lift.tmpl"
	icon_state = "tiny"
	icon_keyboard = "tiny_keyboard"
	icon_screen = "lift"
	density = FALSE

/obj/machinery/computer/shuttle_control/lift/ammo_starboard
	name = "munitions lift controls"
	shuttle_tag = "Medical Lift"
	ui_template = "shuttle_control_console_lift.tmpl"
	icon_state = "tiny"
	icon_keyboard = "tiny_keyboard"
	icon_screen = "lift"
	density = FALSE

/datum/shuttle/autodock/ferry/supplymain
	name = "Primary Cargo Lift"
	shuttle_area = /area/turbolift/cargo_lift
	warmup_time = 3
	waypoint_station = "nav_cargo_lift_top"
	waypoint_offsite = "nav_cargo_lift_bottom"
	sound_takeoff = 'sound/effects/lift_heavy_start.ogg'
	sound_landing = 'sound/effects/lift_heavy_stop.ogg'
	ceiling_type = null
	knockdown = 0

/datum/shuttle/autodock/ferry/ammo_port_lift
	name = "Port Munitions Lift"
	shuttle_area = /area/turbolift/ammo_pt_lift
	warmup_time = 3
	waypoint_station = "nav_ammopt_lift_top"
	waypoint_offsite = "nav_ammopt_lift_bottom"
	sound_takeoff = 'sound/effects/lift_heavy_start.ogg'
	sound_landing = 'sound/effects/lift_heavy_stop.ogg'
	ceiling_type = null
	knockdown = 0

/datum/shuttle/autodock/ferry/ammo_starboard_lift
	name = "Starboard Munitions Lift"
	shuttle_area = /area/turbolift/ammo_sb_lift
	warmup_time = 3
	waypoint_station = "nav_ammosb_lift_top"
	waypoint_offsite = "nav_ammosb_lift_bottom"
	sound_takeoff = 'sound/effects/lift_heavy_start.ogg'
	sound_landing = 'sound/effects/lift_heavy_stop.ogg'
	ceiling_type = null
	knockdown = 0

/obj/shuttle_landmark/lift/cargo_top
	name = "Top Deck"
	landmark_tag = "nav_cargo_lift_top"
	base_area = /area/storage/cargo
	base_turf = /turf/simulated/open

/obj/shuttle_landmark/lift/cargo_bottom
	name = "Lower Deck"
	landmark_tag = "nav_cargo_lift_bottom"
	flags = SLANDMARK_FLAG_AUTOSET
	base_area = /area/quartermaster/storage
	base_turf = /turf/simulated/floor/plating

/obj/shuttle_landmark/lift/ammopt_top
	name = "Top Deck"
	landmark_tag = "nav_ammopt_lift_top"
	base_area = /area/maintenance/middle/ptfin
	base_turf = /turf/simulated/open

/obj/shuttle_landmark/lift/ammopt_bottom
	name = "Lower Deck"
	landmark_tag = "nav_ammopt_lift_bottom"
	flags = SLANDMARK_FLAG_AUTOSET
	base_area = /area/quartermaster/ptammo_main
	base_turf = /turf/simulated/floor/plating

/obj/shuttle_landmark/lift/ammosb_top
	name = "Top Deck"
	landmark_tag = "nav_ammosb_lift_top"
	base_area = /area/maintenance/middle/sbfin
	base_turf = /turf/simulated/open

/obj/shuttle_landmark/lift/ammosb_bottom
	name = "Lower Deck"
	landmark_tag = "nav_ammosb_lift_bottom"
	flags = SLANDMARK_FLAG_AUTOSET
	base_area = /area/quartermaster/sbammo_main
	base_turf = /turf/simulated/floor/plating
