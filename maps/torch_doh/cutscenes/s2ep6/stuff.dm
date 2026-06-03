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
	var/obj/screen/big_form_timer/kaiju_timer

	var/kaiju_timeframe = 1000
	var/kaiju_timeframe_current = 1000

/mob/living/Life()
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
			kaiju_timer = null
			destroy_kaiju()

	. = ..()

/mob/living/proc/destroy_kaiju()
	kaiju = FALSE
	animate(src, transform = matrix(1, MATRIX_SCALE), time = 5 SECONDS, easing = BOUNCE_EASING|EASE_IN)

	var/list/turf/simulated/floor/tiles = list()
	for(var/turf/simulated/floor/T in range(3,src))
		tiles += T

	for(var/turf/simulated/floor/T in range(1,src))
		T.dionaze()

	for(var/i=0, i<10, i++)
		var/turf/turf_to_spawn_on = pick(tiles)
		new /mob/living/carbon/alien/diona(turf_to_spawn_on)

/mob/living/proc/kaiju_form_transformation()
	animate(src, transform = matrix(6, MATRIX_SCALE), time = 10 MINUTES, easing = SINE_EASING|EASE_IN)
	addtimer(new Callback(src, PROC_REF(kaiju_form_transformed)), 10 SECONDS)

/mob/living/proc/kaiju_form_transformed()
	if(!kaiju)
		SetTransform(6)
		kaiju = TRUE

		var/obj/screen/big_form_timer/newtimer = new /obj/screen/big_form_timer()

		client.screen += newtimer
		kaiju_timer = newtimer
