/obj/overmap/simulated_ship/ascent/supercarrier
    name = "unknown supercarrier"
    desc = ""
    icon = 'mods/_fd/ai_overmap_objects/icons/ascent_ships.dmi'
    icon_state = "supercarrier"
    moving_state = "supercarrier_moving"
    pixel_x = -16
    pixel_y = -16
    characteristic = new /datum/ship_characteristic/ascent/supercarrier()

/datum/ship_characteristic/ascent/supercarrier
    max_health = 437500000
    max_shield = 62500000
    vessel_mass = 6000000
    vessel_size = SHIP_SIZE_LARGE
    max_speed = 60 *(1 SECOND)                        // Change first number, "Speed of light" for the ship, in turfs/second
    min_targeted_distance_to_target = 6                // 1 - Right on target, 2 - turf next to target, etc
    max_targeted_distance_to_target = 8                // 1 - Right on target, 2 - turf next to target, etc
    sensors_range = 32

/datum/ship_characteristic/ascent/supercarrier/New()
    cannons = list()

    ammo = list()

    ..()
