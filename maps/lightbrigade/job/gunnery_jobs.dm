//Gunnery department, a.k.a. The Big Gun Boys. Dept flag is temporarily set for explo since it's core code
/datum/job/pilot
	title = "Combat Pilot"
	supervisors = "the Commanding Officer and Executive Officer"
	department = "Gunnery"
	department_flag = EXP
	total_positions = 2
	spawn_positions = 2
	selection_color = "#d67804"
	economic_power = 8
	minimal_player_age = 0
	minimum_character_age = list(SPECIES_HUMAN = 22)
	ideal_character_age = 25
	outfit_type = /singleton/hierarchy/outfit/job/torch/crew/exploration/pilot/fleet
	allowed_branches = list(
		/datum/mil_branch/fleet
	)
	allowed_ranks = list(
		/datum/mil_rank/fleet/o1,
		/datum/mil_rank/fleet/o2,
		/datum/mil_rank/fleet/o3
	)

	access = list(
		access_mining_office, access_petrov, access_petrov_helm, access_petrov_maint, access_mining_station,
		access_expedition_shuttle, access_expedition_shuttle_helm, access_guppy, access_hangar, access_guppy_helm,
		access_mining, access_pilot, access_solgov_crew, access_eva, access_explorer, access_research,
		access_radio_exp, access_radio_sup, access_maint_tunnels, access_emergency_storage,
		access_gun, access_aquila
	)
	min_skill = list(	SKILL_EVA   = SKILL_TRAINED,
						SKILL_PILOT = SKILL_TRAINED,
						SKILL_MEDICAL = SKILL_BASIC,
						SKILL_ARMAMENT	  = SKILL_EXPERIENCED)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX,
	                    SKILL_COMBAT      = SKILL_EXPERIENCED,
	                    SKILL_ARMAMENT	= SKILL_MAX)


//Armsman Squad, a.k.a. The Brawl Boys
/datum/job/armsman_lead
	title = "Armsman Team Leader"
	department_flag = EXP
	total_positions = 1
	spawn_positions = 1
	selection_color = "#4b9c55"
	supervisors = "the Operations Officer"
	economic_power = 6
	minimal_player_age = 14
	minimum_character_age = list(SPECIES_HUMAN = 24)
	ideal_character_age = 25
	outfit_type = /singleton/hierarchy/outfit/job/lightbrigade/crew/armsman
	allowed_branches = list(
		/datum/mil_branch/fleet
	)
	allowed_ranks = list(
		/datum/mil_rank/fleet/e6
	)
	min_skill = list(	SKILL_EVA         = SKILL_TRAINED,
	                    SKILL_COMBAT      = SKILL_TRAINED,
	                    SKILL_WEAPONS     = SKILL_TRAINED,
	                    SKILL_HAULING	  = SKILL_TRAINED,
	                    SKILL_BUREAUCRACY = SKILL_BASIC)

	max_skill = list(   SKILL_COMBAT      = SKILL_MAX,
	                    SKILL_WEAPONS     = SKILL_MAX)

	access = list(
		access_security, access_brig, access_maint_tunnels,
		access_external_airlocks, access_emergency_storage,
		access_eva, access_sec_doors, access_solgov_crew,
		access_radio_sec, access_explorer, access_armory,
		access_commissary, access_exploration_guard,
		access_pathfinder
	)

/datum/job/armsman_medic
	title = "Armsman Medic"
	department_flag = EXP
	total_positions = 1
	spawn_positions = 1
	selection_color = "#366e3d"
	supervisors = "the Team Leader"
	economic_power = 4
	minimal_player_age = 7
	minimum_character_age = list(SPECIES_HUMAN = 20)
	ideal_character_age = 24
	outfit_type = /singleton/hierarchy/outfit/job/lightbrigade/crew/armsman
	allowed_branches = list(
		/datum/mil_branch/fleet
	)
	allowed_ranks = list(
		/datum/mil_rank/fleet/e4,
		/datum/mil_rank/fleet/e5
	)
	min_skill = list(	SKILL_EVA         = SKILL_TRAINED,
	                    SKILL_COMBAT      = SKILL_BASIC,
	                    SKILL_WEAPONS     = SKILL_TRAINED,
	                    SKILL_HAULING	  = SKILL_TRAINED,
	                    SKILL_MEDICAL	  = SKILL_BASIC,
	                    SKILL_ANATOMY	  = SKILL_BASIC
	                    )

	max_skill = list(   SKILL_COMBAT      = SKILL_MAX,
	                    SKILL_WEAPONS     = SKILL_MAX,
	                    SKILL_MEDICAL     = SKILL_MAX)

	access = list(
		access_security, access_brig, access_maint_tunnels,
		access_external_airlocks, access_emergency_storage,
		access_eva, access_sec_doors, access_solgov_crew,
		access_radio_sec, access_explorer, access_armory,
		access_commissary, access_medical, access_radio_med,
		access_medical_equip
	)

/datum/job/armsman_engi
	title = "Armsman Engineer"
	department_flag = EXP
	total_positions = 1
	spawn_positions = 1
	selection_color = "#366e3d"
	supervisors = "the Team Leader"
	economic_power = 4
	minimal_player_age = 7
	minimum_character_age = list(SPECIES_HUMAN = 20)
	ideal_character_age = 22
	outfit_type = /singleton/hierarchy/outfit/job/lightbrigade/crew/armsman
	allowed_branches = list(
		/datum/mil_branch/fleet
	)
	allowed_ranks = list(
		/datum/mil_rank/fleet/e4,
		/datum/mil_rank/fleet/e5
	)
	min_skill = list(	SKILL_EVA          = SKILL_TRAINED,
	                    SKILL_COMBAT       = SKILL_BASIC,
	                    SKILL_WEAPONS      = SKILL_TRAINED,
	                    SKILL_HAULING	   = SKILL_TRAINED,
	                    SKILL_CONSTRUCTION = SKILL_TRAINED,
	                    SKILL_ELECTRICAL   = SKILL_TRAINED,
	                    SKILL_MECH		   = HAS_PERK
	                    )

	max_skill = list(   SKILL_COMBAT      = SKILL_MAX,
	                    SKILL_WEAPONS     = SKILL_MAX,
	                    SKILL_PILOT       = SKILL_EXPERIENCED)

	access = list(
		access_security, access_brig, access_maint_tunnels,
		access_external_airlocks, access_emergency_storage,
		access_eva, access_sec_doors, access_solgov_crew,
		access_radio_sec, access_explorer, access_armory,
		access_exploration_guard, access_tech_storage,
		access_engine, access_engine_equip, access_construction,
		access_radio_eng
	)

/datum/job/armsman
	title = "Armsman Rifleman"
	department_flag = EXP
	total_positions = 3
	spawn_positions = 3
	selection_color = "#366e3d"
	supervisors = "the Team Leader"
	economic_power = 4
	minimal_player_age = 7
	minimum_character_age = list(SPECIES_HUMAN = 20)
	ideal_character_age = 21
	outfit_type = /singleton/hierarchy/outfit/job/lightbrigade/crew/armsman
	allowed_branches = list(
		/datum/mil_branch/fleet
	)
	allowed_ranks = list(
		/datum/mil_rank/fleet/e3,
		/datum/mil_rank/fleet/e4,
		/datum/mil_rank/fleet/e5
	)
	min_skill = list(	SKILL_EVA          = SKILL_TRAINED,
	                    SKILL_COMBAT       = SKILL_BASIC,
	                    SKILL_WEAPONS      = SKILL_TRAINED,
	                    SKILL_HAULING	   = SKILL_TRAINED
	                    )

	max_skill = list(   SKILL_COMBAT      = SKILL_MAX,
	                    SKILL_WEAPONS     = SKILL_MAX)

	access = list(
		access_security, access_brig, access_maint_tunnels,
		access_external_airlocks, access_emergency_storage,
		access_eva, access_sec_doors, access_solgov_crew,
		access_radio_sec, access_explorer, access_armory
	)
