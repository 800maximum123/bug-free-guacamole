/obj/overmap/visitable/ship/landable/hound_2
	name = "SFV PM-47 Hound-2"
	shuttle = "SFV PM-47 Hound-2"
	desc = "Sensor array is detecting a heavy Sol fighter transmitting Sol Fleet codes \"SFV-PM47-02\""
	color = "#609fd2"
	fore_dir = NORTH
	dir = NORTH
	vessel_size = SHIP_SIZE_TINY
	burn_delay = 0.5 SECONDS
	hide_from_reports = TRUE
	skill_needed = SKILL_BASIC
	vessel_mass = 21000
	initial_restricted_waypoints = list(
		"Bluespace Residue" = list("nav_hound_2")
	)

/datum/map_template/ruin/away_site/hound_2
	name = "SFV PM-47 Hound-2"
	id = "away_hound_2"
	description = "."
	prefix = "mods/_fd/_maps/sfv_manticore/maps/"
	suffixes = list("hound_2.dmm")
	spawn_cost = 0.5
	area_usage_test_exempted_root_areas = /area/ship/hound_2
	shuttles_to_initialise = list(/datum/shuttle/autodock/overmap/hound_2)

/obj/machinery/computer/shuttle_control/explore/hound_2
	name = "vessel control console"
	shuttle_tag = "SFV PM-47 Hound-2"

/obj/shuttle_landmark/hound_2
	name = "SFV PM-47 Hound-2 Landing Zone"
	landmark_tag = "nav_hound_2"
	docking_controller = "hound_2_dock"
	movable_flags = MOVABLE_FLAG_EFFECTMOVE

/datum/shuttle/autodock/overmap/hound_2
	name = "SFV PM-47 Hound-2"
	warmup_time = 10
	move_time = 20
	range = 0
	shuttle_area = list(/area/ship/hound_2,/area/ship/hound_2/hull,/area/ship/hound_2/cockpit,/area/ship/hound_2/ammunition,/area/ship/hound_2/engineering,/area/ship/hound_2/reactor)
	defer_initialisation = TRUE
	skill_needed = SKILL_BASIC
	ceiling_type = /turf/simulated/floor/shuttle_ceiling
	current_location = "nav_hound_2"

/obj/overmap/visitable/sector/hound_2
	name = "Bluespace Residue"
	desc = "/ERROR/."
	icon_state = "event"
	hide_from_reports = TRUE
	sector_flags = OVERMAP_SECTOR_IN_SPACE | OVERMAP_SECTOR_UNTARGETABLE


/area/ship/hound_2
	name = "\improper Hound-2"

/area/ship/hound_2/hull
	name = "\improper Hound-2 Hull"
	requires_power = 0

/area/ship/hound_2/cockpit
	name = "\improper Hound-2 Cockpit"

/area/ship/hound_2/ammunition
	name = "\improper Hound-2 Ammunition Section"

/area/ship/hound_2/engineering
	name = "\improper Hound-2 Engineering"

/area/ship/hound_2/reactor
	name = "\improper Hound-2 Reactor Core"
