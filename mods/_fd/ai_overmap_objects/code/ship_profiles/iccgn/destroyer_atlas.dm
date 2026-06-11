//SUBCAPITAL: bigger than frigate, smaller than cruiser
//hit-and-run glass cannon
/obj/overmap/simulated_ship/iccgn/destroyer_atlas
	name = "Atlas-class Destroyer"
	desc = "A sub-capital ship designed for swift hit-and-run strikes on larger foes. IFF broadcasts ICCGN codes."
	icon_state = "atlas"
	moving_state = "atlas"
	characteristic = new /datum/ship_characteristic/iccgn/destroyer_atlas()

/datum/ship_characteristic/iccgn/destroyer_atlas
	max_health = 600 //75k initial
	max_shield = 1200 //16k initial
	shield_regen_speed = 2 *(1 SECOND)
	vessel_mass = 90000
	vessel_size = SHIP_SIZE_SMALL
	max_speed = 9*(3 SECOND) //270
	min_targeted_distance_to_target = 3
	max_targeted_distance_to_target = 6
	sensors_range = 16

/datum/ship_characteristic/iccgn/destroyer_atlas/New()
	cannons = list(
		"missile_launcher_1" = list("type" = /obj/machinery/computer/ship/missiles, "max_cooldown" = 100, "damage" = 0), //max cooldown is broken and doesn't apply
		"missile_launcher_2" = list("type" = /obj/machinery/computer/ship/missiles, "max_cooldown" = 100, "damage" = 0),
		"missile_launcher_3" = list("type" = /obj/machinery/computer/ship/missiles, "max_cooldown" = 100, "damage" = 0),
		"autocannon_1" = list("type" = /obj/machinery/computer/ship/ship_weapon/autocannon, "accurace" = 100, "damage" = 0)
	)

	ammo = list(
		"missile_diffusive" = list("type" = /obj/structure/missile/diffusive, "weight" = 2, "ammount" = 1),
		"missile_he" = list("type" = /obj/structure/missile/he, "weight" = 5, "ammount" = 6),
		"autocannon_ammo" = list("type" = /obj/item/ammo_magazine/ammobox/autocannon, "ammount" = 10)
	)

	..()
