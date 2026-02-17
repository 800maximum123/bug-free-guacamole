#define MOVING(speed) abs(speed) >= min_speed
#define SANITIZE_SPEED(speed) SIGN(speed) * clamp(abs(speed), 0, max_speed)
#define CHANGE_SPEED_BY(speed_var, v_diff) \
	v_diff = SANITIZE_SPEED(v_diff);\
	if(!MOVING(speed_var + v_diff)) \
		{speed_var = 0};\
	else \
		{speed_var = SANITIZE_SPEED((speed_var + v_diff)/(1 + speed_var*v_diff/(max_speed ** 2)))}

/obj/overmap/space_projectile
	var/max_speed = 1/(1 SECOND)        // "speed of light" for the ship, in turfs/tick.
	var/min_speed = 1/(2 MINUTES)       // Below this, we round speed to 0 to avoid math errors.

	var/list/speed = list(0,0)          // speed in x,y direction
	var/list/position = list(0,0)       // position within a tile.

	var/halted = 0                      // admin halt or other stop.

	var/max_life = 60                   // how much before we
	var/life = 0

/// Yoinked and slightly modified code from ship.dm

/obj/overmap/space_projectile/proc/is_still()
	return !MOVING(speed[1]) && !MOVING(speed[2])

/obj/overmap/space_projectile/proc/get_speed()
	return round(sqrt(speed[1] ** 2 + speed[2] ** 2), SHIP_MOVE_RESOLUTION)

/obj/overmap/space_projectile/proc/get_heading()
	var/res = 0
	if(MOVING(speed[1]))
		if(speed[1] > 0)
			res |= EAST
		else
			res |= WEST
	if(MOVING(speed[2]))
		if(speed[2] > 0)
			res |= NORTH
		else
			res |= SOUTH
	return res

/obj/overmap/space_projectile/proc/get_heading_angle()
	var/res = 0
	if (MOVING(speed[1]) || MOVING(speed[2]))
		res = (round(Atan2(speed[1], -speed[2])) + 450)%360
	return res

/obj/overmap/space_projectile/proc/adjust_speed(n_x, n_y)
	CHANGE_SPEED_BY(speed[1], n_x)
	CHANGE_SPEED_BY(speed[2], n_y)
	update_icon()

/obj/overmap/space_projectile/proc/accelerate(delta, direction)
	if (!delta || !direction || halted)
		return
	var/dx = (direction & EAST) ? 1 : ((direction & WEST) ? -1 : 0)
	var/dy = (direction & NORTH) ? 1 : ((direction & SOUTH) ? -1 : 0)
	if (dx && dy)
		dx *= 0.5
		dy *= 0.5
	adjust_speed(delta * dx, delta * dy)

/obj/overmap/space_projectile/Process()
	life++
	if(life == max_life)
		expire()

	if(!halted && !is_still())
		var/list/deltas = list(0,0)
		for(var/i = 1 to 2)
			if(MOVING(speed[i]))
				position[i] += speed[i] * OVERMAP_SPEED_CONSTANT
				if(position[i] < 0)
					deltas[i] = ceil(position[i])
				else if(position[i] > 0)
					deltas[i] = floor(position[i])
				if(deltas[i] != 0)
					position[i] -= deltas[i]
					position[i] += (deltas[i] > 0) ? -1 : 1

		update_icon()
		var/turf/newloc = locate(x + deltas[1], y + deltas[2], z)
		if(newloc && loc != newloc)
			Move(newloc)
			handle_wraparound()
		handle_collisions()

/obj/overmap/space_projectile/on_update_icon()
	pixel_x = position[1] * (world.icon_size/2)
	pixel_y = position[2] * (world.icon_size/2)
	if(!is_still())
		dir = get_heading()
	..()

/obj/overmap/space_projectile/proc/expire()
	set waitfor = FALSE
	animate(src, 10 SECONDS, alpha = 0)
	sleep(10 SECONDS)
	qdel(src)

/obj/overmap/space_projectile/proc/handle_wraparound()
	var/nx = x
	var/ny = y
	var/low_edge = 1
	var/high_edge = GLOB.using_map.overmap_size - 1

	if((dir & WEST) && x == low_edge)
		nx = high_edge
	else if((dir & EAST) && x == high_edge)
		nx = low_edge
	if((dir & SOUTH)  && y == low_edge)
		ny = high_edge
	else if((dir & NORTH) && y == high_edge)
		ny = low_edge
	if((x == nx) && (y == ny))
		return //we're not flying off anywhere

	var/turf/T = locate(nx,ny,z)
	if(T)
		forceMove(T)

/obj/overmap/space_projectile/proc/halt()
	adjust_speed(-speed[1], -speed[2])
	halted = 1

/obj/overmap/space_projectile/proc/unhalt()
	if(!SSshuttle.overmap_halted)
		halted = 0

/obj/overmap/space_projectile/Bump(atom/A)
	if(istype(A,/turf/unsimulated/map/edge))
		handle_wraparound()
	..()

#undef MOVING
#undef SANITIZE_SPEED
#undef CHANGE_SPEED_BY
