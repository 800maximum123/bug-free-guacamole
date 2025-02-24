GLOBAL_VAR(resurgence_map)

/datum/map_template/resurgence
	name = "Long Forgotten Place"
	mappaths = list("psi-reimagined/resurgence/maps/resurgence.dmm")
	var/turf/center

	var/mob/living/carbon/human/omega
	var/turf/prev_admin_loc

	var/mob/living/carbon/human/previous_body
	var/mob/living/carbon/human/astral_body

/proc/load_resurgence_map()
	if(GLOB.resurgence_map)
		return GLOB.resurgence_map

	GLOB.resurgence_map = new /datum/map_template/resurgence
	var/datum/map_template/resurgence/map_data = GLOB.resurgence_map

	var/list/transit_levels = GLOB.using_map.escape_levels // Transit levels
	LAZYLEN(transit_levels) || transit_levels.Add(7)

	var/start = locate(TRANSITIONEDGE+1, TRANSITIONEDGE+1, min(transit_levels))
	var/finish = locate(world.maxx-TRANSITIONEDGE-1, world.maxy-TRANSITIONEDGE-1, max(transit_levels))
	for(var/turf/possible_place as anything in block(start, finish))
		var/valid = TRUE
		for(var/turf/check in map_data.get_affected_turfs(possible_place))
			if(!istype(check, /turf/space))
				valid = FALSE
				break

		if(valid)
			map_data.center = locate(possible_place.x + round(map_data.width / 2), possible_place.y + round(map_data.height / 2), possible_place.z)
			map_data.load(possible_place)
			break

	if(!map_data.loaded)
		return FALSE

	var/turf/spawn_loc = locate(map_data.center.x, map_data.center.y + 2, map_data.center.z)
	map_data.omega = new(spawn_loc, "Ω")
	new /obj/effect/eyes(spawn_loc)

	return map_data
