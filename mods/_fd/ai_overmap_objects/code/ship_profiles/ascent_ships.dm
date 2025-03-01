    // Damage modifiers from projectiles:
    // damage - 450 autocannon
    // damage_type - DAMAGE_BRUTE, DAMAGE_BURN, SHIELD_DAMTYPE_EM/SHIELD_DAMTYPE_HEAT
    // agony - 20 disruptor cannon
    // temperature - T0C + 300 disruptor cannon

    // explosion_radius - 8 autocanon HE
    // explosion_type - (EX_ACT_LIGHT), EX_ACT_HEAVY (HMG and minigun HE), EX_ACT_DEVASTATING (autocannon HE/AH, beam, crystal, lance)

    // armor_penetration - 60 autocannon AH
    // penetrating - 6 autocannon AP
    // penetration_modifier - 1.1 autocannon AP

    // proximity_detonation


// Drone

/obj/overmap/simulated_ship/ascent/drone
    name = "unknown drone"
    desc = ""
    icon_state = "shuttle"
    moving_state = "shuttle_moving"
    characteristic = new /datum/ship_characteristic/ascent/drone()

/datum/ship_characteristic/ascent/drone
    max_health = 12500
    max_shield = 0
    vessel_mass = 5000
    vessel_size = SHIP_SIZE_TINY
    max_speed = 8 *(1 SECOND)                        // Change first number, "Speed of light" for the ship, in turfs/second
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
    characteristic = new /datum/ship_characteristic/ascent/fighter()

/datum/ship_characteristic/ascent/fighter
    max_health = 30000
    max_shield = 5000
    vessel_mass = 15000
    vessel_size = SHIP_SIZE_TINY
    max_speed = 6 *(1 SECOND)                        // Change first number, "Speed of light" for the ship, in turfs/second
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
    characteristic = new /datum/ship_characteristic/ascent/corvette()

/datum/ship_characteristic/ascent/corvette
    max_health = 62500
    max_shield = 12500
    vessel_mass = 65000
    vessel_size = SHIP_SIZE_SMALL
    max_speed = 10 *(1 SECOND)                        // Change first number, "Speed of light" for the ship, in turfs/second
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
    characteristic = new /datum/ship_characteristic/ascent/frigate()

/datum/ship_characteristic/ascent/frigate
    max_health = 100000
    max_shield = 37500
    vessel_mass = 100000
    vessel_size = SHIP_SIZE_SMALL
    max_speed = 10 *(1 SECOND)                        // Change first number, "Speed of light" for the ship, in turfs/second
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
    characteristic = new /datum/ship_characteristic/ascent/destroyer()

/datum/ship_characteristic/ascent/destroyer
    max_health = 175000
    max_shield = 50000
    vessel_mass = 210000
    vessel_size = SHIP_SIZE_SMALL
    max_speed = 14 *(1 SECOND)                        // Change first number, "Speed of light" for the ship, in turfs/second
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
    icon = 'mods/_fd/ai_overmap_objects/icons/ascent_ships.dmi'
    icon_state = "battleship"
    moving_state = "battleship_moving"
    characteristic = new /datum/ship_characteristic/ascent/battleship()

/datum/ship_characteristic/ascent/battleship
    max_health = 2000000
    max_shield = 250000
    vessel_mass = 900000
    vessel_size = SHIP_SIZE_LARGE
    max_speed = 24 *(1 SECOND)                        // Change first number, "Speed of light" for the ship, in turfs/second
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
    icon = 'mods/_fd/ai_overmap_objects/icons/ascent_ships.dmi'
    icon_state = "supercarrier"
    moving_state = "supercarrier_moving"
    characteristic = new /datum/ship_characteristic/ascent/supercarrier()

/datum/ship_characteristic/ascent/supercarrier
    max_health = 87500000
    max_shield = 12500000
    vessel_mass = 6000000
    vessel_size = SHIP_SIZE_LARGE
    max_speed = 60 *(1 SECOND)                        // Change first number, "Speed of light" for the ship, in turfs/second
    min_targeted_distance_to_target = 1                // 1 - Right on target, 2 - turf next to target, etc
    max_targeted_distance_to_target = 8                // 1 - Right on target, 2 - turf next to target, etc
    sensors_range = 32

/datum/ship_characteristic/ascent/supercarrier/New()
    cannons = list()

    ammo = list()

    ..()
