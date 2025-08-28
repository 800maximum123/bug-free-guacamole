/datum/mech_ability/action/bunker
	name = "Оборонительный Режим Вкл/Выкл"
	action_state = "bunker"
	cooldown = 6 SECONDS

	var/list/shielded_turfs = list()
	var/list/shielded_mechs = list()
	var/in_bunker = FALSE

	var/zonestart_by_x = 3 // Стандартные значения, меняются в зависимости от дира
	var/zonestart_by_y = 3 // Стандартные значения, меняются в зависимости от дира
	var/zoneend_by_x = 3 // Стандартные значения, меняются в зависимости от дира
	var/zoneend_by_y = 3 // Стандартные значения, меняются в зависимости от дира

/datum/mech_ability/action/bunker/proc/check_direction(dir)
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

/datum/mech_ability/action/bunker/use(atom/target, params)
	. = ..()
	if(!.)
		return

	var/current_direction = owner.dir

	in_bunker = !in_bunker
	to_chat(owner, SPAN_NOTICE("Ты [in_bunker ? "разложил" : "втянул"] пластины своего мобильного бункера."))


	if(in_bunker)

		check_direction(current_direction)

		animate(owner, time = 2 SECONDS, transform = matrix(30, MATRIX_ROTATE), easing = SINE_EASING, flags = ANIMATION_PARALLEL)
		spawn(2 SECONDS)
			playsound(get_turf(owner),'packs/infinity/sound/mecha/bigmech_rstep.ogg',100)
			animate(owner, time = 0.5 SECONDS, transform = matrix(), easing = ELASTIC_EASING)

		spawn(3 SECONDS)
			animate(owner, time = 2 SECONDS, transform = matrix(-30, MATRIX_ROTATE), easing = SINE_EASING, flags = ANIMATION_PARALLEL)
		spawn(5 SECONDS)
			animate(owner, time = 0.5 SECONDS, transform = matrix(), easing = ELASTIC_EASING)
			playsound(get_turf(owner),'packs/infinity/sound/mecha/bigmech_lstep.ogg',100)

		spawn(1 SECONDS)
			owner.add_filter("bunker", 1, list("type" = "outline", , "size" = 0, "color" = COLOR_BLACK))
			animate(owner.get_filter("bunker"), time = 1 SECONDS, size = 2, easing = SINE_EASING, flags = ANIMATION_PARALLEL)

			for(var/turf/floor in block(owner.x-zonestart_by_x, owner.y-zonestart_by_y, owner.z, owner.x+zoneend_by_x, owner.y+zoneend_by_y, owner.z))
				shielded_turfs[floor] = floor.color
				animate(floor, time = 1 SECONDS, color = COLOR_DARK_GRAY, easing = SINE_EASING, flags = ANIMATION_PARALLEL)
		owner.armor_stat += 10
		owner.AdjustEffect(MECH_CHAINED, 1 DAYS)

	else

		playsound(get_turf(owner),'packs/infinity/sound/mecha/bigmech_rturn.ogg',100)
		animate(owner.get_filter("bunker"), time = 1.5 SECONDS, size = 0, easing = SINE_EASING, flags = ANIMATION_PARALLEL)
		for(var/turf/floor in shielded_turfs.Copy())
			animate(floor, time = 1.5 SECONDS, color = shielded_turfs[floor], easing = SINE_EASING, flags = ANIMATION_PARALLEL)
		shielded_turfs.Cut()
		owner.armor_stat -= 10
		owner.AdjustEffect(MECH_CHAINED, -1 DAYS)

		zonestart_by_x = initial(zonestart_by_x)
		zonestart_by_y = initial(zonestart_by_y)
		zoneend_by_x = initial(zoneend_by_x)
		zoneend_by_y = initial(zoneend_by_y)

	return .

/datum/mech_ability/action/bunker/Process()
	. = ..()

	for(var/mob/living/simple_animal/fd/lancer/L in shielded_mechs)
		L.protected_by = null

	shielded_mechs.Cut()

	for(var/turf/F as anything in shielded_turfs)
		for(var/mob/living/simple_animal/fd/lancer/L as anything in F)
			if(L in shielded_mechs)
				continue
			if(L == owner)
				continue
			shielded_mechs += L

	for(var/mob/living/simple_animal/fd/lancer/L in shielded_mechs)
		if(isnull(L.protected_by))
			L.protected_by = owner
