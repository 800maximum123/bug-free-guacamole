/datum/map/lightbrigade
	name = "\improper Lightbrigade"
	full_name = "\improper SFV Lightbrigade"
	path = "lightbrigade"
	flags = MAP_HAS_BRANCH | MAP_HAS_RANK
	config_path = "config/lightbrigade_config.txt"

	admin_levels  = list(4)
	escape_levels = list(5)
	empty_levels  = list(6)
	accessible_z_levels = list("1"=1,"2"=3,"3"=1, "6"=30)
	overmap_size = 55
	overmap_event_areas = 62
//	overmap_size = 5
//	overmap_event_areas = 5
	usable_email_tlds = list("fifth.fleet.mil", "army.mil", "freemail.net", "fleet.scg")

	allowed_spawns = list("Cryogenic Storage", "Cyborg Storage")
	default_spawn = "Cryogenic Storage"

	station_name  = "\improper SFV Lightbrigade"
	station_short = "\improper Lightbrigade"
	dock_name     = "TBD"
	boss_name     = "Sol Fifth Fleet Command"
	boss_short    = "High Command"
	company_name  = "Sol Central Government"
	company_short = "SolGov"

	map_admin_faxes = list(
		"Sol Fifth Fleet Command",
		"Sol Fifth Fleet Logistics",
		"Fifth Fleet SFV Victorious",
		"Sol Fleet Mars Commmand",
		"Sol Fleet Special Operations",
		"Sol Army Commmand",
		"SFP Territory Support",
		"SFP Special Investigations",
		"SFP Fugitive Recovery",
		"Bureau of Diplomatic Affairs",
		"Emergency Management Bureau",
		"Secure Routing Service"
	)

	//These should probably be moved into the evac controller...
	shuttle_docked_message = "Attention all hands: Jump preparation complete. The bluespace drive is now spooling up, secure all stations for departure. Time to jump: approximately %ETD%."
	shuttle_leaving_dock = "Attention all hands: Jump initiated, exiting bluespace in %ETA%."
	shuttle_called_message = "Attention all hands: Jump sequence initiated. Transit procedures are now in effect. Jump in %ETA%."
	shuttle_recall_message = "Attention all hands: Jump sequence aborted, return to normal operating conditions."

	evac_controller_type = /datum/evacuation_controller/starship

	default_law_type = /datum/ai_laws/solgov
	use_overmap = 1
	min_offmap_players = 12

	num_traders = 6
	num_exoplanets = 1
	away_site_budget = 0
	num_junkyards = 0

	id_hud_icons = 'maps/torch/icons/assignment_hud.dmi'
