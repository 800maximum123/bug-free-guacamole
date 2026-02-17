GLOBAL_LIST(whitespace_map)

/proc/add_whitespace()
	INCREMENT_WORLD_Z_SIZE

	usr.forceMove(locate(world.maxx / 2, world.maxy / 2, world.maxz))

	if(!LAZYLEN(GLOB.whitespace_map))
		GLOB.whitespace_map = new /datum/cells_map(/datum/map_cell/bayrooms)

/datum/map_cell/bayrooms
	possible_states = list(
		/datum/TEST_TEMPLATE_DATA/T = 100,
		/datum/TEST_TEMPLATE_DATA/I = 100,
		/datum/TEST_TEMPLATE_DATA/tire = 100,
		/datum/TEST_TEMPLATE_DATA/L = 100,
		)

/datum/map_cell/bayrooms/collapse()
	. = ..()
	var/turf/T = locate(x, y, world.maxz)
	T.maptext = STYLE_SMALLFONTS_OUTLINE(initial(collapsed?:letter), 24, COLOR_WHITE, COLOR_BLACK)

/datum/map_cell/bayrooms/get_incompatible_states(datum/map_cell/neighbor, datum/TEST_TEMPLATE_DATA/result, direction)
	. = ..()
	for(var/i = 1 to length(possible_states))
		var/datum/TEST_TEMPLATE_DATA/state = possible_states[i]
		if(!LAZYISIN(initial(state.dir_entrances), direction))
			. += state

/datum/TEST_TEMPLATE_DATA
	var/width = 1
	var/height = 1

	var/list/dir_entrances

	var/letter

/datum/TEST_TEMPLATE_DATA/T
	letter = "T"
	dir_entrances = list(WEST, SOUTH, EAST)

/datum/TEST_TEMPLATE_DATA/I
	letter = "I"
	dir_entrances = list(NORTH, SOUTH)

/datum/TEST_TEMPLATE_DATA/tire
	letter = "-"
	dir_entrances = list(WEST, EAST)

/datum/TEST_TEMPLATE_DATA/L
	letter = "L"
	dir_entrances = list(NORTH, EAST)
