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
	create_shield_timer()

/datum/ship_characteristic/Destroy()
	//TODO: is this neccesasy?
	for(var/name in cannons)
		var/list/cannon_data = cannons[name]
		QDEL_NULL_ASSOC_LIST(cannon_data)
	QDEL_NULL_LIST(cannons)
	for(var/name in ammo)
		var/list/ammo_data = ammo[name]
		QDEL_NULL_ASSOC_LIST(ammo_data)
	QDEL_NULL_LIST(ammo)

	deltimer(shield_timer)
	..()

/datum/ship_characteristic/proc/set_health(ammount)
	health = ammount

/datum/ship_characteristic/proc/set_shield(ammount)
	shield = ammount

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

/datum/ship_characteristic/proc/damage_random_system(damage, is_internal)
	//if(is_internal)

/datum/ship_characteristic/proc/apply_damage(hull_damage, shield_damage, internal_systems_damage, internal_systems_damaged_count)


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
		shield_damage += damage * 0.75
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
	if(shield < max_shield)
		if(shield + shield_regen_speed <= max_shield)
			shield += shield_regen_speed
		else
			shield = max_shield

/datum/ship_characteristic/proc/handle_shield_discharge()
	if(shield == 0)
		deltimer(shield_timer)
		sleep(shield_discharched_regen_speed)
		create_shield_timer()


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
