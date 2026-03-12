/atom
	var/canbegrappled = FALSE

/obj/structure/fd/chasm
	name = "abyss"
	desc = "Do not fell in it!"
	icon = 'mods/_fd/fd_utilities/icons/source.dmi'
	icon_state = "tools/black"
	alpha = 100

	var/area/teleport_to = null
	var/list/possible_points = list()
	var/abyss = FALSE

/obj/structure/fd/chasm/Initialize()
	. = ..()
	START_PROCESSING(SSobj, src)

	for(var/turf/T in teleport_to)
		if(T.density)
			continue
		possible_points += T

/obj/structure/fd/chasm/proc/check_fall(mob/living/user)
	if(abyss)
		qdel(user)
	else
		user.alpha = 0
		user.pixel_z = 128
		user.forceMove(pick(possible_points))

		spawn(0.5 SECONDS)
			animate(user, alpha = 255, transform = matrix(1, MATRIX_SCALE), pixel_z = user.default_pixel_z, time = 3, easing = SINE_EASING | EASE_OUT)
			user.Weaken(10)
			user.apply_damage(30, DAMAGE_BRUTE)

/obj/structure/fd/chasm/Process()
	for(var/mob/living/A in get_turf(src))
		var/mob/living/L = A

		if(L.in_dash)
			return

		if(L.attached_to_surface)
			return

		else
			animate(L, transform = matrix(0.01, MATRIX_SCALE), time = 1 SECOND, easing = BOUNCE_EASING)

			spawn(1 SECONDS)
				check_fall(L)

/obj/structure/fd/chasm/Crossed(atom/A)
	if(ismob(A))
		var/mob/living/L = A

		if(L.in_dash)
			return

		if(L.attached_to_surface)
			return

		else
			animate(L, transform = matrix(0.01, MATRIX_SCALE), time = 1 SECOND, easing = BOUNCE_EASING)
			spawn(1 SECONDS)
				check_fall(L)

	. = ..()

////////////////////////////////////////////////////////////////////////////////////////////////////////

#define CATEGORY_FD "FINAL DESTINATION"
/datum/keybinding/living/fd
	category = CATEGORY_FD

/datum/keybinding/living/fd/dash
	hotkey_keys = list("Alt") // Мы не можем настроить хоткей на пробел
	name = "dash"
	full_name = "General: DASH"
	description = ""

/datum/keybinding/living/fd/dash/can_use(client/user)
	var/mob/living/L = user.mob
	if(!L.dash_allowed)
		return FALSE

	if(L.in_dash)
		return FALSE
	. = ..()

/datum/keybinding/living/fd/dash/down(client/user)
	var/mob/living/L = user.mob
	L.preparing_to_dash = TRUE
	return TRUE

/datum/keybinding/living/fd/dash/up(client/user)
	var/mob/living/L = user.mob
	L.preparing_to_dash = FALSE
	L.update_dash_visuals()
	L.dash()
	return TRUE

/mob/living
	var/dash_allowed = TRUE

	var/in_dash = FALSE // Определяет, находимся ли мы в полёте прямо сейчас. Нужно для обрывов и кадров неуязвимости
	var/dash_distance = 2 // Как далеко мы дэшимся по стандарту

	var/preparing_to_dash = FALSE // Для хоткеев
	var/dash_bonus_points = 0 // Дополнительные очки от удержания пробела, максимум прописан ниже
	var/dash_bonus_points_max = 5

	var/image/dash_charging_overlay

	var/attached_to_surface = FALSE
	var/grapple_str = 30
	var/grapple_str_max = 30

/mob/living/Life()

	if(attached_to_surface)
		check_grapple_conditions()

	if(!attached_to_surface && grapple_str != grapple_str_max)
		grapple_str += 1

	if(preparing_to_dash)

		if(dash_bonus_points < dash_bonus_points_max)
			dash_bonus_points += 1
			update_dash_visuals()

	. = ..()

/mob/living/proc/update_dash_visuals()
	if(preparing_to_dash)
		CutOverlays(dash_charging_overlay)

		dash_charging_overlay = image('mods/_fd/fd_events/icons/dash_info.dmi', icon_state = "[dash_bonus_points]_bonus")
		dash_charging_overlay.mouse_opacity = FALSE
		dash_charging_overlay.pixel_y = -10

		AddOverlays(dash_charging_overlay)

	else
		CutOverlays(dash_charging_overlay)

/mob/living/proc/dash()
	pass_flags |= PASS_FLAG_TABLE
	var/direction = dir

	in_dash = TRUE
	dash_distance += dash_bonus_points

	jump_layer_shift()

	animate(client, pixel_y = 10, time = 3, easing = BACK_EASING | EASE_IN)
	animate(src, pixel_z = 16, time = 3, easing = SINE_EASING | EASE_IN)

	animate(client, pixel_y = default_pixel_y, time = 3, easing = SINE_EASING | EASE_IN)
	animate(src, pixel_z = default_pixel_z, time = 3, easing = SINE_EASING | EASE_OUT)

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
	var/obj/structure/fd/chasm/C

	var/grappling_object = FALSE

	for(A in placed_on)
		if(A.canbegrappled)
			grappling_object = TRUE

	if(!grappling_object)
		unattach_mob()

	if(grapple_str <= 0)
		unattach_mob()

	if(l_hand && r_hand)
		unattach_mob()

	// Мы соскальзываем лишь при условии того, что нам есть куда
	if(isopenspace(placed_on))
		grapple_str -= 1

	if(C in placed_on.loc)
		grapple_str -= 1

/mob/living/proc/unattach_mob()
	attached_to_surface = FALSE
	if(grapple_str < 10)
		grapple_str += 5

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
