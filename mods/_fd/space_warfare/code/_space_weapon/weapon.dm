/*////////////////////////////////
//          MACHINERY           //
*/////////////////////////////////

/obj/machinery/space_weapon
	name = "space weapon part"
	desc = "A part of something greater."
	icon = 'icons/obj/machines/disperser.dmi'
	density = TRUE
	anchored = TRUE
	abstract_type = /obj/machinery/space_weapon
	construct_state = /singleton/machine_construction/default/panel_closed
	maximum_component_parts = list(/obj/item/stock_parts = 15)

	var/id // set this and console's id to link them automatically on initialize

	var/part_order = 0 // MUST be not zero
	var/weapon_type = /datum/space_weapon

	var/ammo_type = /obj/item/ammo_casing/space_weapon
	var/ammo_max = 0

	var/load_cooldown = 0.5 SECONDS
	var/next_load = 0

	var/list/obj/item/ammo_casing/ammo = list()

	var/datum/space_weapon/weapon_data

/obj/machinery/space_weapon/Initialize()
	. = ..()
	//set_extension(src, /datum/extension/interactive/multitool/store)
	update_link()

/obj/machinery/space_weapon/Destroy()
	for(var/obj/casing as anything in ammo)
		casing.dropInto(loc)
	weapon_data.weapon_parts[part_order] = null
	weapon_data.unlink_part(src)
	weapon_data = null
	. = ..()

/obj/machinery/space_weapon/examine(mob/user)
	. = ..()
	if(panel_open)
		to_chat(user, "The maintenance panel is open.")

/obj/machinery/space_weapon/use_tool(obj/item/I, mob/living/user, list/click_params)
	. = ..()
	if(isWrench(I))
		if(panel_open)
			user.visible_message(
				SPAN_NOTICE("\The [user] rotates \the [src] with \the [I]."),
				SPAN_NOTICE("You rotate \the [src] with \the [I].")
			)
			set_dir(turn(dir, 90))
			playsound(src, 'sound/items/jaws_pry.ogg', 50, 1)
			return TRUE
		else
			to_chat(user,SPAN_NOTICE("The maintenance panel must be screwed open for this!"))
			return TRUE

	if(isMultitool(I))
		var/obj/item/device/multitool/multitool = I
		if(!weapon_data)
			return FALSE
		var/datum/space_weapon/old_buffer = multitool.buffer_object
		if(old_buffer && !istype(old_buffer, weapon_data.type))
			return FALSE
		multitool.buffer_object = weapon_data
		to_chat(user, SPAN_NOTICE("Successfully stored [weapon_data.name] in buffer."))
		return TRUE

/obj/machinery/space_weapon/Bumped(atom/movable/AM)
	. = ..()
	load_ammo(AM)

/obj/machinery/space_weapon/proc/load_ammo(atom/movable/AM)
	if(!istype(AM, ammo_type))
		return

	if(next_load > world.time)
		return

	if(length(ammo) >= ammo_max)
		return

	var/obj/item/ammo_casing/casing = AM
	if(!casing.BB)
		return

	playsound(loc, 'sound/weapons/guns/interaction/rifle_load.ogg', 75, TRUE)
	next_load = world.time + load_cooldown

	casing.forceMove(src)
	ammo += casing

/// Recursive link proc
/obj/machinery/space_weapon/proc/update_link(datum/space_weapon/new_data)
	var/backwards = turn(dir, 180)
	var/obj/machinery/space_weapon/previous_part = locate() in get_step(src, backwards)
	var/obj/machinery/space_weapon/next_part = locate() in get_step(src, dir)

	// let's check if we aren't the first part to be in weapon
	if(!new_data)
		// try inheriting some existing datum
		if(previous_part && previous_part.weapon_data && is_linkable(previous_part, FALSE))
			update_link(previous_part.weapon_data)
			return

		if(next_part && next_part.weapon_data && is_linkable(next_part, FALSE))
			update_link(next_part.weapon_data)
			return

		// we ARE the first part in an area, lets then create our own datum
		new_data = new weapon_type()

	if(id)
		new_data.id = id

	// actual linkage
	if(!weapon_data)
		new_data.link_part(src)

	// start an update recursion in both directions
	if(previous_part && !previous_part.weapon_data && is_linkable(previous_part, FALSE))
		previous_part.update_link(weapon_data)

	if(next_part && !next_part.weapon_data && is_linkable(next_part, FALSE))
		next_part.update_link(weapon_data)

/obj/machinery/space_weapon/proc/is_linkable(obj/machinery/space_weapon/other_part, in_order = TRUE)
	if(!other_part)
		return FALSE
	if(other_part.dir != dir)
		return FALSE
	if(other_part.weapon_type != weapon_type)
		return FALSE
	if(in_order && (other_part.part_order <= part_order))
		return FALSE
	return TRUE

GLOBAL_LIST_EMPTY(heat_icon_cache)

/obj/machinery/space_weapon/proc/generate_heat_overlay()
	if(GLOB.heat_icon_cache["[icon]" + icon_state])
		return image(GLOB.heat_icon_cache["[icon]" + icon_state])

	var/icon/I = new /icon(icon, icon_state)
	I.Blend(new /icon('mods/_fd/space_warfare/icons/heat_overlay.dmi', rgb(255,255,255)),ICON_ADD)
	I.Blend(new /icon('mods/_fd/space_warfare/icons/heat_overlay.dmi', "base"),ICON_MULTIPLY)
	GLOB.heat_icon_cache["[icon]" + icon_state] = I

	return image(I)

/obj/machinery/space_weapon/front
	part_order = 1
	icon_state = "front"

/obj/machinery/space_weapon/middle
	part_order = 2
	icon_state = "middle"

/obj/machinery/space_weapon/back
	part_order = 3
	icon_state = "back"
	ammo_max = 24


/*////////////////////////////////
//           CIRCUITS           //
*/////////////////////////////////

/obj/item/stock_parts/circuitboard/space_weapon
	name = "circuit board (space weapon)"
	build_path = /obj/machinery/space_weapon
	board_type = "machine"
	origin_tech = list(TECH_ENGINEERING = 2, TECH_COMBAT = 4)
	req_components = list (

	)
