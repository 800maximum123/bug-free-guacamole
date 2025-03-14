/obj/item/organ/internal/augment/adrenalin_injection
	name = "pocket life-saver"
	augment_slots = AUGMENT_CHEST
	icon = 'mods/_fd/cyberware_mayhem/icons/rig_modules.dmi' // PLACEHOLDER
	icon_state = "teleporter" // PLACEHOLDER
	desc = "An long glowing spinal cord with centipede-like appearance"
	default_action_type = /datum/action/item_action/organ/augment/fd
	augment_flags = AUGMENT_BIOLOGICAL | AUGMENT_SCANNABLE
	origin_tech = list(TECH_DATA = 2, TECH_BIO = 2)
	var/used = FALSE
	var/recharge_time = 100

/obj/item/organ/internal/augment/adrenalin_injection/onRoundstart()
	START_PROCESSING(SSobj, src)

/obj/item/organ/internal/augment/adrenalin_injection/onInstall()
	START_PROCESSING(SSobj, src)

/obj/item/organ/internal/augment/adrenalin_injection/onRemove()
	STOP_PROCESSING(SSobj, src)

/obj/item/organ/internal/augment/adrenalin_injection/Process()
	. = ..()

	if(used && recharge_time > 0)
		recharge_time -= 1

	if(recharge_time == 0 && used)
		used = FALSE
		recharge_time = 100

	var/obj/item/organ/internal/heart/H = owner.internal_organs_by_name[BP_HEART]
	if(H.pulse == PULSE_NONE)
		if(!used)
			owner.reagents.add_reagent(/datum/reagent/adrenaline, 10)
			owner.reagents.add_reagent(/datum/reagent/coagulant, 20)
			owner.reagents.add_reagent(/datum/reagent/deletrathol, 10)
			owner.reagents.add_reagent(/datum/reagent/peridaxon, 8)
			owner.reagents.add_reagent(/datum/reagent/dexalin, 20)
			owner.reagents.add_reagent(/datum/reagent/bicaridine, 40)
			used = TRUE

/obj/item/organ/internal/augment/adrenalin_injection/emp_act(severity)
	if(prob(30))
		if (istype(src.loc, /mob/living/carbon/human))
			var/mob/living/carbon/human/M = src.loc
			var/obj/item/organ/internal/heart/H = M.internal_organs_by_name[BP_HEART]
			to_chat(M, SPAN_DANGER("Your [name] malfunctions, as you strange feeling pain in the chest!"))
			H.heartbeat = 0
	..()
