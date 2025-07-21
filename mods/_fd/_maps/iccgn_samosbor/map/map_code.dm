/obj/overmap/visitable/sector/gigahrusch
	name = "ICCGN Apartment Building"
	desc = "Strange bluespace anomaly. IF YOU SEE THIS SOMETHING VERY WRONG!"
	color = COLOR_DARK_GREEN_GRAY
	icon_state = "event"
	initial_generic_waypoints = list()

/datum/map_template/ruin/away_site/gigahrusch
	name = "ICCGN Apartment Building"
	id = "awaysite_gigahrusch"
	spawn_cost = INFINITY
	description = "Strange bluespace anomaly."
	prefix = "mods/_fd/_maps/iccgn_samosbor/map/"
	suffixes = list("building.dmm")
	area_usage_test_exempted_root_areas = list(/area/gigahrusch/)
	apc_test_exempt_areas = list(
		/area/gigahrusch/ = NO_SCRUBBER|NO_VENT|NO_APC
	)

/area/gigahrusch
	name = "bluespace endless corridor"
	requires_power = FALSE

// various assets

/obj/structure/fd/topdown_walls
	desc = "Just a wall, nothing special"
	density = TRUE
	anchored = TRUE
	opacity = TRUE

/obj/structure/fd/topdown_walls/concrete
	name = "concrete wall"
	icon = 'mods/_fd/fd_assets/icons/turfs/wall/wall_concrete.dmi'
	icon_state = "co_ap_b"

/obj/structure/fd/topdown_walls/wood
	name = "wooden wall"
	icon = 'mods/_fd/fd_assets/icons/turfs/wall/wall_wood.dmi'
	icon_state = "wood_le"

/obj/structure/fd/topdown_walls/metal
	name = "metal wall"
	icon = 'mods/_fd/fd_assets/icons/turfs/wall/wall_metal.dmi'
	icon_state = "me"

/obj/structure/fd/topdown_window
	name = "window"
	desc = "A house window which emmitting slight glow, transfered from the other side of the building."
	icon = 'mods/_fd/fd_assets/icons/structures/constructed/construct_window.dmi'
	icon_state = "window"
	density = TRUE
	anchored = TRUE
	opacity = FALSE

/obj/structure/fd/topdown_window/Initialize()
	. = ..()
	set_light(3, 0.8, l_color = "#e2943a")

/obj/structure/fd/topdown_window/wooden
	icon_state = "window_w"

/obj/structure/fd/topdown_grills
	name = "metal bars"
	desc = "A house bars, made for protection. Totally for protection..."
	icon = 'mods/_fd/fd_assets/icons/structures/constructed/construct_grate.dmi'
	icon_state = "grate_dark"
	density = TRUE
	anchored = TRUE
	opacity = FALSE
