
/obj/item/device/flashlight/lamp/small
	name = "desk lamp"
	desc = "A desk lamp."
	icon = 'mods/_fd/chem_furniture/icons/furniture.dmi'
	icon_state = "lamp"
	w_class = ITEM_SIZE_NORMAL
	flashlight_range = 4
	light_color = COLOR_ORANGE

	on = TRUE

/obj/item/device/flashlight/lamp/floor
	name = "floor lamp"
	desc = "A floor lamp."
	icon = 'mods/_fd/chem_furniture/icons/furniture.dmi'
	icon_state = "floor_lamp"
	w_class = ITEM_SIZE_HUGE
	flashlight_range = 5
	light_color = COLOR_ORANGE

	on = TRUE

/obj/structure/hygiene/sink/modern
	name = "modern sink"
	icon_state = "sink_modern"
	icon = 'mods/_fd/chem_furniture/icons/furniture.dmi'

//				So, there's the platforms from CM. Long time...

/obj/structure/platform
	name = "platform"
	desc = "A square metal surface resting on four legs."
	icon = 'mods/_fd/chem_furniture/icons/platforms.dmi'
	icon_state = "platform"
	climb_speed_mult = 0.08
	health_max = 400
	anchored = TRUE
	density = TRUE
	throwpass = TRUE
	layer = BELOW_TABLE_LAYER
	unacidable = TRUE
	atom_flags = ATOM_FLAG_NO_TEMP_CHANGE | ATOM_FLAG_CHECKS_BORDER | ATOM_FLAG_CLIMBABLE | ATOM_FLAG_CAN_BE_PAINTED

/obj/structure/platform/stair_cut
	icon_state = "platform_stair"
	dir = 1
/obj/structure/platform/stair_cut/alt
	icon_state = "platform_stair_alt"
	dir = 1

/obj/structure/platform/Initialize()
	. = ..()
	var/image/I = image(icon, src, "platform_overlay", BELOW_OBJ_LAYER, dir)
	switch(dir)
		if(SOUTH)
			if(!(locate(/obj/fd_water) in loc))
				layer = ABOVE_HUMAN_LAYER-0.01
			I.pixel_y = -16
		if(NORTH)
			I.pixel_y = 16
		if(EAST)
			I.pixel_x = 16
		if(WEST)
			I.pixel_x = -16
	overlays += I

/obj/structure/platform/on_death()
	visible_message(SPAN_DANGER("\The [src] collapses!"))
	playsound(loc, 'sound/effects/grillehit.ogg', 50, 1)
	qdel(src)

/obj/structure/platform/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
	if (!istype(mover) || mover.checkpass(PASS_FLAG_TABLE))
		return TRUE
	if (get_dir(loc, target) == dir)
		return !density
	return TRUE

/obj/structure/platform/CheckExit(atom/movable/O, turf/target)
	if (istype(O) && O.checkpass(PASS_FLAG_TABLE))
		return 1
	if (get_dir(O.loc, target) == dir)
		if (!density)
			return 1
		return 0
	return 1

/obj/structure/platform/Bumped(atom/thing)
	if(isliving(thing))
		do_climb(thing)
	..()

/obj/structure/platform/can_climb(mob/living/user, post_climb_check=FALSE, check_silicon=TRUE)
	. = ..()
	if (. && get_turf(user) == get_turf(src))
		var/turf/T = get_step(src, src.dir)
		if (T.density || T.turf_is_crowded(user))
			to_chat(user, SPAN_WARNING("You can't climb there, the way is blocked."))
			return 0

/obj/structure/platform/do_climb(mob/living/user)
	. = ..()
	if (.)
		user.jump_layer_shift()
		addtimer(new Callback(user, TYPE_PROC_REF(/mob/living, jump_layer_shift_end)), 2)

/obj/structure/platform/slam_into(mob/living/L)
	var/turf/target_turf = get_turf(src)
	if (target_turf == get_turf(L))
		target_turf = get_step(src, dir)
	if (!target_turf.density && !target_turf.turf_is_crowded(L))
		L.forceMove(target_turf)
		L.visible_message(SPAN_WARNING("\The [L] [pick("falls", "flies")] over \the [src]!"))
		L.Weaken(2)
		playsound(L, 'sound/effects/grillehit.ogg', 25, 1, FALSE)
	else
		..()

/obj/structure/platform/use_grab(obj/item/grab/grab, list/click_params)
	var/obj/occupied = turf_is_crowded()
	if (occupied)
		USE_FEEDBACK_GRAB_FAILURE(SPAN_WARNING("There's \a [occupied] blocking \the [src]."))
		return TRUE

	if (!grab.force_danger())
		var/action = grab.assailant.a_intent == I_HURT ? "to slam them against \the [src]" : "to throw them over \the [src]"
		USE_FEEDBACK_GRAB_MUST_UPGRADE(action)
		return TRUE

	// Harm intent - Face slamming
	if (grab.assailant.a_intent == I_HURT)
		var/blocked = grab.affecting.get_blocked_ratio(BP_HEAD, DAMAGE_BRUTE, damage = 8)
		if (prob(30 * (1 - blocked)))
			grab.affecting.Weaken(5)
		grab.affecting.apply_damage(8, DAMAGE_BRUTE, BP_HEAD)
		playsound(src, 'sound/effects/grillehit.ogg', 50, 1)
		grab.assailant.visible_message(
			SPAN_WARNING("\The [grab.assailant] slams \the [grab.affecting]'s face against \the [src]!"),
			SPAN_DANGER("You slam \the [grab.affecting]'s face against \the [src]!")
		)
		return TRUE

	if (get_turf(grab.affecting) == get_turf(src))
		grab.affecting.forceMove(get_step(src, dir))
	else
		grab.affecting.dropInto(loc)
	grab.affecting.Weaken(5)
	grab.assailant.visible_message(
		SPAN_WARNING("\The [grab.assailant] throws \the [grab.affecting] over \the [src]."),
		SPAN_WARNING("You throw \the [grab.affecting] over \the [src]."),
	)
	return TRUE

/obj/structure/platform/hitby(atom/movable/AM, datum/thrownthing/TT)
	var/mob/living/L = AM
	if (!istype(L))
		return
	var/chance = TT.thrower.skill_check(SKILL_HAULING, SKILL_EXPERIENCED) ? 100 : 50
	if (prob(chance))
		slam_into(L)

/obj/structure/platform_decoration
	name = "platform"
	desc = "A square metal surface resting on four legs."
	icon = 'mods/_fd/chem_furniture/icons/platforms.dmi'
	icon_state = "platform_deco"
	health_max = 80
	anchored = TRUE
	density = FALSE
	throwpass = TRUE
	layer = BELOW_TABLE_LAYER
	unacidable = TRUE
	atom_flags = ATOM_FLAG_NO_TEMP_CHANGE | ATOM_FLAG_CHECKS_BORDER | ATOM_FLAG_CAN_BE_PAINTED

/obj/structure/platform_decoration/Initialize()
	. = ..()
	switch(dir)
		if (NORTH)
			layer = ABOVE_HUMAN_LAYER-0.01
		if (SOUTH)
			layer = ABOVE_HUMAN_LAYER-0.01
		if (SOUTHEAST)
			layer = ABOVE_HUMAN_LAYER-0.01
		if (SOUTHWEST)
			layer = ABOVE_HUMAN_LAYER-0.01

/obj/structure/platform_decoration/on_death()
	visible_message(SPAN_DANGER("\The [src] collapses!"))
	playsound(loc, 'sound/effects/grillehit.ogg', 50, 1)
	qdel(src)

//Map variants//

//Strata purple ice//
/obj/structure/platform_decoration/strata
	name = "ice rock corner"
	desc = "A solid chunk of desolate rocks and ice."
	icon_state = "strata_platform_deco"

/obj/structure/platform/strata
	name = "ice rock edge"
	desc = "A solid chunk of desolate rocks and ice. Looks like you could climb it with some difficulty."
	icon_state = "strata_platform"

//Strata wall metal platforms
/obj/structure/platform_decoration/strata/metal
	name = "raised metal corner"
	desc = "A raised level of metal, often used to elevate areas above others. This is the corner."
	icon_state = "strata_metalplatform_deco"

/obj/structure/platform/strata/metal
	name = "raised metal edge"
	desc = "A raised level of metal, often used to elevate areas above others. You could probably climb it."
	icon_state = "strata_metalplatform"

//Kutjevo metal platforms

/obj/structure/platform/kutjevo
	icon_state = "kutjevo_platform"
	name = "raised metal edge"
	desc = "A raised level of metal, often used to elevate areas above others, or construct bridges. You could probably climb it."
	climb_speed_mult = 0.05

/obj/structure/platform_decoration/kutjevo
	name = "raised metal corner"
	desc = "A raised level of metal, often used to elevate areas above others, or construct bridges. You could probably climb it."
	icon_state = "kutjevo_platform_deco"


/obj/structure/platform/kutjevo/smooth
	icon_state = "kutjevo_platform_sm"
	name = "raised metal edge"
	desc = "A raised level of metal, often used to elevate areas above others, or construct bridges. You could probably climb it."

/obj/structure/platform/kutjevo/smooth/stair_plate
	icon_state = "kutjevo_stair_plate"

/obj/structure/platform_decoration/kutjevo/smooth
	name = "raised metal corner"
	desc = "A raised level of metal, often used to elevate areas above others, or construct bridges. You could probably climb it."
	icon_state = "kutjevo_platform_sm_deco"

/obj/structure/platform/kutjevo/rock
	icon_state = "kutjevo_rock"
	name = "raised rock edges"
	desc = "A collection of stones and rocks that provide ample grappling and vaulting opportunity. Indicates a change in elevation. You could probably climb it."

/obj/structure/platform_decoration/kutjevo/rock
	name = "raised rock corner"
	desc = "A collection of stones and rocks that cap the edge of some conveniently 1-meter-long lengths of perfectly climbable chest high walls."
	icon_state = "kutjevo_rock_deco"


/obj/structure/platform/mineral
	icon_state = "stone"
/obj/structure/platform_decoration/mineral
	icon_state = "stone_deco"

/obj/structure/platform/mineral/sandstone
	name = "sandstone platform"
	desc = "A platform supporting elevated ground, made of sandstone. Has what seem to be ancient hieroglyphs on its side."
	color = "#c6a480"

/obj/structure/platform/mineral/sandstone/runed
	name = "sandstone temple platform"
	color = "#b29082"



/obj/structure/platform_decoration/mineral/sandstone
	name = "sandstone platform corner"
	desc = "A platform corner supporting elevated ground, made of sandstone. Has what seem to be ancient hieroglyphs on its side."
	color = "#c6a480"

/obj/structure/platform/shiva/catwalk
	icon_state = "shiva"
	name = "raised rubber cord platform"
	desc = "Reliable steel and a polymer rubber substitute. Doesn't crack under cold weather."

/obj/structure/platform_decoration/shiva/catwalk
	icon_state = "shiva_deco"
	name = "raised rubber cord platform"
	desc = "Reliable steel and a polymer rubber substitute. Doesn't crack under cold weather."

/obj/structure/platform_decoration/mineral/sandstone/runed
	name = "sandstone temple platform corner"
	color = "#b29082"

/// Hybrisa Platforms

/obj/structure/platform/hybrisa
	icon_state = "hybrisa"

/obj/structure/platform_decoration/hybrisa
	icon_state = "hybrisa"

/obj/structure/platform/hybrisa/engineer
	icon_state = "engineer_platform"
	name = "raised metal edge"
	desc =  "A raised level of metal, often used to elevate areas above others, or construct bridges. You could probably climb it."
	climb_speed_mult = 0.8

/obj/structure/platform_decoration/hybrisa/engineer_corner
	name = "raised metal corner"
	desc = "A raised level of metal, often used to elevate areas above others, or construct bridges. You could probably climb it."
	icon_state = "engineer_platform_deco"

/obj/structure/platform_decoration/hybrisa/engineer_cornerbits
	name = "raised metal corner"
	desc = "A raised level of metal, often used to elevate areas above others, or construct bridges. You could probably climb it."
	icon_state = "engineer_platform_platformcorners"


/obj/structure/platform/hybrisa/rockdark
	icon_state = "kutjevo_rockdark"
	name = "raised rock edges"
	desc = "A collection of stones and rocks that provide ample grappling and vaulting opportunity. Indicates a change in elevation. You could probably climb it."

/obj/structure/platform_decoration/hybrisa/rockdark
	name = "raised rock corner"
	desc = "A collection of stones and rocks that cap the edge of some conveniently 1-meter-long lengths of perfectly climbable chest high walls."
	icon_state = "kutjevo_rock_decodark"


/obj/structure/platform/hybrisa/metalplatform1
	icon_state = "hybrisastone"
	name = "raised metal edge"
	desc = "A raised level of metal, often used to elevate areas above others. You could probably climb it."
/obj/structure/platform_decoration/hybrisa/metalplatformdeco1
	icon_state = "hybrisastone_deco"
	name = "raised metal corner"
	desc = "A raised level of metal, often used to elevate areas above others. This is the corner."

/obj/structure/platform_decoration/hybrisa/metalplatformdeco2
	name = "raised metal corner"
	desc = "A raised level of metal, often used to elevate areas above others. This is the corner."
	icon_state = "strata_metalplatform_deco2"

/obj/structure/platform/hybrisa/metalplatform2
	name = "raised metal edge"
	desc = "A raised level of metal, often used to elevate areas above others. You could probably climb it."
	icon_state = "strata_metalplatform2"

/obj/structure/platform_decoration/hybrisa/metalplatformdeco3
	name = "raised metal corner"
	desc = "A raised level of metal, often used to elevate areas above others. This is the corner."
	icon_state = "strata_metalplatform_deco3"

/obj/structure/platform/hybrisa/metalplatform3
	name = "raised metal edge"
	desc = "A raised level of metal, often used to elevate areas above others. You could probably climb it."
	icon_state = "strata_metalplatform3"

/obj/structure/platform/hybrisa/metalplatform4
	icon_state = "hybrisaplatform"
	name = "raised metal platform"
	desc = "A raised level of metal, often used to elevate areas above others. You could probably climb it."

/obj/structure/platform_decoration/hybrisa/metalplatformdeco4
	icon_state = "hybrisaplatform_deco"
	name = "raised metal corner"
	desc = "A raised level of metal, often used to elevate areas above others. You could probably climb it."

/obj/structure/platform/hybrisa/metalplatform5
	icon_state = "hybrisaplatform2"
	name = "raised metal platform"
	desc = "A raised level of metal, often used to elevate areas above others. You could probably climb it."

/obj/structure/platform_decoration/hybrisa/metalplatformdeco5
	icon_state = "hybrisaplatform_deco2"
	name = "raised metal corner"
	desc = "A raised level of metal, often used to elevate areas above others. You could probably climb it."

/obj/structure/platform/hybrisa/metalplatform6
	icon_state = "hybrisaplatform3"
	name = "raised metal platform"
	desc = "A raised level of metal, often used to elevate areas above others. You could probably climb it."

/obj/structure/platform/hybrisa/metalplatformstair1
	icon_state = "hybrisaplatform_stair" //icon will be honked in all dirs except (1), that's because the behavior breaks if it ain't (1)
	name = "raised metal platform"
	desc = "A raised level of metal, often used to elevate areas above others. You could probably climb it."
	dir = 1

/obj/structure/platform/hybrisa/metalplatformstair2
	icon_state = "hybrisaplatform_stair_alt"
	name = "raised metal platform"
	desc = "A raised level of metal, often used to elevate areas above others. You could probably climb it."
	dir = 1

/obj/structure/platform_decoration/hybrisa/metalplatformdeco6
	icon_state = "hybrisaplatform_deco3"
	name = "raised metal corner"
	desc = "A raised level of metal, often used to elevate areas above others. You could probably climb it."

//			FLOORS			//

/turf/simulated/floor/exoplanet/col
	name = "floor"
	desc = "Floor..."
	icon = 'mods/_fd/chem_furniture/icons/roads.dmi'
	icon_state = ""

/turf/simulated/floor/exoplanet/col/asphalt
	name = "asphalt"
	desc = "Floor..."
	icon_state = "road1"

/turf/simulated/floor/exoplanet/col/asphalt/Initialize()
	. = ..()
	icon_state = "road[rand(1,4)]"

/turf/simulated/floor/exoplanet/col/asphalt2
	name = "asphalt"
	desc = "Floor..."
	icon_state = "asphalt0"

/turf/simulated/floor/exoplanet/col/asphalt2/Initialize()
	. = ..()
	icon_state = "asphalt[rand(0,3)]"

/turf/simulated/floor/exoplanet/col/pavement
	name = "bricks"
	icon_state = "brick"

/turf/simulated/floor/exoplanet/col/pavement/tile
	icon_state = "tile"

/turf/simulated/floor/exoplanet/col/pavement/mozai
	icon_state = "mozai"

/turf/simulated/floor/exoplanet/col/pavement/brick_stair
	icon_state = "brick_stair"

/turf/simulated/wall/concrete/reinforced
	icon_state = "r_generic"

/turf/simulated/wall/concrete/reinforced/New(newloc)
	..(newloc,MATERIAL_CONCRETE,MATERIAL_IRON)

/turf/simulated/wall/concrete/gunmetal
	paint_color = COLOR_GUNMETAL

/turf/simulated/wall/concrete/reinforced/gunmetal
	paint_color = COLOR_GUNMETAL

/obj/structure/wall_frame/concrete
	material = MATERIAL_CONCRETE

/obj/structure/wall_frame/concrete/gunmetal
	paint_color = COLOR_WALL_GUNMETAL

/obj/wallframe_spawn/concrete
	name = "concrete frame window spawner (no grille)"
	grille_path = null
	frame_path = /obj/structure/wall_frame/concrete

/obj/wallframe_spawn/concrete/gunmetal
	name = "concrete frame window spawner"
	frame_path = /obj/structure/wall_frame/concrete/gunmetal

/obj/wallframe_spawn/reinforced/concrete
	name = "reinforced concrete frame window spawner (no grille)"
	grille_path = null

/obj/wallframe_spawn/reinforced/concrete/gunmetal
	name = "reinforced titanium wall frame window spawner"
	frame_path = /obj/structure/wall_frame/concrete/gunmetal

/turf/simulated/floor/exoplanet/col/roof
	name = "roof"
	icon = 'mods/_fd/chem_furniture/icons/roof.dmi'
	icon_state = "asphalt"
	initial_flooring = /singleton/flooring/roof_asphalt

/singleton/flooring/roof_asphalt
	name = "roof"
	desc = "Its a roof."
	icon = 'mods/_fd/chem_furniture/icons/roof.dmi'
	icon_base = "asphalt"
	build_type = /obj/item/stack/tile/roof
	flags = TURF_HAS_CORNERS | TURF_HAS_INNER_CORNERS | TURF_REMOVE_CROWBAR
	can_engrave = FALSE
	footstep_type = /singleton/footsteps/sand
	floor_smooth = SMOOTH_NONE
	wall_smooth = SMOOTH_NONE
	space_smooth = SMOOTH_NONE

/obj/item/stack/tile/roof
	name = "roof tiles"
	singular_name = "roof tile"
	desc = "A piece of roof."
	icon = 'mods/_fd/chem_furniture/icons/roof.dmi'
	icon_state = "roof_tile"
	build_type = /obj/item/stack/tile/roof

/obj/item/stack/tile/roof/fifty
	amount = 50

/turf/simulated/floor/exoplanet/col/roof/sheet
	name = "sheet roof"
	icon = 'mods/_fd/chem_furniture/icons/roof.dmi'
	icon_state = "sheet"
	initial_flooring = /singleton/flooring/roof_sheet

/singleton/flooring/roof_sheet
	name = "sheet roof"
	desc = "Its a sheet roof."
	icon = 'mods/_fd/chem_furniture/icons/roof.dmi'
	icon_base = "sheet"
	build_type = /obj/item/stack/tile/roof/sheet
	flags = TURF_HAS_CORNERS | TURF_HAS_INNER_CORNERS | TURF_REMOVE_CROWBAR
	can_engrave = FALSE
	footstep_type = /singleton/footsteps/catwalk
	floor_smooth = SMOOTH_NONE
	wall_smooth = SMOOTH_NONE
	space_smooth = SMOOTH_NONE

/obj/item/stack/tile/roof/sheet
	name = "sheet roof tiles"
	singular_name = "sheet tile"
	desc = "A piece of sheet."
	icon = 'mods/_fd/chem_furniture/icons/roof.dmi'
	icon_state = "sheet_tile"
	build_type = /obj/item/stack/tile/roof/sheet

/obj/item/stack/tile/roof/sheet/fifty
	amount = 50

/turf/simulated/floor/exoplanet/col/roof/concrete
	name = "concrete roof"
	icon = 'mods/_fd/chem_furniture/icons/roof.dmi'
	icon_state = "concrete"
	initial_flooring = /singleton/flooring/roof_concrete

/singleton/flooring/roof_concrete
	name = "concrete roof"
	desc = "Its a concrete roof."
	icon = 'mods/_fd/chem_furniture/icons/roof.dmi'
	icon_base = "concrete"
	build_type = /obj/item/stack/tile/roof/concrete
	flags = TURF_HAS_CORNERS | TURF_HAS_INNER_CORNERS | TURF_REMOVE_SHOVEL
	can_engrave = FALSE
	footstep_type = /singleton/footsteps/asteroid
	floor_smooth = SMOOTH_NONE
	wall_smooth = SMOOTH_NONE
	space_smooth = SMOOTH_NONE

/obj/item/stack/tile/roof/concrete
	name = "concrete roof tiles"
	singular_name = "concrete tile"
	desc = "A piece of concrete roof."
	icon = 'mods/_fd/chem_furniture/icons/roof.dmi'
	icon_state = "concrete_tile"
	build_type = /obj/item/stack/tile/roof/concrete
	matter = list(MATERIAL_CONCRETE = 450)

/obj/item/stack/tile/roof/concrete/fifty
	amount = 50

/datum/stack_recipe/tile/roof_concrete
	title = "concrete roof tile"
	result_type = /obj/item/stack/tile/roof/concrete

/turf/simulated/floor/exoplanet/col/concrete
	name = "concrete floor"
	icon = 'mods/_fd/chem_furniture/icons/roads.dmi'
	icon_state = "concrete0"
	initial_flooring = /singleton/flooring/col_concrete

/turf/simulated/floor/exoplanet/col/concrete/Initialize()
	. = ..()
	icon_state = "concrete[rand(0,3)]"

/singleton/flooring/col_concrete
	name = "concrete floor"
	desc = "Concrete floor... Yeah, thats it."
	icon = 'mods/_fd/chem_furniture/icons/roads.dmi'
	icon_base = "concrete0"
	flags = TURF_REMOVE_SHOVEL | TURF_ACID_IMMUNE
	build_type = /obj/item/stack/material/concrete
	build_cost = 1
	build_time = 30
	apply_thermal_conductivity = 0.025
	apply_heat_capacity = 405000
	can_paint = 1
	footstep_type = /singleton/footsteps/asteroid

/obj/item/stack/material/concrete
	name = "concrete brick"
	default_type = MATERIAL_CONCRETE

/turf/simulated/floor/exoplanet/col/grass
	name = "grass"
	icon = 'mods/_fd/chem_furniture/icons/auto_strata_grass.dmi'
	icon_state = "grass"
	initial_flooring = /singleton/flooring/col_grass

/singleton/flooring/col_grass
	name = "grass"
	desc = "Its a grass. Touch it."
	icon = 'mods/_fd/chem_furniture/icons/auto_strata_grass.dmi'
	icon_base = "grass"
	build_type = /obj/item/stack/tile/col_grass
	flags = TURF_HAS_CORNERS | TURF_HAS_EDGES | TURF_REMOVE_SHOVEL
	can_engrave = FALSE
	footstep_type = /singleton/footsteps/grass
	floor_smooth = SMOOTH_NONE
	wall_smooth = SMOOTH_ALL
	space_smooth = SMOOTH_NONE

/obj/item/stack/tile/col_grass
	name = "grass tiles"
	singular_name = "grass tile"
	desc = "A piece of cool grass."
	icon = 'mods/_fd/chem_furniture/icons/auto_strata_grass.dmi'
	icon_state = "grass_tile"
	build_type = /obj/item/stack/tile/col_grass

/obj/item/stack/tile/col_grass/fifty
	amount = 50

/turf/simulated/floor/exoplanet/col/mud
	name = "mud"
	icon = 'mods/_fd/chem_furniture/icons/auto_strata_grass.dmi'
	icon_state = "mud"
	initial_flooring = /singleton/flooring/col_mud

/singleton/flooring/col_mud
	name = "mud"
	desc = "Its a mud. Dont touch it."
	icon = 'mods/_fd/chem_furniture/icons/auto_strata_grass.dmi'
	icon_base = "mud"
	build_type = /obj/item/stack/tile/col_mud
	flags = TURF_REMOVE_SHOVEL
	can_engrave = FALSE
	footstep_type = /singleton/footsteps/water

/obj/item/stack/tile/col_mud
	name = "mud tiles"
	singular_name = "mud tile"
	desc = "A piece of cool mud."
	icon = 'mods/_fd/chem_furniture/icons/auto_strata_grass.dmi'
	icon_state = "mud_tile"
	build_type = /obj/item/stack/tile/col_mud

/obj/item/stack/tile/col_mud/fifty
	amount = 50

/obj/floor_decal/roads
	name = "road lines"
	icon = 'mods/_fd/chem_furniture/icons/roads.dmi'
	icon_state = ""

/obj/floor_decal/roads/line
	name = "road line white"
	icon_state = "road_lines"

/obj/floor_decal/roads/line_y
	name = "road line yellow"
	icon_state = "road_lines_y"

/obj/floor_decal/roads/arrow
	name = "road arrow"
	icon_state = "road_arrow"

/obj/floor_decal/roads/wide
	name = "road wide line"
	icon_state = "road_wide"

/obj/floor_decal/roads/stripe
	name = "road stripe white"
	icon_state = "road_stripe"

/obj/floor_decal/roads/stripe_y
	name = "road stripe yellow"
	icon_state = "road_stripe_y"

/obj/floor_decal/roads/minor
	name = "road triangles"
	icon_state = "road_minor"

/obj/floor_decal/roads/border
	name = "road border"
	icon_state = "road_border"

/obj/floor_decal/roads/border_corner
	name = "road border corner"
	icon_state = "road_corner"

/obj/floor_decal/roads/walk
	name = "road walk"
	icon_state = "road_walk"

/obj/floor_decal/roads/asphalt_angle
	name = "asphalt angle"
	icon_state = "road_angle"

/obj/floor_decal/roads/asphalt_circle
	name = "asphalt semi-circle"
	icon_state = "road_circle"

/obj/floor_decal/roads/ramps
	name = "ramptop"
	icon = 'mods/_fd/chem_furniture/icons/ramps.dmi'
	icon_state = "ramptop"

/obj/floor_decal/roads/ramps/bottom
	name = "rampbottom"
	icon_state = "rampbottom"

/obj/floor_decal/roads/ramps/brick
	name = "rampbrick"
	icon_state = "rampbrick"

/obj/structure/stairs/brick1
	icon = 'mods/_fd/chem_furniture/icons/64x64.dmi'
	icon_state = "stairs1"

/obj/structure/stairs/brick1/north
	dir = NORTH
	bound_height = 64
	bound_y = -32
	pixel_y = -32

/obj/structure/stairs/brick1/south
	dir = SOUTH
	bound_height = 64

/obj/structure/stairs/brick1/east
	dir = EAST
	bound_width = 64
	bound_x = -32
	pixel_x = -32

/obj/structure/stairs/brick1/west
	dir = WEST
	bound_width = 64

/obj/structure/stairs/brick2
	icon = 'mods/_fd/chem_furniture/icons/64x64.dmi'
	icon_state = "stairs2"

/obj/structure/stairs/brick2/north
	dir = NORTH
	bound_height = 64
	bound_y = -32
	pixel_y = -32

/obj/structure/stairs/brick2/south
	dir = SOUTH
	bound_height = 64

/obj/structure/stairs/brick2/east
	dir = EAST
	bound_width = 64
	bound_x = -32
	pixel_x = -32

/obj/structure/stairs/brick2/west
	dir = WEST
	bound_width = 64

/obj/structure/stairs/asphalt
	icon = 'mods/_fd/chem_furniture/icons/64x64.dmi'
	icon_state = "asphalt"

/obj/structure/stairs/asphalt/north
	dir = NORTH
	bound_height = 64
	bound_y = -32
	pixel_y = -32

/obj/structure/stairs/asphalt/south
	dir = SOUTH
	bound_height = 64

/obj/structure/stairs/asphalt/east
	dir = EAST
	bound_width = 64
	bound_x = -32
	pixel_x = -32

/obj/structure/stairs/asphalt/west
	dir = WEST
	bound_width = 64

/obj/structure/stairs/road
	icon = 'mods/_fd/chem_furniture/icons/64x64.dmi'
	icon_state = "road"

/obj/structure/stairs/road/north
	dir = NORTH
	bound_height = 64
	bound_y = -32
	pixel_y = -32

/obj/structure/stairs/road/south
	dir = SOUTH
	bound_height = 64

/obj/structure/stairs/road/east
	dir = EAST
	bound_width = 64
	bound_x = -32
	pixel_x = -32

/obj/structure/stairs/road/west
	dir = WEST
	bound_width = 64
