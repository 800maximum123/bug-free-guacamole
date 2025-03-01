/obj/overmap/simulated_ship/ascent/corvette
    name = "unknown corvette"
    desc = ""
    icon = 'mods/_fd/fd_assets/icons/overmap.dmi'
    icon_state = "sfv-star"
    moving_state = "sfv-star_moving"
    characteristic = new /datum/ship_characteristic/ascent/corvette()

/datum/ship_characteristic/ascent/corvette
    max_health = 312500
    max_shield = 62500
    vessel_mass = 65000
    vessel_size = SHIP_SIZE_SMALL
    max_speed = 10 *(1 SECOND)                        // Change first number, "Speed of light" for the ship, in turfs/second
    min_targeted_distance_to_target = 2                // 1 - Right on target, 2 - turf next to target, etc
    max_targeted_distance_to_target = 5                // 1 - Right on target, 2 - turf next to target, etc
    sensors_range = 9

/datum/ship_characteristic/ascent/corvette/New()
    cannons = list(
        "crystal_1" = list("type" = /obj/machinery/computer/ship/ship_weapon/crystal_launcher, "accurace" = 95, "damage" = 0),
        "crystal_2" = list("type" = /obj/machinery/computer/ship/ship_weapon/crystal_launcher, "accurace" = 95, "damage" = 0),
        "crystal_3" = list("type" = /obj/machinery/computer/ship/ship_weapon/crystal_launcher, "accurace" = 95, "damage" = 0),
        "crystal_4" = list("type" = /obj/machinery/computer/ship/ship_weapon/crystal_launcher, "accurace" = 95, "damage" = 0)
    )

    ammo = list(
        "crystall_ammo" = list("type" = /obj/item/ammo_magazine/ammobox/crystal/high_explosive, "ammount" = 26),
    )

    ..()
