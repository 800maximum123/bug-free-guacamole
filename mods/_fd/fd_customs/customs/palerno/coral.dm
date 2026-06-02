/datum/client_color/coral
	client_color = list(
		1.0, 0.35, 0.35,
		0, 0.12, 0,
		0, 0, 0.12)
	order = 300
	ignore_blood = TRUE

/datum/reagent/drugs/coral
	name = "Coral"
	description = "Coral appears naturally as a red, wispy mass, comprised of larges masses of microorganisms.\
	It is able to grow and reproduce over time under good conditions, and in ideal conditions, specifically a vacuum, it can propagate exponentially. \
	Human`s on TRK-17 interest in Coral was piqued by two key material properties: it produces an immense amount of energy when burned, and it also conducts digital data more effectively than any other known natural or artificial substance."
	taste_description = "pop and a sizzle"
	reagent_state = LIQUID
	color = "#ff0000"
	metabolism = REM
	overdose = 15
	should_admin_log = TRUE
	high_message_list = list(
		"Hello? You hear me?",
		"You are dissolving. Your hands are wax...",
		"It all runs together. It all mixes.",
		"It is done. It is over. You are done. You are over.",
		"You won't forget. Don't forget. Don't forget.",
		"Light seeps across the edges of your vision...",
		"Something slides and twitches within your sinus cavity...",
		"Your bowels roil. It waits within.",
		"Your gut churns. You are heavy with potential.",
		"Your heart flutters. It is winged and caged in your chest.",
		"There is a precious thing, behind your eyes.",
		"Everything is ending. Everything is beginning.",
		"Nothing ends. Nothing begins.",
		"I don't like all this! Burn!",
		"Stop it! You're hurting them!",
		"It's too soon for this. Please go back.",
		"We miss you. Where are you?",
		"Come back from there. Please."
	)
	var/static/list/overdose_messages = list(
		"NOTHING CAN STOP YOU",
		"JUST STOP HIM",
		"YOU NEED US, WE NEED YOU",
		"THAT IS NOT FOR YOU",
		"IT RUNS IT RUNS IT RUNS IT RUNS",
		"THE DARK BLOOD ON YOUR ARM",
		"THE LIGHT THE DARK A STAR IN CHAINS"
	)
	var/original_eye_color

/datum/reagent/drugs/coral/affect_blood(mob/living/carbon/M, removed)
	M.add_client_color(/datum/client_color/coral)
	M.add_chemical_effect(CE_MIND, -1)
	M.hallucination(50, 50)
	M.make_jittery(3)
	M.make_dizzy(3)
	M.adjustBrainLoss(0.2 * removed)
	if(ishuman(M))
		var/mob/living/carbon/human/coral_user = M
		if(!(locate(/obj/item/organ/internal/augment/ibis) in coral_user.internal_organs) && prob(5))
			coral_user.vomit(1, 1)
	if(prob(0.1) && ishuman(M))
		var/mob/living/carbon/human/H = M
		H.seizure()
		H.adjustBrainLoss(rand(2, 4))
	if(prob(5))
		M.emote(pick("twitch", "giggle"))
	..()

/datum/reagent/drugs/coral/on_leaving_metabolism(mob/parent, metabolism_class)
	parent.remove_client_color(/datum/client_color/coral)
	if(ishuman(parent) && !isnull(original_eye_color))
		var/mob/living/carbon/human/H = parent
		H.change_eye_color(arglist(GetHexColors(original_eye_color)))

/datum/reagent/drugs/coral/overdose(mob/living/carbon/M)
	..()
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(isnull(original_eye_color))
			original_eye_color = H.eye_color
		H.change_eye_color(255, 0, 0)
	// НА БУДУЩЕЕ
	// CДЕЛАТЬ ПОЯВЛЕНИЕ ВООБРАЖАЕМОГО ДРУГА


/obj/item/reagent_containers/syringe/coral
	name = "Syringe (???)"
	desc = "Contains something red, it shimmers with sparks"

/obj/item/reagent_containers/syringe/coral/New()
	..()
	reagents.add_reagent(/datum/reagent/drugs/coral, 15)
	mode = SYRINGE_INJECT
	update_icon()
