/obj/vehicles
	name = "Vehicle"
	desc = "Vehicle"
	density = TRUE
	layer = ABOVE_HUMAN_LAYER
	w_class = ITEM_SIZE_GARGANTUAN
	light_wedge = LIGHT_VERY_WIDE

	var/active = FALSE
	var/guns_disabled = FALSE
	var/movement_destroyed = FALSE
	var/block_enter_exit //Set this to block entering/exiting.
	var/can_traverse_zs = FALSE

	var/complex_controls = FALSE //If true, requires a mech skill check to move the vehicle.
	var/driving_skill = SKILL_MECH //What skill is required to drive this?
	var/skill_level = SKILL_BASIC

	var/next_move_input_at = 0 //When can we send our next movement input?
	var/moving_x = 0
	var/moving_y = 0
	var/last_moved_axis = 0 //1 = X axis, 2 = Y axis.
	var/list/speed = list(0,0) //The delay on movement in these directions.
	var/drag = 2 //How much do we slow down per tick if no input is applied in a direction?
	var/min_speed = 5 //What's the highest delay we can have?
	var/max_speed = 1 //What's the lowest number we can go to in terms of delay?
	var/acceleration = 1 //By how much does our speed change per input?
	var/braking_mode = 0 //1 = brakes active, -1 = purposefully reducing drag to slide.
	var/can_space_move = FALSE

	var/dangerous_to_people = TRUE //Hitting people hurts them
	var/dangerous_to_obstacles = TRUE //Hitting obstacles hurts them
	var/weaken_to_people = 5
	var/damage_to_people = 20
	var/damage_to_obstacles = 100

	//Action Button Handling
	var/list/driver_actions = list()

	//Advanced Damage Handling
	var/datum/component_profile/comp_prof = /datum/component_profile

	var/list/sprite_offsets = list("1" = list(0,0),"2" = list(0,0),"4" = list(0,0),"8" = list(0,0)) //Handled Directionally. Numbers correspond to directions

	//Passenger Management
	var/list/occupants = list(1,1) //Contains all occupants of the vehicle including the driver. First 2 values defines max passengers /gunners. Format: [MobRef] = [PositionName]
	var/list/passengers = list()
	var/list/exposed_positions = list(VP_DRIVER = 0) //Assoc. Value is the chance of hitting this position

	//Cargo
	var/used_cargo_space = 0
	var/cargo_capacity = 0
	var/capacity_flag = ITEM_SIZE_SMALL
	var/list/cargo_contents = list()

	//Vehicle ferrying//
	var/vehicle_size = ITEM_SIZE_VEHICLE//The size of the vehicle, used by vehicle cargo ferrying to determine allowed amount and allowed size.
	var/vehicle_carry_size = 0			//the max size of a carried vehicle
	var/obj/vehicles/carried_vehicle

	var/vehicle_view_modifier = 1 //The view-size modifier to apply to the occupants of the vehicle.

	var/datum/gas_mixture/internal_air = null//If this is new()'d, the vehicle provides air to the occupants.
	//I would make it require refilling, but that's likely to just be boring tedium for players.

	var/has_headlights = TRUE
	var/headlights_state = 1

	var/l_range = 7
	var/l_power = 2
	var/l_color = COLOR_WHITE

	var/serial_number
	var/obj/item/key/car/inserted_key
	var/key_type = /obj/item/key/car

	var/turret_control_position = VP_GUNNER
	var/image/turret_overlay

/obj/vehicles/New()
	. = ..()
	comp_prof = new comp_prof(src)
	START_PROCESSING(SSobj, src)
	if(has_headlights)
		verbs += /obj/vehicles/verb/toggle_headlights
		headlights_state = 2
	cargo_capacity = BASE_STORAGE_CAPACITY(capacity_flag)
	init_vehicle_actions()

/obj/vehicles/Initialize()
	. = ..()
	if(internal_air)
		internal_air.volume = 2500
		internal_air.temperature = T20C
	if(!inserted_key)
		inserted_key = new key_type(src)
		inserted_key.key_data = serial_number
	if(has_turret_component())
		init_turret()

/obj/vehicles/lost_in_space()
	if(!can_space_move)
		return TRUE
	return FALSE

/obj/vehicles/return_air_for_internal_lifeform(mob/living/carbon/human/form)
	if(!internal_air || !istype(form))
		return loc.return_air()
	internal_air.gas[form.species.breath_type] = 0
	for(var/gas in internal_air.gas)
		internal_air.gas[gas] = 100/internal_air.gas.len
	return internal_air

/obj/vehicles/return_air()
	if(internal_air)
		return internal_air
	return loc.return_air()

/obj/vehicles/attack_generic(mob/user, damage, attack_verb = "hits", wallbreaker = FALSE, damtype = DAMAGE_BRUTE, armorcheck = "melee", dam_flags = EMPTY_BITFIELD)
	. = ..()
	var/pos_to_dam = should_damage_occ()
	if(!isnull(pos_to_dam))
		var/list/occ_list = get_occupants_in_position(pos_to_dam)
		if(isnull(occ_list) || !occ_list.len)
			return 1
		var/mob/mob_to_hit = pick(occ_list)
		if(isnull(mob_to_hit))
			return 1
		user.UnarmedAttack(mob_to_hit)
	comp_prof.take_component_damage(damage,"brute")

/obj/vehicles/proc/get_display_filled_amt(amt, amt_initial)
	. = "is empty!"
	if(amt == amt_initial)
		. = "is full!"
	else if(amt >= amt_initial * 0.75)
		. = "is about 3 quarters full."
	else if(amt > amt_initial * 0.5)
		. = "is about half full."
	else if(amt > amt_initial * 0.25)
		. = "is about a quarter full."

/obj/vehicles/examine(mob/user)
	. = ..()
	if(!active)
		to_chat(user,"[src]'s engine is inactive.")
	if(active)
		to_chat(user,"[src]'s engine is up and ready.")
	if(movement_destroyed)
		to_chat(user,"[src]'s movement is damaged beyond use.")
	if(cargo_capacity)
		if(!src.Adjacent(user))
			if(used_cargo_space > 0)
				to_chat(user,"<span>It looks like there is something in the cargo hold.</span>")
		else
			to_chat(user,"<span>It's cargo hold contains [used_cargo_space] of [cargo_capacity] units of cargo ([round(100*used_cargo_space/cargo_capacity)]% full).</span>")
	if(carried_vehicle)
		to_chat(user,"<span>It has a [carried_vehicle] mounted on it.</span>")

	show_occupants_contained(user)

/obj/vehicles/bullet_act(obj/item/projectile/P, def_zone)
	P.on_hit(src, 0, def_zone)
	. = 0
	var/pos_to_dam = should_damage_occ()
	var/mob/mob_to_dam
	if(movement_destroyed)
		var/list/mobs = list()
		for(var/mob/m in occupants)
			mobs += m
		if(mobs.len == 0)
			return
		mob_to_dam = pick(mobs)
		if(!isnull(mob_to_dam))
			mob_to_dam.bullet_act(P)
			return
	if(!isnull(pos_to_dam))
		var/should_continue = damage_occupant(pos_to_dam,P)
		if(!should_continue)
			return
	comp_prof.take_component_damage(P.get_structure_damage())
	visible_message("<span class = 'danger'>[P] hits [src]!</span>")

/obj/vehicles/ex_act(severity, direction)
	comp_prof.take_comp_explosion_dam(severity)
/*	for(var/position in exposed_positions)
		for(var/mob/living/m in get_occupants_in_position(position))
			m.ex_act(severity) */

/obj/vehicles/forceMove(atom/destination)
	. = ..()

/obj/vehicles/verb/verb_inspect_components()
	set name = "Inspect Components"
	set category = "Vehicle"
	set src in view(1)

	var/mob/living/user = usr
	if(!istype(user))
		return
	if(user.loc == src)
		to_chat(user, SPAN_NOTICE("You cannot inspect \the [src] while being inside of it!"))
		return

	comp_prof.inspect_components(user)

/obj/vehicles/attack_hand(mob/user)
	if(user in get_occupants_in_position(VP_DRIVER))
		play_honk_sound()
		audible_message(SPAN_WARNING("[src] honks its horn!"))
		return
	if(user.a_intent != "harm")
		if(user in occupants)
			usr = user
			switch_seats()
			return

		for(var/pos in get_all_positions())
			if(enter_as_position(user, pos))
				return
		to_chat(user, "There is no space left in \The [src]")
	else
		. = ..()

/obj/vehicles/use_tool(obj/item/I, mob/user)
/*	if(elevation > user.elevation || elevation > I.elevation)
		to_chat(user,"<span class = 'notice'>[name] is too far away to interact with!</span>")
		return*/
	if(!istype(I))
		return
	if(user.loc == src)
		to_chat(user, SPAN_NOTICE("You cannot interact with \the [src] while being inside of it!"))
		return
	if(istype(I,/obj/item/grab))
		handle_grab_attack(I,user)
		return
	if(istype(I, /obj/item/key/car))
		return attack_key(I, user)
	if(user.a_intent == I_HURT)
		if(comp_prof.is_repair_tool(I))
			comp_prof.repair_inspected_with_tool(I,user)
			return
		if(istype(I,/obj/item/stack))
			comp_prof.repair_inspected_with_sheet(I,user)
			return
		if(istype(I,/obj/item/ammo_magazine))
			comp_prof.reload_turret(I,user)
			return
		. = ..()
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
		var/pos_to_dam = should_damage_occ()
		if(!isnull(pos_to_dam))
			damage_occupant(pos_to_dam,I,user)
			return
		comp_prof.take_component_damage(I.force,I.damtype)
		return
	put_cargo_item(user,I)

/obj/vehicles/proc/get_overall_resistance(resistance_type)
	return comp_prof.get_overall_resistance(resistance_type)

// VEHICLE CLICK HANDLER
/*
/datum/click_handler/default/vehicle
	var/obj/vehicles/vehicle

/datum/click_handler/default/vehicle/New(mob/user)
	..()
	if(!user)
		return
	var/atom/current_loc = user.loc
	while(current_loc)
		if(istype(current_loc, /obj/vehicles))
			vehicle = current_loc
			break
		if(current_loc == current_loc.loc)
			break
		current_loc = current_loc.loc

/datum/click_handler/default/vehicle/OnClick(atom/A, params)
	if(!user || !vehicle || QDELETED(vehicle))
		return
	user.ClickOn(A, params)

/datum/click_handler/default/vehicle/OnDblClick(atom/A, params)
	if(!user || !vehicle || QDELETED(vehicle))
		return
	user.DblClickOn(A, params)
*/
/obj/vehicles/allow_click_through(atom/A, params, mob/user)
	return TRUE

/obj/vehicles/contents_nano_distance(src_object, mob/living/user)
	. = ..()
	return STATUS_INTERACTIVE
