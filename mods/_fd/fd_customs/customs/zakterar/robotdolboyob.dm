/datum/robolimb/robotdolboyob
	company = "Pure Improvisation"
	icon = 'zakterar_robot.dmi'
	has_eyes = FALSE
	unavailable_at_fab = TRUE
	unavailable_at_chargen = TRUE
	allowed_bodytypes = list(SPECIES_PERCI)

/mob/living/carbon/human/proc/makemerobotdolboyob(force = FALSE)
	for(var/obj/item/organ/external/E in contents)
		E.robotize("Pure Improvisation", FALSE, FALSE, TRUE)
	if(!force)
		return

	for(var/obj/item/organ/internal/int in contents)
		int.robotize()

/datum/species/machine/perci
	name = SPECIES_PERCI
	appearance_flags = SPECIES_APPEARANCE_HAS_EYE_COLOR
	species_flags = SPECIES_FLAG_NO_SCAN | SPECIES_FLAG_NO_PAIN | SPECIES_FLAG_NO_POISON | SPECIES_IS_WHITELISTED

	genders = list(MALE)

	available_cultural_info = list(
		TAG_CULTURE = list(
			CULTURE_POSITRONICS_GEN3
		),
		TAG_HOMEWORLD = list(
			HOME_SYSTEM_MARS,
			HOME_SYSTEM_EARTH,
			HOME_SYSTEM_OTHER
		),
		TAG_FACTION = list(
			FACTION_SOL_CENTRAL,
			FACTION_FREETRADE,
			FACTION_OTHER
		)
	)

	default_cultural_info = list(
		TAG_CULTURE = CULTURE_POSITRONICS_GEN3,
		TAG_HOMEWORLD = HOME_SYSTEM_MARS,
		TAG_FACTION = FACTION_SOL_CENTRAL
	)

	inherent_verbs = list()

/datum/species/machine/perci/post_organ_rejuvenate(obj/item/organ/org, mob/living/carbon/human/H)
	var/obj/item/organ/external/E = org
	if(istype(E) && !BP_IS_ROBOTIC(E))
		E.robotize("Pure Improvisation")
