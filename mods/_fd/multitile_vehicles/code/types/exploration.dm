/obj/vehicles/large/exploration
	name = "SATV-154-EC 'Triceratops'"
	desc = "A large transport vehicle, made specifically for the harsh environment."

	icon = 'mods/_fd/multitile_vehicles/icons/glider.dmi'
	icon_state = "glider"
	anchored = TRUE

	complex_controls = TRUE

	bound_height = 96
	bound_width = 96

	comp_prof = /datum/component_profile/exploration
	frontal_hit_prob = 10
	rear_hit_prob = 90
	side_hit_prob = 50

	exposed_positions = list(VP_DRIVER = 0, VP_PASSENGER = 0)

	vehicle_size = ITEM_SIZE_VEHICLE_LARGE
	capacity_flag = ITEM_SIZE_VEHICLE_LARGE

	vehicle_view_modifier = 1.5

	acceleration = 2
	min_speed = 8
	max_speed = 2

	interior_template = /datum/map_template/exploration
	size_x = 5
	size_y = 10

	serial_number = "exploration"
	key_type = /obj/item/key/car/exploration

/datum/map_template/exploration
	name = "SATV-154-EC 'Triceratops'"
	mappaths = list("mods/_fd/multitile_vehicles/maps/exploration.dmm")

/obj/item/vehicle_component/health_manager/exploration
	integrity = 2000
	resistances = list("bullet"=85,"energy"=85,"emp"=25,"bomb"=85)

/datum/component_profile/exploration
	vital_components = newlist(/obj/item/vehicle_component/health_manager/exploration)
