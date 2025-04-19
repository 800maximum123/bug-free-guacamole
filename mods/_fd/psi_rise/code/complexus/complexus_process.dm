/datum/psi_complexus/Process()
	. = ..()
	if(suppressed)
		return
	for(var/datum/psi_ability/ability in current_abilities)
		ability.Process()
