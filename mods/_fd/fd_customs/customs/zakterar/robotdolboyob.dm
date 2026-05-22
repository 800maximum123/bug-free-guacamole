/datum/robolimb/robotdolboyob
	company = "Pure Improvisation"
	icon = 'zakterar_robot.dmi'
	has_eyes = FALSE
	unavailable_at_fab = TRUE
	unavailable_at_chargen = TRUE
	can_feel_pain = TRUE // A LITTLE TROLLING

/mob/living/carbon/human/proc/makemerobotdolboyob(force = FALSE)
	for(var/obj/item/organ/external/E in contents)
		E.robotize("Pure Improvisation", FALSE, FALSE, TRUE)
	if(!force)
		return

	for(var/obj/item/organ/internal/int in contents)
		int.robotize()
