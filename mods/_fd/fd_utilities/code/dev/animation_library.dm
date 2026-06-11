
/// From /modules/animations/animations_library.dm and /code/modules/mob/mob.dm
#define COMSIG_MOB_ANIMATING "mob_animating"

/proc/animation_flash_color(atom/A, flash_color = COLOR_RED, speed = 3) //Flashes red on default.
	var/oldcolor = A.color
	animate(A, color = flash_color, time = speed, flags = ANIMATION_PARALLEL)
	animate(color = oldcolor, time = speed)

/obj/temp_visual/swing
	duration = 0.6 SECONDS
	icon = 'mods/_fd/fd_utilities/icons/hit_effect.dmi'
	icon_state = "slash"
	layer = 4.5

/mob/proc/cool_attack_on(atom/A, pixel_offset = 8)
	SEND_SIGNAL(src, COMSIG_MOB_ANIMATING)

	var/obj/temp_visual/swing/D = new /obj/temp_visual/swing(get_turf(src))
	D.dir = dir

	if(buckled || anchored || pulledby) //it would look silly.
		return
	var/pixel_x_diff = 0
	var/pixel_y_diff = 0
	var/angle_diff = 0
	var/direction = get_dir(src, get_turf(A))
	pixel_offset = floor(pixel_offset) // Just to be safe

	if(QDELETED(A))
		direction = dir

	switch(direction)
		if(NORTH)
			pixel_y_diff = pixel_offset
			angle_diff = 30

			D.pixel_y = 25

		if(SOUTH)
			pixel_y_diff = -pixel_offset
			angle_diff = -30

			D.pixel_y = -25

		if(EAST)
			pixel_x_diff = pixel_offset
			angle_diff = 30

			D.pixel_x = 25

		if(WEST)
			pixel_x_diff = -pixel_offset
			angle_diff = -30

			D.pixel_x = -25

		if(NORTHEAST)
			pixel_x_diff = pixel_offset
			pixel_y_diff = pixel_offset
			angle_diff = 30

			D.pixel_y = 25
			D.pixel_x = 25

		if(NORTHWEST)
			pixel_x_diff = -pixel_offset
			pixel_y_diff = pixel_offset
			angle_diff = -30

			D.pixel_y = 25
			D.pixel_x = -25

		if(SOUTHEAST)
			pixel_x_diff = pixel_offset
			pixel_y_diff = -pixel_offset
			angle_diff = 30

			D.pixel_y = -25
			D.pixel_x = 25

		if(SOUTHWEST)
			pixel_x_diff = -pixel_offset
			pixel_y_diff = -pixel_offset
			angle_diff = -30

			D.pixel_y = -25
			D.pixel_x = -25

	animate(src, transform = matrix(angle_diff, MATRIX_ROTATE), pixel_x = pixel_x + pixel_x_diff, pixel_y = pixel_y + pixel_y_diff, time = 0.2 SECONDS, easing = SINE_EASING)
	animate(transform = matrix(0, MATRIX_ROTATE), pixel_x = initial(pixel_x), pixel_y = initial(pixel_y), time = 0.1 SECONDS)

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
