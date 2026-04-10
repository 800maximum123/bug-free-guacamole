// -- COMMAND --
/datum/job/iccg_co
	title = "Komandir Vzvoda"
	total_positions = 1
	spawn_positions = 1
	supervisors = "Vysshemu Komandovaniye ICCG"
	department = "Gilgamesh Colonial Confederation"
	department_flag = SEC // SPT = SCG, SEC = ICCG
	minimal_player_age = 14
	economic_power = 16
	minimum_character_age = list(SPECIES_HUMAN = 22)
	ideal_character_age = 30
	outfit_type = /singleton/hierarchy/outfit/job/gaia/iccg/command/CO
	required_language = LANGUAGE_HUMAN_RUSSIAN
	selection_color = COLOR_NAVY_BLUE
	faction = MOB_FACTION_ICCG
	head_position = TRUE
	allowed_branches = list(
		/datum/mil_branch/iccgn,
	)
	allowed_ranks = list(
		/datum/mil_rank/iccgn/of2,
		/datum/mil_rank/iccgn/of3,
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
		access_iccg, access_iccg_com, access_iccg_com_cap,
		access_iccg_engi, access_iccg_med, access_iccg_sec,
		access_iccg_com_xo, access_network, access_network_admin, access_ai_upload
	)

	skill_points = 30

/datum/job/iccg_co/get_description_blurb()
	return "Ty — Komandir Vzvoda '[GLOB.using_map.evil_station_name]'. Otvetstven za ispolnenie prikazov Komandovaniya i sokhranenie kontrolya nad sektorem. V tvoem podchinenii nakhodyatsya otdeleniya pekhoty, MP, i tekhnicheskiy personal. Tvoe delo — udavlivat' soprotivlenie, obespechivat' poriadok, i dokladyvat' o vsyakikh otkloneniyakh. Eti zemli teper' prinadlezhat Konfederatsii. Ne zabyvay etogo."

/datum/job/iccg_xo
	title = "Nachalnik Shtaba"
	total_positions = 1
	spawn_positions = 1
	supervisors = "Komandiru Vzvoda"
	department = "Gilgamesh Colonial Confederation"
	department_flag = SEC
	minimal_player_age = 14
	economic_power = 14
	minimum_character_age = list(SPECIES_HUMAN = 30)
	ideal_character_age = 35
	outfit_type = /singleton/hierarchy/outfit/job/gaia/iccg/command/XO
	required_language = LANGUAGE_HUMAN_RUSSIAN
	selection_color = COLOR_NAVY_BLUE
	faction = MOB_FACTION_ICCG
	head_position = TRUE
	allowed_branches = list(
		/datum/mil_branch/iccgn,
	)
	allowed_ranks = list(
		/datum/mil_rank/iccgn/or7,
		/datum/mil_rank/iccgn/or8,
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
		access_iccg, access_iccg_com, access_iccg_engi,
		access_iccg_med, access_iccg_sec, access_iccg_com_xo,
		access_network, access_network_admin, access_ai_upload
	)

	skill_points = 30

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
	minimum_character_age = list(SPECIES_HUMAN = 21)
	ideal_character_age = 40
	minimal_player_age = 0
	outfit_type = /singleton/hierarchy/outfit/job/gaia/iccg/medic
	required_language = LANGUAGE_HUMAN_RUSSIAN
	selection_color = COLOR_MAROON
	faction = MOB_FACTION_ICCG
	allowed_branches = list(
		/datum/mil_branch/iccgn,
		/datum/mil_branch/civilian = /singleton/hierarchy/outfit/job/gaia/iccg/medic/pmc,
	)
	allowed_ranks = list(
		/datum/mil_rank/iccgn/of1,
		/datum/mil_rank/iccgn/of2,
		/datum/mil_rank/iccgn/of3,
		/datum/mil_rank/civ/pmc,
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
		access_iccg, access_iccg_med,
	)

	skill_points = 25

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
	required_language = LANGUAGE_HUMAN_RUSSIAN
	selection_color = COLOR_MAROON
	faction = MOB_FACTION_ICCG
	allowed_branches = list(
		/datum/mil_branch/iccgn,
		/datum/mil_branch/civilian = /singleton/hierarchy/outfit/job/gaia/iccg/engineer/pmc,
	)
	allowed_ranks = list(
		/datum/mil_rank/iccgn/or3,
		/datum/mil_rank/iccgn/or4,
		/datum/mil_rank/iccgn/or5,
		/datum/mil_rank/civ/pmc,
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

	access = list(
		access_iccg, access_iccg_engi, access_network, access_network_admin
	)

	skill_points = 20

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
	required_language = LANGUAGE_HUMAN_RUSSIAN
	selection_color = COLOR_MAROON
	faction = MOB_FACTION_ICCG
	allowed_branches = list(
		/datum/mil_branch/iccgn,
	)
	allowed_ranks = list(
		/datum/mil_rank/iccgn/or5,
		/datum/mil_rank/iccgn/or6,
	)
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_BASIC,
	                    SKILL_HAULING     = SKILL_BASIC,
	                    SKILL_COMBAT      = SKILL_TRAINED,
	                    SKILL_WEAPONS     = SKILL_BASIC)

	max_skill = list(   SKILL_COMBAT      = SKILL_MAX,
	                    SKILL_WEAPONS     = SKILL_MAX)

	access = list(
		access_iccg, access_iccg_com, access_iccg_engi,
		access_iccg_med, access_iccg_sec,
		access_network, access_network_admin,
	)

	skill_points = 25

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
	required_language = LANGUAGE_HUMAN_RUSSIAN
	selection_color = COLOR_NAVY_BLUE
	faction = MOB_FACTION_ICCG
	head_position = TRUE
	allowed_branches = list(
		/datum/mil_branch/iccgn,
	)
	allowed_ranks = list(
		/datum/mil_rank/iccgn/or5,
		/datum/mil_rank/iccgn/or6,
	)
	min_skill = list(   SKILL_HAULING     = SKILL_BASIC,
	                    SKILL_COMBAT      = SKILL_BASIC,
	                    SKILL_WEAPONS     = SKILL_TRAINED)

	max_skill = list(   SKILL_COMBAT      = SKILL_EXPERIENCED,
	                    SKILL_WEAPONS     = SKILL_EXPERIENCED)

	access = list(
		access_iccg, access_iccg_com,
		access_iccg_engi, access_iccg_med,
	)

	skill_points = 20

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
	required_language = LANGUAGE_HUMAN_RUSSIAN
	selection_color = COLOR_MAROON
	faction = MOB_FACTION_ICCG
	allowed_branches = list(
		/datum/mil_branch/iccgn,
		/datum/mil_branch/civilian = /singleton/hierarchy/outfit/job/gaia/iccg/trooper/pmc,
	)
	allowed_ranks = list(
		/datum/mil_rank/iccgn/or3,
		/datum/mil_rank/iccgn/or4,
		/datum/mil_rank/civ/pmc,
	)
	min_skill = list(   SKILL_HAULING      = SKILL_BASIC,
	                    SKILL_WEAPONS     = SKILL_BASIC)

	max_skill = list(   SKILL_COMBAT      = SKILL_TRAINED,
	                    SKILL_WEAPONS     = SKILL_TRAINED)

	access = list(
		access_iccg,
	)

// Synthetics

/datum/job/cyborg
	title = "Voyennyy Dron"
	total_positions = 1
	spawn_positions = 1
	supervisors = "tvoi zakony"
	selection_color = COLOR_MAROON
	faction = MOB_FACTION_ICCG
	allowed_ranks = list(
		/datum/mil_rank/civ/synthetic
	)
