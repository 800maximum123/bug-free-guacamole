/obj/overmap/simulated_ship/scg/hmg_drone
    name = "RBD-6 drone"
    desc = "Tiny close-combat automated battle drone. Weak, but fast - effective solution to swarm enemies down with high quantity of these."
    icon = 'mods/_fd/ai_overmap_objects/icons/scg/sfv32.dmi'
    icon_state = "drone"
    moving_state = "drone_moving"
    characteristic = new /datum/ship_characteristic/scg/hmg_drone()

/datum/ship_characteristic/scg/hmg_drone
    max_health = 8000
    max_shield = 0
    shield_regen_speed = 7 *(1 SECOND)
    vessel_mass = 5000
    vessel_size = SHIP_SIZE_TINY
    max_speed = 5*(3 SECOND) //150
    min_targeted_distance_to_target = 1
    max_targeted_distance_to_target = 1
    sensors_range = 10

/datum/ship_characteristic/scg/hmg_drone/New()
    cannons = list(
        "hmg_1" = list("type" = /obj/machinery/computer/ship/ship_weapon/hmg, "accurace" = 90, "damage" = 0),
    )

    ammo = list(
        "hmg_ammo" = list("type" = /obj/item/ammo_magazine/ammobox/hmg, "ammount" = 6)
    )

    ..()
