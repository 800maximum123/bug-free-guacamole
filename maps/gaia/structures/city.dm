// Various structures used primarily at urbanrebels.dmm
//////////////////
// STREETLIGHTS //
//////////////////
/obj/machinery/light/streetlight
	name = "streetlight"
	desc = "Massive light for illuminating outdoors."
	icon = 'maps/gaia/icons/structures/streetpoles.dmi'
	icon_state = "streetlight"
	base_state = "streetlight"
	light_type = /obj/item/light/tube/large/warm
	construct_type = /obj/machinery/light_construct/streetlight

// Dir helpers for mapping
/obj/machinery/light/streetlight/north
	dir = NORTH
	pixel_y = -32
	pixel_x = -32

/obj/machinery/light/streetlight/south
	dir = SOUTH
	pixel_y = 32
	pixel_x = -32

/obj/machinery/light/streetlight/east
	dir = EAST
	pixel_y = 0
	pixel_x = -64

/obj/machinery/light/streetlight/west
	dir = WEST
	pixel_y = 0
	pixel_x = 0

// Override so it doesn't fuck with dirs
/obj/machinery/light/streetlight/on_update_icon(trigger = TRUE)
	ClearOverlays()
	icon_state = "[base_state]_empty" //Never use the initial state. That'll just reset it to the mapping icon.
	atom_flags = atom_flags & ~ATOM_FLAG_CAN_BE_PAINTED

	switch(dir)
		if(NORTH)
			pixel_y = -32
			pixel_x = -32
		if(SOUTH)
			pixel_y = 32
			pixel_x = -32
		if(EAST)
			pixel_y = 0
			pixel_x = -64
		if(WEST)
			pixel_y = 0
			pixel_x = 0

	var/_state
	switch(get_status())		// set icon_states
		if(LIGHT_OK)
			_state = "[base_state][on]"
			atom_flags |= ATOM_FLAG_CAN_BE_PAINTED
		if(LIGHT_EMPTY)
			on = FALSE
		if(LIGHT_BURNED)
			_state = "[base_state]_burned"
			on = FALSE
		if(LIGHT_BROKEN)
			_state = "[base_state]_broken"
			on = FALSE

	if(istype(lightbulb, /obj/item/light))
		if (on)
			AddOverlays(emissive_appearance(icon, _state))
		AddOverlays(overlay_image(icon, _state, lightbulb.color))

	if(on)

		update_use_power(POWER_USE_ACTIVE)

		var/changed = FALSE
		if(current_mode && (current_mode in lightbulb.lighting_modes))
			changed = set_light(arglist(lightbulb.lighting_modes[current_mode]))
		else
			changed = set_light(lightbulb.b_range, lightbulb.b_power, lightbulb.b_colour)

		if(trigger && changed && get_status() == LIGHT_OK)
			switch_check()
	else
		update_use_power(POWER_USE_OFF)
		set_light(0)
	change_power_consumption((light_range * light_power) * LIGHTING_POWER_FACTOR, POWER_USE_ACTIVE)

/obj/machinery/light/streetlight/ex_act(severity)
	switch(severity)
		if(EX_ACT_DEVASTATING)
			if(prob(75))
				qdel(src)
			else
				create_ruins(TRUE)
				qdel(src)
			return
		if(EX_ACT_HEAVY)
			if(prob(75))
				broken()
			else
				create_ruins(FALSE)
				qdel(src)
			return
		if(EX_ACT_LIGHT)
			if(prob(50))
				broken()
			return

/// Creates a "ruin" of streetlight instead of the light itself
/// harsh - if the "ruin" is fully destroyed or only just bent
/obj/machinery/light/streetlight/proc/create_ruins(harsh)
	if(harsh)
		var/obj/machinery/light_construct/streetlight/ruins = new(src.loc)
		ruins.dir = src.dir
		ruins.update_icon()
	else
		var/obj/machinery/light_construct/streetlight/ruins = new(src.loc)
		ruins.dir = src.dir
		ruins.update_icon()

////////////////////////////
// STREETLIGHT CONSTRUCTS //
////////////////////////////
/obj/machinery/light_construct/streetlight
	name = "streetlight fixture frame"
	desc = "A streetlight fixture under construction."
	icon = 'maps/gaia/icons/structures/streetpoles.dmi'
	icon_state = "streetlight-construct-stage1"
	fixture_type = /obj/machinery/light/spot
	sheets_refunded = 6

/obj/machinery/light_construct/streetlight/north
	dir = NORTH
	pixel_y = -32
	pixel_x = -32

/obj/machinery/light_construct/streetlight/south
	dir = SOUTH
	pixel_y = 32
	pixel_x = -32

/obj/machinery/light_construct/streetlight/east
	dir = EAST
	pixel_y = 0
	pixel_x = -64

/obj/machinery/light_construct/streetlight/west
	dir = WEST
	pixel_y = 0
	pixel_x = 0

// Bent damaged version
/obj/machinery/light_construct/streetlight/stage2
	icon_state = "streetlight-construct-stage2"
	stage = 2 // LIGHT_STAGE_WIRED, don't wanna bother with defines here

/obj/machinery/light_construct/streetlight/stage2/north
	dir = NORTH
	pixel_y = -32
	pixel_x = -32

/obj/machinery/light_construct/streetlight/stage2/south
	dir = SOUTH
	pixel_y = 32
	pixel_x = -32

/obj/machinery/light_construct/streetlight/stage2/east
	dir = EAST
	pixel_y = 0
	pixel_x = -64

/obj/machinery/light_construct/streetlight/stage2/west
	dir = WEST
	pixel_y = 0
	pixel_x = 0

/obj/machinery/light_construct/on_update_icon()
	switch(stage)
		if(1) icon_state = "streetlight-construct-stage1" //LIGHT_STAGE_EMPTY
		if(2) icon_state = "streetlight-construct-stage2" //LIGHT_STAGE_WIRED
		if(3) icon_state = "streetlight-construct_empty" //LIGHT_STAGE_COMPLETE

	switch(dir)
		if(NORTH)
			pixel_y = -32
			pixel_x = -32
		if(SOUTH)
			pixel_y = 32
			pixel_x = -32
		if(EAST)
			pixel_y = 0
			pixel_x = -64
		if(WEST)
			pixel_y = 0
			pixel_x = 0

///////////////
// INTERCOMS //
///////////////
/obj/item/device/radio/megaphones
	name = "public announcment intercom"
	desc = "Massive speakers to speak to all of the city."
	icon = 'maps/gaia/icons/structures/streetpoles.dmi'
	icon_state = "intercom"
	randpixel = 0
	anchored = TRUE
	w_class = ITEM_SIZE_HUGE
	atom_flags = ATOM_FLAG_NO_TEMP_CHANGE | ATOM_FLAG_NO_BLOOD
	obj_flags = OBJ_FLAG_CONDUCTIBLE
	layer = ABOVE_HUMAN_LAYER
	cell = null
	power_usage = 0
	canhear_range = 12 // A few extra tiles won't hurt
	power_usage = 0
	pixel_x = -32

/obj/item/device/radio/megaphones/interact(mob/user)
	return

/obj/item/device/radio/megaphones/ToggleBroadcast()
	return
