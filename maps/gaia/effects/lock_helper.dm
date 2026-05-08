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
	for(var/obj/thing in current_turf)
		if(istype(thing, /obj/machinery/door/unpowered/simple))
			var/obj/machinery/door/unpowered/simple/door = thing
			var/obj/item/material/lock_construct/L = new(src.loc)
			L.lock_data = lock_data
			door.lock = L.create_lock(door, null, start_locked)
	qdel(src)

/obj/lock_helper/unlocked
	icon_state = "lock_unlocked"
	start_locked = FALSE

// GAIA LOCK HELPERS
// SCG LOCKS
/obj/lock_helper/gaia_scg
	name = "SCG door locker helper"
	color = COLOR_BLUE_GRAY
	lock_data = "GAIA_SCG_MASTER_KEY"

/obj/lock_helper/unlocked/gaia_scg
	name = "SCG door locker helper"
	color = COLOR_BLUE_GRAY
	lock_data = "GAIA_SCG_MASTER_KEY"

// ICCG LOCKS
/obj/lock_helper/gaia_iccg
	name = "ICCG door locker helper"
	color = COLOR_RED_GRAY
	lock_data = "GAIA_ICCG_MASTER_KEY"

/obj/lock_helper/unlocked/gaia_iccg
	name = "ICCG door locker helper"
	color = COLOR_RED_GRAY
	lock_data = "GAIA_ICCG_MASTER_KEY"

// CITIZEN LOCKS
// MAYOR
/obj/lock_helper/gaia_mayor
	name = "Mayor door locker helper"
	color = COLOR_GREEN_GRAY
	lock_data = "GAIA_MAYOR_KEY"

/obj/lock_helper/unlocked/gaia_mayor
	name = "Mayor door locker helper"
	color = COLOR_GREEN_GRAY
	lock_data = "GAIA_MAYOR_KEY"

// POLICE
/obj/lock_helper/gaia_police
	name = "Police door locker helper"
	color = COLOR_DARK_BLUE_GRAY
	lock_data = "GAIA_POLICE_KEY"

/obj/lock_helper/unlocked/gaia_police
	name = "Police door locker helper"
	color = COLOR_DARK_BLUE_GRAY
	lock_data = "GAIA_POLICE_KEY"

// FIREFIGHTER
/obj/lock_helper/gaia_firefighter
	name = "Firefighter door locker helper"
	color = COLOR_RED_LIGHT
	lock_data = "GAIA_FIREFIGHTER_KEY"

/obj/lock_helper/unlocked/gaia_firefighter
	name = "Firefighter door locker helper"
	color = COLOR_RED_LIGHT
	lock_data = "GAIA_FIREFIGHTER_KEY"

// MEDICAL
/obj/lock_helper/gaia_medical
	name = "Medical door locker helper"
	color = COLOR_PALE_BLUE_GRAY
	lock_data = "GAIA_MEDICAL_KEY"

/obj/lock_helper/unlocked/gaia_medical
	name = "Medical door locker helper"
	color = COLOR_PALE_BLUE_GRAY
	lock_data = "GAIA_MEDICAL_KEY"

// ENGINEERING
/obj/lock_helper/gaia_engineering
	name = "Engineering door locker helper"
	color = COLOR_YELLOW_GRAY
	lock_data = "GAIA_ENGINEERING_KEY"

/obj/lock_helper/unlocked/gaia_engineering
	name = "Engineering door locker helper"
	color = COLOR_YELLOW_GRAY
	lock_data = "GAIA_ENGINEERING_KEY"

// CHURCH
/obj/lock_helper/gaia_church
	name = "Church door locker helper"
	color = COLOR_GRAY
	lock_data = "GAIA_CHURCH_KEY"

/obj/lock_helper/unlocked/gaia_church
	name = "Church door locker helper"
	color = COLOR_GRAY
	lock_data = "GAIA_CHURCH_KEY"
