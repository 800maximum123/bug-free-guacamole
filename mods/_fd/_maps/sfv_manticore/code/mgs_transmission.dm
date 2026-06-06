GLOBAL_LIST_INIT(music_fd, list("Danger Bound.ogg",
								"Active Contract.ogg",
								"Cautious Operation.ogg",
								"Clear Skies.ogg",
								"Fire and Dust.ogg",
								"Peacekeeper.ogg",
								"To the Death for the Glory.ogg",
								"Valkyries Call.ogg",
								"Consequence of Power.ogg",))

/client/proc/play_server_sound_fd()
	set category = "Fun"
	set name = "Play Music"
	if(!check_rights(R_SOUNDS))	return

	var/melody = "maps/torch_doh/cutscenes/sounds/"
	melody += input("Select a sound from the server to play", "Server sound list") as null|anything in GLOB.music_fd

	play_sound(melody)

/obj/screen/fullscreen/alert_transmission
	icon = 'mods/_fd/_maps/sfv_manticore/icons/transmissions.dmi'
	scale_to_view = TRUE
	icon_state = "alert"

/obj/screen/fullscreen/alert_transmission/Initialize()
	. = ..()
	alpha = 0
	animate(src, transform = matrix(0.01, MATRIX_SCALE), time = 1 SECOND, easing = BOUNCE_EASING)
	spawn(2 SECONDS)
		animate(src, 1 SECOND, alpha = 150)
		animate(src, transform = matrix(), time = 1 SECOND, easing = LINEAR_EASING)
	spawn(4 SECONDS)
		animate(src, pixel_x = -128, time = 1 SECOND, easing = SINE_EASING | EASE_OUT)

/obj/screen/fullscreen/alert_transmission/Destroy()
	animate(src, 0.5 SECOND, alpha = 0)
	severity = 0
	return ..()

/obj/screen/fullscreen/gyne_transmission
	icon = 'mods/_fd/_maps/sfv_manticore/icons/transmissions.dmi'
	scale_to_view = TRUE
	icon_state = "gyne_one"

/obj/screen/fullscreen/gyne_transmission/Initialize()
	. = ..()
	alpha = 0
	spawn(1 SECOND)
		animate(src, 1 SECOND, alpha = 255)

/obj/screen/fullscreen/gyne_transmission/Destroy()
	animate(src, 0.5 SECOND, alpha = 0)
	severity = 0
	return ..()

/obj/screen/fullscreen/alert_transmission/Destroy()
	animate(src, 0.5 SECOND, alpha = 0)
	severity = 0
	return ..()

/obj/screen/fullscreen/hound1_transmission
	icon = 'mods/_fd/_maps/sfv_manticore/icons/transmissions.dmi'
	scale_to_view = TRUE
	icon_state = "pilot_one"

/obj/screen/fullscreen/hound1_transmission/Initialize()
	. = ..()
	alpha = 0
	spawn(1 SECOND)
		animate(src, 1 SECOND, alpha = 255)

/obj/screen/fullscreen/hound1_transmission/Destroy()
	animate(src, 0.5 SECOND, alpha = 0)
	severity = 0
	return ..()

/obj/screen/fullscreen/hound2_transmission
	icon = 'mods/_fd/_maps/sfv_manticore/icons/transmissions.dmi'
	scale_to_view = TRUE
	icon_state = "pilot_two"

/obj/screen/fullscreen/hound2_transmission/Initialize()
	. = ..()
	alpha = 0
	spawn(1 SECOND)
		animate(src, 1 SECOND, alpha = 255)

/obj/screen/fullscreen/hound2_transmission/Destroy()
	animate(src, 0.5 SECOND, alpha = 0)
	severity = 0
	return ..()

/obj/screen/fullscreen/captain_transmission
	icon = 'mods/_fd/_maps/sfv_manticore/icons/transmissions.dmi'
	scale_to_view = TRUE
	icon_state = "captain_one"

/obj/screen/fullscreen/captain_transmission/Initialize()
	. = ..()
	alpha = 0
	spawn(1 SECOND)
		animate(src, 1 SECOND, alpha = 255)

/obj/screen/fullscreen/captain_transmission/Destroy()
	animate(src, 0.5 SECOND, alpha = 0)
	severity = 0
	return ..()

/proc/gyne_transmission()
	for(var/mob/M in GLOB.player_list)
		M.overlay_fullscreen("incoming", /obj/screen/fullscreen/alert_transmission)
		spawn(4 SECONDS)
			M.clear_fullscreen("incoming")
			M.overlay_fullscreen("gyne", /obj/screen/fullscreen/gyne_transmission)
		spawn(20 SECONDS)
			M.clear_fullscreen("gyne")

// Начало раунда
/proc/captain_transmission()

	for(var/mob/M in GLOB.player_list)
		M.overlay_fullscreen("incoming", /obj/screen/fullscreen/alert_transmission)
		spawn(4 SECONDS)
			M.clear_fullscreen("incoming")
			M.overlay_fullscreen("captain", /obj/screen/fullscreen/captain_transmission)
		spawn(15 SECONDS)
			M.clear_fullscreen("captain")

// Смерть первого Хаунда
/proc/hound1_transmission()
	for(var/mob/M in GLOB.player_list)
		M.overlay_fullscreen("incoming", /obj/screen/fullscreen/alert_transmission)
		spawn(4 SECONDS)
			M.clear_fullscreen("incoming")
			M.overlay_fullscreen("pilot", /obj/screen/fullscreen/hound1_transmission)
		spawn(10 SECONDS)
			M.clear_fullscreen("pilot")

// Смерть второго Хаунда
/proc/hound2_transmission()
	for(var/mob/M in GLOB.player_list)
		M.overlay_fullscreen("incoming", /obj/screen/fullscreen/alert_transmission)
		spawn(4 SECONDS)
			M.clear_fullscreen("incoming")
			M.overlay_fullscreen("pilot", /obj/screen/fullscreen/hound2_transmission)
		spawn(20 SECONDS)
			M.clear_fullscreen("pilot")
