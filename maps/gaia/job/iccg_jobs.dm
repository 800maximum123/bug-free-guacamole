// -- COMMAND --
/datum/job/iccg_co
	title = "Komandir Vzvoda"
	supervisors = "Vysshemu Komandovaniye ICCG"
	department = "Gilgamesh Colonial Confederation"
	department_flag = SEC // SPT = SCG, SEC = ICCG
	minimal_player_age = 14
	economic_power = 16
	minimum_character_age = list(SPECIES_HUMAN = 22)
	ideal_character_age = 30
	outfit_type = /singleton/hierarchy/outfit/job/gaia/iccg/command/CO
	allowed_branches = list(
		/datum/mil_branch/iccgn,
	)
	allowed_ranks = list(
		/datum/mil_rank/iccgn/of2,
		/datum/mil_rank/iccgn/of3,
	)
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_BASIC,
	                    SKILL_SCIENCE     = SKILL_TRAINED,
	                    SKILL_PILOT       = SKILL_TRAINED)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX,
	                    SKILL_SCIENCE     = SKILL_MAX)
	skill_points = 30

/datum/job/iccg_co/get_description_blurb()
	return "Ty — Komandir Vzvoda '[GLOB.using_map.evil_station_name]'. Otvetstven za ispolnenie prikazov Komandovaniya i sokhranenie kontrolya nad sektorem. V tvoem podchinenii nakhodyatsya otdeleniya pekhoty, MP, i tekhnicheskiy personal. Tvoe delo — udavlivat' soprotivlenie, obespechivat' poriadok, i dokladyvat' o vsyakikh otkloneniyakh. Eti zemli teper' prinadlezhat Konfederatsii. Ne zabyvay etogo."

/datum/job/iccg_xo
	title = "Nachalnik Shtaba"
	supervisors = "Komandiru Vzvoda"
	department = "Gilgamesh Colonial Confederation"
	department_flag = SEC
	minimal_player_age = 14
	economic_power = 14
	minimum_character_age = list(SPECIES_HUMAN = 30)
	ideal_character_age = 35
	outfit_type = /singleton/hierarchy/outfit/job/gaia/iccg/command/XO
	allowed_branches = list(
		/datum/mil_branch/iccgn,
	)
	allowed_ranks = list(
		/datum/mil_rank/iccgn/or7,
		/datum/mil_rank/iccgn/or8,
	)
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
		access_gateway, access_sec_doors, access_psychiatrist, access_xenoarch, access_medical_equip, access_heads, access_hangar, access_guppy_helm,
		access_expedition_shuttle_helm, access_aquila, access_aquila_helm, access_iccg, access_chief_steward, access_emergency_armory,
		access_sec_guard, access_gun, access_expedition_shuttle, access_guppy, access_seneng, access_senmed, access_senadv,
		access_explorer, access_pathfinder, access_pilot, access_commissary, access_petrov, access_petrov_helm, access_petrov_analysis, access_petrov_phoron,
		access_petrov_toxins, access_petrov_chemistry, access_petrov_control, access_petrov_maint, access_rd, access_petrov_rd, access_torch_fax, access_torch_helm,
		access_radio_comm, access_radio_eng, access_radio_med, access_radio_sec, access_radio_sup, access_radio_serv, access_radio_exp, access_radio_sci, access_research_storage
	)

/datum/job/iccg_xo/get_description_blurb()
	return "Ty — Nachalnik Shtaba '[GLOB.using_map.evil_station_name]'. Ty otvechayesh za vnutrenniy poryadok v baze, postavki, raspredelenie resursov i koordintatsiyu podrazdeleniy. Esli Vzvodnyy komanduyet operatsiey, to ty obespechivayesh ee rabotu. Ty dolzhen sledit' za dokumentatsiey, svyazyvat'sya s garnizonom i podderzhivat' rabotosposobnost' personala. Bez tebya baza ruhnet."

// -- SUPPORT STAFF --
/datum/job/iccg_medic
	title = "Voyennyy Vrach"
	total_positions = 3
	spawn_positions = 3
	supervisors = "tvoi Komandir Otdeleniya"
	department = "Gilgamesh Colonial Confederation"
	department_flag = SEC
	economic_power = 7
	minimum_character_age = list(SPECIES_HUMAN = 19)
	ideal_character_age = 40
	minimal_player_age = 0
	outfit_type = /singleton/hierarchy/outfit/job/gaia/iccg/medic
	allowed_branches = list(
		/datum/mil_branch/iccgn,
	)
	allowed_ranks = list(
		/datum/mil_rank/iccgn/of1,
		/datum/mil_rank/iccgn/of2,
		/datum/mil_rank/iccgn/of3,
	)
	min_skill = list(   SKILL_MEDICAL = SKILL_BASIC,
	                    SKILL_ANATOMY = SKILL_BASIC)

	max_skill = list(   SKILL_MEDICAL     = SKILL_MAX,
	                    SKILL_CHEMISTRY   = SKILL_MAX)

	access = list(
		access_medical, access_morgue, access_maint_tunnels,
		access_external_airlocks, access_emergency_storage,
		access_eva, access_surgery, access_medical_equip,
		access_iccg, access_hangar, access_radio_med
	)

	skill_points = 22

/datum/job/iccg_engineer
	title = "Voyennyy Inzhener"
	total_positions = 3
	spawn_positions = 3
	supervisors = "tvoi Komandir Otdeleniya"
	department = "Gilgamesh Colonial Confederation"
	department_flag = SEC
	economic_power = 5
	minimal_player_age = 0
	minimum_character_age = list(SPECIES_HUMAN = 19)
	ideal_character_age = 30
	outfit_type = /singleton/hierarchy/outfit/job/gaia/iccg/engineer
	allowed_branches = list(
		/datum/mil_branch/iccgn,
	)
	allowed_ranks = list(
		/datum/mil_rank/iccgn/or3,
		/datum/mil_rank/iccgn/or4,
		/datum/mil_rank/iccgn/or5,
	)
	min_skill = list(   SKILL_COMPUTER     = SKILL_BASIC,
	                    SKILL_CONSTRUCTION = SKILL_TRAINED,
	                    SKILL_ELECTRICAL   = SKILL_BASIC,
	                    SKILL_ATMOS        = SKILL_BASIC,
	                    SKILL_ENGINES      = SKILL_BASIC)

	max_skill = list(   SKILL_CONSTRUCTION = SKILL_MAX,
	                    SKILL_ELECTRICAL   = SKILL_MAX,
	                    SKILL_ATMOS        = SKILL_MAX,
	                    SKILL_ENGINES      = SKILL_MAX)
	skill_points = 20

	access = list(
		access_engine, access_engine_equip, access_maint_tunnels, access_external_airlocks, access_emergency_storage,
		access_teleporter, access_eva, access_tech_storage, access_atmospherics, access_janitor, access_construction,
		access_iccg, access_hangar, access_network, access_radio_eng
	)

/datum/job/iccg_mp
	title = "Voyennyy Politseyskiy"
	total_positions = 3
	spawn_positions = 3
	supervisors = "Nachalniku Shtaba i Komandiru Vzvoda"
	department = "Gilgamesh Colonial Confederation"
	department_flag = SEC
	economic_power = 3
	minimal_player_age = 0
	minimum_character_age = list(SPECIES_HUMAN = 23)
	ideal_character_age = 25
	outfit_type = /singleton/hierarchy/outfit/job/gaia/iccg/mp
	allowed_branches = list(
		/datum/mil_branch/iccgn,
	)
	allowed_ranks = list(
		/datum/mil_rank/iccgn/or5,
		/datum/mil_rank/iccgn/or6,
	)
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_BASIC,
	                    SKILL_COMBAT      = SKILL_TRAINED,
	                    SKILL_WEAPONS     = SKILL_BASIC)

	max_skill = list(   SKILL_COMBAT      = SKILL_MAX,
	                    SKILL_WEAPONS     = SKILL_MAX)

	skill_points = 25

	access = list(
		access_security, access_brig, access_maint_tunnels,
		access_external_airlocks, access_emergency_storage,
		access_eva, access_sec_doors, access_iccg,
		access_radio_sec
	)

/datum/job/iccg_mp/get_description_blurb()
	return "Ty — Voyennyy Politseyskiy, predstavitel' Zakona i Poryadka v ryadakh Konfederatsii. Ty neposredstvenno podchinyaesh'sya Nachalniku Shtaba i Komandiru Vzvoda i otvechaesh za distsiplinu, kontrol' za lichnym sostavom, i raskrytie narusheniy — ot dertsya do sabotazha. Tvoi obyazannosti vklyuchayut dozory, doprosy, aresty i nadzor za grazhdanskimi. Vnutrenniy vrag opaseneye vneshnego. Nikto ne vyshe ustava."

// -- COMBAT (meatshields) --
/datum/job/iccg_squad_leader
	title = "Komandir Otdeleniya"
	total_positions = 3
	spawn_positions = 3
	supervisors = "Nachalniku Shtaba i Komandiru Vzvoda"
	department = "Gilgamesh Colonial Confederation"
	department_flag = SEC
	economic_power = 10
	minimal_player_age = 0
	minimum_character_age = list(SPECIES_HUMAN = 23)
	ideal_character_age = 25
	outfit_type = /singleton/hierarchy/outfit/job/gaia/iccg/squad_leader
	allowed_branches = list(
		/datum/mil_branch/iccgn,
	)
	allowed_ranks = list(
		/datum/mil_rank/iccgn/or5,
		/datum/mil_rank/iccgn/or6,
	)
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_BASIC,
	                    SKILL_COMBAT      = SKILL_BASIC,
	                    SKILL_WEAPONS     = SKILL_TRAINED,)

	max_skill = list(   SKILL_COMBAT      = SKILL_MAX,
	                    SKILL_WEAPONS     = SKILL_MAX,)
	skill_points = 25

	access = list(
		access_security, access_brig, access_maint_tunnels,
		access_external_airlocks, access_emergency_storage,
		access_eva, access_sec_doors, access_iccg,
		access_radio_sec
	)

/datum/job/iccg_squad_leader/get_description_blurb()
	return "Ty — Komandir Otdeleniya v sostave '[GLOB.using_map.evil_station_name]'. Tvoe delo — vesti boytsov v pole, vypolnyat' prikazy bez voprosov i obespechivat' ispovedanie ustava. Ty komanduyesh maloy gruppoy, no ot tvoikh resheniy zavisit vse. Podavlenie iccg i kontrol' nad territoriey — eto tvoi prioritet. Distsiplina, ogon', i nadezhnost'. Vpered, bez oshibok."

/datum/job/iccg_trooper
	title = "Pekhotinets"
	total_positions = 9
	spawn_positions = 9
	supervisors = "tvoi Komandir Otdeleniya"
	department = "Gilgamesh Colonial Confederation"
	department_flag = SEC
	economic_power = 3
	minimal_player_age = 0
	minimum_character_age = list(SPECIES_HUMAN = 18)
	ideal_character_age = 22
	outfit_type = /singleton/hierarchy/outfit/job/gaia/iccg/trooper
	allowed_branches = list(
		/datum/mil_branch/iccgn,
	)
	allowed_ranks = list(
		/datum/mil_rank/iccgn/or3,
		/datum/mil_rank/iccgn/or4,
	)
	min_skill = list(   SKILL_COMBAT      = SKILL_BASIC,
	                    SKILL_WEAPONS     = SKILL_BASIC)

	max_skill = list(   SKILL_COMBAT      = SKILL_MAX,
	                    SKILL_WEAPONS     = SKILL_MAX)

	skill_points = 20

	access = list(
		access_security, access_brig, access_maint_tunnels,
		access_external_airlocks, access_emergency_storage,
		access_eva, access_sec_doors, access_iccg,
		access_radio_sec
	)
