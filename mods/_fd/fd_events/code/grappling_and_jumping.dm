/atom
	var/canbegrappled = FALSE

/obj/structure/fd/chasm
	name = "abyss"
	desc = "Do not fell in it!"
	icon = 'mods/_fd/fd_utilities/icons/source.dmi'
	icon_state = "tools/black"
	alpha = 100

	var/area/teleport_to // = /area/metro // Вызывает кучу не нужных конфликтов. Перенесено в файл fine_additions.dm Метрошки
	var/list/turf/possible_points = list()
	var/abyss = FALSE

	var/has_fall_damage = TRUE
	var/fall_damage_amount = 30
	var/list/mob/living/ignore_these_mobs = list(/mob/living/simple_animal/metro_jeff)

	anchored = TRUE

/obj/structure/fd/chasm/Initialize()
	. = ..()
	START_PROCESSING(SSobj, src)

/obj/structure/fd/chasm/proc/check_fall(mob/living/user)
	if(abyss)
		qdel(user)
	else
		if(!length(possible_points))
			var/area/A = locate(teleport_to)

			for(var/turf/T in get_area_turfs(A))
				if(T.density)
					continue
				possible_points += T

		user.alpha = 0
		user.pixel_z = 128
		user.forceMove(pick(possible_points))

		spawn(0.5 SECONDS)
			animate(user, alpha = 255, transform = matrix(1, MATRIX_SCALE), pixel_z = user.default_pixel_z, time = 3, easing = SINE_EASING | EASE_OUT)
			user.Weaken(10)

			if(has_fall_damage)
				user.apply_damage(fall_damage_amount, DAMAGE_BRUTE)

/obj/structure/fd/chasm/Process()
	for(var/mob/living/A in get_turf(src))
		if(A.type in ignore_these_mobs)
			return

		if(A.in_dash)
			return

		if(A.attached_to_surface)
			return

		else
			A.Stun(10)
			animate(A, transform = matrix(0.01, MATRIX_SCALE), time = 1 SECOND, easing = BOUNCE_EASING)

			spawn(1 SECONDS)
				check_fall(A)

/obj/structure/fd/chasm/Crossed(atom/A)
	if(isliving(A))
		var/mob/living/L = A

		if(L.type in ignore_these_mobs)
			return

		if(L.in_dash)
			return

		if(L.attached_to_surface)
			return

		else
			L.Stun(10)
			animate(L, transform = matrix(0.01, MATRIX_SCALE), time = 1 SECOND, easing = BOUNCE_EASING)
			spawn(1 SECONDS)
				check_fall(L)

	. = ..()

////////////////////////////////////////////////////////////////////////////////////////////////////////

/obj/screen/cancel_dash
	name = "ПРЕРВАТЬ ПРЫЖОК"
	desc = "Отменяет..."
	icon = 'mods/_fd/fd_events/icons/dash_info.dmi'
	icon_state = "jump_cancel_button"

	plane = HUD_PLANE
	layer = 5.4
	alpha = 0

	screen_loc = "CENTER,CENTER"
	var/mob/living/connected_mob

/obj/screen/cancel_dash/Click()
	connected_mob.preparing_to_dash = FALSE

	animate(src, transform = matrix(0, 0, MATRIX_TRANSLATE), alpha = 0, time = 3, easing = SINE_EASING|EASE_OUT, flags = ANIMATION_PARALLEL)
	animate(connected_mob.dashing_overlay, transform = matrix(0, 0, MATRIX_TRANSLATE), alpha = 0, time = 3, easing = SINE_EASING|EASE_OUT, flags = ANIMATION_PARALLEL)
	return TRUE

/datum/keybinding/living/fd
	category = CATEGORY_FD

/datum/keybinding/living/fd/dash
	hotkey_keys = list("Alt") // Мы не можем настроить хоткей на пробел
	name = "dash"
	full_name = "General: DASH"
	description = ""

/datum/keybinding/living/fd/dash/can_use(client/user)
	. = ..()

	var/mob/living/L = user.mob

	if(L.simple_combat_on)
		if(L.get_status_effect(/datum/simple_status/legbroke))
			return FALSE
		if(L.get_status_effect(/datum/simple_status/crit))
			return FALSE
		if(L.get_status_effect(/datum/simple_status/hardcrit))
			return FALSE

	if(L.stat != CONSCIOUS)
		return FALSE

	if(L.resting)
		return FALSE

	if(!L.dash_allowed)
		return FALSE

	if(L.in_dash)
		return FALSE

	if(L.get_stamina() < L.dash_stamina_use)
		return FALSE

/datum/keybinding/living/fd/dash/down(client/user)
	var/mob/living/L = user.mob
	L.preparing_to_dash = TRUE

	L.CutOverlays(L.dash_indication)

	L.dash_indication = image('mods/_fd/fd_events/icons/dash_info.dmi', icon_state = "jump_indicator")
	L.dash_indication.mouse_opacity = FALSE
	L.dash_indication.pixel_y = 32

	if(!L.dashing_overlay)
		L.dashing_overlay = new /obj/screen/dash_charging_overlay()
		L.dashing_overlay.connected_mob = L
		L.client.screen += L.dashing_overlay

	if(!L.cancel_dash_button)
		L.cancel_dash_button = new /obj/screen/cancel_dash()
		L.cancel_dash_button.connected_mob = L
	L.client.screen += L.cancel_dash_button
	animate(L.cancel_dash_button, transform = matrix(0, -48, MATRIX_TRANSLATE), alpha = 255, time = 3, easing = SINE_EASING|EASE_IN)
	L.AddOverlays(L.dash_indication)

	return TRUE

/datum/keybinding/living/fd/dash/up(client/user)
	var/mob/living/L = user.mob

	if(!L.preparing_to_dash)
		L.dash_distance = initial(L.dash_distance)
		L.dash_bonus_points = initial(L.dash_bonus_points)
		spawn(4)
			L.client.screen -= L.cancel_dash_button
		L.CutOverlays(L.dash_indication)
		return FALSE

	L.preparing_to_dash = FALSE
	L.dash()

	spawn(4)
		L.client.screen -= L.cancel_dash_button
		L.CutOverlays(L.dash_indication)
	animate(L.cancel_dash_button, transform = matrix(0, 0, MATRIX_TRANSLATE), alpha = 0, time = 3, easing = SINE_EASING|EASE_OUT, flags = ANIMATION_PARALLEL)
	animate(L.dashing_overlay, transform = matrix(0, 0, MATRIX_TRANSLATE), alpha = 0, time = 3, easing = SINE_EASING|EASE_OUT, flags = ANIMATION_PARALLEL)
	return TRUE

/obj/screen/dash_charging_overlay
	name = "ЗАРЯДКА"
	desc = "..."
	icon = 'mods/_fd/fd_events/icons/dash_info.dmi'
	icon_state = "0_bonus"

	mouse_opacity = FALSE

	plane = HUD_PLANE
	layer = 5.3

	screen_loc = "CENTER,CENTER-0.5"
	var/mob/living/connected_mob

/obj/screen/dash_charging_overlay/Initialize()
	. = ..()
	START_PROCESSING(SSobj, src)

/obj/screen/dash_charging_overlay/Process()
	if(!connected_mob.preparing_to_dash && icon_state != "0_bonus")
		icon_state = "0_bonus"

	if(connected_mob.preparing_to_dash)
		screen_loc = "CENTER,CENTER-0.5"
		alpha = 255

		icon_state = "[connected_mob.dash_bonus_points]_bonus"

/mob/living
	var/dash_allowed = TRUE

	var/in_dash = FALSE // Определяет, находимся ли мы в полёте прямо сейчас. Нужно для обрывов и кадров неуязвимости
	var/dash_distance = 2 // Как далеко мы дэшимся по стандарту

	var/preparing_to_dash = FALSE // Для хоткеев
	var/dash_bonus_points = 0 // Дополнительные очки от удержания пробела, максимум прописан ниже
	var/dash_bonus_points_max = 5
	var/dash_stamina_use = 20

	var/obj/screen/dash_charging_overlay/dashing_overlay

	var/image/dash_indication
	var/obj/screen/cancel_dash/cancel_dash_button

	var/attached_to_surface = FALSE

/mob/living/Life()

	if(attached_to_surface)
		check_grapple_conditions()

	if(preparing_to_dash)

		if(dash_bonus_points < dash_bonus_points_max)
			dash_bonus_points += 1

	. = ..()

/mob/living/proc/client_jump_shift()
	set waitfor = FALSE

	animate(client, pixel_y = 10, time = 7, easing = BACK_EASING | EASE_IN)
	animate(pixel_y = 0, time = 7, easing = SINE_EASING | EASE_IN)

/mob/living/proc/dash()
	adjust_stamina(-dash_stamina_use)

	pass_flags |= PASS_FLAG_TABLE
	var/direction = dir

	in_dash = TRUE
	dash_distance += dash_bonus_points

	jump_layer_shift()
	if(client)
		client_jump_shift()

	animate(src, pixel_z = 16, time = 7, easing = SINE_EASING | EASE_IN)
	animate(pixel_z = default_pixel_z, time = 7, easing = SINE_EASING | EASE_OUT)

	throw_at(get_edge_target_turf(src, direction), dash_distance, 1, src, FALSE, new Callback(src, PROC_REF(resolve_dash)))
	addtimer(new Callback(src, TYPE_PROC_REF(/mob/living, jump_layer_shift_end)), 4.5)

/mob/living/proc/resolve_dash()
	pass_flags = initial(pass_flags)

	for(var/atom/A in view(1,src))
		if(A.canbegrappled && (!l_hand || !r_hand))
			forceMove(get_turf(A))

			adjust_grappling()
			attached_to_surface = TRUE
			dash_bonus_points_max += 1

	in_dash = FALSE
	dash_distance = initial(dash_distance)
	dash_bonus_points = initial(dash_bonus_points)

/mob/living/can_fall(anchor_bypass = FALSE, turf/location_override = loc)
	if(in_dash)
		return FALSE

	if(attached_to_surface)
		return FALSE

	. = ..()

/mob/living/Bump(atom/A)
	if(A.canbegrappled && (!l_hand || !r_hand))
		forceMove(get_turf(A))

		adjust_grappling()
		attached_to_surface = TRUE
		dash_bonus_points_max += 1

	. = ..()

/mob/living/proc/check_grapple_conditions(atom/A)
	var/turf/placed_on = get_turf(src)
	var/grappling_object = FALSE

	for(A in placed_on)
		if(A.canbegrappled)
			grappling_object = TRUE

	if(!grappling_object)
		unattach_mob()

	if(get_stamina() < 5)
		unattach_mob()

	if(l_hand && r_hand)
		unattach_mob()

	// Мы соскальзываем лишь при условии того, что нам есть куда
	if(isopenspace(placed_on))
		adjust_stamina(-10)

	var/obj/structure/fd/chasm/C = locate() in placed_on
	if(C)
		adjust_stamina(-10)

/mob/living/proc/unattach_mob()
	attached_to_surface = FALSE

	dash_bonus_points_max = initial(dash_bonus_points_max)

	pixel_y = 0
	pixel_x = 0

/mob/living/proc/adjust_grappling()
	switch(dir)
		if(NORTH)
			animate(src, pixel_y = -10, time = 3, easing = SINE_EASING | EASE_IN)
		if(SOUTH)
			animate(src, pixel_y = 10, time = 3, easing = SINE_EASING | EASE_IN)
		if(WEST)
			animate(src, pixel_x = 10, time = 3, easing = SINE_EASING | EASE_IN)
		if(EAST)
			animate(src, pixel_x = -10, time = 3, easing = SINE_EASING | EASE_IN)
