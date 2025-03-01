/obj/overmap/simulated_ship/ascent/frigate
    name = "unknown frigate"
    desc = ""
    icon = 'mods/_fd/fd_assets/icons/overmap.dmi'
    icon_state = "sfv-spear"
    moving_state = "sfv-spear_moving"
    characteristic = new /datum/ship_characteristic/ascent/frigate()

/datum/ship_characteristic/ascent/frigate
    max_health = 100000
    max_shield = 37500
    vessel_mass = 100000
    vessel_size = SHIP_SIZE_SMALL
    max_speed = 10 *(1 SECOND)                        // Change first number, "Speed of light" for the ship, in turfs/second
    min_targeted_distance_to_target = 1                // 1 - Right on target, 2 - turf next to target, etc
    max_targeted_distance_to_target = 4                // 1 - Right on target, 2 - turf next to target, etc
    sensors_range = 12

/datum/ship_characteristic/ascent/frigate/New()
    cannons = list(
        "particle_lance" = list("type" = /obj/machinery/computer/ship/ship_weapon/beam_cannon/particle_lance, "accurace" = 75, "damage" = 0),
    )

    ammo = list()

    ..()
