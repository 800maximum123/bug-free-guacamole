//FIGHTER: armed with MGs to take down enemy fighters
//faster than spear but less health and ammo
/obj/overmap/simulated_ship/iccgn/fighter_krechet
	name = "F-B Krechet Mk.II"
	desc = "A small space superiority fighter, intended to take down small craft. IFF broadcasts ICCGN codes."
	icon_state = "krechet"
	moving_state = "krechet"
	characteristic = new /datum/ship_characteristic/iccgn/fighter_krechet()

/datum/ship_characteristic/iccgn/fighter_krechet
	max_health = 200 //16k initial
	max_shield = 0
	shield_regen_speed = 4 *(1 SECOND)
	vessel_mass = 7500
	vessel_size = SHIP_SIZE_TINY
	max_speed = 10*(3 SECOND) //300
	min_targeted_distance_to_target = 1
	max_targeted_distance_to_target = 1
	sensors_range = 10

/datum/ship_characteristic/iccgn/fighter_krechet/New()
	cannons = list(
		"hmg_1" = list("type" = /obj/machinery/computer/ship/ship_weapon/hmg, "accurace" = 100, "damage" = 0),
		"hmg_2" = list("type" = /obj/machinery/computer/ship/ship_weapon/hmg, "accurace" = 100, "damage" = 0)
	)

	ammo = list(
		"hmg_ammo" = list("type" = /obj/item/ammo_magazine/ammobox/hmg, "ammount" = 8)
	)

	..()
