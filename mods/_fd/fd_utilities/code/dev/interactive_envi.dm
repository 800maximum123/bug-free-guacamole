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
		if(connected_mob.client)
			connected_mob.client.screen -= src
	animate(src, transform = matrix(0, 0, MATRIX_TRANSLATE), alpha = 0, time = 3, easing = SINE_EASING|EASE_OUT, flags = ANIMATION_PARALLEL)

	if(connected_mob.currently_interacting)

		if(istype(connected_mob.currently_interacting, /obj/structure/fd/interactive/note))
			var/obj/structure/fd/interactive/note/N = connected_mob.currently_interacting

			for(var/datum/interactive_note/I in N.attached_text)
				I.hide_note_from_player(connected_mob)

		if(istype(connected_mob.currently_interacting, /obj/structure/fd/interactive/basic_power/cool_gen))
			var/obj/structure/fd/interactive/basic_power/cool_gen/C = connected_mob.currently_interacting
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

	if(istype(M.currently_interacting, /obj/structure/fd/interactive/note))
		var/obj/structure/fd/interactive/note/N = M.currently_interacting

		for(var/datum/interactive_note/I in N.attached_text)
			I.hide_note_from_player(M)

	if(istype(M.currently_interacting, /obj/structure/fd/interactive/basic_power/cool_gen))
		var/obj/structure/fd/interactive/basic_power/cool_gen/C = M.currently_interacting
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
		if(!ci)
			ci = new /obj/screen/cancel_interaction()
			ci.connected_mob = M
			M.cancel_button = ci

		M.client.screen += ci
		animate(ci, transform = matrix(-128, 0, MATRIX_TRANSLATE), alpha = 255, time = 3, easing = SINE_EASING|EASE_IN)
		choosen_atom.interact_with(M)

	return TRUE

/obj/screen/hidden_item
	name = "ЧТО-ТО СТРАННОЕ"
	desc = "Нажми..."
	icon = 'mods/_fd/fd_utilities/icons/newsource.dmi'
	icon_state = "sequence"
	alpha = 1

	plane = HUD_PLANE
	layer = 5.4

	var/atom/connected_object
	var/obj/screen/player_message/screentext
	var/item_revealed = FALSE
	screen_loc = "CENTER-7,CENTER-7"

/obj/screen/hidden_item/Initialize()
	. = ..()
	SetTransform(3)

/obj/screen/hidden_item/MouseEntered(location, control, params)
	. = ..()

	if(!item_revealed)
		item_revealed = TRUE
		usr.playsound_local(null, pick('sound/effects/clue1.ogg','sound/effects/clue2.ogg'), 60)
		animate(src, alpha = 255, time = 1 SECONDS, SINE_EASING|EASE_OUT)

/obj/screen/hidden_item/Click()
	connected_object.reveal_item_inside(usr, screentext)

	for(var/obj/screen/H in usr.client.screen)
		if(istype(H, /obj/screen/hidden_item))
			usr.client.screen -= H
			qdel(H)


/atom/
	var/interactive = FALSE
	var/desc_special_show = FALSE
	var/desc_special = {"ВИЗУАЛЬНЫЙ ТЕКСТ"}

	var/obj/item/hidden_loot
	var/has_something_inside = FALSE
	var/obj/screen/hidden_item/hidden_ui

	var/remain_interactive_after_finding = FALSE
	var/desc_special_after_finding = {"ВИЗУАЛЬНЫЙ ТЕКСТ"}

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

	if(has_something_inside)
		hidden_ui = new /obj/screen/hidden_item()

		var/ui_position = rand(1,4)
		switch(ui_position)
			if(1)
				hidden_ui.screen_loc = "CENTER-3,CENTER+1"
			if(2)
				hidden_ui.screen_loc = "CENTER,CENTER-2"
			if(3)
				hidden_ui.screen_loc = "CENTER+2,CENTER+2"
			if(4)
				hidden_ui.screen_loc = "CENTER-2,CENTER"

		user.client.screen += hidden_ui
		hidden_ui.screentext = maintext
		hidden_ui.connected_object = src

/atom/proc/reveal_item_inside(mob/living/user, obj/screen/player_message/textonscreen)
	if(user.reading && user.currently_interacting == src)
		if(textonscreen)
			var/newreveal = {"Тщательно осмотрев [name], ты находишь <span style="color: green;">[hidden_loot.name]</span>!"}
			textonscreen.set_text(newreveal, COLOR_WHITE)

		hidden_loot = new hidden_loot(get_turf(src))

		has_something_inside = FALSE
		if(ishuman(user))
			var/mob/living/carbon/human/H = user
			H.put_in_hands(hidden_loot)

		if(!remain_interactive_after_finding)
			interactive = FALSE
			hide_hint(src)

		else
			desc_special = desc_special_after_finding

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

/obj/structure/fd/interactive
	interactive = TRUE
