/obj/overmap/simulated_ship/scg/fighter_shikra
	name = "PM-55 Shikra"
	desc = "An small Sol fighter, designed for double-piloting, broadcasting SCGSV codes."
	icon = 'mods/_fd/ai_overmap_objects/icons/scg/sfv32.dmi'
	icon_state = "sfv-star"
	moving_state = "sfv-star_moving"
	characteristic = new /datum/ship_characteristic/scg/fighter_shikra()

/datum/ship_characteristic/scg/fighter_shikra
	max_health = 20000
	max_shield = 0
	shield_regen_speed = 4 *(1 SECOND)
	vessel_mass = 10000
	vessel_size = SHIP_SIZE_TINY
	max_speed = 5*(3 SECOND) //150
	min_targeted_distance_to_target = 2
	max_targeted_distance_to_target = 2
	sensors_range = 10

/datum/ship_characteristic/scg/fighter_shikra/New()
	cannons = list(
		"hmg_1" = list("type" = /obj/machinery/computer/ship/ship_weapon/hmg, "accurace" = 85, "damage" = 0),
		"hmg_2" = list("type" = /obj/machinery/computer/ship/ship_weapon/hmg, "accurace" = 85, "damage" = 0),
		"missile_launcher_1" = list("type" = /obj/machinery/computer/ship/missiles, "max_cooldown" = 4000, "damage" = 0)
	)

	ammo = list(
		"hmg_ammo" = list("type" = /obj/item/ammo_magazine/ammobox/hmg, "ammount" = 16),
		"missile_he" = list("type" = /obj/structure/missile/he, "weight" = 1, "ammount" = 14),
	)

	..()
