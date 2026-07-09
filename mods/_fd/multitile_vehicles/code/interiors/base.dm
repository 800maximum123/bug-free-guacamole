GLOBAL_LIST_EMPTY(vehicle_interiors)
GLOBAL_LIST_EMPTY(templates_cache)

/datum/vehicle_interior
	var/id
	var/global/gid = 0

	//11 at max
	var/size_x = 0
	var/size_y = 0

	var/list/mob/living/carbon/human/occupants
	var/obj/effect/vehicle_entrance/entrance
	var/obj/effect/vehicle_entrance_driver/driver_entrance
	var/obj/vehicles/large/vehicle
	var/turf/middle_turf
	var/area/area

/datum/vehicle_interior/New(datum/map_template/interior_template, new_vehicle)
	if(!(interior_template in GLOB.templates_cache))
		GLOB.templates_cache[interior_template] = new interior_template

	interior_template = GLOB.templates_cache[interior_template]

	load_map(interior_template, new_vehicle)

/datum/vehicle_interior/proc/load_map(datum/map_template/interior_template, new_vehicle)
	set waitfor = FALSE
	var/list/interior_levels = GLOB.using_map.escape_levels // Transit levels
	LAZYLEN(interior_levels) || interior_levels.Add(7) // Sierra transit z is 7, not listed in escape_levels for some reason
	var/start = locate(TRANSITIONEDGE+1, TRANSITIONEDGE+1, min(interior_levels))
	var/finish = locate(world.maxx-TRANSITIONEDGE-1, world.maxy-TRANSITIONEDGE-1, max(interior_levels))
	for(var/turf/space/T in block(start, finish))
		var/valid = TRUE
		for(var/turf/check in interior_template.get_affected_turfs(T))
			if(!istype(check, /turf/space))
				valid = FALSE
				break
		if(valid)
			interior_template.load(T)
			middle_turf = locate(T.x + round(interior_template.width / 2), T.y + round(interior_template.height / 2), T.z)
			area = get_area(middle_turf)
			break
	if(!area)
		CRASH("Failed to load interior")

	id = gid++

	for(var/obj/effect/vehicle_entrance/E in area)
		entrance = E
		entrance.id = id
		break

	for(var/obj/structure/vehicledoor_driver/E in area)
		E.id = id
		E.interior = src
		E.vehicle = new_vehicle

	for(var/obj/effect/vehicle_entrance_driver/E in area)
		driver_entrance = E
		driver_entrance.id = id
		break

	for(var/obj/structure/vehicledoor/E in area)
		E.id = id
		E.interior = src
		E.vehicle = new_vehicle

	for(var/obj/structure/vehiclewindow/W in area)
		W.vehicle = new_vehicle

	vehicle = new_vehicle
	if(!vehicle)
		return

	GLOB.vehicle_interiors += src

/obj/vehicles/large
	var/datum/vehicle_interior/interior = null
	var/size_x = 0
	var/size_y = 0
	var/datum/map_template/interior_template = /datum/map_template

/obj/vehicles/large/get_all_positions()
	return ..() + list(VP_INTERIOR)

/obj/vehicles/large/Initialize()
	. = ..()
	interior = new(interior_template, src)

/obj/vehicles/large/proc/move_to_interior(mob/user, puller)
	var/is_driver = FALSE
	if(user in get_occupants_in_position(VP_DRIVER) && !interior.driver_entrance)
		to_chat(user, SPAN_WARNING("The [src]'s cockpit doesn't have a way into interiors!"))
		return
	else if(user in get_occupants_in_position(VP_DRIVER))
		is_driver = TRUE

	if(user == puller)
		visible_message(SPAN_NOTICE("[user] enters the interior of [src]."))
	else
		visible_message(SPAN_NOTICE("[puller] puts [user] into interior of \the [src]."))
	to_chat(user, SPAN_NOTICE("You are now in the interior of [src]."))
	playsound(src, 'mods/_fd/multitile_vehicles/sounds/enter.ogg', 50, TRUE)

	if(!interior?.entrance)
		to_chat(user, SPAN_OCCULT("or not."))
		return

	if(is_driver)
		user.forceMove(get_turf(interior.driver_entrance))
	else
		user.forceMove(get_turf(interior.entrance))
	occupants[user] = VP_INTERIOR
	user.reset_view()

	return TRUE

/obj/vehicles/large/proc/move_object_to_interior(obj/object, puller)
	if(isturf(object) || object.anchored || !interior?.entrance)
		to_chat(puller, SPAN_NOTICE("You can't pull [object]"))
		return FALSE

	visible_message(SPAN_NOTICE("[puller] puts [object] into interior of \the [src]."))
	object.forceMove(get_turf(interior.entrance))

	return TRUE

/obj/vehicles/large/proc/look_in_interior(mob/user)
	if(!interior || !user.client || !interior.driver_entrance)
		to_chat(user, SPAN_INFO("You can't look inside the interior of [src]."))
		return

	if(user.client.eye == interior.driver_entrance)
		user.reset_view()
		to_chat(user, SPAN_INFO("You stop looking inside the interior."))
		return
	to_chat(user, SPAN_INFO("You look inside the interior..."))
	user.client.perspective = EYE_PERSPECTIVE
	user.client.eye = interior.driver_entrance

/obj/vehicles/large/enter_as_position(user, position, mob/puller)
	if(!check_entering(user, position))
		return FALSE

	if(position == VP_INTERIOR)
		if(!ismob(user))
			return move_object_to_interior(user, puller)
		return move_to_interior(user, puller)
	return ..()

/obj/vehicles/large/on_death()
	. = ..()
	cell_explosion(interior.middle_turf, 200, 50, shrapnel = FALSE)
	for(var/mob/victim in get_occupants_in_position(VP_INTERIOR))
		to_chat(victim, SPAN_DANGER("All of the interior gets engulfed in the flames as \the [src] breaks down!"))
	for(var/turf/tile in interior.area)
		tile.IgniteTurf(20, COLOR_YELLOW)

// Fluff wall
/obj/structure/vehiclewall
	name = "vehicle wall"
	icon = 'mods/_fd/multitile_vehicles/icons/walls.dmi'
	icon_state = "noborder"

	layer = ABOVE_HUMAN_LAYER

	density = TRUE
	opacity = TRUE
	fragile = FALSE
	anchored = TRUE

// DOORS
/obj/structure/vehicledoor
	name = "vehicle door"
	desc = "A door to get in and out of the vehicle. Use key to unlock or lock. Use crowbar to pry open."
	icon = 'mods/_fd/multitile_vehicles/icons/walls.dmi'
	icon_state = "ambulancedoor"

	layer = ABOVE_HUMAN_LAYER

	density = TRUE
	opacity = TRUE
	anchored = TRUE

	var/id
	var/datum/vehicle_interior/interior = null
	var/obj/vehicles/large/vehicle = null

	atmos_canpass = CANPASS_DENSITY

/obj/structure/vehicledoor/Move()
	return

/obj/structure/vehicledoor/forceMove(atom/dest)
	return

/obj/structure/vehicledoor/LateExamine(mob/user, distance, is_adjacent)
	. = ..()
	if(vehicle.block_enter_exit)
		to_chat(user, SPAN_WARNING("\The [src] is locked."))
	else
		to_chat(user, SPAN_NOTICE("\The [src] is unlocked."))

/obj/structure/vehicledoor/use_tool(obj/item/tool, mob/living/user, list/click_params)
	. = ..()
	if(istype(tool, /obj/item/key/car))
		vehicle.attack_key(tool, user)
		return
	if(istype(tool, /obj/item/crowbar))
		if(!vehicle.block_enter_exit)
			return
		user.visible_message(
			SPAN_WARNING("\The [user] wedges \the [tool] into \the [src] and starts forcing it open!"),
			SPAN_DANGER("You start forcing \the [src] open."),
			SPAN_WARNING("You hear metal groaning and grinding!")
		)
		playsound(loc, 'sound/machines/airlock_creaking.ogg', 100, TRUE)
		if(!do_after(user, (tool.toolspeed * 3) SECONDS, src, DO_REPAIR_CONSTRUCT))
			to_chat(user, SPAN_WARNING("You have been interrupted!"))
			return
		vehicle.block_enter_exit = FALSE
		visible_message(SPAN_NOTICE("[user] pries open \the [src]."))

/obj/structure/vehicledoor/attack_hand(mob/user)
	. = ..()
	if(vehicle.doors_locked() || vehicle.loc == null)
		to_chat(user, SPAN_WARNING("\The [src] is locked."))
		return FALSE
	vehicle.exit_vehicle(user)

/obj/structure/vehicledoor/MouseDrop_T(mob/target, mob/user)
	. = ..()
	if(vehicle.doors_locked() || vehicle.loc == null)
		to_chat(user, SPAN_WARNING("\The [src] is locked."))
		return FALSE
	if(ismob(target))
		vehicle.exit_vehicle(target, ignore_incap_check = TRUE, puller = user)
	else
		target.forceMove(vehicle.pick_valid_exit_loc())

/obj/effect/vehicle_entrance
	alpha = 0
	var/id

// DOORS TO THE DRIVER CABIN
/obj/structure/vehicledoor_driver
	name = "driver vehicle door"
	desc = "A door to the driver's cabin. Use key to unlock or lock. Use crowbar to pry open."
	icon = 'icons/obj/doors/station/door.dmi'
	icon_state = "preview"

	layer = ABOVE_HUMAN_LAYER

	density = TRUE
	opacity = TRUE
	anchored = TRUE

	var/id
	var/datum/vehicle_interior/interior = null
	var/obj/vehicles/large/vehicle = null

	atmos_canpass = CANPASS_DENSITY

/obj/structure/vehicledoor_driver/Move()
	return

/obj/structure/vehicledoor_driver/forceMove(atom/dest)
	return

/obj/structure/vehicledoor_driver/LateExamine(mob/user, distance, is_adjacent)
	. = ..()
	if(vehicle.block_enter_exit)
		to_chat(user, SPAN_WARNING("\The [src] is locked."))
	else
		to_chat(user, SPAN_NOTICE("\The [src] is unlocked."))
	if(length(vehicle.get_occupants_in_position(VP_DRIVER)) > 0)
		to_chat(user, SPAN_NOTICE("There is a driver in the cabin."))
	else
		to_chat(user, SPAN_NOTICE("The driver's cabin is empty."))

/obj/structure/vehicledoor_driver/use_tool(obj/item/tool, mob/living/user, list/click_params)
	. = ..()
	if(istype(tool, /obj/item/key/car))
		vehicle.attack_key(tool, user)
		return
	if(istype(tool, /obj/item/crowbar))
		if(!vehicle.block_enter_exit)
			return
		user.visible_message(
			SPAN_WARNING("\The [user] wedges \the [tool] into \the [src] and starts forcing it open!"),
			SPAN_DANGER("You start forcing \the [src] open."),
			SPAN_WARNING("You hear metal groaning and grinding!")
		)
		playsound(loc, 'sound/machines/airlock_creaking.ogg', 100, TRUE)
		if(!do_after(user, (tool.toolspeed * 3) SECONDS, src, DO_REPAIR_CONSTRUCT))
			to_chat(user, SPAN_WARNING("You have been interrupted!"))
			return
		vehicle.block_enter_exit = FALSE
		visible_message(SPAN_NOTICE("[user] pries open \the [src]."))

/obj/structure/vehicledoor_driver/attack_hand(mob/user)
	. = ..()
	if(vehicle.doors_locked() || vehicle.loc == null)
		to_chat(user, SPAN_WARNING("\The [src] is locked."))
		return

	if(length(vehicle.get_occupants_in_position(VP_DRIVER)) > 0)
		vehicle.do_seat_switch(user, VP_DRIVER)
//		to_chat(user, "The driver's cabin is occupied.")
		return

	vehicle.enter_as_position(user, VP_DRIVER, user)

/obj/effect/vehicle_entrance_driver
	alpha = 0
	var/id

// YOU CLICK ON IT AND SEE THE OUTSIDE WOW
/obj/structure/vehiclewindow
	name = "vehicle window"
	desc = "A window to know where the hell we are going."
	icon = 'mods/_fd/multitile_vehicles/icons/windows.dmi'
	icon_state = "apc_window"

	layer = ABOVE_HUMAN_LAYER

	density = FALSE
	anchored = TRUE

	var/obj/vehicles/large/vehicle = null
	var/datum/action/vehicle_action/stop_verb = null

/obj/structure/vehiclewindow/Initialize()
	. = ..()
	stop_verb = list(new /datum/action/vehicle_action/stop_looking_outside(src))

/obj/structure/vehiclewindow/attack_hand(mob/user)
	. = ..()
	look_outside(user)

/obj/structure/vehiclewindow/examine(mob/user)
	. = ..()
	look_outside(user)

/obj/structure/vehiclewindow/proc/look_outside(mob/user)
	if(!vehicle || !user.client || !stop_verb || !istype(user, /mob/living))
		return

	visible_message(SPAN_NOTICE("[user] looks outside the window of [src]."))
	to_chat(user, SPAN_INFO("You look outside the window..."))
	user.client.perspective = EYE_PERSPECTIVE
	user.client.eye = vehicle
	stop_verb.Grant(user)
	//TODO: Make this use not this timer and actually make the verb work
	sleep(5 SECONDS)
	stop_looking_outside(user)

/obj/structure/vehiclewindow/proc/stop_looking_outside(mob/user)
	to_chat(user, SPAN_INFO("You stop looking outside the window."))
	user.reset_view()
	stop_verb.Remove(user)

/obj/structure/vehicledoor/airlock
	icon = 'icons/obj/doors/station/door.dmi'
	icon_state = "preview"

/area/interior
	name = "vehicle interior"
	dynamic_lighting = 1
	requires_power = 0
	forced_ambience = list('mods/_fd/multitile_vehicles/sounds/working.ogg')
	ambience = null
	sound_env = SMALL_ENCLOSED
	base_turf = /turf/simulated/floor/plating

/area/interiors_spawn
	name = "interiors spawn"
