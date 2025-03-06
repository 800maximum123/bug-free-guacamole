// God please I'm sorry
// Used for A*
/turf/unsimulated/map/blocked_for_astar

//TODO: change this abomination to something more adequate, like checking objs of overmap events on tile
// Original from AdjacentTurfs
/turf/proc/AdjacentTurfsWithOvermap(check_blockage = TRUE)
	. = list()
	for(var/turf/t in (trange(1,src) - src))
		if(istype(t, /turf/unsimulated/map/blocked_for_astar))
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
	T.ChangeTurf(/turf/unsimulated/map/blocked_for_astar)

/obj/overmap/event/Move()
	var/turf/old_loc = loc
	. = ..()
	if(.)
		var/turf/T = get_turf(old_loc)
		T.ChangeTurf(/turf/unsimulated/map)
		T = get_turf(loc)
		T.ChangeTurf(/turf/unsimulated/map/blocked_for_astar)

/obj/overmap/event/forceMove(atom/destination)
	var/old_loc = loc
	. = ..()
	if(.)
		var/turf/T = get_turf(old_loc)
		T.ChangeTurf(/turf/unsimulated/map)
		T = get_turf(loc)
		if(T)
			T.ChangeTurf(/turf/unsimulated/map/blocked_for_astar)

/obj/overmap/event/Destroy()
	var/turf/old_loc = loc
	. = ..()
	var/turf/T = get_turf(old_loc)
	T.ChangeTurf(/turf/unsimulated/map)




/obj/overmap/simulated_ship/Initialize()
	. = ..()
	var/turf/T = get_turf(loc)
	T.ChangeTurf(/turf/unsimulated/map/blocked_for_astar)

/obj/overmap/simulated_ship/Move()
	var/turf/old_loc = loc
	. = ..()
	if(.)
		var/turf/T = get_turf(old_loc)
		T.ChangeTurf(/turf/unsimulated/map)
		T = get_turf(loc)
		T.ChangeTurf(/turf/unsimulated/map/blocked_for_astar)

/obj/overmap/simulated_ship/forceMove(atom/destination)
	var/old_loc = loc
	. = ..()
	if(.)
		var/turf/T = get_turf(old_loc)
		T.ChangeTurf(/turf/unsimulated/map)
		T = get_turf(loc)
		if(T)
			T.ChangeTurf(/turf/unsimulated/map/blocked_for_astar)

/obj/overmap/simulated_ship/Destroy()
	var/turf/old_loc = loc
	. = ..()
	var/turf/T = get_turf(old_loc)
	T.ChangeTurf(/turf/unsimulated/map)
