
/proc/animation_flash_color(atom/A, flash_color = COLOR_RED, speed = 3) //Flashes red on default.
	var/oldcolor = A.color
	animate(A, color = flash_color, time = speed, flags = ANIMATION_PARALLEL)
	animate(color = oldcolor, time = speed)

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
