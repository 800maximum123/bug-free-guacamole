/obj/overmap/simulated_ship/ascent/battleship
    name = "unknown battleship"
    desc = ""
    icon = 'mods/_fd/ai_overmap_objects/icons/ascent_ships.dmi'
    icon_state = "battleship"
    moving_state = "battleship_moving"
    characteristic = new /datum/ship_characteristic/ascent/battleship()

/datum/ship_characteristic/ascent/battleship
    max_health = 2000000
    max_shield = 250000
    vessel_mass = 900000
    vessel_size = SHIP_SIZE_LARGE
    max_speed = 24 *(1 SECOND)                        // Change first number, "Speed of light" for the ship, in turfs/second
    min_targeted_distance_to_target = 1                // 1 - Right on target, 2 - turf next to target, etc
    max_targeted_distance_to_target = 6                // 1 - Right on target, 2 - turf next to target, etc
    sensors_range = 24

/datum/ship_characteristic/ascent/battleship/New()
    cannons = list(
        "particle_lance_1" = list("type" = /obj/machinery/computer/ship/ship_weapon/beam_cannon/particle_lance, "accurace" = 70, "damage" = 0),
        "particle_lance_2" = list("type" = /obj/machinery/computer/ship/ship_weapon/beam_cannon/particle_lance, "accurace" = 70, "damage" = 0),
        "particle_lance_3" = list("type" = /obj/machinery/computer/ship/ship_weapon/beam_cannon/particle_lance, "accurace" = 70, "damage" = 0),
        "particle_lance_4" = list("type" = /obj/machinery/computer/ship/ship_weapon/beam_cannon/particle_lance, "accurace" = 70, "damage" = 0),
        "particle_lance_5" = list("type" = /obj/machinery/computer/ship/ship_weapon/beam_cannon/particle_lance, "accurace" = 70, "damage" = 0),
        "particle_lance_6" = list("type" = /obj/machinery/computer/ship/ship_weapon/beam_cannon/particle_lance, "accurace" = 70, "damage" = 0),
    )

    ammo = list()

    ..()
