/datum/space_weapon
	var/name = "Space cannon 3000"
	var/fire_sound = 'sound/weapons/gunshot/gunshot.ogg'

	var/id

	var/fire_cooldown = 2 SECONDS
	var/next_shot = 0

	var/delay_in_burst = 5
	var/burst_size = 12

	var/current_heat = 0
	var/max_heat = 50

	var/heat_decay = 0.5
	var/heat_per_bullet = 2

	var/weapon_length = 3
	var/list/obj/machinery/space_weapon/weapon_parts = list()

	var/image/heat_overlay

	var/obj/machinery/computer/space_weapons/linked_console

GLOBAL_LIST_EMPTY(space_weapon_datums)

/datum/space_weapon/New()
	GLOB.space_weapon_datums += src
	START_PROCESSING(SSspaceweapons, src)
	for(var/i in 1 to weapon_length)
		weapon_parts += null
	. = ..()

/datum/space_weapon/Destroy()
	GLOB.space_weapon_datums -= src
	STOP_PROCESSING(SSspaceweapons, src)
	for(var/part in weapon_parts)
		unlink_part(part)
	if(linked_console)
		linked_console.linked_weapons -= src
		linked_console.disabled_weapons -= src
	. = ..()

/datum/space_weapon/Process()
	if(current_heat > 0)
		adjust_heat(-heat_decay)

/datum/space_weapon/proc/link_part(obj/machinery/space_weapon/part)
	GLOB.dir_set_event.register(part, src, .proc/check_parts)
	weapon_parts[part.part_order] = part
	part.weapon_data = src

/datum/space_weapon/proc/unlink_part(obj/machinery/space_weapon/part)
	GLOB.dir_set_event.unregister(part, src, .proc/check_parts)
	if(!length_no_nulls(weapon_parts))
		qdel(src)

/datum/space_weapon/proc/check_parts(do_unlink = TRUE)
	var/i
	for(var/obj/machinery/space_weapon/part as anything in weapon_parts)
		i++
		if(QDELETED(part))
			return do_unlink ? unlink_part(part) : FALSE

		var/next_list_pos = part.part_order + 1
		if((i < length_no_nulls(weapon_parts)) && !part.is_linkable(weapon_parts[next_list_pos]))
			return do_unlink ? unlink_part(part) : FALSE

	if(length_no_nulls(weapon_parts) < weapon_length)
		return FALSE

	return TRUE

/datum/space_weapon/proc/check_power()
	for(var/obj/machinery/space_weapon/part as anything in weapon_parts)
		if(!part.is_powered())
			return FALSE

	return TRUE

/datum/space_weapon/proc/update_icon()
	if(!max_heat)
		return

	if(!weapon_parts?[1])
		return

	weapon_parts[1].ClearOverlays()
	if(current_heat > 0)
		if(!heat_overlay)
			heat_overlay = weapon_parts[1].generate_heat_overlay()
		heat_overlay.alpha = 150 * (current_heat / max_heat)
		heat_overlay.color = COLOR_RED
		heat_overlay.plane = EFFECTS_ABOVE_LIGHTING_PLANE
		weapon_parts[1].AddOverlays(heat_overlay)

/datum/space_weapon/proc/can_fire(direction, list/hit_coords)
	if(!check_parts())
		return FALSE

	if(!check_power())
		return FALSE

	if(!get_ammo())
		return FALSE

	return TRUE

/datum/space_weapon/proc/fire(direction, list/hit_coords = list(100,100))
	set waitfor = FALSE

	if(next_shot > world.time)
		return FALSE

	if(isnull(direction))
		var/obj/overmap/visitable/home_sector = map_sectors["[weapon_parts[1].z]"]
		direction = home_sector.dir

	if(!can_fire(direction, hit_coords))
		return FALSE

	if(!pre_fire(direction, hit_coords))
		return FALSE

	var/turf/start = get_turf(weapon_parts[1])
	var/turf/target_turf = get_step(start, weapon_parts[1].dir)

	for(var/i=1 ; i<=burst_size ; i++)
		if(!can_fire(direction, hit_coords))
			break
		handle_fire(direction, hit_coords, start, target_turf)
		sleep(delay_in_burst)

	return post_fire(direction, hit_coords)

/datum/space_weapon/proc/pre_fire(direction, list/hit_coords)
	set_cooldown()
	return TRUE

/datum/space_weapon/proc/handle_fire(direction, list/hit_coords, turf/start, turf/target_turf)
	var/obj/item/ammo_casing/ammo = get_ammo()
	if(!ammo)
		return

	var/obj/item/projectile/bullet/space_weapon/bullet = ammo.expend()

	bullet.overmap_direction = direction
	bullet.hit_coords = hit_coords

	bullet.forceMove(start)
	bullet.launch(target_turf)

	play_fire_sound(bullet)
	handle_recoil()
	adjust_heat(heat_per_bullet)

/datum/space_weapon/proc/set_cooldown(multiplyer = 1)
	next_shot = world.time + fire_cooldown * multiplyer + delay_in_burst * burst_size

/datum/space_weapon/proc/play_fire_sound(obj/item/projectile/bullet)
	var/shoot_sound = (istype(bullet) && bullet.fire_sound) ? bullet.fire_sound : fire_sound
	var/source = weapon_parts?[1] ? weapon_parts[1] : src
	playsound(source, shoot_sound, 500, 1)

/datum/space_weapon/proc/handle_recoil()
	for(var/mob/victim in GLOB.alive_mobs)
		if(!weapon_parts?[1])
			continue
		if(victim.z != weapon_parts[1].z)
			continue
		if(get_dist(victim, weapon_parts[1]) > 8)
			continue
		shake_camera(victim, 3, 1)

/datum/space_weapon/proc/adjust_heat(amount)
	current_heat = max(0, current_heat + amount)
	if(current_heat >= max_heat)
		handle_overheat()
	update_icon()

/datum/space_weapon/proc/handle_overheat()
	if(!weapon_parts?[1])
		return

	adjust_heat(-current_heat)
	var/obj/machinery/victim = weapon_parts[1]
	playsound(victim.loc, 'sound/items/Welder.ogg', 100, 1)
	victim.dismantle()

/datum/space_weapon/proc/get_ammo()
	RETURN_TYPE(/obj/item/ammo_casing)
	for(var/obj/machinery/space_weapon/part as anything in weapon_parts)
		if(length(part.ammo))
			return part.ammo[1]

/datum/space_weapon/proc/post_fire(direction, list/hit_coords)
	return TRUE
