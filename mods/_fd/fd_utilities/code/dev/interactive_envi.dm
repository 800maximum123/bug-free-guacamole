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

/image/hint
/mob/living
	var/reading = FALSE
	var/atom/currently_interacting
	var/list/revealed_hints = list()
	var/clean_client_clutter = FALSE

/mob/living/proc/show_hint(atom/A)
	if(!client || (A in revealed_hints))
		return

	var/image/hint/new_hint = new /image/hint('mods/_fd/fd_utilities/icons/actions.dmi', A, "loopa", layer = HUD_PLANE)

	new_hint.alpha = 0
	new_hint.pixel_x = pixel_x - 10
	new_hint.pixel_y = pixel_y - 10
	new_hint.plane = HUD_PLANE

	animate(new_hint, alpha = 255, pixel_x = src.pixel_x, pixel_y = src.pixel_y, time = 0.3 SECONDS, easing = SINE_EASING|EASE_OUT)

	client.images += new_hint
	revealed_hints[A] = new_hint

/mob/living/proc/hide_hint(atom/A)
	if(!client || !(A in revealed_hints))
		return

	var/image/hint/the_hint = revealed_hints[A]

	animate(the_hint, alpha = 0, pixel_x = src.pixel_x, pixel_y = src.pixel_y - 10, time = 0.3 SECONDS, easing = SINE_EASING|EASE_IN)

	spawn(0.3 SECONDS)
		if(client)
			client.images -= the_hint
		revealed_hints -= A

/mob/living/Life()

	if(!client && !clean_client_clutter && currently_interacting)
		clean_client_clutter = TRUE
		anchored = FALSE

	if(client && clean_client_clutter)
		if(istype(currently_interacting, /obj/structure/fd/interactive/note))
			var/obj/structure/fd/interactive/note/N = currently_interacting

			for(var/datum/interactive_note/I in N.attached_text)
				I.hide_note_from_player(src)

		if(istype(currently_interacting, /obj/structure/fd/interactive/basic_power/cool_gen))
			var/obj/structure/fd/interactive/basic_power/cool_gen/C = currently_interacting

			C.hide_ui(src)

		else
			currently_interacting.hide_description(src)

	if(ishuman(src) && client)
		if(!hiding_spot)
			for(var/atom/A as anything in revealed_hints)
				if(get_dist(src, A) > 1)
					hide_hint(A)

			for(var/atom/A in view(src))
				if(!A.interactive)
					continue
				if(get_dist(src, A) <= 1 && !(A in revealed_hints))
					show_hint(A)
		else
			for(var/atom/A as anything in revealed_hints)
				hide_hint(A)

	. = ..()

/datum/keybinding/living/fd/hide_interaction
	category = CATEGORY_FD
	hotkey_keys = list("Escape")
	name = "hide_interaction"
	full_name = "General: HIDE INTERACTION"
	description = ""

/datum/keybinding/living/fd/hide_interaction/can_use(client/user)
	. = ..()
	var/mob/living/M = user.mob

	if(!M.currently_interacting && !M.opened_note)
		return FALSE

/datum/keybinding/living/fd/hide_interaction/down(client/user)
	var/mob/living/M = user.mob

	if(istype(M.currently_interacting, /obj/structure/fd/interactive/note))
		var/obj/structure/fd/interactive/note/N = M.currently_interacting

		for(var/datum/interactive_note/I in N.attached_text)
			I.hide_note_from_player(M)

	if(M.opened_note)
		M.opened_note.hide_note_from_player(M)

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

	M.generate_binds()

	var/turf/T = get_turf(get_step(M, M.dir))
	for(var/atom/I in T)
		if(!I.interactive)
			continue

		var/list/people_interacting_with_it = list()
		for(var/mob/living/L in range(1,I))
			if(L.currently_interacting == I)
				people_interacting_with_it += L

		if(length(people_interacting_with_it))
			continue

		choosen_atom = I

	if(!choosen_atom)
		T = get_turf(M)
		for(var/atom/A in T)
			if(!A.interactive)
				continue

			var/list/people_interacting_with_it = list()
			for(var/mob/living/L in range(1,A))
				if(L.currently_interacting == A)
					people_interacting_with_it += L

			if(length(people_interacting_with_it))
				continue

			choosen_atom = A

	if(choosen_atom)
		choosen_atom.interact_with(M)

	return TRUE

/obj/screen/player_message/special_description/hidden

/obj/screen/hidden_item
	name = "ЧТО-ТО СТРАННОЕ"
	desc = "Нажми..."
	icon = 'mods/_fd/fd_utilities/icons/newsource.dmi'
	icon_state = "sequence"
	alpha = 1

	plane = HUD_PLANE
	layer = 5.4

	var/atom/connected_object
	var/obj/screen/player_message/special_description/hidden/screentext
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

/obj/screen/player_message/special_description

/atom/
	var/interactive = FALSE
	var/desc_special_show = FALSE
	var/desc_special = {"ВИЗУАЛЬНЫЙ ТЕКСТ"}

	var/obj/item/hidden_loot
	var/has_something_inside = FALSE
	var/obj/screen/hidden_item/hidden_ui
	var/obj/screen/cancel_interaction/ci

	var/remain_interactive_after_finding = FALSE
	var/desc_special_after_finding = {"ВИЗУАЛЬНЫЙ ТЕКСТ"}

/atom/proc/interact_with(mob/living/user)
	if(desc_special_show && !user.reading)
		reveal_description(user)

/atom/proc/reveal_description(mob/living/user)
	user.reading = TRUE
	user.currently_interacting = src
	user.anchored = TRUE

	if(!ci)
		ci = new /obj/screen/cancel_interaction()

	ci.connected_mob = user
	user.client.screen += ci
	animate(ci, transform = matrix(-128, 0, MATRIX_TRANSLATE), alpha = 255, time = 3, easing = SINE_EASING|EASE_IN)

	user.overlay_fullscreen("smallshade", /obj/screen/fullscreen/shade)
	var/message = "[desc_special]"

	var/obj/screen/player_message/special_description/maintext = new /obj/screen/player_message/special_description()
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

/atom/proc/reveal_item_inside(mob/living/user, obj/screen/player_message/special_description/hidden/textonscreen)
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
			user.hide_hint(src)

		else
			desc_special = desc_special_after_finding

/atom/proc/hide_description(mob/living/user)
	user.reading = FALSE
	user.currently_interacting = null
	user.anchored = FALSE

	spawn(4)
		ci.connected_mob = null
		user.client.screen -= ci
	animate(ci, transform = matrix(0, 0, MATRIX_TRANSLATE), alpha = 0, time = 3, easing = SINE_EASING|EASE_OUT, flags = ANIMATION_PARALLEL)

	user.clear_fullscreen("smallshade")
	for(var/obj/screen/messages in user.client.screen)
		if(istype(messages, /obj/screen/hidden_item))
			user.client.screen -= messages
			qdel(messages)
		if(istype(messages, /obj/screen/player_message/special_description))
			user.client.screen -= messages
			qdel(messages)

/obj/structure/fd/interactive
	interactive = TRUE
