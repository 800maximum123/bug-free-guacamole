/obj/overmap/simulated_ship/scg/frigate_nuum
	name = "Nuum-class Frigate"
	desc = "Heavy torpedo-carrier designed to act as a main soucre of damage in assault fleet squadrons, broadcasting SCGSV codes."
	icon = 'mods/_fd/ai_overmap_objects/icons/scg/sfv32.dmi'
	icon_state = "nuum"
	moving_state = "nuum_moving"
	characteristic = new /datum/ship_characteristic/scg/frigate_nuum()

/datum/ship_characteristic/scg/frigate_nuum
	max_health = 90000
	max_shield = 20000
	shield_regen_speed = 4 *(1 SECOND)
	vessel_mass = 110000
	vessel_size = SHIP_SIZE_SMALL
	max_speed = 11*(3 SECOND) //330
	min_targeted_distance_to_target = 3
	max_targeted_distance_to_target = 3
	sensors_range = 20

/datum/ship_characteristic/scg/frigate_nuum/New()
	cannons = list(
		"missile_launcher_1" = list("type" = /obj/machinery/computer/ship/missiles, "max_cooldown" = 8000, "damage" = 0),
		"missile_launcher_2" = list("type" = /obj/machinery/computer/ship/missiles, "max_cooldown" = 9000, "damage" = 0),
		"missile_launcher_3" = list("type" = /obj/machinery/computer/ship/missiles, "max_cooldown" = 8000, "damage" = 0),
		"missile_launcher_4" = list("type" = /obj/machinery/computer/ship/missiles, "max_cooldown" = 9000, "damage" = 0)
	)

	ammo = list(
		"missile_nuke" = list("type" = /obj/structure/missile/locked/nuke, "weight" = 1, "ammount" = 9),
		"missile_diffusive" = list("type" = /obj/structure/missile/diffusive, "weight" = 2, "ammount" = 20),
		"missile_he" = list("type" = /obj/structure/missile/he, "weight" = 5, "ammount" = 60)
	)

	..()
