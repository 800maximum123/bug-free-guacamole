/obj/item/organ/internal/augment/active/sandevistan
	name = "time-speed spinal modifier"
	action_button_name = "Activate Boosters"
	augment_slots = AUGMENT_CHEST
	icon = 'mods/_fd/cyberware_mayhem/icons/rig_modules.dmi' // PLACEHOLDER
	icon_state = "teleporter" // PLACEHOLDER
	default_action_type = /datum/action/item_action/organ/augment/fd
	desc = "An long glowing spinal cord with centipede-like appearance"
	augment_flags = AUGMENT_BIOLOGICAL | AUGMENT_MECHANICAL | AUGMENT_SCANNABLE | AUGMENT_INSPECTABLE
	origin_tech = list(TECH_DATA = 2, TECH_BIO = 2)
	var/reflexes_in = FALSE

/obj/item/organ/internal/augment/active/sandevistan/activate()
	. = ..()

	reflexes_in = !reflexes_in
	if (reflexes_in)
		START_PROCESSING(SSobj, src)
		to_chat(owner, SPAN_NOTICE("In one moment, everything around you almost [SPAN_COLOR("#ff0000", "<b>STOPS</b>")]. You feeling yourself [SPAN_COLOR("#1fdfa5", "<b>really strange</b>")]. Brain thinks much faster, and all muscles screaming in painful [SPAN_COLOR("#ff0000", "<b>AGONY</b>")]. Right now you have all the time in the world...but for what cost?"))

		owner.playsound_local(get_turf(owner), 'mods/_fd/cyberware_mayhem/sounds/system.ogg', 20)
		spawn(1 SECOND)
			owner.playsound_local(get_turf(owner), 'mods/_fd/cyberware_mayhem/sounds/status.ogg', 20)
		spawn(2 SECOND)
			owner.playsound_local(get_turf(owner), 'mods/_fd/cyberware_mayhem/sounds/operating.ogg', 20)
		owner.reagents.add_reagent(/datum/reagent/hyperzine/sandevistan, 15)
		owner.speedboost = TRUE
		owner.sandevistan_visuals()
	else
		STOP_PROCESSING(SSobj, src)
		owner.playsound_local(get_turf(owner), 'mods/_fd/cyberware_mayhem/sounds/system.ogg', 20)
		spawn(1 SECOND)
			owner.playsound_local(get_turf(owner), 'mods/_fd/cyberware_mayhem/sounds/status.ogg', 20)
		spawn(2 SECOND)
			owner.playsound_local(get_turf(owner), 'mods/_fd/cyberware_mayhem/sounds/off.ogg', 20)
		owner.reagents.del_reagent(/datum/reagent/hyperzine/sandevistan)
		owner.sandevistan_visuals()
		owner.speedboost = FALSE
		owner.speedboost_debuff = 30

/obj/item/organ/internal/augment/active/sandevistan/Process()
	. = ..()
	if(reflexes_in)
		owner.reagents.del_reagent(/datum/reagent/hyperzine/sandevistan)
		owner.reagents.add_reagent(/datum/reagent/hyperzine/sandevistan, 15)

/datum/reagent/hyperzine/sandevistan
	overdose = 99999

//for bullet_act look into code/modules/projectiles/projectile.dm or simply search for speedboost
/mob/living/carbon/human
	var/speedboost = FALSE
	var/speedboost_debuff = 30

/mob/living/carbon/human/Life()

	if(speedboost && speedboost_debuff > 0)
		speedboost_debuff -= 1

	if(speedboost && speedboost_debuff == 0)
		var/obj/item/organ/internal/cell/E = src.internal_organs_by_name[BP_CELL]
		if(!E || E.cell.charge == 0)
			adjustBrainLoss(20)
			to_chat(src, SPAN_NOTICE("You starting to feel an REAL [SPAN_COLOR("#ff0000", "<b>HEADACHE</b>")]. It's about time to [SPAN_COLOR("#ff0000", "<b>STOP</b>")], if you don't want to melt your brains!"))
		else
			if (E.cell.charge > 0)
				to_chat(src, SPAN_NOTICE("[SPAN_COLOR("#ff0000", "<b>WARNING</b>")]: Your charge is currently at [SPAN_COLOR("#ff0000", "<b>[E.cell.charge]</b>")] capacity!"))
				E.cell.charge -= 100
		speedboost_debuff = 30
	..()

/mob/living/carbon/human/proc/do_math()
	var/obj/item/organ/internal/cell/E = src.internal_organs_by_name[BP_CELL]
	if(!E || E.cell.charge == 0)
		playsound_local(get_turf(src), 'mods/_fd/cyberware_mayhem/sounds/extreme.ogg', 20)
		spawn(1 SECOND)
			playsound_local(get_turf(src), 'mods/_fd/cyberware_mayhem/sounds/heat.ogg', 20)
		spawn(2 SECOND)
			playsound_local(get_turf(src), 'mods/_fd/cyberware_mayhem/sounds/hazard.ogg', 20)
		adjustBrainLoss(5)
	else
		if (E.cell.charge > 0)
			playsound_local(get_turf(src), 'mods/_fd/cyberware_mayhem/sounds/energy.ogg', 20)
			spawn(1 SECOND)
				playsound_local(get_turf(src), 'mods/_fd/cyberware_mayhem/sounds/status.ogg', 20)
			spawn(2 SECOND)
				playsound_local(get_turf(src), 'mods/_fd/cyberware_mayhem/sounds/low.ogg', 20)
			E.cell.charge -= 20
			to_chat(src, SPAN_NOTICE("[SPAN_COLOR("#ff0000", "<b>WARNING</b>")]: Your charge is currently at [SPAN_COLOR("#ff0000", "<b>[E.cell.charge]</b>")] capacity!"))

/mob/living/carbon/human/proc/sandevistan_visuals(client/C, image/assist)
	if (has_client_color(/datum/client_color/ultraspeed))
		remove_client_color(/datum/client_color/ultraspeed)
		update_client_color()
	else
		add_client_color(/datum/client_color/ultraspeed)
		update_client_color()

/mob/living/carbon/human/proc/sandevistan_dodge(moving_to,move_direction)
	//Assuming we move towards the target we want to swerve toward them to get closer
	var/image/user_image = image(src)
	user_image.dir = src.dir
	var/obj/after_image = new /obj/effect/lunge(get_turf(src.loc))
	after_image.dir = src.dir
	after_image.overlays += user_image
	after_image.alpha = 100
	after_image.color = "#5ddbbc"
	animate(after_image, 0.5 SECOND, alpha = 0)
	spawn(1 SECOND)
		qdel(after_image)

	var/cdir = turn(move_direction,45)
	var/ccdir = turn(move_direction,-45)
	. = Move(get_step(loc,pick(cdir,ccdir)))
	if(!.)//Can't dodge there so we just carry on
		. =  Move(moving_to,move_direction)

/datum/client_color/ultraspeed
	client_color = list(
		0.2, 0.3, 0.1,
		0.2, 0.5, 0.4,
		0.2, 0.4, 0.5
	)
	order = 199
	ignore_blood = TRUE


/mob/living/simple_animal/UnarmedAttack(atom/A, proximity, atom/newloc)
	if (istype(A, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = A
		if (H.speedboost == TRUE)
			H.do_math()
			H.sandevistan_dodge(newloc,dir)
			return
	..()

//we dodging all bullets and punches in activated mod
/mob/living/carbon/human/attack_hand(mob/living/carbon/M, atom/newloc)
	if(speedboost)
		do_math()
		sandevistan_dodge(newloc,dir)
		return
	..()

/mob/living/carbon/human/use_weapon(obj/item/weapon, mob/living/user, list/click_params, atom/newloc)
	if(speedboost)
		do_math()
		sandevistan_dodge(newloc,dir)
		return
	..()

//and also melee
/mob/living/carbon/human/use_tool(obj/item/tool, mob/user, list/click_params, atom/newloc)
	if(speedboost)
		do_math()
		sandevistan_dodge(newloc,dir)
		return
	..()

//oh, and don't forget about this cool effect on the moving!
/mob/living/carbon/human/Move(NewLoc, direct)
	if(speedboost)
		var/image/user_image = image(src)
		user_image.dir = src.dir
		var/obj/after_image = new /obj/effect/lunge(get_turf(src.loc))
		after_image.dir = src.dir
		after_image.overlays += user_image
		after_image.alpha = 100
		after_image.color = "#5ddbbc"
		animate(after_image, 0.5 SECOND, alpha = 0)
		spawn(1 SECOND)
			qdel(after_image)

	..()

//to-do: delete all spaces when character trying to say something
