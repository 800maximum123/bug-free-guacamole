/obj/overmap/visitable/sector/new_new_year_house
	name = "Earth"
	desc = "Mother of the humanity"
	sector_flags = OVERMAP_SECTOR_KNOWN
	icon_state = "globe"
	color = "#69d13f"
	initial_generic_waypoints = list()

/datum/map_template/ruin/away_site/new_new_year_house
	name = "New Year Map 2"
	id = "awaysite_new_new_year_house"
	spawn_cost = 2
	description = "..."
	prefix = "mods/_fd/_maps/new_new_year_house/map/"
	suffixes = list("nnyh.dmm")
	area_usage_test_exempted_root_areas = list(/area/new_new_year_house)
	apc_test_exempt_areas = list(
		/area/new_new_year_house = NO_SCRUBBER|NO_VENT|NO_APC
	)

//БАЗА

/area/new_new_year_house/

//ВНЕШНИЙ МИР
/area/new_new_year_house/outside
	name = "ALASKA - OUTSIDE"
	icon = 'mods/_fd/fd_assets/icons/weather.dmi'
	icon_state = "snowfall_med"
	requires_power = 0

/area/new_new_year_house/inside
	name = "ALASKA - INSIDE"
	requires_power = 0

/singleton/submap_archetype/new_new_year_house
	descriptor = "New Year Map 2"
	map = "Snowy House"
	crew_jobs = list(
		/datum/job/submap/new_new_year_house,
	)

/obj/submap_landmark/joinable_submap/new_new_year_house
	name = "New Year Map 2"
	archetype = /singleton/submap_archetype/new_new_year_house

/datum/job/submap/new_new_year_house
	title = "Actor"
	total_positions = -1
	create_record = TRUE
	skill_points = 62
	no_skill_buffs = TRUE
	max_skill = list(
		SKILL_BUREAUCRACY = SKILL_MAX,
		SKILL_FINANCE = SKILL_MAX,
		SKILL_EVA = SKILL_MAX,
		SKILL_MECH = SKILL_MAX,
		SKILL_PILOT = SKILL_MAX,
		SKILL_HAULING = SKILL_MAX,
		SKILL_COMPUTER = SKILL_MAX,
		SKILL_BOTANY = SKILL_MAX,
		SKILL_COOKING = SKILL_MAX,
		SKILL_COMBAT = SKILL_MAX,
		SKILL_WEAPONS = SKILL_MAX,
		SKILL_FORENSICS = SKILL_MAX,
		SKILL_CONSTRUCTION = SKILL_MAX,
		SKILL_ELECTRICAL = SKILL_MAX,
		SKILL_ATMOS = SKILL_MAX,
		SKILL_ENGINES = SKILL_MAX,
		SKILL_DEVICES = SKILL_MAX,
		SKILL_SCIENCE = SKILL_MAX,
		SKILL_MEDICAL = SKILL_MAX,
		SKILL_ANATOMY = SKILL_MAX,
		SKILL_CHEMISTRY = SKILL_MAX
	)

	outfit_type = /singleton/hierarchy/outfit/new_new_year_house

/singleton/hierarchy/outfit/new_new_year_house
	name = "Actor Appearance"

	uniform = /obj/item/clothing/under/suit_jacket/charcoal
	shoes = /obj/item/clothing/shoes/dress
