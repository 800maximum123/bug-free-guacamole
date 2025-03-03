#define CALIBER_SHIP_AUTOCANNON    "105mmRP"

///////////////////////////AMMOBOX///////////////////////////

/obj/item/ammo_magazine/ammobox/autocannon
	name = "ammo box"
	desc = "Ammo box that contains solid 105mm rocket-propelled rounds."
	caliber = CALIBER_SHIP_AUTOCANNON
	max_ammo = 60
	ammo_type = /obj/item/ammo_casing/huge_caliber/autocannon

/obj/item/ammo_magazine/ammobox/autocannon/high_explosive
	name = "HE ammo box"
	icon_state = "ammocrate_autocannon_he"
	desc = "Ammo box that contains 105mm rocket-propelled high explosive rounds."
	ammo_type = /obj/item/ammo_casing/huge_caliber/autocannon/high_explosive

/obj/item/ammo_magazine/ammobox/autocannon/armour_piercing
	name = "APFSDS ammo box"
	icon_state = "ammocrate_autocannon_ap"
	desc = "Ammo box that contains 105mm rocket-propelled armour-piercing fin-stabilized discarding sabot."
	ammo_type = /obj/item/ammo_casing/huge_caliber/autocannon/armour_piercing

/obj/item/ammo_magazine/ammobox/autocannon/anti_hull
	name = "AH ammo box"
	icon_state = "ammocrate_autocannon_ah"
	desc = "Ammo box that contains 105mm rocket-propelled anti-hull rounds."
	ammo_type = /obj/item/ammo_casing/huge_caliber/autocannon/anti_hull

/obj/item/ammo_magazine/ammobox/autocannon/aphe
	name = "APHE ammo box"
	icon_state = "ammocrate_autocannon_aphe"
	desc = "Ammo box that contains 105mm rocket-propelled armour-piercing high explosive rounds."
	ammo_type = /obj/item/ammo_casing/huge_caliber/autocannon/aphe

///////////////////////////CASING///////////////////////////

/obj/item/ammo_casing/huge_caliber/autocannon
	name = "autocannon casing"
	desc = "A rocket-propelled autocannon round casing."
	caliber = CALIBER_SHIP_AUTOCANNON
	projectile_type = /obj/item/projectile/bullet/huge_caliber/autocannon

/obj/item/ammo_casing/huge_caliber/autocannon/high_explosive
	projectile_type = /obj/item/projectile/bullet/huge_caliber/autocannon/high_explosive

/obj/item/ammo_casing/huge_caliber/autocannon/anti_hull
	projectile_type = /obj/item/projectile/bullet/huge_caliber/autocannon/anti_hull

/obj/item/ammo_casing/huge_caliber/autocannon/armour_piercing
	projectile_type = /obj/item/projectile/bullet/huge_caliber/autocannon/armour_piercing

/obj/item/ammo_casing/huge_caliber/autocannon/aphe
	projectile_type = /obj/item/projectile/bullet/huge_caliber/autocannon/aphe

///////////////////////////BULLETS///////////////////////////

/obj/item/projectile/bullet/huge_caliber/autocannon
	name ="autocannon bolt"
	damage = CANNON_DMGS_VERYHIGH
	pew_spread = 10
	var/destroying_walls = TRUE
	should_explode = FALSE

/obj/item/projectile/bullet/huge_caliber/autocannon/Bump(atom/A as mob|obj|turf|area, forced=0)

	if(istype(A, /turf/simulated/wall) && destroying_walls)
		var/turf/simulated/wall/T = A
		if(T.health_current <= 600)
// Если стена имеет меньше 600 хп - сносим её нахуй, ещё и шрапнельки накидываем
			if(!exploded)
				exploded = TRUE
				fragmentate(get_turf(src), rand(10,20), 3, list(/obj/item/projectile/bullet/pellet/fragment), name)
				T.ChangeTurf(/turf/simulated/floor/plating)
				spawn(1 SECOND)
					qdel(src)

	..()

/obj/item/projectile/bullet/huge_caliber/autocannon/high_explosive
	should_explode = TRUE
	destroying_walls = FALSE

	explosion_radius = EXPLOSION_FALLOFF_VERYHIGH
	explosion_max_power = EXPLOSION_POWER_HIGH

/obj/item/projectile/bullet/huge_caliber/autocannon/anti_hull
	should_explode = TRUE
	destroying_walls = FALSE

	armor_penetration = 60
	explosion_radius = EXPLOSION_FALLOFF_MEDIUM
	explosion_max_power = EXPLOSION_POWER_SLIGHTLYHIGH
	proximity_detonation = FALSE

/obj/item/projectile/bullet/huge_caliber/autocannon/armour_piercing
	destroying_walls = FALSE // Дабы не конфликтовать с мамой

	damage = CANNON_DMG_HIGH // Урон чуть меньше, чем у обычных снарядов. Небольшая цена за пробивную способность
	armor_penetration = 100
	penetrating = 6
	penetration_modifier = 1.1

/obj/item/projectile/bullet/huge_caliber/autocannon/armour_piercing/Bump(atom/A as mob|obj|turf|area, forced=0)

	if(istype(A, /turf/simulated/wall))
		var/turf/simulated/wall/T = A
		if(T.health_current <= 900)
// Если стена имеет меньше 900 хп - сносим её нахуй, ещё и шрапнельки накидываем
			if(!exploded)
				exploded = TRUE
				fragmentate(get_turf(src), rand(10,20), 3, list(/obj/item/projectile/bullet/pellet/fragment), name)
				T.ChangeTurf(/turf/simulated/floor/plating)
				spawn(1 SECOND)
					qdel(src)

	..()

/obj/item/projectile/bullet/huge_caliber/autocannon/aphe
	damage = CANNON_DMG_HIGH
	armor_penetration = 100
	penetrating = 10
	penetration_modifier = 1.1
	proximity_detonation = FALSE
	explosion_radius = EXPLOSION_FALLOFF_LOW
	explosion_max_power = EXPLOSION_POWER_SLIGHTLYHIGH

	should_explode = TRUE
	destroying_walls = FALSE

	var/exploded_inwall = FALSE
	var/delay = 4

/obj/item/projectile/bullet/huge_caliber/autocannon/aphe/Bump(atom/A as mob|obj|turf|area, forced=0)
	..()

	if(exploded)
		return

	exploded = TRUE
	if(istype(A,/obj/shield))
		cell_explosion(get_turf(A), explosion_max_power, explosion_radius)
		qdel(src)
		return

	sleep(delay)

	if(src && !exploded_inwall)
		cell_explosion(get_turf(src), explosion_max_power, explosion_radius)
		qdel(src)


/obj/item/projectile/bullet/huge_caliber/autocannon/aphe/Destroy()
	if(src && !exploded_inwall && !istype(loc,/atom/movable))
		exploded = TRUE
		exploded_inwall = TRUE
		invoke_async(src, PROC_REF(cell_explosion), get_turf(src), explosion_max_power, explosion_radius)
	..()

#undef CALIBER_SHIP_AUTOCANNON
