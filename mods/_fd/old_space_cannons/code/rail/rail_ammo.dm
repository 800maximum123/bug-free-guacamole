#define CALIBER_SHIP_RAILGUN "uranium rod"

/obj/item/ammo_magazine/ammobox/railgun
	name = "compressed uranium rods box"
	desc = "Ammo box that contains compressed railgun rods."
	icon_state = "ammocrate_autocannon1"
	caliber = CALIBER_SHIP_RAILGUN
	max_ammo = 30
	ammo_type = /obj/item/ammo_casing/huge_caliber/railgun

/obj/item/ammo_magazine/ammobox/railgun/ex_act(severity)
	return

/obj/item/ammo_casing/huge_caliber/railgun
	name = "giant compressed rods casing"
	desc = "A railgun charge casing."
	caliber = CALIBER_SHIP_RAILGUN
	projectile_type = /obj/item/projectile/bullet/huge_caliber/railgun

/obj/item/projectile/bullet/huge_caliber/railgun
	name = "giant uranium rod"
	icon_state = "rod"
	transform_scale = 4
	damage = CANNON_DMGS_VERYHIGH
	armor_penetration = 100
	penetrating = 8
	penetration_modifier = 1.5
	shoot_range = 4
	pew_spread = 10

	canhit_missiles = FALSE

	should_explode = FALSE

/obj/item/projectile/bullet/huge_caliber/railgun/Bump(atom/A as mob|obj|turf|area, forced=0)
	if(istype(A, /turf/simulated/wall))
		var/turf/simulated/wall/T = A
		if(T.health_current <= 600)
			qdel(T)

	if(istype(A, /obj/machinery/door/airlock))
		var/obj/machinery/door/airlock/O = A
		if(O.health_current <= O.health_max / 2)
			O.Destroy()
	..()

#undef CALIBER_SHIP_RAILGUN
