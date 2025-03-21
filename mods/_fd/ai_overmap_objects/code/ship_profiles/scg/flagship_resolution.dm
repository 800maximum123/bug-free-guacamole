/obj/overmap/simulated_ship/scg/flagship_resolution
	name = "Resolution-class Battleruiser Flagship"
	desc = "The most common type of flagship, this class is little more than an upsized battlecruiser with an impromptu hangar tacked on. Slow, but with a sharp bite, the Resolution-class is still a force to be reckoned with, even on its own. It is broadcasting SCGSV codes."
	icon = 'mods/_fd/ai_overmap_objects/icons/scg/sfv64.dmi'
	icon_state = "resolution"
	moving_state = "resolution_moving"
	characteristic = new /datum/ship_characteristic/scg/flagship_resolution()

/datum/ship_characteristic/scg/flagship_resolution
	max_health = 850000
	max_shield = 175000
	shield_regen_speed = 4 *(1 SECOND)
	vessel_mass = 600000
	vessel_size = SHIP_SIZE_LARGE
	max_speed = 33*(3 SECOND) //990
	min_targeted_distance_to_target = 2
	max_targeted_distance_to_target = 2
	sensors_range = 38

/datum/ship_characteristic/scg/flagship_resolution/New()
	cannons = list(
		"beam_cannon_1" = list("type" = /obj/machinery/computer/ship/ship_weapon/beam_cannon, "accurace" = 95, "damage" = 0),
		"beam_cannon_2" = list("type" = /obj/machinery/computer/ship/ship_weapon/beam_cannon, "accurace" = 95, "damage" = 0),
		"beam_cannon_3" = list("type" = /obj/machinery/computer/ship/ship_weapon/beam_cannon, "accurace" = 95, "damage" = 0),
		"beam_cannon_4" = list("type" = /obj/machinery/computer/ship/ship_weapon/beam_cannon, "accurace" = 95, "damage" = 0),
		"beam_cannon_5" = list("type" = /obj/machinery/computer/ship/ship_weapon/beam_cannon, "accurace" = 95, "damage" = 0),
		"beam_cannon_6" = list("type" = /obj/machinery/computer/ship/ship_weapon/beam_cannon, "accurace" = 95, "damage" = 0),
	)
	ammo = list()

	..()
