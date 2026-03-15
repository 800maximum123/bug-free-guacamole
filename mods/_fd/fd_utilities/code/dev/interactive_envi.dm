/mob/
	var/reading = FALSE
	var/atom/currently_interacting

/datum/keybinding/mob/hide_interaction
	category = CATEGORY_FD
	hotkey_keys = list("Escape")
	name = "hide_interaction"
	full_name = "General: HIDE INTERACTION"
	description = ""

/datum/keybinding/mob/hide_interaction/down(client/user)
	var/mob/M = user.mob

	if(istype(M.currently_interacting, /obj/sturcture/fd/interactive/note))
		var/obj/sturcture/fd/interactive/note/N = M.currently_interacting

		for(var/datum/interactive_note/I in N.attached_text)
			I.hide_note_from_player(M)

	else
		M.currently_interacting.hide_description(M)
	return TRUE

/datum/keybinding/mob/start_interaction
	category = CATEGORY_FD
	hotkey_keys = list("E")
	name = "start_interaction"
	full_name = "General: START INTERACTION"
	description = ""

/datum/keybinding/mob/start_interaction/down(client/user)
	var/mob/M = user.mob

	var/turf/T = get_turf(get_step(M, M.dir))
	for(var/atom/I in T)
		if(!I.interactive)
			continue
		I.interact_with(M)

	return TRUE

/atom/
	var/interactive = FALSE
	var/desc_special_show = FALSE
	var/desc_special = {"ВИЗУАЛЬНЫЙ ТЕКСТ"}

/atom/proc/interact_with(mob/user)
	if(desc_special_show && !user.reading)
		reveal_description(user)

/atom/proc/reveal_description(mob/user)
	user.reading = TRUE
	user.currently_interacting = src

	user.overlay_fullscreen("smallshade", /obj/screen/fullscreen/shade)
	var/message = "[desc_special]"

	var/obj/screen/player_message/maintext = new /obj/screen/player_message()
	maintext.layer = 5.4
	maintext.maptext_x = 0
	maintext.maptext_y = -390

	user.client.screen += maintext
	maintext.set_text(message, COLOR_WHITE)

/atom/proc/hide_description(mob/user)
	user.reading = FALSE
	user.currently_interacting = null

	user.clear_fullscreen("smallshade")
	for(var/obj/screen/messages in user.client.screen)
		if(istype(messages, /obj/screen/player_message))
			user.client.screen -= messages
			qdel(messages)

/obj/sturcture/fd/interactive
	interactive = TRUE
