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

/turf/simulated/floor/exoplanet/samosbor/concrete
	name = "floor"
	desc = "Just an old floor."
	icon = 'mods/_fd/fd_assets/icons/turfs/floor/floor_concrete.dmi'
	icon_state = "concrete"

/turf/simulated/floor/exoplanet/samosbor/ceramic
	name = "floor"
	desc = "Just an old floor."
	icon = 'mods/_fd/fd_assets/icons/turfs/floor/floor_ceramic.dmi'
	icon_state = "ce"

/turf/simulated/floor/exoplanet/samosbor/carpet
	name = "floor"
	desc = "Just an old carpet."
	icon = 'mods/_fd/fd_assets/icons/turfs/floor/floor_carpet.dmi'
	icon_state = "ca_da_gy_map"

/turf/simulated/floor/exoplanet/samosbor/circuit
	name = "floor"
	desc = "Just an old floor."
	icon = 'mods/_fd/fd_assets/icons/turfs/floor/floor_circuit.dmi'
	icon_state = "ci"

/turf/simulated/floor/exoplanet/samosbor/glass
	name = "floor"
	desc = "Just an old floor."
	icon = 'mods/_fd/fd_assets/icons/turfs/floor/floor_glass.dmi'
	icon_state = "gl"

/turf/simulated/floor/exoplanet/samosbor/lino
	name = "floor"
	desc = "Just an old floor."
	icon = 'mods/_fd/fd_assets/icons/turfs/floor/floor_lino.dmi'
	icon_state = "li"

/turf/simulated/floor/exoplanet/samosbor/metal
	name = "floor"
	desc = "Just an old floor."
	icon = 'mods/_fd/fd_assets/icons/turfs/floor/floor_metal.dmi'
	icon_state = "me_br"


/turf/simulated/floor/exoplanet/samosbor/stairs
	name = "floor"
	desc = "Just an old floor."
	icon = 'mods/_fd/fd_assets/icons/turfs/floor/floor_stairs.dmi'
	icon_state = "stairs"

/turf/simulated/floor/exoplanet/samosbor/plating
	name = "floor"
	desc = "Just an old floor."
	icon = 'mods/_fd/fd_assets/icons/turfs/floor/floor_plating.dmi'
	icon_state = "plating_hull"

/turf/simulated/floor/exoplanet/samosbor/theme
	name = "floor"
	desc = "Just an old floor."
	icon = 'mods/_fd/fd_assets/icons/turfs/floor/floor_theme.dmi'
	icon_state = "bar_bl"

/turf/simulated/floor/exoplanet/samosbor/wood
	name = "floor"
	desc = "Just an old floor."
	icon = 'mods/_fd/fd_assets/icons/turfs/floor/floor_wood.dmi'
	icon_state = "wood_log"

/turf/simulated/floor/exoplanet/samosbor/env
	name = "ground"
	desc = "Simple as is."
	icon = 'mods/_fd/fd_assets/icons/turfs/floor/floor_enviroment.dmi'
	icon_state = "gs_mu"

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
