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

// /proc/shakychoose



/proc/shakeship(sstrength, stime, drop, osound = TRUE, region)
	for(var/mob/living/carbon/current_mob in GLOB.human_mobs)
		if (!get_z(current_mob) in z_levels)
			continue
		shake_camera(current_mob, stime, sstrength)
		if(drop)
			current_mob.apply_effect(5, EFFECT_WEAKEN)
		if(sstrength <= 2)
			to_chat(current_mob, SPAN_DANGER("The whole deck jumps and the ship rocks!"))
			if(current_mob.client && osound)
				sound_to(current_mob.client, 'bonk.ogg')
		if(sstrength > 2 && sstrength <= 7)
			to_chat(current_mob, FONT_LARGE(SPAN_BOLD("The deck violently shakes and vibrates with the impact!")))
			if(current_mob.client && osound)
				sound_to(current_mob.client, 'bonk.ogg' )
				sound_to(current_mob.client, 'meteorimpact.ogg' )
				sound_to(current_mob.client, 'slam2.ogg' )
				addtimer(new Callback(GLOBAL_PROC, GLOBAL_PROC_REF(sound_to), current_mob.client, 'sound/effects/doorcreaky.ogg', 20), 1 SECONDS)
		if(sstrength > 7)
			if(current_mob.client && osound)
				sound_to(current_mob.client, 'metal_crash.ogg' )
				sound_to(current_mob.client, 'bigboom3.ogg')

			if(drop) // Лучше применю этот способ, скопированный с Марин чем throw_at_random. Делать лист турфов (7х7=49 рефов) для 40-ка игроков... Звучит не очень ресурсноэффективно
				invoke_async(current_mob,  TYPE_PROC_REF(/atom/movable, throw_at), get_ranged_target_turf(current_mob, pick(GLOB.cardinal), sstrength),   sstrength,   sstrength+10)
				invoke_async(current_mob,  TYPE_PROC_REF(/atom/movable, throw_at), get_ranged_target_turf(current_mob, pick(GLOB.cardinal), sstrength-3), sstrength-3, sstrength+5)
				invoke_async(current_mob,  TYPE_PROC_REF(/atom/movable, throw_at), get_ranged_target_turf(current_mob, pick(GLOB.cardinal), sstrength-5), sstrength-5, sstrength+3)
				//		/mob/throw_at(atom/target, range, speed, mob/thrower, spin, datum/callback/callback)

			to_chat(current_mob, FONT_GIANT(SPAN_DANGER("YOU ARE THROWN AROUND VIOLENTLY AND HIT THE DECK WITH FULL FORCE!!")))
			if(current_mob.client && osound)
//				addtimer(new Callback(GLOBAL_PROC, GLOBAL_PROC_REF(sound_to), current_mob.client, 'pry2.ogg', 20), 1 SECONDS)
//				addtimer(new Callback(GLOBAL_PROC, GLOBAL_PROC_REF(sound_to), current_mob.client, 'double_klaxon.ogg'), 2 SECONDS)
