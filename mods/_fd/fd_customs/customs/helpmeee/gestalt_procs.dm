/obj/effect/gestalt_targeting
	name = "cracks"
	desc = "cracks"
	icon = 'mods/_fd/fd_customs/customs/helpmeee/gestalt_structures.dmi'
	icon_state = "cracks_dark"

/obj/effect/gestalt_spike
	name = "spike"
	desc = "spike"
	icon = 'mods/_fd/fd_customs/customs/helpmeee/gestalt_structures.dmi'
	icon_state = "vinespike"
	pixel_y = 16

/obj/structure/gestalt_prison
	name = "vines"
	desc = "Very strong vines!"
	icon = 'mods/_fd/fd_customs/customs/helpmeee/gestalt_structures.dmi'
	icon_state = "vinehedge"
	layer = ABOVE_HUMAN_LAYER
	anchored = TRUE
	density = TRUE

	health_max = 100
	health_min_damage = 10

/obj/structure/gestalt_prison/ex_act(severity)
	switch(severity)
		if(EX_ACT_DEVASTATING)
			qdel(src)
			return
		if(EX_ACT_HEAVY)
			if (prob(50))
				qdel(src)
				return
		if(EX_ACT_LIGHT)
			if (prob(5))
				qdel(src)
				return

/obj/structure/gestalt_prison/Destroy()
	for(var/mob/living/actual_target in loc)
		actual_target.stunned = 0
	. = ..()

/obj/structure/gestalt_wall
	name = "vines"
	desc = "Very strong vines!"
	icon = 'mods/_fd/fd_customs/customs/helpmeee/gestalt_structures.dmi'
	icon_state = "thornbush_lowering"
	layer = ABOVE_HUMAN_LAYER
	anchored = TRUE
	density = TRUE

	atmos_canpass = CANPASS_PROC
	var/airtight = TRUE

	health_max = 300
	health_min_damage = 10

/obj/structure/gestalt_wall/Initialize()
	. = ..()
	become_airtight()
	update_nearby_tiles()

/obj/structure/gestalt_wall/proc/clear_airtight()
	airtight = FALSE
	var/turf/simulated/floor/T = get_turf(loc)
	if (istype(T))
		update_nearby_tiles()

/obj/structure/gestalt_wall/proc/become_airtight()
	airtight = TRUE
	var/turf/simulated/floor/T = get_turf(loc)
	if (istype(T))
		update_nearby_tiles()

/obj/structure/gestalt_wall/Destroy()
	if (airtight)
		clear_airtight()
	. = ..()

/obj/structure/gestalt_wall/c_airblock()
	if (airtight == TRUE)
		return AIR_BLOCKED
	return FALSE

/obj/structure/gestalt_wall/ex_act(severity)
	switch(severity)
		if(EX_ACT_DEVASTATING)
			qdel(src)
			return
		if(EX_ACT_HEAVY)
			if (prob(50))
				qdel(src)
				return
		if(EX_ACT_LIGHT)
			if (prob(5))
				qdel(src)
				return

/turf/simulated/floor/proc/gestalt_imprisoned()
	var/obj/effect/gestalt_targeting/targeting = new /obj/effect/gestalt_targeting(get_turf(src))
	spawn(1 SECOND)
		animate(targeting, 1 SECOND, alpha = 0)
		new /obj/structure/gestalt_prison(get_turf(src))
		for(var/mob/living/actual_target in get_turf(src))
			actual_target.anchored = TRUE
	spawn(3 SECONDS)
		qdel(targeting)

/turf/simulated/floor/proc/gestalt_free()
	for(var/obj/structure/gestalt_prison/prison in get_turf(src))
		animate(prison, 1 SECOND, alpha = 0)
		spawn(1 SECOND)
			qdel(prison)
	for(var/mob/living/actual_target in get_turf(src))
		actual_target.anchored = FALSE

/turf/proc/gestalt_shield()
	for(var/turf/zone in range(1,src))
		new /obj/structure/gestalt_wall(zone)

/turf/simulated/floor/proc/gestalt_attack()
	var/obj/effect/gestalt_targeting/targeting = new /obj/effect/gestalt_targeting(get_turf(src))
	spawn(1 SECOND)
		animate(targeting, 1 SECOND, alpha = 0)
		new /obj/effect/gestalt_spike(get_turf(src))
		for(var/mob/living/actual_target in get_turf(src))
			actual_target.adjustBruteLoss(rand(30,40))
	spawn(3 SECONDS)
		qdel(targeting)
		for(var/obj/effect/gestalt_spike/spike in get_turf(src))
			animate(spike, 1 SECOND, alpha = 0)
			spawn(1 SECOND)
				qdel(spike)
