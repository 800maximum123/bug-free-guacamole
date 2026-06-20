/obj/effect/gestalt_targeting
	name = "cracks"
	desc = "cracks"
	icon = 'mods/_fd/fd_customs/customs/helpmeee/gestalt_structures.dmi'
	icon_state = "cracks_dark"

	layer = 4.10

/obj/effect/gestalt_spike
	name = "spike"
	desc = "spike"
	icon = 'mods/_fd/fd_customs/customs/helpmeee/gestalt_structures.dmi'
	icon_state = "vinespike"

	layer = 4.10

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
			if(actual_target.simple_combat_on)
				actual_target.simple_health_calculation(20,10,1,0)
			else
				actual_target.adjustBruteLoss(rand(30,40))
	spawn(3 SECONDS)
		qdel(targeting)
		for(var/obj/effect/gestalt_spike/spike in get_turf(src))
			animate(spike, 1 SECOND, alpha = 0)
			spawn(1 SECOND)
				qdel(spike)

#define CATEGORY_FD_KAIJU "FINAL DESTINATION: KAIJU"

/datum/keybinding/living/fd/kaiju_meat
	category = CATEGORY_FD_KAIJU

/datum/keybinding/living/fd/kaiju_meat/can_use(client/user)
	. = ..()

	var/mob/living/carbon/human/L = user.mob
	if(!L.is_species(SPECIES_DIONA))
		return FALSE
	if(!L.kaiju)
		return FALSE

/datum/keybinding/living/fd/kaiju_meat/circle_attack
	hotkey_keys = list("O")
	name = "circle_attack"
	full_name = "KAIJU: Circle Attack"
	description = ""

/datum/keybinding/living/fd/kaiju_meat/circle_attack/down(client/user)
	var/mob/living/L = user.mob
	var/list/affected_turfs = list()

	for(var/turf/floor in block(L.x-2, L.y-2, L.z, L.x+2, L.y+2, L.z))
		affected_turfs[floor] = floor.color
		animate(floor, time = 1 SECONDS, color = COLOR_RED, easing = CUBIC_EASING | EASE_OUT, flags = ANIMATION_PARALLEL)

	sleep(0.5 SECONDS)
	for(var/turf/floor in affected_turfs.Copy())
		animate(floor, time = 0.2 SECONDS, color = affected_turfs[floor], easing = SINE_EASING | EASE_IN, flags = ANIMATION_PARALLEL)
		for(var/mob/living/friends in floor)
			if(friends == L)
				continue
			if(friends.faction == L.faction)
				friends.throw_at(get_edge_target_turf(friends, get_dir(L, friends)), 6, 1, L, spin = FALSE)

		if(!(L in floor))
			new /obj/effect/gestalt_spike/auto_del(floor)
		for(var/mob/living/victim in floor)
			if(victim == L)
				continue
			victim.simple_health_calculation(40,10,1,0)

	affected_turfs.Cut()
	return TRUE

/datum/keybinding/living/fd/kaiju_meat/front_attack
	hotkey_keys = list("P")
	name = "front_attack"
	full_name = "KAIJU: FRONT Attack"
	description = ""

/datum/keybinding/living/fd/kaiju_meat/front_attack/down(client/user)
	var/mob/living/L = user.mob
	var/front_size = 10
	var/right_size = 1
	var/left_size = 1
	var/back_size = 0

	var/sx
	var/sy
	var/ex
	var/ey

	switch(L.dir)
		if(NORTH)
			sy = back_size
			ey = front_size
			ex = right_size
			sx = left_size
		if(SOUTH)
			ey = back_size
			sy = front_size
			ex = left_size
			sx = right_size
		if(WEST)
			ex = back_size
			sx = front_size
			sy = right_size
			ey = left_size
		if(EAST)
			sx = back_size
			ex = front_size
			sy = right_size
			ey = left_size

	for(var/turf/T in block(L.x-sx, L.y-sy, L.z, L.x+ex, L.y+ey, L.z))
		new /obj/effect/danger_area(T, COLOR_RED, 1 SECOND)

		spawn(1 SECOND)
			for(var/mob/living/friends in T)
				if(friends == L)
					continue
				if(friends.faction == L.faction)
					friends.throw_at(get_edge_target_turf(friends, get_dir(L, friends)), 6, 1, L, spin = FALSE)
			if(!(L in T))
				new /obj/effect/gestalt_spike/auto_del(T)
			for(var/mob/living/victims in T)
				if(victims == L)
					continue
				victims.simple_health_calculation(40,10,1,0)

/obj/effect/gestalt_spike/auto_del
	layer = 4.13

/obj/effect/gestalt_spike/auto_del/Initialize()
	. = ..()
	SetTransform(1.5)
	animate(src, pixel_y = 10, time = 5, easing = SINE_EASING|EASE_IN)
	animate(src, pixel_y = 0, time = 3, easing = SINE_EASING|EASE_OUT)

	QDEL_IN(src, 3 SECONDS)

/obj/effect/gestalt_spike/auto_del/Destroy()
	animate(src, 1 SECOND, alpha = 0)
	. = ..()

/obj/screen/big_form_timer
	var/obj/structure/fd/bunker/gate/connected_gate
	maptext_width = 280
	maptext_height = 280
	screen_loc = "CENTER,CENTER+5"

	icon = null
	icon_state = null

/obj/screen/big_form_timer/Initialize()
	. = ..()
	SetTransform(2)

/obj/screen/big_form_timer/proc/show_screentext(message = {"test"})
	maptext = STYLE_SMALLFONTS_OUTLINE("[message]", 7, COLOR_WHITE, COLOR_BLACK)

/obj/screen/big_form_timer/proc/reset_screentext()
	maptext = ""

/mob/living
	var/kaiju = FALSE

/mob/living/carbon/human
	var/obj/screen/big_form_timer/kaiju_timer

	var/kaiju_timeframe = 1000
	var/kaiju_timeframe_current = 1000
	var/list/mob/living/carbon/alien/diona/kaiju_followers = list()

/mob/living/carbon/human/Life()
	if(kaiju_timer && !(kaiju_timer in client.screen))
		client.screen += kaiju_timer

	if(kaiju)
		layer = 4.12
		pixel_y = 64

		SetTransform(6)
		if(kaiju_timeframe_current > -1)
			kaiju_timeframe_current -= 1
			if(kaiju_timeframe_current > (kaiju_timeframe / 2))
				kaiju_timer.show_screentext({"Стабильность формы: <b><span style="color: yellow;">[kaiju_timeframe_current]</span></b>"})
				kaiju_timer.maptext_x = -24
				kaiju_timer.maptext_y = 0
			else
				kaiju_timer.show_screentext({"Стабильность формы: <b><span style="color: red;">[kaiju_timeframe_current]</span></b>"})
				kaiju_timer.maptext_x = -24
				kaiju_timer.maptext_y = 0
		if(kaiju_timeframe_current < 0)
			kaiju_timeframe_current = kaiju_timeframe
			kaiju_timer.reset_screentext()
			client.screen -= kaiju_timer
			kaiju_timer = null
			destroy_kaiju()

	. = ..()

	if(kaiju)
		layer = 4.12
		pixel_y = 64

/mob/living/carbon/human/SelfMove(direction)
	if(kaiju)

		if(prob(1))
			if(length(kaiju_followers) >= 5)
				for(var/mob/living/carbon/alien/diona/D in kaiju_followers)
					qdel(D)

			kaiju_followers += new /mob/living/carbon/alien/diona(get_turf(src))

		for(var/turf/simulated/wall/W in orange(1,src))
			W.dismantle_wall(TRUE,TRUE)

		for(var/obj/O in orange(1,src))
			if(istype(O,/obj/machinery/door))
				new /obj/decal/cleanable/blood/gibs/robot(O.loc)
				var/datum/effect/spark_spread/s = new /datum/effect/spark_spread
				s.set_up(3, 1, O)
				s.start()
				qdel(O)
			if(istype(O,/obj/machinery/light))
				new /obj/decal/cleanable/blood/gibs/robot(O.loc)
				var/datum/effect/spark_spread/s = new /datum/effect/spark_spread
				s.set_up(3, 1, O)
				s.start()
				qdel(O)
			if(istype(O,/obj/structure/inflatable))
				qdel(O)
			if(istype(O,/obj/structure/barricade))
				qdel(O)
			if(istype(O,/obj/structure/table))
				qdel(O)
			if(istype(O,/obj/structure/window))
				qdel(O)
			if(istype(O,/obj/structure/grille))
				qdel(O)
			if(istype(O,/obj/structure/wall_frame))
				qdel(O)
			if(istype(O,/obj/structure/rubble))
				new /obj/decal/cleanable/blood/gibs/robot(O.loc)
				var/datum/effect/spark_spread/s = new /datum/effect/spark_spread
				s.set_up(3, 1, O)
				s.start()
				qdel(O)
			if(istype(O,/obj/structure/closet))
				var/obj/structure/closet/C = O
				C.locked = 0
				C.toggle()
				qdel(O)

		for(var/turf/simulated/floor/F in range(1,src))
			for(var/obj/decal/D in F)
				if(istype(D,/obj/decal/cleanable/dirt))
					qdel(D)
			new /obj/decal/cleanable/dirt(F)

		for(var/mob/living/carbon/human/H in orange(5,src))
			shake_camera_MARINE(H, steps = 2, strength = 2, time_per_step = 2)

	. = ..()

/mob/living/carbon/human/proc/destroy_kaiju()
	if(kaiju_timer)
		kaiju_timeframe_current = kaiju_timeframe
		kaiju_timer.reset_screentext()
		client.screen -= kaiju_timer
		kaiju_timer = null

	kaiju = FALSE
	animate(src, transform = matrix(1, MATRIX_SCALE), time = 2.5 SECONDS, easing = BOUNCE_EASING|EASE_IN)

	var/list/turf/simulated/floor/tiles = list()
	for(var/turf/simulated/floor/T in range(3,src))
		tiles += T

	for(var/turf/simulated/floor/T in range(1,src))
		T.dionaze()

	for(var/i=0, i<10, i++)
		var/turf/turf_to_spawn_on = pick(tiles)
		new /mob/living/carbon/alien/diona(turf_to_spawn_on)

	pixel_y = 0
	pass_flags = initial(pass_flags)
	simple_armor_natural = initial(simple_armor_natural)
	unarmed_simple_damage = initial(unarmed_simple_damage)
	SetTransform(1)

/mob/living/carbon/human/proc/kaiju_form_transformation()
	animate(src, transform = matrix(6, MATRIX_SCALE), time = 10 MINUTES, easing = SINE_EASING|EASE_IN)
	addtimer(new Callback(src, PROC_REF(kaiju_form_transformed)), 10 SECONDS)

/mob/living/carbon/human/proc/kaiju_form_transformed()
	if(!kaiju)
		SetTransform(6)
		kaiju = TRUE

		pass_flags |= PASS_FLAG_TABLE
		unarmed_simple_damage = 50
		simple_armor_natural = 40

		var/obj/screen/big_form_timer/newtimer = new /obj/screen/big_form_timer()

		client.screen += newtimer
		kaiju_timer = newtimer
