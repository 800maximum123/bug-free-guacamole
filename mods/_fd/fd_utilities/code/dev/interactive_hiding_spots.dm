/datum/keybinding/living/fd/start_interaction/down(client/user)
	var/mob/living/M = user.mob
	if(M.hiding_spot)
		M.hiding_spot.reveal_player()
		return TRUE

	. = ..()

/mob/living
	var/obj/hiding_spot

	var/client_old_x
	var/client_old_y

/obj/
	var/can_hide_inside = FALSE
	var/hiding_viewpoint = SOUTH
	var/mob/living/hidden_mob

/obj/attack_animal(mob/user)
	if(hidden_mob)
		reveal_player()

	. = ..()

/obj/attack_hand(mob/living/user)
	if(hidden_mob)
		reveal_player()

	. = ..()

/obj/proc/hide_player(mob/living/user)
	user.forceMove(src)
	user.stunned = 99999

	user.dir = hiding_viewpoint
	user.client_old_x = user.client.pixel_x
	user.client_old_y = user.client.pixel_y
	switch(hiding_viewpoint)
		if(NORTH)
			animate(user.client, pixel_x = user.client_old_x, pixel_y = user.client_old_y + 128, time = 0.5 SECONDS, easing = SINE_EASING|EASE_IN)
		if(SOUTH)
			animate(user.client, pixel_x = user.client_old_x, pixel_y = user.client_old_y - 128, time = 0.5 SECONDS, easing = SINE_EASING|EASE_IN)
		if(EAST)
			animate(user.client, pixel_x = user.client_old_x + 128, pixel_y = user.client_old_y, time = 0.5 SECONDS, easing = SINE_EASING|EASE_IN)
		if(WEST)
			animate(user.client, pixel_x = user.client_old_x - 128, pixel_y = user.client_old_y, time = 0.5 SECONDS, easing = SINE_EASING|EASE_IN)

	hidden_mob = user
	user.hiding_spot = src

/obj/proc/reveal_player()
	if(hidden_mob.client)
		animate(hidden_mob.client, pixel_x = hidden_mob.client_old_x, pixel_y = hidden_mob.client_old_y, time = 0.2 SECONDS, easing = SINE_EASING|EASE_OUT)
	hidden_mob.forceMove(get_turf(src))

	hidden_mob.stunned = 0

	hidden_mob.hiding_spot = null
	hidden_mob = null

/obj/interact_with(mob/living/user)
	if(can_hide_inside && !hidden_mob)
		hide_player(user)
		return TRUE

	. = ..()
