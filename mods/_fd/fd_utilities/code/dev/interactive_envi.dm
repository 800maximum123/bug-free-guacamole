/obj/screen/cancel_interaction
	name = "ПРЕРВАТЬ ПРОСМОТР"
	desc = "Отменяет..."
	icon = 'mods/_fd/fd_utilities/icons/actions.dmi'
	icon_state = "close_interaction"

	plane = HUD_PLANE
	layer = 5.4
	alpha = 0

	screen_loc = "CENTER,CENTER"
	var/mob/living/connected_mob

/obj/screen/cancel_interaction/Click()
	spawn(4)
		connected_mob.client.screen -= src
	animate(src, transform = matrix(0, 0, MATRIX_TRANSLATE), alpha = 0, time = 3, easing = SINE_EASING|EASE_OUT, flags = ANIMATION_PARALLEL)

	if(istype(connected_mob.currently_interacting, /obj/sturcture/fd/interactive/note))
		var/obj/sturcture/fd/interactive/note/N = connected_mob.currently_interacting

		for(var/datum/interactive_note/I in N.attached_text)
			I.hide_note_from_player(connected_mob)

	if(istype(connected_mob.currently_interacting, /obj/sturcture/fd/interactive/basic_power/cool_gen))
		var/obj/sturcture/fd/interactive/basic_power/cool_gen/C = connected_mob.currently_interacting
		C.hide_ui(connected_mob)

	else
		connected_mob.currently_interacting.hide_description(connected_mob)

	return TRUE

/mob/living
	var/reading = FALSE
	var/atom/currently_interacting
	var/obj/screen/cancel_interaction/cancel_button

/mob/living/Life()

	if(ishuman(src))
		if(client)
			for(var/atom/A in view(src))
				if(!A.interactive)
					continue

				if(!hiding_spot)
					if(get_dist(src,A) <= 1 && !A.revealed)
						A.show_hint(src)
					if(get_dist(src,A) > 1 && A.revealed)
						A.hide_hint(src)
				else
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

	spawn(4)
		M.client.screen -= M.cancel_button
	animate(M.cancel_button, transform = matrix(0, 0, MATRIX_TRANSLATE), alpha = 0, time = 3, easing = SINE_EASING|EASE_OUT, flags = ANIMATION_PARALLEL)

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
	var/obj/screen/cancel_interaction/ci

/datum/keybinding/living/fd/start_interaction/can_use(client/user)
	. = ..()

	var/mob/living/L = user.mob
	if(L.stat != CONSCIOUS)
		return FALSE

	if(L.resting)
		return FALSE

/datum/keybinding/living/fd/start_interaction/down(client/user)
	var/mob/living/M = user.mob
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

	if(choosen_atom)
		choosen_atom.interact_with(M)
		if(!ci)
			ci = new /obj/screen/cancel_interaction()
			ci.connected_mob = M
			M.cancel_button = ci
		M.client.screen += ci
		animate(ci, transform = matrix(-128, 0, MATRIX_TRANSLATE), alpha = 255, time = 3, easing = SINE_EASING|EASE_IN)

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

	hint.alpha = 0
	hint.pixel_x = pixel_x - 10
	hint.pixel_y = pixel_y - 10
	hint.plane = HUD_PLANE

	hint.loc = get_turf(src)
	animate(hint, alpha = 255, pixel_x = src.pixel_x, pixel_y = src.pixel_y, time = 0.3 SECONDS, easing = SINE_EASING|EASE_OUT)
	user.client.images += hint

/atom/proc/hide_hint(mob/living/user)
	if(user.client)
		animate(hint, alpha = 0, pixel_x = src.pixel_x, pixel_y = src.pixel_y - 10, time = 0.3 SECONDS, easing = SINE_EASING|EASE_IN)
		spawn(0.3 SECONDS)
			user.client.images -= hint
			revealed = FALSE

/obj/sturcture/fd/interactive
	interactive = TRUE
