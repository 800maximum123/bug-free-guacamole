// -- COMMAND --
/datum/job/scg_co
	title = "Commanding Officer"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Sol Central Government and the Sol Code of Uniform Justice"
	department = "Solar Central Government"
	department_flag = SPT // SPT = SCG, SEC = ICCG
	minimal_player_age = 14
	economic_power = 16
	minimum_character_age = list(SPECIES_HUMAN = 22)
	ideal_character_age = 30
	outfit_type = /singleton/hierarchy/outfit/job/gaia/scg/command/CO
	required_language = LANGUAGE_HUMAN_EURO
	selection_color = COLOR_ASSEMBLY_GOLD
	faction = MOB_FACTION_SCG
	head_position = TRUE
	create_record = FALSE
	allowed_branches = list(
		/datum/mil_branch/scga,
	)
	allowed_ranks = list(
		/datum/mil_rank/scga/o1,
		/datum/mil_rank/scga/o2,
		/datum/mil_rank/scga/o3,
	)
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_BASIC,
	                    SKILL_PILOT       = SKILL_TRAINED,
	                    SKILL_COMBAT      = SKILL_BASIC,
	                    SKILL_WEAPONS     = SKILL_BASIC)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX,
	                    SKILL_SCIENCE     = SKILL_MAX,
	                    SKILL_COMBAT      = SKILL_MAX,
	                    SKILL_WEAPONS     = SKILL_MAX)

	access = list(
		access_medical, access_morgue, access_maint_tunnels,
		access_surgery, access_medical_equip, access_solgov_crew,
		access_engine, access_network, access_network_admin,
		access_armory, access_security,
		access_captain, access_hop, access_heads
	)

	skill_points = 30

/datum/job/scg_co/get_description_blurb()
	return "You are the Commanding Officer of a scattered SCG guerrilla unit known as the '[GLOB.using_map.station_short]' You're a veteran of the Gaian Conflict, leading partisans in hit-and-run strikes, sabotage, and survival against the occupying Gilgamesh forces. Your job is to coordinate missions, manage limited resources, and keep morale steady in the face of overwhelming odds. Trust your Platoon Sergeant and squad leaders — you'll need them to keep the unit alive."

/datum/job/scg_ps
	title = "Platoon Sergeant"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Commanding Officer"
	department = "Solar Central Government"
	department_flag = SPT
	minimal_player_age = 14
	economic_power = 14
	minimum_character_age = list(SPECIES_HUMAN = 30)
	ideal_character_age = 35
	alt_titles = list(
		"Platoon Petty Officer",
	)
	outfit_type = /singleton/hierarchy/outfit/job/gaia/scg/command/PS
	required_language = LANGUAGE_HUMAN_EURO
	selection_color = COLOR_ASSEMBLY_GOLD
	faction = MOB_FACTION_SCG
	head_position = TRUE
	create_record = FALSE
	allowed_branches = list(
		/datum/mil_branch/scga,
		/datum/mil_branch/fleet = /singleton/hierarchy/outfit/job/gaia/scg/command/PS/fleet,
	)
	allowed_ranks = list(
		/datum/mil_rank/scga/e7,
		/datum/mil_rank/scga/e8,
		/datum/mil_rank/scga/e8_alt,
		/datum/mil_rank/scga/e9,
		/datum/mil_rank/scga/e9_alt1,
		/datum/mil_rank/fleet/e7,
		/datum/mil_rank/fleet/e8,
		/datum/mil_rank/fleet/e9,
		/datum/mil_rank/fleet/e9_alt1,
		/datum/mil_rank/fleet/e9_alt2,
		/datum/mil_rank/fleet/e9_alt3,
	)
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_BASIC,
	                    SKILL_COMPUTER    = SKILL_BASIC,
	                    SKILL_PILOT       = SKILL_BASIC,
	                    SKILL_HAULING     = SKILL_BASIC,
	                    SKILL_COMBAT      = SKILL_BASIC,
	                    SKILL_WEAPONS     = SKILL_TRAINED)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX,
	                    SKILL_COMBAT      = SKILL_MAX,
	                    SKILL_WEAPONS     = SKILL_MAX)

	access = list(
		access_medical, access_morgue, access_maint_tunnels,
		access_surgery, access_medical_equip, access_solgov_crew,
		access_engine, access_network, access_network_admin,
		access_armory, access_security,
		access_hop, access_heads
	)

	skill_points = 30

/datum/job/scg_ps/get_description_blurb()
	return "You are the Platoon Sergeant — second in command and the backbone of the '[GLOB.using_map.station_short]' unit. While the officer leads from the map table, you lead from the front. You manage logistics, discipline, and readiness, and you're expected to step up if the CO is killed or cut off. You keep the squads moving, equipment working, and rebels alive. Veterans and rookies alike look to you to keep this war going day by day."

// -- SUPPORT STAFF --
/datum/job/scg_medic
	title = "Field Medic"
	total_positions = 3
	spawn_positions = 3
	supervisors = "your Squad Leader"
	department = "Solar Central Government"
	department_flag = SPT
	economic_power = 7
	minimum_character_age = list(SPECIES_HUMAN = 19)
	ideal_character_age = 40
	minimal_player_age = 0
	alt_titles = list(
		"Corpsman",
		"Paramedic",
		"Surgeon",
	)
	outfit_type = /singleton/hierarchy/outfit/job/gaia/scg/medic
	required_language = LANGUAGE_HUMAN_EURO
	selection_color = COLOR_SOL
	faction = MOB_FACTION_SCG
	create_record = FALSE
	allowed_branches = list(
		/datum/mil_branch/scga,
		/datum/mil_branch/fleet = /singleton/hierarchy/outfit/job/gaia/scg/medic/fleet,
		/datum/mil_branch/civilian = /singleton/hierarchy/outfit/job/gaia/scg/medic/civilain,
	)
	allowed_ranks = list(
		/datum/mil_rank/scga/o1,
		/datum/mil_rank/scga/e3,
		/datum/mil_rank/scga/e4,
		/datum/mil_rank/scga/e4_alt,
		/datum/mil_rank/scga/e5,
		/datum/mil_rank/fleet/o1,
		/datum/mil_rank/fleet/e3,
		/datum/mil_rank/fleet/e4,
		/datum/mil_rank/fleet/e5,
		/datum/mil_rank/civ/partisan,
	)
	min_skill = list(   SKILL_MEDICAL     = SKILL_BASIC,
	                    SKILL_ANATOMY     = SKILL_BASIC,
						SKILL_CHEMISTRY   = SKILL_BASIC,
	                    SKILL_HAULING     = SKILL_BASIC,
	                    SKILL_WEAPONS     = SKILL_BASIC)

	max_skill = list(   SKILL_MEDICAL     = SKILL_MAX,
	                    SKILL_ANATOMY     = SKILL_MAX,
	                    SKILL_CHEMISTRY   = SKILL_MAX,
	                    SKILL_COMBAT      = SKILL_TRAINED,
	                    SKILL_WEAPONS     = SKILL_TRAINED)

	access = list(
		access_medical, access_morgue, access_maint_tunnels,
		access_surgery, access_medical_equip, access_solgov_crew,
	)

	skill_points = 25

/datum/job/scg_engineer
	title = "Field Engineer"
	total_positions = 3
	spawn_positions = 3
	supervisors = "your Squad Leader"
	department = "Solar Central Government"
	department_flag = SPT
	economic_power = 5
	minimal_player_age = 0
	minimum_character_age = list(SPECIES_HUMAN = 19)
	ideal_character_age = 30
	alt_titles = list(
		"Damage Control Technician",
		"Municipal Engineer",
	)
	outfit_type = /singleton/hierarchy/outfit/job/gaia/scg/engineer
	required_language = LANGUAGE_HUMAN_EURO
	selection_color = COLOR_SOL
	faction = MOB_FACTION_SCG
	create_record = FALSE
	allowed_branches = list(
		/datum/mil_branch/scga,
		/datum/mil_branch/fleet = /singleton/hierarchy/outfit/job/gaia/scg/engineer/fleet,
		/datum/mil_branch/civilian = /singleton/hierarchy/outfit/job/gaia/scg/engineer/civilain,
	)
	allowed_ranks = list(
		/datum/mil_rank/scga/e3,
		/datum/mil_rank/scga/e4,
		/datum/mil_rank/scga/e4_alt,
		/datum/mil_rank/scga/e5,
		/datum/mil_rank/fleet/e3,
		/datum/mil_rank/fleet/e4,
		/datum/mil_rank/fleet/e5,
		/datum/mil_rank/civ/partisan,
	)
	min_skill = list(   SKILL_HAULING      = SKILL_BASIC,
	                    SKILL_WEAPONS      = SKILL_BASIC,
	                    SKILL_COMPUTER     = SKILL_BASIC,
	                    SKILL_CONSTRUCTION = SKILL_TRAINED,
	                    SKILL_ELECTRICAL   = SKILL_BASIC,
	                    SKILL_ATMOS        = SKILL_BASIC,
	                    SKILL_ENGINES      = SKILL_BASIC)

	max_skill = list(   SKILL_CONSTRUCTION = SKILL_MAX,
	                    SKILL_ELECTRICAL   = SKILL_MAX,
	                    SKILL_ATMOS        = SKILL_MAX,
	                    SKILL_ENGINES      = SKILL_MAX,
	                    SKILL_COMBAT       = SKILL_TRAINED,
	                    SKILL_WEAPONS      = SKILL_TRAINED)
	skill_points = 20

	access = list(
		access_maint_tunnels, access_engine, access_solgov_crew, access_network, access_network_admin
	)

// -- COMBAT (meatshields) --
/datum/job/scg_squad_leader
	title = "Squad Leader"
	total_positions = 3
	spawn_positions = 3
	supervisors = "the Platoon Sergeant and Commanding Officer"
	department = "Solar Central Government"
	department_flag = SPT
	economic_power = 10
	minimal_player_age = 0
	minimum_character_age = list(SPECIES_HUMAN = 23)
	ideal_character_age = 25
	outfit_type = /singleton/hierarchy/outfit/job/gaia/scg/squad_leader
	required_language = LANGUAGE_HUMAN_EURO
	selection_color = COLOR_ASSEMBLY_GOLD
	faction = MOB_FACTION_SCG
	head_position = TRUE
	create_record = FALSE
	allowed_branches = list(
		/datum/mil_branch/scga,
		/datum/mil_branch/fleet = /singleton/hierarchy/outfit/job/gaia/scg/squad_leader/fleet,
	)
	allowed_ranks = list(
		/datum/mil_rank/scga/e5,
		/datum/mil_rank/scga/e6,
		/datum/mil_rank/fleet/e5,
		/datum/mil_rank/fleet/e6,
	)
	min_skill = list(   SKILL_HAULING     = SKILL_BASIC,
	                    SKILL_COMBAT      = SKILL_BASIC,
	                    SKILL_WEAPONS     = SKILL_TRAINED)

	max_skill = list(   SKILL_COMBAT      = SKILL_EXPERIENCED,
	                    SKILL_WEAPONS     = SKILL_EXPERIENCED)
	skill_points = 20

	access = list(
		access_medical, access_morgue, access_maint_tunnels,
		access_surgery, access_medical_equip, access_solgov_crew,
		access_engine, access_heads
	)

/datum/job/scg_squad_leader/get_description_blurb()
	return "You are a Squad Leader in the SCG '[GLOB.using_map.station_name]' — a seasoned combatant responsible for leading partisans through the ruins of Gaia. You're the first into the breach and the last to leave, tasked with executing ambushes, sabotage, and hit-and-run missions under harsh conditions. It's your job to keep your fighters alive, disciplined, and mission-focused, even when cut off from higher command. Coordinate with the Platoon Sergeant, adapt to rapidly changing situations, and make decisions on the fly. Your squad looks to you for orders, protection, and example — don’t let them down."

/datum/job/scg_trooper
	title = "Trooper"
	total_positions = 12
	spawn_positions = 12
	supervisors = "your Squad Leader"
	department = "Solar Central Government"
	department_flag = SPT
	economic_power = 3
	minimal_player_age = 0
	minimum_character_age = list(SPECIES_HUMAN = 18)
	ideal_character_age = 22
	alt_titles = list(
		"Armsman",
		"Combatant",
	)
	outfit_type = /singleton/hierarchy/outfit/job/gaia/scg/trooper
	required_language = LANGUAGE_HUMAN_EURO
	selection_color = COLOR_SOL
	faction = MOB_FACTION_SCG
	create_record = FALSE
	allowed_branches = list(
		/datum/mil_branch/scga,
		/datum/mil_branch/fleet = /singleton/hierarchy/outfit/job/gaia/scg/trooper/fleet,
		/datum/mil_branch/civilian = /singleton/hierarchy/outfit/job/gaia/scg/trooper/civilain,
	)
	allowed_ranks = list(
		/datum/mil_rank/scga/e2,
		/datum/mil_rank/scga/e3,
		/datum/mil_rank/scga/e4,
		/datum/mil_rank/scga/e4_alt,
		/datum/mil_rank/fleet/e1,
		/datum/mil_rank/fleet/e2,
		/datum/mil_rank/fleet/e3,
		/datum/mil_rank/fleet/e4,
		/datum/mil_rank/civ/partisan,
	)
	min_skill = list(   SKILL_HAULING      = SKILL_BASIC,
	                    SKILL_WEAPONS     = SKILL_BASIC)

	max_skill = list(   SKILL_COMBAT      = SKILL_TRAINED,
	                    SKILL_WEAPONS     = SKILL_TRAINED)

	access = list(
		access_maint_tunnels, access_solgov_crew,
	)
