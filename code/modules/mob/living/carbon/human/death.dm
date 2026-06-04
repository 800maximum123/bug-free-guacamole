/mob/living/carbon/human/gib()
	for(var/obj/item/organ/I in internal_organs)
		I.removed()
		if(!QDELETED(I) && isturf(loc))
			I.throw_at(get_edge_target_turf(src,pick(GLOB.alldirs)),rand(1,3),30)

	for(var/obj/item/organ/external/E in src.organs)
		E.droplimb(0,DROPLIMB_EDGE,1)

	sleep(1)

	for(var/obj/item/I in src)
		drop_from_inventory(I)
		if(!QDELETED(I))
			I.throw_at(get_edge_target_turf(src,pick(GLOB.alldirs)), rand(1,3), round(30/I.w_class))

	..(species.gibbed_anim)
	gibs(loc, dna, null, species.get_flesh_colour(src), species.get_blood_colour(src))

/mob/living/carbon/human/dust()
	if(species)
		..(species.dusted_anim, species.remains_type)
	else
		..()

/mob/living/carbon/human/death(gibbed, deathmessage="seizes up and falls limp...", show_dead_message = "You have died.", last_words)

	if(stat == DEAD) return

	if(last_words)
		last_words = stutter(last_words)
		audible_message(SPAN_ITALIC("<b>[src]</b> whispers on his last breath: \"[last_words]\")"), deaf_message = SPAN_ITALIC("<b>[src]</b> weakly whispers something..."), hearing_distance = 2, runemessage = last_words)

	SET_BIT(hud_updateflag, HEALTH_HUD)
	SET_BIT(hud_updateflag, STATUS_HUD)
	SET_BIT(hud_updateflag, LIFE_HUD)

	//Handle species-specific deaths.
	species.handle_death(src)

	// [GAIA]
	// "Friendly fire - isn't"
	sound_to(src, 'sound/effects/shellshock.ogg')
	if(crit_sound_token)
		sound_to(src, sound(null, channel = GLOB.crit_sound_channel))
		crit_sound_token = 0
	overlay_fullscreen("deathflash", /obj/screen/fullscreen/deathflash)
	spawn(22) // 22 ticks is how long "deathflash" lasts
		clear_fullscreen("deathflash")
		clear_fullscreen("crit")
		clear_fullscreen("oxy")
		clear_fullscreen("brute")
	animate_tail_stop()

	//Handle brain slugs.
	var/obj/item/organ/external/head = get_organ(BP_HEAD)
	var/mob/living/simple_animal/borer/B

	if(head)
		for(var/I in head.implants)
			if(istype(I,/mob/living/simple_animal/borer))
				B = I
		if(B)
			if(!B.ckey && ckey && B.controlling)
				B.ckey = ckey
				B.controlling = 0
			if(B.host_brain.ckey)
				ckey = B.host_brain.ckey
				B.host_brain.ckey = null
				B.host_brain.SetName("host brain")
				B.host_brain.real_name = "host brain"

			verbs -= /mob/living/carbon/proc/release_control

	callHook("death", list(src, gibbed))

	if(SSticker.mode)
		SSticker.mode.check_win()

	if(wearing_rig)
		wearing_rig.notify_ai(SPAN_DANGER("Warning: user death event. Mobility control passed to integrated intelligence system."))

	. = ..(gibbed,"no message")
	if(!gibbed)
		handle_organs()
		if(species.death_sound)
			playsound(loc, species.death_sound, 80, 1, 1)
	handle_hud_list()

/mob/living/carbon/human/proc/ChangeToHusk()
	if(MUTATION_HUSK in mutations)	return

	if(species.name in HUMAN_SPECIES) //Only change hair, and not say, tentacles
		if(facial_hair_style)
			facial_hair_style = "Shaved"		//we only change the icon_state of the hair datum, so it doesn't mess up their UI/UE
		if(head_hair_style)
			head_hair_style = "Bald"
		update_hair(0)

	mutations.Add(MUTATION_HUSK)
	for(var/obj/item/organ/external/E in organs)
		E.status |= ORGAN_DISFIGURED
	update_body(1)
	return

/mob/living/carbon/human/proc/ChangeToSkeleton()
	if(MUTATION_SKELETON in src.mutations)	return

	if(facial_hair_style)
		facial_hair_style = "Shaved"
	if(head_hair_style)
		head_hair_style = "Bald"
	update_hair(0)

	mutations.Add(MUTATION_SKELETON)
	for(var/obj/item/organ/external/E in organs)
		E.status |= ORGAN_DISFIGURED
	update_body(1)
	playsound(src.loc, 'sound/effects/bonerattle.ogg', 50, 1)
	return
