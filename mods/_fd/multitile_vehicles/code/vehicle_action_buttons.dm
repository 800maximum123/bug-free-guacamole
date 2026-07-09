#define ACTION_USE_SMOKE "Use Smoke Screen"
#define ACTION_USE_BRAKE "Toggle Brake"
#define ACTION_DETACH_VEHICLE "Detach Vehicle"
#define ACTION_STOP_LOOKING_OUTSIDE "Stop looking outside"
#define ACTION_LOOK_IN_INTERIOR "Look in interior"

/datum/action/vehicle_action
	action_type = AB_GENERIC
	check_flags = AB_CHECK_ALIVE
	button_icon = 'mods/_fd/multitile_vehicles/icons/vehicleactionicons.dmi'

/datum/action/vehicle_action/CheckRemoval(mob/living/user)
	return !(user in target)

/datum/action/vehicle_action/stop_looking_outside
	name = ACTION_STOP_LOOKING_OUTSIDE
	procname = "stop_looking_outside"
	button_icon_state = "stoplookingoutside"

/datum/action/vehicle_action/stop_looking_outside/CheckRemoval(mob/living/user)
	return (user.client.eye == MOB_PERSPECTIVE)

/datum/action/vehicle_action/look_in_interior
	name = ACTION_LOOK_IN_INTERIOR
	procname = "look_in_interior"
	button_icon_state = "lookininterior"

/datum/action/vehicle_action/vehicle_brake
	name = ACTION_USE_BRAKE
	procname = "toggle_brakes"
	button_icon_state = "brake"

/datum/action/vehicle_action/vehicle_detach_carried
	name = ACTION_DETACH_VEHICLE
	procname = "detach_vehicle"
	button_icon_state = "detachvehicle"

/obj/vehicles/proc/init_vehicle_actions()
	driver_actions = list(new /datum/action/vehicle_action/vehicle_brake(src))
	if(vehicle_carry_size > 0)
		driver_actions += new /datum/action/vehicle_action/vehicle_detach_carried (src)

/obj/vehicles/large/init_vehicle_actions()
	. = ..()
	driver_actions += new /datum/action/vehicle_action/look_in_interior(src)

/obj/vehicles/proc/add_remove_vehicle_actions(mob/m, remove = 0)
	for(var/datum/action/a in driver_actions)
		if(remove)
			a.Remove(m)
		else
			a.Grant(m)

#undef ACTION_USE_SMOKE
#undef ACTION_USE_BRAKE
#undef ACTION_DETACH_VEHICLE
#undef ACTION_STOP_LOOKING_OUTSIDE
#undef ACTION_LOOK_IN_INTERIOR
