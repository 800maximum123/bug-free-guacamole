/obj/overmap/simulated_ship/ascent/battlecruiser
    name = "Unknown Battlecruiser"
    desc = ""
    icon = 'mods/_fd/ai_overmap_objects/icons/ascent/large_ships.dmi'
    icon_state = "battlecruiser"
    moving_state = "battlecruiser_moving"
    pixel_x = -16
    pixel_y = -16
    characteristic = new /datum/ship_characteristic/ascent/battlecruiser()

/datum/ship_characteristic/ascent/battlecruiser
    max_health = 900000
    max_shield = 200000
    shield_regen_speed = 7 *(1 SECOND)
    vessel_mass = 500000
    vessel_size = SHIP_SIZE_LARGE
    max_speed = 6*(5 SECOND) //300
    min_targeted_distance_to_target = 2
    max_targeted_distance_to_target = 2
    sensors_range = 30

/datum/ship_characteristic/ascent/battlecruiser/New()
    cannons = list(
        "particle_lance_1" = list("type" = /obj/machinery/computer/ship/ship_weapon/beam_cannon/particle_lance, "accurace" = 80, "damage" = 0),
        "particle_lance_2" = list("type" = /obj/machinery/computer/ship/ship_weapon/beam_cannon/particle_lance, "accurace" = 80, "damage" = 0),
        "particle_lance_3" = list("type" = /obj/machinery/computer/ship/ship_weapon/beam_cannon/particle_lance, "accurace" = 80, "damage" = 0),
        "particle_lance_4" = list("type" = /obj/machinery/computer/ship/ship_weapon/beam_cannon/particle_lance, "accurace" = 80, "damage" = 0),
    )

    ammo = list()

    ..()
