/obj/overmap/simulated_ship/ascent/dreadnought
	name = "Unknown Dreadnought"
	desc = ""
	icon = 'mods/_fd/ai_overmap_objects/icons/ascent/large_ships.dmi'
	icon_state = "dreadnought"
	moving_state = "dreadnought_moving"
	icon_shifting = 32
	characteristic = new /datum/ship_characteristic/ascent/dreadnought()

/datum/ship_characteristic/ascent/dreadnought
	max_health = 10000000
	max_shield = 2000000
	shield_regen_speed = 7 *(1 SECOND)
	vessel_mass = 4000000
	vessel_size = SHIP_SIZE_LARGE
	max_speed = 30*(5 SECOND) //1500
	min_targeted_distance_to_target = 2
	max_targeted_distance_to_target = 2
	sensors_range = 40

/datum/ship_characteristic/ascent/dreadnought/New()
	cannons = list(
		"particle_lance_1" = list("type" = /obj/machinery/computer/ship/ship_weapon/beam_cannon/particle_lance, "accurace" = 70, "damage" = 0),
		"particle_lance_2" = list("type" = /obj/machinery/computer/ship/ship_weapon/beam_cannon/particle_lance, "accurace" = 70, "damage" = 0),
		"particle_lance_3" = list("type" = /obj/machinery/computer/ship/ship_weapon/beam_cannon/particle_lance, "accurace" = 70, "damage" = 0),
		"particle_lance_4" = list("type" = /obj/machinery/computer/ship/ship_weapon/beam_cannon/particle_lance, "accurace" = 70, "damage" = 0),
		"particle_lance_5" = list("type" = /obj/machinery/computer/ship/ship_weapon/beam_cannon/particle_lance, "accurace" = 70, "damage" = 0),
		"particle_lance_6" = list("type" = /obj/machinery/computer/ship/ship_weapon/beam_cannon/particle_lance, "accurace" = 70, "damage" = 0),
	)

	ammo = list()

	..()
