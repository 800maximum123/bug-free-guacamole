/obj/overmap/simulated_ship/ascent/fighter
    name = "unknown fighter"
    desc = ""
    icon = 'mods/_fd/fd_assets/icons/overmap.dmi'
    icon_state = "sfv-bull"
    moving_state = "sfv-bull_moving"
    characteristic = new /datum/ship_characteristic/ascent/fighter()

/datum/ship_characteristic/ascent/fighter
    max_health = 30000
    max_shield = 5000
    vessel_mass = 15000
    vessel_size = SHIP_SIZE_TINY
    max_speed = 6 *(1 SECOND)                        // Change first number, "Speed of light" for the ship, in turfs/second
    min_targeted_distance_to_target = 1                // 1 - Right on target, 2 - turf next to target, etc
    max_targeted_distance_to_target = 4                // 1 - Right on target, 2 - turf next to target, etc
    sensors_range = 6

/datum/ship_characteristic/ascent/fighter/New()
    cannons = list(
        "autocannon_1" = list("type" = /obj/machinery/computer/ship/ship_weapon/autocannon, "accurace" = 85, "damage" = 0),
        "autocannon_2" = list("type" = /obj/machinery/computer/ship/ship_weapon/autocannon, "accurace" = 85, "damage" = 0)
    )

    ammo = list(
        "autocannon_ammo" = list("type" = /obj/item/ammo_magazine/ammobox/autocannon, "ammount" = 6)
    )

    ..()
