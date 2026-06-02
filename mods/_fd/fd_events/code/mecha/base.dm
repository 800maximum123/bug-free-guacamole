/datum/keybinding/living/fd/mech
	category = CATEGORY_FD_MECH

/datum/keybinding/living/fd/mech/can_use(client/user)
	. = ..()

	var/mob/living/L = user.mob
	if(!istype(L,/mob/living/simple_animal/simple_mecha))
		return FALSE

/datum/keybinding/living/fd/mech/primary_show
	hotkey_keys = list("I")
	name = "primary_show"
	full_name = "MECH: Open Inventory"
	description = ""

/datum/keybinding/living/fd/mech/primary_show/down(client/user)
	var/mob/living/simple_animal/simple_mecha/L = user.mob

	if(!L.primary)
		L.primary = new /obj/screen/primary_weapon_slot()
		L.primary.host = L

	if(!L.aux1)
		L.aux1 = new /obj/screen/aux_slot_1()
		L.aux1.host = L

	if(!L.aux2)
		L.aux2 = new /obj/screen/aux_slot_2()
		L.aux2.host = L

	if(L.primary && !L.primary.mouse_opacity)
		L.primary.update_status()

		L.client.screen += L.primary
		L.client.screen += L.aux1
		L.client.screen += L.aux2
		L.primary.mouse_opacity = TRUE
		animate(L.client, pixel_y = 32, time = 3, easing = SINE_EASING|EASE_IN, flags = ANIMATION_PARALLEL)

		animate(L.primary, transform = matrix(0, 32, MATRIX_TRANSLATE), alpha = 255, time = 3, easing = SINE_EASING|EASE_IN)
		animate(L.aux1, transform = matrix(0, 28, MATRIX_TRANSLATE), time = 3, easing = SINE_EASING|EASE_IN)
		animate(L.aux2, transform = matrix(0, 28, MATRIX_TRANSLATE), time = 3, easing = SINE_EASING|EASE_IN)

		return TRUE

	if(L.primary && L.primary.mouse_opacity)
		L.primary.mouse_opacity = FALSE
		animate(L.client, pixel_y = 0, time = 3, easing = SINE_EASING|EASE_IN, flags = ANIMATION_PARALLEL)

		animate(L.primary, transform = matrix(0, 0, MATRIX_TRANSLATE), alpha = 0, time = 3, easing = SINE_EASING|EASE_IN)
		animate(L.aux1, transform = matrix(0, 0, MATRIX_TRANSLATE), alpha = 0, time = 3, easing = SINE_EASING|EASE_IN)
		animate(L.aux2, transform = matrix(0, 0, MATRIX_TRANSLATE), alpha = 0, time = 3, easing = SINE_EASING|EASE_IN)

		L.client.screen -= L.primary
		L.client.screen -= L.aux1
		L.client.screen -= L.aux2

		return TRUE

/obj/screen/primary_weapon_slot
	name = "slot"
	desc = "weapon slot"
	icon = 'mods/_fd/fd_events/icons/backgrounds.dmi'
	icon_state = "bg_tech"
	alpha = 0

	plane = HUD_PLANE
	layer = 5.4

	mouse_opacity = FALSE

	var/mob/living/simple_animal/simple_mecha/host
	var/image/item_overlay
	screen_loc = "CENTER,CENTER"

/obj/screen/primary_weapon_slot/proc/update_status()
	if(!host.actual_weapon_slot)
		CutOverlays(item_overlay)
		return TRUE

	if(host.actual_weapon_slot)
		CutOverlays(item_overlay)

		item_overlay = image(host.actual_weapon_slot.icon, host.actual_weapon_slot.icon_state)
		AddOverlays(item_overlay)
		return TRUE

///obj/screen/primary_weapon_slot/MouseDrop_T(atom/dropped, mob/living/user)

/obj/screen/primary_weapon_slot/Click(location, control, params)
	. = ..()
	var/list/modifiers = params2list(params)
	if(modifiers["middle"])
		if(!host.aux1.mouse_opacity || !host.aux2.mouse_opacity)
			host.aux1.mouse_opacity = TRUE
			host.aux2.mouse_opacity = TRUE

			animate(host.aux1, transform = matrix(-32, 28, MATRIX_TRANSLATE), alpha = 255, time = 3, easing = SINE_EASING|EASE_IN)
			animate(host.aux2, transform = matrix(32, 28, MATRIX_TRANSLATE), alpha = 255, time = 3, easing = SINE_EASING|EASE_IN)

			return TRUE

		else
			host.aux1.mouse_opacity = FALSE
			host.aux2.mouse_opacity = FALSE

			animate(host.aux1, transform = matrix(28, 0, MATRIX_TRANSLATE), alpha = 0, time = 3, easing = SINE_EASING|EASE_IN)
			animate(host.aux2, transform = matrix(28, 0, MATRIX_TRANSLATE), alpha = 0, time = 3, easing = SINE_EASING|EASE_IN)

			return TRUE

	else
		if(host.actual_weapon_slot)
			host.actual_weapon_slot.forceMove(get_turf(get_step(host, host.dir)))
			host.actual_weapon_slot = null

			update_status()
			return TRUE

/obj/screen/aux_slot_1
	name = "slot"
	desc = "weapon slot"
	icon = 'mods/_fd/fd_events/icons/backgrounds.dmi'
	icon_state = "bg_tech"
	alpha = 0

	plane = HUD_PLANE
	layer = 5.4

	mouse_opacity = FALSE

	var/mob/living/simple_animal/simple_mecha/host
	var/image/item_overlay
	screen_loc = "CENTER,CENTER"

/obj/screen/aux_slot_1/proc/update_status()
	if(!host.actual_aux1)
		CutOverlays(item_overlay)
		return TRUE

	if(host.actual_aux1)
		CutOverlays(item_overlay)

		item_overlay = image(host.actual_aux1.icon, host.actual_aux1.icon_state)
		AddOverlays(item_overlay)
		return TRUE

/obj/screen/aux_slot_1/Click(location, control, params)
	. = ..()

	if(host.aux1)
		host.aux1.forceMove(get_turf(get_step(host, host.dir)))
		host.aux1 = null

		update_status()
		return TRUE

/obj/screen/aux_slot_2
	name = "slot"
	desc = "weapon slot"
	icon = 'mods/_fd/fd_events/icons/backgrounds.dmi'
	icon_state = "bg_tech"
	alpha = 0

	plane = HUD_PLANE
	layer = 5.4

	mouse_opacity = FALSE

	var/mob/living/simple_animal/simple_mecha/host
	var/image/item_overlay
	screen_loc = "CENTER,CENTER"

/obj/screen/aux_slot_2/proc/update_status()
	if(!host.actual_aux2)
		CutOverlays(item_overlay)
		return TRUE

	if(host.actual_aux2)
		CutOverlays(item_overlay)

		item_overlay = image(host.actual_aux2.icon, host.actual_aux2.icon_state)
		AddOverlays(item_overlay)
		return TRUE

/obj/screen/aux_slot_2/Click(location, control, params)
	. = ..()

	if(host.aux2)
		host.aux2.forceMove(get_turf(get_step(host, host.dir)))
		host.aux2 = null

		update_status()
		return TRUE

/mob/living/simple_animal/simple_mecha
	icon = 'mods/_fd/fd_events/icons/mech.dmi'
	icon_state = "mechbase"

	name = "mech"
	desc = "SCAAARY-"

	var/obj/screen/primary_weapon_slot/primary // слот, который мы используем для стрельбы и других интеракций
	var/obj/screen/aux_slot_1/aux1 // слот, в котором находится что-то ещё
	var/obj/screen/aux_slot_2/aux2 // слот, в котором находится что-то ещё

	var/obj/item/actual_weapon_slot
	var/obj/item/actual_aux1
	var/obj/item/actual_aux2

/mob/living/simple_animal/simple_mecha/IsAdvancedToolUser()
	return 1

/mob/living/simple_animal/simple_mecha/ClickOn(atom/A, params)
	if(actual_weapon_slot)
		mech_click(A, params)

	. = ..()

/mob/living/simple_animal/simple_mecha/proc/mech_click(atom/A, params)

	if(istype(actual_weapon_slot,/obj/item/gun))
		var/obj/item/gun/G = actual_weapon_slot
		G.Fire(A, src)

	if(istype(actual_weapon_slot,/obj/item/melee))
		var/obj/item/melee/M = actual_weapon_slot
		next_move += M.attack_cooldown
		A.use_weapon(M, src)

/obj/item
	var/mecha_can_hold = FALSE
	var/mecha_sprite_change = "mech"

/obj/item/attack_hand(mob/user)

	if(mecha_can_hold && istype(user, /mob/living/simple_animal/simple_mecha))
		var/mob/living/simple_animal/simple_mecha/mech = user
		if(!mech.actual_weapon_slot)
			forceMove(mech)
			mech.actual_weapon_slot = src

			if(!mech.primary)
				mech.primary = new /obj/screen/primary_weapon_slot()
				mech.primary.host = mech

			mech.primary.update_status()
			return

		else
			if(!mech.actual_aux1)
				forceMove(mech)
				mech.actual_aux1 = src

				if(!mech.aux1)
					mech.aux1 = new /obj/screen/aux_slot_1()
					mech.aux1.host = mech

				mech.aux1.update_status()
				return
			if(!mech.actual_aux2)
				forceMove(mech)
				mech.actual_aux2 = src

				if(!mech.aux2)
					mech.aux2 = new /obj/screen/aux_slot_2()
					mech.aux2.host = mech

				mech.aux2.update_status()
				return

	. = ..()
