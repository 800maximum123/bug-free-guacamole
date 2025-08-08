
/*////////////////////////////////
//          VISITABLE           //
*/////////////////////////////////
/obj/overmap/visitable
	dir = NORTH
	var/hitbox_radius = 8

/obj/overmap/visitable/proc/projectile_act(obj/overmap/space_projectile/projectile)
	set waitfor = FALSE

	handle_hit_spread(projectile, projectile.base_spread)
	var/list/hit_coords = projectile.hit_coords.Copy()

	var/relative_direction = get_relative_direction(projectile.dir)

	var/turf/target_turf = locate(hit_coords[1], hit_coords[2], pick(map_z))
	var/reversed_dir = GLOB.reverse_dir[relative_direction]

	var/turf/start = get_edge_target_turf(target_turf, reversed_dir)
	for(var/i=1 ; i<TRANSITIONEDGE ; i++)
		start = get_step(start, relative_direction)

	spawn(rand(0,5))
		var/obj/item/projectile/bullet = new projectile.projectile_type(start)
		bullet.silenced = TRUE // Removes muzzle flash
		bullet.launch(target_turf)
	return TRUE // Returning TRUE means we actually hit a target, and unlike FALSE - we are deleting this projectile entirely

/obj/overmap/visitable/proc/get_relative_direction(projectile_dir)
	return turn(projectile_dir, dir2angle(dir))

/obj/overmap/visitable/proc/handle_hit_spread(obj/overmap/space_projectile/projectile, dispersion)
	for(var/i ; i < LAZYLEN(projectile.hit_coords) ; i++)
		projectile.hit_coords[i] += rand(-dispersion, dispersion)
		projectile.hit_coords[i] = clamp(projectile.hit_coords[i], SW_MIN_COORD, SW_MAX_COORD)


/*////////////////////////////////
//             SHIPS            //
*/////////////////////////////////

/obj/overmap/visitable/ship/Initialize()
	. = ..()
	dir = fore_dir

/obj/overmap/visitable/ship/projectile_act(obj/overmap/space_projectile/projectile)
	if(!(projectile.sw_flags & SW_FLAG_HIT_SHIP))
		return FALSE
	return ..()

/obj/overmap/visitable/ship/get_relative_direction(projectile_dir)
	return turn(projectile_dir, dir2angle(dir) - dir2angle(fore_dir))

/obj/overmap/visitable/ship/handle_hit_spread(obj/overmap/space_projectile/projectile, dispersion)
	/// TODO: Target's high speed impacts projectile dispersion
	..()


/*////////////////////////////////
//           SHUTTLES           //
*/////////////////////////////////
/obj/overmap/visitable/ship/landable
	hitbox_radius = 3


/*////////////////////////////////
//            SECTORS           //
*/////////////////////////////////
/obj/overmap/visitable/sector/projectile_act(obj/overmap/space_projectile/projectile)
	if(!(projectile.sw_flags & SW_FLAG_HIT_SECTOR))
		return FALSE
	return ..()


/*////////////////////////////////
//          EXOPLANETS          //
*/////////////////////////////////
/obj/overmap/visitable/sector/exoplanet
	hitbox_radius = 16

/obj/overmap/visitable/sector/exoplanet/projectile_act(obj/overmap/space_projectile/projectile)
	if(!(projectile.sw_flags & SW_FLAG_HIT_PLANET))
		return FALSE

	handle_hit_spread(projectile, projectile.base_spread)
	var/list/hit_coords = projectile.hit_coords.Copy()

	var/turf/start = locate(hit_coords[1], hit_coords[2], pick(map_z))
	var/turf/target_turf = get_step_rand(start)

	spawn(rand(0,10)) // random delay between 0 and 1 second
		var/obj/item/projectile/bullet = new projectile.projectile_type(start)
		bullet.silenced = TRUE // Removes muzzle effect
		bullet.launch(target_turf)
	return TRUE


/*////////////////////////////////
//         PLACEHOLDERS         //
*/////////////////////////////////
/obj/overmap/visitable/placeholder/projectile_act(obj/overmap/space_projectile/projectile)
	return TRUE // ohhh nooo we are hit (actually just eats our projectile)
