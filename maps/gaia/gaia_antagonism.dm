// GAIAN ANTAGONISM
#define ALL_JOBS list(/datum/job/scg_co, /datum/job/scg_engineer, /datum/job/scg_medic, /datum/job/scg_ps, /datum/job/scg_squad_leader, /datum/job/scg_trooper, \
			/datum/job/iccg_co, /datum/job/iccg_engineer, /datum/job/iccg_medic, /datum/job/iccg_mp, /datum/job/iccg_squad_leader, /datum/job/iccg_trooper, /datum/job/iccg_xo)
/*
#define ICCG_JOBS list(/datum/job/iccg_co, /datum/job/iccg_engineer, /datum/job/iccg_medic, /datum/job/iccg_mp, /datum/job/iccg_squad_leader, /datum/job/iccg_trooper, /datum/job/iccg_xo)
#define SCG_JOBS list(/datum/job/scg_co, /datum/job/scg_engineer, /datum/job/scg_medic, /datum/job/scg_ps, /datum/job/scg_squad_leader, /datum/job/scg_trooper)
*/

// Tarkov??? SOON(TM)
/datum/antagonist/cultist
	blacklisted_jobs = ALL_JOBS
	restricted_jobs = null

// GAIAN PARTISAN GAMEMODE START
/datum/antagonist/loyalists
	id = MODE_LOYALIST
	role_text = "Head Loyalist"
	role_text_plural = "Loyalists"
	feedback_tag = "loyalist_objective"
	antag_indicator = "hud_loyal_head"
	welcome_text = "GILGAMESH SHINGES BRIGHTER THEN SOL! GAIA IS OURS!"
	victory_text = "The partisans been crushed! The ICCG retains control!"
	loss_text = "ICCG has failed to maintain control!"
	victory_feedback_tag = "win - partisan heads killed"
	loss_feedback_tag = "loss - partisans completed objectives"
	antaghud_indicator = "hud_loyal"
	flags = 0

	hard_cap = 2
	hard_cap_round = 4
	initial_spawn_req = 2
	initial_spawn_target = 4

	// Inround loyalists.
	faction_role_text = "Loyalist"
	faction_descriptor = "ICCG"
	faction_welcome = "Preserve ICCG's control over Gaia against the traitorous partisans amongst the citizens!"
	faction_verb = /mob/living/proc/convert_to_loyalist
	faction_indicator = "hud_loyal"
	faction_invisible = 1
	skill_setter = /datum/antag_skill_setter/station

	faction = MOB_FACTION_ICCG
	blacklisted_jobs = ALL_JOBS
	restricted_jobs = ALL_JOBS

/datum/antagonist/loyalists/create_global_objectives()
	if(!..())
		return
	var/datum/objective/protect/loyal_obj = new
	loyal_obj.explanation_text = "Stop the partisans. Follow orders of the Loyalist Leader."
	global_objectives += loyal_obj

/datum/antagonist/revolutionary
	id = MODE_REVOLUTIONARY
	role_text = "Head Partisan"
	role_text_plural = "Partisans"
	feedback_tag = "rev_objective"
	antag_indicator = "hud_rev_head"
	welcome_text = "SIC SEMPER TYRANNIS! LIBERTAS ET LIBERTAS VEL MORS!"
	victory_text = "Partisans have succeeded! ICCG forces have been driven out for now..."
	loss_text = "ICCG forces managed to crush the partisans!"
	victory_feedback_tag = "win - partisans completed objectives"
	loss_feedback_tag = "loss - partisans crushed"
	flags = ANTAG_SUSPICIOUS | ANTAG_VOTABLE
	antaghud_indicator = "hud_rev"
	skill_setter = /datum/antag_skill_setter/station

	hard_cap = 2
	hard_cap_round = 4
	initial_spawn_req = 2
	initial_spawn_target = 4

	//Inround revs.
	faction_role_text = "Partisan"
	faction_descriptor = "SCG"
	faction_welcome = "Help the SCG liberate Gaia from ICCG occupation. Do not harm your fellow freedom fighters."
	faction = MOB_FACTION_SCG

	blacklisted_jobs = ALL_JOBS
	restricted_jobs = ALL_JOBS

/datum/antagonist/revolutionary/create_global_objectives()
	if(!..())
		return
	var/datum/objective/rev/rev_obj = new
	rev_obj.explanation_text = "Disrupt the ICCG operations in the Area of OP. Follow orders of the Partisan Leader."
	global_objectives += rev_obj

/datum/antagonist/revolutionary/equip(mob/living/carbon/human/revolutionary_mob)
	spawn_uplink(revolutionary_mob)
	. = ..()
	if(!.)
		return

/datum/antagonist/revolutionary/spawn_uplink(mob/living/carbon/human/revolutionary_mob)
	setup_uplink_source(revolutionary_mob, DEFAULT_TELECRYSTAL_AMOUNT)

// PMCs are "antags" since they get their gear from uplinks. They also don't get paid to win :P
GLOBAL_DATUM_INIT(pmcs, /datum/antagonist/pmc, new)

/datum/antagonist/pmc
	id = MODE_MISC_PMC
	role_text = "Private Military Contractor"
	role_text_plural = "PMCs"
	antaghud_indicator = "hud_traitor"
	flags = ANTAG_RANDOM_EXCEPTED
	antag_text = "You are a PMC Operator, tasked with assisting ICCG forces on the planet in their tasks. Fight those pesky Solarians and remember: you're not getting paid to be a hero!"
	welcome_text = "Welcome to Gaia, dear Operator!"
	blacklisted_jobs = list()
	skill_setter = null
	min_player_age = 0

	var/antag_text_updated
	no_prior_faction = TRUE

/datum/job/post_equip_rank(mob/person, alt_title)
	..()
	var/mob/living/carbon/human/player = person

	if(player.char_rank == /datum/mil_rank/civ/pmc)
		GLOB.pmcs.add_antagonist(player.mind)

/datum/antagonist/pmc/equip(mob/living/carbon/human/pmc_mob)
	spawn_uplink(pmc_mob)

/datum/antagonist/pmc/proc/spawn_uplink(mob/living/carbon/human/pmc_mob)
	setup_uplink_source(pmc_mob, DEFAULT_TELECRYSTAL_AMOUNT)


#undef ALL_JOBS
/*
#undef ICCG_JOBS
#undef SCG_JOBS
*/