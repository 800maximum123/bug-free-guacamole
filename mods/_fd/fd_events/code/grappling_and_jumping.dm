/datum/keybinding/living/fd
	category = CATEGORY_FD

/mob/living/proc/fd_look_up()
	if(client && !is_physically_disabled())
		if(z_eye)
			reset_view(null)
			QDEL_NULL(z_eye)
			return
		var/turf/above = GetAbove(src)
		if(!TURF_IS_MIMICING(above)) // FD
			var/turf/near_above = get_step(above,dir) // FD
			above = near_above // FD

		if(TURF_IS_MIMICING(above))
			z_eye = new /atom/movable/z_observer/z_up(src, src)
			to_chat(src, SPAN_NOTICE("You look up."))
			reset_view(z_eye)
			return

		var/turf/T= get_turf(src)

		if(T.is_outside())// They're outside and hopefully on a planet.
			var/obj/overmap/visitable/sector/exoplanet/E = map_sectors["[T.z]"]
			if (!istype(E))
				to_chat(usr, SPAN_NOTICE("You see... things, it's hard to put into words what you're seeing specifically."))
				return

			//Weather hook here when it is a thing

			// Sun-related output.
			//Calculate time of day
			var/time_of_day = E.sun_last_process % E.daycycle
			var/afternoon = time_of_day > (E.daycycle / 2)
			var/star_name = GLOB.using_map.system_name

			var/sun_message = null
			switch(E.sun_position)
				if(0 to 0.4) // Night
					sun_message = "It is night time, [star_name] is not visible."
				if(0.4 to 0.5) // Twilight
					sun_message = "The sky is in twilight, however [star_name] is not visible."
				if(0.5 to 0.7) // Sunrise/set.
					sun_message = "[star_name] is slowly [!afternoon ? "rising from" : "setting on"] the horizon."
				if(0.7 to 0.9) // Morning/evening
					sun_message = "[star_name]'s position implies it is currently [!afternoon ? "early" : "late"] in the day."
				if(0.9 to 1.0) // Noon
					sun_message = "It's high noon. [star_name] hangs directly above you."

			to_chat(usr, SPAN_NOTICE(sun_message))
			return


		to_chat(src, SPAN_NOTICE("You can see \the [above ? above : "ceiling"]."))
	else
		to_chat(src, SPAN_NOTICE("You can't look up right now."))

/mob/living/proc/fd_look_down()
	if(client && !is_physically_disabled())
		if(z_eye)
			reset_view(null)
			QDEL_NULL(z_eye)
			return
		var/turf/T = get_turf(src)
		if(!TURF_IS_MIMICING(T)) // FD
			T = get_step(src,dir) // FD

		if(TURF_IS_MIMICING(T) && HasBelow(T.z))
			z_eye = new /atom/movable/z_observer/z_down(src, src)
			to_chat(src, SPAN_NOTICE("You look down."))
			reset_view(z_eye)
			return
		to_chat(src, SPAN_NOTICE("You can see \the [T ? T : "floor"]."))
	else
		to_chat(src, SPAN_NOTICE("You can't look below right now."))

/datum/keybinding/living/fd/look_above
	hotkey_keys = list("None")
	name = "look_above"
	full_name = "General: LOOK UP"
	description = ""

/datum/keybinding/living/fd/look_above/can_use(client/user)
	if(!isliving(user.mob))
		return FALSE

	. = ..()

/datum/keybinding/living/fd/look_above/down(client/user)
	var/mob/living/L = user.mob
	L.fd_look_up()
	return TRUE

/datum/keybinding/living/fd/look_below
	hotkey_keys = list("None")
	name = "look_below"
	full_name = "General: LOOK DOWN"
	description = ""

/datum/keybinding/living/fd/look_below/can_use(client/user)
	if(!isliving(user.mob))
		return FALSE

	. = ..()

/datum/keybinding/living/fd/look_below/down(client/user)
	var/mob/living/L = user.mob
	L.fd_look_down()
	return TRUE

/datum/keybinding/living/fd/move_above
	hotkey_keys = list("None")
	name = "move_above"
	full_name = "General: RUN UP"
	description = ""

/datum/keybinding/living/fd/move_above/can_use(client/user)
	if(!isliving(user.mob))
		return FALSE
	var/mob/living/L = user.mob

	if(L.stat != CONSCIOUS)
		return FALSE
	if(L.anchored)
		return FALSE

	if(!L.attached_to_surface || !L.surface || !L.surface.wallrun)
		return FALSE

	if(!HasAbove(L.z))
		return FALSE

	var/turf/T = GetAbove(L)
	if(!isopenspace(T))
		return FALSE

	. = ..()

/datum/keybinding/living/fd/move_above/down(client/user)
	var/mob/living/L = user.mob
	L.forceMove(GetAbove(L))
	return TRUE

/datum/keybinding/living/fd/move_below
	hotkey_keys = list("None")
	name = "move_below"
	full_name = "General: RUN DOWN"
	description = ""

/datum/keybinding/living/fd/move_below/can_use(client/user)
	if(!isliving(user.mob))
		return FALSE
	var/mob/living/L = user.mob

	if(L.stat != CONSCIOUS)
		return FALSE
	if(L.anchored)
		return FALSE

	if(!L.attached_to_surface || !L.surface || !L.surface.wallrun)
		return FALSE

	if(!HasBelow(L.z))
		return FALSE

	var/turf/T = GetBelow(L)
	if(!isopenspace(T))
		return FALSE

	. = ..()

/datum/keybinding/living/fd/move_below/down(client/user)
	var/mob/living/L = user.mob
	L.forceMove(GetBelow(L))
	return TRUE

/datum/keybinding/living/fd/dash_up
	hotkey_keys = list("None")
	name = "dash_up"
	full_name = "General: DASH DIAL UP"
	description = ""

/datum/keybinding/living/fd/dash_up/can_use(client/user)
	if(!isliving(user.mob))
		return FALSE
	var/mob/living/L = user.mob

	if(!L.preparing_to_dash)
		return FALSE

	. = ..()

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
	if(!isliving(user.mob))
		return FALSE
	var/mob/living/L = user.mob

	if(!L.preparing_to_dash)
		return FALSE

	if(L.dash_bonus_points <= 0)
		return FALSE

	. = ..()

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

	if(L.dash_bonus_points > 2)
		if(L.get_stamina() < ((L.dash_stamina_use*L.dash_bonus_points) / 2))
			return FALSE
	else
		if(L.get_stamina() < L.dash_stamina_use)
			return FALSE

	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		if(H.raft)
			return FALSE
		if(H.mob_fishing)
			return FALSE

	. = ..()

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
	var/dash_stamina_use = 10

	var/obj/screen/dash_charging_overlay/dashing_overlay

	var/attached_to_surface = FALSE
	var/atom/surface
	var/image/surface_overlay

	var/can_coyote_jump = FALSE
	var/coyote_jump_frames = 1

	var/wallrunner_stillstanding_allowed = 2

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
	if(dash_bonus_points > 2)
		adjust_stamina(-((dash_stamina_use*dash_bonus_points) / 2))
	else
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

	if((!l_hand || !r_hand) && (!attached_to_surface || !surface))
		var/turf/turf = get_step(src,dir)

		if(turf.density && turf.can_attach_to)
			turf.attach_jumper(src)

		if(!attached_to_surface || !surface)
			for(var/atom/A in turf)
				if(A.directional_booster || A.upwards_booster || A.can_attach_to || A.wallrun)
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

/mob/living/Move(a, b, flag)
	var/old_z = get_z(src)
	var/last_direction = dir
	var/turf/old_loc = get_turf(src)

	. = ..()

	if(attached_to_surface && surface && surface.can_attach_to)
		if(old_z != get_z(src) && (!l_hand || !r_hand))
			var/turf/turf = get_step(src,last_direction)
			dir = last_direction

			if(turf.density && turf.can_attach_to)
				turf.attach_jumper(src)

			if(!isopenspace(turf) && !turf.density)
				var/can_climb_onto = TRUE
				for(var/atom/A in turf)
					if(A.density)
						can_climb_onto = FALSE

				if(can_climb_onto)
					forceMove(turf)
					unattach_mob()

		else if(old_loc != get_turf(src) && old_z == get_z(src))
			unattach_mob()

/turf/simulated/open/Exited(atom/movable/Obj, atom/newloc)
	if(isliving(Obj))
		var/mob/living/L = Obj
		if(L.can_coyote_jump && !(L.in_dash == TRUE || L.attached_to_surface == TRUE))
			new /obj/temp_visual/coyote_jump(src)

	if(isopenspace(newloc) && isliving(Obj))
		var/mob/living/L = Obj
		if(L.can_coyote_jump && L.coyote_jump_frames > 0 && !(L.in_dash == TRUE || L.attached_to_surface == TRUE))
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

	density = initial(density)
	anchored = initial(anchored)

	SetTransform(null,null,null,0)

	if(surface)
		if(surface.jumper == src)
			surface.jumper = null

		if(surface.last_boosted == src)
			surface.last_boosted = null

	surface = null
	attached_to_surface = FALSE

	wallrunner_stillstanding_allowed = 2

	if(isopenspace(get_turf(src)))
		fall(get_turf(src))

/mob/living/set_dir()
	. = ..()
	if(preparing_to_dash)
		dashing_overlay.update_charging_status()

/mob/living/Life()

	if(attached_to_surface)
		check_grapple_conditions()

	if(!(in_dash == TRUE || attached_to_surface == TRUE) && isopenspace(get_turf(src)) && can_coyote_jump)
		if(coyote_jump_frames > 0)
			coyote_jump_frames = clamp(coyote_jump_frames - 1, 0, initial(coyote_jump_frames))
	if(!(in_dash == TRUE || attached_to_surface == TRUE) && can_coyote_jump && coyote_jump_frames <= 0 && isopenspace(get_turf(src)))
		fall(get_turf(src))

	. = ..()

	if(attached_to_surface && surface && surface.can_attach_to)
		density = FALSE

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

	if(surface.wallrun)
		if(wallrunner_stillstanding_allowed > 0)
			wallrunner_stillstanding_allowed = clamp(wallrunner_stillstanding_allowed - 1, 0, initial(wallrunner_stillstanding_allowed))
		if(wallrunner_stillstanding_allowed <= 0)
			unattach_mob()

	// Мы соскальзываем лишь при условии того, что нам есть куда
	var/obj/structure/fd/chasm/C = locate() in placed_on
	if(isopenspace(placed_on))
		adjust_stamina(-5)
	else if(C)
		adjust_stamina(-5)

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
	duration = 1.5 SECONDS
	icon = 'mods/_fd/fd_assets/icons/goons/mob.dmi'
	icon_state = "muzzle_flash_waveb"
	layer = 3.9

/obj/temp_visual/upwards_boost/Initialize(mapload, set_dir)
	SetTransform(1.5)
	. = ..()

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

/obj/structure/fd/parkour/wallrunning_mark

	wallrun = TRUE
	icon = 'mods/_fd/fd_assets/icons/tg/mapping_helpers.dmi'
	icon_state = "airlock_cyclelink_helper"

	invisibility = 101

	density = FALSE
	anchored = TRUE

/obj/structure/fd/parkour/jumping_platform
	upwards_booster = TRUE

	icon = 'mods/_fd/fd_assets/icons/goons/ship.dmi'
	icon_state = "chute0x"

	density = FALSE
	anchored = TRUE

/obj/structure/fd/parkour/jumping_platform/Crossed(mob/living/M)
	icon_state = "chute1"

	. = ..()

/obj/structure/fd/parkour/jumping_platform/Uncrossed(mob/living/M)
	icon_state = "chute0"
	. = ..()

/obj/structure/fd/parkour/grabbing_triangle
	directional_booster = TRUE

	icon = 'mods/_fd/fd_assets/icons/goons/instruments.dmi'
	icon_state = "triangle"

	density = FALSE
	anchored = TRUE
	layer = 4.10
	pixel_y = 18

/obj/structure/fd/parkour/grabbing_triangle/Initialize()
	. = ..()
	SetTransform(1.5)

/obj/structure/fd/parkour/grabbing_triangle/Crossed(mob/living/M)
	animate(src, pixel_y = 8, time = 3, easing = SINE_EASING | EASE_IN)

	. = ..()

/obj/structure/fd/parkour/grabbing_triangle/Uncrossed(mob/living/M)
	animate(src, pixel_y = 18, time = 3, easing = SINE_EASING | EASE_IN)
	. = ..()

/atom
	var/directional_booster = FALSE
	var/directional_helper = SOUTH

	var/upwards_booster = FALSE
	var/upwards_booster_controlled = TRUE

	var/mob/living/last_boosted

	var/can_attach_to = FALSE

	var/sudden_boost = FALSE

	var/wallrun = FALSE
	var/wallrun_direction = EAST

	var/mob/living/jumper

/atom/Crossed(mob/living/M)
	if(isliving(M) && (directional_booster || upwards_booster || wallrun))
		attach_jumper(M)
	. = ..()

/atom/Uncrossed(mob/living/M)
	if(isliving(M) && jumper && directional_booster)
		perform_directional_boost()

	if(isliving(M) && jumper && wallrun)
		M.unattach_mob()
	. = ..()

/atom/proc/adjust_grappling()
	var/turf/jumper_location = get_turf(jumper)
	var/shift_direction = get_dir(src,jumper_location)

	switch(shift_direction)
		if(NORTH)
			animate(jumper, pixel_y = -12, time = 3, easing = SINE_EASING | EASE_IN)
		if(SOUTH)
			animate(jumper, pixel_y = 28, time = 3, easing = SINE_EASING | EASE_IN)
		if(WEST)
			animate(jumper, pixel_x = 10, time = 3, easing = SINE_EASING | EASE_IN)
		if(EAST)
			animate(jumper, pixel_x = -10, time = 3, easing = SINE_EASING | EASE_IN)

/atom/proc/perform_directional_boost()
	if(jumper)
		var/mob/living/controlled_mob = jumper
		controlled_mob.pass_flags |= PASS_FLAG_TABLE
		controlled_mob.in_dash = TRUE
		controlled_mob.unattach_mob()

		controlled_mob.jump_layer_shift()
		if(controlled_mob.client)
			controlled_mob.client_jump_shift()

		animate(controlled_mob, pixel_z = 16, time = 7, easing = SINE_EASING | EASE_IN)
		animate(pixel_z = controlled_mob.default_pixel_z, time = 7, easing = SINE_EASING | EASE_OUT)

		controlled_mob.throw_at(get_ranged_target_turf(get_turf(controlled_mob), controlled_mob.dir, 5), 5, 1, controlled_mob, FALSE, new Callback(controlled_mob, TYPE_PROC_REF(/mob/living, resolve_dash)))
		addtimer(new Callback(controlled_mob, TYPE_PROC_REF(/mob/living, jump_layer_shift_end)), 4.5)

/atom/proc/perform_upwards_boost()
	if(isopenspace(GetAbove(jumper)) && jumper)
		jumper.anchored = TRUE
		new /obj/temp_visual/upwards_boost(get_turf(src))
		if(upwards_booster_controlled)
			jumper.spin(8,2)
		animate(jumper, pixel_y = 128, time = 10, easing = SINE_EASING|EASE_IN)
		sleep(5)

		if(!last_boosted)
			last_boosted = jumper
			jumper = null

		if(jumper)
			jumper.anchored = FALSE
			jumper.forceMove(GetAbove(jumper))
		if(last_boosted)
			last_boosted.anchored = FALSE
			last_boosted.forceMove(GetAbove(last_boosted))

		sleep(5)
		if(jumper)
			animate(jumper, pixel_y = 0, time = 15, easing = SINE_EASING|EASE_IN)
		if(last_boosted)
			animate(last_boosted, pixel_y = 0, time = 15, easing = SINE_EASING|EASE_IN)

		if(!upwards_booster_controlled)
			if(jumper)
				after_upwards_boost(jumper)
			if(last_boosted)
				after_upwards_boost(last_boosted)
			return TRUE

		if(last_boosted)
			if(last_boosted.surface == src)
				last_boosted.unattach_mob()
			else
				last_boosted = null

		if(jumper)
			if(jumper.surface == src)
				jumper.unattach_mob()
			else
				jumper = null

/atom/proc/after_upwards_boost(mob/living/L)
	var/mob/living/controlled_mob = L

	controlled_mob.pass_flags |= PASS_FLAG_TABLE
	controlled_mob.in_dash = TRUE
	controlled_mob.unattach_mob()

	controlled_mob.jump_layer_shift()
	if(controlled_mob.client)
		controlled_mob.client_jump_shift()

	animate(controlled_mob, pixel_z = 16, time = 7, easing = SINE_EASING | EASE_IN)
	animate(pixel_z = controlled_mob.default_pixel_z, time = 7, easing = SINE_EASING | EASE_OUT)

	controlled_mob.throw_at(get_ranged_target_turf(get_turf(controlled_mob), controlled_mob.dir, 5), 5, 1, controlled_mob, FALSE, new Callback(controlled_mob, TYPE_PROC_REF(/mob/living, resolve_dash)))
	addtimer(new Callback(controlled_mob, TYPE_PROC_REF(/mob/living, jump_layer_shift_end)), 4.5)

/atom/proc/make_wallrunner()

	switch(wallrun_direction)
		if(EAST)
			jumper.pixel_x = 17
			jumper.SetTransform(null,null,null,-15)
		if(WEST)
			jumper.pixel_x = -17
			jumper.SetTransform(null,null,null,15)
		if(NORTH)
			jumper.pixel_y = 17
			jumper.SetTransform(null,null,null,0)
		if(SOUTH)
			jumper.pixel_y = -12
			jumper.update_surface_overlay(src, -20)

/atom/proc/attach_jumper(mob/living/user)
	set waitfor = FALSE

	if(!user || !isliving(user))
		return FALSE

	if(user.surface && user.surface == src)
		return FALSE

	if(jumper)
		return FALSE

	if(get_z(user) != z)
		return FALSE

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

		if(user.loc != get_turf(src))
			user.forceMove(get_turf(src))
			return FALSE

		jumper = user
		jumper.surface = src

		jumper.attached_to_surface = TRUE
		jumper.balloon_alert(jumper, "|ПРЫГ!|", COLOR_WHITE)

		perform_upwards_boost()
		return TRUE

	if(directional_booster) // for objects, that boost player forward in the specific direction

		if(user.loc != get_turf(src))
			user.forceMove(get_turf(src))
			return FALSE

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

	if(wallrun)
		if(user.loc != get_turf(src))
			user.forceMove(get_turf(src))
			return FALSE

		jumper = user
		jumper.surface = src

		jumper.wallrunner_stillstanding_allowed = 2

		jumper.attached_to_surface = TRUE

		make_wallrunner()
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
