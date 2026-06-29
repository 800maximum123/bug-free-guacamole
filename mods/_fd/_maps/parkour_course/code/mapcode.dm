
// MAP STUFF //

/datum/map_template/ruin/away_site/parkour
	name = "Parkour Couse"
	id = "awaysite_parkour"
	spawn_cost = 2
	description = "..."
	prefix = "mods/_fd/_maps/parkour_course/map/"
	suffixes = list("parkour.dmm")
	area_usage_test_exempted_root_areas = list(/area/parkour)
	apc_test_exempt_areas = list(
		/area/parkour = NO_SCRUBBER|NO_VENT|NO_APC
	)

/singleton/submap_archetype/parkour
	descriptor = "PARKOUR COURSE"
	map = "PARKOUR COURSE"
	crew_jobs = list(/datum/job/submap/parkour)

/obj/submap_landmark/joinable_submap/parkour
	name = "PARKOUR COURSE"
	archetype = /singleton/submap_archetype/parkour

/datum/job/submap/parkour
	title = "Parkour PRO"
	total_positions = -1
	outfit_type = /singleton/hierarchy/outfit/parkour
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

/datum/job/submap/parkour/post_equip_rank(mob/living/person, alt_title)
	. = ..()
	person.simple_combat_on = TRUE
	person.can_coyote_jump = TRUE
	person.generate_binds()

/singleton/hierarchy/outfit/parkour
	name = "Parkour PRO Appearance"

	uniform = /obj/item/clothing/under/color/orange
	shoes = /obj/item/clothing/shoes/jackboots

	back = null

/obj/submap_landmark/spawnpoint/parkour
	name = "Parkour PRO"

/area/parkour
	name = "PARKOUR COURSE"
	requires_power = FALSE
	dynamic_lighting = FALSE

#include "..\map\parkour.dmm"
