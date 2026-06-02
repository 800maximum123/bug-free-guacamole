/datum/keybinding/living/fd/mech
	category = CATEGORY_FD_MECH

/datum/keybinding/living/fd/mech/can_use(client/user)
	. = ..()

	var/mob/living/L = user.mob
	if(!istype(L,/mob/living/simple_animal/simple_mecha))
		return FALSE

/datum/keybinding/living/fd/mech/primary_show
	hotkey_keys = list("E")
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
		L.aux1.mouse_opacity = FALSE
		L.aux2.mouse_opacity = FALSE
		animate(L.client, pixel_y = 0, time = 3, easing = SINE_EASING|EASE_IN, flags = ANIMATION_PARALLEL)

		animate(L.primary, transform = matrix(0, 0, MATRIX_TRANSLATE), alpha = 0, time = 3, easing = SINE_EASING|EASE_IN)
		animate(L.aux1, transform = matrix(0, 0, MATRIX_TRANSLATE), alpha = 0, time = 3, easing = SINE_EASING|EASE_IN)
		animate(L.aux2, transform = matrix(0, 0, MATRIX_TRANSLATE), alpha = 0, time = 3, easing = SINE_EASING|EASE_IN)

		L.client.screen -= L.primary
		L.client.screen -= L.aux1
		L.client.screen -= L.aux2

		return TRUE

/datum/keybinding/living/fd/mech/assault_boost
	hotkey_keys = list("Q")
	name = "assault_boost"
	full_name = "MECH: Assault Boost"
	description = ""

/datum/keybinding/living/fd/mech/assault_boost/can_use(client/user)
	. = ..()

	var/mob/living/simple_animal/simple_mecha/mecha = user.mob
	if(!mecha.engine)
		return FALSE

/datum/keybinding/living/fd/mech/assault_boost/down(client/user)
	var/mob/living/simple_animal/simple_mecha/L = user.mob
	L.change_engine_state()

/datum/keybinding/living/fd/mech/fixeye
	hotkey_keys = list("F")
	name = "fixeye"
	full_name = "MECH: Fix Direction"
	description = ""

/datum/keybinding/living/fd/mech/fixeye/down(client/user)
	user.mob.set_face_dir()

/obj/screen/primary_weapon_slot
	name = "slot"
	desc = "weapon slot"
	icon = 'mods/_fd/fd_events/icons/backgrounds.dmi'
	icon_state = "bg_tech"
	alpha = 0

	plane = HUD_PLANE
	layer = 5.4

	mouse_opacity = FALSE
	var/active = FALSE
	var/image/active_overlay

	var/mob/living/simple_animal/simple_mecha/host
	var/image/item_overlay
	screen_loc = "CENTER,CENTER"

/obj/screen/primary_weapon_slot/proc/update_status()
	if(!active)
		CutOverlays(active_overlay)

	if(!host.actual_weapon_slot)
		host.icon_state = initial(host.icon_state)
		CutOverlays(item_overlay)
		return TRUE

	if(host.actual_weapon_slot)
		host.icon_state = host.actual_weapon_slot.mecha_sprite_change

		CutOverlays(item_overlay)
		CutOverlays(active_overlay)

		item_overlay = image(host.actual_weapon_slot.icon, host.actual_weapon_slot.icon_state)
		AddOverlays(item_overlay)

		if(active)
			active_overlay = image(icon, icon_state = "active_tech")
			AddOverlays(active_overlay)
		return TRUE

/obj/screen/primary_weapon_slot/MouseDrop(atom/over_atom, atom/source_loc, atom/over_loc, source_control, over_control, list/mouse_params)
	if (!usr)
		return
	if (!over_atom)
		return
	if(!(istype(over_atom,/obj/screen/aux_slot_1) || istype(over_atom,/obj/screen/aux_slot_2)))
		return
	over_atom.MouseDrop_T(src, usr)

/obj/screen/primary_weapon_slot/MouseDrop_T(atom/dropped, mob/living/user)
	if(istype(dropped,/obj/screen/aux_slot_1))

		if(host.actual_weapon_slot)
			var/obj/item/item_in_primary = host.actual_weapon_slot
			var/obj/item/item_in_aux = host.actual_aux1

			host.actual_weapon_slot = item_in_aux
			host.actual_aux1 = item_in_primary

		else
			host.actual_weapon_slot = host.actual_aux1
			host.actual_aux1 = null

		if(host.aux1.active)
			host.aux1.active = FALSE

		update_status()
		host.aux1.update_status()
		return

	if(istype(dropped,/obj/screen/aux_slot_2))

		if(host.actual_weapon_slot)
			var/obj/item/item_in_primary = host.actual_weapon_slot
			var/obj/item/item_in_aux = host.actual_aux2

			host.actual_weapon_slot = item_in_aux
			host.actual_aux2 = item_in_primary

		else
			host.actual_weapon_slot = host.actual_aux2
			host.actual_aux2 = null

		if(host.aux2.active)
			host.aux1.active = FALSE

		update_status()
		host.aux2.update_status()
		return

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

	if(modifiers["alt"])
		if(!active)
			if(!host.actual_weapon_slot)
				animation_flash_color(src, COLOR_RED)
				return FALSE
			active = TRUE
			if(host.aux1.active)
				host.aux1.active = FALSE
				host.aux1.update_status()
			if(host.aux2.active)
				host.aux2.active = FALSE
				host.aux2.update_status()
			update_status()
			return TRUE
		if(active)
			active = FALSE
			update_status()
			return TRUE

	else
		if(host.actual_weapon_slot)
			host.actual_weapon_slot.forceMove(get_turf(get_step(host, host.dir)))
			host.actual_weapon_slot = null

			if(active)
				active = FALSE

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
	var/active = FALSE
	var/image/active_overlay

	var/mob/living/simple_animal/simple_mecha/host
	var/image/item_overlay
	screen_loc = "CENTER,CENTER"

/obj/screen/aux_slot_1/proc/update_status()
	if(!active)
		CutOverlays(active_overlay)

	if(!host.actual_aux1)
		CutOverlays(item_overlay)
		return TRUE

	if(host.actual_aux1)
		CutOverlays(item_overlay)
		CutOverlays(active_overlay)

		item_overlay = image(host.actual_aux1.icon, host.actual_aux1.icon_state)
		AddOverlays(item_overlay)

		if(active)
			active_overlay = image(icon, icon_state = "active_tech")
			AddOverlays(active_overlay)
		return TRUE

/obj/screen/aux_slot_1/MouseDrop_T(atom/dropped, mob/living/user)
	if(istype(dropped,/obj/screen/primary_weapon_slot))

		if(host.actual_aux1)
			var/obj/item/item_in_primary = host.actual_weapon_slot
			var/obj/item/item_in_aux = host.actual_aux1

			host.actual_aux1 = item_in_primary
			host.actual_weapon_slot = item_in_aux

		else
			host.actual_weapon_slot = null
			host.actual_aux1 = host.actual_weapon_slot

		if(host.primary.active)
			host.primary.active = FALSE

		update_status()
		host.primary.update_status()
		return

/obj/screen/aux_slot_1/MouseDrop(atom/over_atom, atom/source_loc, atom/over_loc, source_control, over_control, list/mouse_params)
	if (!usr)
		return
	if (!over_atom)
		return
	if(!istype(over_atom,/obj/screen/primary_weapon_slot))
		return
	over_atom.MouseDrop_T(src, usr)

/obj/screen/aux_slot_1/Click(location, control, params)
	. = ..()
	var/list/modifiers = params2list(params)
	if(modifiers["alt"])
		if(!active)
			if(!host.actual_aux1)
				animation_flash_color(src, COLOR_RED)
				return FALSE
			if(!host.actual_aux1.aux_usable)
				animation_flash_color(src, COLOR_RED)
				return FALSE

			active = TRUE
			if(host.aux2.active)
				host.aux2.active = FALSE
				host.aux2.update_status()
			if(host.primary.active)
				host.primary.active = FALSE
				host.primary.update_status()
			update_status()
			return TRUE
		if(active)
			active = FALSE
			update_status()
			return TRUE

	else
		if(host.actual_aux1)
			host.actual_aux1.forceMove(get_turf(get_step(host, host.dir)))
			host.actual_aux1 = null

			if(active)
				active = FALSE

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
	var/active = FALSE
	var/image/active_overlay

	var/mob/living/simple_animal/simple_mecha/host
	var/image/item_overlay
	screen_loc = "CENTER,CENTER"

/obj/screen/aux_slot_2/proc/update_status()
	if(!active)
		CutOverlays(active_overlay)

	if(!host.actual_aux2)
		CutOverlays(item_overlay)
		return TRUE

	if(host.actual_aux2)
		CutOverlays(item_overlay)
		CutOverlays(active_overlay)

		item_overlay = image(host.actual_aux2.icon, host.actual_aux2.icon_state)
		AddOverlays(item_overlay)

		if(active)
			active_overlay = image(icon, icon_state = "active_tech")
			AddOverlays(active_overlay)
		return TRUE

/obj/screen/aux_slot_2/MouseDrop_T(atom/dropped, mob/living/user)
	if(istype(dropped,/obj/screen/primary_weapon_slot))

		if(host.actual_aux2)
			var/obj/item/item_in_primary = host.actual_weapon_slot
			var/obj/item/item_in_aux = host.actual_aux2

			host.actual_aux2 = item_in_primary
			host.actual_weapon_slot = item_in_aux

		else
			host.actual_weapon_slot = null
			host.actual_aux2 = host.actual_weapon_slot

		if(host.primary.active)
			host.primary.active = FALSE

		update_status()
		host.primary.update_status()
		return

/obj/screen/aux_slot_2/MouseDrop(atom/over_atom, atom/source_loc, atom/over_loc, source_control, over_control, list/mouse_params)
	if (!usr)
		return
	if (!over_atom)
		return
	if(!istype(over_atom,/obj/screen/primary_weapon_slot))
		return
	over_atom.MouseDrop_T(src, usr)

/obj/screen/aux_slot_2/Click(location, control, params)
	. = ..()
	var/list/modifiers = params2list(params)
	if(modifiers["alt"])
		if(!active)
			if(!host.actual_aux2)
				animation_flash_color(src, COLOR_RED)
				return FALSE
			if(!host.actual_aux2.aux_usable)
				animation_flash_color(src, COLOR_RED)
				return FALSE

			active = TRUE
			if(host.aux1.active)
				host.aux1.active = FALSE
				host.aux1.update_status()
			if(host.primary.active)
				host.primary.active = FALSE
				host.primary.update_status()
			update_status()
			return TRUE
		if(active)
			active = FALSE
			update_status()
			return TRUE

	else
		if(host.actual_aux2)
			host.actual_aux2.forceMove(get_turf(get_step(host, host.dir)))
			host.actual_aux1 = null

			if(active)
				active = FALSE

			update_status()
			return TRUE

/obj/temp_visual/burning_effect
	name = "trail"
	icon_state = "spritemagic"
	icon = 'mods/_fd/fd_assets/icons/goons/chaplainRitual.dmi'

	color = COLOR_ORANGE

	anchored = TRUE
	duration = 1 SECONDS
	layer = ABOVE_OBJ_LAYER

/obj/item/fd/mech/engine
	name = "mech engine"
	icon = 'mods/_fd/fd_assets/icons/goons/crafting.dmi'
	icon_state = "plater1"

	var/power = 2
	var/can_quick_boost = FALSE

	var/engine_burning = FALSE
	var/burning_effect = /obj/temp_visual/burning_effect

/mob/living/simple_animal/simple_mecha
	icon = 'mods/_fd/fd_events/icons/mech.dmi'
	icon_state = "mechbase"

	name = "mech"
	desc = "SCAAARY-"

	health = 999999
	maxHealth = 999999

	simple_combat_on = TRUE
	max_simple_health = 1000
	simple_health = 1000

	simple_armor_natural = 5

	var/obj/screen/primary_weapon_slot/primary // слот, который мы используем для стрельбы и других интеракций
	var/obj/screen/aux_slot_1/aux1 // слот, в котором находится что-то ещё
	var/obj/screen/aux_slot_2/aux2 // слот, в котором находится что-то ещё

	var/obj/item/actual_weapon_slot
	var/obj/item/actual_aux1
	var/obj/item/actual_aux2

	var/obj/item/fd/mech/engine/engine

	robotic = TRUE

	movement_cooldown = 4
	see_in_dark = 8

	var/last_dir

/mob/living/simple_animal/simple_mecha/SelfMove(turf/n, direct, movetime)
	var/turf/old_turf = get_turf(src)
	if(engine && engine.engine_burning)
		new engine.burning_effect(get_turf(old_turf))

	. = ..()

/mob/living/simple_animal/simple_mecha/Life()
	pixel_x = -8

	. = ..()

/mob/living/simple_animal/simple_mecha/proc/change_engine_state()

	if(!engine.engine_burning)
		engine.engine_burning = TRUE
		movement_cooldown -= engine.power
		return TRUE

	if(engine.engine_burning)
		engine.engine_burning = FALSE
		movement_cooldown = initial(movement_cooldown)
		return TRUE

/mob/living/simple_animal/simple_mecha/IsAdvancedToolUser()
	return 1

/mob/living/simple_animal/simple_mecha/ClickOn(atom/A, params)
	if(actual_weapon_slot)
		mech_click(A, params)

	. = ..()

/mob/living/simple_animal/simple_mecha/proc/mech_click(atom/A, params)

	if(istype(A,/obj/item) && Adjacent(A))
		A.attack_hand(src)

	if(primary.active)
		if(istype(actual_weapon_slot,/obj/item/gun))
			var/obj/item/gun/G = actual_weapon_slot
			G.Fire(A, src)

		if(istype(actual_weapon_slot,/obj/item/melee) && Adjacent(A))
			var/obj/item/melee/M = actual_weapon_slot
			if(world.time <= next_move)
				return FALSE

			if(melee_assist)
				var/turf/target_turf = get_turf(get_step(src, Get_Compass_Dir(src, A)))
				var/mob/living/target = null
				for(var/mob/living/L in target_turf)
					target = L

				if(!isnull(target) && !isnull(actual_weapon_slot) && a_intent == I_HURT)
					next_move += M.attack_cooldown
					target.use_weapon(M, src)
			else
				next_move += M.attack_cooldown
				A.use_weapon(M, src)
		return TRUE

	if(aux1.active)
		if(istype(actual_aux1,/obj/item/gun))
			var/obj/item/gun/G = actual_aux1
			G.Fire(A, src)
		return TRUE

	if(aux2.active)
		if(istype(actual_aux2,/obj/item/gun))
			var/obj/item/gun/G = actual_aux2
			G.Fire(A, src)
		return TRUE

/mob/living/simple_animal/simple_mecha/use_tool(obj/item/tool, mob/user, list/click_params)
	if(istype(tool,/obj/item/fd/mech/engine))
		if(!engine && do_after(user, 10 SECONDS, src, DO_PUBLIC_UNIQUE))
			user.drop_from_inventory(tool)
			tool.forceMove(src)
			engine = tool

	if(tool.mecha_can_hold)
		if(!actual_weapon_slot && !(actual_aux1 == src || actual_aux2 == src))
			if(do_after(user, 10 SECONDS, src, DO_PUBLIC_UNIQUE))
				user.drop_from_inventory(tool)
				tool.forceMove(src)
				actual_weapon_slot = tool

				if(!primary)
					primary = new /obj/screen/primary_weapon_slot()
					primary.host = src

				primary.update_status()
				return TRUE

		if(!actual_aux1 && !(actual_weapon_slot == src || actual_aux2 == src))
			if(do_after(user, 10 SECONDS, src, DO_PUBLIC_UNIQUE))
				user.drop_from_inventory(tool)
				tool.forceMove(src)
				actual_aux1 = tool

				if(!aux1)
					aux1 = new /obj/screen/aux_slot_1()
					aux1.host = src

				aux1.update_status()
				return TRUE

		if(!actual_aux2 && !(actual_aux1 == src || actual_weapon_slot == src))
			if(do_after(user, 10 SECONDS, src, DO_PUBLIC_UNIQUE))
				user.drop_from_inventory(tool)
				tool.forceMove(src)
				actual_aux2 = tool

				if(!aux2)
					aux2 = new /obj/screen/aux_slot_2()
					aux2.host = src

				aux2.update_status()
				return TRUE

	. = ..()


/obj/item
	var/mecha_can_hold = FALSE
	var/mecha_sprite_change = "mechbase"
	var/aux_usable = FALSE

/obj/item/gun
	mecha_sprite_change = "mechgun"

/obj/item/attack_hand(mob/user)

	if(mecha_can_hold && istype(user, /mob/living/simple_animal/simple_mecha))
		var/mob/living/simple_animal/simple_mecha/mech = user
		if(!mech.actual_weapon_slot && !(mech.actual_aux1 == src || mech.actual_aux2 == src))
			forceMove(mech)
			mech.actual_weapon_slot = src

			if(!mech.primary)
				mech.primary = new /obj/screen/primary_weapon_slot()
				mech.primary.host = mech

			mech.primary.update_status()
			return TRUE

		if(!mech.actual_aux1 && !(mech.actual_weapon_slot == src || mech.actual_aux2 == src))
			forceMove(mech)
			mech.actual_aux1 = src

			if(!mech.aux1)
				mech.aux1 = new /obj/screen/aux_slot_1()
				mech.aux1.host = mech

			mech.aux1.update_status()
			return TRUE
		if(!mech.actual_aux2 && !(mech.actual_aux1 == src || mech.actual_weapon_slot == src))
			forceMove(mech)
			mech.actual_aux2 = src

			if(!mech.aux2)
				mech.aux2 = new /obj/screen/aux_slot_2()
				mech.aux2.host = mech

			mech.aux2.update_status()
			return TRUE

	. = ..()
