// VEHICLE TURRET CONTROLS
/obj/vehicles/verb/take_turret_controls()
	set name = "Take/Remove Turret Controls"
	set category = "Vehicle"
	set src in view(1)
	if(health_dead)
		return
	var/mob/living/user = usr
	if(!istype(user))
		return
	if(!has_turret_component())
		to_chat(user, SPAN_WARNING("There is no turret to control!"))
		return
	if(guns_disabled)
		to_chat(user, SPAN_WARNING("Guns are disabled!"))
		return
	if(!(user in get_occupants_in_position(turret_control_position)))
		to_chat(user, SPAN_NOTICE("You must be the [turret_control_position] of \the [src] to take the turret controls."))
		return
	var/has_gun = FALSE
	for(var/obj/item/gun/vehicle_turret/gun in user.contents)
		if(gun)
			has_gun = TRUE
	if(has_gun)
		to_chat(user, SPAN_NOTICE("You put back the turret controls."))
		remove_turret_gun(user)
	else
		to_chat(user, SPAN_NOTICE("You take the turret controls."))
		give_turret_gun(user)

/obj/vehicles/proc/get_turret_component()
	if(!comp_prof)
		return null
	for(var/obj/item/vehicle_component/turret/turret in comp_prof.components)
		return turret
	for(var/obj/item/vehicle_component/turret/turret in comp_prof.vital_components)
		return turret
	return null

/obj/vehicles/proc/has_turret_component()
	return !!get_turret_component()

/obj/vehicles/proc/init_turret()
	var/obj/item/vehicle_component/turret/turret = get_turret_component()
	if(turret)
		turret.vehicle = src
		turret.set_turret_state_for_dir(SOUTH)
		update_turret_overlay()
		return
	turret = new /obj/item/vehicle_component/turret(src)
	turret.vehicle = src
	turret.set_turret_state_for_dir(SOUTH)
	if(comp_prof && istype(comp_prof, /datum/component_profile))
		comp_prof.components += turret
	if(!(turret in contents))
		contents += turret
	update_turret_overlay()

/obj/vehicles/proc/update_turret_overlay()
	var/obj/item/vehicle_component/turret/turret = get_turret_component()
	if(!turret)
		return
	if(!turret.vehicle)
		turret.vehicle = src
	turret_overlay = overlay_image(icon = turret.icon, icon_state = turret.icon_state, layer = ABOVE_HUMAN_LAYER)
	SetOverlays(turret_overlay, ATOM_ICON_CACHE_PROTECTED)

/obj/vehicles/proc/can_control_turret(mob/user)
	var/obj/item/vehicle_component/turret/turret = get_turret_component()
	if(!has_turret_component() || !turret || !istype(user) || guns_disabled)
		return FALSE
	if(occupants[user] != turret_control_position)
		return FALSE
	return TRUE

/obj/vehicles/proc/give_turret_gun(mob/user)
	if(!can_control_turret(user))
		return null
	var/obj/item/vehicle_component/turret/turret = get_turret_component()
	if(!turret)
		init_turret()
		turret = get_turret_component()
	if(!turret)
		return null
	var/obj/item/gun/vehicle_turret/gun = new(user)
	gun.vehicle = src
	gun.linked_turret = turret
	gun.name = "[src] turret gun"
	if(user.put_in_active_hand(gun))
		user.contents += gun
		return gun
	if(user.put_in_hands(gun))
		user.contents += gun
		return gun
	qdel(gun)
	return null

/obj/vehicles/proc/remove_turret_gun(mob/user)
	for(var/obj/item/gun/vehicle_turret/gun in user.contents)
		qdel(gun)
		break

// TURRET COMPONENT
/obj/item/vehicle_component/turret
	name = "NVA heavy machine gun 4"
	desc = "A turret mounted on a vehicle."
	icon = 'maps/gaia/icons/vehicles/apc.dmi'
	icon_state = "apc-mg"
	integrity = 1000
	coverage = 25
	resistances = list("bullet" = 80, "energy" = 40, "emp" = 20, "bomb" = 80)
	repair_materials = list("steel")
	repair_tool_amount = 2

	var/obj/vehicles/vehicle
	var/aimed = FALSE
	var/fire_delay = 1 SECOND
	var/projectile_type = /obj/item/projectile/bullet/rifle/caseless
	var/aim_dir = SOUTH
	var/dispersion = 0.2
	var/max_ammo = 50
	var/current_ammo = 50
	var/list/allowed_magazine_types = list(/obj/item/ammo_magazine/vehicle_mg)
	var/allowed_ammo_type = /obj/item/ammo_casing/rifle/caseless

/obj/item/vehicle_component/turret/proc/can_reload_with_magazine(obj/item/ammo_magazine/magazine)
	if(!istype(magazine))
		return FALSE
	if(current_ammo >= max_ammo)
		return FALSE
	if(!length(magazine.stored_ammo))
		return FALSE
	for(var/typepath in allowed_magazine_types)
		if(istype(magazine, typepath))
			return TRUE
	if(allowed_ammo_type && magazine.ammo_type)
		return magazine.ammo_type == allowed_ammo_type || ispath(magazine.ammo_type, allowed_ammo_type)
	return FALSE

/obj/item/vehicle_component/turret/proc/reload_from_magazine(obj/item/ammo_magazine/magazine, mob/user)
	if(!can_reload_with_magazine(magazine))
		if(user)
			to_chat(user, SPAN_WARNING("[magazine] is not compatible with [src]."))
		return FALSE
	if(!length(magazine.stored_ammo))
		if(user)
			to_chat(user, SPAN_NOTICE("[magazine] is empty."))
		return FALSE
	var/rounds_to_load = min(max_ammo - current_ammo, length(magazine.stored_ammo))
	if(rounds_to_load <= 0)
		if(user)
			to_chat(user, SPAN_NOTICE("[src] is already fully loaded."))
		return FALSE
	current_ammo += rounds_to_load
	while(rounds_to_load > 0 && length(magazine.stored_ammo))
		var/obj/item/ammo_casing/casing = magazine.stored_ammo[length(magazine.stored_ammo)]
		magazine.stored_ammo -= casing
		qdel(casing)
		rounds_to_load--
	magazine.update_icon()
	if(user)
		to_chat(user, SPAN_NOTICE("You load [current_ammo]/[max_ammo] rounds into [src] using [magazine]."))
	return TRUE

/obj/item/vehicle_component/turret/proc/set_turret_state_for_dir(dir_to_use)
	if(!dir_to_use)
		dir_to_use = SOUTH

	switch(dir_to_use)
		if(NORTH)
			icon_state = "[initial(icon_state)]N"
		if(NORTHEAST)
			icon_state = "[initial(icon_state)]N"
		if(NORTHWEST)
			icon_state = "[initial(icon_state)]N"
		if(SOUTH)
			icon_state = "[initial(icon_state)]S"
		if(SOUTHEAST)
			icon_state = "[initial(icon_state)]S"
		if(SOUTHWEST)
			icon_state = "[initial(icon_state)]S"
		if(EAST)
			icon_state = "[initial(icon_state)]E"
		if(WEST)
			icon_state = "[initial(icon_state)]W"
		else
			icon_state = "[initial(icon_state)]"

	aim_dir = dir_to_use
	var/obj/vehicles/parent_vehicle = vehicle
	if(!parent_vehicle && loc && istype(loc, /obj/vehicles))
		parent_vehicle = loc
	if(parent_vehicle)
		parent_vehicle.update_turret_overlay()

/obj/item/vehicle_component/turret/full_integ_loss()
	if(vehicle.guns_disabled)
		return
	vehicle.guns_disabled = TRUE
	vehicle.visible_message(SPAN_WARNING("\The [src] on \the [vehicle] is destroyed!"), SPAN_WARNING("You hear a turret shutting off."))
	playsound(vehicle.loc, 'sound/effects/bang.ogg', 30, TRUE)
	//TODO: make it change the icon of the turret as well

/obj/item/vehicle_component/turret/finalise_repair()
	. = ..()
	if(!vehicle.guns_disabled)
		return
	vehicle.guns_disabled = FALSE
	vehicle.visible_message(SPAN_NOTICE("\The [src] on \the [vehicle] springs back to life."), SPAN_NOTICE("You hear a turret activating."))
	playsound(vehicle.loc, 'sound/mecha/mechmove03.ogg', 40, TRUE)
	//TODO: make it change the icon of the turret as well

// TURRET "GUN" DEVICE
/obj/item/gun/vehicle_turret
	name = "vehicle turret controls"
	desc = "A handheld controls used to operate a vehicle turret."
	icon = 'icons/obj/tools/drone_control.dmi'
	icon_state = "pad_designator"
	zoomdevicename = "turret optics"
	anchored = TRUE
	can_autofire = TRUE
	w_class = ITEM_SIZE_NO_CONTAINER
	fire_delay = 6
	move_delay = 0
	scope_zoom = 2
	gun_skill = SKILL_MECH

	crosshair1_icon = 'icons/crosshairs/square/accuracy1.dmi'
	crosshair2_icon = 'icons/crosshairs/square/accuracy2.dmi'
	crosshair3_icon = 'icons/crosshairs/square/accuracy3.dmi'

	var/obj/vehicles/vehicle
	var/obj/item/vehicle_component/turret/linked_turret
	var/obj/item/projectile/projectile_type = /obj/item/projectile/bullet/rifle/caseless

	var/aimed = SOUTH
	var/x_offset = 0
	var/y_offset = 0
	var/turn_time = 2
	var/rotating = FALSE

/obj/item/gun/vehicle_turret/proc/aim_at(atom/target)
	if(!vehicle || !linked_turret || !target)
		return FALSE
	var/turf/target_turf = get_turf(target)
	if(!target_turf)
		vehicle.update_turret_overlay()
		return FALSE
	var/new_dir = get_dir(vehicle, target_turf)
	if(!new_dir)
		new_dir = SOUTH
	linked_turret.set_turret_state_for_dir(new_dir)
	return TRUE

/obj/item/gun/vehicle_turret/proc/rotate_turret(atom/target, mob/living/user)
	rotating = TRUE
	var/atom/aiming_at = target
	var/calculated_turn_time = turn_time
	var/aiming_dir = get_dir(vehicle, aiming_at)
	var/aimed_dir = linked_turret.aim_dir
	if(calculated_turn_time && aiming_dir && aimed_dir)
		var/calculation = dir2angle(aimed_dir) - dir2angle(aiming_dir)
		calculated_turn_time = turn_time * max(1, (calculation / 90))
	if(!user.skill_check(vehicle.driving_skill, vehicle.skill_level) && vehicle.complex_controls)
		calculated_turn_time = calculated_turn_time * 2
	balloon_alert(user, "to [dir2text(aiming_dir)]...")
	if(!do_after(user, calculated_turn_time, vehicle, (DO_BOTH_CAN_MOVE | DO_DEFAULT | DO_BOTH_UNIQUE_ACT)))
		rotating = FALSE
		to_chat(user, SPAN_WARNING("You're interrupted!"))
		return FALSE
	if(!user.skill_check(vehicle.driving_skill, vehicle.skill_level) && vehicle.complex_controls && prob(5))
		aiming_at = get_random_turf_in_range(vehicle, 7, 1)
		to_chat(user, SPAN_DANGER("You clumsily fumble with \the [src]."))
	rotating = FALSE
	user.dir = aiming_dir
	aim_at(aiming_at)
	playsound(vehicle.loc, 'sound/mecha/mechmove03.ogg', 40, TRUE)
	return TRUE

/obj/item/gun/vehicle_turret/proc/fire_turret(atom/target, mob/living/user)
	var/obj/item/projectile/pew = consume_next_projectile()
	if(pew)
		//TODO: make it shoot from the center of the vehicle
		pew.permutated += vehicle
		pew.dispersion = linked_turret.dispersion
		pew.launch(target, user.zone_sel?.selecting, x_offset, y_offset)
		pew.firer = user
		pew.shot_from = src
		play_fire_sound(user, pew)
		if(linked_turret.current_ammo == 0)
			balloon_alert(user, "[linked_turret.current_ammo]/[linked_turret.max_ammo]")
			playsound(vehicle.loc, dry_fire_sound, 20, TRUE)
			playsound(user, 'sound/weapons/smg_empty_alarm.ogg', 40, TRUE)
		else if(linked_turret.current_ammo < 10)
			balloon_alert(user, "[linked_turret.current_ammo]/[linked_turret.max_ammo]")
			playsound(vehicle.loc, dry_fire_sound, 10, TRUE)
		else if((linked_turret.current_ammo == round(linked_turret.current_ammo, 5)))
			balloon_alert(user, "[linked_turret.current_ammo]/[linked_turret.max_ammo]")
	else
		handle_click_empty(user)

/obj/item/gun/vehicle_turret/examine(mob/user, distance)
	. = ..()
	if(distance <= 0)
		to_chat(user, SPAN_NOTICE("[linked_turret.current_ammo]/[linked_turret.max_ammo] rounds left in \the [linked_turret]."))

/obj/item/gun/vehicle_turret/dropped(mob/living/user)
	. = ..()
	qdel_self()

/obj/item/gun/vehicle_turret/consume_next_projectile()
	if(!ispath(projectile_type))
		return null
	if(linked_turret.current_ammo <= 0)
		return null
	linked_turret.current_ammo--
	return new projectile_type(src)

/obj/item/gun/vehicle_turret/resolve_attackby(atom/atom, mob/living/user, click_params)
	return

/obj/item/gun/vehicle_turret/afterattack(atom/A, mob/living/user, adjacent, params)
	if(!vehicle || !linked_turret || !A || adjacent)
		return
	if(!vehicle.can_control_turret(user) || vehicle.guns_disabled)
		return
	var/isnt_dir = get_dir(vehicle, A) != linked_turret.aim_dir
	if(isnt_dir && !rotating)
		rotate_turret(A, user)
		return
	if(isnt_dir || rotating)
		return
	if(has_safety && safety_state)
		return
	fire_turret(A, user)

// AMMO
/obj/item/ammo_magazine/vehicle_mg
	name = "NVA heavy machine gun box magazine"
	desc = "A magazine of caseless rifle rounds for a vehicle-based NVA heavy machine gun."
	icon = 'maps/gaia/icons/items/ammo.dmi'
	icon_state = "mgbox"
	w_class = ITEM_SIZE_LARGE
	mag_type = MAGAZINE
	caliber = CALIBER_RIFLE_CASELESS
	matter = list(MATERIAL_STEEL = 6000)
	ammo_type = /obj/item/ammo_casing/rifle/caseless
	max_ammo = 50
