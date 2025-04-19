/obj/overmap/simulated_ship/scg/destroyer_antietam
	name = "Antietam-class Destroyer"
	desc = "The combat support vessel of the Fleet, this class has an average amount of both weaponry and armor, designed to screen larger craft and swarm larger enemies, broadcasting SCGSV codes."
	icon = 'mods/_fd/ai_overmap_objects/icons/scg/sfv32.dmi'
	icon_state = "antietam"
	moving_state = "antietam_moving"
	characteristic = new /datum/ship_characteristic/scg/destroyer_antietam()

/datum/ship_characteristic/scg/destroyer_antietam
	max_health = 150000
	max_shield = 30000
	shield_regen_speed = 4 *(1 SECOND)
	vessel_mass = 200000
	vessel_size = SHIP_SIZE_SMALL
	max_speed = 12*(3 SECOND) //360
	min_targeted_distance_to_target = 4
	max_targeted_distance_to_target = 4
	sensors_range = 24

/datum/ship_characteristic/scg/destroyer_antietam/New()
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
