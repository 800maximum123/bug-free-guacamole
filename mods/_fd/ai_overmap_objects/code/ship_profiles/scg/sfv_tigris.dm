/obj/overmap/simulated_ship/scg/sfv_tigris
	name = "Waterloo Class Flagship - SFV Tigris"
	desc = "The Waterloois are built for direct combat, but has less armor and forward-facing weaponry. Instead, it is equipped with support weaponry, a larger complement of missiles and torpedoes, as well as electromagnetic jamming equipment. It is broadcasting SCGSV codes."
	icon = 'mods/_fd/ai_overmap_objects/icons/scg/sfv64.dmi'
	icon_state = "tigris"
	moving_state = "tigri_moving"
	icon_shifting = 32
	characteristic = new /datum/ship_characteristic/scg/sfv_tigris()

/datum/ship_characteristic/scg/sfv_tigris
	max_health = 300000
	max_shield = 85000
	shield_regen_speed = 4 *(1 SECOND)
	vessel_mass = 360000
	vessel_size = SHIP_SIZE_LARGE
	max_speed = 20*(3 SECOND) //600
	min_targeted_distance_to_target = 2
	max_targeted_distance_to_target = 2
	sensors_range = 27

/datum/ship_characteristic/scg/sfv_tigris/New()
	cannons = list(
		"disruptor_1" = list("type" = /obj/machinery/computer/ship/ship_weapon/disruptor, "accurace" = 90, "damage" = 0),
		"disruptor_2" = list("type" = /obj/machinery/computer/ship/ship_weapon/disruptor, "accurace" = 90, "damage" = 0),
		"disruptor_3" = list("type" = /obj/machinery/computer/ship/ship_weapon/disruptor, "accurace" = 90, "damage" = 0),
		"beam_cannon_1" = list("type" = /obj/machinery/computer/ship/ship_weapon/beam_cannon, "accurace" = 90, "damage" = 0)
	) // две торпедные установки

	ammo = list(
		"disruptor_ammo" = list("type" = /obj/item/ammo_magazine/ammobox/disruptor, "ammount" = 40)
	)

	..()
