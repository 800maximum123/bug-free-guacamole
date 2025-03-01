/obj/overmap/simulated_ship/ascent/fighter
    name = "unknown fighter"
    desc = ""
    icon = 'mods/_fd/fd_assets/icons/overmap.dmi'
    icon_state = "sfv-bull"
    moving_state = "sfv-bull_moving"
    characteristic = new /datum/ship_characteristic/ascent/fighter()

/datum/ship_characteristic/ascent/fighter
    max_health = 150000
    max_shield = 25000
    vessel_mass = 15000
    vessel_size = SHIP_SIZE_TINY
    max_speed = 6 *(1 SECOND)                        // Change first number, "Speed of light" for the ship, in turfs/second
    min_targeted_distance_to_target = 2                // 1 - Right on target, 2 - turf next to target, etc
    max_targeted_distance_to_target = 4                // 1 - Right on target, 2 - turf next to target, etc
    sensors_range = 6

/datum/ship_characteristic/ascent/fighter/New()
    cannons = list(
        "crystal_1" = list("type" = /obj/machinery/computer/ship/ship_weapon/crystal_launcher, "accurace" = 95, "damage" = 0),
        "crystal_2" = list("type" = /obj/machinery/computer/ship/ship_weapon/crystal_launcher, "accurace" = 95, "damage" = 0)
    )

    ammo = list(
        "crystall_ammo" = list("type" = /obj/item/ammo_magazine/ammobox/crystal/shrapnel, "ammount" = 6)
    )

    ..()
