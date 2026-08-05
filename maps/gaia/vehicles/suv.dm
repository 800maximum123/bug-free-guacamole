// SUV
// BASE SUV (black)
/obj/vehicles/suv
	name = "Ward-Takahashi S-Class SUV"
	desc = "Sleek S-Class SUV produced by Ward-Takahashi for civilians to handle these rough and tough... paved roads."

	icon = 'maps/gaia/icons/vehicles/suv.dmi'
	icon_state = "black"
	anchored = TRUE

	bound_height = 64
	bound_width = 64

	comp_prof = /datum/component_profile/suv

	exposed_positions = list(VP_DRIVER = 0, VP_COMMANDER = 0, VP_PASSENGER = 0)
	available_seats = list(VP_DRIVER = 1, VP_COMMANDER = 1, VP_PASSENGER = 3)

	damage_to_people = 15
	damage_to_obstacles = 50

	vehicle_size = ITEM_SIZE_VEHICLE
	capacity_flag = ITEM_SIZE_VEHICLE

	vehicle_view_modifier = 1.5

	acceleration = 2
	min_speed = 6
	max_speed = 1.5

	serial_number = "suv"
	key_type = /obj/item/key/car/suv

	wheels = "suv-wheels"

/obj/item/vehicle_component/health_manager/suv
	integrity = 500
	resistances = list("bullet" = 15,"energy" = 15,"emp" = 20,"bomb" = 5)

/datum/component_profile/suv
	vital_components = newlist(/obj/item/vehicle_component/health_manager/suv)

/obj/item/key/car/suv
	name = "SUV key"
	icon_state = "key1"
	key_data = "suv"

// WHITE SUV
/obj/vehicles/suv/white
	icon_state = "white"

// POLICE SUV
/obj/vehicles/suv/police
	name = "Ward-Takahashi Police SUV"
	desc = "Sleek S-Class SUV produced by Ward-Takahashi for law enforcement agencies, featuring a siren and slightly tougher bumper."

	comp_prof = /datum/component_profile/suv/police

	serial_number = "suvpolice"
	key_type = /obj/item/key/car/suv/police

	has_alarm = TRUE
	honk_sound = list('maps/gaia/sounds/vehicles/electro_honk.ogg')

	livery = "suv-liveryPOLICE"

/obj/item/vehicle_component/health_manager/suv/police
	integrity = 700
	resistances = list("bullet" = 30,"energy" = 25,"emp" = 20,"bomb" = 15)

/datum/component_profile/suv/police
	vital_components = newlist(/obj/item/vehicle_component/health_manager/suv/police)

/obj/item/key/car/suv/police
	name = "Police SUV key"
	icon_state = "keypolice"
	key_data = "suvpolice"

/obj/vehicles/suv/police/white
	icon_state = "white"
