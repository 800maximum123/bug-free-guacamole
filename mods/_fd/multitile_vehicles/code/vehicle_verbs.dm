/obj/vehicles/verb/verb_exit_vehicle()
	set name = "Exit vehicle"
	set category = "Vehicle"
	set src in view(1)

	exit_vehicle(usr)

/obj/vehicles/verb/enter_vehicle()
	set name = "Enter vehicle"
	set category = "Vehicle"
	set src in view(1)

	var/mob/living/user = usr
	if(!istype(user) || !Adjacent(user) || user.incapacitated())
		return
	click_enter_vehicle(user)

/obj/vehicles/verb/switch_seats()
	set name = "Switch seats"
	set category = "Vehicle"
	set src in view(1)
	var/mob/user = usr
	if(!istype(user) || !Adjacent(user))
		return
	click_switch_seats(user)
