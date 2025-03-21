/obj/overmap/simulated_ship/scg/battlecruiser_midway
	name = "Midway-class Battleruiser"
	desc = "The main combat vessel of the Fleet, this ship has big guns and tons of armor, made to take enemy ships head-on. A preponderance of forward-facing armor and weaponry necessitates that Midway-class vessels travel with escorts. It is broadcasting SCGSV codes."
	icon = 'mods/_fd/ai_overmap_objects/icons/scg/sfv32.dmi'
	icon_state = ""
	moving_state = ""
	characteristic = new /datum/ship_characteristic/scg/battlecruiser_midway()

/datum/ship_characteristic/scg/battlecruiser_midway
	max_health = 675000
	max_shield = 125000
	shield_regen_speed = 4 *(1 SECOND)
	vessel_mass = 420000
	vessel_size = SHIP_SIZE_LARGE
	max_speed = 30*(3 SECOND) //900
	min_targeted_distance_to_target = 2
	max_targeted_distance_to_target = 2
	sensors_range = 28

/datum/ship_characteristic/scg/battlecruiser_midway/New()
	cannons = list(
		"beam_cannon_1" = list("type" = /obj/machinery/computer/ship/ship_weapon/beam_cannon, "accurace" = 80, "damage" = 0),
		"beam_cannon_2" = list("type" = /obj/machinery/computer/ship/ship_weapon/beam_cannon, "accurace" = 80, "damage" = 0),
		"beam_cannon_3" = list("type" = /obj/machinery/computer/ship/ship_weapon/beam_cannon, "accurace" = 80, "damage" = 0),
		"beam_cannon_4" = list("type" = /obj/machinery/computer/ship/ship_weapon/beam_cannon, "accurace" = 80, "damage" = 0),
		"beam_cannon_5" = list("type" = /obj/machinery/computer/ship/ship_weapon/beam_cannon, "accurace" = 80, "damage" = 0),
		"beam_cannon_6" = list("type" = /obj/machinery/computer/ship/ship_weapon/beam_cannon, "accurace" = 80, "damage" = 0),
	)
	ammo = list()

	..()
