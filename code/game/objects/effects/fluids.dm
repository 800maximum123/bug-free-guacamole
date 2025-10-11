/obj/fluid
	name = ""
	icon = 'icons/effects/liquids.dmi'
	anchored = TRUE
	simulated = FALSE
	opacity = 0
	mouse_opacity = 0
	layer = FLY_LAYER
	alpha = 0
	color = COLOR_OCEAN

	var/fluid_amount = 0
	var/turf/start_loc
	var/list/equalizing_fluids = list()
	var/equalize_avg_depth = 0
	var/equalize_avg_temp = 0
	var/flow_amount = 0

	var/infinite_source = FALSE

/obj/fluid/ex_act()
	return

/obj/fluid/airlock_crush()
	qdel(src)

/obj/fluid/Initialize()
	. = ..()
	start_loc = get_turf(src)
	if(!start_loc || start_loc.flooded || start_loc.density)
		start_loc = null
		qdel(src)
		return
	var/turf/simulated/T = start_loc
	if(istype(T))
		T.unwet_floor(FALSE)
	forceMove(start_loc)
	queue_icon_update()

/obj/fluid/Destroy()
	if(start_loc)
		var/turf/simulated/T = start_loc
		if(istype(T))
			T.wet_floor()
		start_loc = null
	if(islist(equalizing_fluids))
		equalizing_fluids.Cut()
	REMOVE_ACTIVE_FLUID(src)
	. = ..()

/obj/fluid/on_update_icon()

	ClearOverlays()

	if(fluid_amount > FLUID_OVER_MOB_HEAD)
		layer = DEEP_FLUID_LAYER
	else
		layer = SHALLOW_FLUID_LAYER

	if(fluid_amount > FLUID_DEEP)
		alpha = FLUID_MAX_ALPHA
	else
		alpha = min(FLUID_MAX_ALPHA,max(FLUID_MIN_ALPHA,ceil(255*(fluid_amount/FLUID_DEEP))))

	if(fluid_amount > FLUID_DELETING && fluid_amount <= FLUID_EVAPORATION_POINT)
		APPLY_FLUID_OVERLAY("shallow_still")
	else if(fluid_amount > FLUID_EVAPORATION_POINT && fluid_amount < FLUID_SHALLOW)
		APPLY_FLUID_OVERLAY("mid_still")
	else if(fluid_amount >= FLUID_SHALLOW && fluid_amount < (FLUID_DEEP*2))
		APPLY_FLUID_OVERLAY("deep_still")
	else if(fluid_amount >= (FLUID_DEEP*2))
		APPLY_FLUID_OVERLAY("ocean")

/obj/screen/fullscreen/water
	icon_state = "fishbed"
	allstate = 1
	scale_to_view = TRUE
	alpha = 200

/obj/fluid/Crossed(mob/target)
    . = ..()
    if(isliving(target) && fluid_amount >= (target.lying?FLUID_SHALLOW:FLUID_DEEP))
        target.overlay_fullscreen("underwater", /obj/screen/fullscreen/water)

/obj/fluid/Uncrossed(mob/target)
    . = ..()
    if(istype(target))
        target.clear_fullscreen("underwater", animated = FALSE)

// Map helper.
/obj/fluid_mapped
	name = "mapped flooded area"
	alpha = 125
	icon_state = "shallow_still"
	color = COLOR_OCEAN

	var/fluid_amount = FLUID_MAX_DEPTH

/obj/fluid_mapped/Initialize()
	..()
	return INITIALIZE_HINT_LATELOAD

/obj/fluid_mapped/LateInitialize()
	var/turf/T = get_turf(src)
	for(var/atom/movable/object as anything in T)
		if(istype(object, /obj/structure/window) && object.dir == 5)
			return qdel(src)
		if(istype(object, /obj/machinery/door/airlock) && object.density)
			return qdel(src)
		if(istype(object, /obj/machinery/door/blast) && object.density)
			return qdel(src)
		if(istype(object, /obj/structure/inflatable) && object.density)
			return qdel(src)
	var/obj/fluid/F = locate() in T
	if(!F) F = new(T)
	SET_FLUID_DEPTH(F, fluid_amount)
	return qdel(src)

/obj/fluid_mapped/infinite
	name = "mapped flood source"
	icon_state = "ocean-bubbles"
	fluid_amount = FLUID_MAX_DEPTH

/obj/fluid_mapped/infinite/LateInitialize()
	var/turf/T = get_turf(src)
	for(var/atom/movable/object as anything in T)
		if(istype(object, /obj/structure/window) && object.dir == 5)
			return qdel(src)
		if(istype(object, /obj/machinery/door/airlock) && object.density)
			return qdel(src)
		if(istype(object, /obj/machinery/door/blast) && object.density)
			return qdel(src)
		if(istype(object, /obj/structure/inflatable) && object.density)
			return qdel(src)
	var/obj/fluid/F = locate() in T
	if(!F) F = new(T)
	F.infinite_source = TRUE
	SET_FLUID_DEPTH(F, fluid_amount)
	return qdel(src)

// Permaflood overlay.
/obj/flood
	name = ""
	mouse_opacity = 0
	layer = DEEP_FLUID_LAYER
	color = COLOR_OCEAN
	icon = 'icons/effects/liquids.dmi'
	icon_state = "ocean"
	alpha = FLUID_MAX_ALPHA
	simulated = FALSE
	density = FALSE
	opacity = 0
	anchored = TRUE

/obj/flood/ex_act()
	return

/obj/flood/New()
	..()
	verbs.Cut()
