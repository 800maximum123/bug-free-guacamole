/obj/overmap/simulated_ship/ascent/destroyer
    name = "unknown destroyer"
    desc = ""
    icon = 'mods/_fd/_maps/a_destroyer/icons/a_destroyer.dmi'
    icon_state = "ship"
    moving_state = "ship_moving"
    characteristic = new /datum/ship_characteristic/ascent/destroyer()

/datum/ship_characteristic/ascent/destroyer
    max_health = 175000
    max_shield = 35000
    shield_regen_speed = 7 *(1 SECOND)
    vessel_mass = 210000
    vessel_size = SHIP_SIZE_SMALL
    max_speed = 14 *(1 SECOND)
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
