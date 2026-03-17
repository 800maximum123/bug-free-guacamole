/mob/living
	var/reading = FALSE
	var/atom/currently_interacting

/mob/living/Life()
	for(var/atom/A in range(2,src))
		if(A.interactive && !A.revealed)
			A.show_hint(src)

	for(var/atom/A in view(src))
		if(get_dist(src,A) > 2 && A.revealed)
			A.hide_hint(src)

	. = ..()

/datum/keybinding/living/fd/hide_interaction
	category = CATEGORY_FD
	hotkey_keys = list("Escape")
	name = "hide_interaction"
	full_name = "General: HIDE INTERACTION"
	description = ""

/datum/keybinding/living/fd/hide_interaction/down(client/user)
	var/mob/living/M = user.mob

	if(istype(M.currently_interacting, /obj/sturcture/fd/interactive/note))
		var/obj/sturcture/fd/interactive/note/N = M.currently_interacting

		for(var/datum/interactive_note/I in N.attached_text)
			I.hide_note_from_player(M)

	if(istype(M.currently_interacting, /obj/sturcture/fd/interactive/basic_power/cool_gen))
		var/obj/sturcture/fd/interactive/basic_power/cool_gen/C = M.currently_interacting
		C.hide_ui(M)

	else
		M.currently_interacting.hide_description(M)
	return TRUE

/datum/keybinding/living/fd/start_interaction
	category = CATEGORY_FD
	hotkey_keys = list("E")
	name = "start_interaction"
	full_name = "General: START INTERACTION"
	description = ""

/datum/keybinding/living/fd/start_interaction/can_use(client/user)
	. = ..()

	var/mob/living/L = user.mob
	if(L.stat != CONSCIOUS)
		return FALSE

	if(L.resting)
		return FALSE

/datum/keybinding/living/fd/start_interaction/down(client/user)
	var/mob/M = user.mob
	var/atom/choosen_atom

	var/turf/T = get_turf(get_step(M, M.dir))
	for(var/atom/I in T)
		if(!I.interactive)
			continue

		choosen_atom = I

	if(!choosen_atom)
		T = get_turf(M)
		for(var/atom/A in T)
			if(!A.interactive)
				continue

			choosen_atom = A

	choosen_atom.interact_with(M)
	return TRUE

/atom/
	var/interactive = FALSE
	var/desc_special_show = FALSE
	var/desc_special = {"ВИЗУАЛЬНЫЙ ТЕКСТ"}

	var/image/hint
	var/revealed = FALSE

/atom/proc/interact_with(mob/living/user)
	if(desc_special_show && !user.reading)
		reveal_description(user)

/atom/proc/reveal_description(mob/living/user)
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

/atom/proc/hide_description(mob/living/user)
	user.reading = FALSE
	user.currently_interacting = null

	user.clear_fullscreen("smallshade")
	for(var/obj/screen/messages in user.client.screen)
		if(istype(messages, /obj/screen/player_message))
			user.client.screen -= messages
			qdel(messages)

/atom/proc/generate_hint()
	var/icon/T = new('mods/_fd/fd_utilities/icons/actions.dmi')
	return image(T, "loopa", layer = HUD_PLANE)

/atom/proc/show_hint(mob/living/user)
	hint = generate_hint()
	revealed = TRUE

	hint.loc = get_turf(src)
	user.client.images += hint

/atom/proc/hide_hint(mob/living/user)
	if(user.client)
		user.client.images -= hint
		revealed = FALSE

/obj/sturcture/fd/interactive
	interactive = TRUE
