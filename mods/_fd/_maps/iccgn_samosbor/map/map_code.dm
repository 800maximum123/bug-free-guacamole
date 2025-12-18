/obj/overmap/visitable/sector/gigahrusch
	name = "ICCGN Apartment Building"
	desc = "Strange bluespace anomaly. IF YOU SEE THIS SOMETHING VERY WRONG!"
	color = COLOR_DARK_GREEN_GRAY
	icon_state = "event"
	initial_generic_waypoints = list()

	var/list/lightmain

/obj/overmap/visitable/sector/gigahrusch/Initialize()
	..()

	lightmain = block(locate(world.maxx, world.maxy, max(map_z)), locate(1, 1, min(map_z)))
	for(var/atom/A as anything in lightmain)
		if(!istype(A.loc, /area/gigahrusch/outer) || A.density)
			lightmain -= A
	update_daynight()

/obj/overmap/visitable/sector/gigahrusch/proc/update_daynight(light = 2, light_color_m = "#e7bf74")
	for(var/turf/T as anything in lightmain)
		T.set_light(1, light, l_color = light_color_m)

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
	shuttles_to_initialise = list(
		/datum/shuttle/autodock/ferry/samosbor
	)

/singleton/submap_archetype/gigahrusch
	descriptor = "ICCGN Apartment Building"
	map = "ICCGN Apartment Building"
	crew_jobs = list(
		/datum/job/submap/gigahrusch,
		/datum/job/submap/gigahrusch/radio,
		/datum/job/submap/gigahrusch/kiosk,
		/datum/job/submap/gigahrusch/kapterka
	)

/obj/submap_landmark/joinable_submap/gigahrusch
	name = "ICCGN Apartment Building"
	archetype = /singleton/submap_archetype/gigahrusch

/singleton/hierarchy/outfit/job/assistant/samosbor
	l_ear = null
	r_ear = null
	back = null

/datum/job/submap/gigahrusch
	title = "Grazhdanin"
	department = "Service"
	department_flag = SRV
	total_positions = -1
	create_record = TRUE
	skill_points = 52
	no_skill_buffs = TRUE
	minimum_character_age = 0
	outfit_type = /singleton/hierarchy/outfit/job/assistant/samosbor
	whitelisted_species = list(SPECIES_HUMAN,SPECIES_DIONA,SPECIES_IPC,SPECIES_UNATHI,SPECIES_SKRELL,SPECIES_ADHERENT,SPECIES_YEOSA,SPECIES_VATGROWN,SPECIES_SPACER,SPECIES_TRITONIAN,SPECIES_GRAVWORLDER,SPECIES_MULE,SPECIES_NABBER,SPECIES_FBP,SPECIES_TAJARA,SPECIES_UNATHI)
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

	allowed_branches = list(
		/datum/mil_branch/civilian
	)
	allowed_ranks = list(
		/datum/mil_rank/civ/civ
	)

/datum/job/submap/gigahrusch/radio
	title = "Radio Chief"
	supervisors = "Big Boss"
	selection_color = "#01882e"
	total_positions = 1

/datum/job/submap/gigahrusch/kiosk
	title = "Kiosk Cashier"
	supervisors = "Big Boss"
	selection_color = "#01882e"
	total_positions = 1

/datum/job/submap/gigahrusch/kapterka
	title = "Building Guard"
	supervisors = "Big Boss"
	selection_color = "#01882e"
	total_positions = 1

/obj/submap_landmark/spawnpoint/gigahrusch
	name = "Grazhdanin"
/obj/submap_landmark/spawnpoint/gigahrusch/radio
	name = "Radio Chief"
/obj/submap_landmark/spawnpoint/gigahrusch/kiosk
	name = "Kiosk Cashier"
/obj/submap_landmark/spawnpoint/gigahrusch/kapterka
	name = "Building Guard"

/area/gigahrusch
	name = "bluespace endless corridor"
	requires_power = FALSE

/area/gigahrusch/outer
	name = "building yard"

/area/gigahrusch/inner
	name = "building insides"

/area/gigahrusch/lift
	name = "building lift"

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
	layer = 2

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

/obj/structure/fd/samosbor/carpet_wall
	name = "big carpet"
	desc = "A house carpet with special pattern, usually seen on walls."
	icon = 'mods/_fd/fd_assets/icons/structures/COVER_BIG.dmi'
	icon_state = "covrina"
	density = FALSE
	anchored = TRUE
	opacity = FALSE

/obj/structure/fd/samosbor/graffity
	name = "wall painting"
	desc = "An modern way to show you are different."
	icon = 'mods/_fd/fd_assets/icons/structures/graffiti.dmi'
	icon_state = "gangtag15"
	density = FALSE
	anchored = TRUE
	opacity = FALSE

/obj/structure/fd/samosbor/dark_signs1
	name = "wall decor"
	desc = "An modern way to show you are different."
	icon = 'mods/_fd/fd_assets/icons/structures/signs/sign.dmi'
	icon_state = "logo_trinet"
	density = FALSE
	anchored = TRUE
	opacity = FALSE

/obj/structure/fd/samosbor/dark_signs2
	name = "wall decor"
	desc = "An modern way to show you are different."
	icon = 'mods/_fd/fd_assets/icons/structures/signs/sign_poster.dmi'
	icon_state = "investigator"
	density = FALSE
	anchored = TRUE
	opacity = FALSE

/obj/structure/fd/samosbor/dark_signs3
	name = "wall decor"
	desc = "An modern way to show you are different."
	icon = 'mods/_fd/fd_assets/icons/structures/signs/sign_portrait.dmi'
	icon_state = "investor"
	density = FALSE
	anchored = TRUE
	opacity = FALSE

/obj/structure/fd/samosbor/outer_railings
	name = "railings"
	desc = "For safety."
	icon = 'mods/_fd/fd_assets/icons/structures/constructed/construct_dir.dmi'
	icon_state = "railing_green"
	density = TRUE
	anchored = TRUE
	opacity = FALSE

/obj/machinery/jukebox/samosbor1
	icon = 'mods/_fd/fd_assets/icons/structures/jukebox.dmi'
	icon_state = "record"

/obj/machinery/jukebox/samosbor2
	icon = 'mods/_fd/fd_assets/icons/structures/jukebox.dmi'
	icon_state = "jukebox"

/obj/structure/fd/samosbor/neon_signs
	name = "neon decor"
	desc = "An modern way to show you are different."
	icon = 'mods/_fd/fd_assets/icons/structures/signs.dmi'
	icon_state = "cray"
	density = FALSE
	anchored = TRUE
	opacity = FALSE

	var/range_of = 3
	var/power_of = 0.8
	var/color_of = "#ffffff"

/obj/structure/fd/samosbor/neon_signs/Initialize()
	. = ..()
	set_light(range_of, power_of, l_color = color_of)

/obj/structure/fd/samosbor/neon_signs/large
	name = "neon decor"
	desc = "An modern way to show you are different."
	icon = 'mods/_fd/fd_assets/icons/structures/signs_large.dmi'
	icon_state = "startech"
	density = FALSE
	anchored = TRUE
	opacity = FALSE

/obj/structure/fd/samosbor/neon_signs/even_larger
	name = "neon decor"
	desc = "An modern way to show you are different."
	icon = 'mods/_fd/fd_assets/icons/structures/signs_verylarge.dmi'
	icon_state = "trianglebig"
	density = FALSE
	anchored = TRUE
	opacity = FALSE

/obj/structure/fd/samosbor/machinery1
	name = "machinery"
	desc = "Some complex stuff."
	icon = 'mods/_fd/fd_assets/icons/structures/structure_junk.dmi'
	icon_state = "j_antenna_alt"
	density = TRUE
	anchored = TRUE
	opacity = FALSE

/obj/structure/fd/samosbor/machinery2
	name = "machinery"
	desc = "Some complex stuff."
	icon = 'mods/_fd/fd_assets/icons/structures/furniture/furniture_machinery.dmi'
	icon_state = "telephone"
	density = TRUE
	anchored = TRUE
	opacity = FALSE

/obj/structure/fd/samosbor/machinery3
	name = "machinery"
	desc = "Some complex stuff."
	icon = 'mods/_fd/fd_assets/icons/structures/computer.dmi'
	icon_state = "old0"
	density = FALSE
	anchored = TRUE
	opacity = FALSE

/obj/structure/fd/samosbor/light
	name = "light source"
	desc = "Simple decor for well-being."
	icon = 'mods/_fd/fd_assets/icons/machinery/lighting/lighting.dmi'
	icon_state = "stand"
	density = FALSE
	anchored = TRUE
	opacity = FALSE

	var/range_of = 3
	var/power_of = 0.8
	var/color_of = "#ffffff"

/obj/structure/fd/samosbor/light/Initialize()
	. = ..()
	set_light(range_of, power_of, l_color = color_of)

/obj/structure/fd/samosbor/fire
	name = "campfire"
	desc = "For shashlik and warming up in cold Gilgamesh winters."
	icon = 'mods/_fd/fd_assets/icons/structures/fires.dmi'
	icon_state = "campfire_lit"
	density = TRUE
	anchored = TRUE
	opacity = FALSE

	var/range_of = 5
	var/power_of = 0.8
	var/color_of = "#e45b1b"

/obj/structure/fd/samosbor/fire/Initialize()
	. = ..()
	set_light(range_of, power_of, l_color = color_of)

/obj/structure/fd/samosbor/furniture1
	name = "furniture"
	desc = "Simple decor for well-being."
	icon = 'mods/_fd/fd_assets/icons/structures/furniture/furniture.dmi'
	icon_state = "bed_covered"
	density = FALSE
	anchored = TRUE
	opacity = FALSE

/obj/structure/fd/samosbor/furniture3
	name = "furniture"
	desc = "Simple decor for well-being."
	icon = 'mods/_fd/fd_assets/icons/structures/furniture/furniture_chair_mod.dmi'
	icon_state = "sofa_r_start"
	density = FALSE
	anchored = TRUE
	opacity = FALSE

/obj/structure/fd/samosbor/furniture2
	name = "furniture"
	desc = "Simple decor for well-being."
	icon = 'mods/_fd/fd_assets/icons/machinery/machinery_kitchen.dmi'
	icon_state = "dish_washer"
	density = FALSE
	anchored = TRUE
	opacity = FALSE
	mouse_opacity = FALSE

/obj/structure/fd/samosbor/table_decor1
	name = "stuff"
	desc = "stuff."
	icon = 'mods/_fd/fd_assets/icons/small_items/backpack_world.dmi'
	icon_state = "sack"
	density = FALSE
	anchored = TRUE
	opacity = FALSE
	mouse_opacity = FALSE

/obj/structure/fd/samosbor/table_decor2
	name = "stuff"
	desc = "stuff."
	icon = 'mods/_fd/fd_assets/icons/small_items/clutter_world.dmi'
	icon_state = "calendar_unused"
	density = FALSE
	anchored = TRUE
	opacity = FALSE
	mouse_opacity = FALSE

/obj/structure/fd/samosbor/table_decor3
	name = "stuff"
	desc = "stuff."
	icon = 'mods/_fd/fd_assets/icons/small_items/condiments.dmi'
	icon_state = "condiment"
	density = FALSE
	anchored = TRUE
	opacity = FALSE
	mouse_opacity = FALSE

/obj/structure/fd/samosbor/table_decor4
	name = "stuff"
	desc = "stuff."
	icon = 'mods/_fd/fd_assets/icons/small_items/device.dmi'
	icon_state = "taperecorderidle_world"
	density = FALSE
	anchored = TRUE
	opacity = FALSE
	mouse_opacity = FALSE

/obj/structure/fd/samosbor/table_decor5
	name = "stuff"
	desc = "stuff."
	icon = 'mods/_fd/fd_assets/icons/small_items/disks.dmi'
	icon_state = "nucleardisk_world"
	density = FALSE
	anchored = TRUE
	opacity = FALSE
	mouse_opacity = FALSE

/obj/structure/fd/samosbor/table_decor6
	name = "stuff"
	desc = "stuff."
	icon = 'mods/_fd/fd_assets/icons/small_items/dogtags_world.dmi'
	icon_state = "passport_blank"
	density = FALSE
	anchored = TRUE
	opacity = FALSE
	mouse_opacity = FALSE

/obj/structure/fd/samosbor/table_decor7
	name = "stuff"
	desc = "stuff."
	icon = 'mods/_fd/fd_assets/icons/small_items/drink_containers_world.dmi'
	icon_state = "sake"
	density = FALSE
	anchored = TRUE
	opacity = FALSE
	mouse_opacity = FALSE

/obj/structure/fd/samosbor/table_decor8
	name = "stuff"
	desc = "stuff."
	icon = 'mods/_fd/fd_assets/icons/small_items/drinks.dmi'
	icon_state = "energy_drink"
	density = FALSE
	anchored = TRUE
	opacity = FALSE
	mouse_opacity = FALSE

/obj/structure/fd/samosbor/table_decor9
	name = "stuff"
	desc = "stuff."
	icon = 'mods/_fd/fd_assets/icons/small_items/items.dmi'
	icon_state = "globe_yargon4"
	density = FALSE
	anchored = TRUE
	opacity = FALSE
	mouse_opacity = FALSE

/obj/structure/fd/samosbor/table_decor10
	name = "stuff"
	desc = "stuff."
	icon = 'mods/_fd/fd_assets/icons/small_items/library.dmi'
	icon_state = "book_world"
	density = FALSE
	anchored = TRUE
	opacity = FALSE
	mouse_opacity = FALSE

/obj/structure/fd/samosbor/table_decor11
	name = "stuff"
	desc = "stuff."
	icon = 'mods/_fd/fd_assets/icons/small_items/medical_world.dmi'
	icon_state = "medicalkit"
	density = FALSE
	anchored = TRUE
	opacity = FALSE
	mouse_opacity = FALSE

/obj/structure/fd/samosbor/table_decor12
	name = "stuff"
	desc = "stuff."
	icon = 'mods/_fd/fd_assets/icons/small_items/ms_scrap.dmi'
	icon_state = "5,1"
	density = FALSE
	anchored = TRUE
	opacity = FALSE
	mouse_opacity = FALSE

/obj/structure/fd/samosbor/table_decor13
	name = "stuff"
	desc = "stuff."
	icon = 'mods/_fd/fd_assets/icons/small_items/tools_world.dmi'
	icon_state = "bucket"
	density = FALSE
	anchored = TRUE
	opacity = FALSE
	mouse_opacity = FALSE

/obj/machinery/cooker/fryer/samosbor
	icon = 'mods/_fd/fd_assets/icons/machinery/machinery_kitchen.dmi'

/obj/machinery/cooker/oven/samosbor
	icon = 'mods/_fd/fd_assets/icons/machinery/machinery_kitchen.dmi'

/obj/machinery/cooker/oven/samosbor2
	icon_state = "oven2"
	icon = 'mods/_fd/fd_assets/icons/machinery/machinery_kitchen.dmi'

/obj/machinery/cooker/oven/samosbor3
	icon_state = "oven3"
	icon = 'mods/_fd/fd_assets/icons/machinery/machinery_kitchen.dmi'

/obj/structure/fd/samosbor/flora
	name = "flora"
	desc = "Some grassy things."
	icon = 'mods/_fd/fd_assets/icons/structures/flora/flora.dmi'
	icon_state = "gplant_5"
	density = FALSE
	anchored = TRUE
	opacity = FALSE

/obj/structure/fd/samosbor/floor_cable
	name = "cable"
	desc = "cable."
	icon = 'mods/_fd/fd_assets/icons/machinery/machinery_cable.dmi'
	icon_state = "1"
	density = FALSE
	anchored = TRUE
	opacity = FALSE
	mouse_opacity = FALSE

/obj/item/storage/mirror/samosbor
	name = "mirror"
	icon = 'mods/_fd/fd_assets/icons/structures/furniture/furniture.dmi'

/obj/item/storage/mirror/samosbor/MouseDrop(obj/over)
	return

/obj/item/storage/mirror/samosbor/shatter()
	if (shattered)
		playsound(src, 'sound/effects/hit_on_shattered_glass.ogg', 70, 1)
		return
	shattered = TRUE
	icon_state = "[icon_state]_broke"
	playsound(src, "shatter", 70, 1)
	desc = "Oh no, seven years of bad luck!"

/obj/item/storage/mirror/samosbor/use_tool(obj/item/I, mob/living/user, list/click_params)
	. = ..()
	if (!.)
		return
	if (prob(I.force) && user.a_intent == I_HURT)
		user.visible_message(SPAN_WARNING("\The [user] smashes \the [src] with \the [I]!"))
		shatter()

/obj/structure/table
	var/canbestacked = FALSE

/obj/structure/table/rack
	var/no_autoalign = FALSE

/obj/structure/table/rack/auto_align(obj/item/W, click_params)
	if(!no_autoalign)
		. = ..()

/obj/structure/table/rack/samosbor
	name = "furniture"
	icon = 'mods/_fd/fd_assets/icons/structures/furniture/furniture_table.dmi'
	icon_state = "table"
	no_autoalign = TRUE
	canbestacked = TRUE

/obj/structure/table/rack/samosbor/mod
	icon = 'mods/_fd/fd_assets/icons/structures/furniture/furniture_table_mod.dmi'
	icon_state = "table"

/obj/machinery/door/unpowered/simple/samosbor/on_update_icon()
	if(density)
		icon_state = "[icon_base]"
	else
		icon_state = "[icon_base]open"
	return

/obj/machinery/door/unpowered/simple/samosbor/wood
	icon = 'mods/_fd/fd_assets/icons/structures/doors/door.dmi'
	icon_state = "wood"
	icon_base = "wood"
	opacity = 1
	density = 1
	color = null

/obj/machinery/door/unpowered/simple/samosbor/wood/New(newloc,material_name,complexity)
	..(newloc, "wood", complexity)
	color = null

/obj/machinery/door/unpowered/simple/samosbor/wood2
	icon = 'mods/_fd/fd_assets/icons/structures/doors/door.dmi'
	icon_state = "wood_alt"
	icon_base = "wood_alt"
	opacity = 1
	density = 1
	color = null

/obj/machinery/door/unpowered/simple/samosbor/wood2/New(newloc,material_name,complexity)
	..(newloc, "wood", complexity)
	color = null

/obj/machinery/door/unpowered/simple/samosbor/wood3
	icon = 'mods/_fd/fd_assets/icons/structures/doors/door.dmi'
	icon_state = "old"
	icon_base = "old"
	opacity = 1
	density = 1
	color = null

/obj/machinery/door/unpowered/simple/samosbor/wood3/New(newloc,material_name,complexity)
	..(newloc, "wood", complexity)
	color = null

/obj/machinery/door/unpowered/simple/samosbor/wood4
	icon = 'mods/_fd/fd_assets/icons/structures/doors/door.dmi'
	icon_state = "bold"
	icon_base = "bold"
	opacity = 1
	density = 1
	color = null

/obj/machinery/door/unpowered/simple/samosbor/wood4/New(newloc,material_name,complexity)
	..(newloc, "wood", complexity)
	color = null

/obj/machinery/door/unpowered/simple/samosbor/wood5
	icon = 'mods/_fd/fd_assets/icons/structures/doors/door.dmi'
	icon_state = "fancy"
	icon_base = "fancy"
	opacity = 1
	density = 1
	color = null

/obj/machinery/door/unpowered/simple/samosbor/wood5/New(newloc,material_name,complexity)
	..(newloc, "wood", complexity)
	color = null

/obj/machinery/door/unpowered/simple/samosbor/wood6
	icon = 'mods/_fd/fd_assets/icons/structures/doors/door.dmi'
	icon_state = "fancy_alt"
	icon_base = "fancy_alt"
	opacity = 1
	density = 1
	color = null

/obj/machinery/door/unpowered/simple/samosbor/wood6/New(newloc,material_name,complexity)
	..(newloc, "wood", complexity)
	color = null

/obj/machinery/door/unpowered/simple/samosbor/metal
	icon = 'mods/_fd/fd_assets/icons/structures/doors/door.dmi'
	icon_state = "exterior"
	icon_base = "exterior"
	opacity = 1
	density = 1
	color = null

/obj/machinery/door/unpowered/simple/samosbor/metal2
	icon = 'mods/_fd/fd_assets/icons/structures/doors/door.dmi'
	icon_state = "metal"
	icon_base = "metal"
	opacity = 1
	density = 1
	color = null

/obj/machinery/door/unpowered/simple/samosbor/metal3
	icon = 'mods/_fd/fd_assets/icons/structures/doors/door.dmi'
	icon_state = "metal_glass"
	icon_base = "metal_glass"
	opacity = 1
	density = 1
	color = null

/obj/machinery/door/unpowered/simple/samosbor/metal4
	icon = 'mods/_fd/fd_assets/icons/structures/doors/door.dmi'
	icon_state = "metal_train"
	icon_base = "metal_train"
	opacity = 1
	density = 1
	color = null

/obj/machinery/door/unpowered/simple/samosbor/metal5
	icon = 'mods/_fd/fd_assets/icons/structures/doors/shutter/shutter.dmi'
	icon_state = "rblast"
	icon_base = "rblast"
	opacity = 1
	density = 1
	color = null

/obj/machinery/door/unpowered/simple/samosbor/metal6
	icon = 'mods/_fd/fd_assets/icons/structures/doors/shutter/shutter.dmi'
	icon_state = "door"
	icon_base = "door"
	opacity = 1
	density = 1
	color = null

/obj/machinery/door/unpowered/simple/samosbor/metal7
	icon = 'mods/_fd/fd_assets/icons/structures/doors/shutter/shutter.dmi'
	icon_state = "kdoor"
	icon_base = "kdoor"
	opacity = 1
	density = 1
	color = null

/obj/machinery/washing_machine/samosbor
	icon = 'mods/_fd/fd_assets/icons/machinery/washing_machine.dmi'

/obj/structure/fake_zlvl/unalive/attack_hand(mob/user as mob)
	var/option = alert(user, "Вы хотите умереть?", "Решение", "Очень", "Ещё в раздумиях")
	switch(option)
		if("Очень")
			user.visible_message(SPAN_WARNING("[user] собирается спрыгнуть!"))
			if(do_after(user, 5 SECONDS))

				if(user.dir == WEST)
					animate(user, pixel_x = -64, time = 1 SECONDS, easing = ELASTIC_EASING | EASE_OUT)
					animate(user, transform = matrix(0.01, MATRIX_SCALE), time = 1 SECOND, easing = BOUNCE_EASING)
					spawn(2 SECONDS)
						qdel(user)
				if(user.dir == EAST)
					animate(user, pixel_x = 64, time = 1 SECONDS, easing = ELASTIC_EASING | EASE_OUT)
					animate(user, transform = matrix(0.01, MATRIX_SCALE), time = 1 SECOND, easing = BOUNCE_EASING)
					spawn(2 SECONDS)
						qdel(user)
				if(user.dir == SOUTH)
					animate(user, pixel_y = -64, time = 1 SECONDS, easing = ELASTIC_EASING | EASE_OUT)
					animate(user, transform = matrix(0.01, MATRIX_SCALE), time = 1 SECOND, easing = BOUNCE_EASING)
					spawn(2 SECONDS)
						qdel(user)
				if(user.dir == NORTH)
					animate(user, pixel_y = 64, time = 1 SECONDS, easing = ELASTIC_EASING | EASE_OUT)
					animate(user, transform = matrix(0.01, MATRIX_SCALE), time = 1 SECOND, easing = BOUNCE_EASING)
					spawn(2 SECONDS)
						qdel(user)

				var/area/area = get_area(src)

				for(var/mob/living/hearers in area)
					to_chat(hearers, SPAN_DANGER("<b>Вы видите как вашего соседа, [user], только что размазало по асфальту. Помянем!</b>"))
		if("Ещё в раздумиях")
			return FALSE

// lift

/obj/machinery/computer/shuttle_control/lift/samosbor
	name = "lift controls"
	shuttle_tag = "Building lift"
	ui_template = "shuttle_control_console_lift.tmpl"
	icon_state = "tiny"
	icon_keyboard = "tiny_keyboard"
	icon_screen = "lift"
	density = FALSE

/datum/shuttle/autodock/ferry/samosbor
	name = "Building lift"
	shuttle_area = /area/gigahrusch/lift
	warmup_time = 3
	waypoint_station = "nav_samosbor_top"
	waypoint_offsite = "nav_samosbor_bottom"
	sound_takeoff = 'sound/effects/lift_heavy_start.ogg'
	sound_landing = 'sound/effects/lift_heavy_stop.ogg'
	ceiling_type = null
	knockdown = 0
	defer_initialisation = TRUE

/obj/shuttle_landmark/lift/samosbor/top
	name = "Top Level"
	landmark_tag = "nav_samosbor_top"
	base_area = /area/gigahrusch/inner
	base_turf = /turf/simulated/floor/plating

/obj/shuttle_landmark/lift/samosbor/bottom
	name = "Lower Level"
	landmark_tag = "nav_samosbor_bottom"
	flags = SLANDMARK_FLAG_AUTOSET
	base_area = /area/gigahrusch/inner
	base_turf = /turf/simulated/floor/plating

// zavod

/obj/item/fd/ammunition
	name = "shell"
	desc = "Ammunition shell."
	icon = 'mods/_fd/fd_assets/icons/structures/ammo.dmi'
	icon_state = "custom_rocket_unlocked"
	w_class = ITEM_SIZE_HUGE

/obj/structure
	var/datum/sound_token/working_sound_token //autogenerated, don't touch unless you know what you're doing
	var/working_sound_id //same as above

	var/list/working_sounds //Duh looped sound
	var/working_volume //Adjust as required

	var/list/action_sound //Extra stuff, not required
	var/startup_sound
	var/shutdown_sound

/obj/structure/proc/play_working_soundloop()
	if(!working_sounds)
		return
	if(!working_sound_token)
		if(startup_sound)
			playsound(src, startup_sound, (working_volume+5), TRUE)
			addtimer(new Callback(src, PROC_REF(assign_working_sound_token), length(startup_sound)))
		else
			assign_working_sound_token()

/obj/structure/proc/assign_working_sound_token()
	if(!working_sound_id)
		working_sound_id = "[type]_[sequential_id(type)]"
	working_sound_token = GLOB.sound_player.PlayLoopingSound(src, working_sound_id, pick(working_sounds), working_volume, 10, 1)
	working_sound_token.SetVolume(working_volume)

/obj/structure/proc/stop_working_soundloop()
	if(working_sound_token)
		QDEL_NULL(working_sound_token)
		if(shutdown_sound)
			playsound(src, shutdown_sound, working_volume+5, 5)

/obj/structure/proc/play_action_sound()
	playsound(src, (pick(action_sound)), (working_volume+15), TRUE)

/obj/structure/fd/samosbor/quota
	name = "quota harvester"
	desc = "For storing your work."
	icon = 'mods/_fd/_maps/tartakan/icons/ms_conveyormachinery32.dmi'
	icon_state = "conv1"
	density = TRUE
	anchored = TRUE
	opacity = FALSE

	var/needed = 20
	var/current = 0
	var/full = FALSE
	working_sounds = list('mods/_fd/immersive_sounds/sounds/SOMA/server_loop_01.ogg', 'mods/_fd/immersive_sounds/sounds/SOMA/server_loop_02.ogg', 'mods/_fd/immersive_sounds/sounds/SOMA/server_loop_03.ogg')
	action_sound = list('mods/_fd/immersive_sounds/sounds/SOMA/server_movement_02.ogg', 'mods/_fd/immersive_sounds/sounds/SOMA/server_movement_03.ogg', 'mods/_fd/immersive_sounds/sounds/SOMA/server_movement_04.ogg', 'mods/_fd/immersive_sounds/sounds/SOMA/server_movement_05.ogg')
	startup_sound = list('mods/_fd/immersive_sounds/sounds/SOMA/server_switch_start_01.ogg', 'mods/_fd/immersive_sounds/sounds/SOMA/server_lever_reset_01.ogg')
	working_volume = 5

/obj/structure/fd/samosbor/quota/use_tool(obj/item/W as obj, mob/user as mob)
	SHOULD_CALL_PARENT(FALSE)
	if(!full)
		if(istype(W, /obj/item/fd/ammunition))
			qdel(W)
			sound_to(user, sound('sound/effects/extin.ogg', volume = 100))
			src.current = src.current + 1

		if(src.current == src.needed)
			for(var/mob/living/M in orange(20,src))
				to_chat(M, "<b>Товарищи! Квота была выполнена! Смена окончена. Всем спасибо за работу.</b>")
			src.full = TRUE

/obj/structure/fd/samosbor/lathe
	name = "working machinery"
	desc = "For creating your money."
	icon = 'mods/_fd/_maps/tartakan/icons/ms_conveyormachinery64.dmi'
	icon_state = "conv1"
	density = TRUE
	anchored = TRUE
	opacity = FALSE

	bound_width = 64
	var/busy = FALSE
	working_sounds = list('mods/_fd/immersive_sounds/sounds/SOMA/server_loop_01.ogg', 'mods/_fd/immersive_sounds/sounds/SOMA/server_loop_02.ogg', 'mods/_fd/immersive_sounds/sounds/SOMA/server_loop_03.ogg')
	action_sound = list('mods/_fd/immersive_sounds/sounds/SOMA/server_movement_02.ogg', 'mods/_fd/immersive_sounds/sounds/SOMA/server_movement_03.ogg', 'mods/_fd/immersive_sounds/sounds/SOMA/server_movement_04.ogg', 'mods/_fd/immersive_sounds/sounds/SOMA/server_movement_05.ogg')
	startup_sound = list('mods/_fd/immersive_sounds/sounds/SOMA/server_switch_start_01.ogg', 'mods/_fd/immersive_sounds/sounds/SOMA/server_lever_reset_01.ogg')
	working_volume = 5

/obj/structure/fd/samosbor/lathe/attack_hand(mob/user as mob)
	busy = TRUE
	if(do_after(user, 60 SECONDS))
		sound_to(user, sound('sound/effects/extout.ogg', volume = 60))
		new /obj/item/fd/ammunition(get_turf(src))
		busy = FALSE
	else
		busy = FALSE

/obj/structure/fd/samosbor/lathe/Initialize()
	. = ..()
	START_PROCESSING(SSobj, src)

/obj/structure/fd/samosbor/lathe/Destroy()
	. = ..()
	STOP_PROCESSING(SSobj, src)

/obj/structure/fd/samosbor/lathe/Process()
	if(busy)
		play_working_soundloop()
	else
		stop_working_soundloop()
	return TRUE

// event electricity

/obj/structure/fd/fuse_box/samosbor/attack_hand(mob/living/user as mob)
	if(do_after(user, 30 SECONDS))
		if(user.skill_check(SKILL_ELECTRICAL, SKILL_HARD))
			restore_light()
			return TRUE
		else
			user.electrocute_act(30, src, def_zone = BP_R_ARM)
			restore_light()
			return TRUE

/proc/restore_light()
	for(var/obj/structure/fd/samosbor/light/L in world)
		L.set_light(L.range_of, L.power_of, l_color = L.color_of)

/proc/remove_light()
	for(var/obj/structure/fd/samosbor/light/L in world)
		L.set_light(0, 0, l_color = L.color_of)

// teleports
/obj/structure/fd/portal/samosbor/to_zavod
	name = "Bus"
	icon = 'mods/_fd/fd_assets/icons/structures/armored_truck_white.dmi'
	icon_state = "armored_truck_white"
	bound_width = 64
	layer = ABOVE_HUMAN_LAYER

/turf/simulated/floor/exoplanet/samosbor/metal/teleport_point

/obj/structure/fd/portal/samosbor/from_zavod
	name = "Door"
	icon = 'mods/_fd/fd_assets/icons/structures/doors/door.dmi'
	icon_state = "exterior"

/obj/structure/fd/portal/samosbor/stairs
	name = "CLICK ME"
	icon_state = "blurry"
	alpha = 50
	color = "#63ce00"

/turf/simulated/floor/exoplanet/grim_asphalt2/teleport_point
