/datum/map/gaia
	name = "\improper Gaia"
	full_name = "\improper Planet Gaia"
	path = "gaia"
	flags = MAP_HAS_BRANCH | MAP_HAS_RANK
	config_path = "config/gaia_config.txt"

	admin_levels  = list(7)
	escape_levels = list(8)
	empty_levels  = list(9)
	accessible_z_levels = list("1"=1,"2"=3,"3"=1,"4"=1,"5"=1,"6"=1,"9"=30)
	usable_email_tlds = list("army.mil.scg", "torch.mil.scg", "gaiamail.net", "navy.gcc")

	allowed_spawns = list("SCG Barracks", "SCG Officer Barracks", "ICCG Barracks", "ICCG Officer Barracks")
	default_spawn = "SCG Barracks"

	station_name  = "\improper Boxcutters Platoon"
	station_short = "\improper Boxcutters"
	dock_name     = "TBD"
	boss_name     = "Colonel Montgomery"
	boss_short    = "Col. Monty"
	company_name  = "Solar Central Government"
	company_short = "SolGov"
	system_name = "Galilei System"

	evil_station_name  = "\improper Okkupatsionnyy Garnizon Kastel-13"
	evil_station_short = "\improper Kastel-13"
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

	welcome_sound = 'maps/gaia/sounds/roundstart.ogg'

	loadout_blacklist = list( // Fifth Fleet doesn't exist in the Gaian Conflict. Also you can't get veteran hats as war didn't end yet.
		/obj/item/clothing/head/soft/solgov/veteranhat,
		/obj/item/clothing/head/beret/solgov/fleet/branch/fifth,
		/obj/item/clothing/accessory/solgov/fleet_patch/fifth,
		/obj/item/material/coin/challenge/sol/gaia,
	)
