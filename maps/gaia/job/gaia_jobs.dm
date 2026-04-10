/datum/map/gaia
	species_to_job_whitelist = list(
		/datum/species/machine = list(
			/datum/job/scg_engineer,
			/datum/job/scg_medic,
			/datum/job/scg_trooper
		),
	)

#define ALL_JOBS list(/datum/job/scg_co, /datum/job/scg_engineer, /datum/job/scg_medic, /datum/job/scg_ps, /datum/job/scg_squad_leader, /datum/job/scg_trooper, \
			/datum/job/iccg_co, /datum/job/iccg_engineer, /datum/job/iccg_medic, /datum/job/iccg_mp, /datum/job/iccg_squad_leader, /datum/job/iccg_trooper, /datum/job/iccg_xo)
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
				"Police Officer" = /singleton/hierarchy/outfit/job/gaia/police,
				"Paramedic" = /singleton/hierarchy/outfit/job/gaia/paramedic,
				"Firefighter" = /singleton/hierarchy/outfit/job/gaia/firefighter,
				"Construction Worker" = /singleton/hierarchy/outfit/job/gaia/worker,
				"Mayor" = /singleton/hierarchy/outfit/job/gaia/mayor,
				"Chaplain" = /singleton/hierarchy/outfit/job/gaia/chaplain,
				"Shaft Miner" = /singleton/hierarchy/outfit/job/gaia/miner,
				)
	economic_power = 1
	faction = MOB_FACTION_NEUTRAL
	access = list(access_maint_tunnels, access_mining)
	outfit_type = /singleton/hierarchy/outfit/job/assistant

/datum/job/assistant/get_description_blurb()
	return "You are a citizen of the [GLOB.using_map.full_name]. Conflict has made your life difficult under ICCG occupation, but you're happy to at least be alive."

/datum/map/gaia
	default_assistant_title = "Citizen"
