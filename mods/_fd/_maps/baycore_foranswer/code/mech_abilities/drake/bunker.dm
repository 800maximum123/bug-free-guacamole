/datum/mech_ability/action/drake/bunker
	name = "Оборонительный режим"
	action_state = "18"
	cooldown = 5 SECONDS

	var/list/shielded_turfs = list()
	var/list/shielded_mechs = list()
	var/in_bunker = FALSE

	var/zonestart_by_x = 3 // Стандартные значения, меняются в зависимости от дира
	var/zonestart_by_y = 3 // Стандартные значения, меняются в зависимости от дира
	var/zoneend_by_x = 3 // Стандартные значения, меняются в зависимости от дира
	var/zoneend_by_y = 3 // Стандартные значения, меняются в зависимости от дира

/datum/mech_ability/action/drake/bunker/proc/check_direction(dir)
	switch(dir)
		if(NORTH)
			zonestart_by_y += 2
			zoneend_by_y -= 2
			zoneend_by_x -= 1
			zonestart_by_x -= 1
		if(SOUTH)
			zoneend_by_y += 2
			zonestart_by_y -= 2
			zoneend_by_x -= 1
			zonestart_by_x -= 1
		if(WEST)
			zoneend_by_x += 2
			zonestart_by_x -= 2
			zonestart_by_y -= 1
			zoneend_by_y -= 1
		if(EAST)
			zonestart_by_x += 2
			zoneend_by_x -= 2
			zonestart_by_y -= 1
			zoneend_by_y -= 1

/datum/mech_ability/action/drake/bunker/use(atom/target, params)
	. = ..()

	var/pixel_y_adjust = owner.pixel_y + 10
	var/current_direction = owner.dir

	in_bunker = !in_bunker
	to_chat(owner, SPAN_NOTICE("Ты [in_bunker ? "разложил" : "втянул"] пластины своего мобильного бункера."))


	if(in_bunker)

		check_direction(current_direction)

		playsound(get_turf(owner),'packs/infinity/sound/mecha/bigmech_rstep.ogg',100)
		animate(owner, pixel_y = pixel_y_adjust, time = 0.5 SECONDS, easing = LINEAR_EASING | EASE_IN, flags = ANIMATION_PARALLEL)
		spawn(0.5 SECONDS)
			animate(owner, pixel_y = owner.default_pixel_y, time = 0.2 SECONDS, easing = ELASTIC_EASING)

		spawn(1 SECONDS)
			owner.add_filter("bunker", 1, list("type" = "outline", , "size" = 0, "color" = COLOR_BLACK))
			animate(owner.get_filter("bunker"), time = 1 SECONDS, size = 2, easing = SINE_EASING, flags = ANIMATION_PARALLEL)

			for(var/turf/floor in block(owner.x-zonestart_by_x, owner.y-zonestart_by_y, owner.z, owner.x+zoneend_by_x, owner.y+zoneend_by_y, owner.z))
				shielded_turfs[floor] = floor.color
				animate(floor, time = 1 SECONDS, color = COLOR_DARK_GRAY, easing = SINE_EASING, flags = ANIMATION_PARALLEL)
		owner.armor_stat += 10
		owner.chained = TRUE
		owner.chained_for = world.time + 3 DAYS // ВОТ ПОЧЕМУ НАМ НУЖЕН БЫЛ CAN_MOVE
		START_PROCESSING(SSprocessing, src)

	else

		playsound(get_turf(owner),'packs/infinity/sound/mecha/bigmech_rturn.ogg',100)
		animate(owner.get_filter("bunker"), time = 1.5 SECONDS, size = 0, easing = SINE_EASING, flags = ANIMATION_PARALLEL)
		for(var/turf/floor in shielded_turfs.Copy())
			animate(floor, time = 1.5 SECONDS, color = shielded_turfs[floor], easing = SINE_EASING, flags = ANIMATION_PARALLEL)
		shielded_turfs.Cut()
		owner.armor_stat -= 10
		owner.chained = FALSE
		STOP_PROCESSING(SSprocessing, src)

		zonestart_by_x = initial(zonestart_by_x)
		zonestart_by_y = initial(zonestart_by_y)
		zoneend_by_x = initial(zoneend_by_x)
		zoneend_by_y = initial(zoneend_by_y)

	return handle_use(target, params)

/datum/mech_ability/action/drake/bunker/Process()
	..()

	for(var/mob/living/simple_animal/hostile/fd/lancer/L in shielded_mechs)
		L.protected_by = null

	shielded_mechs.Cut()

	for(var/turf/F as anything in shielded_turfs)
		for(var/mob/living/simple_animal/hostile/fd/lancer/L as anything in F)
			if(L in shielded_mechs)
				continue
			if(L == owner)
				continue
			shielded_mechs += L

	for(var/mob/living/simple_animal/hostile/fd/lancer/L in shielded_mechs)
		if(isnull(L.protected_by))
			L.protected_by = owner

	return TRUE
