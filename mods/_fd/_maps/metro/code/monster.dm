/obj/screen/fullscreen/monster_sight
	icon = 'mods/_fd/_maps/metro/icons/monster_sight.dmi'
	icon_state = "sight"
	allstate = 1
	alpha = 0

	plane = HUD_PLANE
	layer = 5.3

/obj/screen/fullscreen/monster_sight/Initialize()
	. = ..()
	animate(src, alpha = 255, time = 3, easing = SINE_EASING|EASE_IN)

/obj/screen/fullscreen/monster_sight/Destroy()
	animate(src, alpha = 0, time = 3, easing = SINE_EASING|EASE_OUT)
	. = ..()

/obj/screen/teleport_monster
	name = "ТЕЛЕПОРТ"
	desc = "Телепортирует..."
	icon = 'mods/_fd/_maps/metro/icons/monster_additional.dmi'
	icon_state = "teleport_to_trap"

	plane = HUD_PLANE
	layer = 5.4
	alpha = 0

	screen_loc = "CENTER,CENTER+2"
	var/turf/connected_turf

/obj/screen/teleport_monster/Initialize()
	. = ..()
	SetTransform(2)

	spawn(10 SECONDS)
		var/mob/living/simple_animal/metro_jeff/J = usr
		if(src in J.client.screen)
			J.client.screen -= src
		animate(src, alpha = 0, time = 3, easing = SINE_EASING|EASE_IN)

/obj/screen/teleport_monster/Click()
	var/mob/living/simple_animal/metro_jeff/J = usr

	if(!J.in_shadow)
		J.change_monster_vis()
		J.forceMove(connected_turf)
		animate(src, alpha = 0, time = 3, easing = SINE_EASING|EASE_IN)
		J.client.screen -= src
		return TRUE
	else
		J.forceMove(connected_turf)
		animate(src, alpha = 0, time = 3, easing = SINE_EASING|EASE_IN)
		J.client.screen -= src
		return TRUE

/obj/effect/trap_triggered
	name = "trap"
	desc = "trap"
	icon = 'mods/_fd/_maps/metro/icons/monster_additional.dmi'
	icon_state = "trap_triggered"
	alpha = 0
	mouse_opacity = FALSE

/obj/effect/trap_triggered/Initialize()
	. = ..()
	animate(src, alpha = 255, pixel_x = 0, pixel_y = 32, time = 1 SECOND, easing = SINE_EASING|EASE_IN)

	spawn(1.5 SECONDS)
		animate(src, alpha = 0, pixel_x = 0, pixel_y = 0, time = 1 SECOND, easing = SINE_EASING|EASE_IN)
	spawn(2 SECONDS)
		qdel(src)

/obj/structure/fd/monster_trigger
	name = "Придумай название(желательно на англ.)"
	desc = "Придумай описание"

	icon = 'mods/_fd/fd_utilities/icons/source.dmi'
	icon_state = "sound"
	invisibility = 50

	var/mob/living/simple_animal/metro_jeff/jeff
	var/obj/screen/teleport_monster/tp_button
	var/vent_off_sound = 'sound/effects/glass_crack1.ogg'
	var/should_make_sound = TRUE
	var/one_time_trigger = FALSE
	var/triggered = FALSE

/obj/structure/fd/monster_trigger/Initialize()
	. = ..()

	for(var/mob/living/simple_animal/metro_jeff/J in world)
		jeff = J

	tp_button = new /obj/screen/teleport_monster()
	tp_button.connected_turf = get_turf(src)

/obj/structure/fd/monster_trigger/Crossed(mob/living/M)
	. = ..()

	if(isliving(M) && M != jeff && !triggered)
		if(jeff.client)
			jeff.client.screen += tp_button
			animate(tp_button, alpha = 255, time = 3, easing = SINE_EASING|EASE_IN)

		new /obj/effect/trap_triggered(get_turf(src))
		if(should_make_sound)
			playsound(src, vent_off_sound, 100)
		if(one_time_trigger)
			triggered = TRUE
		return TRUE

/obj/
	var/image/revealed_mob
	var/show_mob_to_monster = FALSE

/obj/proc/show_insides()
	var/icon/T = new('mods/_fd/fd_utilities/icons/actions.dmi')
	return image(T, "revealed", layer = HUD_PLANE)

/obj/proc/show_player_inside(mob/living/user)
	revealed_mob = show_insides()
	revealed_mob.alpha = 0
	revealed_mob.plane = HUD_PLANE

	show_mob_to_monster = TRUE

	revealed_mob.loc = get_turf(src)
	animate(revealed_mob, alpha = 255, time = 3, easing = SINE_EASING|EASE_OUT)
	user.client.images += revealed_mob

/obj/proc/hide_player_inside(mob/living/user)
	if(user.client)
		animate(revealed_mob, alpha = 0, pixel_x = 0, pixel_y = -10, time = 0.3 SECOND, easing = SINE_EASING|EASE_IN)
		spawn(0.3 SECONDS)
			user.client.images -= revealed_mob
			show_mob_to_monster = FALSE

/datum/keybinding/living/fd/monster
	category = CATEGORY_FD

/datum/keybinding/living/fd/monster/can_use(client/user)
	. = ..()

	var/mob/living/L = user.mob
	if(!istype(L, /mob/living/simple_animal/metro_jeff))
		return FALSE

/datum/keybinding/living/fd/event/monster/reveal_hiding_players
	category = CATEGORY_FD_EVENT
	hotkey_keys = list("1")
	name = "reveal_hiding_players"
	full_name = "JEFF: REVEAL NEARBY"
	description = ""

/datum/keybinding/living/fd/event/monster/reveal_hiding_players/down(client/user)
	var/mob/living/simple_animal/metro_jeff/M = user.mob

	if(M.sniffing)

		M.sniffing = FALSE
		M.clear_fullscreen("eyes")
		return TRUE
	else
		M.sniffing = TRUE
		M.overlay_fullscreen("eyes", /obj/screen/fullscreen/monster_sight)
		return TRUE

/datum/keybinding/living/fd/event/monster/invisibility
	category = CATEGORY_FD_EVENT
	hotkey_keys = list("2")
	name = "invisibility"
	full_name = "JEFF: HIDE"
	description = ""

/datum/keybinding/living/fd/event/monster/invisibility/down(client/user)
	var/mob/living/simple_animal/metro_jeff/M = user.mob

	M.change_monster_vis()
	return TRUE

/datum/keybinding/living/fd/event/monster/play_aware_sound
	category = CATEGORY_FD_EVENT
	hotkey_keys = list("3")
	name = "play_aware_sound"
	full_name = "JEFF: AWARE"
	description = ""

/datum/keybinding/living/fd/event/monster/play_aware_sound/down(client/user)
	var/mob/living/simple_animal/metro_jeff/M = user.mob

	M.show_awareness()
	return TRUE

/datum/keybinding/living/fd/event/monster/become_agitated
	category = CATEGORY_FD_EVENT
	hotkey_keys = list("4")
	name = "become_agitated"
	full_name = "JEFF: SWITCH MODES"
	description = ""

/datum/keybinding/living/fd/event/monster/become_agitated/down(client/user)
	var/mob/living/simple_animal/metro_jeff/M = user.mob

	M.change_mode()
	return TRUE

/obj/screen/visibility_status
	name = "ГЛАЗ"
	desc = "Смотрит..."
	icon = 'mods/_fd/_maps/metro/icons/monster_additional.dmi'
	icon_state = "visible"

	mouse_opacity = FALSE
	alpha = 0

	plane = HUD_PLANE
	layer = 5.3

	screen_loc = "CENTER,CENTER"

/obj/item/natural_weapon/claws/metro_jeff
	name = "claws"
	attack_verb = list("mauled", "clawed", "slashed")
	force = 2

	status_to_add = /datum/simple_status/legbroke
	status_apply_prob = 30

	simple_damage = 40
	simple_armor_penetration = 40
	hitsound = 'mods/_fd/_maps/metro/jeff_sounds/smack.wav'


/mob/living/simple_animal/metro_jeff
	name = "abomination"
	desc = "Do NOT come close."
	bound_x = -16

	icon = 'mods/_fd/_maps/metro/icons/jeff.dmi'
	icon_state = "jeff"
	icon_living = "jeff"
	icon_dead = "jeff"
	var/sniffing = FALSE
	var/in_shadow = FALSE
	var/list/obj/hidespots = list()
	var/obj/screen/visibility_status/seen
	natural_weapon = /obj/item/natural_weapon/claws/metro_jeff

	var/loop_sound = 'mods/_fd/_maps/metro/jeff_sounds/ambience/body_loop_close.wav'
	var/datum/sound_token/sound_token
	var/sound_id

	var/aggro_state = FALSE // 0 - чилл, 1 - страх и ужас
	var/list/awareness_sounds = list('mods/_fd/_maps/metro/jeff_sounds/playsounds/aware_growl_01.wav',
									'mods/_fd/_maps/metro/jeff_sounds/playsounds/aware_growl_02.wav',
									'mods/_fd/_maps/metro/jeff_sounds/playsounds/aware_growl_03.wav',
									'mods/_fd/_maps/metro/jeff_sounds/playsounds/aware_growl_04.wav',
									'mods/_fd/_maps/metro/jeff_sounds/playsounds/aware_growl_05.wav',
									'mods/_fd/_maps/metro/jeff_sounds/playsounds/aware_growl_06.wav',
									'mods/_fd/_maps/metro/jeff_sounds/playsounds/aware_growl_07.wav',
									'mods/_fd/_maps/metro/jeff_sounds/playsounds/aware_growl_08.wav',
									'mods/_fd/_maps/metro/jeff_sounds/playsounds/aware_growl_09.wav',
									'mods/_fd/_maps/metro/jeff_sounds/playsounds/aware_growl_10.wav')
	var/list/alert_sounds = list('mods/_fd/_maps/metro/jeff_sounds/playsounds/alert_01.wav',
								'mods/_fd/_maps/metro/jeff_sounds/playsounds/alert_02.wav',
								'mods/_fd/_maps/metro/jeff_sounds/playsounds/alert_03.wav',
								'mods/_fd/_maps/metro/jeff_sounds/playsounds/alert_04.wav',
								'mods/_fd/_maps/metro/jeff_sounds/playsounds/alert_05.wav',
								'mods/_fd/_maps/metro/jeff_sounds/playsounds/alert_06.wav',
								'mods/_fd/_maps/metro/jeff_sounds/playsounds/alert_07.wav',
								'mods/_fd/_maps/metro/jeff_sounds/playsounds/alert_08.wav',
								'mods/_fd/_maps/metro/jeff_sounds/playsounds/alert_09.wav')

	var/list/random_passive_sounds = list('mods/_fd/_maps/metro/jeff_sounds/ambience/wander_breath_in_01.wav',
										'mods/_fd/_maps/metro/jeff_sounds/ambience/wander_breath_in_02.wav',
										'mods/_fd/_maps/metro/jeff_sounds/ambience/wander_breath_in_03.wav',
										'mods/_fd/_maps/metro/jeff_sounds/ambience/wander_breath_in_04.wav',
										'mods/_fd/_maps/metro/jeff_sounds/ambience/wander_breath_in_05.wav',
										'mods/_fd/_maps/metro/jeff_sounds/ambience/wander_breath_out_04.wav',
										'mods/_fd/_maps/metro/jeff_sounds/ambience/wander_breath_out_05.wav',
										'mods/_fd/_maps/metro/jeff_sounds/ambience/wander_breath_out_06.wav',
										'mods/_fd/_maps/metro/jeff_sounds/ambience/wander_breath_out_07.wav',
										'mods/_fd/_maps/metro/jeff_sounds/ambience/wander_breath_out_08.wav')
	var/next_random_sound_in = 50
	var/base_sound_freq = 50

	var/list/movement_sound_list = list('mods/_fd/_maps/metro/jeff_sounds/moving/step_01.wav',
										'mods/_fd/_maps/metro/jeff_sounds/moving/step_02.wav',
										'mods/_fd/_maps/metro/jeff_sounds/moving/step_03.wav',
										'mods/_fd/_maps/metro/jeff_sounds/moving/step_04.wav',
										'mods/_fd/_maps/metro/jeff_sounds/moving/step_05.wav',
										'mods/_fd/_maps/metro/jeff_sounds/moving/step_06.wav',
										'mods/_fd/_maps/metro/jeff_sounds/moving/step_07.wav')
	var/list/aggro_movement_sound_list = list('mods/_fd/_maps/metro/jeff_sounds/moving/step_close_01.wav',
										'mods/_fd/_maps/metro/jeff_sounds/moving/step_close_02.wav',
										'mods/_fd/_maps/metro/jeff_sounds/moving/step_close_03.wav',
										'mods/_fd/_maps/metro/jeff_sounds/moving/step_close_04.wav',
										'mods/_fd/_maps/metro/jeff_sounds/moving/step_close_05.wav',
										'mods/_fd/_maps/metro/jeff_sounds/moving/step_close_06.wav',
										'mods/_fd/_maps/metro/jeff_sounds/moving/step_close_07.wav',
										'mods/_fd/_maps/metro/jeff_sounds/moving/step_close_08.wav',
										'mods/_fd/_maps/metro/jeff_sounds/moving/step_close_09.wav')
	movement_sound = 'mods/_fd/_maps/metro/jeff_sounds/moving/step_01.wav'

	simple_health = 1000
	max_simple_health = 1000

	simple_armor_natural = 50

	need_to_breath = FALSE
	health = 999999
	maxHealth = 999999

	movement_cooldown = 6

	var/sound_shutoff = FALSE

/mob/living/simple_animal/metro_jeff/Initialize()
	. = ..()
	set_light(3, 2, l_color = "#00f7ff", angle = LIGHT_WIDE)
	seen = new /obj/screen/visibility_status()

/mob/living/simple_animal/metro_jeff/SelfMove(turf/n, direct, movetime)
	if(sound_shutoff)
		movement_sound = null

	. = ..()

	if(!sound_shutoff)
		if(aggro_state)
			movement_sound = pick(aggro_movement_sound_list)
		else
			movement_sound = pick(movement_sound_list)

/mob/living/simple_animal/metro_jeff/Life()

	update_loopsound()
	layer = 4.11

	if(in_shadow)
		plane = EFFECTS_ABOVE_LIGHTING_PLANE
		set_see_in_dark(5)

	if(!aggro_state && !sound_shutoff)
		if(next_random_sound_in > 0)
			next_random_sound_in -= 1

		if(next_random_sound_in <= 0)
			next_random_sound_in = base_sound_freq
			new /obj/effect/jeff_sounds(src.loc)
			playsound(src, pick(random_passive_sounds), 50, 0, extrarange = 13, falloff = 2)

	if(client)

		if(sniffing)
			for(var/obj/A in view(src.loc))
				if(A.hidden_mob && !A.show_mob_to_monster)
					A.show_player_inside(src)
					hidespots += A
				if(!A.hidden_mob && A.show_mob_to_monster)
					A.hide_player_inside(src)

		if(!sniffing)
			for(var/obj/A in hidespots)
				if(A.hidden_mob && A.show_mob_to_monster)
					A.hide_player_inside(src)

		if(!in_shadow)
			for(var/obj/machinery/light/light in orange(20,src))
				light.flicker(1)

	. = ..()

/mob/living/simple_animal/metro_jeff/proc/update_loopsound()
	if(!sound_id)
		sound_id = "[type]_[sequential_id(/mob/living/simple_animal/metro_jeff)]"

	if(!sound_shutoff)
		if(!sound_token)
			sound_token = GLOB.sound_player.PlayLoopingSound(src, sound_id, loop_sound, volume = 3)

		sound_token.SetVolume(3)

	else if(sound_token)
		QDEL_NULL(sound_token)

/mob/living/simple_animal/metro_jeff/proc/change_monster_vis()
	if(!in_shadow)
		if(client)
			client.screen += seen
			animate(seen, alpha = 255, time = 3, easing = SINE_EASING|EASE_IN)
			spawn(1 SECONDS)
				seen.icon_state = "invisible"
			spawn(3 SECONDS)
				animate(seen, alpha = 0, time = 3, easing = SINE_EASING|EASE_IN)

		in_shadow = TRUE
		sound_shutoff = TRUE

		density = FALSE

		aggro_state = FALSE
		movement_cooldown = 6

		set_light(0)
		set_invisibility(INVISIBILITY_OBSERVER)
		AddMovementHandler(/datum/movement_handler/mob/incorporeal)
		add_filter("invisible_monster", 1, list("type" = "outline", , "size" = 1, "color" = COLOR_WHITE))
		return TRUE
	else
		if(client)
			animate(seen, alpha = 255, time = 3, easing = SINE_EASING|EASE_IN)
			spawn(1 SECONDS)
				seen.icon_state = "visible"
			spawn(3 SECONDS)
				animate(seen, alpha = 0, time = 3, easing = SINE_EASING|EASE_IN)
			spawn(3.5 SECONDS)
				client.screen -= seen

		plane = initial(plane)

		density = TRUE

		in_shadow = FALSE
		sound_shutoff = FALSE
		set_light(3, 2, l_color = "#00f7ff", angle = LIGHT_WIDE)
		set_invisibility(0)
		RemoveMovementHandler(/datum/movement_handler/mob/incorporeal)
		remove_filter("invisible_monster")
		return TRUE

/obj/effect/jeff_sounds
	icon = 'mods/_fd/fd_utilities/icons/newsource.dmi'
	icon_state = "sound"
	layer = SPEECH_INDICATOR_LAYER
	plane = EFFECTS_ABOVE_LIGHTING_PLANE
	mouse_opacity = FALSE
	alpha = 0

/obj/effect/jeff_sounds/Initialize()
	. = ..()
	animation()

/obj/effect/jeff_sounds/proc/animation()

	animate(src, 1 SECOND, alpha = 255, flags = ANIMATION_PARALLEL)
	animate(src, pixel_y = 96, alpha = 0, time = 5 SECONDS, easing = SINE_EASING | EASE_OUT, flags = ANIMATION_PARALLEL)

	QDEL_IN(src, 6 SECONDS)

/mob/living/simple_animal/metro_jeff/proc/show_awareness()

	playsound(src, pick(awareness_sounds), 50, 0, extrarange = 13, falloff = 2)

	new /obj/effect/jeff_sounds(src.loc)

	plane = EFFECTS_ABOVE_LIGHTING_PLANE
	add_filter("jeffshow", 1, list("type" = "outline", , "size" = 1, "color" = COLOR_GRAY))

	addtimer(new Callback(src, PROC_REF(hide_awareness)), 5 SECONDS)

/mob/living/simple_animal/metro_jeff/proc/hide_awareness()
	plane = initial(plane)
	remove_filter("jeffshow")

/mob/living/simple_animal/metro_jeff/proc/change_mode()
	if(aggro_state)
		aggro_state = FALSE
		movement_cooldown = 6
		set_light(3, 2, l_color = "#00f7ff", angle = LIGHT_WIDE)
		return TRUE

	if(!aggro_state)
		aggro_state = TRUE
		movement_cooldown = 4

		playsound(src, pick(alert_sounds), 50, 0, extrarange = 13, falloff = 2)

		new /obj/effect/jeff_sounds(src.loc)

		plane = EFFECTS_ABOVE_LIGHTING_PLANE
		add_filter("jeffangry", 1, list("type" = "outline", , "size" = 1, "color" = COLOR_RED))

		set_light(6, 2, l_color = "#ff0000", angle = LIGHT_NARROW)

		addtimer(new Callback(src, PROC_REF(remove_some_visuals)), 5 SECONDS)
		return TRUE

/mob/living/simple_animal/metro_jeff/proc/remove_some_visuals()
	plane = initial(plane)
	remove_filter("jeffangry")
