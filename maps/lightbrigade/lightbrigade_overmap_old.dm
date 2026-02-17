/obj/effect/overmap/visitable/ship/lightbrigade
	name = "SFV Lightbrigade"
	desc = "A small warship about the size of a corvette; hull deflects thorough scans." //designation \"SFV Lightbrigade, NVT-23-13-S\"
	fore_dir = WEST
	dir = WEST
	vessel_mass = 80000
	color = "#0751f3"
	alpha = 30
	integrity_failure_cap = 420
	repair_speed = 0.01
	burn_delay = 1 SECONDS
	base = TRUE
	sector_flags = OVERMAP_SECTOR_KNOWN|OVERMAP_SECTOR_IN_SPACE|OVERMAP_SECTOR_BASE

	initial_restricted_waypoints = list(
		"Scout Shuttle" = list("nav_hangar_scout"), 	//can't have random shuttles popping inside the ship
		"Dropship" = list("nav_hangar_dropship"),
		"Ascent Caulship" = list("nav_ascent_caulship_torch"), //restricts caulship specific docking waypoint on deck 4 starboard side
		"Skrellian Scout" = list("nav_skrellscout_dock"), //restricts Skrell Scoutship specific docking waypoint on deck 4 portside
		"Skrellian Shuttle" = list("nav_skrellscoutsh_altdock"),
		"Rescue" = list("nav_ert_dock"), //restricts ERT Shuttle specific docking waypoint on deck 4 portside
		"ITV The Reclaimer" = list("nav_hangar_gantry_torch"), //gantry shuttles
		"ITV Vulcan" = list("nav_hangar_gantry_torch_two"),
		"ITV Spiritus" = list("nav_hangar_gantry_torch_three"),
		"SRV Venerable Catfish" = list("nav_verne_5"), //docking location for verne shuttle
		"Cyclopes" = list("nav_merc_dock")
	)

	initial_generic_waypoints = list(

		//start Lower Deck
		"nav_merc_deck1",
		"nav_ninja_deck1",
		"nav_skipjack_deck1",
		"nav_ert_deck1",
		"nav_deck4_scout",
		"nav_deck4_dropship",

		//start Middle Deck
		"nav_merc_deck2",
		"nav_ninja_deck2",
		"nav_skipjack_deck2",
		"nav_ert_deck2",
		"nav_deck3_scout",
		"nav_deck3_dropship",

		//start Upper Deck
		"nav_merc_deck3",
		"nav_ninja_deck3",
		"nav_skipjack_deck3",
		"nav_ert_deck3",
		"nav_deck2_scout",
		"nav_deck2_dropship",

	)

/obj/effect/overmap/visitable/ship/landable/scout_shuttle
	name = "Hunter"
	desc = "Sensor scans detect a small armed craft utilising grav-dampening and thermal stealth technology. The hull appears to be deflecting further scan attempts."
	shuttle = "Hunter"
	max_speed = 1/(2 SECONDS)
	burn_delay = 0 SECONDS //very fast
	color = "#0751f3"
	alpha = 10
	integrity_failure_cap = 35
	vessel_mass = 3000
	fore_dir = WEST
	vessel_size = SHIP_SIZE_TINY

/obj/effect/overmap/visitable/ship/landable/dropship //custom gunship-dropship hybrid. How do you combine both? Look at Mi-24.
	name = "Raider"
	desc = "A heavily-armed shuttle-sized gunship, doesn't match any publicly known blueprint. It broadcasts SCG Fifth Fleet codes and the callsign \"Raider\"."
	shuttle = "Raider"
	color = "#0751f3"
	integrity_failure_cap = 60
	vessel_mass = 5000
	max_speed = 1/(1 SECONDS)
	burn_delay = 0.5 SECONDS //fast
	fore_dir = WEST
	vessel_size = SHIP_SIZE_TINY

/obj/machinery/computer/shuttle_control/explore/dropship
	name = "Raider control console"
	shuttle_tag = "Raider"
	req_access = list(access_aquila_helm)

/obj/machinery/computer/shuttle_control/explore/scout_shuttle
	name = "Hunter control console"
	shuttle_tag = "Hunter"
	req_access = list(access_expedition_shuttle_helm)

/obj/effect/overmap/visitable/ship/lightbrigade/Initialize()
	. = ..()

	var/obj/effect/overmap/visitable/sector/residue/R = new()
	R.forceMove(locate(src.x, src.y, GLOB.using_map.overmap_z))

	for(var/obj/machinery/computer/ship/helm/H in SSmachines.machinery)
		H.add_known_sector(R)
	add_starter_trader()

/obj/effect/overmap/visitable/ship/lightbrigade/proc/add_starter_trader()
	var/trader_type = /datum/trader/trading_beacon/starter
	GLOB.traders[trader_type] = new trader_type
	GLOB.trader_types += trader_type

/obj/effect/overmap/visitable/sector/residue
	name = "Bluespace Residue"
	desc = "Trace radiation emanating from this sector is consistent with the aftermath of a bluespace jump."
	icon_state = "event"
	known = TRUE
	sector_flags = OVERMAP_SECTOR_KNOWN | OVERMAP_SECTOR_UNTARGETABLE

/obj/effect/overmap/visitable/sector/residue/Initialize()
	..()
	generic_waypoints = list()