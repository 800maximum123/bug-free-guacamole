/obj/overmap/simulated_ship/scg/fighter_spear
    name = "PM-57 Spear"
    desc = "A small Sol fighter, designed for close-space combat and armed with massive boarding harpoon, broadcasting SCGSV codes."
    icon = 'mods/_fd/ai_overmap_objects/icons/scg/sfv32.dmi'
    icon_state = "sfv-spear"
    moving_state = "sfv-spear_moving"
    characteristic = new /datum/ship_characteristic/scg/fighter_spear()

/datum/ship_characteristic/scg/fighter_spear
    max_health = 18000
    max_shield = 0
    shield_regen_speed = 4 *(1 SECOND)
    vessel_mass = 9000
    vessel_size = SHIP_SIZE_TINY
    max_speed = 8*(3 SECOND) //240
    min_targeted_distance_to_target = 1
    max_targeted_distance_to_target = 1
    sensors_range = 10

/datum/ship_characteristic/scg/fighter_spear/New()
    cannons = list(
        "minigun_1" = list("type" = /obj/machinery/computer/ship/ship_weapon/minigun, "accurace" = 95, "damage" = 0),
        "minigun_2" = list("type" = /obj/machinery/computer/ship/ship_weapon/minigun, "accurace" = 95, "damage" = 0)
    )

    ammo = list(
        "minigun_ammo" = list("type" = /obj/item/ammo_magazine/ammobox/minigun, "ammount" = 6),
    )

    ..()
