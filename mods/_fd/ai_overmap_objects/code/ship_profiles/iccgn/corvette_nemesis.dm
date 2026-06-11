//SCREENING SHIP: provides protection & support to bigger ships
//IC: older design (2260s) that probably won't be used after Gaia
/obj/overmap/simulated_ship/iccgn/corvette_nemesis
	name = "Nemesis-class Corvette"
	desc = "A fast screening ship with rapid-firing weaponry, made to hunt down small craft. IFF broadcasts ICCGN codes."
	icon_state = "nemesis"
	moving_state = "nemesis"
	characteristic = new /datum/ship_characteristic/iccgn/corvette_nemesis()

/datum/ship_characteristic/iccgn/corvette_nemesis
	max_health = 600 //50k initial
	max_shield = 320 //8k initial
	shield_regen_speed = 3 *(1 SECOND)
	vessel_mass = 52000
	vessel_size = SHIP_SIZE_SMALL
	max_speed = 12*(3 SECOND) //360
	min_targeted_distance_to_target = 2
	max_targeted_distance_to_target = 2
	sensors_range = 15

/datum/ship_characteristic/iccgn/corvette_nemesis/New()
	cannons = list(
		"hmg_1" = list("type" = /obj/machinery/computer/ship/ship_weapon/hmg, "accurace" = 90, "damage" = 0),
		"disruptor_1" = list("type" = /obj/machinery/computer/ship/ship_weapon/disruptor, "accurace" = 90, "damage" = 0)
	)

	ammo = list(
		"hmg_ammo" = list("type" = /obj/item/ammo_magazine/ammobox/hmg, "ammount" = 6),
		"disruptor_ammo" = list("type" = /obj/item/ammo_magazine/ammobox/disruptor, "ammount" = 10)
	)

	..()
