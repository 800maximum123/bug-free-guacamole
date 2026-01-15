/obj/overmap/simulated_ship/iccgn/interceptor_wombat
	name = "Wombat-Model Heavy Interceptor"
	desc = "A medium-sized interceptor platform, built by the Confederation Navy"
	icon = 'gcn-32.dmi'
	icon_state = "sf-wombat"
	moving_state = "sfv-star_moving"
	characteristic = new /datum/ship_characteristic/iccgn/interceptor_wombat

/datum/ship_characteristic/iccgn/interceptor_wombat
	max_health = 22500
	max_shield = 0
	shield_regen_speed = 4 *(1 SECOND)
	vessel_mass = 8000
	vessel_size = SHIP_SIZE_TINY
	max_speed = 10*(3 SECOND) //240
	min_targeted_distance_to_target = 3
	max_targeted_distance_to_target = 5 // Нет, ВЫ НЕ БУДЕТЕ ПОДЛЕТАТЬ В УПОР К НИМ, ВЫ ПЕРЕХВАТЧИКИ!!!
	sensors_range = 10

/datum/ship_characteristic/iccgn/interceptor_wombat/New()
	cannons = list(
		"missile_launcher_1" = list("type" = /obj/machinery/computer/ship/missiles, "max_cooldown" = 4000, "damage" = 0)
		"missile_launcher_2" = list("type" = /obj/machinery/computer/ship/missiles, "max_cooldown" = 4000, "damage" = 0)
	)

	ammo = list(
		"missile_emp" = list("type" = /obj/structure/missile/emp, "weight"  = 3, "ammount" = 8)
		"missile_diffusive" = list("type" = /obj/structure/missile/diffusive, "weight" = 2, "ammount" = 5),
		"missile_he" = list("type" = /obj/structure/missile/he, "weight" = 5, "ammount" = 12)
	)

	..()

// ---
