/obj/overmap/simulated_ship/scg/battlecruiser_charles_de_gaulle
	name = "Cherles De Gaulle-class Battleruiser"
	desc = "An older battlecruiser, the De Gaulle-class has some advantages over the Midway in armor and support capabilities, most importantly: a large storage bay containing dropships, landing craft, and vehicles for leading landing operations.It is broadcasting SCGSV codes."
	icon = 'mods/_fd/ai_overmap_objects/icons/scg/sfv32.dmi'
	icon_state = ""
	moving_state = ""
	characteristic = new /datum/ship_characteristic/scg/battlecruiser_charles_de_gaulle()

/datum/ship_characteristic/scg/battlecruiser_charles_de_gaulle
	max_health = 800000
	max_shield = 150000
	shield_regen_speed = 4 *(1 SECOND)
	vessel_mass = 480000
	vessel_size = SHIP_SIZE_LARGE
	max_speed = 27*(3 SECOND) //810
	min_targeted_distance_to_target = 5
	max_targeted_distance_to_target = 5
	sensors_range = 28

/datum/ship_characteristic/scg/battlecruiser_charles_de_gaulle/New()
	cannons = list(
		"autocannon_1" = list("type" = /obj/machinery/computer/ship/ship_weapon/autocannon, "accurace" = 70, "damage" = 0),
		"autocannon_2" = list("type" = /obj/machinery/computer/ship/ship_weapon/autocannon, "accurace" = 70, "damage" = 0),
		"autocannon_3" = list("type" = /obj/machinery/computer/ship/ship_weapon/autocannon, "accurace" = 70, "damage" = 0),
		"autocannon_4" = list("type" = /obj/machinery/computer/ship/ship_weapon/autocannon, "accurace" = 70, "damage" = 0),
		"autocannon_5" = list("type" = /obj/machinery/computer/ship/ship_weapon/autocannon, "accurace" = 70, "damage" = 0),
		"autocannon_6" = list("type" = /obj/machinery/computer/ship/ship_weapon/autocannon, "accurace" = 70, "damage" = 0),
		"autocannon_7" = list("type" = /obj/machinery/computer/ship/ship_weapon/autocannon, "accurace" = 70, "damage" = 0),
		"autocannon_8" = list("type" = /obj/machinery/computer/ship/ship_weapon/autocannon, "accurace" = 70, "damage" = 0),
	)

	ammo = list(
		"autocannon_ammo" = list("type" = /obj/item/ammo_magazine/ammobox/autocannon, "ammount" = 100),
	)

	..()
