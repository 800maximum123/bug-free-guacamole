/mob/living
	var/hiding

/mob/living/proc/hide()
	set name = "Hide"
	set desc = "Allows to hide beneath tables or certain items. Toggled on or off."
	set category = "Abilities"

	if(incapacitated())
		return

	hiding = !hiding
	if(hiding)
		to_chat(src, SPAN_NOTICE("You are now hiding."))
	else
		to_chat(src, SPAN_NOTICE("You have stopped hiding."))
	reset_layer()

/mob/living/verb/lookup()
	set name = "Look up"
	set desc = "If you want to know what's above."
	set category = "IC"


	if(client && !is_physically_disabled())
		if(z_eye)
			reset_view(null)
			QDEL_NULL(z_eye)
			return
		var/turf/above = GetAbove(src)

		if(!TURF_IS_MIMICING(above))
			var/turf/near_above = get_step(above,dir) // Look for the turf infront of the mob if above is not lookable
			if(near_above && TURF_IS_MIMICING(near_above))
				above = near_above
			else
				for(var/turf/around in view(1, above)) // Look for turfs around if turf infront is not lookable
					if(TURF_IS_MIMICING(around))
						above = around
						break
		if(TURF_IS_MIMICING(above))
			z_eye = new /atom/movable/z_observer/z_up(above, src)
			z_eye.owner = src
			to_chat(src, SPAN_NOTICE("You look up."))
			reset_view(z_eye)
			return

		var/turf/T = get_turf(src)

		if(T.is_outside())// They're outside and hopefully on a planet.
			var/obj/overmap/visitable/sector/exoplanet/E = map_sectors["[T.z]"]
			if (!istype(E))
				to_chat(src, SPAN_NOTICE("You can see \the [above ? above : "sky"]."))
				return

			//Weather hook here when it is a thing

			// Sun-related output.
			//Calculate time of day
			var/time_of_day = E.sun_last_process % E.daycycle
			var/afternoon = time_of_day > (E.daycycle / 2)
			var/star_name = GLOB.using_map.system_name

			var/sun_message = null
			switch(E.sun_position)
				if(0 to 0.4) // Night
					sun_message = "It is night time, [star_name] is not visible."
				if(0.4 to 0.5) // Twilight
					sun_message = "The sky is in twilight, however [star_name] is not visible."
				if(0.5 to 0.7) // Sunrise/set.
					sun_message = "[star_name] is slowly [!afternoon ? "rising from" : "setting on"] the horizon."
				if(0.7 to 0.9) // Morning/evening
					sun_message = "[star_name]'s position implies it is currently [!afternoon ? "early" : "late"] in the day."
				if(0.9 to 1.0) // Noon
					sun_message = "It's high noon. [star_name] hangs directly above you."

			to_chat(usr, SPAN_NOTICE(sun_message))
			return


		to_chat(src, SPAN_NOTICE("You can see \the [above ? above : "ceiling"]."))
	else
		to_chat(src, SPAN_NOTICE("You can't look up right now."))

/mob/living/verb/lookdown()
	set name = "Look Down"
	set desc = "If you want to know what's below."
	set category = "IC"

	if(client && !is_physically_disabled())
		if(z_eye)
			reset_view(null)
			QDEL_NULL(z_eye)
			return
		var/turf/T = get_turf(src)
		if(!TURF_IS_MIMICING(T) || !HasBelow(T.z))
			var/turf/near_below = get_step(src,dir) // Look for the turf below of the mob if above is not lookable
			if(near_below && (TURF_IS_MIMICING(near_below) || HasBelow(near_below.z)))
				T = near_below
			else
				for(var/turf/around in view(1, T)) // Look for turfs around if turf infront is not lookable
					if(TURF_IS_MIMICING(around) && HasBelow(around.z))
						T = around
						break
		if(TURF_IS_MIMICING(T) && HasBelow(T.z))
			z_eye = new /atom/movable/z_observer/z_down(T, src)
			z_eye.owner = src
			to_chat(src, SPAN_NOTICE("You look down."))
			reset_view(z_eye)
			return
		to_chat(src, SPAN_NOTICE("You can see \the [T ? T : "floor"]."))
	else
		to_chat(src, SPAN_NOTICE("You can't look below right now."))
