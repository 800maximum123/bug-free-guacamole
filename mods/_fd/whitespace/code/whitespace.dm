GLOBAL_LIST(whitespace_cells)

/proc/add_whitespace()
	INCREMENT_WORLD_Z_SIZE

	if(!LAZYLEN(GLOB.whitespace_cells))
		GLOB.whitespace_cells = generate_map_cells()

	generate_whitespace()

/proc/generate_whitespace()
