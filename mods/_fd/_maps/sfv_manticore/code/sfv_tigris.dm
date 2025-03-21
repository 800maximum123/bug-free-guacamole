// MAP

/obj/submap_landmark/joinable_submap/sfv_tigris/scg
	name = "SFV Tigris"
	archetype = /singleton/submap_archetype/sfv_tigris/scg

/singleton/submap_archetype/sfv_tigris/scg
	descriptor = "SCGF"
	map = "SFV Tigris"
	crew_jobs = list(
		/datum/job/submap/sfv_tigris/scg/command/captain,
		/datum/job/submap/sfv_tigris/scg/command/navigator,
		/datum/job/submap/sfv_tigris/scg/command/pilot,
		/datum/job/submap/sfv_tigris/scg/fleet/engineer,
		/datum/job/submap/sfv_tigris/scg/fleet/medic,
		/datum/job/submap/sfv_tigris/scg/fleet/gunner,
		/datum/job/submap/sfv_tigris/scg/fleet/bluespace_specialist,
		/datum/job/submap/sfv_tigris/scg/fleet/crew
	)

/obj/submap_landmark/joinable_submap/sfv_tigris/iccgn
	name = "SFV Tigris"
	archetype = /singleton/submap_archetype/sfv_tigris/iccgn

/singleton/submap_archetype/sfv_tigris/iccgn
	descriptor = "ICCGN"
	map = "SFV Tigris"
	crew_jobs = list(
		/datum/job/submap/sfv_tigris/iccgn/command/pilot,
		/datum/job/submap/sfv_tigris/iccgn/fleet/engineer,
		/datum/job/submap/sfv_tigris/iccgn/fleet/medic,
		/datum/job/submap/sfv_tigris/iccgn/fleet/gunner,
		/datum/job/submap/sfv_tigris/iccgn/fleet/bluespace_specialist,
		/datum/job/submap/sfv_tigris/iccgn/fleet/crew
	)

/datum/map_template/ruin/away_site/sfv_tigris
	name = "SFV Tigris"
	id = "resolution_class"
	description = ""
	prefix = "mods/_fd/_maps/sfv_manticore/maps/"
	suffixes = list("sfv_tigris.dmm")
	spawn_cost = 0.5
	area_usage_test_exempted_root_areas = /area/sfv_tigris

/area/sfv_tigris
	name = "\improper SFV Tigris"
	requires_power = 0

// JOBS

// SCGF
/datum/job/submap/sfv_tigris/scg/command/captain
	title = "SCGF | SFV Manticore Captain"
	info = "You are a commander of an SFV Manticore. Complete your mission."
	supervisors = "Fleet Command, Senior Officers"
	total_positions = 1
	spawn_positions = 1
	outfit_type = /singleton/hierarchy/outfit/job/sfv_tigris/fleet/scg
	branch = /datum/mil_branch/fleet
	rank = /datum/mil_rank/fleet/o6
	allowed_branches = list(
		/datum/mil_branch/fleet
	)
	allowed_ranks = list(
		/datum/mil_rank/fleet/o6
	)
	whitelisted_species = list(SPECIES_HUMAN,SPECIES_SPACER,SPECIES_GRAVWORLDER,SPECIES_VATGROWN,SPECIES_IPC)
	required_language = LANGUAGE_HUMAN_EURO
	min_skill = list(
		SKILL_PILOT       = SKILL_EXPERIENCED,
		SKILL_EVA         = SKILL_BASIC,
		SKILL_WEAPONS     = SKILL_TRAINED,
		SKILL_COMBAT      = SKILL_TRAINED,
		SKILL_DEVICES     = SKILL_BASIC,
		SKILL_BUREAUCRACY = SKILL_BASIC,
		SKILL_ARMAMENT    = SKILL_TRAINED
	)

	max_skill = list(	SKILL_PILOT        = SKILL_MAX,
	                    SKILL_COMBAT       = SKILL_EXPERIENCED,
	                    SKILL_WEAPONS      = SKILL_EXPERIENCED,
	                    SKILL_CONSTRUCTION = SKILL_MAX,
	                    SKILL_ELECTRICAL   = SKILL_MAX,
	                    SKILL_ENGINES      = SKILL_MAX,
	                    SKILL_ARMAMENT     = SKILL_MAX,
	                    SKILL_ATMOS        = SKILL_MAX)
	skill_points = 24

/datum/job/submap/sfv_tigris/scg/command/navigator
	title = "SCGF | SFV Manticore Navigator"
	info = "You are right hand of a captian. You act as a first support to your supervisor and help pilot a spaceship. Complete your mission."
	supervisors = "Fleet Command, Senior Officers, your Captain."
	total_positions = 1
	spawn_positions = 1
	outfit_type = /singleton/hierarchy/outfit/job/sfv_tigris/fleet/scg
	branch = /datum/mil_branch/fleet
	rank = /datum/mil_rank/fleet/o3
	allowed_branches = list(
		/datum/mil_branch/fleet
	)
	allowed_ranks = list(
		/datum/mil_rank/fleet/o3
	)
	whitelisted_species = list(SPECIES_HUMAN,SPECIES_SPACER,SPECIES_GRAVWORLDER,SPECIES_VATGROWN,SPECIES_IPC)
	required_language = LANGUAGE_HUMAN_EURO
	min_skill = list(
		SKILL_PILOT       = SKILL_TRAINED,
		SKILL_EVA         = SKILL_BASIC,
		SKILL_WEAPONS     = SKILL_TRAINED,
		SKILL_COMBAT      = SKILL_TRAINED,
		SKILL_DEVICES     = SKILL_BASIC,
		SKILL_BUREAUCRACY = SKILL_BASIC,
		SKILL_ARMAMENT    = SKILL_TRAINED,
		SKILL_SCIENCE     = SKILL_BASIC
	)

	max_skill = list(	SKILL_PILOT        = SKILL_MAX,
	                    SKILL_COMBAT       = SKILL_EXPERIENCED,
	                    SKILL_WEAPONS      = SKILL_EXPERIENCED,
	                    SKILL_CONSTRUCTION = SKILL_MAX,
	                    SKILL_ELECTRICAL   = SKILL_MAX,
	                    SKILL_ENGINES      = SKILL_MAX,
	                    SKILL_ATMOS        = SKILL_MAX,
						SKILL_ARMAMENT     = SKILL_MAX)
	skill_points = 24

/datum/job/submap/sfv_tigris/scg/command/pilot
	title = "SCGF | SFV Manticore Pilot"
	info = "You are a pilot of SFV Manticore. Complete your mission."
	supervisors = "Fleet Command, Senior Officers, Captain."
	total_positions = 1
	spawn_positions = 1
	outfit_type = /singleton/hierarchy/outfit/job/sfv_tigris/fleet/scg
	allowed_branches = list(
		/datum/mil_branch/fleet,
	)
	allowed_ranks = list(
		/datum/mil_rank/fleet/o3,
	)
	whitelisted_species = list(SPECIES_HUMAN,SPECIES_SPACER,SPECIES_GRAVWORLDER,SPECIES_VATGROWN,SPECIES_IPC)
	required_language = LANGUAGE_HUMAN_EURO
	min_skill = list(
		SKILL_PILOT = SKILL_MAX,
		SKILL_SCIENCE = SKILL_BASIC,
		SKILL_DEVICES = SKILL_BASIC,
		SKILL_BUREAUCRACY = SKILL_BASIC,
		SKILL_ARMAMENT = SKILL_BASIC
	)

	max_skill = list(	SKILL_PILOT        = SKILL_MAX,
	                    SKILL_COMBAT       = SKILL_EXPERIENCED,
	                    SKILL_WEAPONS      = SKILL_EXPERIENCED,
	                    SKILL_CONSTRUCTION = SKILL_MAX,
	                    SKILL_ELECTRICAL   = SKILL_MAX,
	                    SKILL_ENGINES      = SKILL_MAX,
	                    SKILL_ATMOS        = SKILL_MAX,
						SKILL_ARMAMENT     = SKILL_MAX)
	skill_points = 24

/datum/job/submap/sfv_tigris/scg/fleet/engineer
	title = "SCGF | SFV Manticore Engineer"
	info = "You - are a reason this ship even functioning. Make it fly, save it from bullet-hell and complete your mission."
	supervisors = "Fleet Command, Senior Officers"
	total_positions = 3
	spawn_positions = 3
	outfit_type = /singleton/hierarchy/outfit/job/sfv_tigris/fleet/scg
	branch = list(/datum/mil_branch/fleet)
	rank = list(/datum/mil_rank/fleet/e6)
	allowed_branches = list(
		/datum/mil_branch/fleet,
	)
	allowed_ranks = list(
		/datum/mil_rank/fleet/e6,
	)
	whitelisted_species = list(SPECIES_HUMAN,SPECIES_SPACER,SPECIES_GRAVWORLDER,SPECIES_VATGROWN,SPECIES_IPC)
	required_language = LANGUAGE_HUMAN_EURO
	min_skill = list(
		SKILL_CONSTRUCTION = SKILL_TRAINED,
		SKILL_ENGINES      = SKILL_TRAINED,
		SKILL_ELECTRICAL   = SKILL_EXPERIENCED,
		SKILL_ATMOS        = SKILL_BASIC,
		SKILL_EVA          = SKILL_TRAINED,
		SKILL_WEAPONS      = SKILL_BASIC,
		SKILL_COMBAT       = SKILL_TRAINED,
	)

	max_skill = list(	SKILL_PILOT        = SKILL_EXPERIENCED,
	                    SKILL_COMBAT       = SKILL_EXPERIENCED,
	                    SKILL_EVA          = SKILL_MAX,
	                    SKILL_WEAPONS      = SKILL_EXPERIENCED,
	                    SKILL_CONSTRUCTION = SKILL_MAX,
	                    SKILL_ELECTRICAL   = SKILL_MAX,
	                    SKILL_ENGINES      = SKILL_MAX,
	                    SKILL_ATMOS        = SKILL_MAX)
	skill_points = 24

/datum/job/submap/sfv_tigris/scg/fleet/medic
	title = "SCGF | SFV Manticore Medical Doctor"
	info = "It is your duty to keep everyone alive until the end of the journey. Save as many lifes as you can and complete your mission."
	supervisors = "Fleet Command, Senior Officers"
	total_positions = 1
	spawn_positions = 1
	outfit_type = /singleton/hierarchy/outfit/job/sfv_tigris/fleet/scg
	rank = list(/datum/mil_rank/fleet/o2)
	allowed_branches = list(
		/datum/mil_branch/fleet
	)
	allowed_ranks = list(
		/datum/mil_rank/fleet/o2,
	)
	whitelisted_species = list(SPECIES_HUMAN,SPECIES_SPACER,SPECIES_GRAVWORLDER,SPECIES_VATGROWN,SPECIES_IPC)
	required_language = LANGUAGE_HUMAN_EURO
	min_skill = list(
		SKILL_SCIENCE      = SKILL_BASIC,
		SKILL_MEDICAL      = SKILL_EXPERIENCED,
		SKILL_ANATOMY      = SKILL_TRAINED,
		SKILL_CHEMISTRY    = SKILL_BASIC,
		SKILL_DEVICES      = SKILL_TRAINED,
		SKILL_EVA          = SKILL_BASIC,
		SKILL_WEAPONS      = SKILL_BASIC,
		SKILL_COMBAT       = SKILL_BASIC
	)

	max_skill = list(	SKILL_MEDICAL      = SKILL_MAX,
	                    SKILL_ANATOMY      = SKILL_MAX,
	                    SKILL_DEVICES      = SKILL_MAX,
	                    SKILL_SCIENCE      = SKILL_MAX,
	                    SKILL_CHEMISTRY    = SKILL_MAX,
	                    SKILL_EVA          = SKILL_MAX)
	skill_points = 24

/datum/job/submap/sfv_tigris/scg/fleet/gunner
	title = "SCGF | SFV Manticore Gunnery Operator"
	info = "You are a force of the fleet. Protect your designated vessel at all cost and destroy your enemies."
	supervisors = "Fleet Command, Senior Officers, your Captain."
	total_positions = 6
	spawn_positions = 6
	outfit_type = /singleton/hierarchy/outfit/job/sfv_tigris/fleet/scg
	branch = list(/datum/mil_branch/fleet)
	rank = list(
		/datum/mil_rank/fleet/e5,
		/datum/mil_rank/fleet/e6,
		/datum/mil_rank/fleet/e7,
		/datum/mil_rank/fleet/e8,
	)
	allowed_branches = list(
		/datum/mil_branch/fleet,
	)
	allowed_ranks = list(
		/datum/mil_rank/fleet/e5,
		/datum/mil_rank/fleet/e6,
		/datum/mil_rank/fleet/e7,
		/datum/mil_rank/fleet/e8
	)
	whitelisted_species = list(SPECIES_HUMAN,SPECIES_SPACER,SPECIES_GRAVWORLDER,SPECIES_VATGROWN,SPECIES_IPC)
	required_language = LANGUAGE_HUMAN_EURO
	min_skill = list(
		SKILL_PILOT       = SKILL_BASIC,
		SKILL_EVA         = SKILL_TRAINED,
		SKILL_WEAPONS     = SKILL_EXPERIENCED,
		SKILL_COMBAT      = SKILL_TRAINED,
		SKILL_DEVICES     = SKILL_BASIC,
		SKILL_ARMAMENT    = SKILL_TRAINED,
		SKILL_SCIENCE     = SKILL_BASIC
	)

	max_skill = list(	SKILL_PILOT        = SKILL_EXPERIENCED,
	                    SKILL_COMBAT       = SKILL_MAX,
	                    SKILL_WEAPONS      = SKILL_MAX,
                        SKILL_ARMAMENT     = SKILL_MAX
	)
	skill_points = 24

/datum/job/submap/sfv_tigris/scg/fleet/bluespace_specialist
	title = "SCGF | SFV Manticore Bluespace Specialist"
	info = "You are responsible to make THE project operate and stay intact until delievery. Complete your mission."
	supervisors = "Fleet Command, Senior Officers"
	total_positions = 1
	spawn_positions = 1
	outfit_type = /singleton/hierarchy/outfit/job/sfv_tigris/fleet/scg
	branch = list(/datum/mil_branch/fleet,/datum/mil_branch/civilian)
	rank = list(/datum/mil_rank/fleet/o3,/datum/mil_branch/civilian)
	allowed_branches = list(
		/datum/mil_branch/fleet,
		/datum/mil_branch/civilian
	)
	allowed_ranks = list(
		/datum/mil_rank/fleet/o3,
		/datum/mil_rank/civ/contractor
	)
	whitelisted_species = list(SPECIES_HUMAN,SPECIES_SPACER,SPECIES_GRAVWORLDER,SPECIES_VATGROWN,SPECIES_IPC)
	required_language = LANGUAGE_HUMAN_EURO
	min_skill = list(
		SKILL_SCIENCE      = SKILL_MAX,
		SKILL_MEDICAL      = SKILL_TRAINED,
		SKILL_ANATOMY      = SKILL_BASIC,
		SKILL_CHEMISTRY    = SKILL_TRAINED,
		SKILL_DEVICES      = SKILL_EXPERIENCED,
		SKILL_EVA          = SKILL_BASIC,
	)

	max_skill = list(	SKILL_MEDICAL      = SKILL_MAX,
	                    SKILL_ANATOMY      = SKILL_MAX,
	                    SKILL_DEVICES      = SKILL_MAX,
	                    SKILL_SCIENCE      = SKILL_MAX,
	                    SKILL_CHEMISTRY    = SKILL_MAX,
	                    SKILL_EVA          = SKILL_MAX)
	skill_points = 24

/datum/job/submap/sfv_tigris/scg/fleet/crew
	title = "SCGF | SFV Manticore Crewman"
	info = ""
	supervisors = "Fleet Command, Senior Officers"
	total_positions = 16
	spawn_positions = 16
	outfit_type = /singleton/hierarchy/outfit/job/sfv_tigris/fleet/scg
	branch = list(/datum/mil_branch/fleet, /datum/mil_branch/civilian)
	rank = list(
		/datum/mil_rank/fleet/e5,
		/datum/mil_rank/fleet/e6,
		/datum/mil_rank/fleet/e7,
		/datum/mil_rank/fleet/e8,
		/datum/mil_rank/civ/contractor
	)
	allowed_branches = list(
		/datum/mil_branch/fleet,
		/datum/mil_branch/civilian
	)
	allowed_ranks = list(
		/datum/mil_rank/fleet/e5,
		/datum/mil_rank/fleet/e6,
		/datum/mil_rank/fleet/e7,
		/datum/mil_rank/fleet/e8,
		/datum/mil_rank/civ/contractor
	)
	whitelisted_species = list(SPECIES_HUMAN,SPECIES_SPACER,SPECIES_GRAVWORLDER,SPECIES_VATGROWN,SPECIES_IPC)
	required_language = LANGUAGE_HUMAN_EURO
	min_skill = list(
		SKILL_SCIENCE      = SKILL_BASIC,
		SKILL_MEDICAL      = SKILL_BASIC,
		SKILL_DEVICES      = SKILL_BASIC,
		SKILL_EVA          = SKILL_BASIC,
		SKILL_PILOT        = SKILL_BASIC,
		SKILL_COMBAT       = SKILL_BASIC,
	)

	max_skill = list(	SKILL_SCIENCE      = SKILL_MAX,
	                    SKILL_MEDICAL      = SKILL_MAX,
	                    SKILL_DEVICES      = SKILL_MAX,
	                    SKILL_PILOT        = SKILL_MAX,
	                    SKILL_EVA          = SKILL_MAX,
	                    SKILL_COMBAT       = SKILL_EXPERIENCED,
                        SKILL_ARMAMENT     = SKILL_MAX
	)
	skill_points = 24


// ICCGN

/datum/job/submap/sfv_tigris/iccgn/command/pilot

	title = "ICCGN | SFV Manticore Pilot"
	info = "You are a pilot of SFV Manticore. Complete your mission."
	supervisors = "Fleet Command, Senior Officers, Captain."
	total_positions = 1
	spawn_positions = 1
	outfit_type = /singleton/hierarchy/outfit/job/sfv_tigris/fleet/iccgn
	allowed_branches = list(
		/datum/mil_branch/iccgn,
	)
	allowed_ranks = list(
		/datum/mil_rank/iccgn/of3,
	)
	whitelisted_species = list(SPECIES_HUMAN,SPECIES_SPACER,SPECIES_GRAVWORLDER,SPECIES_VATGROWN,SPECIES_IPC)
	required_language = LANGUAGE_HUMAN_EURO
	min_skill = list(
		SKILL_PILOT = SKILL_MAX,
		SKILL_SCIENCE = SKILL_BASIC,
		SKILL_DEVICES = SKILL_BASIC,
		SKILL_BUREAUCRACY = SKILL_BASIC,
		SKILL_ARMAMENT = SKILL_BASIC
	)

	max_skill = list(	SKILL_PILOT        = SKILL_MAX,
	                    SKILL_COMBAT       = SKILL_EXPERIENCED,
	                    SKILL_WEAPONS      = SKILL_EXPERIENCED,
	                    SKILL_CONSTRUCTION = SKILL_MAX,
	                    SKILL_ELECTRICAL   = SKILL_MAX,
	                    SKILL_ENGINES      = SKILL_MAX,
	                    SKILL_ATMOS        = SKILL_MAX,
						SKILL_ARMAMENT     = SKILL_MAX)
	skill_points = 24

/datum/job/submap/sfv_tigris/iccgn/fleet/engineer
	title = "ICCGN | SFV Manticore Engineer"
	info = "You - are a reason this ship even functioning. Make it fly, save it from bullet-hell and complete your mission."
	supervisors = "Fleet Command, Senior Officers"
	total_positions = 3
	spawn_positions = 3
	outfit_type = /singleton/hierarchy/outfit/job/sfv_tigris/fleet/iccgn
	branch = list(/datum/mil_branch/iccgn)
	rank = list(/datum/mil_rank/iccgn/or6)
	allowed_branches = list(
		/datum/mil_branch/iccgn,
	)
	allowed_ranks = list(
		/datum/mil_rank/iccgn/or6,
	)
	whitelisted_species = list(SPECIES_HUMAN,SPECIES_SPACER,SPECIES_GRAVWORLDER,SPECIES_VATGROWN,SPECIES_IPC)
	required_language = LANGUAGE_HUMAN_EURO
	min_skill = list(
		SKILL_CONSTRUCTION = SKILL_TRAINED,
		SKILL_ENGINES      = SKILL_TRAINED,
		SKILL_ELECTRICAL   = SKILL_EXPERIENCED,
		SKILL_ATMOS        = SKILL_BASIC,
		SKILL_EVA          = SKILL_TRAINED,
		SKILL_WEAPONS      = SKILL_BASIC,
		SKILL_COMBAT       = SKILL_TRAINED,
	)

	max_skill = list(	SKILL_PILOT        = SKILL_EXPERIENCED,
	                    SKILL_COMBAT       = SKILL_EXPERIENCED,
	                    SKILL_EVA          = SKILL_MAX,
	                    SKILL_WEAPONS      = SKILL_EXPERIENCED,
	                    SKILL_CONSTRUCTION = SKILL_MAX,
	                    SKILL_ELECTRICAL   = SKILL_MAX,
	                    SKILL_ENGINES      = SKILL_MAX,
	                    SKILL_ATMOS        = SKILL_MAX)
	skill_points = 24

/datum/job/submap/sfv_tigris/iccgn/fleet/medic
	title = "ICCGN | SFV Manticore Medical Doctor"
	info = "It is your duty to keep everyone alive until the end of the journey. Save as many lifes as you can and complete your mission."
	supervisors = "Fleet Command, Senior Officers"
	total_positions = 1
	spawn_positions = 1
	outfit_type = /singleton/hierarchy/outfit/job/sfv_tigris/fleet/iccgn
	rank = list(/datum/mil_rank/iccgn/of2)
	allowed_branches = list(
		/datum/mil_branch/iccgn
	)
	allowed_ranks = list(
		/datum/mil_rank/iccgn/of2,
	)
	whitelisted_species = list(SPECIES_HUMAN,SPECIES_SPACER,SPECIES_GRAVWORLDER,SPECIES_VATGROWN,SPECIES_IPC)
	required_language = LANGUAGE_HUMAN_EURO
	min_skill = list(
		SKILL_SCIENCE      = SKILL_BASIC,
		SKILL_MEDICAL      = SKILL_EXPERIENCED,
		SKILL_ANATOMY      = SKILL_TRAINED,
		SKILL_CHEMISTRY    = SKILL_BASIC,
		SKILL_DEVICES      = SKILL_TRAINED,
		SKILL_EVA          = SKILL_BASIC,
		SKILL_WEAPONS      = SKILL_BASIC,
		SKILL_COMBAT       = SKILL_BASIC
	)

	max_skill = list(	SKILL_MEDICAL      = SKILL_MAX,
	                    SKILL_ANATOMY      = SKILL_MAX,
	                    SKILL_DEVICES      = SKILL_MAX,
	                    SKILL_SCIENCE      = SKILL_MAX,
	                    SKILL_CHEMISTRY    = SKILL_MAX,
	                    SKILL_EVA          = SKILL_MAX)
	skill_points = 24

/datum/job/submap/sfv_tigris/iccgn/fleet/gunner
	title = "ICCGN | SFV Manticore Gunnery Operator"
	info = "You are a force of the fleet. Protect your designated vessel at all cost and destroy your enemies."
	supervisors = "Fleet Command, Senior Officers, your Captain."
	total_positions = 6
	spawn_positions = 6
	outfit_type = /singleton/hierarchy/outfit/job/sfv_tigris/fleet/iccgn
	branch = list(/datum/mil_branch/iccgn)
	rank = list(
		/datum/mil_rank/iccgn/or5,
		/datum/mil_rank/iccgn/or6,
		/datum/mil_rank/iccgn/or7,
		/datum/mil_rank/iccgn/or8,
	)
	allowed_branches = list(
		/datum/mil_branch/iccgn,
	)
	allowed_ranks = list(
		/datum/mil_rank/iccgn/or5,
		/datum/mil_rank/iccgn/or6,
		/datum/mil_rank/iccgn/or7,
		/datum/mil_rank/iccgn/or8,
	)
	whitelisted_species = list(SPECIES_HUMAN,SPECIES_SPACER,SPECIES_GRAVWORLDER,SPECIES_VATGROWN,SPECIES_IPC)
	required_language = LANGUAGE_HUMAN_EURO
	min_skill = list(
		SKILL_PILOT       = SKILL_BASIC,
		SKILL_EVA         = SKILL_TRAINED,
		SKILL_WEAPONS     = SKILL_EXPERIENCED,
		SKILL_COMBAT      = SKILL_TRAINED,
		SKILL_DEVICES     = SKILL_BASIC,
		SKILL_ARMAMENT    = SKILL_TRAINED,
		SKILL_SCIENCE     = SKILL_BASIC
	)

	max_skill = list(	SKILL_PILOT        = SKILL_EXPERIENCED,
	                    SKILL_COMBAT       = SKILL_MAX,
	                    SKILL_WEAPONS      = SKILL_MAX,
                        SKILL_ARMAMENT     = SKILL_MAX
	)
	skill_points = 24

/datum/job/submap/sfv_tigris/iccgn/fleet/bluespace_specialist
	title = "ICCGN | SFV Manticore Bluespace Specialist"
	info = "You are responsible to make THE project operate and stay intact until delievery. Complete your mission."
	supervisors = "Fleet Command, Senior Officers"
	total_positions = 1
	spawn_positions = 1
	outfit_type = /singleton/hierarchy/outfit/job/sfv_tigris/fleet/iccgn
	branch = list(/datum/mil_branch/iccgn,/datum/mil_branch/civilian)
	rank = list(/datum/mil_rank/iccgn/of3,/datum/mil_branch/civilian)
	allowed_branches = list(
		/datum/mil_branch/iccgn,
		/datum/mil_branch/civilian
	)
	allowed_ranks = list(
		/datum/mil_rank/iccgn/of3,
		/datum/mil_rank/civ/contractor
	)
	whitelisted_species = list(SPECIES_HUMAN,SPECIES_SPACER,SPECIES_GRAVWORLDER,SPECIES_VATGROWN,SPECIES_IPC)
	required_language = LANGUAGE_HUMAN_EURO
	min_skill = list(
		SKILL_SCIENCE      = SKILL_MAX,
		SKILL_MEDICAL      = SKILL_TRAINED,
		SKILL_ANATOMY      = SKILL_BASIC,
		SKILL_CHEMISTRY    = SKILL_TRAINED,
		SKILL_DEVICES      = SKILL_EXPERIENCED,
		SKILL_EVA          = SKILL_BASIC,
	)

	max_skill = list(	SKILL_MEDICAL      = SKILL_MAX,
	                    SKILL_ANATOMY      = SKILL_MAX,
	                    SKILL_DEVICES      = SKILL_MAX,
	                    SKILL_SCIENCE      = SKILL_MAX,
	                    SKILL_CHEMISTRY    = SKILL_MAX,
	                    SKILL_EVA          = SKILL_MAX)
	skill_points = 24

/datum/job/submap/sfv_tigris/iccgn/fleet/crew
	title = "ICCGN | SFV Manticore Crewman"
	info = ""
	supervisors = "Fleet Command, Senior Officers"
	total_positions = 16
	spawn_positions = 16
	outfit_type = /singleton/hierarchy/outfit/job/sfv_tigris/fleet/iccgn
	branch = list(/datum/mil_branch/iccgn, /datum/mil_branch/civilian)
	rank = list(
		/datum/mil_rank/iccgn/or5,
		/datum/mil_rank/iccgn/or6,
		/datum/mil_rank/iccgn/or7,
		/datum/mil_rank/iccgn/or8,
		/datum/mil_rank/civ/contractor
	)
	allowed_branches = list(
		/datum/mil_branch/fleet,
		/datum/mil_branch/civilian
	)
	allowed_ranks = list(
		/datum/mil_rank/iccgn/or5,
		/datum/mil_rank/iccgn/or6,
		/datum/mil_rank/iccgn/or7,
		/datum/mil_rank/iccgn/or8,
		/datum/mil_rank/civ/contractor
	)
	whitelisted_species = list(SPECIES_HUMAN,SPECIES_SPACER,SPECIES_GRAVWORLDER,SPECIES_VATGROWN,SPECIES_IPC)
	required_language = LANGUAGE_HUMAN_EURO
	min_skill = list(
		SKILL_SCIENCE      = SKILL_BASIC,
		SKILL_MEDICAL      = SKILL_BASIC,
		SKILL_DEVICES      = SKILL_BASIC,
		SKILL_EVA          = SKILL_BASIC,
		SKILL_PILOT        = SKILL_BASIC,
		SKILL_COMBAT       = SKILL_BASIC,
	)

	max_skill = list(	SKILL_SCIENCE      = SKILL_MAX,
	                    SKILL_MEDICAL      = SKILL_MAX,
	                    SKILL_DEVICES      = SKILL_MAX,
	                    SKILL_PILOT        = SKILL_MAX,
	                    SKILL_EVA          = SKILL_MAX,
	                    SKILL_COMBAT       = SKILL_EXPERIENCED,
                        SKILL_ARMAMENT     = SKILL_MAX
	)
	skill_points = 24

/obj/submap_landmark/spawnpoint/sfv_tigris/scg/command/captain
	name = "SCGF | SFV Manticore Captain"
	movable_flags = MOVABLE_FLAG_EFFECTMOVE

/obj/submap_landmark/spawnpoint/sfv_tigris/scg/command/navigator
	name = "SCGF | SFV Manticore Navigator"
	movable_flags = MOVABLE_FLAG_EFFECTMOVE

/obj/submap_landmark/spawnpoint/sfv_tigris/scg/command/pilot
	name = "SCGF | SFV Manticore Pilot"
	movable_flags = MOVABLE_FLAG_EFFECTMOVE

/obj/submap_landmark/spawnpoint/sfv_tigris/scg/fleet/engineer
	name = "SCGF | SFV Manticore Engineer"
	movable_flags = MOVABLE_FLAG_EFFECTMOVE

/obj/submap_landmark/spawnpoint/sfv_tigris/scg/fleet/medic
	name = "SCGF | SFV Manticore Medical Doctor"
	movable_flags = MOVABLE_FLAG_EFFECTMOVE

/obj/submap_landmark/spawnpoint/sfv_tigris/scg/fleet/gunner
	name = "SCGF | SFV Manticore Gunnery Operator"
	movable_flags = MOVABLE_FLAG_EFFECTMOVE

/obj/submap_landmark/spawnpoint/sfv_tigris/scg/fleet/bluespace_specialist
	name = "SCGF | SFV Manticore Bluespace Specialist"
	movable_flags = MOVABLE_FLAG_EFFECTMOVE

/obj/submap_landmark/spawnpoint/sfv_tigris/scg/fleet/crew
	name = "SCGF | SFV Manticore Crewman"
	movable_flags = MOVABLE_FLAG_EFFECTMOVE

/obj/submap_landmark/spawnpoint/sfv_tigris/iccgn/command/pilot
	name = "ICCGN | SFV Manticore Pilot"
	movable_flags = MOVABLE_FLAG_EFFECTMOVE

/obj/submap_landmark/spawnpoint/sfv_tigris/iccgn/fleet/engineer
	name = "ICCGN | SFV Manticore Engineer"
	movable_flags = MOVABLE_FLAG_EFFECTMOVE

/obj/submap_landmark/spawnpoint/sfv_tigris/iccgn/fleet/medic
	name = "ICCGN | SFV Manticore Medical Doctor"
	movable_flags = MOVABLE_FLAG_EFFECTMOVE

/obj/submap_landmark/spawnpoint/sfv_tigris/iccgn/fleet/gunner
	name = "ICCGN | SFV Manticore Gunnery Operator"
	movable_flags = MOVABLE_FLAG_EFFECTMOVE

/obj/submap_landmark/spawnpoint/sfv_tigris/iccgn/fleet/bluespace_specialist
	name = "ICCGN | SFV Manticore Bluespace Specialist"
	movable_flags = MOVABLE_FLAG_EFFECTMOVE

/obj/submap_landmark/spawnpoint/sfv_tigris/iccgn/fleet/crew
	name = "ICCGN | SFV Manticore Crewman"
	movable_flags = MOVABLE_FLAG_EFFECTMOVE

/singleton/hierarchy/outfit/job/sfv_tigris/fleet/scg
	name = OUTFIT_JOB_NAME("SFV Manticore Crew | SCG")
	uniform = /obj/item/clothing/under/solgov/utility/fleet
	shoes = /obj/item/clothing/shoes/dutyboots
	l_pocket = /obj/item/device/radio
	l_ear = null
	pda_type = /obj/item/modular_computer/pda
	head = /obj/item/clothing/head/beret/solgov/fleet/branch/fifth

/singleton/hierarchy/outfit/job/sfv_tigris/fleet/iccgn
	name = OUTFIT_JOB_NAME("SFV Manticore Crew | ICCG")
	uniform = /obj/item/clothing/under/iccgn/utility
	shoes = /obj/item/clothing/shoes/dutyboots
	l_pocket = /obj/item/device/radio
	l_ear = null
	pda_type = /obj/item/modular_computer/pda
