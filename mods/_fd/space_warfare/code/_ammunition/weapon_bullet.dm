/*////////////////////////////////
//           BIG LEAD           //
*/////////////////////////////////

/obj/item/projectile/bullet/space_weapon
	icon_state = "bullet"
	icon = 'mods/_fd/space_warfare/icons/ammo.dmi'
	distance_falloff = 0 // Highly precise on distance. Also wide
	step_delay = 0.5     // Fast as heck boii
	life_span = 200      // So we can survive before bumping into world edge
	damage = 100

	var/list/hit_coords = list(100,100)

	/// Type of overmap object that we will release onto overmap after leaving our Z-level
	var/overmap_projectile_type = /obj/overmap/space_projectile

	/// Direction in which our overmap representation will move. Set on creation by fire() proc arg
	var/overmap_direction

/obj/item/projectile/bullet/space_weapon/touch_map_edge()
	if(!overmap_direction)
		qdel(src)
		return // If we want to avoid entering overmap - just leave overmap_direction a zero

	var/obj/overmap/visitable/home_sector = map_sectors["[z]"]

	if(istype(home_sector, /obj/overmap/visitable/sector/exoplanet))
		qdel(src)
		return // No escape velocity?? :sob:

	var/obj/overmap/space_projectile/ref = new overmap_projectile_type(home_sector.loc)
	ref.projectile_type = type
	ref.home_sector = home_sector
	if(hit_coords)
		ref.hit_coords = hit_coords.Copy()

	var/dispersion = home_sector.hitbox_radius / 3
	if(istype(home_sector, /obj/overmap/visitable/ship))
		var/obj/overmap/visitable/ship/home_ship = home_sector

		ref.speed[1] = home_ship.speed[1]
		ref.speed[2] = home_ship.speed[2]

		ref.position[1] = home_ship.position[1] + rand(-dispersion, dispersion) / (world.icon_size/2)
		ref.position[2] = home_ship.position[2] + rand(-dispersion, dispersion) / (world.icon_size/2)

	else
		ref.position[1] = pixels_to_pos(home_sector.pixel_x) + rand(-dispersion, dispersion) / (world.icon_size/2)
		ref.position[2] = pixels_to_pos(home_sector.pixel_y) + rand(-dispersion, dispersion) / (world.icon_size/2)

	ref.Process()
	ref.accelerate(ref.base_speed, overmap_direction)

	qdel(src)
