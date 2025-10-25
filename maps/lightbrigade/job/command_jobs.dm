/datum/job/captain
	title = "Commanding Officer"
	supervisors = "the Sol Central Government and the Sol Code of Uniform Justice"
	minimal_player_age = 14
	economic_power = 16
	minimum_character_age = list(SPECIES_HUMAN = 40)
	ideal_character_age = 50
	outfit_type = /singleton/hierarchy/outfit/job/lightbrigade/crew/CO
	allowed_branches = list(
		/datum/mil_branch/fleet
	)
	allowed_ranks = list(/datum/mil_rank/fleet/o6)

	min_skill = list(   SKILL_BUREAUCRACY = SKILL_BASIC,
	                    SKILL_PILOT       = SKILL_TRAINED)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX,
						SKILL_COMBAT      = SKILL_EXPERIENCED,
						SKILL_WEAPONS     = SKILL_EXPERIENCED,
	                    SKILL_SCIENCE     = SKILL_MAX)
	skill_points = 32

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/card_mod,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)

/datum/job/captain/get_description_blurb()
	return "You are the Commanding Officer. You are the top dog. You are an experienced professional officer in control of an entire ship, and ultimately responsible for all that happens onboard. Your job is to make sure [GLOB.using_map.full_name] fulfils its designated mission. Delegate to your Executive Officer and department heads to effectively manage the warship, listen to and trust their expertise."

/datum/job/captain/post_equip_rank(mob/person, alt_title)
	var/sound/announce_sound = (GAME_STATE <= RUNLEVEL_SETUP)? null : sound('sound/misc/boatswain.ogg', volume=20)
	captain_announcement.Announce("All hands, [alt_title || title] [person.real_name] on deck!", new_sound = announce_sound)
	..()

/datum/job/hop
	title = "Executive Officer"
	supervisors = "the Commanding Officer"
	department = "Command"
	department_flag = COM
	minimal_player_age = 14
	economic_power = 14
	minimum_character_age = list(SPECIES_HUMAN = 35)
	ideal_character_age = 45
	outfit_type = /singleton/hierarchy/outfit/job/torch/crew/command/XO/fleet
	allowed_branches = list(
		/datum/mil_branch/fleet
	)
	allowed_ranks = list(/datum/mil_rank/fleet/o5)

	min_skill = list(   SKILL_BUREAUCRACY = SKILL_TRAINED,
	                    SKILL_COMPUTER    = SKILL_BASIC,
	                    SKILL_PILOT       = SKILL_BASIC)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX,
	                    SKILL_SCIENCE     = SKILL_MAX)
	skill_points = 30

	access = list(
		access_security, access_brig, access_armory, access_forensics_lockers, access_heads, access_medical, access_morgue, access_tox, access_tox_storage,
		access_engine, access_engine_equip, access_maint_tunnels, access_external_airlocks, access_emergency_storage, access_change_ids,
		access_ai_upload, access_teleporter, access_eva, access_bridge, access_all_personal_lockers, access_chapel_office, access_tech_storage,
		access_atmospherics, access_janitor, access_crematorium, access_kitchen, access_robotics, access_cargo, access_construction,
		access_chemistry, access_cargo_bot, access_hydroponics, access_manufacturing, access_library, access_lawyer, access_virology, access_cmo,
		access_qm, access_network, access_network_admin, access_surgery, access_research, access_mining, access_mining_office, access_mailsorting, access_heads_vault,
		access_mining_station, access_xenobiology, access_ce, access_hop, access_hos, access_RC_announce, access_keycard_auth, access_tcomsat,
		access_gateway, access_sec_doors, access_research_security, access_psychiatrist, access_xenoarch, access_medical_equip, access_heads, access_hangar, access_guppy_helm,
		access_expedition_shuttle_helm, access_aquila, access_aquila_helm, access_solgov_crew, access_nanotrasen,
		access_emergency_armory, access_gun, access_expedition_shuttle, access_guppy, access_seneng, access_senmed,
		access_explorer, access_pathfinder, access_pilot, access_commissary, access_petrov, access_petrov_helm, access_petrov_analysis, access_petrov_phoron,
		access_petrov_toxins, access_petrov_chemistry, access_petrov_control, access_petrov_maint, access_rd, access_petrov_rd, access_torch_fax, access_torch_helm,
		access_radio_comm, access_radio_eng, access_radio_med, access_radio_sec, access_radio_sup, access_radio_serv, access_radio_exp, access_radio_sci
	)

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/card_mod,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)

/datum/job/hop/get_description_blurb()
	return "You are the Executive Officer. You are an experienced senior officer, second in command of the ship, and are responsible for the smooth operation of the ship under your Commanding Officer. In their absence, you are expected to take their place. Your primary duty is directly managing department heads and all those outside a department heading. Consider the other Officers tools at your disposal."


/datum/job/cmo
	title = "Medical Officer"
	supervisors = "the Commanding Officer and the Executive Officer"
	economic_power = 14
	minimal_player_age = 14
	minimum_character_age = list(SPECIES_HUMAN = 30)
	ideal_character_age = 42
	outfit_type = /singleton/hierarchy/outfit/job/torch/crew/command/cmo/fleet
	allowed_branches = list(
		/datum/mil_branch/fleet
	)
	allowed_ranks = list(
		/datum/mil_rank/fleet/o3,
		/datum/mil_rank/fleet/o4
	)
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_BASIC,
	                    SKILL_MEDICAL     = SKILL_EXPERIENCED,
	                    SKILL_ANATOMY     = SKILL_EXPERIENCED,
	                    SKILL_CHEMISTRY   = SKILL_TRAINED,
						SKILL_DEVICES     = SKILL_TRAINED)

	max_skill = list(   SKILL_MEDICAL     = SKILL_MAX,
	                    SKILL_ANATOMY     = SKILL_MAX,
	                    SKILL_CHEMISTRY   = SKILL_MAX)
	skill_points = 26

	access = list(
		access_medical, access_morgue, access_maint_tunnels, access_external_airlocks, access_emergency_storage,
		access_teleporter, access_eva, access_bridge, access_heads,
		access_chapel_office, access_crematorium, access_chemistry, access_virology, access_aquila,
		access_cmo, access_surgery, access_RC_announce, access_keycard_auth, access_psychiatrist,
		access_medical_equip, access_solgov_crew, access_senmed, access_hangar, access_torch_fax, access_radio_comm,
		access_radio_med
	)

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/suit_sensors,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)

/datum/job/cmo/get_description_blurb()
	return "You are the Medical Officer. You manage the medical department. You ensure medical technicians are skilled, tasked and handling their duties. You are expected to manage chemistry and surgery. Despite this, you are a staff officer - you do not give orders on your own outside of your specialty."

/datum/job/chief_engineer
	title = "Chief Engineer"
	supervisors = "the Commanding Officer and the Executive Officer"
	economic_power = 12
	minimum_character_age = list(SPECIES_HUMAN = 25)
	ideal_character_age = 40
	minimal_player_age = 14
	outfit_type = /singleton/hierarchy/outfit/job/torch/crew/command/chief_engineer/fleet
	allowed_branches = list(
		/datum/mil_branch/fleet
	)
	allowed_ranks = list(
		/datum/mil_rank/fleet/o3,
		/datum/mil_rank/fleet/o4
	)
	min_skill = list(   SKILL_BUREAUCRACY  = SKILL_BASIC,
	                    SKILL_COMPUTER     = SKILL_TRAINED,
	                    SKILL_EVA          = SKILL_TRAINED,
	                    SKILL_CONSTRUCTION = SKILL_TRAINED,
	                    SKILL_ELECTRICAL   = SKILL_TRAINED,
	                    SKILL_ATMOS        = SKILL_TRAINED,
	                    SKILL_ENGINES      = SKILL_EXPERIENCED)

	max_skill = list(   SKILL_CONSTRUCTION = SKILL_MAX,
	                    SKILL_ELECTRICAL   = SKILL_MAX,
	                    SKILL_ATMOS        = SKILL_MAX,
	                    SKILL_ENGINES      = SKILL_MAX)
	skill_points = 30

	access = list(
		access_engine, access_engine_equip, access_maint_tunnels, access_external_airlocks, access_emergency_storage,
		access_ai_upload, access_teleporter, access_eva, access_bridge, access_heads,
		access_tech_storage, access_robotics, access_atmospherics, access_janitor, access_construction,
		access_network, access_network_admin, access_ce, access_RC_announce, access_keycard_auth, access_tcomsat,
		access_solgov_crew, access_aquila, access_seneng, access_hangar, access_torch_fax, access_torch_helm, access_radio_comm,
		access_radio_eng
		)

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/ntnetmonitor,
							 /datum/computer_file/program/power_monitor,
							 /datum/computer_file/program/supermatter_monitor,
							 /datum/computer_file/program/alarm_monitor,
							 /datum/computer_file/program/atmos_control,
							 /datum/computer_file/program/rcon_console,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/shields_monitor,
							 /datum/computer_file/program/reports)

/datum/job/chief_engineer/get_description_blurb()
	return "You are the Chief Engineer. You manage the Engineering Department. You are responsible for the Senior engineer, who is your right hand and (should be) an experienced, skilled engineer. Delegate to and listen to them. Manage your engineers, ensure the warship is combat-capable, breaches are patched and problems are fixed. Advise the CO on engineering and damage control matters. You are also responsible for the maintenance and control of any vessel synthetics."


/*
/datum/job/sea
	title = "Senior Enlisted Advisor"
	department = "Support"
	department_flag = SPT
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Commanding Officer and the Executive Officer"
	selection_color = "#2f2f7f"
	minimal_player_age = 14
	economic_power = 11
	minimum_character_age = list(SPECIES_HUMAN = 32)
	ideal_character_age = 45
	outfit_type = /singleton/hierarchy/outfit/job/torch/crew/command/sea/fleet
	allowed_branches = list(
		/datum/mil_branch/fleet
	)
	allowed_ranks = list(
		/datum/mil_rank/fleet/e7,
		/datum/mil_rank/fleet/e8
	)
	min_skill = list(   SKILL_EVA        = SKILL_BASIC,
	                    SKILL_COMBAT     = SKILL_BASIC,
	                    SKILL_WEAPONS    = SKILL_BASIC)

	max_skill = list(	SKILL_PILOT        = SKILL_TRAINED,
	                    SKILL_COMBAT       = SKILL_EXPERIENCED,
	                    SKILL_WEAPONS      = SKILL_EXPERIENCED,
	                    SKILL_CONSTRUCTION = SKILL_MAX,
	                    SKILL_ELECTRICAL   = SKILL_MAX,
	                    SKILL_ENGINES      = SKILL_MAX,
	                    SKILL_ATMOS        = SKILL_MAX)
	skill_points = 28


	access = list(
		access_security, access_medical, access_engine, access_maint_tunnels, access_external_airlocks, access_emergency_storage,
		access_teleporter, access_eva, access_bridge, access_all_personal_lockers, access_janitor,
		access_kitchen, access_cargo, access_RC_announce, access_keycard_auth, access_aquila, access_guppy_helm,
		access_solgov_crew, access_gun, access_expedition_shuttle, access_guppy, access_senadv, access_hangar, access_torch_fax,
		access_radio_comm, access_radio_eng, access_radio_med, access_radio_sec, access_radio_serv, access_radio_sup, access_radio_exp
		)

	software_on_spawn = list(/datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)

/datum/job/sea/get_description_blurb()
	return "You are the Senior Enlisted Advisor. You are the highest enlisted person on the ship. You are directly subordinate to the CO. You advise them on enlisted concerns and provide expertise and advice to officers. You are responsible for ensuring discipline and good conduct among enlisted, as well as notifying officers of any issues and \"advising\" them on mistakes they make. You also handle various duties on behalf of the CO and XO. You are an experienced enlisted person, very likely equal only in experience to the CO and XO. You know the regulations better than anyone."
*/

/datum/job/bridgeofficer
	title = "Bridge Officer"
	department = "Support"
	department_flag = SPT
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Commanding Officer and Executive Officer"
	selection_color = "#2f2f7f"
	minimal_player_age = 0
	economic_power = 8
	minimum_character_age = list(SPECIES_HUMAN = 22)
	ideal_character_age = 24
	outfit_type = /singleton/hierarchy/outfit/job/torch/crew/command/bridgeofficer/fleet
	allowed_branches = list(
		/datum/mil_branch/fleet
	)
	allowed_ranks = list(
		/datum/mil_rank/fleet/o1,
		/datum/mil_rank/fleet/o2
	)
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_BASIC,
	                    SKILL_PILOT       = SKILL_TRAINED)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX)
	skill_points = 20

	alt_titles = list(
					"Helmsman",
					"Sensor Operator",
					"Bridge Officer")

	access = list(
		access_security, access_medical, access_engine, access_maint_tunnels, access_emergency_storage,
		access_bridge, access_janitor, access_kitchen, access_cargo, access_mailsorting, access_RC_announce, access_keycard_auth,
		access_solgov_crew, access_aquila, access_aquila_helm, access_guppy, access_guppy_helm, access_external_airlocks,
		access_eva, access_hangar, access_cent_creed, access_explorer, access_expedition_shuttle, access_expedition_shuttle_helm, access_teleporter,
		access_torch_fax, access_torch_helm, access_radio_comm, access_radio_eng, access_radio_exp, access_radio_serv, access_radio_sci, access_radio_sup
	)

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/suit_sensors,
							 /datum/computer_file/program/power_monitor,
							 /datum/computer_file/program/supermatter_monitor,
							 /datum/computer_file/program/alarm_monitor,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/shields_monitor,
							 /datum/computer_file/program/reports,
							 /datum/computer_file/program/deck_management)

/datum/job/bridgeofficer/get_description_blurb()
	return "You are a Bridge Officer. You are a junior officer tasked with CIC operations. Generally, you do not give orders on your own. You handle matters on CIC and report directly to the CO and XO. Depending on your designation, you may be designated to man the ship's helm or sensor suite."

/datum/job/qm
	title = "Deck Chief"
	department = "Command Support"
	department_flag = SPT
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Executive Officer and the Commanding Officer"
	economic_power = 10
	minimal_player_age = 14
	minimum_character_age = list(SPECIES_HUMAN = 25)
	ideal_character_age = 35
	outfit_type = /singleton/hierarchy/outfit/job/torch/crew/supply/deckofficer/fleet
	allowed_branches = list(
		/datum/mil_branch/fleet
	)
	allowed_ranks = list(
		/datum/mil_rank/fleet/e7,
		/datum/mil_rank/fleet/e8
	)
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_TRAINED,
	                    SKILL_FINANCE     = SKILL_BASIC,
	                    SKILL_HAULING     = SKILL_BASIC,
	                    SKILL_EVA         = SKILL_BASIC,
	                    SKILL_PILOT       = SKILL_TRAINED,
						SKILL_MECH        =	SKILL_BASIC)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX)
	skill_points = 24

	access = list(
		access_maint_tunnels, access_bridge, access_emergency_storage, access_tech_storage,  access_cargo, access_guppy_helm,
		access_cargo_bot, access_qm, access_mailsorting, access_solgov_crew, access_expedition_shuttle, access_guppy, access_hangar,
		access_mining, access_mining_office, access_mining_station, access_commissary, access_teleporter, access_eva, access_torch_fax,
		access_radio_sup, access_radio_exp, access_radio_comm
	)

	software_on_spawn = list(/datum/computer_file/program/supply,
							 /datum/computer_file/program/deck_management,
							 /datum/computer_file/program/reports)
/datum/job/hos/get_description_blurb()
	return "You are the Deck Chief. You are in charge of all deck operations - fire control, craft maintenance and general supply. You give orders to deck technicians and gunnery crew. You report directly to the ranking officer on the bridge - usually it would be CO and XO."
