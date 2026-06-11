//DRONE: weak chaff enemy
/obj/overmap/simulated_ship/iccgn/drone_hmg
	name = "D/F-S Chaffee drone"
	desc = "A tiny unmanned drone, weak and fast, often used in swarms to overwhelm foes. IFF broadcasts ICCGN codes."
	icon = 'mods/_fd/ai_overmap_objects/icons/scg/sfv32.dmi'
	icon_state = "drone"
	moving_state = "drone_moving"
	characteristic = new /datum/ship_characteristic/iccgn/drone_hmg()

/datum/ship_characteristic/iccgn/drone_hmg
	max_health = 100 //8k initial
	max_shield = 0
	shield_regen_speed = 7 *(1 SECOND)
	vessel_mass = 5000
	vessel_size = SHIP_SIZE_TINY
	max_speed = 5*(3 SECOND) //150
	min_targeted_distance_to_target = 1
	max_targeted_distance_to_target = 1
	sensors_range = 4

/datum/ship_characteristic/iccgn/drone_hmg/New()
	cannons = list(
		"hmg_1" = list("type" = /obj/machinery/computer/ship/ship_weapon/hmg, "accurace" = 90, "damage" = 0),
	)

	ammo = list(
		"hmg_ammo" = list("type" = /obj/item/ammo_magazine/ammobox/hmg, "ammount" = 6)
	)

	..()
