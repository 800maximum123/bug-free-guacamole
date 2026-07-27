/obj/vehicles/proc/pick_valid_exit_loc()
	var/list/valid_exit_locs = list()
	var/list/valid_exit_locs_fallback = list()

	//check for atmos safe turfs
	for(var/turf/t in locs)
		for(var/turf/t_2 in range(1,t))
			if(!(t_2 in locs) && !istype(t_2,/turf/simulated/open) && t_2.density == FALSE)
				if(locate(/obj/shield) in t_2.contents) //No putting people inside shields.
					continue
				if(locate(/obj/structure/wall_frame) in t_2.contents)
					continue
				if(locate(/obj/structure/grille) in t_2.contents)
					continue
				if(locate(/obj/structure/girder) in t_2.contents)
					continue
				if(locate(/obj/structure/window) in t_2.contents) //Just no windows.
					valid_exit_locs_fallback += t_2
					continue
				if(!IsTurfAtmosUnsafe(t_2))
					valid_exit_locs |= t_2
				else
					valid_exit_locs_fallback += t_2

	//try again for anny turfs
	if(valid_exit_locs.len == 0)
		valid_exit_locs = valid_exit_locs_fallback

	if(valid_exit_locs.len == 0)
		return null

	return pick(valid_exit_locs)

/obj/vehicles/Move(turf/newloc, newdir)
	if(abs(speed[1]) > abs(speed[2]))
		if(speed[1] > 0)
			newdir = EAST
		else
			newdir = WEST
	else
		if(speed[2] > 0)
			newdir = NORTH
		else
			newdir = SOUTH
	if(anchored)
		anchored = FALSE
		update_headlights(FALSE)
		. = ..()
		anchored = TRUE
	else
		update_headlights(FALSE)
		. = ..()

/obj/vehicles/can_fall()
	if(can_traverse_zs && !movement_destroyed && active)
		return 0
	. = ..()

/obj/vehicles/proc/collide_with_obstacle(atom/obstacle)
	if((last_move == NORTH || last_move == SOUTH) && abs(speed[1] <= 1)) // soft bump
		return
	else if((last_move == EAST || last_move == WEST) && abs(speed[2] <= 1)) // soft bump
		return
	if(istype(obstacle, /mob/living))
		var/mob/living/hit_mob = obstacle
		if(weaken_to_people)
			var/calculated_weaken = weaken_to_people
			if(last_move == NORTH || last_move == SOUTH)
				calculated_weaken = weaken_to_people / abs(min_speed / speed[1])
			else if(last_move == EAST || last_move == WEST)
				calculated_weaken = weaken_to_people / abs(min_speed / speed[2])
			hit_mob.Weaken(calculated_weaken)

		if(dangerous_to_people)
			var/send_flying = FALSE
			var/calculated_damage = damage_to_people
			if(last_move == NORTH || last_move == SOUTH)
				calculated_damage = damage_to_people / abs(min_speed / speed[1])
				if(abs(speed[1]) == max_speed)
					send_flying = TRUE
			else if(last_move == EAST || last_move == WEST)
				calculated_damage = damage_to_people / abs(min_speed / speed[2])
				if(abs(speed[2]) == max_speed)
					send_flying = TRUE

			if(send_flying)
				hit_mob.throw_at(get_edge_target_turf(hit_mob, dir), rand(max_speed, min_speed), 1)
			hit_mob.apply_damage(calculated_damage, DAMAGE_BRUTE, BP_CHEST, used_weapon = "[src] vehicle ramming")

		to_chat(hit_mob, SPAN_DANGER("You are hit by \the [src]!"))
		visible_message(SPAN_WARNING("\The [src] hits \the [hit_mob]!"))
		playsound(hit_mob, get_sfx("swing_hit"), 100, TRUE)
	else
		next_move_input_at = world.time + min_speed
		if(last_move == EAST || last_move == WEST)
			moving_x = 0
			speed[1] = 0
		else if(last_move == NORTH || last_move == SOUTH)
			speed[2] = 0
			moving_y = 0
		last_moved_axis = 0
		visible_message(SPAN_NOTICE("\The [src] collides with \the [obstacle]."))

		if(dangerous_to_obstacles)
			comp_prof.take_component_damage(damage_to_obstacles / selfdamage_multiplier, DAMAGE_BRUTE)
			obstacle.damage_health(damage_to_obstacles, DAMAGE_BRUTE)
			visible_message(SPAN_WARNING("\The [src] and \the [obstacle] both take damage from the hit!"))
			playsound(obstacle, get_sfx("sparks"), 50, TRUE)
	play_crash_sound()

/obj/vehicles/Bump(atom/obstacle)
	. = ..()
	if(istype(obstacle, /obj/structure/stairs))
		return
	return collide_with_obstacle(obstacle)

/obj/vehicles/proc/drag_slowdown(index, slowdown_amount = drag)
	if(speed[index] > 0)
		speed[index] = max(speed[index] - drag,0)
	else
		speed[index] = min(speed[index] + drag,0)

/obj/vehicles/proc/movement_loop(speed_index_target = 1)
	var/noprocstart = FALSE
	if(moving_x || moving_y)
		noprocstart = TRUE
	switch(speed_index_target)
		if(1)
			moving_x = 1
		if(2)
			moving_y = 1
	if(noprocstart)
		return
	spawn()
		while (moving_x || moving_y)
			sleep(max(min_speed - (abs(speed[1]) + abs(speed[2]) ),max_speed))
			if(speed[1] == 0)
				moving_x = 0
			else
				if(speed[1] > 0)
					last_move = EAST
					. = Move(get_step(loc,EAST),EAST)
				else
					last_move = WEST
					. = Move(get_step(loc,WEST),WEST)

			if(speed[2] == 0)
				moving_y = 0
			else
				if(speed[2] > 0)
					last_move = NORTH
					. = Move(get_step(loc,NORTH),NORTH)
				else
					last_move = SOUTH
					. = Move(get_step(loc,SOUTH),SOUTH)
			var/list/index_list = list(1,2)
			for(var/index in index_list)
				if(last_moved_axis == index)
					continue
				drag_slowdown(index)
			if(world.time >= next_move_input_at)
				last_moved_axis = 0
			if(move_sound && world.time % 2 == 0)
				if(braking_mode == 1)
					play_brake_sound()
				else
					play_move_sound()

/obj/vehicles/relaymove(mob/user, direction)
	if(world.time < next_move_input_at)
		return 0
	if(isspace(loc) && !can_space_move)
		to_chat(user,"<span class = 'notice'>[src] cannot move in space!</span>")
		return
	if(movement_destroyed)
		to_chat(user,"<span class = 'notice'>[src] is in no state to move!</span>")
		return 0
	if(!active)
		to_chat(user,"<span class = 'notice'>[src] needs to be active to move!</span>")
		return 0
	next_move_input_at = world.time + max(max_speed,min_speed - (abs(speed[1]) + abs(speed[2])))

	user.dir = direction

	if(occupants[user] != VP_DRIVER)
		return -1

	if(!(direction in list(NORTH,SOUTH,EAST,WEST)))
		var/dirturn = 45
		if(prob(50))
			dirturn = -45
		direction = turn(direction,dirturn)

	if(!user.skill_check(driving_skill, skill_level) && complex_controls && prob(25))
		direction = pick(NORTH,SOUTH,EAST,WEST)
		to_chat(user, SPAN_DANGER("You clumsily fumble with \the [src] controls."))

	user.dir = direction

	switch(direction)
		if(NORTH)
			last_moved_axis = 2
			speed[2] = min(speed[2] + acceleration,min_speed)

		if(SOUTH)
			last_moved_axis = 2
			speed[2] = max(speed[2] - acceleration,-min_speed)

		if(EAST)
			last_moved_axis = 1
			speed[1] = min(speed[1] + acceleration,min_speed)

		if(WEST)
			last_moved_axis = 1
			speed[1] = max(speed[1] - acceleration,-min_speed)
	if(last_moved_axis == 1)
		drag_slowdown(2,acceleration)
	else
		drag_slowdown(1,acceleration)
	if(braking_mode == 1) //If we're braking, we don't get the leeway in movement.
		last_moved_axis = 0

	if(speed[1] != 0 && !moving_x)
		movement_loop(1)
	else if(speed[2] != 0 && !moving_y)
		movement_loop(2)
	return 1
