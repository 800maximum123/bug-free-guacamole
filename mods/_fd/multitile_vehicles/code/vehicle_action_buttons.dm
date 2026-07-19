#define ACTION_USE_SMOKE "Use Smoke Screen"
#define ACTION_USE_BRAKE "Toggle Brake"
#define ACTION_USE_EXIT "Exit Vehicle"
#define ACTION_USE_ENGINE "Toggle Engine"
#define ACTION_USE_LOCK "Lock/Unlock Doors"
#define ACTION_USE_KEY "Insert/Remove Key"
#define ACTION_USE_TURRET "Take/Remove Turret Controls"
#define ACTION_USE_ALARM "Toggle Alarm"
#define ACTION_USE_HEADLIGHTS "Toggle Headlights"
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

/datum/action/vehicle_action/vehicle_smoke
	name = ACTION_USE_SMOKE
	procname = "deploy_smoke"
	button_icon_state = "deploysmoke"

/datum/action/vehicle_action/vehicle_brake
	name = ACTION_USE_BRAKE
	procname = "toggle_brakes"
	button_icon_state = "brake"

/datum/action/vehicle_action/vehicle_exit
	name = ACTION_USE_EXIT
	procname = "verb_exit_vehicle"
	button_icon_state = "exit"

/datum/action/vehicle_action/vehicle_engine
	name = ACTION_USE_ENGINE
	procname = "engine"
	button_icon_state = "engine"

/datum/action/vehicle_action/vehicle_lock
	name = ACTION_USE_LOCK
	procname = "lock_doors"
	button_icon_state = "lock"

/datum/action/vehicle_action/vehicle_key
	name = ACTION_USE_KEY
	procname = "keys"
	button_icon_state = "key"

/datum/action/vehicle_action/vehicle_turret
	name = ACTION_USE_TURRET
	procname = "take_turret_controls"
	button_icon_state = "turret"

/datum/action/vehicle_action/vehicle_alarm
	name = ACTION_USE_ALARM
	procname = "toggle_alarm"
	button_icon_state = "alarm"

/datum/action/vehicle_action/vehicle_headlights
	name = ACTION_USE_HEADLIGHTS
	procname = "toggle_headlights"
	button_icon_state = "headlights"

/datum/action/vehicle_action/vehicle_detach_carried
	name = ACTION_DETACH_VEHICLE
	procname = "detach_vehicle"
	button_icon_state = "detachvehicle"

/obj/vehicles/proc/init_vehicle_actions()
	driver_actions = list(
		new /datum/action/vehicle_action/vehicle_exit(src),
		new /datum/action/vehicle_action/vehicle_brake(src),
		new /datum/action/vehicle_action/vehicle_engine(src),
		new /datum/action/vehicle_action/vehicle_lock(src),
		new /datum/action/vehicle_action/vehicle_key(src),
		)
	if(has_turret_component())
		driver_actions += new /datum/action/vehicle_action/vehicle_turret(src)
	if(vehicle_carry_size > 0)
		driver_actions += new /datum/action/vehicle_action/vehicle_detach_carried(src)
	if(has_headlights)
		driver_actions += new /datum/action/vehicle_action/vehicle_headlights(src)
	if(has_alarm)
		driver_actions += new /datum/action/vehicle_action/vehicle_alarm(src)

/obj/vehicles/proc/add_remove_vehicle_actions(mob/m, remove = 0)
	for(var/datum/action/a in driver_actions)
		if(remove)
			a.Remove(m)
		else
			a.Grant(m)

#undef ACTION_USE_SMOKE
#undef ACTION_USE_BRAKE
#undef ACTION_USE_EXIT
#undef ACTION_USE_ENGINE
#undef ACTION_USE_LOCK
#undef ACTION_USE_KEY
#undef ACTION_USE_TURRET
#undef ACTION_USE_ALARM
#undef ACTION_USE_HEADLIGHTS
#undef ACTION_DETACH_VEHICLE
#undef ACTION_STOP_LOOKING_OUTSIDE
#undef ACTION_LOOK_IN_INTERIOR
