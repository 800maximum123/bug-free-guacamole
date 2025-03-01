/obj/overmap/simulated_ship/ascent/corvette
    name = "unknown corvette"
    desc = ""
    icon = 'mods/_fd/fd_assets/icons/overmap.dmi'
    icon_state = "sfv-star"
    moving_state = "sfv-star_moving"
    characteristic = new /datum/ship_characteristic/ascent/corvette()

/datum/ship_characteristic/ascent/corvette
    max_health = 62500
    max_shield = 12500
    vessel_mass = 65000
    vessel_size = SHIP_SIZE_SMALL
    max_speed = 10 *(1 SECOND)                        // Change first number, "Speed of light" for the ship, in turfs/second
    min_targeted_distance_to_target = 1                // 1 - Right on target, 2 - turf next to target, etc
    max_targeted_distance_to_target = 5                // 1 - Right on target, 2 - turf next to target, etc
    sensors_range = 9

/datum/ship_characteristic/ascent/corvette/New()
    cannons = list(
        "autocannon_1" = list("type" = /obj/machinery/computer/ship/ship_weapon/autocannon, "accurace" = 85, "damage" = 0),
        "autocannon_2" = list("type" = /obj/machinery/computer/ship/ship_weapon/autocannon, "accurace" = 85, "damage" = 0),
        "hmg_1" = list("type" = /obj/machinery/computer/ship/ship_weapon/hmg, "accurace" = 85, "damage" = 0),
        "hmg_2" = list("type" = /obj/machinery/computer/ship/ship_weapon/hmg, "accurace" = 85, "damage" = 0)
    )

    ammo = list(
        "autocannon_ammo" = list("type" = /obj/item/ammo_magazine/ammobox/autocannon, "ammount" = 16),
        "hmg_ammo" = list("type" = /obj/item/ammo_magazine/ammobox/hmg, "ammount" = 10)
    )

    ..()
