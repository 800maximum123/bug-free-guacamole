/datum/mech_ability/death_mark
	name = "Метка смерти"
	action_state = "37"

	charges_max = 6
	charges = 6

	charges_cooldown = 10 SECONDS

/datum/mech_ability/death_mark/Process()

	if(charges == 0)
		charges = charges_max

	. = ..()
