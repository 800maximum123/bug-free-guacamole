
/obj/overmap/simulated_ship/iccgn/frigate_centurion
	name = "Centurion-Class Frigate"
	desc = "A medium sized military light carrier built by the Confederation Navy."
	icon = 'mods/_fd/ai_overmap_objects/icons/scg/sfv32.dmi'
	icon_state = "cartwheel"
	moving_state = "cartwheel_moving"
	characteristic = new /datum/ship_characteristic/iccgn/frigate_centurion

/datum/ship_characteristic/iccgn/frigate_centurion
	max_health = 55000
	max_shield = 14000
	shield_regen_speed = 4 *(1 SECOND)
	vessel_mass = 53000
	vessel_size = SHIP_SIZE_SMALL
	max_speed = 17*(3 SECOND) //510
	min_targeted_distance_to_target = 6
	max_targeted_distance_to_target = 8
	sensors_range = 15

/datum/ship_characteristic/iccgn/frigate_centurion/New()
	cannons = list(
		"autocannon_1" = list("type" = /obj/machinery/computer/ship/ship_weapon/autocannon, "accurace" = 80, "damage" = 0),
		"autocannon_2" = list("type" = /obj/machinery/computer/ship/ship_weapon/autocannon, "accurace" = 80, "damage" = 0),
		"disruptor_1" = list("type" = /obj/machinery/computer/ship/ship_weapon/disruptor, "accurace" = 95, "damage" = 0),
	)

	ammo = list(
		"autocannon_ammo" = list("type" = /obj/item/ammo_magazine/ammobox/autocannon, "ammount" = 20),
		"disruptor_ammo" = list("type" = /obj/item/ammo_magazine/ammobox/disruptor, "ammount" = 10)
	)

	..()
