/obj/overmap/simulated_ship/scg/fighter_nightbat
    name = "PM-15 Nightbat"
    desc = "An small Sol EW-Craft, designed for disrupting work of enemy systems, broadcasting SCGSV codes"
    icon = 'mods/_fd/ai_overmap_objects/icons/scg/sfv32.dmi'
    icon_state = "sfv-nightbat"
    moving_state = "sfv-nightbat_moving"
    characteristic = new /datum/ship_characteristic/scg/fighter_nightbat()

/datum/ship_characteristic/scg/fighter_nightbat
    max_health = 21500
    max_shield = 0
    shield_regen_speed = 4 *(1 SECOND)
    vessel_mass = 9000
    vessel_size = SHIP_SIZE_TINY
    max_speed = 7*(3 SECOND) //210
    min_targeted_distance_to_target = 2
    max_targeted_distance_to_target = 2
    sensors_range = 10

/datum/ship_characteristic/scg/fighter_nightbat/New()
    cannons = list(
        "disruptor_1" = list("type" = /obj/machinery/computer/ship/ship_weapon/disruptor, "accurace" = 85, "damage" = 0),
        "disruptor_2" = list("type" = /obj/machinery/computer/ship/ship_weapon/disruptor, "accurace" = 85, "damage" = 0)
    )

    ammo = list(
        "disruptor_ammo" = list("type" = /obj/item/ammo_magazine/ammobox/disruptor, "ammount" = 16),
    )

    ..()
