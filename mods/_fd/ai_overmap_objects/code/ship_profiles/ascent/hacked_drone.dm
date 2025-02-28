/obj/overmap/simulated_ship/ascent/drone/hacked
	name = "Hacked ascent drone"
	desc = "hacked ascent drone"
	color = "#00bd84"

	characteristic = new /datum/ship_characteristic/ascent/drone/hacked()

/datum/ship_characteristic/ascent/drone/hacked
	team = AI_TEAM_HUMANS
	max_health = 400
	min_targeted_distance_to_target = 2				// 1 - Right on target, 2 - turf next to target, etc
	max_targeted_distance_to_target = 2				// 1 - Right on target, 2 - turf next to target, etc
	sensors_range = 6
