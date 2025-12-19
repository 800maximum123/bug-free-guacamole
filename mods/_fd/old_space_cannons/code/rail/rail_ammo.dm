#define CALIBER_SHIP_RAILGUN "uranium rod"

/obj/item/ammo_magazine/ammobox/railgun
	name = "compressed uranium rods box"
	desc = "Ammo box that contains compressed railgun rods."
	icon_state = "ammocrate_autocannon1"
	caliber = CALIBER_SHIP_RAILGUN
	max_ammo = 3
	ammo_type = /obj/item/ammo_casing/huge_caliber/railgun

/obj/item/ammo_magazine/ammobox/railgun/ex_act(severity)
	return

/obj/item/ammo_magazine/ammobox/railgun/Initialize()
	. = ..()
	SSradiation.radiate(src,3)

/obj/item/ammo_casing/huge_caliber/railgun
	name = "giant compressed rods casing"
	desc = "A railgun charge casing."
	caliber = CALIBER_SHIP_RAILGUN
	projectile_type = /obj/item/projectile/bullet/huge_caliber/railgun

/obj/item/projectile/bullet/huge_caliber/railgun
	name = "giant uranium rod"
	icon_state = "rod"
	transform_scale = 4
	damage = CANNON_DMG_HIGH
	armor_penetration = 100
	penetrating = 8
	penetration_modifier = 1.5
	shoot_range = 4
	pew_spread = 1

	canhit_missiles = FALSE

	var/railgun_wall_type = /turf/simulated/wall/uranium

	should_explode = FALSE

/obj/item/projectile/bullet/huge_caliber/railgun/enter_sector(z_level, target_fore_dir, obj/overmap/target)
	set waitfor = FALSE

	var/heading = overmap_projectile.walk_direction

	if(!heading)
		heading = pick(GLOB.cardinal)

	var/actual_spread = pew_spread / 2

	var/obj/overmap/visitable/ship/target_ship = target
	if(istype(target_ship, /obj/overmap/visitable/ship))
		actual_spread = (target_ship.get_helm_skill()+1) / 2 * (pew_spread/2)

		if(target_ship.is_still() || target_ship.get_speed() <= SHIP_SPEED_SLOW)
			actual_spread = pew_spread / 2

	var/start_x = floor(world.maxx / 2) + round( rand(-actual_spread, actual_spread) )
	var/start_y = floor(world.maxy / 2) + round( rand(-actual_spread, actual_spread) )

	//Normalize killing people :D
	if(heading in GLOB.cornerdirs)
		if(heading == NORTHEAST)
			heading = pick(NORTH, EAST)
		if(heading == NORTHWEST)
			heading = pick(NORTH, WEST)
		if(heading == SOUTHEAST)
			heading = pick(SOUTH, EAST)
		if(heading == SOUTHWEST)
			heading = pick(SOUTH, WEST)

	if(target.dir in GLOB.cornerdirs)
		if(target.dir == NORTHEAST)
			target.dir = pick(NORTH, EAST)
		if(target.dir == NORTHWEST)
			target.dir = pick(NORTH, WEST)
		if(target.dir == SOUTHEAST)
			target.dir = pick(SOUTH, EAST)
		if(target.dir == SOUTHWEST)
			target.dir = pick(SOUTH, WEST)

	if(heading == target.dir)
		if(target_fore_dir == NORTH)
			start_y = TRANSITIONEDGE + 2
			heading = NORTH
		else if(target_fore_dir == SOUTH)
			start_y = world.maxy - TRANSITIONEDGE - 2
			heading = SOUTH
		else if(target_fore_dir == WEST)
			start_x = world.maxx - TRANSITIONEDGE - 2
			heading = WEST
		else
			start_x = TRANSITIONEDGE + 2
			heading = EAST

	else if(heading == GLOB.reverse_dir[target.dir])
		if(target_fore_dir == NORTH)
			start_y = world.maxy - TRANSITIONEDGE - 2
			heading = SOUTH
		else if(target_fore_dir == SOUTH)
			start_y = TRANSITIONEDGE + 2
			heading = NORTH
		else if(target_fore_dir == WEST)
			start_x = TRANSITIONEDGE + 2
			heading = EAST
		else
			start_x = world.maxx - TRANSITIONEDGE - 2
			heading = WEST

	else if(heading == GLOB.cw_dir[target.dir])
		if(target_fore_dir == NORTH)
			start_x = TRANSITIONEDGE + 2
			heading = EAST
		else if(target_fore_dir == SOUTH)
			start_x = world.maxx - TRANSITIONEDGE - 2
			heading = WEST
		else if(target_fore_dir == WEST)
			start_y = TRANSITIONEDGE + 2
			heading = NORTH
		else
			start_y = world.maxy - TRANSITIONEDGE - 2
			heading = SOUTH

	else if(heading == GLOB.ccw_dir[target.dir])
		if(target_fore_dir == NORTH)
			start_x = world.maxx - TRANSITIONEDGE - 2
			heading = WEST
		else if(target_fore_dir == SOUTH)
			start_x = TRANSITIONEDGE + 2
			heading = EAST
		else if(target_fore_dir == WEST)
			start_y = world.maxy - TRANSITIONEDGE - 2
			heading = SOUTH
		else
			start_y = TRANSITIONEDGE + 2
			heading = NORTH

	var/turf/start = locate(start_x, start_y, z_level)

	var/hit = FALSE
	for(var/turf/T in getline(start,get_edge_turf(start,heading)))
		ex_act(3)
		for(var/atom/A in T)
			if(!istype(A, /obj/item/projectile) && (!istype(A, /obj/effect) || istype(A, /obj/shield)))
				A.ex_act(1)
		if(T.density)
			cell_explosion(T, EXPLOSION_POWER_LOW, EXPLOSION_FALLOFF_HIGH, shrapnel = FALSE)
			new railgun_wall_type(T)
			new railgun_wall_type(get_step(T,heading))
			new railgun_wall_type(get_step(T,turn(heading,180)))
			new railgun_wall_type(get_step(get_step(T,turn(heading,180)),heading))

			hit = TRUE
			log_and_message_admins("[name] попал в [target.name] на Z [z_level] (<A HREF='?_src_=holder;adminplayerobservecoodjump=1;X=[target.x];Y=[target.y];Z=[target.z]'>MAP</a>)", location=T)

			break


	if(!hit)
		overmap_projectile.Destroy()
		return TRUE

	for(var/mob/M in GLOB.player_list)
		var/turf/T = get_turf(M)
		if(!T || !(T.z in GetConnectedZlevels(start.z)))
			continue
		shake_camera(M, 20)
		if(!isdeaf(M))
			sound_to(M, sound('mods/_fd/old_space_cannons/sounds/harpoon_creak_thud.ogg', volume=80))

	if(overmap_projectile)
		overmap_projectile.Destroy()

	return TRUE

/obj/item/projectile/bullet/huge_caliber/railgun/enter_exoplanet(z_level, obj/overmap/target)
	enter_sector(z_level, NORTH, target)
	return TRUE
