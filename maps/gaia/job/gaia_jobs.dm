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
			/datum/job/mayor, /datum/job/police_officer, /datum/job/paramedic, /datum/job/firefighter, /datum/job/worker, /datum/job/priest, /datum/job/scg_montogomery, /datum/job/iccg_alistratova)
#define ICCG_JOBS list(/datum/job/iccg_co, /datum/job/iccg_engineer, /datum/job/iccg_medic, /datum/job/iccg_mp, /datum/job/iccg_squad_leader, /datum/job/iccg_trooper, /datum/job/iccg_xo, /datum/job/iccg_alistratova)

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
		/datum/job/mayor, /datum/job/police_officer, /datum/job/paramedic, /datum/job/firefighter, /datum/job/worker, /datum/job/priest,
		/datum/job/scg_montogomery, /datum/job/iccg_alistratova,
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

/datum/map/gaia
	default_assistant_title = "Citizen"
