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
	var/recharge_time = 3000
	var/overlay_added = FALSE

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
		recharge_time = 3000

	var/obj/item/organ/internal/heart/H = owner.internal_organs_by_name[BP_HEART]
	if(H.pulse == PULSE_NONE && owner.stat != DEAD)
		to_chat(src, SPAN_NOTICE("[SPAN_COLOR("#ff0000", "<b>WARNING</b>")]: EXTREME health conditions met. Inserting [SPAN_COLOR("#57ac36", "<b>preserved</b>")] medicine!"))
		if(!overlay_added)
			owner.overlay_fullscreen("failure", /obj/screen/fullscreen/alert_implant)
			overlay_added = TRUE

		if(!used)

			owner.playsound_local(get_turf(owner), 'mods/_fd/cyberware_mayhem/sounds/extreme.ogg', 20)
			spawn(1 SECOND)
				owner.playsound_local(get_turf(owner), 'mods/_fd/cyberware_mayhem/sounds/health.ogg', 20)
			spawn(2 SECOND)
				owner.playsound_local(get_turf(owner), 'mods/_fd/cyberware_mayhem/sounds/hazard.ogg', 20)
			if(overlay_added)
				spawn(2 SECONDS)
					owner.clear_fullscreen("failure")
			spawn(6 SECONDS)
				owner.playsound_local(get_turf(owner), 'mods/_fd/cyberware_mayhem/sounds/emergency.ogg', 20)
				owner.overlay_fullscreen("online", /obj/screen/fullscreen/implant_online)

			spawn(8 SECONDS)
				owner.playsound_local(get_turf(owner), 'mods/_fd/cyberware_mayhem/sounds/system.ogg', 20)

			var/datum/effect/spark_spread/sparks = new /datum/effect/spark_spread()
			sparks.set_up(1, 1, get_turf(owner))
			sparks.start()

			spawn(10 SECONDS)
				owner.playsound_local(get_turf(owner), 'mods/_fd/cyberware_mayhem/sounds/activated.ogg', 20)
				owner.clear_fullscreen("online")

			owner.make_jittery(50)

			owner.reagents.add_reagent(/datum/reagent/adrenaline, 10)
			owner.reagents.add_reagent(/datum/reagent/coagulant, 20)
			owner.reagents.add_reagent(/datum/reagent/deletrathol, 10)
			owner.reagents.add_reagent(/datum/reagent/peridaxon, 8)
			owner.reagents.add_reagent(/datum/reagent/dexalin, 20)
			owner.reagents.add_reagent(/datum/reagent/bicaridine, 40)
			overlay_added = FALSE
			used = TRUE

/obj/item/organ/internal/augment/adrenalin_injection/emp_act(severity)
	if(prob(30))
		if (istype(src.loc, /mob/living/carbon/human))
			var/mob/living/carbon/human/M = src.loc
			var/obj/item/organ/internal/heart/H = M.internal_organs_by_name[BP_HEART]
			to_chat(src, SPAN_NOTICE("[SPAN_COLOR("#ff0000", "<b>W&!RN#NG</b>")]: CRIT-T-TICAL SYSTEM [SPAN_COLOR("#ff0000", "<b>FA1LURRRRE</b>")]!"))
			spawn(2 SECONDS)
				to_chat(src, SPAN_NOTICE("Suddenly, something changes. You don't even have time to think, [SPAN_COLOR("#ff0000", "<b>your heart simply stops</b>")]. What a shame...maybe you shouldn't use that augment?"))
			H.pulse = 0
			used = TRUE
	..()

/obj/screen/fullscreen/implant_online
	icon = 'mods/_fd/cyberware_mayhem/icons/overlays.dmi'
	scale_to_view = TRUE
	icon_state = "online"
	plane = FULLSCREEN_PLANE
	layer = AUG_LAYER
	color = "#3fe9f5"

/obj/screen/fullscreen/implant_online/Initialize()
	. = ..()
	alpha = 0
	animate(src, transform = matrix(0.01, MATRIX_SCALE), time = 1 SECOND, easing = BOUNCE_EASING)
	spawn(2 SECONDS)
		animate(src, 1 SECOND, alpha = 150)
		animate(src, transform = matrix(), time = 1 SECOND, easing = LINEAR_EASING)

/obj/screen/fullscreen/implant_online/Destroy()
	animate(src, 1 SECOND, alpha = 0)
	severity = 0
	return ..()

/obj/screen/fullscreen/alert_implant
	icon = 'mods/_fd/cyberware_mayhem/icons/overlays.dmi'
	scale_to_view = TRUE
	icon_state = "alert"
	plane = FULLSCREEN_PLANE
	layer = AUG_LAYER
	color = "#e70000"

/obj/screen/fullscreen/alert_implant/Initialize()
	. = ..()
	alpha = 0
	animate(src, transform = matrix(0.01, MATRIX_SCALE), time = 1 SECOND, easing = BOUNCE_EASING)
	spawn(2 SECONDS)
		animate(src, 1 SECOND, alpha = 150)
		animate(src, transform = matrix(), time = 1 SECOND, easing = LINEAR_EASING)

/obj/screen/fullscreen/alert_implant/Destroy()
	animate(src, 1 SECOND, alpha = 0)
	severity = 0
	return ..()
