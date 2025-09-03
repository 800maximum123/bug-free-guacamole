/datum/mech_ability/action/flash
	name = "Вспышка"
	action_state = "flash"

	cooldown = 5 SECONDS

	charges_max = 4
	charges = 4

	charges_cooldown = 30 SECONDS

/datum/mech_ability/action/flash/use(atom/target, params)
	. = ..()
	if(!.)
		return

	for(var/mob/living/simple_animal/fd/lancer/L in oview(5,owner))
		if(L.faction == owner.faction)
			continue
		L.flash_eyes(FLASH_PROTECTION_NONE)
		L.eye_blurry = max(L.eye_blurry, 10)
		L.add_status_effect(/datum/mech_status/vulnerable, 5 SECONDS)

	owner.adjust_heat(2)

	return .
