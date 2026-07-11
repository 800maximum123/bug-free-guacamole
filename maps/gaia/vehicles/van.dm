// CIVVIES VANS
// BASE VAN (white)
/obj/vehicles/large/van
	name = "Blackstone 'Hauler' van"
	desc = "A 'Hauler' model van produced by Blackstone Foundries, can carry lots of stuff and more!"

	icon = 'maps/gaia/icons/vehicles/van.dmi'
	icon_state = "white"
	anchored = TRUE

	bound_height = 96
	bound_width = 96

	comp_prof = /datum/component_profile/van

	exposed_positions = list(VP_DRIVER = 0)

	vehicle_size = ITEM_SIZE_VEHICLE_LARGE

	vehicle_view_modifier = 1.5

	acceleration = 2
	min_speed = 8
	max_speed = 2

	interior_template = /datum/map_template/van
	size_x = 5
	size_y = 7

	serial_number = "van"
	key_type = /obj/item/key/car/van

	wheels = "van-wheels"

/datum/map_template/van
	name = "Blackstone 'Hauler' van"
	mappaths = list("maps/gaia/interior/van.dmm")

/obj/item/vehicle_component/health_manager/van
	integrity = 700
	resistances = list("bullet" = 20,"energy" = 20,"emp" = 20,"bomb" = 10)

/datum/component_profile/van
	vital_components = newlist(/obj/item/vehicle_component/health_manager/van)

/obj/item/key/car/van
	name = "van key"
	icon_state = "key2"
	key_data = "van"

// RED
/obj/vehicles/large/van/red
	icon_state = "red"

// AMBULANCE
/obj/vehicles/large/van/ambulance
	name = "Blackstone ambulance van"
	desc = "A 'Hauler' model van produced by Blackstone Foundries, this one was designed as an ambulance."

	interior_template = /datum/map_template/van/ambulance

	has_alarm = TRUE
	honk_sound = list('maps/gaia/sounds/vehicles/electro_honk.ogg')

	serial_number = "van_ambulance"
	key_type = /obj/item/key/car/van/ambulance

	livery = "van-liveryAMBULANCE"

/datum/map_template/van/ambulance
	name = "Blackstone ambulance van"
	mappaths = list("maps/gaia/interior/van_ambulance.dmm")

/obj/item/key/car/van/ambulance
	name = "ambulance van key"
	icon_state = "keypolice"
	key_data = "van_ambulance"

// FIREFIGHTER
/obj/vehicles/large/van/firefighter
	name = "Blackstone firefighter van"
	desc = "A 'Hauler' model van produced by Blackstone Foundries, this one was designed as a sturdy firefighting vehicle."

	interior_template = /datum/map_template/van/firefighter

	comp_prof = /datum/component_profile/van/firefighter

	has_alarm = TRUE
	honk_sound = list('maps/gaia/sounds/vehicles/electro_honk.ogg')

	serial_number = "van_firefighter"
	key_type = /obj/item/key/car/van/firefighter

	livery = "van-liveryFIREFIGHTER"

/datum/map_template/van/firefighter
	name = "Blackstone firefighter van"
	mappaths = list("maps/gaia/interior/van_ambulance.dmm")

/obj/item/vehicle_component/health_manager/van/firefighter
	integrity = 1000
	resistances = list("bullet" = 20,"energy" = 70,"emp" = 30,"bomb" = 30)

/datum/component_profile/van/firefighter
	vital_components = newlist(/obj/item/vehicle_component/health_manager/van/firefighter)

/obj/item/key/car/van/firefighter
	name = "firefighter van key"
	icon_state = "keypolice"
	key_data = "van_ambulance"
