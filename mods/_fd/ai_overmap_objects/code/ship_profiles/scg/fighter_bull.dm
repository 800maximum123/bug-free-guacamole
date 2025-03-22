/obj/overmap/simulated_ship/scg/fighter_bull
	name = "PM-08 Bull"
	desc = "Sol light-weighted interceptor, designed to take down enemy rockets and heavy armored ships, broadcasting SCGSV codes"
	icon = 'mods/_fd/ai_overmap_objects/icons/scg/sfv32.dmi'
	icon_state = "sfv-bull"
	moving_state = "sfv-bull_moving"
	characteristic = new /datum/ship_characteristic/scg/fighter_bull()

/datum/ship_characteristic/scg/fighter_bull
	max_health = 22500
	max_shield = 0
	shield_regen_speed = 4 *(1 SECOND)
	vessel_mass = 8000
	vessel_size = SHIP_SIZE_TINY
	max_speed = 8*(3 SECOND) //240
	min_targeted_distance_to_target = 2
	max_targeted_distance_to_target = 2
	sensors_range = 10

/datum/ship_characteristic/scg/fighter_bull/New() // дописать торпеды, 2 установки
	cannons = list(
		"missile_launcher_1" = list("type" = /obj/machinery/computer/ship/missiles, "max_cooldown" = 3000, "damage" = 0), // Раз в 30 секунд, стреляет рандомной ракетой из ammo, с учётом веса (при выборе)
		"missile_launcher_2" = list("type" = /obj/machinery/computer/ship/missiles, "max_cooldown" = 3000, "damage" = 0)
)

	ammo = list(
		"missile_nuke" = list("type" = /obj/structure/missile/locked/nuke, "weight" = 1, "ammount" = 1),
		"missile_diffusive" = list("type" = /obj/structure/missile/diffusive, "weight" = 2, "ammount" = 5),
		"missile_he" = list("type" = /obj/structure/missile/he, "weight" = 5, "ammount" = 5),
	)
	// 1/5 шанс что будет нюка
	// 2/5 шанс что будет дифузка
	// 2/5 шанс что будет ХаЕшка
	..()
