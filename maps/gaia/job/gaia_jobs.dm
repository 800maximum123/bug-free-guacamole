/datum/map/gaia
	species_to_job_whitelist = list(
		/datum/species/machine = list(
			/datum/job/scg_engineer,
			/datum/job/scg_medic,
			/datum/job/scg_trooper
		),
	)

#define ALL_JOBS list(/datum/job/scg_co, /datum/job/scg_engineer, /datum/job/scg_medic, /datum/job/scg_ps, /datum/job/scg_squad_leader, /datum/job/scg_trooper, \
			/datum/job/iccg_co, /datum/job/iccg_engineer, /datum/job/iccg_medic, /datum/job/iccg_mp, /datum/job/iccg_squad_leader, /datum/job/iccg_trooper, /datum/job/iccg_xo, \
			/datum/job/mayor, /datum/job/policeman, /datum/job/paramedic, /datum/job/firefighter, /datum/job/worker, /datum/job/priest)
#define ICCG_JOBS list(/datum/job/iccg_co, /datum/job/iccg_engineer, /datum/job/iccg_medic, /datum/job/iccg_mp, /datum/job/iccg_squad_leader, /datum/job/iccg_trooper, /datum/job/iccg_xo)

	species_to_job_blacklist = list(
		/datum/species/unathi  = list(ALL_JOBS),
		/datum/species/unathi/yeosa = list(ALL_JOBS),
		/datum/species/skrell  = list(ALL_JOBS),
		/datum/species/machine = list(ICCG_JOBS, /datum/job/scg_co, /datum/job/scg_ps, /datum/job/scg_squad_leader),
		/datum/species/diona   = list(ALL_JOBS),
	)
#undef ALL_JOBS
#undef ICCG_JOBS

	allowed_jobs = list(
		/datum/job/scg_co, /datum/job/scg_ps, /datum/job/scg_squad_leader, /datum/job/scg_engineer, /datum/job/scg_medic, /datum/job/scg_trooper,
		/datum/job/iccg_co, /datum/job/iccg_xo, /datum/job/iccg_mp, /datum/job/iccg_squad_leader, /datum/job/iccg_engineer, /datum/job/iccg_medic, /datum/job/iccg_trooper,
		/datum/job/mayor, /datum/job/policeman, /datum/job/paramedic, /datum/job/firefighter, /datum/job/worker, /datum/job/priest
	)

	access_modify_region = list(
		ACCESS_REGION_SECURITY = list(access_change_ids),
		ACCESS_REGION_MEDBAY = list(access_change_ids),
		ACCESS_REGION_RESEARCH = list(access_change_ids),
		ACCESS_REGION_ENGINEERING = list(access_change_ids),
		ACCESS_REGION_COMMAND = list(access_change_ids),
		ACCESS_REGION_GENERAL = list(access_change_ids),
		ACCESS_REGION_SUPPLY = list(access_change_ids),
		ACCESS_REGION_SERVICE = list(access_change_ids)
	)

/datum/job
	allowed_branches = list(
		/datum/mil_branch/civilian
	)
	allowed_ranks = list(
		/datum/mil_rank/civ/civ
	)
	required_language = LANGUAGE_HUMAN_IBERIAN

/datum/job/assistant // Assistant override for Gaia
	title = "Citizen"
	department = "Civilian"
	department_flag = CIV
	total_positions = -1
	spawn_positions = -1
	supervisors = "the authorities and survival instincts"
	alt_titles = list(
				"Shaft Miner" = /singleton/hierarchy/outfit/job/gaia/miner
				)
	economic_power = 1
	faction = MOB_FACTION_NEUTRAL
	access = list(access_maint_tunnels, access_mining)
	outfit_type = /singleton/hierarchy/outfit/job/assistant

/datum/job/assistant/get_description_blurb()
	return "You are a citizen of the [GLOB.using_map.full_name]. Conflict has made your life difficult under ICCG occupation, but you're happy to at least be alive."

/datum/job/mayor
	title = "Town Mayor"
	department = "Civilian"
	department_flag = CIV
	total_positions = 1
	spawn_positions = 1
	supervisors = "the ICCG occupational forces and your judgement"
	economic_power = 10
	faction = MOB_FACTION_NEUTRAL
	min_skill = list( SKILL_BUREAUCRACY = SKILL_TRAINED)

	access = list(access_maint_tunnels, access_mining)
	skill_points = 20
	outfit_type = /singleton/hierarchy/outfit/job/gaia/mayor

/datum/job/mayor/get_description_blurb()
	return "You are the mayor of this town. Whatever your history, your ambitions or your intentions, your goals right now are clear - to stay alive and stay in power."

/datum/job/policeman
	title = "Policeman"
	department = "Civilian"
	department_flag = CIV
	total_positions = 2
	spawn_positions = 2
	supervisors = "the local government representatives and police force headquarters"
	economic_power = 5
	faction = MOB_FACTION_NEUTRAL
	allowed_branches = list(
		/datum/mil_branch/police,
	)
	allowed_ranks = list(
		/datum/mil_rank/police/officer,
		/datum/mil_rank/police/sergeant,
		/datum/mil_rank/police/detective
	)
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_BASIC,
	                    SKILL_FORENSICS   = SKILL_BASIC,
	                    SKILL_COMBAT      = SKILL_BASIC,
	                    SKILL_WEAPONS     = SKILL_BASIC)

	max_skill = list(   SKILL_COMBAT      = SKILL_EXPERIENCED,
	                    SKILL_WEAPONS     = SKILL_EXPERIENCED)

	access = list(access_maint_tunnels, access_mining)
	skill_points = 20
	outfit_type = /singleton/hierarchy/outfit/job/gaia/police

/datum/job/policeman/get_description_blurb()
	return "You are a policeman in active service with the local Police Force. You were assigned to a war-torn region to uphold public order and provide assistance to civilians."

/datum/job/paramedic
	title = "Paramedic"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the local authorities, Hippocratic oath and your judgement"
	economic_power = 7
	minimum_character_age = list(SPECIES_HUMAN = 19)
	outfit_type = /singleton/hierarchy/outfit/job/gaia/paramedic
	min_skill = list(	SKILL_MEDICAL = SKILL_BASIC,
	                    SKILL_ANATOMY = SKILL_BASIC)

	max_skill = list(   SKILL_MEDICAL     = SKILL_MAX,
	                    SKILL_CHEMISTRY   = SKILL_MAX)

	access = list(access_maint_tunnels, access_mining)
	skill_points = 22

/datum/job/paramedic/get_description_blurb()
	return "You are a paramedic, previously in service with the town's hospital. You are the only medical personnel left. Provide healthcare to those who need it - or not, the choice is yours."

/datum/job/firefighter
	title = "Firefighter"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the local authorities and your judgement"
	economic_power = 5
	minimum_character_age = list(SPECIES_HUMAN = 19)
	outfit_type = /singleton/hierarchy/outfit/job/gaia/firefighter
	min_skill = list(	SKILL_HAULING = SKILL_BASIC,
						SKILL_MEDICAL = SKILL_BASIC,
						SKILL_COMBAT  = SKILL_BASIC)

	max_skill = list(   SKILL_COMBAT     = SKILL_EXPERIENCED)

	access = list(access_maint_tunnels, access_mining)
	skill_points = 20

/datum/job/firefighter/get_description_blurb()
	return "You are a firefighter in service of the town's fire station. You were given basic medical training to assist on calls. Rescue civilians from dangerous situations and provide assistance to them where you can."

/datum/job/worker
	title = "Construction Worker"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the local authorities and your judgement"
	economic_power = 2
	minimum_character_age = list(SPECIES_HUMAN = 19)
	outfit_type = /singleton/hierarchy/outfit/job/gaia/worker
	min_skill = list(	SKILL_CONSTRUCTION = SKILL_BASIC,
						SKILL_HAULING      = SKILL_BASIC)

	max_skill = list(   SKILL_CONSTRUCTION = SKILL_MAX,
	                    SKILL_ELECTRICAL   = SKILL_MAX,
	                    SKILL_ATMOS        = SKILL_MAX,
	                    SKILL_ENGINES      = SKILL_MAX)

	access = list(access_maint_tunnels, access_mining)
	skill_points = 20

/datum/job/worker/get_description_blurb()
	return "You were a worker on a construction site in town before most of it was turned into ruins. There is no more work for you, but you still have your blue-collar skillset. How to use it best is up to you."


/datum/job/priest
	title = "Priest"
	total_positions = 1
	spawn_positions = 1
	minimum_character_age = list(SPECIES_HUMAN = 24)
	economic_power = 6
	supervisors = "the local authorities, God and your judgement"
	outfit_type = /singleton/hierarchy/outfit/job/gaia/chaplain
	min_skill = list(SKILL_BUREAUCRACY = SKILL_BASIC)

	access = list(access_maint_tunnels, access_mining)

/datum/job/priest/get_description_blurb()
	return "You are a priest of the town's Christian church. Perhaps you stayed behind to help out the locals or otherwise, but it doesn't matter. Keep yourself safe and provide shelter to anyone in the church."


/datum/map/gaia
	default_assistant_title = "Citizen"
