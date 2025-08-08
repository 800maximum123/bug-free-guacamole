#define SPECIES_PILOT       "Pilot"
#define LANGUAGE_PILOT "Secret Channel"

/datum/species/pilot
	name = SPECIES_PILOT
	name_plural = "Tartakan"

	darksight_range = 8
	darksight_tint = DARKTINT_GOOD

	has_organ = list()
	siemens_coefficient = 0
	blood_color = COLOR_BLOOD_HUMAN
	flesh_color = "#ffc896"
	species_flags = SPECIES_FLAG_NO_MINOR_CUT | SPECIES_FLAG_NO_SLIP | SPECIES_FLAG_NO_POISON | SPECIES_FLAG_NO_EMBED | SPECIES_FLAG_NO_TANGLE | SPECIES_FLAG_NO_PAIN
	spawn_flags = SPECIES_IS_RESTRICTED
	genders = list(MALE,FEMALE)
	icobase = null
	deform = null
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

/obj/sprite_helper/pilot
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/pilots/pilots_list.dmi'
	icon_state = "scg_standart"

/mob/living/carbon/human/pilot/New()
	..()
	spawn (20)
		fix_icons()
	set_species(SPECIES_PILOT)
	add_language(LANGUAGE_PILOT)

/mob/living/carbon/human/pilot/Move()
	..()
	update_stuff()

/mob/living/carbon/human/pilot/forceMove(destination)
	. = ..(destination)
	update_stuff()

/mob/living/carbon/human/pilot/proc/update_stuff()
	fix_icons()

/mob/living/carbon/human/pilot/proc/fix_icons()
	icon = null
	icon_state = null
	stand_icon = null
	lying_icon = null
	update_icon = FALSE
	if (!vis_contents.len)
		vis_contents += new /obj/sprite_helper/pilot
	var/obj/sprite_helper/pilot/SH = vis_contents[vis_contents.len]
	if (lying || resting)
		SH.icon = turn(icon('mods/_fd/_maps/baycore_foranswer/icons/pilots/pilots_list.dmi'), 90)
	else
		SH.icon = 'mods/_fd/_maps/baycore_foranswer/icons/pilots/pilots_list.dmi'
	SH.dir = dir

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
