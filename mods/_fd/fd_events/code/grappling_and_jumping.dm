/mob/living
	var/dash_allowed = TRUE
	var/falling = FALSE

	var/in_dash = FALSE // Определяет, находимся ли мы в полёте прямо сейчас. Нужно для обрывов и кадров неуязвимости
	var/dash_distance = 0 // Как далеко мы дэшимся по стандарту

	var/preparing_to_dash = FALSE // Для хоткеев
	var/dash_bonus_points = 0 // Дополнительные очки от удержания пробела, максимум прописан ниже
	var/dash_bonus_points_max = 7
	var/dash_stamina_use = 20

	var/obj/screen/dash_charging_overlay/dashing_overlay

	var/attached_to_surface = FALSE
	var/atom/surface
	var/image/surface_overlay

/mob/living/proc/update_surface_overlay(atom/source, pixel_position)
	if(source)
		appearance_flags |= KEEP_TOGETHER
		var/turf/T = get_turf(source)

		surface_overlay = image(T.icon, src, T.icon_state)

		surface_overlay.appearance_flags |= KEEP_TOGETHER
		surface_overlay.blend_mode = BLEND_INSET_OVERLAY

		surface_overlay.pixel_y = pixel_position
		surface_overlay.add_filter("alpha_mask", 1, list("type" = "alpha", "icon" = icon('icons/turf/space.dmi', "blank")))

		AddOverlays(surface_overlay)
	else
		CutOverlays(surface_overlay)

/mob/living/proc/dash()
	adjust_stamina(-dash_stamina_use)

	pass_flags |= PASS_FLAG_TABLE
	var/direction = dir

	if(surface)
		surface.jumper = null
		surface = null
		attached_to_surface = FALSE

	in_dash = TRUE

	jump_layer_shift()
	if(client)
		client_jump_shift()

	animate(src, pixel_z = 16, time = 7, easing = SINE_EASING | EASE_IN)
	animate(pixel_z = default_pixel_z, time = 7, easing = SINE_EASING | EASE_OUT)

	throw_at(get_edge_target_turf(src, direction), dash_distance + dash_bonus_points, 1, src, FALSE, new Callback(src, PROC_REF(resolve_dash)))
	addtimer(new Callback(src, TYPE_PROC_REF(/mob/living, jump_layer_shift_end)), 4.5)

/mob/living/proc/resolve_dash()
	pass_flags = initial(pass_flags)

	if(!l_hand || !r_hand)
		var/turf/turf = get_step(src,dir)
		for(var/atom/A in turf)

			if(A.directional_booster || A.upwards_booster || A.can_attach_to)
				A.attach_jumper(src)

	in_dash = FALSE
	dash_distance = initial(dash_distance)

/atom
	var/directional_booster = FALSE

	var/upwards_booster = FALSE
	var/upwards_booster_controlled = TRUE

	var/can_attach_to = FALSE

	var/sudden_boost = FALSE

	var/mob/living/jumper

/atom/proc/adjust_grappling()
	var/turf/jumper_location = get_turf(jumper)
	var/shift_direction = get_dir(src,jumper_location)

	switch(shift_direction)
		if(NORTH)
			animate(jumper, pixel_y = -20, time = 3, easing = SINE_EASING | EASE_IN)
			jumper.update_surface_overlay(src, -20)
		if(SOUTH)
			animate(jumper, pixel_y = 20, time = 3, easing = SINE_EASING | EASE_IN)
			jumper.update_surface_overlay(src, 20)
		if(WEST)
			animate(jumper, pixel_x = 10, time = 3, easing = SINE_EASING | EASE_IN)
		if(EAST)
			animate(jumper, pixel_x = -10, time = 3, easing = SINE_EASING | EASE_IN)

/atom/proc/perform_upwards_boost()
	if(isopenspace(GetAbove(jumper)))
		jumper.spin(4, 1)
		animate(jumper, alpha = 0, pixel_y = 64, time = 5, easing = SINE_EASING|EASE_IN)
		sleep(5)

		animate(jumper, alpha = 255, pixel_y = 0, time = 1, easing = SINE_EASING|EASE_IN)
		jumper.forceMove(GetAbove(jumper))
		sleep(5)

		if(upwards_booster_controlled && jumper)
			jumper.spin(4, 1)
			animate(jumper, alpha = 0, pixel_y = -64, time = 5, easing = SINE_EASING|EASE_IN)
			sleep(5)
			jumper.forceMove(GetBelow(jumper))
			return TRUE

		if(!upwards_booster_controlled)
			jumper.pass_flags |= PASS_FLAG_TABLE
			jumper.in_dash = TRUE
			jumper.attached_to_surface = FALSE
			jumper.surface = null

			var/mob/living/controlled_mob = jumper
			jumper = null

			controlled_mob.jump_layer_shift()
			if(controlled_mob.client)
				controlled_mob.client_jump_shift()

			animate(controlled_mob, pixel_z = 16, time = 7, easing = SINE_EASING | EASE_IN)
			animate(pixel_z = controlled_mob.default_pixel_z, time = 7, easing = SINE_EASING | EASE_OUT)

			controlled_mob.throw_at(get_ranged_target_turf(get_turf(controlled_mob), controlled_mob.dir, 5), 5, 1, src, FALSE, new Callback(controlled_mob, TYPE_PROC_REF(/mob/living, resolve_dash)))
			addtimer(new Callback(controlled_mob, TYPE_PROC_REF(/mob/living, jump_layer_shift_end)), 4.5)

/atom/proc/attach_jumper(mob/living/user)
	if(can_attach_to) // for objects, that can be used to climb either up or down
		jumper = user
		jumper.surface = src

		jumper.attached_to_surface = TRUE
		jumper.balloon_alert(jumper, "|ХВАТЬ!|", COLOR_WHITE)
		adjust_grappling()

		return TRUE

	if(upwards_booster) // for objects, that boost player one level higher, giving him momentum for a jump
		jumper = user
		jumper.surface = src

		jumper.attached_to_surface = TRUE
		jumper.balloon_alert(jumper, "|ПРЫГ!|", COLOR_WHITE)

		if(sudden_boost)
			perform_upwards_boost()
		return TRUE

/mob/living/can_fall(anchor_bypass = FALSE, turf/location_override = loc)
	if(in_dash)
		return FALSE

	if(attached_to_surface)
		return FALSE

	. = ..()

/mob/living/Bump(atom/A)
/*	if(A.canbegrappled && (!l_hand || !r_hand))
		forceMove(get_turf(A))

		adjust_grappling()

	. = ..()*/

/mob/living
	var/chasm_free = FALSE

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
			user.resting = TRUE

			user.falling = FALSE

			if(has_fall_damage)
				user.SetStunned(5)
				if(user.simple_combat_on)
					user.simple_health_calculation(fall_damage_amount, 0, 0, 0, null, /datum/simple_status/legbroke, 1)
				else
					user.apply_damage(fall_damage_amount, DAMAGE_BRUTE)

/obj/structure/fd/chasm/Process()
	for(var/mob/living/A in get_turf(src))
		if(A.chasm_free)
			return

		if(A.in_dash)
			return

		if(A.attached_to_surface)
			return

		if(A.falling)
			return

		else
			A.falling = TRUE
			animate(A, transform = matrix(0.01, MATRIX_SCALE), time = 1 SECOND, easing = BOUNCE_EASING)

			spawn(1 SECONDS)
				check_fall(A)

/obj/structure/fd/chasm/Crossed(atom/A)
	if(isliving(A))
		var/mob/living/L = A

		if(L.chasm_free)
			return

		if(L.in_dash)
			return

		if(L.attached_to_surface)
			return

		if(L.falling)
			return

		else
			L.falling = TRUE
			animate(L, transform = matrix(0.01, MATRIX_SCALE), time = 1 SECOND, easing = BOUNCE_EASING)
			spawn(1 SECONDS)
				check_fall(L)

	. = ..()

////////////////////////////////////////////////////////////////////////////////////////////////////////

/datum/keybinding/living/fd
	category = CATEGORY_FD

/datum/keybinding/living/fd/dash_up
	hotkey_keys = list("None")
	name = "dash_up"
	full_name = "General: DASH DIAL UP"
	description = ""

/datum/keybinding/living/fd/dash_up/can_use(client/user)
	. = ..()

	if(!isliving(user.mob))
		return FALSE
	var/mob/living/L = user.mob

	if(!L.preparing_to_dash)
		return FALSE

/datum/keybinding/living/fd/dash_up/down(client/user)
	var/mob/living/L = user.mob

	if(L.dash_bonus_points >= L.dash_bonus_points_max)
		L.dash_bonus_points = 0
	else
		L.dash_bonus_points += 1

	L.dashing_overlay.update_charging_status()
	return TRUE

/datum/keybinding/living/fd/dash_down
	hotkey_keys = list("None")
	name = "dash_down"
	full_name = "General: DASH DIAL DOWN"
	description = ""

/datum/keybinding/living/fd/dash_down/can_use(client/user)
	. = ..()

	if(!isliving(user.mob))
		return FALSE
	var/mob/living/L = user.mob

	if(!L.preparing_to_dash)
		return FALSE

	if(L.dash_bonus_points <= 0)
		return FALSE

/datum/keybinding/living/fd/dash_down/down(client/user)
	var/mob/living/L = user.mob

	L.dash_bonus_points = clamp(L.dash_bonus_points - 1, 0, L.dash_bonus_points_max)
	L.dashing_overlay.update_charging_status()
	return TRUE

/datum/keybinding/living/fd/dash
	hotkey_keys = list("None")
	name = "dash"
	full_name = "General: DASH"
	description = ""

/datum/keybinding/living/fd/dash/can_use(client/user)
	. = ..()

	if(!isliving(user.mob))
		return FALSE
	var/mob/living/L = user.mob

	if(istype(L,/mob/living/cutscene_pov))
		return FALSE

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

	if(L.falling)
		return FALSE

	if(L.get_stamina() < L.dash_stamina_use)
		return FALSE

	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		if(H.raft)
			return FALSE
		if(H.mob_fishing)
			return FALSE

/datum/keybinding/living/fd/dash/down(client/user)
	var/mob/living/L = user.mob

	if(!L.preparing_to_dash)
		L.preparing_to_dash = TRUE

		if(!L.dashing_overlay)
			L.dashing_overlay = new /obj/screen/dash_charging_overlay()
			L.dashing_overlay.connected_mob = L
			L.client.screen += L.dashing_overlay

		animate(L.dashing_overlay, alpha = 255, time = 3, easing = SINE_EASING|EASE_OUT, flags = ANIMATION_PARALLEL)
		L.dashing_overlay.update_charging_status()
		return TRUE

	if(L.preparing_to_dash)
		animate(user, pixel_x = 0, pixel_y = 0, time = 3, easing = SINE_EASING|EASE_OUT, flags = ANIMATION_PARALLEL)
		animate(L.dashing_overlay, transform = matrix(0, 0, MATRIX_TRANSLATE), alpha = 0, time = 3, easing = SINE_EASING|EASE_OUT, flags = ANIMATION_PARALLEL)
		L.preparing_to_dash = FALSE
		L.dash()

		return TRUE

/obj/screen/dash_charging_overlay
	name = "ЗАРЯДКА"
	desc = "..."
	icon = 'mods/_fd/fd_assets/icons/tg/callouts.dmi'
	icon_state = "move"

	mouse_opacity = FALSE
	alpha = 0

	plane = HUD_PLANE
	layer = 5.3

	screen_loc = "CENTER,CENTER"
	var/mob/living/connected_mob

/obj/screen/dash_charging_overlay/proc/update_charging_status()
	var/get_current_charge_meter = connected_mob.dash_bonus_points * 32

	switch(connected_mob.dir)
		if(EAST)
			if(get_current_charge_meter > 0)
				animate(connected_mob.client, pixel_x = 192, pixel_y = 0, time = 3, easing = SINE_EASING|EASE_OUT, flags = ANIMATION_PARALLEL)
			else
				animate(connected_mob.client, pixel_x = 0, pixel_y = 0, time = 3, easing = SINE_EASING|EASE_OUT, flags = ANIMATION_PARALLEL)
			animate(src, transform = matrix(get_current_charge_meter - connected_mob.client.pixel_x, 0, MATRIX_TRANSLATE), time = 3, easing = SINE_EASING|EASE_OUT, flags = ANIMATION_PARALLEL)
			return TRUE
		if(WEST)
			if(get_current_charge_meter > 0)
				animate(connected_mob.client, pixel_x = -192, pixel_y = 0, time = 3, easing = SINE_EASING|EASE_OUT, flags = ANIMATION_PARALLEL)
			else
				animate(connected_mob.client, pixel_x = 0, pixel_y = 0, time = 3, easing = SINE_EASING|EASE_OUT, flags = ANIMATION_PARALLEL)
			animate(src, transform = matrix(-get_current_charge_meter - connected_mob.client.pixel_x, 0, MATRIX_TRANSLATE), time = 3, easing = SINE_EASING|EASE_OUT, flags = ANIMATION_PARALLEL)
			return TRUE
		if(NORTH)
			if(get_current_charge_meter > 0)
				animate(connected_mob.client, pixel_x = 0, pixel_y = 192, time = 3, easing = SINE_EASING|EASE_OUT, flags = ANIMATION_PARALLEL)
			else
				animate(connected_mob.client, pixel_x = 0, pixel_y = 0, time = 3, easing = SINE_EASING|EASE_OUT, flags = ANIMATION_PARALLEL)
			animate(src, transform = matrix(0, get_current_charge_meter - connected_mob.client.pixel_y, MATRIX_TRANSLATE), time = 3, easing = SINE_EASING|EASE_OUT, flags = ANIMATION_PARALLEL)
			return TRUE
		if(SOUTH)
			if(get_current_charge_meter > 0)
				animate(connected_mob.client, pixel_x = 0, pixel_y = -192, time = 3, easing = SINE_EASING|EASE_OUT, flags = ANIMATION_PARALLEL)
			else
				animate(connected_mob.client, pixel_x = 0, pixel_y = 0, time = 3, easing = SINE_EASING|EASE_OUT, flags = ANIMATION_PARALLEL)
			animate(src, transform = matrix(0, -get_current_charge_meter - connected_mob.client.pixel_y, MATRIX_TRANSLATE), time = 3, easing = SINE_EASING|EASE_OUT, flags = ANIMATION_PARALLEL)
			return TRUE

/mob/living/set_dir()
	. = ..()
	if(preparing_to_dash)
		dashing_overlay.update_charging_status()

/mob/living/Life()

	if(attached_to_surface)
		check_grapple_conditions()

	. = ..()

/mob/living/proc/client_jump_shift()
	set waitfor = FALSE

	animate(client, pixel_y = 10, time = 7, easing = BACK_EASING | EASE_IN)
	animate(pixel_y = 0, time = 7, easing = SINE_EASING | EASE_IN)

/mob/living/proc/check_grapple_conditions(atom/A)
/*	var/turf/placed_on = get_turf(src)
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
		adjust_stamina(-10)*/

/mob/living/proc/unattach_mob()
	attached_to_surface = FALSE

	dash_bonus_points_max = initial(dash_bonus_points_max)

	pixel_y = 0
	pixel_x = 0
