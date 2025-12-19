/obj/machinery/computer/ship/ship_weapon/rail_gun
	name = "OA-99 railgun control"
	desc = "Railgun Control Console."
	caldigit = 5
	coolinterval = 45 SECONDS
	gun_name = "rail gun"
	link_range = 15

	front_type = /obj/machinery/ship_weapon/front_part/rail
	middle_type = /obj/machinery/ship_weapon/middle_part/rail
	back_type = /obj/machinery/ship_weapon/back_part/rail
	munition_type = /obj/item/ammo_magazine/ammobox/railgun

	burst_size = 1
	fire_interval = 0

	fire_sound = 'mods/_fd/old_space_cannons/sounds/strong_shot.ogg'

	play_emptymag_sound = 0

	var/accelerator_amount = 0 // Amount of connected modules

/obj/machinery/computer/ship/ship_weapon/rail_gun/Initialize()
	. = ..()
	accelerator_amount = middle.modules_amount

/obj/machinery/computer/ship/ship_weapon/rail_gun/use_tool(obj/item/O, mob/user)
	if(istype(O, /obj/item/device/multitool))
		accelerator_amount = middle.modules_amount
		to_chat(user, "Updating [src]...")
	..()

/obj/machinery/computer/ship/ship_weapon/rail_gun/fire(mob/user)
	if(!link_parts())
		return FALSE //no disperser, no service
	if(!front.powered() || !middle.powered() || !back.powered())
		return FALSE //no power, no boom boom
	if(get_ammo() < ammo_per_shot || !get_ammo_type())
		return FALSE

	var/turf/start = front
	var/direction = front.dir

	if(prefire_sound)
		playsound(start, prefire_sound, 250, 0)

	var/list/relevant_z = GetConnectedZlevels(start.z)
	if(far_prefire_sound)
		for(var/mob/M in GLOB.player_list)
			var/turf/T = get_turf(M)
			if(!T || !(T.z in relevant_z))
				continue
			if(!isdeaf(M))
				sound_to(M, sound(far_prefire_sound, volume=10))

	sleep(fire_delay)

	if(!front || !get_charge()) //Meanwhile front might have exploded
		return FALSE

	for(var/mob/M in GLOB.player_list)
		var/turf/T = get_turf(M)
		if(!T || !(T.z in relevant_z))
			continue
		shake_camera(M, shake_camera_force)
		if(!isdeaf(M))
			sound_to(M, sound(far_fire_sound, volume=10))

	playsound(start, fire_sound, 250, 1)
	handle_muzzle(start, direction)

	var/ammo_type = get_ammo_type()
	var/obj/item/projectile/bullet/huge_caliber/pew = new ammo_type(front.loc)
	pew.starting = front.loc
	pew.overmapdir = overmapdir
	pew.enter_sound = far_fire_sound
	pew.cal_accuracy = cal_accuracy()

	pew.armor_penetration += accelerator_amount
	pew.penetrating += accelerator_amount / 2
	pew.penetration_modifier += accelerator_amount / 10
	pew.shoot_range += accelerator_amount

	pew.launch(get_step(front.loc, front.dir), pick(BP_ALL_LIMBS))

	remove_ammo()

	return TRUE
