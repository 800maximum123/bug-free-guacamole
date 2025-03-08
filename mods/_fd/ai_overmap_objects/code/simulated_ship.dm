#define MOVING(speed) abs(speed) >= min_speed
#define SANITIZE_SPEED(speed) SIGN(speed) * clamp(abs(speed), 0, characteristic.max_speed)
#define CHANGE_SPEED_BY(speed_var, v_diff) \
	v_diff = SANITIZE_SPEED(v_diff);\
	if(!MOVING(speed_var + v_diff)) \
		{speed_var = 0};\
	else \
		{speed_var = SANITIZE_SPEED((speed_var + v_diff)/(1 + speed_var*v_diff/(characteristic.max_speed ** 2)))}

/obj/overmap/simulated_ship
	name = "Unknown ship"
	desc = "unknown ship"
	icon = 'mods/_fd/fd_assets/icons/overmap_eris.dmi'
	icon_state = "unkn"
	var/moving_state = "unkn_r"
	requires_contact = FALSE
	scannable = TRUE

	var/datum/ship_characteristic/characteristic = null

	// These two bad boys are for when we have real Z-level ship and
	// we want the simulation ship to only contain info about it and kinda
	// control it. Disabled for now
	//var/obj/overmap/simulated_ship/linked_object = null
	//var/should_link = FALSE

	// Destination (desitnation) coordinates
	var/dx
	var/dy

	var/last_shot_time = 0

	var/min_speed = 1/(2 MINUTES)       // Below this, we round speed to 0 to avoid math errors.

	var/list/speed = list(0,0)          // speed in x,y direction
	var/list/position = list(0,0)       // position within a tile.
	var/last_burn = 0                   // worldtime when ship last acceleated
	var/burn_delay = 1 SECOND           // how often ship can do burns
	var/fore_dir = NORTH                // what dir ship flies towards for purpose of moving stars effect procs

	var/halted = 0        //admin halt or other stop.


/obj/overmap/simulated_ship/Initialize()
	..()
	//characteristic = new()
	if(!characteristic)
		qdel(src) // lmao
	glide_size = world.icon_size
	min_speed = round(min_speed, SHIP_MOVE_RESOLUTION)
	characteristic.max_speed = round(characteristic.max_speed, SHIP_MOVE_RESOLUTION)
	START_PROCESSING(SSobj, src)

/obj/overmap/simulated_ship/Destroy()
	STOP_PROCESSING(SSobj, src)
	if(characteristic)
		var/obj/overmap/event/ship_wreck/type_of_wreck = characteristic.get_wreck_type()
		if(type_of_wreck)
			var/obj/overmap/event/ship_wreck/new_wreck = new type_of_wreck(get_turf(src))
			new_wreck.color = src.color
		//O.Initialize()
		if(!QDELETED(characteristic))
			QDEL_NULL(characteristic)
	..()

/obj/overmap/simulated_ship/Process()
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

	if(characteristic.should_die == TRUE || characteristic.health == 0) // Just for safety
		qdel(src)

/obj/overmap/simulated_ship/MouseEntered(location, control, params)
	//var/scan_health = round((characteristic.health / characteristic.max_health) * 100)
	//var/scan_shield = round((characteristic.shield / characteristic.max_shield) * 100)
	//var/content_of_tooltip = "[SPAN_COLOR("#4ae08e", "[scan_health]%")]/[SPAN_COLOR("#4ae08e", "100")], [SPAN_COLOR("#2bd2f0", "[scan_shield]")]/[SPAN_COLOR("#2bd2f0", "100")]"
	var/content_of_tooltip = characteristic.get_additional_info()
	openToolTip(user = usr, tip_src = src, params = params, title = name, content = content_of_tooltip)
	..()

/obj/overmap/simulated_ship/proc/is_still()
	return !MOVING(speed[1]) && !MOVING(speed[2])

/obj/overmap/simulated_ship/proc/get_acceleration()
	return round(get_total_thrust()/get_vessel_mass(), SHIP_MOVE_RESOLUTION)

/obj/overmap/simulated_ship/proc/get_burn_acceleration()
	return round(characteristic.max_speed / get_vessel_mass(), SHIP_MOVE_RESOLUTION)

/obj/overmap/simulated_ship/proc/get_vessel_mass()
	. = characteristic.vessel_mass

/obj/overmap/simulated_ship/proc/get_speed()
	return round(sqrt(speed[1] ** 2 + speed[2] ** 2), SHIP_MOVE_RESOLUTION)

/obj/overmap/simulated_ship/proc/get_heading()
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

/obj/overmap/simulated_ship/proc/get_heading_angle()
	var/res = 0
	if (MOVING(speed[1]) || MOVING(speed[2]))
		res = (round(Atan2(speed[1], -speed[2])) + 450)%360
	return res

/obj/overmap/simulated_ship/proc/adjust_speed(n_x, n_y)
	CHANGE_SPEED_BY(speed[1], n_x)
	CHANGE_SPEED_BY(speed[2], n_y)
	update_icon()

/obj/overmap/simulated_ship/proc/get_brake_path()
	if(!get_acceleration())
		return INFINITY
	if(is_still())
		return 0
	if(!burn_delay)
		return 0
	if(!get_speed())
		return 0
	var/num_burns = get_speed()/get_acceleration() + 2 //some padding in case acceleration drops form fuel usage
	var/burns_per_grid = 1/ (burn_delay * get_speed())
	return round(num_burns/burns_per_grid)

/obj/overmap/simulated_ship/proc/decelerate(accel_limit)
	if ((!speed[1] && !speed[2]) || !can_burn())
		return
	last_burn = world.time
	var/delta = accel_limit ? min(get_burn_acceleration(), accel_limit) : get_burn_acceleration()
	var/mag = sqrt(speed[1] ** 2 + speed[2] ** 2)
	if (delta >= mag)
		adjust_speed(-speed[1], -speed[2])
	else
		adjust_speed(-(speed[1] * delta) / mag, -(speed[2] * delta) / mag)

/obj/overmap/simulated_ship/proc/accelerate(direction, accel_limit)
	if (!direction || !can_burn())
		return
	last_burn = world.time
	var/delta = accel_limit ? min(get_burn_acceleration(), accel_limit) : get_burn_acceleration()
	var/dx = (direction & EAST) ? 1 : ((direction & WEST) ? -1 : 0)
	var/dy = (direction & NORTH) ? 1 : ((direction & SOUTH) ? -1 : 0)
	if (dx && dy)
		dx *= 0.5
		dy *= 0.5
	adjust_speed(delta * dx, delta * dy)

/obj/overmap/simulated_ship/on_update_icon()
	pixel_x = position[1] * (world.icon_size/2)
	pixel_y = position[2] * (world.icon_size/2)
	if(!is_still())
		icon_state = moving_state
		dir = get_heading()
	else
		icon_state = initial(icon_state)
	..()

/obj/overmap/simulated_ship/proc/get_total_thrust()
	. += characteristic.max_speed

/obj/overmap/simulated_ship/proc/can_burn()
	if(halted)
		return 0
	if (world.time < last_burn + burn_delay)
		return 0
	if(prob(characteristic.reactor_damage) || prob(characteristic.engine_damage))
		return 0
	return 1

/obj/overmap/simulated_ship/proc/ETA()
	//deciseconds to next step
	. = INFINITY
	for(var/i = 1 to 2)
		if(MOVING(speed[i]))
			. = min(., ((speed[i] > 0 ? 1 : -1) - position[i]) / speed[i])
	. = max(ceil(.),0)

/obj/overmap/simulated_ship/proc/handle_wraparound()
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

/obj/overmap/simulated_ship/proc/halt()
	adjust_speed(-speed[1], -speed[2])
	halted = 1

/obj/overmap/simulated_ship/proc/unhalt()
	if(!SSshuttle.overmap_halted)
		halted = 0

/obj/overmap/simulated_ship/Bump(atom/A)
	if(istype(A,/turf/unsimulated/map/edge))
		handle_wraparound()
	..()

/obj/overmap/simulated_ship/Crossed(obj/overmap/visitable/O)
	. = ..()
	process_projectile(O)

/obj/overmap/simulated_ship/Cross(atom/movable/O)
	. = ..()
	process_projectile(O)

/obj/overmap/simulated_ship/proc/animate_damage()
	if(characteristic)
		if(characteristic.shield)
			var/obj/effect/impact_shield/shield = new /obj/effect/impact_shield(loc)
			animate(shield, 1 SECOND, alpha = 0)
			spawn(1 SECOND)
				qdel(shield)
		else
			animate(src, color = COLOR_RED, time = 0.5 SECOND, easing = CUBIC_EASING | EASE_IN)
			spawn(0.6 SECOND)
				animate(src, color = initial(color), time = 0.5 SECOND, easing = CUBIC_EASING | EASE_OUT)

/obj/overmap/simulated_ship/proc/process_projectile(atom/movable/O)
	// Bullets, rockets,
	if(istype(O, /obj/overmap/projectile))
		//log_and_message_admins("Was crossed by projectile [O.name]")
		var/obj/overmap/projectile/OO = O
		var/obj/item/projectile/bullet/huge_caliber/incoming_pew = OO.actual_projectile
		if(!incoming_pew)
			log_and_message_admins(SPAN_WARNING("<b> \[Simulated ship\] Корабль по координатам [x]-[y] получил пулю без содержимого. Хуйня, проверить почему!</i></b>"))
			qdel(OO)
			return

		if(incoming_pew.origin == src)
			return

		if(istype(incoming_pew.origin, /obj/overmap/simulated_ship))
			var/obj/overmap/simulated_ship/owner = incoming_pew.origin
			if(owner.characteristic)
				if(owner.characteristic.team == src.characteristic.team)
					return

		var/damage = incoming_pew.damage
		var/damage_type = incoming_pew.damage_type
		var/agony = incoming_pew.agony
		var/temperature = incoming_pew.temperature
		var/explosion_radius = incoming_pew.explosion_radius
		var/explosion_max_power = incoming_pew.explosion_max_power // Another name? WTF
		var/armor_penetration = incoming_pew.armor_penetration
		var/penetrating = incoming_pew.penetrating
		var/penetration_modifier = incoming_pew.penetration_modifier
		var/proximity_detonation = incoming_pew.proximity_detonation
		var/list/applied_damage = characteristic.calculate_damage(damage, damage_type, agony, temperature, explosion_radius, explosion_max_power, armor_penetration, penetrating, penetration_modifier, proximity_detonation)

		characteristic.apply_damage(arglist(applied_damage))
		src.animate_damage()
		//for(var/key in applied_damage)
		//	log_and_message_admins(applied_damage[key])
		//qdel(incoming_pew)
		QDEL_NULL(OO.actual_projectile)
		qdel(OO)
	else if(istype(O, /obj/overmap/missile))
		//log_and_message_admins("Was crossed by missle [O.name]")
		var/obj/overmap/missile/OO = O
		var/obj/structure/missile/incoming_boom = OO.actual_missile

		if(!incoming_boom)
			log_and_message_admins(SPAN_WARNING("<b> \[Simulated ship\] Корабль по координатам [x]-[y] получил ракету без ракеты. Хуйня, проверить почему!</i></b>"))
			qdel(OO)
			return

		var/list/applied_damage = null
		// Multiple equipments? TODO
		for(var/obj/item/missile_equipment/E in incoming_boom.equipment)
			switch(E.type)
				if(/obj/item/missile_equipment/payload/diffuser)
					applied_damage = characteristic.calculate_damage(\
					damage = 600,
					damage_type = SHIELD_DAMTYPE_EM,
					agony = 0,
					temperature = 0,
					explosion_radius = 0,
					explosion_max_power = EXPLOSION_POWER_SLIGHTLYHIGH,
					armor_penetration = 0,
					penetrating = 0,
					penetration_modifier = 0,
					proximity_detonation = FALSE)
				if(/obj/item/missile_equipment/payload/emp)
					applied_damage = characteristic.calculate_damage(\
					damage = 600,
					damage_type = DAMAGE_BURN,
					agony = 0,
					temperature = 0,
					explosion_radius = 5,
					explosion_max_power = EXPLOSION_POWER_SLIGHTLYHIGH,
					armor_penetration = 0,
					penetrating = 10,
					penetration_modifier = 1.5,
					proximity_detonation = TRUE)
				if(/obj/item/missile_equipment/payload/explosive)
					applied_damage = characteristic.calculate_damage(\
					damage = 400,
					damage_type = DAMAGE_BRUTE,
					agony = 0,
					temperature = 0,
					explosion_radius = 4,
					explosion_max_power = EXPLOSION_POWER_HIGH,
					armor_penetration = 0,
					penetrating = 5,
					penetration_modifier = 1.5,
					proximity_detonation = TRUE)
				if(/obj/item/missile_equipment/payload/nuclear)
					applied_damage = characteristic.calculate_damage(\
					damage = 50000,
					damage_type = DAMAGE_BRUTE,
					agony = 0,
					temperature = 0,
					explosion_radius = EXPLOSION_FALLOFF_VERYHIGH * 3,
					explosion_max_power = EXPLOSION_POWER_HIGH,
					armor_penetration = 0,
					penetrating = 0,
					penetration_modifier = 0,
					proximity_detonation = TRUE)
				if(/obj/item/missile_equipment/payload/big_nuclear)
					applied_damage = characteristic.calculate_damage(\
					damage = 500000,
					damage_type = DAMAGE_BRUTE,
					agony = 0,
					temperature = 0,
					explosion_radius = EXPLOSION_FALLOFF_VERYHIGH * 5,
					explosion_max_power = EXPLOSION_POWER_HIGH * 3,
					armor_penetration = 0,
					penetrating = 0,
					penetration_modifier = 0,
					proximity_detonation = TRUE)
				//if(/obj/item/missile_equipment/autoarm)
				//if(/obj/item/missile_equipment/thruster)
				//if(/obj/item/missile_equipment/thruster/hunter)
				//if(/obj/item/missile_equipment/thruster/point)
				//if(/obj/item/missile_equipment/thruster/planet)
				if(/obj/item/missile_equipment/passenger)
					var/obj/item/missile_equipment/passenger/deadly_psionic_missile = OO
					if(characteristic.vessel_size != SHIP_SIZE_LARGE)
						var/mob/content = deadly_psionic_missile.get_passenger()
						if(content)
							if(content.type == /mob/living/carbon/human)
								qdel(src)
								qdel(OO)
								return

		if(applied_damage)
			//for(var/key in applied_damage)
			//	log_and_message_admins(applied_damage[key])
			characteristic.apply_damage(arglist(applied_damage))
			src.animate_damage()
		else
			log_and_message_admins(SPAN_WARNING("<b> \[Simulated ship\] Корабль по координатам [x]-[y] получил ракету без компонентов. Хуйня, проверить почему!</i></b>"))
		qdel(OO)

// Does not work. Idk why, gonna search for it later
/* /obj/overmap/simulated_ship/get_scan_data(mob/user)
	. = ..()
	. += "<br>"
	. += "<br>Additional information:<br>[characteristic.get_additional_info()]"

/obj/overmap/simulated_ship/proc/get_additional_info()
	if(characteristic)
		return characteristic.get_additional_info()
	return "N/A" */

//Ship goes into event or something
/* /obj/overmap/simulated_ship/Entered(atom/movable/O, oldloc)
	. = ..()
	log_and_message_admins("Entered [O.name]")
/obj/overmap/simulated_ship/Bumped(AM)
	. = ..()
	log_and_message_admins(AM.name) */

/obj/overmap/simulated_ship/proc/move(turf/unsimulated/map/targeted_turf)
	src.dx = targeted_turf.x
	src.dy = targeted_turf.y

	var/accellimit = 0.01
	var/brake_path = src.get_brake_path() / HALF_UNIT_DIAGONAL //get_dist is steps, not hypotenuse
	var/direction = get_dir(src.loc, targeted_turf)
	var/acceleration = min(src.get_acceleration(), accellimit)
	var/speed = src.get_speed()
	var/heading = src.get_heading()

	// Destination is current grid or speedlimit is exceeded
	if ((get_dist(src.loc, targeted_turf) <= brake_path) || speed > characteristic.max_speed)
		src.decelerate(accellimit)
	// Heading does not match direction
	else if (heading & ~direction)
		src.accelerate(turn(heading & ~direction, 180), accellimit)
	// All other cases, move toward direction
	else if (speed + acceleration <= characteristic.max_speed)
		src.accelerate(direction, accellimit)
	//src.accelerate(get_dir(src, targeted_turf), 0.01)
	//walk_towards(src, targeted_turf, characteristic.characteristic.max_speed, characteristic.characteristic.max_speed)

/obj/overmap/simulated_ship/proc/stop()
	var/accellimit = 0.01 // 10 in helm
	src.decelerate(accellimit)

/obj/overmap/simulated_ship/proc/flee(turf/unsimulated/map/targeted_turf)
	var/accellimit = 0.01
	src.dx = targeted_turf.x
	src.dy = targeted_turf.y
	src.accelerate(reverse_direction(get_dir(src, targeted_turf)), accellimit)
	//walk_away(src, targeted_turf, characteristic.sensors_range, characteristic.characteristic.max_speed, characteristic.characteristic.max_speed)

/obj/overmap/simulated_ship/proc/shoot(obj/overmap/targeted_object)
	if(world.time < last_shot_time + characteristic.cooldown_beetween_shots)
		return
	var/list/all_ready_cannons = characteristic.get_all_ready_to_fire_cannon()
	if(all_ready_cannons.len == 0)
		return

	var/selected_cannon = pick(all_ready_cannons)

	last_shot_time = world.time

	if(prob(characteristic.reactor_damage) || prob(characteristic.cannons[selected_cannon]["damage"]))
		return

	// TODO
	if(characteristic.cannons[selected_cannon]["type"] == /obj/machinery/computer/ship/ship_weapon/harpoon_gun)
		return

	if(characteristic.cannons[selected_cannon]["type"] == /obj/machinery/computer/ship/ship_weapon/beam_cannon/particle_lance)
		if(get_dist(get_turf(src), get_turf(targeted_object)) < 3) // Must be 2 tiles of empty space beetwen us and target
			var/obj/machinery/computer/ship/ship_weapon/beam_cannon/particle_lance/selected_fake_lance = new /obj/machinery/computer/ship/ship_weapon/beam_cannon/particle_lance()
			var/obj/machinery/ship_weapon/front_part/new_front_part = new /obj/machinery/ship_weapon/front_part()
			//characteristic.cannons[selected_cannon]["type"]
			selected_fake_lance.linked = src
			selected_fake_lance.front = new_front_part
			var/obj/overmap/visitable/ship/O = targeted_object

			// Doctor Alex: It's probably the worst idea i've got, replace it in future
			var/obj/effect/projectile_lance/lance = new /obj/effect/projectile_lance(loc)
			lance.transform = matrix().Update(rotation = dir2angle(get_dir(src, O)) + 15)
			animate(lance, transform = matrix(dir2angle(get_dir(src, O)) - 15, MATRIX_ROTATE), time = 1 SECONDS, easing = SINE_EASING | EASE_OUT)
			spawn(0.8 SECOND)
				animate(lance, 0.5 SECOND, alpha = 0)

			var/picked_level = pick(O.map_z)

			log_and_message_admins(picked_level)
			log_and_message_admins(O.fore_dir)
			log_and_message_admins(O)

			for(var/mob/M in GLOB.player_list)
				if(M.z == picked_level)
					to_chat(M, "<span style='color:red; font-size: 20px;'>Вы чувствуете, как пол под вами начинает дрожать...</span>")
			sleep(1 SECOND)
			selected_fake_lance.fire_at_sector(picked_level, O.fore_dir, O, FALSE)
			selected_fake_lance.linked = null
			qdel(selected_fake_lance)
			characteristic.cannons[selected_cannon]["cooldown"] = characteristic.cannons[selected_cannon]["max_cooldown"]
		return

	if(characteristic.cannons[selected_cannon]["type"] == /obj/machinery/computer/ship/ship_weapon/beam_cannon)
		if(get_dist(get_turf(src), get_turf(targeted_object)) < 3) // Must be 2 tiles of empty space beetwen us and target
			var/obj/machinery/computer/ship/ship_weapon/beam_cannon/selected_fake_beam = new /obj/machinery/computer/ship/ship_weapon/beam_cannon()
			var/obj/machinery/ship_weapon/front_part/new_front_part = new /obj/machinery/ship_weapon/front_part()
			//characteristic.cannons[selected_cannon]["type"]
			selected_fake_beam.linked = src
			selected_fake_beam.front = new_front_part
			var/obj/overmap/visitable/ship/O = targeted_object

			// TODO: change to beam texture
			var/obj/effect/projectile_lance/lance = new /obj/effect/projectile_lance(loc)
			lance.transform = matrix().Update(rotation = dir2angle(get_dir(src, O)) + 15)
			animate(lance, transform = matrix(dir2angle(get_dir(src, O)) - 15, MATRIX_ROTATE), time = 1 SECONDS, easing = SINE_EASING | EASE_OUT)
			spawn(0.8 SECOND)
				animate(lance, 0.5 SECOND, alpha = 0)

			selected_fake_beam.fire_at_sector(pick(O.map_z), O.fore_dir, O, FALSE)
			selected_fake_beam.linked = null
			qdel(selected_fake_beam)
			characteristic.cannons[selected_cannon]["cooldown"] = characteristic.cannons[selected_cannon]["max_cooldown"]
		return

	//for(var/i = 1; i <= characteristic.get_weapon_burst_size(characteristic.cannons[selected_cannon]["type"]); i++)
	for(var/i in 1 to characteristic.get_weapon_burst_size(characteristic.cannons[selected_cannon]["type"]))
		// Fuck this, gonna do it right now. TODO: change fucking everything
		var/list/random_ammo_box_key = pick(characteristic.ammo)
		var/obj/item/ammo_magazine/ammobox/random_ammo_box_entry = characteristic.ammo[random_ammo_box_key]["type"]

		var/obj/item/ammo_casing/huge_caliber/projectile_type = characteristic.get_projectile_type(random_ammo_box_entry)
		var/obj/item/projectile/bullet/huge_caliber/pew = new projectile_type(src.loc)
		pew.starting = src.loc
		pew.origin = src
		pew.cal_accuracy = characteristic.cannons[selected_cannon]["accurace"]
		pew.overmapdir = get_dir(src, targeted_object)
		//pew.launch(get_step(src.loc, get_dir(src, targeted_object)), pick(BP_ALL_LIMBS))
		pew.entered_overmap = TRUE
		//var/obj/overmap/source = map_sectors["[z]"]
		pew.overmap_projectile = new /obj/overmap/projectile(null, src.x, src.y)
		pew.overmap_projectile.SetName("[src.name+"'s"] [pew.name]")
		pew.overmap_projectile.set_projectile(pew, pew.cal_accuracy)
		//overmap_projectile.color = overmap_color
	characteristic.cannons[selected_cannon]["cooldown"] = characteristic.cannons[selected_cannon]["max_cooldown"]

// ebeam compatibility(kind of)
// this is junk, literally and physically

/obj/overmap/simulated_ship/proc/handle_ebeam()
// should we even calculate damage, if this thing basically one-tap's ships lower than destroyer? i mean, maybe?
	if(characteristic.max_health <= 100000) // frigate health
		animate_damage()
		spawn(2 SECOND)
			qdel(src)
	var/damage = 5000 //idk this thing just cost too much, so it would be fair if it will have some actual damage, fully deleted destroyer shields on tests
	var/damage_type = DAMAGE_BURN

	var/armor_penetration = 100
	var/penetrating = TRUE
	var/penetration_modifier = 1.5

// we do not need this here, but proc does and i dunno if i can simply remove 'em
	var/agony = 0
	var/explosion_radius = 0
	var/explosion_max_power = 0
	var/proximity_detonation = FALSE

	var/list/applied_damage = characteristic.calculate_damage(damage, damage_type, agony, temperature, explosion_radius, explosion_max_power, armor_penetration, penetrating, penetration_modifier, proximity_detonation)
	characteristic.apply_damage(arglist(applied_damage))

#undef MOVING
#undef SANITIZE_SPEED
#undef CHANGE_SPEED_BY
