/obj/overmap/simulated_ship/ascent/fighter
    name = "unknown fighter"
    desc = ""
    icon = 'mods/_fd/fd_assets/icons/overmap.dmi'
    icon_state = "sfv-bull"
    moving_state = "sfv-bull_moving"
    characteristic = new /datum/ship_characteristic/ascent/fighter()

/datum/ship_characteristic/ascent/fighter
    max_health = 30000
    max_shield = 2500
    shield_regen_speed = 7 *(1 SECOND)
    vessel_mass = 15000
    vessel_size = SHIP_SIZE_TINY
    max_speed = 6 *(1 SECOND)
    min_targeted_distance_to_target = 1
    max_targeted_distance_to_target = 1
    sensors_range = 10

/datum/ship_characteristic/ascent/fighter/New()
    cannons = list(
        "crystal_1" = list("type" = /obj/machinery/computer/ship/ship_weapon/crystal_launcher, "accurace" = 95, "damage" = 0),
        "crystal_2" = list("type" = /obj/machinery/computer/ship/ship_weapon/crystal_launcher, "accurace" = 95, "damage" = 0)
    )

    ammo = list(
        "crystall_ammo" = list("type" = /obj/item/ammo_magazine/ammobox/crystal/high_explosive, "ammount" = 4)
    )

    ..()
