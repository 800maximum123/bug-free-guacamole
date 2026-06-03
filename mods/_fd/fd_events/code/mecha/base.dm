/datum/keybinding/living/fd/mech
	category = CATEGORY_FD_MECH

/datum/keybinding/living/fd/mech/can_use(client/user)
	. = ..()

	var/mob/living/L = user.mob
	if(!istype(L,/mob/living/simple_animal/simple_mecha))
		return FALSE

/datum/keybinding/living/fd/mech/boost_up
	hotkey_keys = list("North")
	name = "boost_up"
	full_name = "MECH: Quick Boost (UP)"
	description = ""

/datum/keybinding/living/fd/mech/boost_up/can_use(client/user)
	. = ..()

	var/mob/living/simple_animal/simple_mecha/mecha = user.mob
	if(!mecha.engine || !mecha.engine.engine_burning)
		return FALSE
	if(!mecha.engine.can_quick_boost)
		return FALSE

/datum/keybinding/living/fd/mech/boost_up/down(client/user)
	var/mob/living/simple_animal/simple_mecha/L = user.mob
	L.engine.fuel_current = clamp(L.engine.fuel_current - 5, 0, L.engine.fuel_max)
	L.throw_at(get_edge_target_turf(L, NORTH), 10, 2, L, 0)

/datum/keybinding/living/fd/mech/boost_down
	hotkey_keys = list("South")
	name = "boost_down"
	full_name = "MECH: Quick Boost (DOWN)"
	description = ""

/datum/keybinding/living/fd/mech/boost_down/can_use(client/user)
	. = ..()

	var/mob/living/simple_animal/simple_mecha/mecha = user.mob
	if(!mecha.engine || !mecha.engine.engine_burning)
		return FALSE
	if(!mecha.engine.can_quick_boost)
		return FALSE

/datum/keybinding/living/fd/mech/boost_down/down(client/user)
	var/mob/living/simple_animal/simple_mecha/L = user.mob
	L.engine.fuel_current = clamp(L.engine.fuel_current - 5, 0, L.engine.fuel_max)
	L.throw_at(get_edge_target_turf(L, SOUTH), 10, 2, L, 0)

/datum/keybinding/living/fd/mech/boost_left
	hotkey_keys = list("West")
	name = "boost_left"
	full_name = "MECH: Quick Boost (LEFT)"
	description = ""

/datum/keybinding/living/fd/mech/boost_left/can_use(client/user)
	. = ..()

	var/mob/living/simple_animal/simple_mecha/mecha = user.mob
	if(!mecha.engine || !mecha.engine.engine_burning)
		return FALSE
	if(!mecha.engine.can_quick_boost)
		return FALSE

/datum/keybinding/living/fd/mech/boost_left/down(client/user)
	var/mob/living/simple_animal/simple_mecha/L = user.mob
	L.engine.fuel_current = clamp(L.engine.fuel_current - 5, 0, L.engine.fuel_max)
	L.throw_at(get_edge_target_turf(L, WEST), 10, 2, L, 0)

/datum/keybinding/living/fd/mech/boost_right
	hotkey_keys = list("East")
	name = "boost_right"
	full_name = "MECH: Quick Boost (RIGHT)"
	description = ""

/datum/keybinding/living/fd/mech/boost_right/can_use(client/user)
	. = ..()

	var/mob/living/simple_animal/simple_mecha/mecha = user.mob
	if(!mecha.engine || !mecha.engine.engine_burning)
		return FALSE
	if(!mecha.engine.can_quick_boost)
		return FALSE

/datum/keybinding/living/fd/mech/boost_right/down(client/user)
	var/mob/living/simple_animal/simple_mecha/L = user.mob
	L.engine.fuel_current = clamp(L.engine.fuel_current - 5, 0, L.engine.fuel_max)
	L.throw_at(get_edge_target_turf(L, EAST), 10, 2, L, 0)

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
	if(!mecha.engine || mecha.engine.fuel_current <= 0)
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
			host.actual_aux1 = host.actual_weapon_slot
			host.actual_weapon_slot = null

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

	if(modifiers["middle"])
		if(!host.actual_aux1)
			animation_flash_color(src, COLOR_RED)
			return FALSE
		if(!host.actual_aux1.aux_usable)
			animation_flash_color(src, COLOR_RED)
			return FALSE
		if(!host.actual_aux1.aux_instant)
			animation_flash_color(src, COLOR_RED)
			return FALSE
		if(!host.actual_aux1.aux_can_use(host))
			animation_flash_color(src, COLOR_RED)
			return FALSE

		host.actual_aux1.aux_instant_effect(host)
		update_status()
		return TRUE

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
			host.actual_aux2 = host.actual_weapon_slot
			host.actual_weapon_slot = null

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

	if(modifiers["middle"])
		if(!host.actual_aux2)
			animation_flash_color(src, COLOR_RED)
			return FALSE
		if(!host.actual_aux2.aux_usable)
			animation_flash_color(src, COLOR_RED)
			return FALSE
		if(!host.actual_aux2.aux_instant)
			animation_flash_color(src, COLOR_RED)
			return FALSE
		if(!host.actual_aux2.aux_can_use(host))
			animation_flash_color(src, COLOR_RED)
			return FALSE

		host.actual_aux2.aux_instant_effect(host)
		update_status()
		return TRUE

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
	icon_state = "buff-air-obj"
	icon = 'mods/_fd/fd_assets/icons/goons/chaplainRitual.dmi'

	color = COLOR_ORANGE

	anchored = TRUE
	duration = 1 SECONDS
	layer = ABOVE_OBJ_LAYER

	light_range = 3
	light_power = 2
	light_color = COLOR_ORANGE

/obj/temp_visual/burning_effect/Initialize(mapload, set_dir)
	. = ..()
	SetTransform(2.5)

/obj/temp_visual/burning_effect/coral
	icon_state = "poof-alt"
	color = COLOR_WHITE
	light_color = COMMS_COLOR_ICCG

/obj/temp_visual/burning_effect/coral/Initialize(mapload, set_dir)
	. = ..()
	SetTransform(2.5)

/obj/item/fd/mech/restorer
	name = "equipment crate"
	icon = 'mods/_fd/fd_assets/icons/goons/large_storage.dmi'
	icon_state = "attachecase"

	w_class = ITEM_SIZE_NO_CONTAINER

/obj/item/fd/mech/engine
	name = "mech engine"
	icon = 'mods/_fd/fd_assets/icons/goons/crafting.dmi'
	icon_state = "plater1"

	var/power = 2
	var/can_quick_boost = FALSE

	w_class = ITEM_SIZE_NO_CONTAINER
	var/engine_burning = FALSE
	var/burning_effect = /obj/temp_visual/burning_effect

	var/mob/living/simple_animal/simple_mecha/mecha

	var/fuel_current = 500
	var/fuel_max = 500

/obj/item/fd/mech/engine/Initialize()
	. = ..()

	START_PROCESSING(SSobj,src)

/obj/item/fd/mech/engine/Process()

	if(fuel_current == fuel_max / 2)
		mecha.balloon_alert(mecha, "|ВНИМАНИЕ! ПОТЕРЯ ПОЛОВИНЫ ТОПЛИВА|", COLOR_YELLOW)

	if(fuel_current == 20)
		mecha.balloon_alert(mecha, "|ВНИМАНИЕ! КРИТИЧЕСКАЯ НЕХВАТКА ТОПЛИВА|", COLOR_RED)

	if(fuel_current <= 0 && engine_burning)
		engine_burning = FALSE
		mecha.movement_cooldown = initial(mecha.movement_cooldown)
		mecha.pass_flags = initial(mecha.pass_flags)
		balloon_alert_to_viewers("|ФШШшшш...|", "|ДВИГАТЕЛЬ: ВЫКЛЮЧЕН|", COLOR_WHITE)

/obj/item/fd/mech/engine/coral
	power = 6
	can_quick_boost = TRUE
	burning_effect = /obj/temp_visual/burning_effect/coral

/mob/living/simple_animal/simple_mecha/echo
	name = "IB-ECHO"
	desc = "Old war-period machine, used to vaporize bugs and now repurposed to press robots."

/mob/living/simple_animal/simple_mecha/echo/combat_ready/Initialize()
	. = ..()

	actual_weapon_slot = new /obj/item/gun/projectile/automatic/mecha/chang(src)
	actual_aux1 = new /obj/item/fd/mech/module/impact_shield(src)

	engine = new /obj/item/fd/mech/engine/coral(src)
	engine.mecha = src

	primary = new /obj/screen/primary_weapon_slot()
	primary.host = src
	aux1 = new /obj/screen/aux_slot_1()
	aux1.host = src
	aux2 = new /obj/screen/aux_slot_2()
	aux2.host = src

	primary.update_status()
	aux1.update_status()
	aux2.update_status()

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

	var/mob/living/carbon/human/pilot
	var/mob/living/carbon/human/passenger

	var/list/obj/storage = list()

	robotic = TRUE
	bleed_colour = COLOR_BLACK

	movement_cooldown = 4
	see_in_dark = 8

/mob/living/simple_animal/simple_mecha/UnarmedAttack(atom/A, proximity, atom/newloc)
	if(A == src && pilot)
		pilot.ckey = ckey
		pilot.forceMove(get_turf(get_step(src, reverse_direction(dir))))
		pilot = null
		return TRUE

	. = ..()

/mob/living/simple_animal/simple_mecha/attack_hand(mob/living/carbon/human/M)
	if(M == src && pilot)
		pilot.ckey = ckey
		pilot.forceMove(get_turf(get_step(src, reverse_direction(dir))))
		pilot = null
		return TRUE
	if(M == passenger)
		passenger.forceMove(get_turf(get_step(src, reverse_direction(dir))))
		passenger = null
		return TRUE

	if(!(M in contents) && M != src)
		if(pilot)
			balloon_alert(src, "|ВНИМАНИЕ! ПОПЫТКА ВНЕШНЕГО ИЗЪЯТИЯ|", COLOR_RED)
			if(do_after(M, 10 SECONDS, src, DO_PUBLIC_UNIQUE))
				pilot.forceMove(get_turf(get_step(src, reverse_direction(dir))))
				pilot = null
			return TRUE
		if(passenger)
			if(do_after(M, 10 SECONDS, src, DO_PUBLIC_UNIQUE))
				pilot.forceMove(get_turf(get_step(src, reverse_direction(dir))))
				pilot = null
			return TRUE

	. = ..()

/turf/simulated/floor/MouseDrop_T(mob/target, mob/user)
	. = ..()

	if(istype(target,/mob/living/simple_animal/simple_mecha))
		var/mob/living/simple_animal/simple_mecha/mecha = target

		var/list/cargo_list_names = list("Cancel")
		for(var/obj/item in mecha.storage)
			cargo_list_names += item.name
			cargo_list_names[item.name] = item
		var/item_name_remove = input(user,"Pick an item to remove","Item removal selection","Cancel") in cargo_list_names
		if(item_name_remove == "Cancel")
			return
		if(do_after(user, 10 SECONDS, src, DO_PUBLIC_UNIQUE))
			mecha.eject_cargo_item(cargo_list_names[item_name_remove])

/mob/living/simple_animal/simple_mecha/MouseDrop_T(atom/dropping, mob/user)
	if(dropping == src)
		return
	if(ishuman(dropping))
		var/mob/living/carbon/human/H = dropping
		if(!pilot)
			if(do_after(user, 5 SECONDS, src, DO_PUBLIC_UNIQUE))
				H.forceMove(src)
				pilot = H
				ckey = H.ckey
				balloon_alert(src, "|ДОБРО ПОЖАЛОВАТЬ, [pilot.real_name]|", COLOR_GREEN)
			return
		if(!passenger)
			if(do_after(user, 5 SECONDS, src, DO_PUBLIC_UNIQUE))
				H.forceMove(src)
				passenger = H
			return

	var/obj/something = dropping
	something.forceMove(src)
	storage += something
	return

/mob/living/simple_animal/simple_mecha/proc/eject_cargo_item(obj/object_removed)
	object_removed.forceMove(get_turf(get_step(src, reverse_direction(dir))))
	storage -= object_removed

/mob/living/simple_animal/simple_mecha/SelfMove(turf/n, direct, movetime)
	var/turf/old_turf = get_turf(src)
	if(engine && engine.engine_burning)
		engine.fuel_current = clamp(engine.fuel_current - 1, 0, engine.fuel_max)
		new engine.burning_effect(get_turf(old_turf))

	. = ..()

/mob/living/simple_animal/simple_mecha/Life()
	pixel_x = -8

	. = ..()

/mob/living/simple_animal/simple_mecha/proc/change_engine_state()

	if(!engine.engine_burning && engine.fuel_current > 0)
		engine.engine_burning = TRUE
		movement_cooldown -= engine.power
		pass_flags |= PASS_FLAG_TABLE
		balloon_alert_to_viewers("|ГРРр...|", "|ДВИГАТЕЛЬ: ВКЛЮЧЁН|", COLOR_ORANGE)
		return TRUE

	if(engine.engine_burning)
		engine.engine_burning = FALSE
		movement_cooldown = initial(movement_cooldown)
		pass_flags = initial(pass_flags)
		balloon_alert_to_viewers("|ФШШшшш...|", "|ДВИГАТЕЛЬ: ВЫКЛЮЧЕН|", COLOR_WHITE)
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
	if(istype(tool,/obj/item/fd/mech/restorer))
		if(do_after(user, 30 SECONDS, src, DO_PUBLIC_UNIQUE, DO_BOTH_CAN_MOVE))
			if(engine && engine.fuel_current < engine.fuel_max)
				engine.fuel_current = engine.fuel_max

			for(var/obj/item/gun/G in contents)
				if(istype(G,/obj/item/gun/energy))
					var/obj/item/gun/energy/E = G
					E.power_supply.charge = E.power_supply.maxcharge
				if(istype(G,/obj/item/gun/projectile))
					var/obj/item/gun/projectile/P = G
					if(P.load_method == MAGAZINE)
						if(P.ammo_magazine)
							qdel(P.ammo_magazine)
						P.ammo_magazine = new P.magazine_type(P)
					else
						for(var/i in 1 to P.max_shells)
							P.loaded += new P.ammo_type(src)
		qdel(tool)
		return TRUE

	if(istype(tool,/obj/item/fd/mech/engine))
		if(!engine && do_after(user, 10 SECONDS, src, DO_PUBLIC_UNIQUE))
			balloon_alert(src, "|УСТАНОВЛЕНО НОВОЕ ОБОРУДОВАНИЕ: [tool.name]|", COLOR_GREEN)
			user.drop_from_inventory(tool)
			tool.forceMove(src)
			engine = tool
			engine.mecha = src
		return TRUE

	if(tool.mecha_can_hold)
		if(!actual_weapon_slot && !(actual_aux1 == src || actual_aux2 == src))
			if(do_after(user, 10 SECONDS, src, DO_PUBLIC_UNIQUE))
				balloon_alert(src, "|УСТАНОВЛЕНО НОВОЕ ОБОРУДОВАНИЕ: [tool.name]|", COLOR_GREEN)
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
				balloon_alert(src, "|УСТАНОВЛЕНО НОВОЕ ОБОРУДОВАНИЕ: [tool.name]|", COLOR_GREEN)
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
				balloon_alert(src, "|УСТАНОВЛЕНО НОВОЕ ОБОРУДОВАНИЕ: [tool.name]|", COLOR_GREEN)
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
	var/aux_instant = FALSE

/obj/item/proc/aux_can_use(mob/living/user)
	return FALSE

/obj/item/proc/aux_instant_effect(mob/living/user)
	return FALSE

/obj/item/fd/mech/module
	aux_usable = TRUE
	aux_instant = TRUE
	mecha_can_hold = TRUE

/datum/simple_status/shielded/timed
	amount = 5
	amount_max = 5

	armor_amount = 60

	duration = 0
	var/image/shield_overlay

/datum/simple_status/shielded/timed/on_apply()
	. = ..()

	shield_overlay = image(icon = 'icons/mecha/shield.dmi', icon_state = "shield")
	shield_overlay.pixel_y = 12
	owner.AddOverlays(shield_overlay)

/datum/simple_status/shielded/timed/on_remove()
	. = ..()

	owner.balloon_alert(owner, "|ЩИТ ОТКЛЮЧЁН|", COLOR_RED)
	owner.CutOverlays(shield_overlay)

/obj/item/fd/mech/module/impact_shield
	name = "impact shield (AUX MODULE)"
	icon = 'mods/_fd/fd_assets/icons/goons/device.dmi'
	icon_state = "enshield1"

	var/on_cooldown = FALSE

/obj/item/fd/mech/module/impact_shield/aux_can_use(mob/living/user)
	if(user.get_status_effect(/datum/simple_status/shielded/timed))
		user.balloon_alert(user, "|ЗАЩИТНЫЙ ПРОТОКОЛ УЖЕ АКТИВЕН|", COLOR_YELLOW)
		return FALSE
	if(on_cooldown)
		user.balloon_alert(user, "|ЩИТ ПЕРЕЗАРЯЖАЕТСЯ|", COLOR_YELLOW)
		return FALSE

	return TRUE

/obj/item/fd/mech/module/impact_shield/aux_instant_effect(mob/living/user)

	user.balloon_alert(user, "|АКТИВИРУЮ ЗАЩИТНЫЙ ПРОТОКОЛ|", COLOR_CYAN)

	user.add_status_effect(/datum/simple_status/shielded/timed, 5 SECONDS)
	on_cooldown = TRUE

	addtimer(new Callback(src, PROC_REF(reset_module)), 10 SECONDS)

/obj/item/fd/mech/module/impact_shield/proc/reset_module()
	on_cooldown = FALSE

/obj/item/gun
	mecha_sprite_change = "mechgun"

/obj/item/gun/projectile/automatic/mecha/chang
	name = "DF-MG-02 CHANG-CHEN"
	desc = "Machine gun developed by Dafeng Core Industry. This weapon was designed for sustained combat potential, and uses oversize ammunition magazines. \
			Minimal need for reloading makes it well suited for suppressive fire."
	icon = 'icons/obj/guns/minigun.dmi'
	icon_state = "minigun"
	item_state = "l6closedmag" /// Onmob is WIP sprite
	w_class = ITEM_SIZE_NO_CONTAINER
	caliber = CALIBER_PISTOL_MAGNUM
	slot_flags = 0
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/box/mecha/chang
	allowed_magazines = /obj/item/ammo_magazine/box/mecha/chang
	accuracy = 10
	one_hand_penalty = 0
	mag_insert_sound = 'sound/weapons/guns/interaction/lmg_magin.ogg'
	mag_remove_sound = 'sound/weapons/guns/interaction/lmg_magout.ogg'
	fire_sound = 'sound/weapons/gunshot/minigun.ogg'
	can_special_reload = FALSE

	move_delay = 0
	can_autofire = TRUE

	has_safety = FALSE
	auto_eject = TRUE

	burst = 6
	burst_delay = 0
	fire_delay = 0

	firemodes = list()

/obj/item/ammo_magazine/box/mecha/chang
	name = "minigun box"
	icon_state = "minigun"
	mag_type = MAGAZINE
	caliber = CALIBER_PISTOL_MAGNUM
	ammo_type = /obj/item/ammo_casing/pistol/magnum
	max_ammo = 1200
	multiple_sprites = TRUE

/obj/item/attack_hand(mob/user)

	if(mecha_can_hold && istype(user, /mob/living/simple_animal/simple_mecha))
		var/mob/living/simple_animal/simple_mecha/mech = user
		if(!mech.actual_weapon_slot && !(mech.actual_aux1 == src || mech.actual_aux2 == src))
			forceMove(mech)
			mech.actual_weapon_slot = src
			mech.balloon_alert(mech, "|УСТАНОВЛЕНО НОВОЕ ОБОРУДОВАНИЕ: [name]|", COLOR_GREEN)

			if(!mech.primary)
				mech.primary = new /obj/screen/primary_weapon_slot()
				mech.primary.host = mech

			mech.primary.update_status()
			return TRUE

		if(!mech.actual_aux1 && !(mech.actual_weapon_slot == src || mech.actual_aux2 == src))
			forceMove(mech)
			mech.actual_aux1 = src
			mech.balloon_alert(mech, "|УСТАНОВЛЕНО НОВОЕ ОБОРУДОВАНИЕ: [name]|", COLOR_GREEN)

			if(!mech.aux1)
				mech.aux1 = new /obj/screen/aux_slot_1()
				mech.aux1.host = mech

			mech.aux1.update_status()
			return TRUE
		if(!mech.actual_aux2 && !(mech.actual_aux1 == src || mech.actual_weapon_slot == src))
			forceMove(mech)
			mech.actual_aux2 = src
			mech.balloon_alert(mech, "|УСТАНОВЛЕНО НОВОЕ ОБОРУДОВАНИЕ: [name]|", COLOR_GREEN)

			if(!mech.aux2)
				mech.aux2 = new /obj/screen/aux_slot_2()
				mech.aux2.host = mech

			mech.aux2.update_status()
			return TRUE

	. = ..()
