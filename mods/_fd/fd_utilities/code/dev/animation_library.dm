
/proc/animation_flash_color(atom/A, flash_color = COLOR_RED, speed = 3) //Flashes red on default.
	var/oldcolor = A.color
	animate(A, color = flash_color, time = speed, flags = ANIMATION_PARALLEL)
	animate(color = oldcolor, time = speed)
