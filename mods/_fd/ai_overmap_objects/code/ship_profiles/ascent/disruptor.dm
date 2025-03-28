/obj/overmap/simulated_ship/ascent/disruptor
	name = "stationary disruptor"
	desc = ""
	icon = 'mods/_fd/immersive_overmap/icons/new_overmap.dmi'
	icon_state = "ascent"
	moving_state = "ascent"
	characteristic = new /datum/ship_characteristic/ascent/disruptor()

/datum/ship_characteristic/ascent/disruptor
	max_health = 20000
	max_shield = 10000
	shield_regen_speed = 7 *(1 SECOND)
	vessel_mass = 25000
	vessel_size = SHIP_SIZE_TINY
	max_speed = 0 //0
	min_targeted_distance_to_target = 1
	max_targeted_distance_to_target = 1
	sensors_range = 0

/datum/ship_characteristic/ascent/disruptor/New()
	cannons = list()

	ammo = list()

	..()
