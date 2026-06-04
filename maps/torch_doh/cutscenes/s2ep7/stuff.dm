#define CATEGORY_FD_KAIJU "FINAL DESTINATION: KAIJU"

/datum/keybinding/living/fd/kaiju_meat
	category = CATEGORY_FD_KAIJU

/datum/keybinding/living/fd/kaiju_meat/can_use(client/user)
	. = ..()

	var/mob/living/carbon/human/L = user.mob
	var/user_species = L.get_species()
	if(user_species != SPECIES_DIONA)
		return FALSE
	if(!L.kaiju)
		return FALSE

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

/mob/living/carbon/human
	var/kaiju = FALSE
	var/obj/screen/big_form_timer/kaiju_timer

	var/kaiju_timeframe = 1000
	var/kaiju_timeframe_current = 1000

/mob/living/carbon/human/Life()
	if(kaiju_timer && !(kaiju_timer in client.screen))
		client.screen += kaiju_timer

	if(kaiju)
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

/mob/living/carbon/human/SelfMove(direction)
	if(kaiju)
		for(var/turf/simulated/wall/W in orange(1,src))
			W.dismantle_wall(TRUE,TRUE)

		for(var/obj/O in orange(1,src))
			if(istype(O,/obj/machinery/door))
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
			if(istype(O,/obj/structure/closet))
				var/obj/structure/closet/C = O
				C.locked = 0
				C.toggle()
				qdel(O)

	. = ..()

/mob/living/carbon/human/proc/destroy_kaiju()
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

	pass_flags = initial(pass_flags)
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

		var/obj/screen/big_form_timer/newtimer = new /obj/screen/big_form_timer()

		client.screen += newtimer
		kaiju_timer = newtimer
