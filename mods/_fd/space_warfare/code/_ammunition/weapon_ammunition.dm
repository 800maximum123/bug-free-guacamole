/*////////////////////////////////
//          AMMO CASING         //
*/////////////////////////////////

/obj/item/ammo_casing/space_weapon
	icon_state = "lcasing"
	caliber = ".50 cal" // placeholder, gotta think of something better
	projectile_type = /obj/item/projectile/bullet/space_weapon
	matter = list(MATERIAL_STEEL = 300)

/obj/item/ammo_casing/space_weapon/expend()
	. = ..()
	var/obj/machinery/space_weapon/weapon = loc
	weapon.ammo -= src
	dropInto(get_turf(src))
	throw_at(get_ranged_target_turf(get_turf(src), turn(loc.dir, 180), 2), rand(1,2), 5)
