/datum/job/assistant // Assistant override for Gaia
	title = "Citizen"
	department = "Civilian"
	department_flag = CIV
	total_positions = -1
	spawn_positions = -1
	supervisors = "the local authorities and your judgement"
	alt_titles = list(
				"Homeless (No ID)" = /singleton/hierarchy/outfit/job/gaia/homeless,
				)
	economic_power = 1
	faction = MOB_FACTION_NEUTRAL
	access = list(access_maint_tunnels, access_commissary)
	outfit_type = /singleton/hierarchy/outfit/job/gaia/citizen

/datum/job/assistant/get_description_blurb()
	return "You are a citizen of the [GLOB.using_map.full_name]. Conflict has made your life difficult under ICCG occupation, but you're happy to at least be alive."

/datum/job/mayor
	title = "Town Mayor"
	department = "Civilian"
	department_flag = CIV
	total_positions = 1
	spawn_positions = 1
	supervisors = "the ICCG occupational forces and your judgement"
	alt_titles = list(
				"Region Governor",
				"County Council Head",
				"Facility Administrator",
				)
	economic_power = 10
	selection_color = COLOR_GRAY20
	faction = MOB_FACTION_NEUTRAL
	head_position = TRUE
	min_skill = list(SKILL_BUREAUCRACY = SKILL_TRAINED)

	access = list(access_maint_tunnels, access_security, access_sec_doors, access_sec_guard,
					access_armory, access_emergency_armory, access_emergency_storage,
					access_medical, access_medical_equip, access_mining,
					access_engine, access_engine_equip, access_atmospherics,
					access_bridge, access_change_ids, access_captain,
					access_radio_comm, access_radio_eng, access_radio_med, access_radio_sec)
	skill_points = 20
	outfit_type = /singleton/hierarchy/outfit/job/gaia/mayor

/datum/job/mayor/get_description_blurb()
	return "You are the mayor of this town. Whatever your history, your ambitions or your intentions, your goals right now are clear - to stay alive and stay in power."

/datum/job/police_officer
	title = "Police Officer"
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

	access = list(access_maint_tunnels, access_security, access_sec_doors, access_sec_guard,
					access_armory, access_emergency_armory, access_emergency_storage, access_radio_sec)
	skill_points = 20
	outfit_type = /singleton/hierarchy/outfit/job/gaia/police

/datum/job/police_officer/get_description_blurb()
	return "You are a police officer in active service with the local Police Force. You were assigned to a war-torn region to uphold public order and provide assistance to civilians."

/datum/job/paramedic
	title = "Paramedic"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the local authorities, Hippocratic oath and your judgement"
	alt_titles = list("Doctor" = /singleton/hierarchy/outfit/job/gaia/doctor)
	economic_power = 7
	minimum_character_age = list(SPECIES_HUMAN = 19)
	outfit_type = /singleton/hierarchy/outfit/job/gaia/paramedic
	min_skill = list(	SKILL_MEDICAL = SKILL_BASIC,
	                    SKILL_ANATOMY = SKILL_BASIC)

	max_skill = list(   SKILL_MEDICAL     = SKILL_MAX,
	                    SKILL_CHEMISTRY   = SKILL_MAX)

	access = list(access_maint_tunnels, access_medical, access_medical_equip, access_emergency_storage, access_radio_med)
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

	max_skill = list(	SKILL_COMBAT  = SKILL_EXPERIENCED)

	access = list(access_maint_tunnels, access_atmospherics, access_engine_equip, access_emergency_storage, access_radio_eng)
	skill_points = 20

/datum/job/firefighter/get_description_blurb()
	return "You are a firefighter in service of the town's fire station. You were given basic medical training to assist on calls. Rescue civilians from dangerous situations and provide assistance to them where you can."

/datum/job/worker
	title = "Municipal Engineer"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the local authorities and your judgement"
	alt_titles = list(
				"Construction Worker",
				"Shaft Miner" = /singleton/hierarchy/outfit/job/gaia/miner,
				)
	economic_power = 2
	minimum_character_age = list(SPECIES_HUMAN = 19)
	outfit_type = /singleton/hierarchy/outfit/job/gaia/worker

	min_skill = list(	SKILL_CONSTRUCTION = SKILL_BASIC,
						SKILL_HAULING      = SKILL_BASIC)

	max_skill = list(   SKILL_CONSTRUCTION = SKILL_MAX,
	                    SKILL_ELECTRICAL   = SKILL_MAX,
	                    SKILL_ATMOS        = SKILL_MAX,
	                    SKILL_ENGINES      = SKILL_MAX)

	access = list(access_maint_tunnels, access_mining, access_engine, access_engine_equip, access_emergency_storage, access_radio_eng)
	skill_points = 20

/datum/job/worker/get_description_blurb()
	return "You were a worker of sorts in town before most of it was turned into ruins. There is no more work for you, but you still have your blue-collar skillset. How to use it best is up to you."


/datum/job/priest
	title = "Priest"
	total_positions = 1
	spawn_positions = 1
	minimum_character_age = list(SPECIES_HUMAN = 24)
	economic_power = 6
	supervisors = "the local authorities, the God and your judgement"
	outfit_type = /singleton/hierarchy/outfit/job/gaia/chaplain
	min_skill = list(SKILL_BUREAUCRACY = SKILL_BASIC)

	access = list(access_maint_tunnels, access_chapel_office)

/datum/job/priest/get_description_blurb()
	return "You are a priest of the town's church. Perhaps you stayed behind to help out the locals or otherwise, but it doesn't matter. Keep yourself safe and provide shelter to anyone in the church."
