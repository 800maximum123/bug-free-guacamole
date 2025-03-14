/mob/living/simple_animal
	hud_type = /datum/hud/animal

	var/list/hud_list[12]

/datum/hud/animal/FinalizeInstantiation(ui_style='icons/mob/screen/white.dmi', ui_color = "#ffffff", ui_alpha = 255)
	mymob.client.screen = list()
	action_intent = new /obj/screen/intent()
	mymob.client.screen |= action_intent
