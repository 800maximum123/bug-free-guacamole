/obj/overmap/simulated_ship
	name = "Unknown ship"
	desc = "unknown ship"
	icon = 'mods/_fd/fd_assets/icons/overmap_eris.dmi'
	icon_state = "unkn"
	var/moving_state = "unkn_r"
	scannable = TRUE
	requires_contact = TRUE

	var/datum/ship_characteristic/characteristic = null

	// These two bad boys are for when we have real Z-level ship and
	// we want the simulation ship to only contain info about it and kinda
	// control it. Disabled for now
	var/obj/overmap/visitable/ship/linked_object = null
	var/should_link = FALSE

/obj/overmap/simulated_ship/Initialize()
	..()
	START_PROCESSING(SSobj, src)

/obj/overmap/simulated_ship/Destroy()
	var/obj/overmap/event/ship_wreck/type_of_wreck = characteristic.get_wreck_type()
	if(type_of_wreck)
		var/obj/overmap/event/ship_wreck/new_wreck = new type_of_wreck(get_turf(src))
		new_wreck.color = src.color
	//O.Initialize()
	if(!QDELETED(characteristic))
		QDEL_NULL(characteristic)
	..()

/obj/overmap/simulated_ship/Process()
	. = ..()


// Incoming fire or ship
/obj/overmap/simulated_ship/Cross(atom/movable/O)
	. = ..()
	log_and_message_admins("Was crossed by [O.name]")

// Ship goes into event or something
///obj/overmap/simulated_ship/Entered(atom/movable/O, oldloc)
//	. = ..()
//	log_and_message_admins("Entered [O.name]")


///obj/overmap/simulated_ship/Bumped(AM)
//	. = ..()
//	log_and_message_admins(AM.name)



/obj/overmap/simulated_ship/proc/attack(obj/Target)
	log_and_message_admins(SPAN_WARNING("<b> Attacking!</i></b>"))

/obj/overmap/simulated_ship/proc/move(obj/Target)
	log_and_message_admins(SPAN_WARNING("<b> Moving!</i></b>"))

/obj/overmap/simulated_ship/proc/test()
	log_and_message_admins(SPAN_WARNING("<b> TEST</i></b>"))
