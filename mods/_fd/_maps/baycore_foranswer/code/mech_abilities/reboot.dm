/datum/mech_ability/action/reboot
	name = "Перезагрузка"
	action_state = "32"

	cooldown = 0

/datum/mech_ability/action/reboot/use(atom/target, params)
	. = ..()
	if(!.)
		return

	owner.mech_reboot() // Пока так, потом стоит разделить РЕБУТ и РЕМОНТ как мы и планировали :P
