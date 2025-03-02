/obj/overmap/simulated_ship/ascent/drone
    name = "unknown drone"
    desc = ""
    icon_state = "shuttle"
    moving_state = "shuttle_moving"
    characteristic = new /datum/ship_characteristic/ascent/drone()

/datum/ship_characteristic/ascent/drone
    max_health = 62500
    max_shield = 0
    vessel_mass = 5000
    vessel_size = SHIP_SIZE_TINY
    max_speed = 8 *(1 SECOND)                        // Change first number, "Speed of light" for the ship, in turfs/second
    min_targeted_distance_to_target = 2                // 1 - Right on target, 2 - turf next to target, etc
    max_targeted_distance_to_target = 2                // 1 - Right on target, 2 - turf next to target, etc
    sensors_range = 6

/datum/ship_characteristic/ascent/drone/New()
    cannons = list(
        "crystal_1" = list("type" = /obj/machinery/computer/ship/ship_weapon/crystal_launcher, "accurace" = 95, "damage" = 0),
        "crystal_2" = list("type" = /obj/machinery/computer/ship/ship_weapon/crystal_launcher, "accurace" = 95, "damage" = 0)
    )

    ammo = list(
        "crystall_ammo" = list("type" = /obj/item/ammo_magazine/ammobox/crystal/shrapnel, "ammount" = 6)
    )

    ..()
