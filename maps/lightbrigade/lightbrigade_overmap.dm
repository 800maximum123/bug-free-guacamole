/obj/overmap/visitable/ship/lightbrigade
	name = "SFV Lightbrigade"
	desc = "A small armed ship about the size of a corvette; hull deflects thorough scans." //designation \"SFV Lightbrigade, NVT-23-13-S\"
	fore_dir = WEST
	vessel_mass = 80000
	color = "#0751f3"
	alpha = 50
	burn_delay = 1 SECONDS
	sector_flags = OVERMAP_SECTOR_KNOWN|OVERMAP_SECTOR_IN_SPACE|OVERMAP_SECTOR_BASE
	known_ships = list(
		/obj/overmap/visitable/ship/landable/scout_shuttle,
		/obj/overmap/visitable/ship/landable/dropship
	)

	initial_restricted_waypoints = list(
		"Scout Shuttle" = list("nav_hangar_scout"), 	//can't have random shuttles popping inside the ship
		"Dropship" = list("nav_hangar_dropship"),
		"Skrellian Scout" = list("nav_skrellscout_dock"), //restricts Skrell Scoutship specific docking waypoint on deck 4 portside
		"Skrellian Shuttle" = list("nav_skrellscoutsh_altdock"),
		"Rescue" = list("nav_ert_dock"), //restricts ERT Shuttle specific docking waypoint on deck 4 portside
		"ITV The Reclaimer" = list("nav_hangar_gantry_torch"), //gantry shuttles
		"ITV Vulcan" = list("nav_hangar_gantry_torch_two"),
		"ITV Spiritus" = list("nav_hangar_gantry_torch_three"),
		"SRV Venerable Catfish" = list("nav_verne_5"), //docking location for verne shuttle
		"Cyclopes" = list("nav_merc_dock"),
		"ICGNV Hound" = list("nav_hound_dock"),
		"SFV Arbiter" = list("nav_sfv_arbiter_dock")
	)

	initial_generic_waypoints = list(
		//start Lower Deck
		"nav_merc_deck1",
		"nav_ninja_deck1",
		"nav_skipjack_deck1",
		"nav_ert_deck4",
		"nav_deck4_scout",
		"nav_deck4_dropship",

		//start Middle Deck
		"nav_merc_deck2",
		"nav_ninja_deck2",
		"nav_skipjack_deck2",
		"nav_ert_deck3",
		"nav_deck3_scout",
		"nav_deck3_dropship",

		//start Upper Deck
		"nav_merc_deck3",
		"nav_ninja_deck3",
		"nav_skipjack_deck3",
		"nav_ert_deck2",
		"nav_deck2_scout",
		"nav_deck2_dropship",

	)

/obj/overmap/visitable/ship/landable/scout_shuttle
	name = "Hunter"
	desc = "Sensor scans detect a small armed craft utilising grav-dampening and thermal stealth technology. The hull appears to be deflecting further scan attempts."
	shuttle = "Hunter"
	max_speed = 1/(2 SECONDS)
	burn_delay = 0 SECONDS //very fast
	color = "#0751f3"
	alpha = 10
	vessel_mass = 3000
	fore_dir = WEST
	skill_needed = SKILL_TRAINED //Hunter isn't exactly easy to handle. Might be redundant
	vessel_size = SHIP_SIZE_TINY
	known_ships = list(
		/obj/overmap/visitable/ship/lightbrigade,
		/obj/overmap/visitable/ship/landable/dropship,
	)

/obj/overmap/visitable/ship/landable/dropship //custom gunship-dropship hybrid. How do you combine both? Look at Mi-24.
	name = "Raider"
	desc = "A heavily-armed shuttle-sized gunship, doesn't match any publicly known blueprint. It broadcasts SCG Fifth Fleet codes and the callsign \"Raider\"."
	shuttle = "Raider"
	color = "#0751f3"
	vessel_mass = 5000
	max_speed = 1/(1 SECONDS)
	burn_delay = 0.5 SECONDS //fast, but not insanely
	fore_dir = WEST
	vessel_size = SHIP_SIZE_SMALL
	known_ships = list(
		/obj/overmap/visitable/ship/lightbrigade,
		/obj/overmap/visitable/ship/landable/scout_shuttle
	)

/obj/machinery/computer/shuttle_control/explore/dropship
	name = "raider control console"
	shuttle_tag = "Raider"
	req_access = list(access_aquila_helm)

/obj/machinery/computer/shuttle_control/explore/scout_shuttle
	name = "hunter control console"
	shuttle_tag = "Hunter"
	req_access = list(access_expedition_shuttle_helm)
