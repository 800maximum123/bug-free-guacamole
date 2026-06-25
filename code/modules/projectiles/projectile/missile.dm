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

	var/internal_explosion_power = 500
	var/internal_explosion_falloff = 50

/obj/item/projectile/missile/aphe/special_action(atom/A, turf/T) // TODO: Make damaging vehicles actually harsh
	// Heavily damages any exosuits or vehicles
	var/obj/vehicles/vehicle = A
	var/mob/living/exosuit/mech = A
	if(istype(mech))
		mech.visible_message(SPAN_DANGER("The [src] pierces through the armor of [mech]!"), SPAN_DANGER("You hear a loud metallic pierce!"))
		mech.gib()
		playsound(mech ,'sound/weapons/rpg_pierce.ogg', 100, FALSE)
	if(istype(vehicle))
		vehicle.visible_message(SPAN_DANGER("The [src] pierces through the hull of [vehicle]!"), SPAN_DANGER("You hear a loud metallic pierce!"))
		playsound(vehicle ,'sound/weapons/rpg_pierce.ogg', 100, FALSE)
		vehicle.deactivate()
		var/obj/vehicles/large/large_v = vehicle
		var/datum/vehicle_interior/interior = large_v.interior
		if(!large_v || !interior)
			return TRUE
		// Simulating an RPG going inside the vehicle and blowing up by causing an explosion inside of it
		// We spawn it on middle of the interior
		var/turf/pierce = interior.middle_turf
		playsound(pierce ,'sound/weapons/rpg_pierce.ogg', 100, FALSE)
		cell_explosion(pierce, internal_explosion_power, internal_explosion_falloff)
		pierce.visible_message(FONT_LARGE(SPAN_DANGER("[src] comes through the hell of [A], OH FUCK!")), FONT_LARGE(SPAN_DANGER("You hear a loud metallic pierce!")))

// TANDEM (APHE) MISSILE
// Same as APHE but circumvents any ERA armor
/obj/item/projectile/missile/aphe/tandem // TODO: Actually make tandem be different from APHE
	name = "tandem APHE rocket"
	icon_state = "rocket_tandem"
	shrapnel_type = /obj/item/grenade/frag/dud_missile/tandem

/obj/item/projectile/missile/tandem/special_action(atom/A, turf/T) // TODO: Make damaging vehicles actually harsh
	. = ..()
