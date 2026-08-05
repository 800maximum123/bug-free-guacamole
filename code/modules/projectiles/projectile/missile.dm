// MISSILES
// Used by RPG and some other stuff

// FRAGMENTATION ROCKET
// Mild explosion, shoots out lethal shrapnel
/obj/item/projectile/missile
	name = "fragmentation rocket"
	icon = 'icons/obj/weapons/grenade.dmi'
	icon_state = "rocketshell"
	damage = 50
	weaken = 20
	step_delay = 1.2 // Surely slower then bullets
	penetration_modifier = 100 // If it sticks - it sticks
	damage_type = DAMAGE_BRUTE
	embed = TRUE
	shrapnel_type = /obj/item/grenade/frag/dud_missile // CODE BLACK!

	// Looping sound of death
	var/list/flight_sounds = list('sound/weapons/rpg_fly.ogg')
	var/flight_volume = 100
	var/flight_sound_range = 12
	var/flight_sound_id = ""
	var/datum/sound_token/flight_sound_token = null

//	TODO: Make this shit work
//	var/fuse = 3 // How long should a rocket exist before being able to detonate in step_delays

	// Explosion
	var/explosion_power = 300
	var/explosion_falloff = 50
	var/shrapnel = TRUE

/obj/item/projectile/missile/finalize_launch(turf/curloc, turf/targloc, x_offset, y_offset, angle_offset)
	. = ..()
	if(flight_sounds && !flight_sound_token)
		if(!flight_sound_id)
			flight_sound_id = "[type]_[sequential_id(type)]"
		flight_sound_token = GLOB.sound_player.PlayLoopingSound(src, flight_sound_id, pick(flight_sounds), volume = flight_volume, range = flight_sound_range, falloff = 1, prefer_mute = TRUE)

/obj/item/projectile/missile/Destroy()
	. = ..()
	if(flight_sound_token)
		QDEL_NULL(flight_sound_token)

/obj/item/projectile/missile/on_impact(atom/A)
	. = ..()
	var/turf/T = get_turf(src)
//	var/cal_fuse = life_span - fuse
	if(!T || prob(1) /*|| life_span >= cal_fuse*/) // Lucky bastard
		visible_message(SPAN_NOTICE("The [src] doesn't set off!"), SPAN_NOTICE("You hear a heavy thud!"))
		playsound(T, 'sound/items/pipe_hit.ogg', 100, TRUE)
		return FALSE

	cell_explosion(T, explosion_power, explosion_falloff, shrapnel = shrapnel)
	visible_message(SPAN_DANGER("The [src] explodes on impact!"), SPAN_DANGER("You hear a loud explosion!"))
	special_action(A, T)

// Special action performed by various types of missiles
/obj/item/projectile/missile/proc/special_action(atom/A, turf/T)
	return

// THERMOBARIC MISSILE
// Spreads out explosive thermobaric gas all over the place
// TODO: Make it not nuke the server when abused
/obj/item/projectile/missile/thermobaric
	name = "thermobaric rocket"
	icon_state = "rocket"
	shrapnel_type = /obj/item/grenade/frag/dud_missile/thermobaric

	explosion_power = 150
	explosion_falloff = 50
	shrapnel = FALSE

	var/gas_amount = 20

// THERMOBARIC MISSILE
/obj/item/projectile/missile/thermobaric/special_action(atom/A, turf/T)
	if(T)
		var/datum/effect/smoke_spread/thermobaric/smoke = new
		smoke.set_up(gas_amount, loca = T)
		smoke.start(TRUE)
		visible_message(SPAN_DANGER("Fine mist shoots from [src]!"), SPAN_DANGER("You hear a massive puff of air!"))

// HE MISSILE
// Massive shockwave, no shrapnel
/obj/item/projectile/missile/he
	name = "HE rocket"
	icon_state = "rocket_he"
	shrapnel_type = /obj/item/grenade/frag/dud_missile/he

	explosion_power = 500
	explosion_falloff = 50
	shrapnel = FALSE

/obj/item/projectile/missile/he/special_action(atom/A, turf/T)
	return

// APHE MISSILE
// Deals heavy damage to exosuits and vehicless
/obj/item/projectile/missile/aphe
	name = "APHE rocket"
	icon_state = "rocket_aphe"
	penetrating = 1
	shrapnel_type = /obj/item/grenade/frag/dud_missile/aphe

	explosion_power = 1000
	explosion_falloff = 500
	shrapnel = FALSE

	var/additional_pen = 0
	var/internal_explosion_power = 500
	var/internal_explosion_falloff = 50

/obj/item/projectile/missile/aphe/proc/mech_action(mob/living/exosuit/mech, attack_dir)
	mech.visible_message(SPAN_DANGER("The [src] pierces through the armor of [mech]!"), SPAN_DANGER("You hear a loud metallic pierce!"))
	mech.gib()
	playsound(mech, 'sound/weapons/rpg_pierce.ogg', 150, TRUE)

/obj/item/projectile/missile/aphe/proc/vehicle_action(obj/vehicles/vehicle, attack_dir)
	var/front = vehicle.frontal_hit_prob
	var/rear = vehicle.rear_hit_prob
	var/side = vehicle.side_hit_prob
	var/vehicle_dir = vehicle.dir
	// Normalize diagonal attack dirs to nearest cardinal for simplicity
	switch(attack_dir)
		if(NORTHWEST|NORTHEAST)
			attack_dir = NORTH
		if(SOUTHWEST|SOUTHEAST)
			attack_dir = SOUTH
	// Calculate angles and smallest angular difference
	var/vehicle_angle = dir2angle(vehicle_dir)
	var/attack_angle = dir2angle(attack_dir)
	var/angle_diff = abs(vehicle_angle - attack_angle)
	if(angle_diff > 180)
		angle_diff = 360 - angle_diff

	// Decide which side was hit: frontal, rear, or side
	if(angle_diff <= 45)			// Rear hit
		if(prob(rear + hitchance_mod + additional_pen))
			pierce_vehicle(vehicle, 4, "rear")
		else
			deflect_vehicle(vehicle, "rear")
		vehicle.balloon_alert_to_viewers("rear hit")
	else if(angle_diff >= 135)		// Frontal hit
		if(prob(front + hitchance_mod + additional_pen))
			pierce_vehicle(vehicle, 1, "frontal")
		else
			deflect_vehicle(vehicle, "frontal")
		vehicle.balloon_alert_to_viewers("frontal hit")
	else 							// Side hit
		if(prob(side + hitchance_mod + additional_pen))
			pierce_vehicle(vehicle, 2, "side")
		else
			deflect_vehicle(vehicle, "side")
		vehicle.balloon_alert_to_viewers("side hit")

/obj/item/projectile/missile/aphe/proc/pierce_vehicle(obj/vehicles/vehicle, multiplier, side)
	vehicle.visible_message(SPAN_DANGER("The [src] pierces through the [side] hull of [vehicle]!"), SPAN_DANGER("You hear a loud metallic pierce!"))
	vehicle.ex_act(explosion_power * multiplier) // Basically doubles the damage
	vehicle.deactivate()
	playsound(vehicle, 'sound/weapons/rpg_pierce.ogg', 150, TRUE)
	var/obj/vehicles/large/large_v = vehicle
	var/datum/vehicle_interior/interior = large_v.interior
	if(large_v && interior)
		// Simulating an RPG going inside the vehicle and blowing up by causing an explosion inside of it
		// We spawn it around middle of the interior
		var/turf/pierce = get_turfs_in_range(interior.middle_turf, 2)
		pierce.visible_message(FONT_LARGE(SPAN_DANGER("[src] comes through the [side] hull of [vehicle], OH FUCK!")), FONT_LARGE(SPAN_DANGER("You hear a VERY loud metallic pierce!")))
		playsound(pierce ,'sound/weapons/rpg_pierce.ogg', 150, TRUE)
		cell_explosion(pierce, internal_explosion_power * multiplier, internal_explosion_falloff)

/obj/item/projectile/missile/aphe/proc/deflect_vehicle(obj/vehicles/vehicle, side)
	vehicle.visible_message(SPAN_DANGER("The [src] deflects off the [side] hull of [vehicle]!"), SPAN_DANGER("You hear metal deflecting against metal!"))
	//vehicle.balloon_alert_to_viewers("deflected!")
	vehicle.shake_animation(4)
	new /obj/sparks(get_turf(src))
	playsound(vehicle, pick(ricochet_sounds), 150, FALSE)

/obj/item/projectile/missile/aphe/special_action(atom/A, turf/T) // TODO: Make damaging vehicles actually harsh
	// Heavily damages any exosuits or vehicles
	var/obj/vehicles/vehicle = A
	var/mob/living/exosuit/mech = A
	var/attack_dir = get_dir(src, A)
	if(istype(mech))
		mech_action(mech, attack_dir)
	if(istype(vehicle))
		vehicle_action(vehicle, attack_dir)

// TANDEM (APHE) MISSILE
// Same as APHE but much more penetrative
/obj/item/projectile/missile/aphe/tandem
	name = "tandem APHE rocket"
	icon_state = "rocket_tandem"
	shrapnel_type = /obj/item/grenade/frag/dud_missile/tandem
	additional_pen = 50
