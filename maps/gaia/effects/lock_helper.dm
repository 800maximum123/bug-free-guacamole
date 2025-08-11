// Creates a lock datum on the unpowered door at the same turf as the lock helper object.
// You can customize the lock's lock_data so that you can create specific keys that open it.
/obj/lock_helper
	name = "door locker helper"
	icon = 'maps/gaia/icons/effects.dmi'
	icon_state = "lock"
	layer = ABOVE_DOOR_LAYER
	blend_mode = BLEND_MULTIPLY

	var/lock_data = null // Custom lock data
	var/start_locked = TRUE // If TRUE, the lock will be created locked. If FALSE, it will be unlocked. Ignored if lock_data is null.

/obj/lock_helper/Initialize()
	. = ..()
	return INITIALIZE_HINT_LATELOAD

/obj/lock_helper/LateInitialize(mapload)
	var/turf/current_turf = get_turf(src)
	for(var/obj/machinery/door/unpowered/simple/door in current_turf)
		if(!lock_data)
			door.initial_lock_value = TRUE
			qdel(src)
		. = new /datum/lock(door, lock_data, start_locked)
	qdel(src)

/obj/lock_helper/unlocked
	icon_state = "lock_unlocked"
	start_locked = FALSE

// Gaia specific lock helpers
/obj/lock_helper/gaia_scg
	name = "SCG door locker helper"
	color = COLOR_BLUE_GRAY
	lock_data = "GAIA_SCG_MASTER_KEY"

/obj/lock_helper/gaia_iccg
	name = "ICCG door locker helper"
	color = COLOR_RED_GRAY
	lock_data = "GAIA_SCG_MASTER_KEY"

/obj/lock_helper/unlocked/gaia_scg
	name = "SCG door locker helper"
	color = COLOR_BLUE_GRAY
	lock_data = "GAIA_SCG_MASTER_KEY"

/obj/lock_helper/unlocked/gaia_iccg
	name = "ICCG door locker helper"
	color = COLOR_RED_GRAY
	lock_data = "GAIA_SCG_MASTER_KEY"
