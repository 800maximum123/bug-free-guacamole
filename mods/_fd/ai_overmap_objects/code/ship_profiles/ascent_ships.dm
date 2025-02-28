// Drone

/obj/overmap/simulated_ship/ascent/drone
    name = "unknown drone"
    desc = "unknown drone"
    icon_state = "shuttle"
    moving_state = "shuttle_moving"
    color = "#ab36c5"
    characteristic = new /datum/ship_characteristic/ascent/drone()

/datum/ship_characteristic/ascent/drone
    max_health = 500
    max_shield = 0
    vessel_mass = 5000
    vessel_size = SHIP_SIZE_TINY
    max_speed = 22 *(1 SECOND)                        // Change first number, "Speed of light" for the ship, in turfs/second
    min_targeted_distance_to_target = 1                // 1 - Right on target, 2 - turf next to target, etc
    max_targeted_distance_to_target = 2                // 1 - Right on target, 2 - turf next to target, etc
    sensors_range = 6

/datum/ship_characteristic/ascent/drone/New()
    cannons = list(
        "hmg_1" = list("type" = /obj/machinery/computer/ship/ship_weapon/hmg, "accurace" = 95, "damage" = 0),
        "hmg_2" = list("type" = /obj/machinery/computer/ship/ship_weapon/hmg, "accurace" = 95, "damage" = 0)
    )

    ammo = list(
        "hmg_ammo" = list("type" = /obj/item/ammo_magazine/ammobox/hmg, "ammount" = 4)
    )

    ..()

// Fighter

/obj/overmap/simulated_ship/ascent/fighter
    name = "unknown fighter"
    desc = ""
    icon = 'mods/_fd/fd_assets/icons/overmap.dmi'
    icon_state = "sfv-bull"
    moving_state = "sfv-bull_moving"
    color = "#ab36c5"
    characteristic = new /datum/ship_characteristic/ascent/fighter()

/datum/ship_characteristic/ascent/fighter
    max_health = 1000
    max_shield = 200
    vessel_mass = 15000
    vessel_size = SHIP_SIZE_TINY
    max_speed = 20 *(1 SECOND)                        // Change first number, "Speed of light" for the ship, in turfs/second
    min_targeted_distance_to_target = 1                // 1 - Right on target, 2 - turf next to target, etc
    max_targeted_distance_to_target = 4                // 1 - Right on target, 2 - turf next to target, etc
    sensors_range = 6

/datum/ship_characteristic/ascent/fighter/New()
    cannons = list(
        "autocannon_1" = list("type" = /obj/machinery/computer/ship/ship_weapon/autocannon, "accurace" = 85, "damage" = 0),
        "autocannon_2" = list("type" = /obj/machinery/computer/ship/ship_weapon/autocannon, "accurace" = 85, "damage" = 0)
    )

    ammo = list(
        "autocannon_ammo" = list("type" = /obj/item/ammo_magazine/ammobox/autocannon, "ammount" = 6)
    )

    ..()

// Corvette

/obj/overmap/simulated_ship/ascent/corvette
    name = "unknown corvette"
    desc = ""
    icon = 'mods/_fd/fd_assets/icons/overmap.dmi'
    icon_state = "sfv-star"
    moving_state = "sfv-star_moving"
    color = "#ab36c5"
    characteristic = new /datum/ship_characteristic/ascent/corvette()

/datum/ship_characteristic/ascent/corvette
    max_health = 2500
    max_shield = 500
    vessel_mass = 65000
    vessel_size = SHIP_SIZE_SMALL
    max_speed = 12 *(1 SECOND)                        // Change first number, "Speed of light" for the ship, in turfs/second
    min_targeted_distance_to_target = 1                // 1 - Right on target, 2 - turf next to target, etc
    max_targeted_distance_to_target = 5                // 1 - Right on target, 2 - turf next to target, etc
    sensors_range = 9

/datum/ship_characteristic/ascent/corvette/New()
    cannons = list(
        "autocannon_1" = list("type" = /obj/machinery/computer/ship/ship_weapon/autocannon, "accurace" = 85, "damage" = 0),
        "autocannon_2" = list("type" = /obj/machinery/computer/ship/ship_weapon/autocannon, "accurace" = 85, "damage" = 0)
        "hmg_1" = list("type" = /obj/machinery/computer/ship/ship_weapon/hmg, "accurace" = 85, "damage" = 0)
        "hmg_2" = list("type" = /obj/machinery/computer/ship/ship_weapon/hmg, "accurace" = 85, "damage" = 0)
    )

    ammo = list(
        "autocannon_ammo" = list("type" = /obj/item/ammo_magazine/ammobox/autocannon, "ammount" = 16)
        "hmg_ammo" = list("type" = /obj/item/ammo_magazine/ammobox/hmg, "ammount" = 10)
    )

    ..()

// Frigate

/obj/overmap/simulated_ship/ascent/frigate
    name = "unknown frigate"
    desc = ""
    icon = 'mods/_fd/fd_assets/icons/overmap.dmi'
    icon_state = "sfv-spear"
    moving_state = "sfv-spear_moving"
    color = "#ab36c5"
    characteristic = new /datum/ship_characteristic/ascent/frigate()

/datum/ship_characteristic/ascent/frigate
    max_health = 4000
    max_shield = 1500
    vessel_mass = 100000
    vessel_size = SHIP_SIZE_SMALL
    max_speed = 16 *(1 SECOND)                        // Change first number, "Speed of light" for the ship, in turfs/second
    min_targeted_distance_to_target = 1                // 1 - Right on target, 2 - turf next to target, etc
    max_targeted_distance_to_target = 4                // 1 - Right on target, 2 - turf next to target, etc
    sensors_range = 12

/datum/ship_characteristic/ascent/frigate/New()
    cannons = list(
        "particle_lance" = list("type" = /obj/machinery/computer/ship/ship_weapon/beam_cannon/particle_lance, "accurace" = 75, "damage" = 0),
    )

    ammo = list()

    ..()

// Destroyer

/obj/overmap/simulated_ship/ascent/destroyer
    name = "unknown destroyer"
    desc = ""
    icon = 'mods/_fd/_maps/a_destroyer/icons/a_destroyer.dmi'
    icon_state = "ship"
    moving_state = "ship_moving"
    color = "#ab36c5"
    characteristic = new /datum/ship_characteristic/ascent/destroyer()

/datum/ship_characteristic/ascent/destroyer
    max_health = 7000
    max_shield = 2000
    vessel_mass = 210000
    vessel_size = SHIP_SIZE_SMALL
    max_speed = 12 *(1 SECOND)                        // Change first number, "Speed of light" for the ship, in turfs/second
    min_targeted_distance_to_target = 1                // 1 - Right on target, 2 - turf next to target, etc
    max_targeted_distance_to_target = 4                // 1 - Right on target, 2 - turf next to target, etc
    sensors_range = 16

/datum/ship_characteristic/ascent/destroyer/New()
    cannons = list(
        "particle_lance_1" = list("type" = /obj/machinery/computer/ship/ship_weapon/beam_cannon/particle_lance, "accurace" = 75, "damage" = 0),
        "particle_lance_2" = list("type" = /obj/machinery/computer/ship/ship_weapon/beam_cannon/particle_lance, "accurace" = 75, "damage" = 0)
    )

    ammo = list()

    ..()

// Battleship

/obj/overmap/simulated_ship/ascent/battleship
    name = "unknown battleship"
    desc = ""
    /*icon = 'mods/.../ascent_ships.dmi'*/
    icon_state = "battleship"
    moving_state = "battleship_moving"
    color = "#ab36c5"
    characteristic = new /datum/ship_characteristic/ascent/battleship()

/datum/ship_characteristic/ascent/battleship
    max_health = 80000
    max_shield = 10000
    vessel_mass = 900000
    vessel_size = SHIP_SIZE_LARGE
    max_speed = 5 *(1 SECOND)                        // Change first number, "Speed of light" for the ship, in turfs/second
    min_targeted_distance_to_target = 1                // 1 - Right on target, 2 - turf next to target, etc
    max_targeted_distance_to_target = 6                // 1 - Right on target, 2 - turf next to target, etc
    sensors_range = 24

/datum/ship_characteristic/ascent/battleship/New()
    cannons = list(
        "particle_lance_1" = list("type" = /obj/machinery/computer/ship/ship_weapon/beam_cannon/particle_lance, "accurace" = 70, "damage" = 0),
        "particle_lance_2" = list("type" = /obj/machinery/computer/ship/ship_weapon/beam_cannon/particle_lance, "accurace" = 70, "damage" = 0),
        "particle_lance_3" = list("type" = /obj/machinery/computer/ship/ship_weapon/beam_cannon/particle_lance, "accurace" = 70, "damage" = 0),
        "particle_lance_4" = list("type" = /obj/machinery/computer/ship/ship_weapon/beam_cannon/particle_lance, "accurace" = 70, "damage" = 0),
        "particle_lance_5" = list("type" = /obj/machinery/computer/ship/ship_weapon/beam_cannon/particle_lance, "accurace" = 70, "damage" = 0),
        "particle_lance_6" = list("type" = /obj/machinery/computer/ship/ship_weapon/beam_cannon/particle_lance, "accurace" = 70, "damage" = 0),
    )

    ammo = list()

    ..()

// Supercarrier

/obj/overmap/simulated_ship/ascent/supercarrier
    name = "unknown supercarrier"
    desc = ""
    /*icon = 'mods/.../ascent_ships.dmi'*/
    icon_state = "supercarrier"
    moving_state = "supercarrier_moving"
    color = "#ab36c5"
    characteristic = new /datum/ship_characteristic/ascent/supercarrier()

/datum/ship_characteristic/ascent/supercarrier
    max_health = 3500000
    max_shield = 500000
    vessel_mass = 6000000
    vessel_size = SHIP_SIZE_LARGE
    max_speed = 1.5 *(1 SECOND)                        // Change first number, "Speed of light" for the ship, in turfs/second
    min_targeted_distance_to_target = 1                // 1 - Right on target, 2 - turf next to target, etc
    max_targeted_distance_to_target = 8                // 1 - Right on target, 2 - turf next to target, etc
    sensors_range = 32

/datum/ship_characteristic/ascent/supercarrier/New()
    cannons = list()

    ammo = list()

    ..()
