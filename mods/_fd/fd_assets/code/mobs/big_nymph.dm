/mob/living/carbon/alien/diona/mr_meat
	health = 99999
	maxHealth = 99999

	ai_holder = null
	possession_candidate = FALSE

	languages = list(
		LANGUAGE_ROOTGLOBAL,
		LANGUAGE_ROOTLOCAL,
		LANGUAGE_HUMAN_ARABIC,
		LANGUAGE_HUMAN_CHINESE,
		LANGUAGE_HUMAN_IBERIAN,
		LANGUAGE_HUMAN_INDIAN,
		LANGUAGE_HUMAN_RUSSIAN,
		LANGUAGE_HUMAN_SELENIAN,
		LANGUAGE_SKRELLIAN,
		LANGUAGE_SPACER,
		LANGUAGE_GUTTER,
		LANGUAGE_UNATHI_SINTA)
	language = LANGUAGE_HUMAN_EURO
	species_language = LANGUAGE_HUMAN_EURO

/mob/living/carbon/alien/diona/mr_meat/Initialize(mapload, flower_chance)
	. = ..(mapload, 0)

	SetTransform(6)

/obj/landmark/mr_meat
	name = "mr meat spawn"
	icon_state = "x"

/obj/landmark/mr_meat/Initialize()
	..()
	return INITIALIZE_HINT_LATELOAD

/obj/landmark/mr_meat/LateInitialize(mapload, ...)
	. = ..()
	var/mob/living/carbon/alien/diona/mr_meat/mob = new(loc)
	mob.ckey = "1"
	qdel(src)
