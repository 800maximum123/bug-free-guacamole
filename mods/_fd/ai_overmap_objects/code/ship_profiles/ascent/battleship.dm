/obj/overmap/simulated_ship/ascent/battleship
    name = "Unknown battleship"
    desc = ""
    icon = 'mods/_fd/ai_overmap_objects/icons/ascent_ships.dmi'
    icon_state = "battleship"
    moving_state = "battleship_moving"
    pixel_x = -16
    pixel_y = -16
    characteristic = new /datum/ship_characteristic/ascent/battleship()

/datum/ship_characteristic/ascent/battleship
    max_health = 2000000
    max_shield = 250000
    shield_regen_speed = 7 *(1 SECOND)
    vessel_mass = 900000
    vessel_size = SHIP_SIZE_LARGE
    max_speed = 24 *(1 SECOND)
    min_targeted_distance_to_target = 2
    max_targeted_distance_to_target = 2
    sensors_range = 32

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
