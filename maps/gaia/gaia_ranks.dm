/datum/job/submap
	branch = /datum/mil_branch/civilian
	rank =   /datum/mil_rank/civ/civ
	allowed_branches = list(/datum/mil_branch/civilian)
	allowed_ranks = list(/datum/mil_rank/civ/civ)
	required_language = LANGUAGE_HUMAN_IBERIAN // Native language of Gaia

/datum/map/gaia
	branch_types = list(
		/datum/mil_branch/fleet,
		/datum/mil_branch/civilian,
		/datum/mil_branch/alien,
		/datum/mil_branch/iccgn,
		/datum/mil_branch/scga,
		/datum/mil_branch/police
	)

	spawn_branch_types = list(
		/datum/mil_branch/fleet,
		/datum/mil_branch/civilian,
		/datum/mil_branch/alien,
		/datum/mil_branch/iccgn,
		/datum/mil_branch/scga,
		/datum/mil_branch/police
	)

	species_to_branch_blacklist = list(
		/datum/species/human   = list(/datum/mil_branch/alien),
		/datum/species/machine = list(/datum/mil_branch/alien),
		/datum/species/vox     = list(
			/datum/mil_branch/fleet,
			/datum/mil_branch/scga,
			/datum/mil_branch/civilian,
		)
	)

	species_to_branch_whitelist = list( // No non-humans fought except for the IPC
		/datum/species/diona        = list(/datum/mil_branch/alien),
		/datum/species/nabber       = list(/datum/mil_branch/alien),
		/datum/species/skrell       = list(/datum/mil_branch/alien),
		/datum/species/unathi       = list(/datum/mil_branch/alien),
		/datum/species/unathi/yeosa = list(/datum/mil_branch/alien),
		/datum/species/adherent     = list(/datum/mil_branch/alien),
		/datum/species/resomi       = list(/datum/mil_branch/alien),
		/datum/species/vox          = list(/datum/mil_branch/alien)
	)

	species_to_rank_whitelist = list(
		/datum/species/machine = list(
			/datum/mil_branch/fleet = list(
				/datum/mil_rank/fleet/e1,
				/datum/mil_rank/fleet/e2,
				/datum/mil_rank/fleet/e3,
				/datum/mil_rank/fleet/e4,
				/datum/mil_rank/fleet/e5,
				/datum/mil_rank/fleet/e6,
				/datum/mil_rank/fleet/e7,
				/datum/mil_rank/fleet/e8,
				/datum/mil_rank/fleet/e9,
				/datum/mil_rank/fleet/e9_alt1,
				/datum/mil_rank/fleet/o1,
			),
			/datum/mil_branch/scga = list(
				/datum/mil_rank/scga/e1,
				/datum/mil_rank/scga/e2,
				/datum/mil_rank/scga/e3,
				/datum/mil_rank/scga/e4,
				/datum/mil_rank/scga/e5,
				/datum/mil_rank/scga/e6,
				/datum/mil_rank/scga/e7,
				/datum/mil_rank/scga/e8,
				/datum/mil_rank/scga/e9,
				/datum/mil_rank/scga/e9_alt1,
				/datum/mil_rank/scga/o1,
			)
		),
		/datum/species/skrell = list(
			/datum/mil_branch/alien = list(
				/datum/mil_rank/alien
			)
		),
		/datum/species/unathi = list(
			/datum/mil_branch/alien = list(
				/datum/mil_rank/alien
			)
		),
		/datum/species/unathi/yeosa = list(
			/datum/mil_branch/alien = list(
				/datum/mil_rank/alien
			)
		),
		/datum/species/resomi = list(
			/datum/mil_branch/alien = list(
				/datum/mil_rank/alien
			)
		),
		/datum/species/vox = list(
			/datum/mil_branch/alien = list(
				/datum/mil_rank/alien
			)
		),
	)
/*
 *  Branches
 *  ========
 */

/datum/mil_branch/fleet
	name = "Fleet"
	name_short = "SCGF"
	email_domain = "fleet.mil.scg"

	rank_types = list(
		/datum/mil_rank/fleet/e1,
		/datum/mil_rank/fleet/e2,
		/datum/mil_rank/fleet/e3,
		/datum/mil_rank/fleet/e4,
		/datum/mil_rank/fleet/e5,
		/datum/mil_rank/fleet/e6,
		/datum/mil_rank/fleet/e7,
		/datum/mil_rank/fleet/e8,
		/datum/mil_rank/fleet/e9,
		/datum/mil_rank/fleet/e9_alt1,
		/datum/mil_rank/fleet/e9_alt2,
		/datum/mil_rank/fleet/e9_alt3,
		/datum/mil_rank/fleet/e9_alt4,
		/datum/mil_rank/fleet/o1,
		/datum/mil_rank/fleet/o2,
		/datum/mil_rank/fleet/o3,
		/datum/mil_rank/fleet/o4,
		/datum/mil_rank/fleet/o5,
		/datum/mil_rank/fleet/o6,
		/datum/mil_rank/fleet/o7,
		/datum/mil_rank/fleet/o8,
		/datum/mil_rank/fleet/o9,
		/datum/mil_rank/fleet/o10,
		/datum/mil_rank/fleet/o10_alt
	)

	spawn_rank_types = list(
		/datum/mil_rank/fleet/e2,
		/datum/mil_rank/fleet/e3,
		/datum/mil_rank/fleet/e4,
		/datum/mil_rank/fleet/e5,
		/datum/mil_rank/fleet/e6,
		/datum/mil_rank/fleet/e7,
		/datum/mil_rank/fleet/e8,
		/datum/mil_rank/fleet/e9,
		/datum/mil_rank/fleet/e9_alt1,
		/datum/mil_rank/fleet/o1,
		/datum/mil_rank/fleet/o2,
		/datum/mil_rank/fleet/o3,
		/datum/mil_rank/fleet/o4,
		/datum/mil_rank/fleet/o5
	)

	min_skill = list(	SKILL_HAULING = SKILL_BASIC,
						SKILL_WEAPONS = SKILL_BASIC,
						SKILL_EVA     = SKILL_BASIC)


/datum/mil_branch/civilian
	name = "Civilian"
	name_short = "Civ"
	email_domain = "freemail.gaia"
	allow_custom_email = TRUE

	rank_types = list(
		/datum/mil_rank/civ/civ,
		/datum/mil_rank/civ/synthetic,
		/datum/mil_rank/civ/partisan,
		/datum/mil_rank/civ/pmc,
	)

	spawn_rank_types = list(
		/datum/mil_rank/civ/civ,
		/datum/mil_rank/civ/synthetic,
		/datum/mil_rank/civ/partisan,
		/datum/mil_rank/civ/pmc,
	)

/datum/mil_branch/solgov
	name = "SolGov Employee"
	name_short = "SCG"
	email_domain = "gaia.scg"

	rank_types = list(
		/datum/mil_rank/sol/gov,
		/datum/mil_rank/sol/agent,
		/datum/mil_rank/sol/scientist
	)

	spawn_rank_types = list(
		/datum/mil_rank/sol/gov,
		/datum/mil_rank/sol/agent,
		/datum/mil_rank/sol/scientist
	)

/datum/mil_rank/grade()
	. = ..()
	if(!sort_order)
		return ""
	if(sort_order <= 10)
		return "E[sort_order]"
	return "O[sort_order - 10]"

// Within the scope of the Torch, this is the only necessary differentiation.
/datum/mil_rank/rank_category()
	. = ..()
	if(!sort_order)
		return null
	if(sort_order <= 10)
		return GET_SINGLETON(/singleton/rank_category/enlisted)
	else
		return GET_SINGLETON(/singleton/rank_category/commissioned)

/singleton/rank_category/enlisted
	name = "Enlisted"

/singleton/rank_category/commissioned
	name = "Commissioned"

/*
 *  Fleet
 *  =====
 */

/datum/mil_rank/fleet/e1
	name = "Crewman Recruit"
	name_short = "CR"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/fleet/enlisted, /obj/item/clothing/accessory/solgov/specialty/enlisted)
	sort_order = 1

/datum/mil_rank/fleet/e2
	name = "Crewman Apprentice"
	name_short = "CA"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/fleet/enlisted/e2, /obj/item/clothing/accessory/solgov/specialty/enlisted)
	sort_order = 2

/datum/mil_rank/fleet/e3
	name = "Crewman"
	name_short = "CN"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/fleet/enlisted/e3, /obj/item/clothing/accessory/solgov/specialty/enlisted)
	sort_order = 3

/datum/mil_rank/fleet/e4
	name = "Petty Officer Third Class"
	name_short = "PO3"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/fleet/enlisted/e4, /obj/item/clothing/accessory/solgov/specialty/enlisted)
	sort_order = 4

/datum/mil_rank/fleet/e5
	name = "Petty Officer Second Class"
	name_short = "PO2"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/fleet/enlisted/e5, /obj/item/clothing/accessory/solgov/specialty/enlisted)
	sort_order = 5

/datum/mil_rank/fleet/e6
	name = "Petty Officer First Class"
	name_short = "PO1"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/fleet/enlisted/e6, /obj/item/clothing/accessory/solgov/specialty/enlisted)
	sort_order = 6

/datum/mil_rank/fleet/e7
	name = "Chief Petty Officer"
	name_short = "CPO"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/fleet/enlisted/e7, /obj/item/clothing/accessory/solgov/specialty/enlisted)
	sort_order = 7

/datum/mil_rank/fleet/e8
	name = "Senior Chief Petty Officer"
	name_short = "SCPO"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/fleet/enlisted/e8, /obj/item/clothing/accessory/solgov/specialty/enlisted)
	sort_order = 8

/datum/mil_rank/fleet/e9
	name = "Master Chief Petty Officer"
	name_short = "MCPO"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/fleet/enlisted/e9, /obj/item/clothing/accessory/solgov/specialty/enlisted)
	sort_order = 9

/datum/mil_rank/fleet/e9_alt1
	name = "Command Master Chief Petty Officer"
	name_short = "CMCPO"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/fleet/enlisted/e9_alt1, /obj/item/clothing/accessory/solgov/specialty/enlisted)
	sort_order = 9

/datum/mil_rank/fleet/e9_alt2
	name = "Fleet Master Chief Petty Officer"
	name_short = "FLTCM"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/fleet/enlisted/e9_alt2, /obj/item/clothing/accessory/solgov/specialty/enlisted)
	sort_order = 9

/datum/mil_rank/fleet/e9_alt3
	name = "Force Master Chief Petty Officer"
	name_short = "FORCM"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/fleet/enlisted/e9_alt3, /obj/item/clothing/accessory/solgov/specialty/enlisted)
	sort_order = 9

/datum/mil_rank/fleet/e9_alt4
	name = "Master Chief Petty Officer of the Fleet"
	name_short = "MCPOF"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/fleet/enlisted/e9_alt4, /obj/item/clothing/accessory/solgov/specialty/enlisted)
	sort_order = 9

/datum/mil_rank/fleet/o1
	name = "Ensign"
	name_short = "ENS"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/fleet/officer, /obj/item/clothing/accessory/solgov/specialty/officer)
	sort_order = 11

/datum/mil_rank/fleet/o2
	name = "Sub-lieutenant"
	name_short = "SLT"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/fleet/officer/o2, /obj/item/clothing/accessory/solgov/specialty/officer)
	sort_order = 12

/datum/mil_rank/fleet/o3
	name = "Lieutenant"
	name_short = "LT"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/fleet/officer/o3, /obj/item/clothing/accessory/solgov/specialty/officer)
	sort_order = 13

/datum/mil_rank/fleet/o4
	name = "Lieutenant Commander"
	name_short = "LCDR"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/fleet/officer/o4, /obj/item/clothing/accessory/solgov/specialty/officer)
	sort_order = 14

/datum/mil_rank/fleet/o5
	name = "Commander"
	name_short = "CDR"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/fleet/officer/o5, /obj/item/clothing/accessory/solgov/specialty/officer)
	sort_order = 15

/datum/mil_rank/fleet/o6
	name = "Captain"
	name_short = "CAPT"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/fleet/officer/o6, /obj/item/clothing/accessory/solgov/specialty/officer)
	sort_order = 16

/datum/mil_rank/fleet/o7
	name = "Commodore"
	name_short = "CDRE"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/fleet/flag, /obj/item/clothing/accessory/solgov/specialty/officer)
	sort_order = 17

/datum/mil_rank/fleet/o8
	name = "Rear Admiral"
	name_short = "RADM"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/fleet/flag/o8, /obj/item/clothing/accessory/solgov/specialty/officer)
	sort_order = 18

/datum/mil_rank/fleet/o9
	name = "Vice Admiral"
	name_short = "VADM"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/fleet/flag/o9, /obj/item/clothing/accessory/solgov/specialty/officer)
	sort_order = 19

/datum/mil_rank/fleet/o10
	name = "Admiral"
	name_short = "ADM"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/fleet/flag/o10, /obj/item/clothing/accessory/solgov/specialty/officer)
	sort_order = 20

/datum/mil_rank/fleet/o10_alt
	name = "Fleet Admiral"
	name_short = "FADM"
	accessory = list(/obj/item/clothing/accessory/solgov/rank/fleet/flag/o10_alt, /obj/item/clothing/accessory/solgov/specialty/officer)
	sort_order = 20


/*
 *  Civilians
 *  =========
 */

/datum/mil_rank/civ/civ
	name = "Civilian"

/datum/mil_rank/civ/synthetic
	name = "Synthetic"

/datum/mil_rank/civ/partisan // SolGov sympathizers, ICCG ones are fully integrated into their army.
	name = "Partisan"
	accessory = list(/obj/item/clothing/accessory/scga_rank/e1)

/datum/mil_rank/civ/pmc
	name = "Military Contractor"
	name_short = "PMC"

/*
 *  SolGov Employees
 *  ====== =========
 */

/datum/mil_rank/sol/gov
	name = "SolGov Representative"
	name_short = "SGR"
	accessory = list(/obj/item/clothing/accessory/badge/solgov/representative)

/datum/mil_rank/sol/agent
	name = "SFP Agent"
	name_short = "AGT"
	accessory = list(/obj/item/clothing/accessory/badge/agent)

/datum/mil_rank/sol/scientist
	name = "Government Scientist"
	name_short = "GOVT"

// Vox/foreign alien branch.
/datum/mil_branch/alien
	name = "Alien"
	name_short = "Alien"
	rank_types = list(/datum/mil_rank/alien)
	spawn_rank_types = list(/datum/mil_rank/alien)

/datum/mil_rank/alien
	name = "Alien"

/*
 *  Gaian Police
 *	===== ======
 */

/datum/mil_branch/police
	name = "Napoleon Region Police Force"
	name_short = "NRPF"
	email_domain = "nrpf.gaia.scg"

	rank_types = list(
		/datum/mil_rank/police/officer,
		/datum/mil_rank/police/sergeant,
		/datum/mil_rank/police/detective
	)

	spawn_rank_types = list(
		/datum/mil_rank/police/officer,
		/datum/mil_rank/police/sergeant,
		/datum/mil_rank/police/detective
	)

/datum/mil_rank/police/officer
	name = "Patrol Officer"
	name_short = "POFC"
	accessory = list(/obj/item/clothing/accessory/badge/holo/gaiacop)
	sort_order = 2

/datum/mil_rank/police/sergeant
	name = "Patrol Sergeant"
	name_short = "PSGT"
	accessory = list(/obj/item/clothing/accessory/badge/holo/gaiacop/sergeant)
	sort_order = 4

/datum/mil_rank/police/detective
	name = "Detective Officer"
	name_short = "DOFC"
	accessory = list(/obj/item/clothing/accessory/badge/holo/gaiacop/detective)
	sort_order = 3