/obj/overmap/simulated_ship/scg/corvette_cartwheel
	name = "Lexington-class Corvette"
	desc = "A small-size speedy vessel used to hunt down smaller enemies, broadcasting SCGSV codes."
	icon = 'mods/_fd/ai_overmap_objects/icons/scg/sfv32.dmi'
	icon_state = ""
	moving_state = ""
	characteristic = new /datum/ship_characteristic/scg/corvette_cartwheel()

/datum/ship_characteristic/scg/corvette_cartwheel
	max_health = 51000
	max_shield = 9000
	shield_regen_speed = 4 *(1 SECOND)
	vessel_mass = 55000
	vessel_size = SHIP_SIZE_SMALL
	max_speed = 25*(3 SECOND) //750
	min_targeted_distance_to_target = 2
	max_targeted_distance_to_target = 2
	sensors_range = 15

/datum/ship_characteristic/scg/corvette_cartwheel/New()
	cannons = list(
		"minigun_1" = list("type" = /obj/machinery/computer/ship/ship_weapon/minigun, "accurace" = 80, "damage" = 0),
		"minigun_2" = list("type" = /obj/machinery/computer/ship/ship_weapon/minigun, "accurace" = 80, "damage" = 0),
		"minigun_3" = list("type" = /obj/machinery/computer/ship/ship_weapon/minigun, "accurace" = 80, "damage" = 0),
	)

	ammo = list(
		"minigun_ammo" = list("type" = /obj/item/ammo_magazine/ammobox/minigun, "ammount" = 21),
	)

	..()
