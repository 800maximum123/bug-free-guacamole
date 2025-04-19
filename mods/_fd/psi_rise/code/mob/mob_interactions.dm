/mob/living/UnarmedAttack(atom/A, proximity)
	if(psi)
		psi.invoke_abilities(A, null, INVOKE_PSI_MELEE)
	. = ..()

/mob/living/RangedAttack(atom/A, params)
	if(psi)
		psi.invoke_abilities(A, params, INVOKE_PSI_RANGED)
	. = ..()
