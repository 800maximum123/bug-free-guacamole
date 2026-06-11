//PATROL BOAT: little more than chaff enemy, but has good sensors
/obj/overmap/simulated_ship/iccgn/patrol_a298
	name = "A298-class Patrol Boat"
	desc = "A small, fast sub-screen boat with powerful sensors, never intended to take part in battles. IFF broadcasts ICCGN codes."
	icon_state = "a298"
	moving_state = "a298"
	characteristic = new /datum/ship_characteristic/iccgn/patrol_a298()

/datum/ship_characteristic/iccgn/patrol_a298
	max_health = 560 //30k initial
	max_shield = 50 //2k initial
	shield_regen_speed = 4 *(1 SECOND)
	vessel_mass = 25000
	vessel_size = SHIP_SIZE_SMALL
	max_speed = 8*(3 SECOND) //240
	min_targeted_distance_to_target = 2
	max_targeted_distance_to_target = 3
	sensors_range = 20

/datum/ship_characteristic/iccgn/patrol_a298/New()
	cannons = list(
		"hmg_1" = list("type" = /obj/machinery/computer/ship/ship_weapon/hmg, "accurace" = 90, "damage" = 0)
	)

	ammo = list(
		"hmg_ammo" = list("type" = /obj/item/ammo_magazine/ammobox/hmg, "ammount" = 12),
	)

	..()
