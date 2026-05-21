/obj/item/stack/nanopaste
	name = "nanopaste"
	singular_name = "nanite swarm"
	desc = "A tube of paste containing swarms of repair nanites. Very effective in repairing mechanical components autonomously."
	icon = 'icons/obj/medical.dmi'
	icon_state = "nanopaste"
	origin_tech = list(TECH_MATERIAL = 4, TECH_ENGINEERING = 3)
	amount = 10


/obj/item/stack/nanopaste/use_after(mob/living/M as mob, mob/user as mob)
	if (!istype(M) || !istype(user))
		return FALSE
	if (istype(M,/mob/living/silicon/robot))	//Repairing cyborgs
		var/mob/living/silicon/robot/R = M
		if (R.getBruteLoss() || R.getFireLoss() )
			user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)

			if(R.simple_combat_on)
				R.simple_health_calculation(-20,0,0,0)
				if(R.get_status_effect(/datum/simple_status/legbroke))
					R.remove_status_effect(/datum/simple_status/legbroke)
				if(R.get_status_effect(/datum/simple_status/hardcrit))
					R.stabilized = TRUE
					R.remove_status_effect(/datum/simple_status/hardcrit)

			R.adjustBruteLoss(-15)
			R.adjustFireLoss(-15)
			R.updatehealth()
			use(1)
			user.visible_message(SPAN_NOTICE("\The [user] applied some [src] on [R]'s damaged areas."),\
				SPAN_NOTICE("You apply some [src] at [R]'s damaged areas."))
		else
			to_chat(user, SPAN_NOTICE("All [R]'s systems are nominal."))
		return TRUE

	if (istype(M,/mob/living/carbon/human))		//Repairing robolimbs
		var/mob/living/carbon/human/H = M
		var/obj/item/organ/external/S = H.get_organ(user.zone_sel.selecting)

		if(!S)
			to_chat(user, SPAN_WARNING("\The [M] is missing that body part."))
			return TRUE

		if(BP_IS_BRITTLE(S))
			to_chat(user, SPAN_WARNING("\The [M]'s [S.name] is hard and brittle - \the [src] cannot repair it."))
			return TRUE

		if(S && BP_IS_ROBOTIC(S) && S.hatch_state == HATCH_OPENED)
			if (!S.get_damage())
				to_chat(user, SPAN_NOTICE("Nothing to fix here."))
			else if (can_use(1))
				user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)

				if(H.simple_combat_on)
					H.simple_health_calculation(-20,0,0,0)
					if(H.get_status_effect(/datum/simple_status/legbroke))
						H.remove_status_effect(/datum/simple_status/legbroke)
					if(H.get_status_effect(/datum/simple_status/hardcrit))
						H.stabilized = TRUE
						H.remove_status_effect(/datum/simple_status/hardcrit)

				S.heal_damage(15, 15, robo_repair = 1)
				H.updatehealth()
				use(1)
				user.visible_message(SPAN_NOTICE("\The [user] applies some nanite paste on [user != M ? "[M]'s [S.name]" : "[S]"] with [src]."),\
				SPAN_NOTICE("You apply some nanite paste on [user == M ? "your" : "[M]'s"] [S.name]."))
			return TRUE
