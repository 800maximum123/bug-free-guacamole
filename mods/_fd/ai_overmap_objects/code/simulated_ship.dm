/obj/overmap/simulated_ship
	name = "Unknown ship"
	desc = "unknown ship"
	icon = 'mods/_fd/fd_assets/icons/overmap_eris.dmi'
	icon_state = "unkn"
	var/moving_state = "unkn_r"
	requires_contact = TRUE
	scannable = TRUE

	var/datum/ship_characteristic/characteristic = null

	// These two bad boys are for when we have real Z-level ship and
	// we want the simulation ship to only contain info about it and kinda
	// control it. Disabled for now
	var/obj/overmap/visitable/ship/linked_object = null
	var/should_link = FALSE

/obj/overmap/simulated_ship/Initialize()
	..()
	//characteristic = new()
	START_PROCESSING(SSobj, src)

/obj/overmap/simulated_ship/Destroy()
	var/obj/overmap/event/ship_wreck/type_of_wreck = characteristic.get_wreck_type()
	if(type_of_wreck)
		var/obj/overmap/event/ship_wreck/new_wreck = new type_of_wreck(get_turf(src))
		new_wreck.color = src.color
	//O.Initialize()
	if(!QDELETED(characteristic))
		QDEL_NULL(characteristic)
	..()

/obj/overmap/simulated_ship/Process()
	..()
	if(characteristic.should_die == TRUE || characteristic.health == 0) // Just for safety
		qdel(src)

/obj/overmap/simulated_ship/Crossed(obj/overmap/visitable/O)
	. = ..()
	process_projectile(O)

/obj/overmap/simulated_ship/Cross(atom/movable/O)
	. = ..()
	process_projectile(O)

/obj/overmap/simulated_ship/proc/process_projectile(atom/movable/O)
	// Bullets, rockets,
	if(istype(O, /obj/overmap/projectile))
		log_and_message_admins("Was crossed by projectile [O.name]")
		var/obj/overmap/projectile/OO = O
		var/obj/item/projectile/bullet/huge_caliber/incoming_pew = OO.actual_projectile
		if(incoming_pew)
			var/damage = incoming_pew.damage
			var/damage_type = incoming_pew.damage_type
			var/agony = incoming_pew.agony
			var/temperature = incoming_pew.temperature
			var/explosion_radius = incoming_pew.explosion_radius
			var/explosion_type = incoming_pew.explosion_max_power // Another name? WTF
			var/armor_penetration = incoming_pew.armor_penetration
			var/penetrating = incoming_pew.penetrating
			var/penetration_modifier = incoming_pew.penetration_modifier
			var/proximity_detonation = incoming_pew.proximity_detonation
			var/list/applied_damage = characteristic.calculate_damage(damage, damage_type, agony, temperature, explosion_radius, explosion_type, armor_penetration, penetrating, penetration_modifier, proximity_detonation)
			characteristic.apply_damage(arglist(applied_damage))
			for(var/key in applied_damage)
				log_and_message_admins(applied_damage[key])
			//qdel(incoming_pew)
			//OO.actual_projectile = null
		else
			log_and_message_admins(SPAN_WARNING("<b> \[Simulated ship\] Корабль по координатам [x]-[y] получил пулю без содержимого. Хуйня, проверить почему!</i></b>"))
		qdel(O)
	else if(istype(O, /obj/overmap/missile))
		log_and_message_admins("Was crossed by missle [O.name]")
		var/obj/overmap/missile/OO = O
		var/obj/structure/missile/incoming_boom = OO.actual_missile
		for(var/obj/item/missile_equipment/E in incoming_boom.equipment)
			switch(E)
				if(/obj/item/missile_equipment/payload/diffuser)
					var/list/applied_damage = characteristic.calculate_damage(\
					damage = 600,
					damage_type = SHIELD_DAMTYPE_EM,
					agony = 0,
					temperature = 0,
					explosion_radius = 0,
					explosion_type = EX_ACT_LIGHT,
					armor_penetration = 0,
					penetrating = 0,
					penetration_modifier = 0,
					proximity_detonation = FALSE)
					characteristic.apply_damage(arglist(applied_damage))
					qdel(OO)
				if(/obj/item/missile_equipment/payload/emp)
					var/list/applied_damage = characteristic.calculate_damage(\
					damage = 600,
					damage_type = DAMAGE_BURN,
					agony = 0,
					temperature = 0,
					explosion_radius = 5,
					explosion_type = EX_ACT_DEVASTATING,
					armor_penetration = 0,
					penetrating = 10,
					penetration_modifier = 1.5,
					proximity_detonation = TRUE)
					characteristic.apply_damage(arglist(applied_damage))
					qdel(OO)
				if(/obj/item/missile_equipment/payload/explosive)
					var/list/applied_damage = characteristic.calculate_damage(\
					damage = 400,
					damage_type = DAMAGE_BRUTE,
					agony = 0,
					temperature = 0,
					explosion_radius = 4,
					explosion_type = EX_ACT_DEVASTATING,
					armor_penetration = 0,
					penetrating = 5,
					penetration_modifier = 1.5,
					proximity_detonation = TRUE)
					characteristic.apply_damage(arglist(applied_damage))
					qdel(OO)
				if(/obj/item/missile_equipment/payload/nuclear)
					var/list/applied_damage = characteristic.calculate_damage(\
					damage = 1000,
					damage_type = DAMAGE_BRUTE,
					agony = 0,
					temperature = 0,
					explosion_radius = 96,
					explosion_type = EX_ACT_DEVASTATING,
					armor_penetration = 0,
					penetrating = 0,
					penetration_modifier = 0,
					proximity_detonation = TRUE)
					characteristic.apply_damage(arglist(applied_damage))
					qdel(OO)
				if(/obj/item/missile_equipment/payload/big_nuclear)
					var/list/applied_damage = characteristic.calculate_damage(\
					damage = 100000,
					damage_type = DAMAGE_BRUTE,
					agony = 0,
					temperature = 0,
					explosion_radius = 192,
					explosion_type = EX_ACT_DEVASTATING,
					armor_penetration = 0,
					penetrating = 0,
					penetration_modifier = 0,
					proximity_detonation = TRUE)
					characteristic.apply_damage(arglist(applied_damage))
					qdel(OO)
				//if(/obj/item/missile_equipment/autoarm)
				//if(/obj/item/missile_equipment/thruster)
				//if(/obj/item/missile_equipment/thruster/hunter)
				//if(/obj/item/missile_equipment/thruster/point)
				//if(/obj/item/missile_equipment/thruster/planet)
				if(/obj/item/missile_equipment/passenger)
					if(characteristic.vessel_size != SHIP_SIZE_LARGE)
						qdel(src)
						qdel(OO)

/obj/overmap/simulated_ship/get_scan_data(mob/user)
	. = ..()
	. += "<br>"
	. += "<br>Additional information:<br>[get_additional_info()]"

/obj/overmap/simulated_ship/proc/get_additional_info()
	if(characteristic)
		return characteristic.get_additional_info()
	return "N/A"

// Ship goes into event or something
///obj/overmap/simulated_ship/Entered(atom/movable/O, oldloc)
//	. = ..()
//	log_and_message_admins("Entered [O.name]")

///obj/overmap/simulated_ship/Bumped(AM)
//	. = ..()
//	log_and_message_admins(AM.name)

/obj/overmap/simulated_ship/proc/attack(obj/Target)
	log_and_message_admins(SPAN_WARNING("<b> Attacking!</i></b>"))

/obj/overmap/simulated_ship/proc/move(obj/Target)
	log_and_message_admins(SPAN_WARNING("<b> Moving!</i></b>"))

/obj/overmap/simulated_ship/proc/test()
	log_and_message_admins(SPAN_WARNING("<b> TEST</i></b>"))
