/turf/simulated/floor/exoplanet/fd/cyberspace
	name = "..."
	desc = "This is wrong."
	icon = 'mods/_fd/fd_assets/icons/goons/featherzone.dmi'
	icon_state = "floor"

/turf/simulated/floor/exoplanet/fd/cyberspace/animated
	icon_state = "empty"

/turf/simulated/floor/exoplanet/fd/cyberspace/animated/Entered(mob/living/L)
	. = ..()

	if(icon_state != "spawn-wall_dark" && isliving(L))
		icon_state = "spawn-wall_dark"
		addtimer(new Callback(src, PROC_REF(collapse)), 4 SECONDS)

/turf/simulated/floor/exoplanet/fd/cyberspace/animated/proc/collapse()
	var/list/mob/living/mob_in_tile = list()
	for(var/mob/living/L in contents)
		mob_in_tile += L

	if(length(mob_in_tile))
		addtimer(new Callback(src, PROC_REF(collapse)), 4 SECONDS)
		return

	else
		icon_state = "spawn-wall_dark_collapse"

/obj/structure/fd/topdown_walls/cyberspace
	icon = 'mods/_fd/fd_assets/icons/goons/featherzone.dmi'
	icon_state = "0"

/obj/structure/fd/cyberspace
	anchored = TRUE
	mouse_opacity = FALSE

	icon = 'mods/_fd/fd_assets/icons/goons/featherzone.dmi'
	icon_state = "0"

/obj/structure/fd/cyberspace/scanline
	icon = 'icons/effects/effects.dmi'
	icon_state = "malf-scanline"

/obj/structure/fd/cyberspace/protective_shield
	health_max = 100
	icon_state = "cage"
	opacity = TRUE
	density = TRUE
	mouse_opacity = TRUE

	layer = 4.09

/obj/structure/fd/cyberspace/protective_shield/damage_health(damage, damage_type, damage_flags, severity, skip_can_damage_check)
	. = ..()

	animate(src, transform = matrix(0.8, MATRIX_SCALE), time = 0.3 SECONDS, easing = BOUNCE_EASING|EASE_OUT)
	animate(src, transform = matrix(1, MATRIX_SCALE), time = 0.2 SECONDS, easing = SINE_EASING|EASE_IN)

/obj/structure/fd/cyberspace/protective_shield/seethrough
	opacity = FALSE
	icon_state = "barricade-0"

/obj/structure/fd/random_junk/music_station
	name = "old music station"
	desc = "Still usable."
	icon = 'mods/_fd/fd_assets/icons/goons/radiostation.dmi'
	icon_state = "portable_record"

	anchored = TRUE
	density = TRUE

/obj/structure/fd/random_junk/music_additional
	name = "machinery"
	desc = "To work with sounds."
	icon = 'mods/_fd/fd_assets/icons/goons/loudspeakers.dmi'
	icon_state = "amp_stack"

	anchored = TRUE
	density = TRUE

/obj/structure/fd/random_junk/goon_graffiti
	name = "graffiti"
	desc = "So calles street-art."
	icon = 'mods/_fd/fd_assets/icons/goons/graffiti.dmi'
	icon_state = "graffiti-single-13"

	anchored = TRUE

/obj/item/fd/random_junk/music_disks
	name = "record"
	desc = "Stores sounds inside."
	icon = 'mods/_fd/fd_assets/icons/goons/radiostation.dmi'
	icon_state = "sleeve_1"

	w_class = ITEM_SIZE_NORMAL

/obj/item/fd/random_junk/simple_disks
	name = "disk"
	desc = "Stores information inside."
	icon = 'mods/_fd/fd_assets/icons/goons/disks.dmi'
	icon_state = "datadiskmed"

	w_class = ITEM_SIZE_SMALL

/obj/item/fd/random_junk/music_devices
	name = "device"
	desc = "With this thing you are going to make some music."
	icon = 'mods/_fd/fd_assets/icons/goons/device.dmi'
	icon_state = "micstand"

	w_class = ITEM_SIZE_NORMAL

/obj/structure/fd/random_junk/whiteboard
	name = "machinery"
	desc = "To work with sounds."
	icon = 'mods/_fd/fd_assets/icons/aurora/whiteboard.dmi'
	icon_state = "whiteboard"

	interactive = TRUE

	anchored = TRUE
	density = TRUE

	bound_width = 64
	var/drawing = "bleh"

/obj/structure/fd/random_junk/whiteboard/interact_with(mob/living/user)

	var/list/options = list(
		"НАПИСАТЬ" = image('mods/_fd/_maps/collective_nightmare/icons/radial.dmi', "radial_modify"),
		"СТЕРЕТЬ" = image('mods/_fd/_maps/collective_nightmare/icons/radial.dmi', "radial_reset"),
		"ПРОЧИТАТЬ" = image('mods/_fd/_maps/collective_nightmare/icons/radial.dmi', "radial_examine"),
	)
	var/chosen_option = show_radial_menu(user, src, options, radius = 25, require_near = TRUE)
	if(!chosen_option)
		return FALSE
	switch(chosen_option)
		if("НАПИСАТЬ")

			desc_special = input(user, "Сообщение:", "Введите сообщение, которое вы хотели бы отобразить другим на доске:", "...") as null|text
			if(!desc_special_show)
				desc_special_show = TRUE

			var/list/drawings = list()
			for(var/S in icon_states(icon))
				drawings[S] = icon(icon, S)

			drawing = show_radial_menu(user, src, drawings, radius = 128, require_near = TRUE)
			if(!drawing)
				drawing = "overlay_1"

			playsound(user, pick('sound/effects/pen1.ogg','sound/effects/pen2.ogg'), 10)
			AddOverlays(image('mods/_fd/fd_assets/icons/aurora/whiteboard.dmi', drawing))
			return TRUE

		if("СТЕРЕТЬ")
			desc_special_show = FALSE
			desc_special = null
			CutOverlays(image('mods/_fd/fd_assets/icons/aurora/whiteboard.dmi', drawing))
			return TRUE

		if("ПРОЧИТАТЬ")
			if(!desc_special_show)
				return FALSE

			. = ..()
			return TRUE

/mob/living/simple_animal/fd/robofriend
	universal_speak = TRUE
	universal_understand = TRUE

	name = "F.r.i.e.n.d."
	desc = "Your best and only friend!"

	icon = 'mods/_fd/fd_assets/icons/aurora/robots.dmi'
	icon_state = "plantasonic_engi"
	icon_living = "plantasonic_engi"
	icon_dead = "plantasonic_engi"
	ai_holder = null

/obj/item/projectile/energy/terra
	icon = 'mods/_fd/fd_assets/icons/goons/projectiles.dmi'
	icon_state = "taser_projectile-big"

	simple_damage = 5
	status_to_add = /datum/simple_status/shocked
	status_timer_to_add = 5 SECONDS

	status_apply_prob = 10

/obj/item/gun/energy/ionrifle/anti_terra
	projectile_type = /obj/item/projectile/energy/anti_terra
	fire_delay = 30

	charge_cost = 50
	max_shots = 10

/obj/item/projectile/energy/anti_terra
	icon = 'mods/_fd/fd_assets/icons/goons/projectiles.dmi'
	icon_state = "pulse"

	simple_damage = 0
	status_to_add = /datum/simple_status/discharge
	status_timer_to_add = 10 SECONDS
	status_ignore_armor = TRUE
	step_delay = 0.35

/mob/living
	var/robotic = FALSE

/mob/living/simple_animal/hostile/terra/ranger
	name = "ranger drone"
	desc = "Overload it's shields!"

	icon = 'mods/_fd/fd_assets/icons/aurora/robots.dmi'
	icon_state = "ranger"
	icon_living = "ranger"
	icon_dead = "gib7"

	health = 999999
	maxHealth = 999999

	simple_combat_on = TRUE
	simple_health = 10
	max_simple_health = 10

	movement_cooldown = 5
	speed = -1

	ranged = TRUE
	base_attack_cooldown = 1 SECONDS
	projectiletype = /obj/item/projectile/energy/terra
	projectilesound = 'sound/magic/mm_hit.ogg'

	needs_reload = TRUE
	reload_max = 5
	reload_time = 5 SECONDS
	reload_sound = 'sound/machines/defib_charge.ogg'

	ai_holder = /datum/ai_holder/simple_animal/humanoid/hostile/angry
	faction = "terra"

	meat_type = null
	meat_amount = 0
	bone_material = null
	bone_amount = 0
	skin_material = null
	skin_amount = 0

	min_gas = null
	max_gas = null
	minbodytemp = 0

	robotic = TRUE
	bleed_colour = COLOR_BLACK

/mob/living/simple_animal/hostile/terra/ranger/Initialize()
	. = ..()

	add_status_effect(/datum/simple_status/shielded)
