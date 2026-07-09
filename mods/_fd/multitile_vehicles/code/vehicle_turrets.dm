// VEHICLE TURRET CONTROLS
/obj/vehicles/verb/take_turret_controls()
	set name = "Take Turret Controls"
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
		to_chat(user, SPAN_NOTICE("You must be the [turret_control_position] of [src] to toggle the headlights."))
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
	if(guns_disabled)
		return
	var/obj/item/vehicle_component/turret/turret = get_turret_component()
	if(turret)
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
	turret_overlay = overlay_image(icon = turret.icon, icon_state = turret.icon_state, layer = ABOVE_HUMAN_LAYER + 0.1)
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
	name = "vehicle turret"
	desc = "A turret mounted on a vehicle."
	icon = 'maps/gaia/icons/vehicles/apc.dmi'
	icon_state = "apc-mg"
	integrity = 500
	coverage = 25
	resistances = list("bullet" = 80, "energy" = 40, "emp" = 20, "bomb" = 80)
	repair_materials = list("steel")
	repair_tool_amount = 2

	var/obj/vehicles/vehicle
	var/aimed = FALSE
	var/fire_delay = 10
	var/projectile_type = /obj/item/projectile/bullet/rifle/caseless
	var/aim_dir = SOUTH
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
			icon_state = "[initial(icon_state)]S"

	aim_dir = dir_to_use
	if(vehicle)
		vehicle.update_turret_overlay()

// TURRET "GUN" DEVICE
/obj/item/gun/vehicle_turret
	name = "vehicle turret controls"
	desc = "A handheld controls used to operate a vehicle turret."
	icon = 'icons/obj/tools/drone_control.dmi'
	icon_state = "pad_designator"
	anchored = TRUE
	w_class = ITEM_SIZE_NO_CONTAINER
	fire_delay = 6
	move_delay = 0
	can_autofire = TRUE
	var/obj/vehicles/vehicle
	var/obj/item/vehicle_component/turret/linked_turret
	var/aimed = SOUTH
	var/projectile_type = /obj/item/projectile/bullet/rifle/caseless
	var/x_offset = 48
	var/y_offset = 48
	var/turn_time = 2
	var/rotating = FALSE

/obj/item/gun/vehicle_turret/consume_next_projectile()
	if(!ispath(projectile_type))
		return null
	if(linked_turret.current_ammo <= 0)
		return null
	linked_turret.current_ammo--
	return new projectile_type(src)

/obj/item/gun/vehicle_turret/proc/aim_at(atom/target)
	if(!vehicle || !linked_turret || !target)
		return FALSE
	var/turf/target_turf = get_turf(target)
	if(!target_turf)
		vehicle.update_turret_overlay()
		return FALSE
	var/new_dir = get_dir(vehicle, target_turf)
	if(new_dir == 0)
		new_dir = SOUTH
	linked_turret.set_turret_state_for_dir(new_dir)
	return TRUE

/obj/item/gun/vehicle_turret/resolve_attackby(atom/atom, mob/living/user, click_params)
	return

/obj/item/gun/vehicle_turret/afterattack(atom/A, mob/living/user, adjacent, params)
	if(!vehicle || !linked_turret || !A || adjacent)
		return
	if(!vehicle.can_control_turret(user) || vehicle.guns_disabled)
		return
	if((get_dir(vehicle, A) != linked_turret.aim_dir) && !rotating)
		rotating = TRUE
		to_chat(user, SPAN_NOTICE("Rotating the turret..."))
		if(!do_after(user, turn_time, src, DO_BOTH_CAN_MOVE))
			rotating = FALSE
			return
		rotating = FALSE
		aim_at(A)
		vehicle.update_turret_overlay()
		playsound(vehicle.loc, 'sound/mecha/mechmove03.ogg', 40, 1)
		return
	if(has_safety && safety_state)
		return
	var/obj/item/projectile/pew = consume_next_projectile()
	if(pew)
		//TODO: make it shoot from the center of the vehicle
		pew.permutated += vehicle
		pew.launch(A, user.zone_sel?.selecting, x_offset, y_offset, rand(5, 7))
		play_fire_sound(user, pew)
		to_chat(user, SPAN_NOTICE("[linked_turret.current_ammo]/[linked_turret.max_ammo] rounds left."))
	else
		handle_click_empty(user)

// AMMO
/obj/item/ammo_magazine/vehicle_mg
	name = "vehicle MG box magazine"
	desc = "A magazine of caseless rifle rounds for a vehicle-based machine gun."
	icon = 'maps/gaia/icons/items/ammo.dmi'
	icon_state = "mgbox"
	w_class = ITEM_SIZE_LARGE
	mag_type = MAGAZINE
	caliber = CALIBER_RIFLE_CASELESS
	matter = list(MATERIAL_STEEL = 6000)
	ammo_type = /obj/item/ammo_casing/rifle/caseless
	max_ammo = 50
