/obj/overmap/simulated_ship/scg/frigate_nuum
	name = "Nuum-class Frigate"
	desc = "Heavy torpedo-carrier designed to act as a main soucre of damage in assault fleet squadrons, broadcasting SCGSV codes."
	icon = 'mods/_fd/ai_overmap_objects/icons/scg/sfv32.dmi'
	icon_state = ""
	moving_state = ""
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
	cannons = list() //нужны торпеды, 4 установки

	ammo = list()

	..()
