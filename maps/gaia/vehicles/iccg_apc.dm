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

	comp_prof = /datum/component_profile/iccg_apc/turret
	frontal_hit_prob = 10
	rear_hit_prob = 80
	side_hit_prob = 50

	exposed_positions = list(VP_DRIVER = 0, VP_COMMANDER = 0)
	available_seats = list(VP_DRIVER = 1, VP_COMMANDER = 1)
	turret_control_position = VP_COMMANDER

	vehicle_size = ITEM_SIZE_VEHICLE_LARGE
	capacity_flag = ITEM_SIZE_VEHICLE

	vehicle_view_modifier = 1.5

	acceleration = 2
	min_speed = 8
	max_speed = 2

	interior_template = /datum/map_template/iccg_apc
	size_x = 5
	size_y = 7

	has_alarm = TRUE
	alarm_sounds = list('maps/gaia/sounds/vehicles/iccg_apc_siren.ogg')
	honk_sound = list('maps/gaia/sounds/vehicles/electro_honk.ogg')

	serial_number = "iccg_apc"
	key_type = /obj/item/key/car/iccg_apc

	wheels = "apc-wheels"
	livery = "apc-liveryBASIC"

	/// Toggleable shutters
	var/image/shutters = "apc-shutters1"
	var/shutters_open = TRUE

/datum/map_template/iccg_apc
	name = "NZM-APC 2"
	mappaths = list("maps/gaia/interior/iccg_transport.dmm")

/obj/vehicles/large/iccg_apc/on_death()
	. = ..()

/obj/vehicles/large/iccg_apc/Initialize()
	. = ..()
	if(shutters)
		shutters = overlay_image(icon, shutters)
		AddOverlays(shutters)

/obj/vehicles/large/iccg_apc/verb/toggle_shutters()
	set name = "Toggle Shutters"
	set category = "Vehicle"
	set src in view(1)
	if(health_dead)
		return
	var/mob/living/user = usr
	if(!istype(user) || !(user in get_occupants_in_position(VP_DRIVER)))
		to_chat(user, SPAN_NOTICE("You must be the driver of [src] to toggle the shutters."))
		return

	CutOverlays(shutters)
	if(shutters_open)
		shutters_open = FALSE
		shutters = overlay_image('maps/gaia/icons/vehicles/apc.dmi', "apc-shutters0")
		to_chat(user,SPAN_NOTICE("You close [src]'s shutters."))
		playsound(get_turf(src), 'sound/effects/locker_close.ogg', 30, TRUE)
	else
		shutters_open = TRUE
		shutters = overlay_image('maps/gaia/icons/vehicles/apc.dmi', "apc-shutters1")
		to_chat(user,SPAN_NOTICE("You open [src]'s shutters."))
		playsound(get_turf(src), 'sound/effects/locker_open.ogg', 30, TRUE)
	AddOverlays(shutters)

/obj/item/vehicle_component/health_manager/iccg_apc
	integrity = 4000
	resistances = list("bullet" = 90,"energy" = 85,"emp" = 25,"bomb" = 85)
	has_death_sequence = TRUE

/datum/component_profile/iccg_apc
	vital_components = newlist(/obj/item/vehicle_component/health_manager/iccg_apc)

/datum/component_profile/iccg_apc/turret
	vital_components = newlist(/obj/item/vehicle_component/health_manager/iccg_apc)
	components = newlist(/obj/item/vehicle_component/turret)

/obj/item/key/car/iccg_apc
	name = "APC key"
	icon_state = "key5"
	key_data = "iccg_apc"


// COMMAND VARIANT
/obj/vehicles/large/iccg_apc/command
	name = "NZM-APC-C 2"
	desc = "An Armored Personnel Carrier Mk2 manufactured by Novaya Zemlya Manufacturing. Used for transporting personnel in warzones. \
			This one is designed for on-field commanding."
	comp_prof = /datum/component_profile/iccg_apc/turret
	interior_template = /datum/map_template/iccg_apc/command
	livery = "apc-liveryCOM"

/datum/map_template/iccg_apc/command
	name = "NZM-APC-C 2"
	mappaths = list("maps/gaia/interior/iccg_command.dmm")

// MEDICAL VARIANT
/obj/vehicles/large/iccg_apc/medical
	name = "NZM-APC-M 2"
	desc = "An Armored Personnel Carrier Mk2 manufactured by Novaya Zemlya Manufacturing. Used for transporting personnel in warzones. \
			This one is designed as an ambulance."
	interior_template = /datum/map_template/iccg_apc/medical
	livery = "apc-liveryMED"

/datum/map_template/iccg_apc/medical
	name = "NZM-APC-M 2"
	mappaths = list("maps/gaia/interior/iccg_medical.dmm")

// MP VARIANT
/obj/vehicles/large/iccg_apc/mp
	name = "NZM-APC-P 2"
	desc = "An Armored Personnel Carrier Mk2 manufactured by Novaya Zemlya Manufacturing. Used for transporting personnel in warzones. \
			This one is designed for prison transportation."
	comp_prof = /datum/component_profile/iccg_apc/turret
	interior_template = /datum/map_template/iccg_apc/mp
	livery = "apc-liveryMP"

/datum/map_template/iccg_apc/mp
	name = "NZM-APC-P 2"
	mappaths = list("maps/gaia/interior/iccg_mp.dmm")
