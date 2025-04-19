/obj/overmap/simulated_ship/scg/cruiser_waterloo
	name = "Waterloo-class Cruiser"
	desc = "The Waterloois are built for direct combat, but has less armor and forward-facing weaponry. Instead, it is equipped with support weaponry, a larger complement of missiles and torpedoes, as well as electromagnetic jamming equipment. It is broadcasting SCGSV codes."
	icon = 'mods/_fd/ai_overmap_objects/icons/scg/sfv32.dmi'
	icon_state = "waterloo"
	moving_state = "waterloo_moving"
	characteristic = new /datum/ship_characteristic/scg/cruiser_waterloo()

/datum/ship_characteristic/scg/cruiser_waterloo
	max_health = 300000
	max_shield = 65000
	shield_regen_speed = 4 *(1 SECOND)
	vessel_mass = 320000
	vessel_size = SHIP_SIZE_LARGE
	max_speed = 20*(3 SECOND) //600
	min_targeted_distance_to_target = 4
	max_targeted_distance_to_target = 4
	sensors_range = 24

/datum/ship_characteristic/scg/cruiser_waterloo/New()
	cannons = list(
		"disruptor_1" = list("type" = /obj/machinery/computer/ship/ship_weapon/disruptor, "accurace" = 90, "damage" = 0),
		"disruptor_2" = list("type" = /obj/machinery/computer/ship/ship_weapon/disruptor, "accurace" = 90, "damage" = 0),
		"missile_launcher_1" = list("type" = /obj/machinery/computer/ship/missiles, "max_cooldown" = 6000, "damage" = 0),
		"missile_launcher_2" = list("type" = /obj/machinery/computer/ship/missiles, "max_cooldown" = 6000, "damage" = 0),
		"missile_launcher_3" = list("type" = /obj/machinery/computer/ship/missiles, "max_cooldown" = 6000, "damage" = 0)
)

	ammo = list(
		"missile_nuke" = list("type" = /obj/structure/missile/locked/nuke, "weight" = 1, "ammount" = 8),
		"missile_he" = list("type" = /obj/structure/missile/he, "weight" = 6, "ammount" = 45),
		"disruptor_ammo" = list("type" = /obj/item/ammo_magazine/ammobox/disruptor, "ammount" = 40)
	)

	..()
