/obj/overmap/simulated_ship/scg/destroyer_yari
	name = "Yari-class Destroyer"
	desc = "Specifically designed as a capital ship killer, built around an enormous mass driver, designed to fire both conventional and nuclear projectiles. Lacking in armor and other armament, the Yari has only speed and the defenses of other vessels to protect it as it closes to accurate firing range. It is broadcasting SCGSV codes."
	icon = 'mods/_fd/ai_overmap_objects/icons/scg/sfv32.dmi'
	icon_state = "yari"
	moving_state = "yari_moving"
	characteristic = new /datum/ship_characteristic/scg/destroyer_yari()

/datum/ship_characteristic/scg/destroyer_yari
	max_health = 125000
	max_shield = 20000
	shield_regen_speed = 4 *(1 SECOND)
	vessel_mass = 190000
	vessel_size = SHIP_SIZE_SMALL
	max_speed = 17*(3 SECOND) //510
	min_targeted_distance_to_target = 2
	max_targeted_distance_to_target = 2
	sensors_range = 24

/datum/ship_characteristic/scg/destroyer_yari/New()
	cannons = list(
		"beam_cannon_1" = list("type" = /obj/machinery/computer/ship/ship_weapon/beam_cannon, "accurace" = 90, "damage" = 0),
		"beam_cannon_2" = list("type" = /obj/machinery/computer/ship/ship_weapon/beam_cannon, "accurace" = 90, "damage" = 0)
) // дописать одну пусковую установку с ядерными торпедами

	ammo = list()

	..()
