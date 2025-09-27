/obj/overmap/visitable/ship/venera
	name = "SFV Venera"
	desc = "A small gunboat, broadcasting SCGDF Third Fleet codes and designation \"SFV Venera, PBM-465-A\"."
	color = "#1d96f8"
	vessel_mass = 3000 /// small and fast as far as ships go
	skill_needed = SKILL_TRAINED
	hide_from_reports = TRUE
	initial_generic_waypoints = list(
		"nav_venera_1",
		"nav_venera_2",
		"nav_venera_3",
		"nav_venera_antag"
	)
	initial_restricted_waypoints = list(
		"Jinx" = list("nav_hangar_jinx")
	)


/obj/overmap/visitable/ship/venera/New(nloc, max_x, max_y)
	name = "SFV Venera"
	..()

/datum/map_template/ruin/away_site/venera
	name = "SFV Venera"
	id = "awaysite_venera"
	description = "Active SolGov gunboat with a shuttle."
	prefix = "mods/_fd/_maps/venera/maps/"
	suffixes = list("venera.dmm")
	spawn_cost = 50 // nice try lol
	shuttles_to_initialise = list(/datum/shuttle/autodock/overmap/jinx)
	area_usage_test_exempted_root_areas = list(/area/venera)

/obj/shuttle_landmark/nav_venera/nav1
	name = "SFV Venera Navpoint #1"
	landmark_tag = "nav_venera_1"

/obj/shuttle_landmark/nav_venera/nav2
	name = "SFV Venera Navpoint #2"
	landmark_tag = "nav_venera_2"

/obj/shuttle_landmark/nav_venera/nav3
	name = "SFV Venera Navpoint #3"
	landmark_tag = "nav_venera_3"

/obj/shuttle_landmark/nav_venera/nav4
	name = "SFV Venera Navpoint #4"
	landmark_tag = "nav_venera_antag"


/singleton/submap_archetype/venera
	descriptor = "SFV Venera"
	map = "SFV Venera"
	crew_jobs = list(/datum/job/submap/venera/pilot, /datum/job/submap/venera/captain, /datum/job/submap/venera/corpsman, /datum/job/submap/venera/gunner, /datum/job/submap/venera/engineer)

/obj/submap_landmark/joinable_submap/venera
	name = "SFV Venera"
	archetype = /singleton/submap_archetype/venera

/obj/submap_landmark/spawnpoint/venera
	name = "Venera Crew Member"
	movable_flags = MOVABLE_FLAG_EFFECTMOVE

/obj/submap_landmark/spawnpoint/venera/captain
	name = "Venera Commanding Officer"

/obj/submap_landmark/spawnpoint/venera/pilot
	name = "Venera Pilot"

/obj/submap_landmark/spawnpoint/venera/corpsman
	name = "Venera Corpsman"

/obj/submap_landmark/spawnpoint/venera/gunner
	name = "Venera Gunner"

/obj/submap_landmark/spawnpoint/venera/engineer
	name = "Venera Engineer"

/datum/job/submap/venera/captain
	title = "Venera Commanding Officer"
	info = "You are the commander of SFV Venera, out on patrol in deep space. You're a junior officer, though entrusted with commanding this small boat. Scout away, fend off pirates, respond to distress calls and don't get into trouble."
	outfit_type = /singleton/hierarchy/outfit/venera/captain
	total_positions = 1
	loadout_allowed = TRUE
	required_language = LANGUAGE_HUMAN_EURO
	allowed_branches = list(/datum/mil_branch/fleet)
	allowed_ranks = list(
		/datum/mil_rank/fleet/o2
	)
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_TRAINED,
	                    SKILL_COMPUTER    = SKILL_BASIC,
	                    SKILL_ARMAMENT	  = SKILL_BASIC,
	                    SKILL_PILOT       = SKILL_TRAINED)

	max_skill = list(
		SKILL_PILOT   = SKILL_MAX,
		SKILL_SCIENCE = SKILL_MAX
	)
	skill_points = 20

/datum/job/submap/venera/pilot
	title = "Venera Pilot"
	info = "You are the first officer and pilot of SFV Venera. You hold the bridge, pilot the boat and assist the commander. While you're a very junior officer, you are expected to take command if CO is unavailable."
	outfit_type = /singleton/hierarchy/outfit/venera/pilot
	total_positions = 1
	loadout_allowed = TRUE
	required_language = LANGUAGE_HUMAN_EURO
	allowed_branches = list(/datum/mil_branch/fleet)
	allowed_ranks = list(
		/datum/mil_rank/fleet/o1
	)
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_TRAINED,
	                    SKILL_COMPUTER    = SKILL_BASIC,
	                    SKILL_ARMAMENT	  = SKILL_BASIC,
	                    SKILL_PILOT       = SKILL_TRAINED)

	max_skill = list(
		SKILL_PILOT   = SKILL_MAX,
		SKILL_SCIENCE = SKILL_MAX
	)
	skill_points = 20

/datum/job/submap/venera/corpsman
	title = "Venera Corpsman"
	info = "You are the boat's enlisted medic, responsible for keeping the crew healthy and combat-capable. You are not a fully-qualified doctor - full treatment is not your specialty."
	outfit_type = /singleton/hierarchy/outfit/venera/corpsman
	total_positions = 1
	loadout_allowed = TRUE
	required_language = LANGUAGE_HUMAN_EURO
	allowed_branches = list(/datum/mil_branch/fleet)
	allowed_ranks = list(
		/datum/mil_rank/fleet/e4,
		/datum/mil_rank/fleet/e5,
		/datum/mil_rank/fleet/e6
	)
	min_skill = list(   SKILL_EVA     = SKILL_BASIC,
	                    SKILL_MEDICAL = SKILL_TRAINED,
	                    SKILL_ANATOMY = SKILL_TRAINED)

	max_skill = list(   SKILL_MEDICAL     = SKILL_EXPERIENCED)
	skill_points = 20


/datum/job/submap/venera/gunner
	title = "Venera Gunner"
	info = "You are the boat's gunner, responsible for operation of onboard guns. Aside from that, you're expected to perform menial tasks onboard."
	outfit_type = /singleton/hierarchy/outfit/venera/gunner
	total_positions = 2
	loadout_allowed = TRUE
	required_language = LANGUAGE_HUMAN_EURO
	allowed_branches = list(/datum/mil_branch/fleet)
	allowed_ranks = list(
		/datum/mil_rank/fleet/e3,
		/datum/mil_rank/fleet/e4,
		/datum/mil_rank/fleet/e5
	)
	min_skill = list(
		SKILL_EVA     = SKILL_BASIC,
		SKILL_ARMAMENT = SKILL_TRAINED
	)

	max_skill = list(
		SKILL_WEAPONS = SKILL_MAX,
		SKILL_COMBAT = SKILL_MAX,
		SKILL_ARMAMENT = SKILL_MAX
	)
	skill_points = 20


/datum/job/submap/venera/engineer
	title = "Venera Engineer"
	info = "You are the boat's mechanic, responsible for setting up power supply, overseeing the integrity of technical systems onboard and leading damage control if necessary."
	outfit_type = /singleton/hierarchy/outfit/venera/engineer
	total_positions = 1
	loadout_allowed = TRUE
	required_language = LANGUAGE_HUMAN_EURO
	allowed_branches = list(/datum/mil_branch/fleet)
	allowed_ranks = list(
		/datum/mil_rank/fleet/e3,
		/datum/mil_rank/fleet/e4,
		/datum/mil_rank/fleet/e5
	)
	min_skill = list(   SKILL_COMPUTER     = SKILL_BASIC,
	                    SKILL_EVA          = SKILL_BASIC,
	                    SKILL_CONSTRUCTION = SKILL_TRAINED,
	                    SKILL_ELECTRICAL   = SKILL_BASIC,
	                    SKILL_ATMOS        = SKILL_BASIC,
	                    SKILL_ENGINES      = SKILL_BASIC)

	max_skill = list(   SKILL_CONSTRUCTION = SKILL_MAX,
	                    SKILL_ELECTRICAL   = SKILL_MAX,
	                    SKILL_ATMOS        = SKILL_MAX,
	                    SKILL_ENGINES      = SKILL_MAX)
	skill_points = 20



//				O U T F I T S			//

/obj/item/card/id/venera
	access = list(access_maint_tunnels, access_external_airlocks, access_engine, access_atmospherics, access_eva, access_solgov_crew)


/singleton/hierarchy/outfit/venera/pilot
	name = "Venera Pilot"

	uniform = /obj/item/clothing/under/solgov/utility/fleet/combat/command
	glasses = /obj/item/clothing/glasses/sunglasses
	shoes = /obj/item/clothing/shoes/dutyboots
	r_pocket = /obj/item/device/radio/map_preset/venera
	l_ear = /obj/item/device/radio/headset/map_preset/venera
	id_types = list(/obj/item/card/id/venera)
	id_slot = slot_wear_id
	back = /obj/item/storage/backpack/satchel/leather/navy

/singleton/hierarchy/outfit/venera/captain
	name = "Venera Captain"

	uniform = /obj/item/clothing/under/solgov/utility/fleet/combat/command
	glasses = /obj/item/clothing/glasses/sunglasses
	shoes = /obj/item/clothing/shoes/dutyboots
	r_pocket = /obj/item/device/radio/map_preset/venera
	l_ear = /obj/item/device/radio/headset/map_preset/venera
	id_types = list(/obj/item/card/id/venera)
	id_slot = slot_wear_id
	back = /obj/item/storage/backpack/satchel/leather/navy

/singleton/hierarchy/outfit/venera/corpsman
	name = "Venera Corpsman"

	uniform = /obj/item/clothing/under/solgov/utility/fleet/combat/medical
	shoes = /obj/item/clothing/shoes/dutyboots
	r_pocket = /obj/item/device/radio/map_preset/venera
	l_ear = /obj/item/device/radio/headset/map_preset/venera
	id_types = list(/obj/item/card/id/venera)
	id_slot = slot_wear_id
	back = /obj/item/storage/backpack/satchel/leather/navy

/singleton/hierarchy/outfit/venera/gunner
	name = "Venera Engineer"

	uniform = /obj/item/clothing/under/solgov/utility/fleet/combat
	shoes = /obj/item/clothing/shoes/dutyboots
	r_pocket = /obj/item/device/radio/map_preset/venera
	l_ear = /obj/item/device/radio/headset/map_preset/venera
	id_types = list(/obj/item/card/id/venera)
	id_slot = slot_wear_id
	back = /obj/item/storage/backpack/satchel/leather/navy

/singleton/hierarchy/outfit/venera/engineer
	name = "Venera Engineer"

	uniform = /obj/item/clothing/under/solgov/utility/fleet/combat/engineering
	shoes = /obj/item/clothing/shoes/dutyboots
	r_pocket = /obj/item/device/radio/map_preset/venera
	l_ear = /obj/item/device/radio/headset/map_preset/venera
	id_types = list(/obj/item/card/id/venera)
	id_slot = slot_wear_id
	back = /obj/item/storage/backpack/satchel/leather/navy
