/datum/map_cell
	var/collapsed = FALSE
	var/list/possible_states = list(null = 100)

	var/datum/cells_map/map_ref

	var/x
	var/y

/datum/map_cell/New(map, new_x, new_y)
	. = ..()
	map_ref = map
	x = new_x
	y = new_y

/datum/map_cell/proc/get_step_cell(direction)
	switch(direction)
		if(NORTH)
			. = map_ref.cells[x][y+1]
		if(NORTHWEST)
			. = map_ref.cells[x+1][y+1]
		if(WEST)
			. = map_ref.cells[x+1][y]
		if(SOUTHWEST)
			. = map_ref.cells[x+1][y-1]
		if(SOUTH)
			. = map_ref.cells[x][y-1]
		if(SOUTHEAST)
			. = map_ref.cells[x-1][y-1]
		if(EAST)
			. = map_ref.cells[x-1][y]
		else // NORTHEAST
			. = map_ref.cells[x-1][y+1]

/datum/map_cell/proc/collapse()
	collapsed = pickweight(possible_states)

	for(var/direction in GLOB.alldirs)
		var/datum/map_cell/neighbor = get_step_cell(direction)
		if(!neighbor)
			continue
		neighbor.possible_states -= neighbor.get_incompatible_states(src, collapsed, direction)

		if(!neighbor.collapsed)
			continue
		SSwavecollapse.queue |= neighbor

	return collapsed

/datum/map_cell/proc/get_incompatible_states(datum/map_cell/neighbor, result, direction)
	. = list()

/// САМА КАРТА ЯЧЕЕК

/datum/cells_map
	var/list/cells

/datum/cells_map/New(cells_type = /datum/map_cell, min_x = EDGE, min_y = EDGE, max_x = world.maxx-EDGE, max_y = world.maxy-EDGE)
	. = ..()

	var/new_matrix[world.maxx]
	cells = new_matrix

	for(var/x in 1 to world.maxx)
		var/matrix_column[world.maxy]
		cells[x] = matrix_column

		if(x <= min_x || x >= max_x)
			continue

		for(var/y in 1 to world.maxy)
			if(y <= min_y || y >= max_y)
				continue

			// Сама ячейка
			cells[x][y] = new cells_type(src, x, y)

	// Стартуем отсюда
	SSwavecollapse.queue += cells[ceil(world.maxx/2)][ceil(world.maxy/2)]
