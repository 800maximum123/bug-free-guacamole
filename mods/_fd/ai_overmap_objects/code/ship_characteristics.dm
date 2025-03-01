// Do not forget to add it to AI holder if you'll add more factions
#define AI_TEAM_FFA -1
#define AI_TEAM_NEUTRAL 0
#define AI_TEAM_HUMANS 1
#define AI_TEAM_ASCENTS 2

#define AI_MODE_DEFEND "defend" // Stay and wait for targets, then engage
#define AI_MODE_HUNT "hunt" // Randomly walk at max speed/3 and wait for targets, then engage
#define AI_MODE_ESCORT "escort" // Follow closest friendlt and wait for target, then engage. After that return to following
#define AI_MODE_PATROL "patrol" // Choose point, go back and forth until target, then engage. After that return to patroling

/datum/ship_characteristic
	// Permanents, change in code via inheritance
	var/team = AI_TEAM_FFA
	var/ai_mode = AI_MODE_DEFEND
	var/max_health = 5000
	var/max_shield = 10000
	var/shield_regen_speed = 10 *(1 SECOND)				// Change first number, shield recharge speed
	var/shield_discharched_regen_speed = 120 *(1 SECOND)	// Change first number, how many seconds it takes to start regenerating shield after full deplition
	var/vessel_mass = 10000								// Tonnes
	var/vessel_size = SHIP_SIZE_LARGE
	var/max_speed = 1 *(1 SECOND)						// Change first number, "Speed of light" for the ship, in turfs/second
	var/sensors_range = 10								// In turfs
	// These two - the AI will try to stay in this range while attacking/escorting/etc the ship. Min should be < max, obv
	var/max_targeted_distance_to_target = 2				// 1 - Right on target, 2 - turf next to target, etc
	var/min_targeted_distance_to_target = 2				// 1 - Right on target, 2 - turf next to target, etc
	var/list/cannons = list() 							// Cannon: accuracy
	var/list/ammo = list()								// Ammo: count

	// DO NOT CHANGE, used in code, changed constantly in game process
	var/shield_timer = null
	var/health = null
	var/shield = null
	//var/speed = null
	// In %
	var/reactor_damage = 0
	var/engine_damage = 0
	var/shield_damage = 0
	var/list/valid_internal_systems = list()
	var/list/valid_outer_systems = list()
	var/should_die = FALSE

	// Fuck it. We should do cooldowns here BUT I DON'T CARE. I just want to sleep. I want to see anything but my IDE theme
	// I truly promise that I will change that in the future. I PROMISE
	//var/cannons_in_cooldown = list()

	// You should not probably change this, but you can if you want to do something wacky (Space-mines anyone?)
	var/ai_enabled = TRUE
	var/ai_move_enabled = TRUE
	var/ai_attack_enabled = TRUE
	var/ai_flee_enabled = TRUE
	var/ai_break_mechanic_enable = TRUE // Breaking of engines, guns, reactor, etc
	var/ai_ammo_enable = TRUE // Infinite or finite ammo for guns (Electrical is always infinite)

/datum/ship_characteristic/New()
	health = max_health
	shield = max_shield
	for(var/key in ammo)
		var/list/entry = ammo[key]
		entry["ammount"] = get_ammo_max_ammo(entry["type"]) * entry["ammount"]
	for(var/key in cannons)
		var/list/entry = cannons[key]
		entry["max_cooldown"] = get_weapon_coolinterval(entry["type"])
		entry["cooldown"] = 0
		entry["ammo_per_shot"] = get_weapon_ammo_per_shot(entry["type"])
		entry["burst_size"] = get_weapon_burst_size(entry["type"])
	valid_internal_systems += "reactor"
	valid_internal_systems += "shield"
	valid_outer_systems += "engine"
	for(var/key in cannons)
		valid_outer_systems += key
	create_shield_timer()

/datum/ship_characteristic/Destroy()
	cannons.Cut()
	ammo.Cut()
	//cannons_in_cooldown.Cut()

	QDEL_NULL_LIST(valid_internal_systems)
	QDEL_NULL_LIST(valid_outer_systems)
	deltimer(shield_timer)
	..()

/datum/ship_characteristic/proc/get_wreck_type()
	switch(vessel_size)
		if(SHIP_SIZE_TINY)
			return /obj/overmap/event/ship_wreck/tiny_ship_wreck
		if(SHIP_SIZE_SMALL)
			return /obj/overmap/event/ship_wreck/small_ship_wreck
		if(SHIP_SIZE_LARGE)
			return /obj/overmap/event/ship_wreck/large_ship_wreck
		else
			return null

/datum/ship_characteristic/proc/damage_system(damage, system)
	switch(system)
		if("reactor")
			reactor_damage = min(reactor_damage + damage, 100)
			if(reactor_damage == 100)
				health = 0
				should_die = TRUE
				// Logic in ship obj
				valid_internal_systems -= "reactor" // You're dead but lmao
		if("shield")
			shield_damage = min(shield_damage + damage, 100)
			// Logic in ship_characteristic/proc/recharge_shield proc
			if(shield_damage == 100)
				valid_internal_systems -= "shield"
		if("engine")
			engine_damage = min(engine_damage + damage, 100)
			// Logic in ai_handler object
			if(engine_damage == 100)
				valid_outer_systems -= "engine"
		else // Weapons but also other shinenigans
			if(system in cannons)
				cannons[system]["damage"] = min(cannons[system]["damage"] + damage, 100)
				// Logic in ai_handler object (TODO: move it to the ship obj)
				if(engine_damage == 100)
					valid_outer_systems -= cannons[system]
			else // Null or something errored
				return

/datum/ship_characteristic/proc/apply_damage(hull_damage, shield_damage, internal_systems_damage, internal_systems_damaged_count, outer_systems_damage, outer_systems_damaged_count)
	if(health == 0)
		should_die = TRUE
		return // We need no logic after that because simulated ship will suicide soon

	if(shield > 0)
		shield = max(shield - shield_damage, 0)
		if(shield != 0)
			return
		handle_shield_discharge()

	// Shield is broken, damage everything else
	health = max(health - hull_damage, 0)
	if(health == 0)
		should_die = TRUE
		return

	for(var/i in 0 to internal_systems_damaged_count)
		damage_system(internal_systems_damage, pick(valid_internal_systems))

	for(var/i in 0 to outer_systems_damaged_count)
		damage_system(outer_systems_damage, pick(valid_outer_systems))

/datum/ship_characteristic/proc/calculate_damage(damage, damage_type, agony, temperature, explosion_radius, explosion_type, armor_penetration, penetrating, penetration_modifier, proximity_detonation)
	// All needed damage:
	// hull_damage
	// shield_damage
	// internal_systems_damage
	// internal_systems_damaged_count - сколько систем было повреждено. Если больше максимума, то ставим максимум. Если больше чем 1, то делим урон рандомными долями по всем выбранным системам
	// outer_systems_damage
	// outer_systems_damaged_count

	// Damage modifiers from projectiles:
	// damage - 450 autocannon
	// damage_type - DAMAGE_BRUTE, DAMAGE_BURN, SHIELD_DAMTYPE_EM/SHIELD_DAMTYPE_HEAT
	// agony - 20 disruptor cannon
	// temperature - T0C + 300 disruptor cannon

	// explosion_radius - 8 autocanon HE
	// explosion_type - (EX_ACT_LIGHT), EX_ACT_HEAVY (HMG and minigun HE), EX_ACT_DEVASTATING (autocannon HE/AH, beam, crystal, lance)
	// proximity_detonation = true

	// armor_penetration - 60 autocannon AH - Has no description but is /obj's var and is literally armor penetration
	// penetrating - 6 autocannon AP //If greater than zero, the projectile will pass through dense objects as specified by on_penetrate()
	// penetration_modifier - 1.1 autocannon AP  //How likely this projectile is to embed or rupture artery

	var/explosion_modifier = 4 - explosion_type // 4 because the lightest is 3, so it would be 1 if light, 2 if medium, 3 if devastating

	var/hull_damage = 0
	var/shield_damage = 0
	var/internal_systems_damage = 0
	var/internal_systems_damaged_count = 0
	var/outer_systems_damage = 0
	var/outer_systems_damaged_count = 0

	if(damage_type == DAMAGE_BRUTE)
		hull_damage += damage
		shield_damage += damage * 0.75 //75%
	else if(damage_type == DAMAGE_BURN)
		hull_damage += damage * 0.3
		shield_damage += damage * 1.5
	else if(damage_type == SHIELD_DAMTYPE_EM || damage_type == SHIELD_DAMTYPE_HEAT)
		shield_damage += damage * 25
	else
		hull_damage += damage
		shield_damage += damage

	if(explosion_type && explosion_radius)
		var/explosion_damage_calculated = damage * explosion_radius * explosion_modifier

		if(proximity_detonation)
			if(proximity_detonation == TRUE)
				hull_damage += explosion_damage_calculated
				//shield_damage += explosion_damage_calculated / 2
				outer_systems_damage += explosion_damage_calculated
				outer_systems_damaged_count += rand(0, explosion_radius)
			else if (proximity_detonation == FALSE)
				hull_damage += explosion_damage_calculated / 4
				//shield_damage += explosion_damage_calculated / 2
				internal_systems_damage += explosion_damage_calculated
				internal_systems_damaged_count += rand(0, explosion_radius)

	if(armor_penetration)
		hull_damage *= armor_penetration * 0.5

	if(penetrating && penetration_modifier)
		var/armor_modifier_calculated = penetrating * penetration_modifier
		hull_damage *= armor_modifier_calculated
		internal_systems_damaged_count += rand(1, armor_modifier_calculated)

	return list(
		"hull_damage" = round(hull_damage),\
		"shield_damage" = round(shield_damage),\
		"internal_systems_damage" = round(internal_systems_damage),\
		"internal_systems_damaged_count" = round(internal_systems_damaged_count),\
		"outer_systems_damage" = round(outer_systems_damage),\
		"outer_systems_damaged_count" = round(outer_systems_damaged_count)
	)


/datum/ship_characteristic/proc/create_shield_timer()
	if(max_shield > 0)
		shield_timer = addtimer(new Callback(src, PROC_REF(recharge_shield)), 5 SECONDS, TIMER_LOOP | TIMER_STOPPABLE)

/datum/ship_characteristic/proc/recharge_shield()
	var/shield_real_max = round(max_shield - (max_shield * (shield_damage / 100))) // I.E. 1000 - (1000 * (20 / 100))
	if(shield < shield_real_max)
		if(shield + shield_regen_speed <= shield_real_max)
			shield += shield_regen_speed
		else
			shield = shield_real_max
	if(shield > shield_real_max) // If we were damaged in the systems but not the shields somehow
		shield = shield_real_max
/datum/ship_characteristic/proc/handle_shield_discharge()
	if(shield == 0)
		deltimer(shield_timer)
		sleep(shield_discharched_regen_speed)
		create_shield_timer()

/datum/ship_characteristic/proc/get_additional_info()
	var/list/info
	info += "<br>Hull:<br> [health]"
	info += "<br>Shield:<br> [shield]"
	info += ""
	info += "<br>Systems:"
	info += "<br>Reactor condition:<br> [reactor_damage]%"
	info += "<br>Engines condition ':<br> [engine_damage]%"
	info += "<br>Shield condition:<br> [shield_damage]%"

	info += list("Detected cannons:<ul>")
	for(var/key in cannons)
		var/list/cannon_information = cannons[key]
		var/obj/machinery/computer/ship/ship_weapon/type = cannon_information["type"]
		info += ("<li>" + type.gun_name + " - " + cannon_information["damage"] + "% damage")
	info += "</ul>"
	return JOINTEXT(info)

/datum/ship_characteristic/proc/get_random_ready_to_fire_cannon()
	for(var/key in cannons)
		var/list/entry = cannons[key]
		if(entry["cooldown"] == 0)
			return key
	return null
/datum/ship_characteristic/proc/get_all_ready_to_fire_cannon()
	var/list/result = list()
	for(var/key in cannons)
		var/list/entry = cannons[key]
		if(entry["cooldown"] == 0)
			result += key
	return result
/datum/ship_characteristic/proc/get_ammo_max_ammo(obj/item/ammo_magazine/ammobox/O)
	return O.max_ammo
/datum/ship_characteristic/proc/get_ammo_ammo_type(obj/item/ammo_magazine/ammobox/O)
	return O.ammo_type
/datum/ship_characteristic/proc/get_projectile_type(obj/item/ammo_magazine/ammobox/O)
	var/obj/item/ammo_casing/huge_caliber/OO = O.ammo_type
	return OO.projectile_type
/datum/ship_characteristic/proc/get_ammo_caliber(obj/item/ammo_magazine/ammobox/O)
	return O.caliber

/datum/ship_characteristic/proc/get_weapon_caldigit(obj/machinery/computer/ship/ship_weapon/O)
	return O.caldigit
/datum/ship_characteristic/proc/get_weapon_coolinterval(obj/machinery/computer/ship/ship_weapon/O)
	return O.coolinterval
/datum/ship_characteristic/proc/get_weapon_munition_type(obj/machinery/computer/ship/ship_weapon/O)
	return O.munition_type
/datum/ship_characteristic/proc/get_weapon_ammo_per_shot(obj/machinery/computer/ship/ship_weapon/O)
	return O.ammo_per_shot
/datum/ship_characteristic/proc/get_weapon_burst_size(obj/machinery/computer/ship/ship_weapon/O)
	return O.burst_size
/datum/ship_characteristic/proc/get_weapon_fire_interval(obj/machinery/computer/ship/ship_weapon/O)
	return O.fire_interval

//	return O.gun_name
//	return O.munition_type
//	return O.coolinterval
//	return O.max_ammo
//	var/ammo_per_shot = 1	//��� ����� ���� ��������� �� �������
//	var/burst_size = 3		//������� ��� ���
//	var/fire_interval = 5	//��� ����� ����� ������ ���
//	var/fire_delay = 0
