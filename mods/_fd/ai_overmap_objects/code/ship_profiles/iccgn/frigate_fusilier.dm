//SCREENING SHIP: provides protection & support to bigger ships
/obj/overmap/simulated_ship/iccgn/frigate_fusilier
	name = "Fusilier-Class Frigate"
	desc = "A slower screening ship designed for heavy-duty fire support. IFF broadcasts ICCGN codes."
	icon_state = "fusilier"
	moving_state = "fusilier"
	characteristic = new /datum/ship_characteristic/iccgn/frigate_fusilier

/datum/ship_characteristic/iccgn/frigate_fusilier
	max_health = 800 //55k initial
	max_shield = 320 //14k initial
	shield_regen_speed = 4 *(1 SECOND)
	vessel_mass = 53000
	vessel_size = SHIP_SIZE_SMALL
	max_speed = 6*(3 SECOND) //180
	min_targeted_distance_to_target = 6
	max_targeted_distance_to_target = 8
	sensors_range = 15

/datum/ship_characteristic/iccgn/frigate_fusilier/New()
	cannons = list(
		"autocannon_1" = list("type" = /obj/machinery/computer/ship/ship_weapon/autocannon, "accurace" = 100, "damage" = 0),
		"autocannon_2" = list("type" = /obj/machinery/computer/ship/ship_weapon/autocannon, "accurace" = 100, "damage" = 0),
		"missile_launcher_1" = list("type" = /obj/machinery/computer/ship/missiles, "max_cooldown" = 12000, "damage" = 0)
	)

	ammo = list(
		"autocannon_ammo" = list("type" = /obj/item/ammo_magazine/ammobox/autocannon, "ammount" = 20),
		"missile_he" = list("type" = /obj/structure/missile/he, "weight" = 5, "ammount" = 2)
	)

	..()
