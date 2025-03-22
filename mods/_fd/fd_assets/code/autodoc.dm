// TO-DO: Удалить это и сделать заново (c) Махикум

/obj/machinery/sleeper/autodoc
	name = "autodoc"
	desc = "Your doctor is right here!"
	icon = 'mods/_fd/fd_assets/icons/cryogenics.dmi'
	icon_state = "autodoc_open"

	var/timer = 120 SECONDS // 2 min

/obj/machinery/sleeper/autodoc/Process()
	if(inoperable())
		return

	if(iscarbon(occupant))
		occupant.SetStasis(20)
		timer -= 1 SECOND
		occupant.bodytemperature = 261
		if(occupant.getBruteLoss() || occupant.getFireLoss() || occupant.getOxyLoss())
			occupant.adjustBruteLoss(-(50))
			occupant.adjustFireLoss(-(50))
			occupant.adjustOxyLoss(-(50))

		if (occupant.stat == UNCONSCIOUS && prob(2))
			to_chat(occupant, SPAN_NOTICE(SPAN_BOLD("... [pick("comfy", "feels slow", "warm")] ...")))
		if(timer <= 0)
			visible_message(usr, SPAN_NOTICE("COMPLETE: [occupant] has been healed"))
			go_out() // GET THE FUCK OUT!!!

/obj/machinery/sleeper/autodoc/go_out()
	if(!occupant)
		return
	if(occupant.client)
		occupant.client.eye = occupant.client.mob
		occupant.client.perspective = MOB_PERSPECTIVE
	if(timer >= 0)
		visible_message(usr, SPAN_NOTICE("ERROR: You can't eject from autodoc midsurgery"))
		return FALSE

	occupant.heal_overall_damage(occupant.getBruteLoss(), occupant.getFireLoss())
	occupant.restore_blood()
	occupant.dropInto(loc)
	set_occupant(null)
	timer = 120 SECONDS // bringing dat shit back

/obj/machinery/sleeper/autodoc/go_in(mob/target, mob/user)
	if(!ishuman(occupant))
		return
	. = ..()
	heal_procedure()

/obj/machinery/sleeper/autodoc/on_update_icon()
	if(!occupant)
		icon_state = "autodoc_open"
	else if(inoperable())
		icon_state = "autodoc_closed"
	else
		icon_state = "autodoc_operate"

/obj/machinery/sleeper/autodoc/interface_interact(mob/user)
	return FALSE

/obj/machinery/sleeper/autodoc/proc/heal_procedure()
	if(!ishuman(occupant))
		return
	for(var/obj/item/organ/external/E in occupant.organs)
		if(E.status & ORGAN_ARTERY_CUT)
			E.status &= ~ORGAN_ARTERY_CUT
			E.mend_fracture()
		for(var/datum/wound/W in E.wounds)
			if(W.bleeding())
				W.bleed_timer = 0
				W.clamped = TRUE
				E.status &= ~ORGAN_BLEEDING


	occupant.restore_blood()

	occupant.reagents.add_reagent(/datum/reagent/adrenaline, 10)
	occupant.reagents.add_reagent(/datum/reagent/coagulant, 30)
	occupant.reagents.add_reagent(/datum/reagent/deletrathol, 10)
	occupant.reagents.add_reagent(/datum/reagent/peridaxon, 8)
	occupant.reagents.add_reagent(/datum/reagent/dexalin, 20)
	occupant.reagents.add_reagent(/datum/reagent/cryoxadone, 20)
	occupant.reagents.add_reagent(/datum/reagent/clonexadone, 20)
	occupant.reagents.add_reagent(/datum/reagent/bicaridine, 20)
	occupant.reagents.add_reagent(/datum/reagent/alkysine, 15)



/*
/obj/machinery/sleeper/autodoc/go_out()
	if(!occupant)
		return
	if(occupant.client)
		occupant.client.eye = occupant.client.mob
		occupant.client.perspective = MOB_PERSPECTIVE
	occupant.dropInto(loc)
	set_occupant(null)

	for(var/obj/O in (contents - component_parts)) // In case an object was dropped inside or something. Excludes the beaker and component parts.
		if(O == beaker)
			continue
		O.dropInto(loc)
	toggle_filter()
*/
