/obj/overmap/simulated_ship/ascent/corvette
    name = "Unknown Corvette"
    desc = ""
    icon = 'mods/_fd/ai_overmap_objects/icons/ascent/ascent_ships.dmi'
    icon_state = "corvette"
    moving_state = "corvette_moving"
    characteristic = new /datum/ship_characteristic/ascent/corvette()

/datum/ship_characteristic/ascent/corvette
    max_health = 60000
    max_shield = 12000
    shield_regen_speed = 7 *(1 SECOND)
    vessel_mass = 65000
    vessel_size = SHIP_SIZE_SMALL
    max_speed = 20*(3 SECOND) //600
    min_targeted_distance_to_target = 3
    max_targeted_distance_to_target = 3
    sensors_range = 15

/datum/ship_characteristic/ascent/corvette/New()
    cannons = list(
        "crystal_1" = list("type" = /obj/machinery/computer/ship/ship_weapon/crystal_launcher, "accurace" = 75, "damage" = 0),
        "crystal_2" = list("type" = /obj/machinery/computer/ship/ship_weapon/crystal_launcher, "accurace" = 75, "damage" = 0)
    )

    ammo = list(
        "crystall_ammo" = list("type" = /obj/item/ammo_magazine/ammobox/crystal/high_explosive, "ammount" = 26),
    )

    ..()
