/obj/overmap/visitable/sector/ship_bc6
	name = "SHIP SHIP SHIT"
	desc = "Strange bluespace anomaly. IF YOU SEE THIS SOMETHING VERY WRONG!"
	color = COLOR_DARK_GREEN_GRAY
	icon_state = "event"
	initial_generic_waypoints = list()

/datum/map_template/ruin/away_site/ship_bc6
	name = "BC6 Ship"
	id = "awaysite_ship_bc6"
	spawn_cost = INFINITY
	description = "Strange bluespace anomaly."
	prefix = "mods/_fd/_maps/baycore_foranswer/maps/"
	suffixes = list("mech_base.dmm")
	area_usage_test_exempted_root_areas = list(/area/bc6/)
	apc_test_exempt_areas = list(
		/area/bc6/ = NO_SCRUBBER|NO_VENT|NO_APC
	)

/obj/overmap/visitable/sector/simulation_bc6
	name = "SHIIIIIIIIIIT"
	desc = "Strange bluespace anomaly. IF YOU SEE THIS SOMETHING VERY WRONG!"
	color = COLOR_DARK_GREEN_GRAY
	icon_state = "event"
	initial_generic_waypoints = list()

/datum/map_template/ruin/away_site/simulation_bc6
	name = "BC6 Simulation"
	id = "awaysite_simulation_bc6"
	spawn_cost = INFINITY
	description = "Strange bluespace anomaly."
	prefix = "mods/_fd/_maps/baycore_foranswer/maps/"
	suffixes = list("training_lvl.dmm")
	area_usage_test_exempted_root_areas = list(/area/bc6/)
	apc_test_exempt_areas = list(
		/area/bc6/ = NO_SCRUBBER|NO_VENT|NO_APC
	)
