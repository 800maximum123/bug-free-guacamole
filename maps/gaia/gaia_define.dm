/datum/map/gaia
	name = "\improper Gaia"
	full_name = "\improper Planet Gaia"
	path = "gaia"
	flags = MAP_HAS_BRANCH | MAP_HAS_RANK
	config_path = "config/gaia_config.txt"

	admin_levels  = list(5)
	escape_levels = list(1, 2, 3, 4, 5)
	empty_levels  = list(10)
	accessible_z_levels = list(1, 2, 3, 4, 5, 6, 7, 8, 9) // 1-2 - SCG Camp, 3-4 ICCG Camp, 5 - Admin, 6 - Transit, 7-9 - Area of Operations
	station_levels = list(1, 2, 3, 4, 7, 8, 9) // 1-2 - SCG Camp, 3-4 ICCG Camp, 7-9 - Area of Operations
	usable_email_tlds = list("army.mil.scg", "fleet.mil.scg", "gaia.scg", "nrpf.gaia.scg", "freemail.gaia", "freemail.net", "navy.gcc")

	base_floor_area = /area/gaia
	base_floor_type = /turf/simulated/floor/exoplanet/barren

	allowed_spawns = list("Area of Operations", "SCG Barracks", "SCG Officer Barracks", "ICCG Barracks", "ICCG Officer Barracks")
	default_spawn = "Area of Operations"

	station_name  = "\improper Boxcutters Platoon"
	station_short = "\improper Boxcutters"
	dock_name     = "TBD"
	boss_name     = "Colonel Montgomery"
	boss_short    = "Col. Monty"
	company_name  = "Solar Central Government"
	company_short = "SolGov"
	system_name   = "Galilei System"

	evil_station_name  = "\improper Okkupatsionnyy Garnizon Morskiye Draguny"
	evil_station_short = "\improper Morskiye Draguny"
	evil_boss_name     = "Kapitan Sasha Alistratova"
	evil_boss_short    = "Kap. Alistratova"
	evil_company_name  = "Gilgamesh Colonial Confederation"
	evil_company_short = "GCC"

	map_admin_faxes = list(
		"Colonel Montgomery HQ",
		"Gilgamesh Occupation Force HQ",
		"Gaia Press Office",
		"Unknown",
	)

	default_law_type = /datum/ai_laws/iccg_gaia
	use_overmap = 0
	num_exoplanets = 0

	id_hud_icons = 'maps/gaia/icons/assignment_hud.dmi'

	welcome_sound = 'maps/gaia/sounds/ambience/stings/roundstart.ogg'

	loadout_blacklist = list( // Fifth Fleet doesn't exist in the Gaian Conflict. Also you can't get veteran hats as war didn't end yet.
		/obj/item/clothing/head/soft/solgov/veteranhat,
		/obj/item/clothing/head/beret/solgov/fleet/branch/fifth,
		/obj/item/clothing/accessory/solgov/fleet_patch/fifth,
		/obj/item/material/coin/challenge/sol/gaia,
	)

	local_currency_name = "Gaian pesos"
	local_currency_name_singular = "peso"
	local_currency_name_short = "GP"

	game_year = 2294 //November 2294, 3 years since the war begun

// Networks that will show up as options in the camera monitor program
	station_networks = list(
		NETWORK_GAIA,
		NETWORK_SCG,
		NETWORK_HELMETS_SCG,
		NETWORK_ICCG,
		NETWORK_HELMETS_ICCG,
		NETWORK_THUNDER,
	)
