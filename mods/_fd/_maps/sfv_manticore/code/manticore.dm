/obj/overmap/visitable/ship/bomber
	name = "SFV Manticore"
	desc = "Sensor array detects a large vessel, identifying itself as 'SFV Manticore'. It's an literal flying fortress. In space."
	vessel_mass = 20000
	color = "#8ebecc"
	max_speed = 1/(5 SECONDS)
	burn_delay = 5 SECONDS
	fore_dir = NORTH
	initial_restricted_waypoints = list()
	initial_generic_waypoints = list()

/datum/map_template/ruin/away_site/bomber
	name = "SFV Manticore"
	id = "awaysite_bomber"
	description = "Humanity last hope."
	prefix = "mods/_fd/_maps/sfv_manticore/maps/"
	suffixes = list("bomber.dmm")
	spawn_cost = 2
	player_cost = 6
	spawn_weight = 0.33
	area_usage_test_exempted_root_areas = list(/area/ship/bomber)
	shuttles_to_initialise = list()

/area/ship/bomber
	name = "SFV Manticore"

/area/ship/bomber/upper_deck
	name = "SFV Manticore (Upper Deck)"

/area/ship/bomber/upper_deck/engine_east
	name = "SFV Manticore (Upper East Engine)"

/area/ship/bomber/upper_deck/engine_west
	name = "SFV Manticore (Upper West Engine)"

/area/ship/bomber/main_deck
	name = "SFV Manticore (Main Deck)"

/area/ship/bomber/main_deck/reactor
	name = "SFV Manticore (Reactor Core)"

/area/ship/bomber/main_deck/reactor
	name = "SFV Manticore (Reactor Core)"

/area/ship/bomber/main_deck/cargo
	name = "SFV Manticore (Cargo)"

/area/ship/bomber/main_deck/atmos
	name = "SFV Manticore (Atmos)"

/area/ship/bomber/main_deck/shield
	name = "SFV Manticore (Shield Control Room)"

/area/ship/bomber/main_deck/bridge
	name = "SFV Manticore (Bridge)"

/area/ship/bomber/main_deck/west_wing
	name = "SFV Manticore (West Wing)"

/area/ship/bomber/main_deck/east_wing
	name = "SFV Manticore (East Wing)"

/area/ship/bomber/main_deck/east_ammunition
	name = "SFV Manticore (East Ammunition Load)"

/area/ship/bomber/main_deck/west_ammunition
	name = "SFV Manticore (West Ammunition Load)"

/area/ship/bomber/lower_deck
	name = "SFV Manticore (Lower Deck)"

/area/ship/bomber/lower_deck/turret
	name = "SFV Manticore (Autocannon Turret)"

/area/ship/bomber/lower_deck/engine_east
	name = "SFV Manticore (Lower East Engine)"

/area/ship/bomber/lower_deck/engine_west
	name = "SFV Manticore (Lower West Engine)"
