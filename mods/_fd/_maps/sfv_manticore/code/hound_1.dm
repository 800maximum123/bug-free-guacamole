/obj/overmap/visitable/ship/landable/hound_1
	name = "SFV PM-47 Hound-1"
	shuttle = "SFV PM-47 Hound-1"
	desc = "Sensor array is detecting a heavy Sol fighter transmitting Sol Fleet codes \"SFV-PM47-01\""
	icon = 'mods/_fd/_maps/sfv_manticore/icons/hound.dmi'
	icon_state = "hound"
	moving_state = "hound_moving"
	color = "#609fd2"
	fore_dir = NORTH
	dir = NORTH
	vessel_size = SHIP_SIZE_TINY
	burn_delay = 0.5 SECONDS
	hide_from_reports = TRUE
	skill_needed = SKILL_BASIC
	vessel_mass = 21000
	initial_restricted_waypoints = list(
		"Bluespace Residue" = list("nav_hound_1")
	)

/datum/map_template/ruin/away_site/hound_1
	name = "SFV PM-47 Hound-1"
	id = "away_hound_1"
	description = "."
	prefix = "mods/_fd/_maps/sfv_manticore/maps/"
	suffixes = list("hound_1.dmm")
	spawn_cost = 0.5
	area_usage_test_exempted_root_areas = /area/ship/hound_1
	shuttles_to_initialise = list(/datum/shuttle/autodock/overmap/hound_1)

/obj/machinery/computer/shuttle_control/explore/hound_1
	name = "vessel control console"
	shuttle_tag = "SFV PM-47 Hound-1"

/obj/shuttle_landmark/hound_1
	name = "SFV PM-47 Hound-1 Landing Zone"
	landmark_tag = "nav_hound_1"
	docking_controller = "hound_1_dock"
	movable_flags = MOVABLE_FLAG_EFFECTMOVE

/datum/shuttle/autodock/overmap/hound_1
	name = "SFV PM-47 Hound-1"
	warmup_time = 10
	move_time = 20
	range = 0
	shuttle_area = list(/area/ship/hound_1/hull,/area/ship/hound_1/cockpit,/area/ship/hound_1/ammunition,/area/ship/hound_1/engineering,/area/ship/hound_1/reactor)
	defer_initialisation = TRUE
	skill_needed = SKILL_BASIC
	ceiling_type = /turf/simulated/floor/shuttle_ceiling
	current_location = "nav_hound_1"

/obj/overmap/visitable/sector/hound_1
	name = "Bluespace Residue"
	desc = "/ERROR/."
	icon_state = "event"
	hide_from_reports = TRUE
	sector_flags = OVERMAP_SECTOR_IN_SPACE | OVERMAP_SECTOR_UNTARGETABLE


/area/ship/hound_1
	name = "\improper Hound-1"

/area/ship/hound_1/hull
	name = "\improper Hound-1 Hull"
	requires_power = 0

/area/ship/hound_1/cockpit
	name = "\improper Hound-1 Cockpit"

/area/ship/hound_1/ammunition
	name = "\improper Hound-1 Ammunition Section"
	has_gravity = 1

/area/ship/hound_1/engineering
	name = "\improper Hound-1 Engineering"

/area/ship/hound_1/reactor
	name = "\improper Hound-1 Reactor Core"
