/obj/item/key/car
	name = "key"
	desc = "A small steel key, it's intended for a car."
	icon = 'mods/_fd/multitile_vehicles/icons/vehicle_keys.dmi'
	icon_state = null
	w_class = ITEM_SIZE_TINY

/obj/item/key/car/Initialize()
	. = ..()
	if(!icon_state)
		icon_state = "key[rand(1, 5)]"

/obj/item/key/car/exploration
	icon_state = "key4"
	key_data = "exploration"

/obj/vehicles/proc/doors_locked()
	return block_enter_exit

/obj/vehicles/proc/lock_toggle()
	block_enter_exit = !block_enter_exit
	if(block_enter_exit)
		playsound(src.loc, 'sound/machines/bolts_down.ogg', 70, FALSE)
	else
		playsound(src.loc, 'sound/machines/bolts_up.ogg', 70, FALSE)

/obj/vehicles/proc/attack_key(obj/item/key/car/key, mob/user)
	if(health_dead)
		return
	if(key.key_data != serial_number)
		to_chat(user, SPAN_WARNING("The key doesn't fit!"))
		return TRUE

	lock_toggle()
	user.visible_message(SPAN_NOTICE("[user] [block_enter_exit ? "" : "un"]locks \the [src]."))

/obj/vehicles/verb/lock_doors()
	set name = "Lock/Unlock doors"
	set category = "Vehicle"
	set src in view(1)
	var/mob/living/carbon/human/user = usr
	if(!istype(user) || !(user in get_occupants_in_position(dashboard_control_positions)))
		to_chat(user, SPAN_NOTICE("You must have access to dashboard of \the [src] to [block_enter_exit ? "lock" : "unlock"] the doors."))
		return
	if(health_dead)
		return

	lock_toggle()
	visible_message(SPAN_NOTICE("[user] [block_enter_exit ? "" : "un"]locks \the [src]."))

/obj/vehicles/verb/keys()
	set name = "Take/Insert the key"
	set category = "Vehicle"
	set src in view(1)
	var/mob/living/carbon/human/user = usr
	if(!istype(user) || !(user in get_occupants_in_position(dashboard_control_positions)))
		to_chat(user, SPAN_NOTICE("You must have access to dashboard of \the [src] to reach for the keys."))
		return
	if(inserted_key)
		deactivate()
		if(user.put_in_hands(inserted_key))
			to_chat(user, SPAN_NOTICE("You have removed keys from the ignition."))
			inserted_key = null
		else
			inserted_key.forceMove(src)
			return
	else
		var/obj/item/key/car/key = user.get_active_hand()
		if(!istype(key))
			return
		if(key.key_data != serial_number)
			to_chat(user, SPAN_WARNING("The key doesn't fit!"))
			return

		to_chat(user, SPAN_NOTICE("You have inserted keys into the ignition."))
		user.drop_from_inventory(key)
		inserted_key = key
		key.forceMove(src)
	playsound(src, 'sound/effects/buckle.ogg', 150, 1)

/obj/vehicles/verb/engine()
	set name = "Start/Shut the engine"
	set category = "Vehicle"
	set src in view(1)
	var/mob/living/user = usr
	if(!istype(user) || !(user in get_occupants_in_position(VP_DRIVER)))
		to_chat(user, SPAN_NOTICE("You must be the driver of [src] to reach for the ignition."))
		return
	if(health_dead)
		to_chat(user, SPAN_WARNING("\The [src] is dead!"))
		return
	if(!inserted_key)
		to_chat(user, SPAN_NOTICE("There are no keys in the ignition."))
		return

	if(!active)
		to_chat(user, SPAN_NOTICE("You're turning the engine ingnition key..."))
		activate()
		to_chat(user, SPAN_NOTICE("The engine is on!"))
	else
		deactivate()
		to_chat(user, SPAN_NOTICE("You stop the engine."))

/obj/vehicles/proc/activate()
	if(working_sounds)
		play_working_soundloop()
	sleep(startup_length) // Gotta start that engine
	active = TRUE

/obj/vehicles/proc/deactivate()
	active = FALSE
	if(working_sounds)
		stop_working_soundloop()
