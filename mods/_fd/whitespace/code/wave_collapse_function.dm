/proc/generate_map_cells(cells_type = /datum/map_cell, min_x = EDGE, min_y = EDGE, max_x = world.maxx-EDGE, max_y = world.maxy-EDGE)
	var/matrix[world.maxx]
	for(var/x in 1 to world.maxx)
		var/matrix_column[world.maxy]
		matrix[x] = matrix_column

		if(x <= min_x || x >= max_x)
			continue

		for(var/y in min_y to max_y)
			if(y <= min_y || y >= max_y)
				continue

			/// Ячейка, является списком возможных состояний
			/// После коллапса превращается в NULL
			matrix[x][y] = new cells_type(matrix, x, y)

	return matrix

/datum/map_cell
	var/list/states = list(null = 100)
	var/list/cells_map
	var/x
	var/y
	var/collapsed = FALSE

/datum/map_cell/New(map, new_x, new_y)
	. = ..()
	cells_map = map
	x = new_x
	y = new_y

/datum/map_cell/proc/collapse()
	. = pickweight(states)
	collapsed = TRUE
	return .

/// САМА КАРТА ЯЧЕЕК

/datum/cells_map

/proc/a(x, y)
	to_chat(usr, "[GLOB.whitespace_cells[x][y]?:x]:[GLOB.whitespace_cells[x][y]?:y]")
