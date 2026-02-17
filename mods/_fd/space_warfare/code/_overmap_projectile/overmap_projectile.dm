/obj/overmap/space_projectile
	name = "projectile"
	icon = 'mods/_fd/space_warfare/icons/overmap.dmi'
	icon_state = "small_bullet"
	color = COLOR_AMBER

	// Projectiles are instantly visible.
	requires_contact = FALSE // REMOVE FOR BACKPORT TO OLD/NON-NEBULA OVERMAP
	instant_contact = TRUE // REMOVE FOR BACKPORT TO OLD/NON-NEBULA OVERMAP

	var/base_spread = 5
	var/base_speed = 2 PPS

	var/list/hit_coords = list(100,100)

	/// Type of projectile that we will summon upon hitting our target
	var/projectile_type

	/// Source sector reference
	var/obj/overmap/home_sector

	/// Projectile bitflags
	var/sw_flags = SW_FLAG_HIT_SECTOR|SW_FLAG_HIT_SHIP

/obj/overmap/space_projectile/Initialize()
	. = ..()
	glide_size = world.icon_size
	min_speed = round(min_speed, SHIP_MOVE_RESOLUTION)
	max_speed = round(max_speed, SHIP_MOVE_RESOLUTION)
	START_PROCESSING(SSobj, src)

/obj/overmap/space_projectile/proc/handle_collisions()
	for(var/zlevel in map_sectors)
		var/obj/overmap/visitable/target = map_sectors[zlevel]
		if(target.z != z)
			continue // Wrong plane of existance

		if(target == home_sector)
			continue // Why shoot yourself?

		var/distance = get_dist(target, src)
		if(distance > 1)
			continue

		var/x_dist = abs(target.pixel_x - pixel_x)
		var/y_dist = abs(target.pixel_y - pixel_y)

		if(distance > 0)
			var/list/offsets = get_pixel_offsets(get_dir(src, target))
			x_dist = abs(x_dist + offsets[1])
			y_dist = abs(y_dist + offsets[2])

		var/hitbox = target.hitbox_radius
		if(hitbox < x_dist || hitbox < y_dist)
			continue

		if(target.projectile_act(src))
			qdel(src)
			return TRUE

	return FALSE

/proc/get_pixel_offsets(direction)
	var/list/offsets = list(0,0) // x,y
	var/amount = world.icon_size
	if(direction & NORTH)
		offsets[2] = -amount
	if(direction & SOUTH)
		offsets[2] = amount
	if(direction & EAST)
		offsets[1] = -amount
	if(direction & WEST)
		offsets[1] = amount

	return offsets
