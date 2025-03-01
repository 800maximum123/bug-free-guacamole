/obj/overmap/ai_holder
	name = "ai holder"
	desc = "THE FUCK YU'R LOOKING AT??? (Pls report to devs)"
	icon = 'mods/_fd/fd_assets/icons/overmap_eris.dmi'
	icon_state = "ring"
	scannable = FALSE
	requires_contact = FALSE
	//visible = FALSE
	//invisibility = 50

	var/obj/overmap/simulated_ship/linked_object = null
	var/datum/ship_characteristic/linked_object_settings = null

	var/list/detected_hostile_objects = list()
	var/list/detected_neutral_objects = list()
	var/list/detected_friendly_objects = list()
	var/obj/overmap/targeted_object = null
	var/obj/overmap/memorised_object = null // Used for follow-pattern
	var/list/memorised_path = null // For optimised A* path, updated each time target updates
	var/target_clear_timer = null
	var/targets_refresh_timer = null
	var/path_refresh_timer = null

	// Performance vars!!!
	var/target_forgeting_speed = 5 *(1 SECOND)
	var/target_refresh_timer_cooldown = 1.5 SECONDS
	var/path_refresh_timer_cooldown = 5 SECONDS
	var/path_refresh_distance = 3 // In tiles. If target has moved for more than this number of tiles then refresh A* path
	var/path_longrange_aim_distance = 10 // In tiles. If target LESS than this number of tiles away, refresh A* path each movement step for precise movement

/obj/overmap/ai_holder/Initialize()
	..()
	if(linked_object == null)
		var/turf/T = get_turf(src)
		for(var/obj/overmap/O in T)
			if(istype(O, /obj/overmap/simulated_ship))
				linked_object = O
				break
			//if(istype(O, /obj/overmap/visitable/ship))
			//	linked_object = O
			//	break
		if(linked_object == null)
			log_and_message_admins(SPAN_WARNING("<b> \[AI holder\] ИИ по координатам [x]-[y] не смог найти объект привязки!</i></b>"))
		else
			if(istype(linked_object, /obj/overmap/simulated_ship))
				log_and_message_admins(SPAN_WARNING("<b> \[AI holder\] ИИ по координатам [x]-[y] успешно был привязан к симулируемому объекту [linked_object.name]!</i></b>"))
			//if(istype(linked_object, /obj/overmap/visitable/ship))
			//	log_and_message_admins(SPAN_WARNING("<b> \[AI holder\] ИИ по координатам [x]-[y] успешно был привязан к реальному объекту!</i></b>"))
	target_clear_timer = addtimer(new Callback(src, PROC_REF(clear_target)), target_forgeting_speed, TIMER_LOOP | TIMER_STOPPABLE)
	targets_refresh_timer = addtimer(new Callback(src, PROC_REF(refresh_target)), target_refresh_timer_cooldown, TIMER_LOOP | TIMER_STOPPABLE)
	path_refresh_timer = addtimer(new Callback(src, PROC_REF(refresh_path)), path_refresh_timer_cooldown, TIMER_LOOP | TIMER_STOPPABLE)
	START_PROCESSING(SSobj, src)

/obj/overmap/ai_holder/Destroy()
	detected_hostile_objects.Cut()
	detected_neutral_objects.Cut()
	detected_friendly_objects.Cut()
	deltimer(target_clear_timer)
	deltimer(targets_refresh_timer)
	deltimer(path_refresh_timer)
	targeted_object = null
	memorised_object = null
	linked_object = null
	..()


/obj/overmap/ai_holder/Process()
	// If it wasn't connected - delete it
	if(linked_object == null)
		qdel(src)

	process_ship()
	//for(var/obj/O in detected_hostile_objects)
	//	log_and_message_admins(SPAN_WARNING("<b> [O]!</i></b>"))

	src.forceMove(linked_object.loc)

/obj/overmap/ai_holder/proc/process_ship()
	// wtf?
	if(!istype(linked_object, /obj/overmap/simulated_ship))
		return

	var/obj/overmap/simulated_ship/ship = linked_object
	linked_object_settings = ship.characteristic

	if(linked_object_settings == null)
		qdel(src)

	if(linked_object_settings.ai_enabled == FALSE)
		return

	//src.set_invisibility(50)

	switch(linked_object_settings.ai_mode)
		if(AI_MODE_DEFEND)
			log_and_message_admins("Думаю")
			if(targeted_object)
				log_and_message_admins("Найдена цель")

				if(linked_object_settings.ai_attack_enabled == TRUE)
					command_shoot()

				if(linked_object_settings.ai_move_enabled == TRUE)
					if(linked_object_settings.ai_flee_enabled == TRUE)
						if(linked_object_settings.health <= (linked_object_settings.max_health * 0.25))
							command_flee()

					if(get_dist(get_turf(linked_object), get_turf(targeted_object)) > linked_object_settings.max_targeted_distance_to_target)
						//if(get_dist(get_turf(linked_object), get_turf(targeted_object)) < path_longrange_aim)
						//	log_and_message_admins("Цель слишком далеко, перегенерирую путь")
						//	refresh_path()
						//else
						if(memorised_path)
							if(get_dist(get_turf(memorised_path[memorised_path.len]), get_turf(targeted_object)) > path_refresh_distance)
								refresh_path()
							command_move(use_astar_movement=TRUE)
						else
							command_move(use_astar_movement=FALSE)
					if(get_dist(get_turf(linked_object), get_turf(targeted_object)) < linked_object_settings.min_targeted_distance_to_target)
						command_flee()

		else
			log_and_message_admins(SPAN_WARNING("<b> \[AI holder\] ИИ по координатам [x]-[y] имеет неправильно заданный паттерн поведения!</i></b>"))

	return

/obj/overmap/ai_holder/proc/command_move(use_astar_movement)
	if(prob(100 - linked_object_settings.engine_damage))
		if(!use_astar_movement || memorised_path == null || memorised_path.len == 0)
			update_linked_ship_icon(moved=TRUE, dir=get_dir(linked_object.loc, targeted_object.loc))
			walk_towards(linked_object, targeted_object, linked_object_settings.max_speed, linked_object_settings.max_speed)
		else
			update_linked_ship_icon(moved=TRUE, dir=get_dir(linked_object.loc, locate(memorised_path[1])))
			walk_towards(linked_object, memorised_path[1], linked_object_settings.max_speed, linked_object_settings.max_speed)
			if(get_turf(linked_object) == memorised_path[1])
				memorised_path -= memorised_path[1]
	else
		update_linked_ship_icon(moved=FALSE)
		walk(linked_object, 0)


/obj/overmap/ai_holder/proc/command_flee()
	if(prob(100 - linked_object_settings.engine_damage))
		update_linked_ship_icon(moved=TRUE, dir=reverse_direction(get_dir(linked_object.loc, targeted_object.loc)))
		walk_away(linked_object, targeted_object, linked_object_settings.sensors_range, linked_object_settings.max_speed, linked_object_settings.max_speed)
	else
		walk(linked_object, 0)

/obj/overmap/ai_holder/proc/command_shoot()

	var/obj/item/projectile/bullet/huge_caliber/projectile_type = linked_object_settings.get_projectile_type(/obj/item/ammo_magazine/ammobox/hmg/high_explosive)
	var/obj/item/projectile/bullet/huge_caliber/pew = new projectile_type(linked_object.loc)
	pew.starting = linked_object.loc
	pew.origin = linked_object
	pew.cal_accuracy = 75
	pew.overmapdir = get_dir(linked_object, targeted_object)
	//pew.launch(get_step(linked_object.loc, get_dir(linked_object, targeted_object)), pick(BP_ALL_LIMBS))
	pew.entered_overmap = TRUE

	//var/obj/overmap/source = map_sectors["[z]"]
	pew.overmap_projectile = new /obj/overmap/projectile(null, linked_object.x, linked_object.y)
	pew.overmap_projectile.SetName("[linked_object.name+"'s"] [pew.name]")
	pew.overmap_projectile.set_projectile(pew, pew.cal_accuracy)

	//overmap_projectile.color = overmap_color

/obj/overmap/ai_holder/proc/update_linked_ship_icon(moved, dir)
	if(moved)
		linked_object.icon_state = linked_object.moving_state
		linked_object.dir = dir
	else
		linked_object.icon_state = initial(linked_object.icon_state)

/obj/overmap/ai_holder/proc/refresh_path()
	if(linked_object == null)
		return
	if(targeted_object == null)
		return
	//var/turf/obstacle = /turf/unsimulated/map/with_events
	memorised_path = AStar(
		start = linked_object.loc,\
		end = targeted_object.loc,\
		adjacent = TYPE_PROC_REF(/turf, AdjacentTurfsWithOvermap),\
		dist = TYPE_PROC_REF(/turf, Distance),\
		max_nodes = 20,\
		max_node_depth = 20,\
		min_target_dist = 1,\
		min_node_dist = 0)//,
		//id = null,
		//exclude = obstacle)
	if(memorised_path)
		// First var is always the src's position. We don't want that
		if(get_turf(linked_object) == memorised_path[1])
			memorised_path -= memorised_path[1]
	//memorised_path = reverselist(memorised_path)

/obj/overmap/ai_holder/proc/refresh_target()
	if(linked_object == null || linked_object_settings == null)
		return

	get_all_targets()

	if(detected_hostile_objects.len == 0)
		return

	targeted_object = choose_closest_target(detected_hostile_objects)
	refresh_path()

/obj/overmap/ai_holder/proc/clear_target()
	if(linked_object == null || linked_object_settings == null)
		return
	if(targeted_object == null)
		return
	if(get_dist(get_turf(linked_object), get_turf(targeted_object)) > linked_object_settings.sensors_range)
		targeted_object = null

/obj/overmap/ai_holder/proc/get_all_targets()
	detected_hostile_objects.Cut() //TODO, replace with macros?
	detected_neutral_objects.Cut() //TODO, same as above
	detected_friendly_objects.Cut() //TODO, same as above
	for(var/obj/overmap/O in range(linked_object, linked_object_settings.sensors_range))
		if(O == src)
			continue
		if(O == linked_object)
			continue
		if(istype(O, /obj/overmap/simulated_ship))
			var/obj/overmap/simulated_ship/detected_object = O
			var/datum/ship_characteristic/detected_object_settings = detected_object.characteristic

			if(detected_object_settings.team == linked_object_settings.team)
				detected_friendly_objects += O
			else if(
			linked_object_settings.team == AI_TEAM_FFA ||\
			linked_object_settings.team == AI_TEAM_ASCENTS && detected_object_settings.team == AI_TEAM_HUMANS\
			)
				detected_hostile_objects += O
			else
				detected_neutral_objects += O
		if(istype(O, /obj/overmap/visitable/ship))
			detected_hostile_objects += O

/obj/overmap/ai_holder/proc/choose_closest_target(list/object_list)
	if(linked_object == null)
		return null

	if(object_list.len == 0)
		return null

	var closest = object_list[1]
	for(var/obj/overmap/O in object_list)
		if(get_dist(get_turf(linked_object), get_turf(O)) < get_dist(get_turf(linked_object), get_turf(closest)))
			closest = O
	return closest


///obj/overmap/ai_holder/proc/is_target_valid(obj/overmap/visitable/O)
//	return ((O.sector_flags & OVERMAP_SECTOR_IN_SPACE) && !(O.sector_flags & OVERMAP_SECTOR_UNTARGETABLE) && LAZYLEN(O.map_z))

///turf/unsimulated/map


// God please I'm sorry
// Used for A*
/turf/unsimulated/map/with_events

//TODO: change this abomination to something more adequate, like checking objs of overmap events on tile
// Original from AdjacentTurfs
/turf/proc/AdjacentTurfsWithOvermap(check_blockage = TRUE)
	. = list()
	for(var/turf/t in (trange(1,src) - src))
		if(istype(t, /turf/unsimulated/map/with_events))
			continue
		if(check_blockage)
			if(!t.density)
				if(!LinkBlocked(src, t) && !TurfBlockedNonWindow(t))
					. += t
		else
			. += t

/obj/overmap/event/Initialize()
	. = ..()
	var/turf/T = get_turf(loc)
	T.ChangeTurf(/turf/unsimulated/map/with_events)

/obj/overmap/event/Move()
	var/turf/old_loc = loc
	. = ..()
	if(.)
		var/turf/T = get_turf(old_loc)
		T.ChangeTurf(/turf/unsimulated/map)
		T = get_turf(loc)
		T.ChangeTurf(/turf/unsimulated/map/with_events)

/obj/overmap/event/forceMove(atom/destination)
	var/old_loc = loc
	. = ..()
	if(.)
		var/turf/T = get_turf(old_loc)
		T.ChangeTurf(/turf/unsimulated/map)
		T = get_turf(loc)
		T.ChangeTurf(/turf/unsimulated/map/with_events)

/obj/overmap/event/Destroy()//takes a look at this one as well, make sure everything is A-OK
	var/turf/old_loc = loc
	. = ..()
	var/turf/T = get_turf(old_loc)
	T.ChangeTurf(/turf/unsimulated/map)
