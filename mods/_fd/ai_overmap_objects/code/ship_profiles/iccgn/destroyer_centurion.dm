//SUBCAPITAL: bigger than frigate, smaller than cruiser
//drone carrier
/obj/overmap/simulated_ship/iccgn/destroyer_centurion
	name = "Centurion-Class Destroyer"
	desc = "A sub-capital ship designed to carry swarms of unmanned drones into combat. IFF broadcasts ICCGN codes."
	icon_state = "centurion"
	moving_state = "centurion"
	characteristic = new /datum/ship_characteristic/iccgn/destroyer_centurion

/datum/ship_characteristic/iccgn/destroyer_centurion
	max_health = 1200 //55k initial
	max_shield = 650 //14k initial
	shield_regen_speed = 4 *(1 SECOND)
	vessel_mass = 53000
	vessel_size = SHIP_SIZE_SMALL
	max_speed = 6*(3 SECOND) //180
	min_targeted_distance_to_target = 6
	max_targeted_distance_to_target = 8
	sensors_range = 15

/datum/ship_characteristic/iccgn/destroyer_centurion/New()
	cannons = list(
		"hmg_1" = list("type" = /obj/machinery/computer/ship/ship_weapon/hmg, "accurace" = 100, "damage" = 0),
		"hmg_2" = list("type" = /obj/machinery/computer/ship/ship_weapon/hmg, "accurace" = 100, "damage" = 0)
	)

	ammo = list(
		"hmg_ammo" = list("type" = /obj/item/ammo_magazine/ammobox/hmg, "ammount" = 16)
	)

	..()
