//INTERCEPTOR: missiles only against screens & subcapitals
/obj/overmap/simulated_ship/iccgn/fighter_wombat
	name = "B/I-A Wombat Mk.I"
	desc = "A large interceptor craft with variable missile payloads to take on heavy foes. IFF broadcasts ICCGN codes."
	icon_state = "wombat"
	moving_state = "wombat"
	characteristic = new /datum/ship_characteristic/iccgn/fighter_wombat

/datum/ship_characteristic/iccgn/fighter_wombat
	max_health = 280 //22.5k initial
	max_shield = 50
	shield_regen_speed = 4 *(1 SECOND)
	vessel_mass = 8000
	vessel_size = SHIP_SIZE_TINY
	max_speed = 7*(3 SECOND) //210
	min_targeted_distance_to_target = 3
	max_targeted_distance_to_target = 5 // Нет, ВЫ НЕ БУДЕТЕ ПОДЛЕТАТЬ В УПОР К НИМ, ВЫ ПЕРЕХВАТЧИКИ!!!
	sensors_range = 10

/datum/ship_characteristic/iccgn/fighter_wombat/New()
	cannons = list(
		"missile_launcher_1" = list("type" = /obj/machinery/computer/ship/missiles, "max_cooldown" = 4000, "damage" = 0),
		"missile_launcher_2" = list("type" = /obj/machinery/computer/ship/missiles, "max_cooldown" = 4000, "damage" = 0)
	)

	ammo = list(
		"missile_emp" = list("type" = /obj/structure/missile/emp, "weight"  = 3, "ammount" = 1),
		"missile_he" = list("type" = /obj/structure/missile/he, "weight" = 5, "ammount" = 2)
	)

	..()

// ---
