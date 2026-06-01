/obj/item/fd/cutscene_ep5/ghostizer
	name = "ДЛЯ НАБЛЮДЕНИЯ"
	desc = "Внеигровой айтем для становления гостом. НЕ ПОКАЗЫВАЙТЕ НИКОМУ."
	icon = 'mods/_fd/fd_assets/icons/goons/device.dmi'
	icon_state = "camera_flash"

	w_class = ITEM_SIZE_TINY

/obj/item/fd/cutscene_ep5/ghostizer/attack_self(mob/living/user as mob)

	to_chat(user, "<span class='info'>You can see... everything!</span>") // This never actually happens.
	visible_message("<span class='danger'>[user] stares into [src], their eyes glazing over.</span>")

	user.teleop = user.ghostize(1)
	announce_ghost_joinleave(user.teleop, 1, "Seems like they want to look what happening outside!")
	return

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

/obj/structure/fd/cyberspace/protective_shield/use_weapon(obj/item/weapon, mob/living/user, list/click_params)
	. = ..()
	animate(src, transform = matrix(0.8, MATRIX_SCALE), time = 0.3 SECONDS, easing = BOUNCE_EASING|EASE_OUT)
	animate(transform = matrix(1, MATRIX_SCALE), time = 0.2 SECONDS, easing = SINE_EASING|EASE_IN)

	if(health_dead)
		qdel(src)


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

			if(desc_special_show)
				balloon_alert(user, "|НА ДОСКЕ УЖЕ ЧТО-ТО ЕСТЬ!|", COLOR_RED)
				return FALSE

			var/text_to_input = input(user, "Сообщение:", "Введите сообщение, которое вы хотели бы отобразить другим на доске:", "...") as null|text
			if(!desc_special_show)
				desc_special_show = TRUE

			desc_special = {"[text_to_input]"}

			var/list/drawings = list()
			for(var/S in icon_states(icon))
				drawings[S] = icon(icon, S)

			drawing = show_radial_menu(user, src, drawings, radius = 128, require_near = TRUE)
			if(!drawing)
				drawing = "overlay_1"

			playsound(user, pick('sound/effects/pen1.ogg','sound/effects/pen2.ogg'), 10)
			AddOverlays(drawing)
			return TRUE

		if("СТЕРЕТЬ")
			if(!desc_special_show)
				balloon_alert(user, "|ЗДЕСЬ НЕЧЕГО СТИРАТЬ!|", COLOR_RED)
				return FALSE
			desc_special_show = FALSE
			desc_special = null
			CutOverlays(drawing)
			return TRUE

		if("ПРОЧИТАТЬ")
			if(!desc_special_show)
				balloon_alert(user, "|ЗДЕСЬ НЕЧЕГО ЧИТАТЬ!|", COLOR_RED)
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

	simple_damage = 6
	status_to_add = /datum/simple_status/shocked
	status_timer_to_add = 5 SECONDS

	status_apply_prob = 10

/obj/item/gun/energy/ionrifle/anti_terra
	projectile_type = /obj/item/projectile/energy/anti_terra
	fire_delay = 10

	charge_cost = 50
	max_shots = 20

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

/mob/living/simple_animal/hostile/terra
	sa_accuracy = 100

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

/obj/item/natural_weapon/terra/jumper
	name = "hands"
	attack_verb = list("smashed")
	simple_damage = 20

	hitsound = 'sound/weapons/heavysmash.ogg'

	status_to_add = /datum/simple_status/legbroke
	status_apply_prob = 50
	force = 2

/mob/living/simple_animal/hostile/terra/jumper
	name = "jumper drone"
	desc = "Overload it's shields!"

	icon = 'mods/_fd/fd_assets/icons/aurora/robots.dmi'
	icon_state = "grabber"
	icon_living = "grabber"
	icon_dead = "gib7"

	health = 999999
	maxHealth = 999999

	simple_combat_on = TRUE
	simple_health = 100
	max_simple_health = 100

	movement_cooldown = 5
	speed = -1

	base_attack_cooldown = 2 SECONDS

	ai_holder = /datum/ai_holder/simple_animal/humanoid/hostile/angry
	natural_weapon = /obj/item/natural_weapon/terra/jumper
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

	special_attack_min_range = 2
	special_attack_max_range = 8
	special_attack_cooldown = 10 SECONDS

	var/leap_warmup = 0.5 SECOND // How long the leap telegraphing is.
	var/leap_sound = 'sound/weapons/pushhiss.ogg'

/mob/living/simple_animal/hostile/terra/jumper/Initialize()
	. = ..()

	add_status_effect(/datum/simple_status/shielded/better)

/mob/living/simple_animal/hostile/terra/jumper/do_special_attack(atom/A)
	set waitfor = FALSE
	set_AI_busy(TRUE)

	// Telegraph, since getting stunned suddenly feels bad.
	do_windup_animation(A, leap_warmup)
	sleep(leap_warmup) // For the telegraphing.

	// Do the actual leap.
	status_flags |= LEAPING // Lets us pass over everything.
	visible_message(SPAN_DANGER("\The [src] leaps at \the [A]!"))
	throw_at(get_step(get_turf(A), get_turf(src)), special_attack_max_range+1, 1, src)
	playsound(src, leap_sound, 75, 1)

	sleep(5) // For the throw to complete. It won't hold up the AI ticker due to waitfor being false.

	if(status_flags & LEAPING)
		status_flags &= ~LEAPING // Revert special passage ability.

	var/turf/T = get_turf(src) // Where we landed. This might be different than A's turf.

	. = FALSE

	// Now for the stun.
	var/mob/living/victim = null
	for(var/mob/living/L in T) // So player-controlled spiders only need to click the tile to stun them.
		if(L == src)
			continue

		victim = L
		break

	if(victim)
		victim.resting = TRUE
		victim.visible_message(SPAN_DANGER("\The [src] knocks down \the [victim]!"))
		to_chat(victim, SPAN_CLASS("critical", "\The [src] jumps on you!"))
		. = TRUE

	set_AI_busy(FALSE)

/obj/item/natural_weapon/terra/grabber
	name = "hands"
	attack_verb = list("grabbed")
	simple_damage = 6

	hitsound = 'mods/_fd/mob_interactions/sounds/hug.ogg'
	force = 2

/obj/item/natural_weapon/terra/grabber/apply_hit_effect(mob/living/target, mob/living/user, hit_zone)
	if(target.simple_combat_on)

		if(!clawed)
			if(prob(clawed_chance))
				user.add_status_effect(/datum/simple_status/fixation)
				clawed_chance = initial(clawed_chance)

				target.add_status_effect(/datum/simple_status/fixation)
				clawed = target

				if(get_dist(user,clawed) > 1)
					clawed.forceMove(get_step(user, user.dir))

			else
				clawed_chance += 50

		if(clawed && clawed == target)
			clawed_time_current += 1
			if(clawed_time_current >= clawed_time_needed)
				clawed_time_current = 0

				user.remove_status_effect(/datum/simple_status/fixation)
				clawed.remove_status_effect(/datum/simple_status/fixation)
				clawed = null

		if(status_to_add)
			if(status_apply_prob > 0)
				if(prob(status_apply_prob))
					target.simple_health_calculation(simple_damage,simple_armor_penetration,1,1,user,status_to_add,status_ignore_armor,status_timer_to_add)
					return TRUE
				else
					target.simple_health_calculation(simple_damage,simple_armor_penetration,1,1,user)
					return TRUE

			else
				target.simple_health_calculation(simple_damage,simple_armor_penetration,1,1,user,status_to_add,status_ignore_armor,status_timer_to_add)
				return TRUE

		else
			target.simple_health_calculation(simple_damage,simple_armor_penetration,1,1,user)
			return TRUE

/mob/living/simple_animal/hostile/terra/grabber
	name = "grabber drone"
	desc = "Overload it's shields!"

	icon = 'mods/_fd/fd_assets/icons/aurora/robots.dmi'
	icon_state = "standart"
	icon_living = "standart"
	icon_dead = "gib7"

	health = 999999
	maxHealth = 999999

	simple_combat_on = TRUE
	simple_health = 50
	max_simple_health = 50

	movement_cooldown = 5
	speed = -1

	base_attack_cooldown = 0.5 SECONDS

	ai_holder = /datum/ai_holder/simple_animal/humanoid/hostile/angry
	natural_weapon = /obj/item/natural_weapon/terra/grabber
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

/mob/living/simple_animal/hostile/terra/grabber/Initialize()
	. = ..()

	add_status_effect(/datum/simple_status/shielded)

/mob/living/simple_animal/hostile/terra/grabber/death(gibbed, deathmessage, show_dead_message)
	. = ..()

	if(natural_weapon.clawed)
		natural_weapon.clawed_time_current = 0
		remove_status_effect(/datum/simple_status/fixation)
		natural_weapon.clawed.remove_status_effect(/datum/simple_status/fixation)
		natural_weapon.clawed = null
