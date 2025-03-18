/obj/overmap/simulated_ship/scg/frigate_somme
    name = "Somme-class Frigate"
    desc = "Support class vessel with drone carrying capabilities and light weaponary, broadcasting SCGSV codes."
    icon = 'mods/_fd/ai_overmap_objects/icons/scg/sfv32.dmi'
    icon_state = ""
    moving_state = ""
    characteristic = new /datum/ship_characteristic/scg/frigate_somme()

/datum/ship_characteristic/scg/frigate_somme
    max_health = 85000
    max_shield = 18000
    shield_regen_speed = 4 *(1 SECOND)
    vessel_mass = 100000
    vessel_size = SHIP_SIZE_SMALL
    max_speed = 11*(3 SECOND) //330
    min_targeted_distance_to_target = 3
    max_targeted_distance_to_target = 3
    sensors_range = 20

/datum/ship_characteristic/scg/frigate_somme/New()
    cannons = list(
        "hmg_1" = list("type" = /obj/machinery/computer/ship/ship_weapon/hmg, "accurace" = 80, "damage" = 0),
        "hmg_2" = list("type" = /obj/machinery/computer/ship/ship_weapon/hmg, "accurace" = 80, "damage" = 0),
        "hmg_3" = list("type" = /obj/machinery/computer/ship/ship_weapon/hmg, "accurace" = 80, "damage" = 0),
        "disruptor_1" = list("type" = /obj/machinery/computer/ship/ship_weapon/disruptor, "accurace" = 85, "damage" = 0),
    )

    ammo = list(
        "hmg_ammo" = list("type" = /obj/item/ammo_magazine/ammobox/hmg, "ammount" = 40),
        "disruptor_ammo" = list("type" = /obj/item/ammo_magazine/ammobox/disruptor, "ammount" = 10)
    )

    ..()
