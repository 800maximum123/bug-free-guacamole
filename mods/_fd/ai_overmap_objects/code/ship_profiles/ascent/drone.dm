/obj/overmap/simulated_ship/ascent/drone
    name = "Unknown Drone"
    desc = ""
    icon = 'mods/_fd/ai_overmap_objects/icons/ascent/ascent_ships.dmi'
    icon_state = "drone"
    moving_state = "drone_moving"
    characteristic = new /datum/ship_characteristic/ascent/drone()

/datum/ship_characteristic/ascent/drone
    max_health = 12000
    max_shield = 0
    shield_regen_speed = 7 *(1 SECOND)
    vessel_mass = 5000
    vessel_size = SHIP_SIZE_TINY
    max_speed = 5*(3 SECOND) //150
    min_targeted_distance_to_target = 1
    max_targeted_distance_to_target = 1
    sensors_range = 10

/datum/ship_characteristic/ascent/drone/New()
    cannons = list(
        "crystal_1" = list("type" = /obj/machinery/computer/ship/ship_weapon/crystal_launcher, "accurace" = 80, "damage" = 0),
    )

    ammo = list(
        "crystall_ammo" = list("type" = /obj/item/ammo_magazine/ammobox/crystal/shrapnel, "ammount" = 6)
    )

    ..()
