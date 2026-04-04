//EW CRAFT: disrupts craft and screens
//faster & more accurate than nightbat but less health
/obj/overmap/simulated_ship/iccgn/fighter_wardriver
	name = "F/SP-M Wardriver Mk.I"
	desc = "A small EW craft designed to support attacks on enemy squadrons and screening ships alike. IFF broadcasts ICCGN codes."
	icon_state = "wardriver"
	moving_state = "wardriver"
	characteristic = new /datum/ship_characteristic/iccgn/fighter_wardriver()

/datum/ship_characteristic/iccgn/fighter_wardriver
	max_health = 220 //18k initial
	max_shield = 0
	shield_regen_speed = 4 *(1 SECOND)
	vessel_mass = 8000
	vessel_size = SHIP_SIZE_TINY
	max_speed = 12*(3 SECOND) //360
	min_targeted_distance_to_target = 1
	max_targeted_distance_to_target = 1
	sensors_range = 10

/datum/ship_characteristic/iccgn/fighter_wardriver/New()
	cannons = list(
		"disruptor_1" = list("type" = /obj/machinery/computer/ship/ship_weapon/disruptor, "accurace" = 100, "damage" = 0),
		"disruptor_2" = list("type" = /obj/machinery/computer/ship/ship_weapon/disruptor, "accurace" = 100, "damage" = 0)
	)

	ammo = list(
		"disruptor_ammo" = list("type" = /obj/item/ammo_magazine/ammobox/disruptor, "ammount" = 16),
	)

	..()