/obj/overmap/simulated_ship/scg/corvette_mako
    name = "Mako-class Corvette"
    desc = "A small-size assault battlecraft, designed for vast suppressive fire, broadcasting SCGSV codes."
    icon = 'mods/_fd/ai_overmap_objects/icons/scg/sfv32.dmi'
    icon_state = ""
    moving_state = ""
    characteristic = new /datum/ship_characteristic/scg/corvette_mako()

/datum/ship_characteristic/scg/corvette_mako
    max_health = 48000
    max_shield = 10000
    shield_regen_speed = 4 *(1 SECOND)
    vessel_mass = 60000
    vessel_size = SHIP_SIZE_SMALL
    max_speed = 25*(3 SECOND) //750
    min_targeted_distance_to_target = 3
    max_targeted_distance_to_target = 3
    sensors_range = 15

/datum/ship_characteristic/scg/corvette_mako/New()
    cannons = list(
        "autocannon_1" = list("type" = /obj/machinery/computer/ship/ship_weapon/autocannon, "accurace" = 75, "damage" = 0),
        "autocannon_2" = list("type" = /obj/machinery/computer/ship/ship_weapon/autocannon, "accurace" = 75, "damage" = 0),
        "autocannon_3" = list("type" = /obj/machinery/computer/ship/ship_weapon/autocannon, "accurace" = 75, "damage" = 0),
        "autocannon_4" = list("type" = /obj/machinery/computer/ship/ship_weapon/autocannon, "accurace" = 75, "damage" = 0)
    )

    ammo = list(
        "autocannon_ammo" = list("type" = /obj/item/ammo_magazine/ammobox/autocannon, "ammount" = 28),
    )

    ..()
