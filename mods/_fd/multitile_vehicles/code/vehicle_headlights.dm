/obj/vehicles/verb/toggle_headlights()
	set name = "Toggle Headlights"
	set category = "Vehicle"
	set src in view(1)
	if(health_dead)
		return
	var/mob/living/user = usr
	if(!istype(user) || !(user in get_occupants_in_position(VP_DRIVER)))
		to_chat(user,"<span class = 'notice'>You must be the driver of [src] to toggle the headlights.</span>")
		return

	if(headlights_state == 2)
		to_chat(user,"<span class = 'notice'>You toggle [src]'s headlights on.</span>")
		headlights_state = 1
		update_headlights(TRUE)
	else
		to_chat(user,"<span class = 'notice'>You toggle [src]'s headlights off.</span>")
		headlights_state = 2
		update_headlights(TRUE)

/obj/vehicles/proc/update_headlights(sound)
	if(headlights_state == 1)
		set_light(l_range, l_power, l_color, dir2angle(dir))
		icon_state = initial(icon_state) + "_light"
		if(sound)
			playsound(get_turf(src), 'sound/effects/flashlight.ogg', 75, TRUE)
	else
		set_light(0,0,0,l_color = COLOR_WHITE)
		icon_state = initial(icon_state)
	update_light()
	update_icon()
