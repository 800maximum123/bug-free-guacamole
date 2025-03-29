/obj/overmap/simulated_ship/ascent/ascent_base
	name = "ascent supply depot"
	desc = "An automated ascent facility to procur and resupply enemy's battle vessels. It looks... abandoned?"
	icon = 'mods/_fd/fd_assets/icons/overmap.dmi'
	icon_state = "station"
	moving_state = "station"
	characteristic = new /datum/ship_characteristic/ascent/ascent_base()

/datum/ship_characteristic/ascent/ascent_base
	max_health = 30000
	max_shield = 10000
	shield_regen_speed = 7 *(1 SECOND)
	vessel_mass = 200000
	vessel_size = SHIP_SIZE_TINY
	max_speed = 0 //0
	min_targeted_distance_to_target = 1
	max_targeted_distance_to_target = 1
	sensors_range = 0

/datum/ship_characteristic/ascent/ascent_base/New()
	cannons = list()

	ammo = list()

	..()
