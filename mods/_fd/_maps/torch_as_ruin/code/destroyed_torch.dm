/obj/overmap/visitable/sector/destroyed_torch
	name = "...𒊒𒁍..."
	desc = "ℸ ̣⍑ᓭ ̣ᒷ ᒷᔑ↸ℸ| リ𝙹 ╎∷∷ℸ ⍑ᔑʖ ̣  ∷ᔑ|𝙹ᒷᒲ⊣ℸʖ⎓𝙹"
	color = "#7500bd"
	sector_flags = OVERMAP_SECTOR_KNOWN
	icon_state = "ship"
	initial_restricted_waypoints = list(
			"GUNBOAT" = list("nav_hangar_gunboat", "nav_gunboat"),
	)
	initial_generic_waypoints = list(
		"nav_gunboat"
	)

/datum/map_template/ruin/away_site/destroyed_torch
	name = "SUNKED TORCH (Campaign)"
	id = "awaysite_dtorch"
	spawn_cost = 2
	description = "..."
	prefix = "mods/_fd/_maps/torch_as_ruin/map/"
	suffixes = list("destroyed_torch.dmm")
	area_usage_test_exempted_root_areas = list(/area/dtorch)
	apc_test_exempt_areas = list(
		/area/dtorch = NO_SCRUBBER|NO_VENT|NO_APC
	)

	shuttles_to_initialise = list(
		/datum/shuttle/autodock/overmap/gunboat,
	)

/area/dtorch
	requires_power = 0

/area/dtorch/atmosalert()
	return

/area/dtorch/fire_alert()
	return

/area/dtorch/fire_reset()
	return

/area/dtorch/readyalert()
	return

/area/dtorch/partyalert()
	return

/area/dtorch/gunboat
	name = "TORCH (ESCAPE BOAT)"

/area/dtorch/deck1
	name = "TORCH (DECK 1, INNER)"

/area/dtorch/deck1/outer
	name = "TORCH (DECK 1, OUTER)"

/area/dtorch/deck2
	name = "TORCH (DECK 2, INNER)"

/area/dtorch/deck2/outer
	name = "TORCH (DECK 2, OUTER)"

/area/dtorch/deck3
	name = "TORCH (DECK 3, INNER)"

/area/dtorch/deck3/outer
	name = "TORCH (DECK 3, OUTER)"

/area/dtorch/deck4
	name = "TORCH (DECK 4, INNER)"

/area/dtorch/deck4/outer
	name = "TORCH (DECK 4, OUTER)"

/area/dtorch/deck5
	name = "TORCH (DECK 5, INNER)"

/area/dtorch/deck5/outer
	name = "TORCH (DECK 5, OUTER)"

/area/dtorch/deck6
	name = "TORCH (DECK 6, INNER)"

/area/dtorch/deck6/outer
	name = "TORCH (DECK 6, OUTER)"

/obj/overmap/visitable/ship/landable/gunboat
	name = "Escape Boat"
	shuttle = "Escape Boat"
	desc = "Собранная на коленке лодка."
	fore_dir = NORTH
	max_speed = 1/(2 SECONDS) //same stats as charon
	burn_delay = 1 SECONDS
	vessel_mass = 5000
	skill_needed = SKILL_BASIC
	free_landing = FALSE

/obj/machinery/computer/shuttle_control/explore/gunboat
	name = "landing control console"
	shuttle_tag = "Escape Boat"

/datum/shuttle/autodock/overmap/gunboat
	name = "Escape Boat"
	move_time = 30
	shuttle_area = list(/area/dtorch/gunboat)
	current_location = "nav_hangar_gunboat"
	landmark_transition = "nav_transit_gunboat"
	range = 1
	fuel_consumption = 0
	ceiling_type = /turf/simulated/floor/shuttle_ceiling
	flags = SHUTTLE_FLAGS_PROCESS
	defer_initialisation = TRUE

/obj/shuttle_landmark/gunboat
	name = "Boat Hangar"
	landmark_tag = "nav_hangar_gunboat"
	base_area = /area/dtorch/deck4/outer

/obj/shuttle_landmark/transit/gunboat
	name = "In transit"
	landmark_tag = "nav_transit_gunboat"

/obj/item/card/id/campaign
	name = "identification card"
	desc = "A card issued to various staff."
	detail_color = COLOR_CIVIE_GREEN

/obj/item/card/id/campaign/Initialize()
	. = ..()
	access = get_all_accesses() | get_all_centcom_access()


