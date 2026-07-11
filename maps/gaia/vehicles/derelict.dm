// VEHICLE DERELICTS
// To place around maps as obstacles to overcome
/obj/structure/vehicle_derelict
	name = "APC derelict"
	desc = "Charred remains of an old ICCG APC."
	icon = 'maps/gaia/icons/vehicles/apc.dmi'
	icon_state = "apc_destroyed"
	density = TRUE
	anchored = TRUE
	bound_height = 96
	bound_width = 96
	health_max = 400

/obj/structure/vehicle_derelict/suv
	name = "SUV derelict"
	desc = "Charred remains of an old SUV."
	icon = 'maps/gaia/icons/vehicles/suv.dmi'
	icon_state = "black_destroyed"
	bound_height = 64
	bound_width = 64
	health_max = 200

/obj/structure/vehicle_derelict/suv/white
	icon_state = "white_destroyed"

/obj/structure/vehicle_derelict/van
	name = "van derelict"
	desc = "Charred remains of an old van."
	icon = 'maps/gaia/icons/vehicles/van.dmi'
	icon_state = "white_destroyed"
	health_max = 300

/obj/structure/vehicle_derelict/van/red
	icon_state = "red_destroyed"
