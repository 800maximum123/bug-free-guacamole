// APC OF ICCG
// BASE APC (transport)
/obj/vehicles/large/iccg_apc
	name = "NZM-APC 2"
	desc = "An Armored Personnel Carrier Mk2 manufactured by Novaya Zemlya Manufacturing. Used for transporting personnel in warzones."

	icon = 'maps/gaia/icons/vehicles/apc.dmi'
	icon_state = "apc"
	anchored = TRUE

	complex_controls = TRUE

	bound_height = 96
	bound_width = 96

	comp_prof = /datum/component_profile/iccg_apc

	occupants = list(1,1)
	exposed_positions = list("driver" = 0,"passenger" = 0)

	vehicle_size = 9 //ITEM_SIZE_VEHICLE_LARGE
	capacity_flag = 9 //ITEM_SIZE_VEHICLE_LARGE

	vehicle_view_modifier = 1.5

	acceleration = 2
	min_speed = 8
	max_speed = 2

	interior_template = /datum/map_template/iccg_apc
	size_x = 5
	size_y = 10

	serial_number = "iccg_apc"
	key_type = /obj/item/key/car/iccg_apc
	/// What livery is on the APC?
	var/livery = "BASIC"

/datum/map_template/iccg_apc
	name = "NZM-APC 2"
	mappaths = list("maps/gaia/interior/iccg_transport.dmm")

/obj/vehicles/large/iccg_apc/on_death()
	. = ..()

/obj/vehicles/large/iccg_apc/Initialize()
	. = ..()
	var/W = overlay_image(icon, initial(icon_state) + "-wheels")
	AddOverlays(W) //TODO: Make wheels a component that is put on the vehicle
	var/I = overlay_image(icon, initial(icon_state) + "-livery[livery]")
	AddOverlays(I)

/obj/item/vehicle_component/health_manager/iccg_apc
	integrity = 4000
	resistances = list("bullet" = 90,"energy" = 85,"emp" = 25,"bomb" = 85)

/datum/component_profile/iccg_apc
	vital_components = newlist(/obj/item/vehicle_component/health_manager/iccg_apc)

/obj/item/key/car/iccg_apc
	icon_state = "key5"
	key_data = "iccg_apc"


// COMMAND VARIANT
/obj/vehicles/large/iccg_apc/command
	name = "NZM-APC-C 2"
	desc = "An Armored Personnel Carrier Mk2 manufactured by Novaya Zemlya Manufacturing. Used for transporting personnel in warzones.\
			This one is designed for on-field commanding."
	interior_template = /datum/map_template/iccg_apc/command
	livery = "COM"

/datum/map_template/iccg_apc/command
	name = "NZM-APC-C 2"
	mappaths = list("maps/gaia/interior/iccg_command.dmm")

// MEDICAL VARIANT
/obj/vehicles/large/iccg_apc/medical
	name = "NZM-APC-M 2"
	desc = "An Armored Personnel Carrier Mk2 manufactured by Novaya Zemlya Manufacturing. Used for transporting personnel in warzones.\
			This one is designed as an ambulance."
	interior_template = /datum/map_template/iccg_apc/medical
	livery = "MED"

/datum/map_template/iccg_apc/medical
	name = "NZM-APC-M 2"
	mappaths = list("maps/gaia/interior/iccg_medical.dmm")

// MP VARIANT
/obj/vehicles/large/iccg_apc/mp
	name = "NZM-APC-P 2"
	desc = "An Armored Personnel Carrier Mk2 manufactured by Novaya Zemlya Manufacturing. Used for transporting personnel in warzones.\
			This one is designed for prison transportation."
	interior_template = /datum/map_template/iccg_apc/mp
	livery = "MP"

/datum/map_template/iccg_apc/mp
	name = "NZM-APC-P 2"
	mappaths = list("maps/gaia/interior/iccg_mp.dmm")
