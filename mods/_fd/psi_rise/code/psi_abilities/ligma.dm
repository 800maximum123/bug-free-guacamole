/datum/psi_ability/ligma
	name = "ligma"
	icon_state = "pyro_spirit"

	cost = 10
	cooldown = 6 SECONDS

/datum/psi_ability/ligma/do_use(atom/target, params)
	playsound(holder.loc, 'sound/magic/summon_carp.ogg', 100)
	to_world(SPAN_DANGER("У ВАС ЛИГМА"))
	return TRUE
