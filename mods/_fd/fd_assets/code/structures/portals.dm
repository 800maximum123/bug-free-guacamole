/obj/structure/fd/portal
	name = "Pathway"
	desc = "Some sort of exit or enter."
	icon = 'icons/mob/screen1.dmi'
	icon_state = "x2"
	density = TRUE
	anchored = TRUE
	var/anim_time = 0.75 SECONDS
	var/anim_distance = 19
	var/turf/destination = null
	var/sound_effect = 'sound/effects/extin.ogg'

// Thanks, Danilcus-W - Tech-priest-34
/obj/structure/fd/portal/attack_hand(mob/living/carbon/human/user)
	SHOULD_CALL_PARENT(FALSE)
	set waitfor = FALSE
	if(destination)

		anim_distance *= 32

		var/client/client = user.client
		ADD_TRANSFORMATION_MOVEMENT_HANDLER(user)
		sound_to(user, sound(sound_effect, volume = 60))
		animate(client, pixel_y = anim_distance, time = anim_time/2, easing = CUBIC_EASING|EASE_IN)
		sleep(anim_time/2)

		user.forceMove(destination)

		client.pixel_y = -anim_distance
		animate(client, pixel_y = 0, time = anim_time/2, easing = CUBIC_EASING|EASE_OUT)
		sleep(anim_time/2)
		DEL_TRANSFORMATION_MOVEMENT_HANDLER(user)
	else
		log_and_message_admins(SPAN_WARNING("<b> \[Pathway portals\] Моб [user] попытался телепортироваться через объект на [user.x]-[user.y] и З-уровне [user.z], но не смог, поскольку не указано место назначения. Исправить!</i></b>"))
		to_chat(user, "Вы пробуете, но ничего не происходит.")
