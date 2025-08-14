/datum/species/pilot
	name = SPECIES_PILOT
	name_plural = "Pilot"

	darksight_range = 8
	darksight_tint = DARKTINT_GOOD

	has_organ = list()
	siemens_coefficient = 0
	blood_color = COLOR_BLOOD_HUMAN
	flesh_color = "#ffc896"
	species_flags = SPECIES_FLAG_NO_MINOR_CUT | SPECIES_FLAG_NO_SLIP | SPECIES_FLAG_NO_POISON | SPECIES_FLAG_NO_EMBED | SPECIES_FLAG_NO_TANGLE | SPECIES_FLAG_NO_PAIN
	spawn_flags = SPECIES_IS_RESTRICTED
	genders = list(MALE,FEMALE)
	icobase = 'mods/_fd/_maps/baycore_foranswer/icons/pilots/body.dmi'
	deform = 'mods/_fd/_maps/baycore_foranswer/icons/pilots/body.dmi'
	preview_icon = 'mods/_fd/_maps/baycore_foranswer/icons/pilots/pilots_list.dmi'

	damage_overlays = null
	damage_mask = null
	blood_mask = null

	total_health = 600                   // Point at which the mob will enter crit.
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/punch, /datum/unarmed_attack/bite/sharp)

	natural_armour_values = list(
		melee = ARMOR_MELEE_VERY_HIGH,
		bullet = ARMOR_BALLISTIC_RESISTANT,
		bomb = ARMOR_BOMB_RESISTANT,
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_BIO_SHIELDED
		)
	brute_mod =      0.5
	toxins_mod =     0
	radiation_mod =  0

	oxy_mod =        0.5
	flash_mod =      0

	hud_type = /datum/hud_data/pilot

	strength = STR_MEDIUM
	min_age = 16
	max_age = 200

/datum/hud_data/pilot
	has_warnings = 0
	has_pressure = 0
	has_nutrition = 0
	has_bodytemp = 0
	has_internals = 0
	gear = list()

/mob/living/carbon/human/pilot
	desc = "Just a Man."
	see_in_dark = 8
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/pilots/pilots_list.dmi'
	icon_state = "scg_standart"

	no_ssd = TRUE

	var/icon_setup = 'mods/_fd/_maps/baycore_foranswer/icons/pilots/pilots_list.dmi'
	var/icon_state_setup = "scg_standart"
	var/setup_name = "Pilot"
	var/setup_desc = "Just a Man."

/mob/living/carbon/human/pilot/Initialize(mapload)
	. = ..(mapload, SPECIES_PILOT)
	return INITIALIZE_HINT_LATELOAD

/mob/living/carbon/human/pilot/LateInitialize(mapload)
	setup_pilot()

/mob/living/carbon/human/pilot/proc/setup_pilot()
	overlays += image(icon_setup, icon_state_setup)
	name = setup_name
	real_name = setup_name
	flavor_texts["general"] = setup_desc
	add_language(LANGUAGE_PILOT)

/mob/living/carbon/human/pilot/update_icons()
	lying_prev = lying	//so we don't update overlays for lying/standing unless our stance changes again
	update_hud()		//TODO: remove the need for this

	var/list/scale = get_scale()
	animate(
		src,
		transform = matrix().Update(
			scale_x = scale[1],
			scale_y = scale[2],
			rotation = lying ? 90 : 0,
			offset_y = lying ? -6 - default_pixel_z : 16 * (scale[2] - 1)
		),
		time = ANIM_LYING_TIME
	)

/mob/living/carbon/human/pilot/MouseDrop(mob/target)
	if(!istype(target, /mob/living/simple_animal/fd/lancer))
		return ..()

	if(!CanMouseDrop(target, usr) || !istype(usr, /mob/living/carbon))
		return

	var/mob/living/simple_animal/fd/lancer/mech_target = target
	if(!QDELETED(mech_target.pilot))
		to_chat(usr, SPAN_WARNING("Кресло пилота [mech_target] уже занято!"))
		return

	usr.visible_message(SPAN_DANGER("[usr] начинает помещать [src == usr ? "себя" : src] внутрь [mech_target]!"))
	if(!do_after(usr, 5 SECONDS, mech_target, DO_PUBLIC_UNIQUE))
		return

	if(client)
		client.view = 12
	mech_target.pilot = src
	forceMove(mech_target)
	mech_target.ckey = ckey
	mech_target.visible_message(SPAN_INFO("[src] усаживается внутрь [mech_target]."))
	playsound(get_turf(mech_target),'sound/mecha/powerup.ogg',60)
	spawn(3 SECONDS)
		playsound(get_turf(mech_target),'sound/mecha/nominal.ogg',60)

/obj/landmark/mech_pilot
	name = "Pilot spawn"
	icon_state = "x"
	var/mob_to_spawn = /mob/living/carbon/human/pilot

/obj/landmark/mech_pilot/Initialize()
	..()
	return INITIALIZE_HINT_LATELOAD

/obj/landmark/mech_pilot/LateInitialize(mapload, ...)
	. = ..()
	new mob_to_spawn(loc)

	qdel(src)

/datum/language/pilot
	name = LANGUAGE_PILOT
	desc = "The special telecommunication line."
	speech_verb = "говорит"
	ask_verb = "спрашивает"
	exclaim_verb = "заявляет"
	colour = "say_quote"
	key = "k"
	flags = RESTRICTED | NO_STUTTER | HIVEMIND
	syllables = list("---|","-","||-||","-|--","|||||","-----","-","|","-||-","|---")
	shorthand = "SL"
	has_written_form = FALSE
