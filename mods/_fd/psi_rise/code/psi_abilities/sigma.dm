/datum/psi_ability/sigma
	name = "sigma ability"
	icon_state = "pyro_blast"

	invoke_flags = INVOKE_PSI_ON_CLICK

	cost = 10
	cooldown = 6 SECONDS
	duration = -1

/datum/psi_ability/sigma/do_use(atom/target, params)
	if(!target)
		return FALSE
	playsound(holder.loc, 'sound/magic/fireball.ogg', 100)
	to_world(SPAN_OCCULT("я сигма я сгимасигмаг [target]"))
	return TRUE
