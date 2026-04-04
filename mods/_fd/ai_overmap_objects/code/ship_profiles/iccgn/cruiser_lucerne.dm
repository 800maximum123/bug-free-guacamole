//CAPITAL SHIP: big, lean, mean, space war's main force
/obj/overmap/simulated_ship/iccgn/cruiser_lucerne
	name = "Lucerne-Class Cruiser"
	desc = "A large mixed-role capital warship with varying gun armaments. IFF broadcasts ICCGN codes."
	icon_state = "lucerne"
	moving_state = "lucerne"
	characteristic = new /datum/ship_characteristic/iccgn/cruiser_lucerne()

/datum/ship_characteristic/iccgn/cruiser_lucerne
	max_health = 2400 //345k initial
	max_shield = 15000 //120k initial
	shield_regen_speed = 4 *(1 SECOND)
	vessel_mass = 320000
	vessel_size = SHIP_SIZE_LARGE
	max_speed = 5*(3 SECOND) //150
	min_targeted_distance_to_target = 4
	max_targeted_distance_to_target = 6
	sensors_range = 28

/datum/ship_characteristic/iccgn/cruiser_lucerne/New()
	cannons = list(
		"autocannon_1" = list("type" = /obj/machinery/computer/ship/ship_weapon/autocannon, "accurace" = 90, "damage" = 0),
		"autocannon_2" = list("type" = /obj/machinery/computer/ship/ship_weapon/autocannon, "accurace" = 90, "damage" = 0),
		"autocannon_3" = list("type" = /obj/machinery/computer/ship/ship_weapon/autocannon, "accurace" = 90, "damage" = 0),
		"hmg_1" = list("type" = /obj/machinery/computer/ship/ship_weapon/hmg, "accurace" = 100, "damage" = 0),
		"hmg_2" = list("type" = /obj/machinery/computer/ship/ship_weapon/hmg, "accurace" = 100, "damage" = 0)
	)

	ammo = list(
		"autocannon_ammo" = list("type" = /obj/item/ammo_magazine/ammobox/autocannon, "ammount" = 30),
		"hmg_ammo" = list("type" = /obj/item/ammo_magazine/ammobox/hmg, "ammount" = 4)
	)

	..()
