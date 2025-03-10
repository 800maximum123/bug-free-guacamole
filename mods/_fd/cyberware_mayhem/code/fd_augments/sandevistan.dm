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
		to_chat(owner, SPAN_NOTICE("In one moment, everything around you almost stops. You feeling yourself really strange. Brain thinks much faster, and all muscles screaming in painful agony. Right now you have all the time in the world..."))
		owner.speedboost = TRUE
		owner.sandevistan_visuals()
	else
		owner.sandevistan_visuals()
		owner.speedboost = FALSE
		owner.speedboost_debuff = 30

//for bullet_act look into code/modules/projectiles/projectile.dm or simply search for speedboost
/mob/living/carbon/human
	var/speedboost = FALSE
	var/speedboost_debuff = 30

/mob/living/carbon/human/Life()

	if(speedboost && speedboost_debuff > 0)
		speedboost_debuff -= 1

	if(speedboost && speedboost_debuff == 0)
		adjustBrainLoss(10)
		speedboost_debuff = 30
	..()

/mob/living/carbon/human/proc/sandevistan_visuals()
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

//we dodging all bullets and punches in activated mod
/mob/living/carbon/human/attack_hand(mob/living/carbon/M, atom/newloc)
	if(speedboost)
		adjustBrainLoss(5)
		sandevistan_dodge(newloc,dir)
		return
	..()

//and also melee
/mob/living/carbon/human/use_tool(obj/item/tool, mob/user, list/click_params, atom/newloc)
	if(speedboost && tool.force > 5)
		adjustBrainLoss(5)
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
