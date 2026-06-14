GLOBAL_LIST_EMPTY(desert_waypoint)

// FOG OF WAR
// "IC" barrier for the map edges
/obj/structure/fog
	name = "fog of war"
	desc = "Thick fog. Return to the battlezone!"
	icon = 'icons/effects/96x96.dmi'
	icon_state = "smoke2"
	mouse_opacity = 0
	pixel_x = -32
	pixel_y = -32
	layer = 4.09
	anchored = TRUE
	density = TRUE
	/// Can you desert through this smoke?
	var/desertable = TRUE

/obj/structure/fog/Bumped(mob/AM)
	. = ..()
	if(!desertable)
		to_chat(AM, SPAN_WARNING("You cannot run away from here..."))
		return
	var/mob/living/deserter = AM
	if(!istype(AM))
		return
	var/question = alert(deserter, "Are you sure you wanna desert and leave your comrades behind? (WARNING: YOU WON'T BE ABLE TO COME BACK, AND IF YOU COULD THEY WON'T LIKE SEEING YOU)", "fog of war", "NO", "Yes...")
	if(question == "NO")
		to_chat(deserter, SPAN_WARNING("You hesitate..."))
	else
		log_and_message_admins("[deserter] have deserted from the battlezone", deserter, get_turf(src))
		to_chat(deserter, SPAN_DANGER("You run away into the fog not looking back!"))
		visible_message(SPAN_DANGER("[deserter] runs away into the fog!"), SPAN_WARNING("You hear quick footsteps fading into distance..."))
		playsound(src, 'maps/gaia/sounds/effects/desertion.ogg', 70, TRUE)
		do_teleport(deserter, pick(GLOB.desert_waypoint), 0, /singleton/teleport)

/obj/structure/fog/no_desert
	desertable = FALSE
