/obj/overmap/visitable/sector/destroyed_torch
	name = "...𒊒𒁍..."
	desc = "ℸ ̣⍑ᓭ ̣ᒷ ᒷᔑ↸ℸ| リ𝙹 ╎∷∷ℸ ⍑ᔑʖ ̣  ∷ᔑ|𝙹ᒷᒲ⊣ℸʖ⎓𝙹"
	color = "#7500bd"
	sector_flags = OVERMAP_SECTOR_KNOWN
	icon_state = "ship"
	initial_generic_waypoints = list()
	var/list/lightmain

/obj/overmap/visitable/sector/destroyed_torch/Initialize()
	..()

	lightmain = block(locate(world.maxx, world.maxy, max(map_z)), locate(1, 1, min(map_z)))
	for(var/atom/A as anything in lightmain)
		if(!istype(A.loc, /area/dtorch/deck4/outer) || !istype(A, /turf/) || A.density)
			lightmain -= A
	update_daynight()

/obj/overmap/visitable/sector/destroyed_torch/proc/update_daynight(light = 2, light_color_m = "#f7edb6")
	for(var/turf/T as anything in lightmain)
		T.set_light(1, light, l_color = light_color_m)

/datum/map_template/ruin/away_site/destroyed_torch
	name = "SUNKED TORCH (Campaign)"
	id = "awaysite_dtorch"
	spawn_cost = 2
	description = "..."
	prefix = "mods/_fd/_maps/torch_as_ruin/map/"
	suffixes = list("destroyed_torch.dmm")
	area_usage_test_exempted_root_areas = list(/area/dtorch)
	apc_test_exempt_areas = list(
		/area/dtorch = NO_SCRUBBER|NO_VENT|NO_APC
	)

/area/dtorch
	requires_power = 0

/area/dtorch/deck1
	name = "TORCH (DECK 1, INNER)"

/area/dtorch/deck1/outer
	name = "TORCH (DECK 1, OUTER)"

/area/dtorch/deck2
	name = "TORCH (DECK 2, INNER)"

/area/dtorch/deck2/outer
	name = "TORCH (DECK 2, OUTER)"

/area/dtorch/deck3
	name = "TORCH (DECK 3, INNER)"

/area/dtorch/deck3/outer
	name = "TORCH (DECK 3, OUTER)"

/area/dtorch/deck4
	name = "TORCH (DECK 4, INNER)"

/area/dtorch/deck4/outer
	name = "TORCH (DECK 4, OUTER)"

/area/dtorch/deck5
	name = "TORCH (DECK 5, INNER)"

/area/dtorch/deck5/outer
	name = "TORCH (DECK 5, OUTER)"

/area/dtorch/deck6
	name = "TORCH (DECK 6, INNER)"

/area/dtorch/deck6/outer
	name = "TORCH (DECK 6, OUTER)"
