//ATTACKER: both missiles and MGs against screens & fighters
//heavier and slower than shikra but with more health
/obj/overmap/simulated_ship/iccgn/fighter_valkyrie
	name = "A-CVP Valkyrie Mk.VI"
	desc = "A larger attacker craft with added armour and heavy weaponry to take on screening ships. IFF broadcasts ICCGN codes."
	icon_state = "valkyrie"
	moving_state = "valkyrie"
	characteristic = new /datum/ship_characteristic/iccgn/fighter_valkyrie()

/datum/ship_characteristic/iccgn/fighter_valkyrie
	max_health = 250 //22k initial
	max_shield = 0
	shield_regen_speed = 4 *(1 SECOND)
	vessel_mass = 10000
	vessel_size = SHIP_SIZE_TINY
	max_speed = 8*(3 SECOND) //240
	min_targeted_distance_to_target = 2
	max_targeted_distance_to_target = 2
	sensors_range = 10

/datum/ship_characteristic/iccgn/fighter_valkyrie/New()
	cannons = list(
		"hmg_1" = list("type" = /obj/machinery/computer/ship/ship_weapon/hmg, "accurace" = 100, "damage" = 0),
		"hmg_2" = list("type" = /obj/machinery/computer/ship/ship_weapon/hmg, "accurace" = 100, "damage" = 0),
		"missile_launcher_1" = list("type" = /obj/machinery/computer/ship/missiles, "max_cooldown" = 4000, "damage" = 0)
	)

	ammo = list(
		"hmg_ammo" = list("type" = /obj/item/ammo_magazine/ammobox/hmg, "ammount" = 16),
		"missile_he" = list("type" = /obj/structure/missile/he, "weight" = 1, "ammount" = 1),
	)

	..()


//now imagine their face when a humble attacker drops their shields! :trollface:
/obj/overmap/simulated_ship/iccgn/fighter_valkyrie_diffuser
	name = "A-CVP Valkyrie Mk.VI"
	desc = "A larger attacker craft with added armour and heavy weaponry to take on screening ships. IFF broadcasts ICCGN codes."
	icon_state = "valkyrie"
	moving_state = "valkyrie"
	characteristic = new /datum/ship_characteristic/iccgn/fighter_valkyrie()

/datum/ship_characteristic/iccgn/fighter_valkyrie
	max_health = 250 //22k initial
	max_shield = 0
	shield_regen_speed = 4 *(1 SECOND)
	vessel_mass = 10000
	vessel_size = SHIP_SIZE_TINY
	max_speed = 8*(3 SECOND) //240
	min_targeted_distance_to_target = 2
	max_targeted_distance_to_target = 2
	sensors_range = 10

/datum/ship_characteristic/iccgn/fighter_valkyrie/New()
	cannons = list(
		"hmg_1" = list("type" = /obj/machinery/computer/ship/ship_weapon/hmg, "accurace" = 100, "damage" = 0),
		"hmg_2" = list("type" = /obj/machinery/computer/ship/ship_weapon/hmg, "accurace" = 100, "damage" = 0),
		"missile_launcher_1" = list("type" = /obj/machinery/computer/ship/missiles, "max_cooldown" = 4000, "damage" = 0)
	)

	ammo = list(
		"hmg_ammo" = list("type" = /obj/item/ammo_magazine/ammobox/hmg, "ammount" = 16),
		"missile_diffusive" = list("type" = /obj/structure/missile/diffusive, "weight" = 1, "ammount" = 1),
	)

	..()
