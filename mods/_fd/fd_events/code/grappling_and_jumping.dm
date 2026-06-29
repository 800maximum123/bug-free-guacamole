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

		L.client.screen |= L.dashing_overlay
		animate(L.dashing_overlay, alpha = 255, time = 3, easing = SINE_EASING|EASE_OUT, flags = ANIMATION_PARALLEL)
		L.dashing_overlay.update_charging_status()
		return TRUE

	if(L.preparing_to_dash)
		animate(user, pixel_x = 0, pixel_y = 0, time = 3, easing = SINE_EASING|EASE_OUT, flags = ANIMATION_PARALLEL)
		animate(L.dashing_overlay, transform = matrix(0, 0, MATRIX_TRANSLATE), alpha = 0, time = 3, easing = SINE_EASING|EASE_OUT, flags = ANIMATION_PARALLEL)
		L.preparing_to_dash = FALSE
		L.dash()

		return TRUE

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/mob/living
	var/chasm_free = FALSE
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

	var/can_coyote_jump = FALSE
	var/coyote_jump_frames = 1

/mob/living/proc/update_surface_overlay(atom/source, pixel_position)
	if(source)
		CutOverlays(surface_overlay)

		appearance_flags |= KEEP_TOGETHER
		var/turf/T = get_turf(source)

		surface_overlay = image(T.icon, src, T.icon_state)

		surface_overlay.appearance_flags |= KEEP_TOGETHER
		surface_overlay.blend_mode = BLEND_INSET_OVERLAY

		surface_overlay.pixel_y = pixel_position
		surface_overlay.add_filter("alpha_mask", 1, list("type" = "alpha", "icon" = icon('icons/turf/space.dmi', "black")))

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

		if(turf.density && turf.can_attach_to)
			turf.attach_jumper(src)
		else
			for(var/atom/A in turf)
				if(A.directional_booster || A.upwards_booster || A.can_attach_to)
					A.attach_jumper(src)

		if(!surface)
			turf = get_turf(src)
			for(var/atom/A in turf)

				if(A.directional_booster || A.upwards_booster)
					A.attach_jumper(src)

	in_dash = FALSE
	dash_distance = initial(dash_distance)

/mob/living/can_fall(anchor_bypass = FALSE, turf/location_override = loc)
	if(in_dash)
		return FALSE

	if(attached_to_surface)
		return FALSE

	if(can_coyote_jump && coyote_jump_frames > 0)
		return FALSE

	. = ..()

/mob/living/can_overcome_gravity()
	if(attached_to_surface && surface && surface.can_attach_to)
		return TRUE
	. =..()

/mob/living/carbon/human/can_overcome_gravity()
	if(attached_to_surface && surface && surface.can_attach_to)
		return TRUE
	. =..()

/mob/living/SelfMove(direction)
	var/turf/last_location = get_turf(src)

	. = ..()

	if(attached_to_surface && surface && surface.can_attach_to)
		if(direction == UP && (!l_hand || !r_hand))
			var/turf/turf = get_step(src,dir)

			if(turf.density && turf.can_attach_to)
				turf.attach_jumper(src)

		else if(last_location != get_turf(src))
			unattach_mob()

/turf/simulated/open/Exited(atom/movable/Obj, atom/newloc)
	if(isliving(Obj))
		var/mob/living/L = Obj
		if(L.can_coyote_jump)
			new /obj/temp_visual/coyote_jump(src)

	if(isopenspace(newloc) && isliving(Obj))
		var/mob/living/L = Obj
		if(L.can_coyote_jump && L.coyote_jump_frames > 0)
			L.coyote_jump_frames = 0

	. = ..()

	if(!isopenspace(newloc) && isliving(Obj))
		var/mob/living/L = Obj
		if(L.can_coyote_jump && L.coyote_jump_frames <= initial(L.coyote_jump_frames))
			L.coyote_jump_frames = initial(L.coyote_jump_frames)


/mob/living/Bump(atom/A)
	. = ..()

	if(A.can_attach_to && (!l_hand || !r_hand) && !jumper)
		A.attach_jumper(src)

/mob/living/proc/unattach_mob()
	update_surface_overlay()

	pixel_y = 0
	pixel_x = 0

	surface.jumper = null
	surface = null
	attached_to_surface = FALSE

/mob/living/set_dir()
	. = ..()
	if(preparing_to_dash)
		dashing_overlay.update_charging_status()

/mob/living/Life()

	if(attached_to_surface)
		check_grapple_conditions()

		if(surface && surface.directional_booster)
			animate(src, pixel_x = pixel_x - 6, time = 5, easing = EASE_IN)
			animate(pixel_x = pixel_x + 6, time = 5.5)
			animate(pixel_x = pixel_x, time = 4.7, easing = EASE_OUT)

	if(!attached_to_surface && isopenspace(get_turf(src)) && can_coyote_jump)
		if(coyote_jump_frames > 0)
			coyote_jump_frames = clamp(coyote_jump_frames - 1, 0, initial(coyote_jump_frames))
		if(coyote_jump_frames <= 0 && isopenspace(get_turf(src)))
			fall()

	. = ..()

/mob/living/proc/client_jump_shift()
	set waitfor = FALSE

	animate(client, pixel_y = 10, time = 7, easing = BACK_EASING | EASE_IN)
	animate(pixel_y = 0, time = 7, easing = SINE_EASING | EASE_IN)

/mob/living/proc/check_grapple_conditions(atom/A)
	var/turf/placed_on = get_turf(src)

	if(!surface)
		attached_to_surface = FALSE

	if(get_stamina() < 5)
		unattach_mob()

	if(l_hand && r_hand)
		unattach_mob()

	// Мы соскальзываем лишь при условии того, что нам есть куда
	var/obj/structure/fd/chasm/C = locate() in placed_on
	if(isopenspace(placed_on))
		adjust_stamina(-10)
	else if(C)
		adjust_stamina(-10)

/obj/temp_visual/coyote_jump
	duration = 1 SECONDS
	icon = 'mods/_fd/fd_assets/icons/goons/mob.dmi'
	icon_state = "sprint_cloud"
	layer = 4.5

/obj/temp_visual/coyote_jump/Initialize(mapload, set_dir)
	animate(src, pixel_y = -5, time = 5, easing = SINE_EASING | EASE_IN)
	animate(src, pixel_y = 0, time = 5, easing = SINE_EASING | EASE_IN)
	. = ..()

/obj/temp_visual/upwards_boost
	duration = 1 SECONDS
	icon = 'mods/_fd/fd_assets/icons/goons/mob.dmi'
	icon_state = "muzzle_flash_waveb"
	layer = 3.9

/obj/temp_visual/parkour_guru
	duration = 10
	layer = 3.9
	color = COLOR_CYAN

/obj/temp_visual/parkour_guru/Initialize(mapload, direction)
	dir = direction
	switch(dir)
		if(NORTH)
			animate(src, pixel_y = 192, time = 5, easing = SINE_EASING | EASE_IN)
		if(SOUTH)
			animate(src, pixel_y = -192, time = 5, easing = SINE_EASING | EASE_IN)
		if(WEST)
			animate(src, pixel_x = -192, time = 5, easing = SINE_EASING | EASE_IN)
		if(EAST)
			animate(src, pixel_x = 192, time = 5, easing = SINE_EASING | EASE_IN)

	. = ..()

/atom
	var/directional_booster = FALSE
	var/directional_helper = SOUTH

	var/upwards_booster = FALSE
	var/upwards_booster_controlled = TRUE

	var/can_attach_to = FALSE

	var/sudden_boost = FALSE

	var/mob/living/jumper

/atom/Crossed(mob/living/M)
	if(directional_booster || upwards_booster)
		attach_jumper(M)
	. = ..()

/atom/Uncrossed(mob/living/M)
	if(jumper)
		if(directional_booster)
			perform_directional_boost()
		if(upwards_booster)
			perform_upwards_boost()
	. = ..()

/atom/proc/adjust_grappling()
	var/turf/jumper_location = get_turf(jumper)
	var/shift_direction = get_dir(src,jumper_location)

	switch(shift_direction)
		if(NORTH)
			animate(jumper, pixel_y = -12, time = 3, easing = SINE_EASING | EASE_IN)
			jumper.update_surface_overlay(src, -20)
		if(SOUTH)
			animate(jumper, pixel_y = 28, time = 3, easing = SINE_EASING | EASE_IN)
			jumper.update_surface_overlay(src, 15)
		if(WEST)
			animate(jumper, pixel_x = 10, time = 3, easing = SINE_EASING | EASE_IN)
		if(EAST)
			animate(jumper, pixel_x = -10, time = 3, easing = SINE_EASING | EASE_IN)

/atom/proc/perform_directional_boost()
	if(jumper)
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

		controlled_mob.throw_at(get_ranged_target_turf(get_turf(controlled_mob), controlled_mob.dir, 5), 5, 1, controlled_mob, FALSE, new Callback(controlled_mob, TYPE_PROC_REF(/mob/living, resolve_dash)))
		addtimer(new Callback(controlled_mob, TYPE_PROC_REF(/mob/living, jump_layer_shift_end)), 4.5)

/atom/proc/perform_upwards_boost()
	set waitfor = FALSE

	if(isopenspace(GetAbove(jumper)) && jumper)
		new /obj/temp_visual/upwards_boost(get_turf(src))
		jumper.spin(4, 1)
		animate(jumper, alpha = 0, pixel_y = 64, time = 5, easing = SINE_EASING|EASE_IN)
		sleep(5)

		animate(jumper, alpha = 255, pixel_y = 0, time = 1, easing = SINE_EASING|EASE_IN)
		jumper.forceMove(GetAbove(jumper))
		sleep(5)

		if(upwards_booster_controlled && jumper)
			jumper.spin(4, 1)
			animate(jumper, alpha = 0, pixel_y = -64, time = 5, easing = SINE_EASING|EASE_IN)
			sleep(10)
			jumper.forceMove(GetBelow(jumper))
			perform_upwards_boost()
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

			controlled_mob.throw_at(get_ranged_target_turf(get_turf(controlled_mob), controlled_mob.dir, 5), 5, 1, controlled_mob, FALSE, new Callback(controlled_mob, TYPE_PROC_REF(/mob/living, resolve_dash)))
			addtimer(new Callback(controlled_mob, TYPE_PROC_REF(/mob/living, jump_layer_shift_end)), 4.5)

/atom/proc/attach_jumper(mob/living/user)
	set waitfor = FALSE

	if(!QDELETED(user.throwing))
		user.throwing.finalize(hit = FALSE, t_target = src)

	if(can_attach_to) // for objects, that can be used to climb either up or down
		jumper = user
		jumper.surface = src

		jumper.attached_to_surface = TRUE
		jumper.balloon_alert(jumper, "|ХВАТЬ!|", COLOR_WHITE)
		adjust_grappling()

		return TRUE

	if(upwards_booster) // for objects, that boost player one level higher, giving him momentum for a jump
		user.forceMove(get_turf(src))
		jumper = user
		jumper.surface = src

		jumper.attached_to_surface = TRUE
		jumper.balloon_alert(jumper, "|ПРЫГ!|", COLOR_WHITE)

		if(sudden_boost)
			perform_upwards_boost()
		return TRUE

	if(directional_booster) // for objects, that boost player forward in the specific direction
		user.forceMove(get_turf(src))
		jumper = user
		jumper.surface = src

		jumper.attached_to_surface = TRUE
		jumper.balloon_alert(jumper, "|ПРЫГ!|", COLOR_WHITE)

		if(sudden_boost)
			var/obj/temp_visual/parkour_guru/MS = new(get_turf(jumper), directional_helper)
			MS.CopyOverlays(user, TRUE)
			MS.icon = null
			MS.alpha = 150

			sleep(10)
			perform_directional_boost()
		return TRUE

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
