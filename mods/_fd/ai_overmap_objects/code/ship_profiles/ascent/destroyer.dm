/obj/overmap/simulated_ship/ascent/destroyer
    name = "Unknown Destroyer"
    desc = ""
    icon = 'mods/_fd/ai_overmap_objects/icons/ascent_ships.dmi'
    icon_state = "destroyer"
    moving_state = "destroyer_moving"
    characteristic = new /datum/ship_characteristic/ascent/destroyer()

/datum/ship_characteristic/ascent/destroyer
    max_health = 175000
    max_shield = 35000
    shield_regen_speed = 7 *(1 SECOND)
    vessel_mass = 210000
    vessel_size = SHIP_SIZE_SMALL
    max_speed = 9*(3 SECOND) //270
    min_targeted_distance_to_target = 2
    max_targeted_distance_to_target = 2
    sensors_range = 15

/datum/ship_characteristic/ascent/destroyer/New()
    cannons = list(
        "particle_lance_1" = list("type" = /obj/machinery/computer/ship/ship_weapon/beam_cannon/particle_lance, "accurace" = 75, "damage" = 0),
        "particle_lance_2" = list("type" = /obj/machinery/computer/ship/ship_weapon/beam_cannon/particle_lance, "accurace" = 75, "damage" = 0)
    )

    ammo = list()

    ..()
