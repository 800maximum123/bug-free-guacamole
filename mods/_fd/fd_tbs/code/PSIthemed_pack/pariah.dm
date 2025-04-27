/mob/living/simple_animal/fd/unit/psi/morvar
	name = "Andrew Morvar"
	desc = "Andrew Morvar"

	icon_state = "Morvar"

	unit_health = 8
	healthbar_color = "#4b5320"
	side = "Traitors"

	has_armor = TRUE
	unit_armor = 6

	friends_list = list(

	)

	unit_actions_amount = 2

	unit_speed = 8
	unit_move_actions = 2

	has_special = TRUE


/*
	var/unit_healthvisual = TRUE // Maybe we won't want it
	var/unit_maxhealth = unit_health // For Adminabuse

/mob/living/simple_animal/fd/unit/psi/morvar/Life()
	. = ..()


/mob/living/simple_animal/fd/unit/psi/morvar/proc/healthvisual()
	if(!unit_healthvisual)
	return FALSE

	if( => )
		icon_state = initial(icon_state) + "_75"

	if( => )
		icon_state = initial(icon_state) + "_50"

	if( => )
		icon_state = initial(icon_state) + "_25"

	else
		icon_state = initial(icon_state)

	return TRUE

*/
