/obj/overmap/simulated_ship/iccgn/destroyer_lucerne
	name = "Lucerne-Class Destroyer"
	desc = "A large mixed-role capital warship built by the Confederation Navy."
	icon = 'mods/_fd/ai_overmap_objects/icons/scg/sfv32.dmi'
	icon_state = "ds_lucerne"
	moving_state = "ds_lucerne"
	characteristic = new /datum/ship_characteristic/iccgn/destroyer_lucerne()

/datum/ship_characteristic/iccgn/destroyer_lucerne
	max_health = 345000
	max_shield = 120000
	shield_regen_speed = 4 *(1 SECOND)
	vessel_mass = 320000
	vessel_size = SHIP_SIZE_LARGE
	max_speed = 30*(3 SECOND) //900
	min_targeted_distance_to_target = 4
	max_targeted_distance_to_target = 6
	sensors_range = 28

/datum/ship_characteristic/iccgn/destroyer_lucerne/New()
	cannons = list(
		"disruptor_1" = list("type" = /obj/machinery/computer/ship/ship_weapon/disruptor, "accurace" = 80, "damage" = 0),
		"disruptor_2" = list("type" = /obj/machinery/computer/ship/ship_weapon/disruptor, "accurace" = 80, "damage" = 0),
		"autocannon_1" = list("type" = /obj/machinery/computer/ship/ship_weapon/autocannon, "accurace" = 75, "damage" = 0),
		"autocannon_2" = list("type" = /obj/machinery/computer/ship/ship_weapon/autocannon, "accurace" = 75, "damage" = 0),
		"autocannon_3" = list("type" = /obj/machinery/computer/ship/ship_weapon/autocannon, "accurace" = 75, "damage" = 0)
	)

	ammo = list(
		"disruptor_ammo" = list("type" = /obj/item/ammo_magazine/ammobox/disruptor, "ammount" = 20),
		"autocannon_ammo" = list("type" = /obj/item/ammo_magazine/ammobox/autocannon, "ammount" = 30)
	)

	..()
