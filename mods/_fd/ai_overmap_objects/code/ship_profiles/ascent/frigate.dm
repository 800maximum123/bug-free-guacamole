/obj/overmap/simulated_ship/ascent/frigate
	name = "Unknown Frigate"
	desc = ""
	icon = 'mods/_fd/fd_assets/icons/overmap.dmi'
	icon_state = "sfv-spear"
	moving_state = "sfv-spear_moving"
	characteristic = new /datum/ship_characteristic/ascent/frigate()

/datum/ship_characteristic/ascent/frigate
	max_health = 100000
	max_shield = 30000
	shield_regen_speed = 7 *(1 SECOND)
	vessel_mass = 100000
	vessel_size = SHIP_SIZE_SMALL
	max_speed = 10 *(1 SECOND)
	min_targeted_distance_to_target = 2
	max_targeted_distance_to_target = 2
	sensors_range = 15

/datum/ship_characteristic/ascent/frigate/New()
	cannons = list(
		"particle_lance" = list("type" = /obj/machinery/computer/ship/ship_weapon/beam_cannon/particle_lance, "accurace" = 75, "damage" = 0),
		"disruptor" = list("type" = /obj/machinery/computer/ship/ship_weapon/disruptor, "accurace" = 75, "damage" = 0),
		"disruptor" = list("type" = /obj/machinery/computer/ship/ship_weapon/disruptor, "accurace" = 75, "damage" = 0),
	)

	ammo = list(
		"disruptor_ammo" = list("type" = /obj/item/ammo_magazine/ammobox/disruptor, "ammount" = 2)
		)

	..()
