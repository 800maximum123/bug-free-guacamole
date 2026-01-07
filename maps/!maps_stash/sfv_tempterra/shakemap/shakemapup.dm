#define PIXELS_PER_STRENGTH_VAL 28

/proc/shake_camera_MARINE(mob/M, steps = 1, strength = 1, time_per_step = 1)
	if(!M?.client || (M.shakecamera > world.time))
		return

	M.shakecamera = world.time + steps * time_per_step
	strength = abs(strength)*PIXELS_PER_STRENGTH_VAL
	var/old_X = M.client.pixel_x
	var/old_y = M.client.pixel_y

	animate(M.client, pixel_x = old_X + rand(-(strength), strength), pixel_y = old_y + rand(-(strength), strength), easing = CUBIC_EASING | EASE_IN, time = time_per_step, flags = ANIMATION_PARALLEL)
	var/i = 1
	while(i < steps)
		animate(pixel_x = old_X + rand(-(strength), strength), pixel_y = old_y + rand(-(strength), strength), easing = CUBIC_EASING | EASE_IN, time = time_per_step)
		i++
	animate(pixel_x = old_X, pixel_y = old_y,time = clamp(floor(strength/PIXELS_PER_STRENGTH_VAL),2,4))//ease it back

#undef PIXELS_PER_STRENGTH_VAL
/*

/proc/shakeship(sstrength, stime, drop, osound = TRUE)
	for(var/mob/living/carbon/current_mob in GLOB.human_mobs)
		if(!is_mainship_level(current_mob.z))
			continue
		shake_camera(current_mob, stime, sstrength)
		if(drop)
			current_mob.apply_effect(5, EFFECT_WEAKEN)
		if(sstrength <= 2)
			to_chat(current_mob, SPAN_DANGER("The whole deck jumps and the ship rocks!"))
			if(current_mob.client && osound)
				sound_to(current_mob.client, 'bonk.ogg')
		if(sstrength > 2 && sstrength <= 7)
			to_chat(current_mob, SPAN_BOLDANNOUNCE("The deck violently shakes and vibrates with the impact!"))
			if(current_mob.client && osound)
				sound_to(current_mob.client, 'bonk.ogg' )
				sound_to(current_mob.client, 'meteorimpact.ogg' )
				sound_to(current_mob.client, 'slam2.ogg' )
				addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(sound_to), current_mob.client, 'sound/effects/doorcreaky.ogg', 20), 1 SECONDS)
		if(sstrength > 7)
			if(current_mob.client && osound)
				sound_to(current_mob.client, 'metal_crash.ogg' )
				sound_to(current_mob.client, 'bigboom3.ogg')

			if(drop)
				INVOKE_ASYNC(current_mob,  TYPE_PROC_REF(/atom/movable, throw_atom), get_ranged_target_turf(current_mob, pick(GLOB.cardinals), sstrength-5), pick(GLOB.cardinals), sstrength)

			to_chat(current_mob, SPAN_HIGHDANGER("YOU ARE THROWN AROUND VIOLENTLY AND HIT THE DECK WITH FULL FORCE!!"))
			if(current_mob.client && osound)
				addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(sound_to), current_mob.client, 'pry2.ogg', 20), 1 SECONDS)
				addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(sound_to), current_mob.client, 'double_klaxon.ogg'), 2 SECONDS)
*/
