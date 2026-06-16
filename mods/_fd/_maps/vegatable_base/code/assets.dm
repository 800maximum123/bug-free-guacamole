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
	var/image/drawing

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

			var/drawing_state = show_radial_menu(user, src, drawings, radius = 128, require_near = TRUE)
			if(!drawing_state)
				drawing_state = "overlay_1"

			drawing = image(icon, icon_state = "[drawing_state]")

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

	self_recharge = 1
	recharge_time = 20

/obj/item/projectile/energy/anti_terra
	icon = 'mods/_fd/fd_assets/icons/goons/projectiles.dmi'
	icon_state = "pulse"

	simple_damage = 0
	status_to_add = /datum/simple_status/discharge
	status_timer_to_add = 10 SECONDS
	status_ignore_armor = TRUE
	step_delay = 0.35

/obj/item/fd/simple_grenade
	name = "grenade"
	icon_state = "timer-igniter-tank0"
	var/active_state = "timer-igniter-tank2"
	icon = 'mods/_fd/fd_assets/icons/goons/assemblies.dmi'

	var/primed = FALSE
	var/life_span = 5
	var/grenade_type = /obj/effect/simple_grenade/basic

	var/has_motion_sensor = FALSE
	var/motion_sensor_triggered = FALSE
	var/faction = "neutral"
	var/premade_faction = "neutral"

	var/drop_from_the_sky = FALSE // НЕ ставить минам
	var/fallspeed = 0.8 SECONDS

	var/show_activation_status = TRUE

	throw_range = 10
	w_class = ITEM_SIZE_SMALL

/obj/item/fd/simple_grenade/Initialize()
	. = ..()

	if(drop_from_the_sky)
		alpha = 0
		pixel_y = 128
		layer = 4.14
		SetTransform(3)

		animate(src, transform = matrix(1, MATRIX_SCALE), pixel_y = 0, alpha = 255, time = fallspeed, easing = SINE_EASING|EASE_OUT, ANIMATION_PARALLEL)
		spawn(fallspeed)
			layer = initial(layer)

			primed = TRUE
			if(show_activation_status)
				add_filter("active", 1, list("type" = "outline", , "size" =1, "color" = COLOR_WHITE))
			START_PROCESSING(SSobj,src)
			icon_state = active_state

	if(primed && !drop_from_the_sky)
		if(show_activation_status)
			add_filter("active", 1, list("type" = "outline", , "size" =1, "color" = COLOR_WHITE))
		START_PROCESSING(SSobj,src)

		if(has_motion_sensor)
			alpha = 100
			anchored = TRUE
			faction = premade_faction
		else
			icon_state = active_state

	if(life_span <= 0)
		qdel(src)

/obj/item/fd/simple_grenade/attack_hand(mob/user)
	if(has_motion_sensor && primed && !motion_sensor_triggered)
		if(do_after(user, 5 SECONDS, src, DO_PUBLIC_UNIQUE))
			alpha = 255
			anchored = FALSE
			user.put_in_active_hand(src)

			primed = FALSE

			life_span = initial(life_span)
			icon_state = initial(icon_state)
			maptext = ""
			remove_filter("active")
			STOP_PROCESSING(SSobj,src)
			motion_sensor_triggered = FALSE
		return

	. = ..()

/obj/item/fd/simple_grenade/attack_self(mob/user)
	. = ..()

	if(primed)
		primed = FALSE
		life_span = initial(life_span)
		icon_state = initial(icon_state)
		maptext = ""
		remove_filter("active")
		STOP_PROCESSING(SSobj,src)
		return TRUE

	if(!primed)
		primed = TRUE
		if(show_activation_status)
			add_filter("active", 1, list("type" = "outline", , "size" =1, "color" = COLOR_WHITE))
		START_PROCESSING(SSobj,src)

		if(has_motion_sensor)
			user.drop_from_inventory(src)
			alpha = 100
			anchored = TRUE
			faction = user.faction
		else
			icon_state = active_state
		return TRUE

/obj/item/fd/simple_grenade/Process()

	if(life_span <= 0)
		qdel(src)

	if(has_motion_sensor) // это мина?
		var/list/mob/living/targets = list()
		for(var/mob/living/L in view(1,src)) // в радиусе трёх тайлов ЗРЕНИЯ есть противник?
			if(L.faction == faction)
				continue
			if(L.stat != CONSCIOUS)
				continue
			targets += L // добавляем его в лист
		if(length(targets) && icon_state != active_state) // если в листе есть хоть кто-то и мы ещё не тикаем - пора начинать
			animate(src, alpha = 255, time = 5, easing = LINEAR_EASING)
			icon_state = active_state
			motion_sensor_triggered = TRUE

		if(primed && motion_sensor_triggered)

			life_span -= 1
			if(show_activation_status)
				maptext = STYLE_SMALLFONTS_OUTLINE("[life_span]", 7, COLOR_WHITE, COLOR_BLACK)

				animate(src, pixel_y = 5, time = 8, easing = SINE_EASING | EASE_IN)
				animate(pixel_y = 0, time = 3, easing = SINE_EASING | EASE_OUT)

	else
		life_span -= 1
		if(show_activation_status)
			maptext = STYLE_SMALLFONTS_OUTLINE("[life_span]", 7, COLOR_WHITE, COLOR_BLACK)

			animate(src, pixel_y = 5, time = 8, easing = SINE_EASING | EASE_IN)
			animate(pixel_y = 0, time = 3, easing = SINE_EASING | EASE_OUT)

/obj/item/fd/simple_grenade/Destroy()

	if(isturf(src.loc))
		new grenade_type(get_turf(src))

	if(ismob(src.loc))
		var/mob/living/L = loc
		new grenade_type(get_turf(L))
	. = ..()

/obj/item/fd/simple_grenade/anti_terra
	name = "grenade"
	icon_state = "cryo"
	active_state = "cryo1"
	icon = 'mods/_fd/fd_assets/icons/goons/grenade.dmi'

	grenade_type = /obj/effect/simple_grenade/anti_terra

/obj/item/fd/simple_grenade/shock_mine
	name = "mine"
	icon_state = "powersink0"
	active_state = "powersink1"
	icon = 'mods/_fd/fd_assets/icons/goons/device.dmi'

	life_span = 1
	grenade_type = /obj/effect/simple_grenade/shock

	has_motion_sensor = TRUE
	throw_range = 5
	w_class = ITEM_SIZE_LARGE

/obj/item/fd/simple_grenade/neuro_drop
	name = "canister"
	icon_state = "black"
	active_state = "black-1"
	icon = 'mods/_fd/fd_assets/icons/goons/atmos.dmi'

	life_span = 2
	grenade_type = /obj/effect/simple_grenade/neuro

	drop_from_the_sky = TRUE
	show_activation_status = FALSE

/obj/effect/simple_grenade
	icon = null
	var/trigger_delay = 0.3 SECONDS
	var/splash_zone = 1
	var/zone_color = COLOR_WHITE
	var/explosion_sound = "explosion"

/obj/effect/simple_grenade/Initialize()
	. = ..()
	bomb_trigger()

/obj/effect/simple_grenade/proc/bomb_trigger()
	set waitfor = FALSE

	playsound(get_turf(src), explosion_sound, 50, TRUE, falloff = 2)

	for(var/floor in RANGE_TURFS(src, splash_zone))
		new /obj/effect/danger_area(floor, zone_color, trigger_delay)
		bomb_effect(floor)

/obj/effect/simple_grenade/proc/bomb_effect(turf/where_to_check)
	return

/obj/effect/simple_grenade/basic
	splash_zone = 2
	zone_color = COLOR_RED

/obj/effect/simple_grenade/basic/bomb_trigger()
	new /obj/effect/simple_combat_particle/explosion(get_turf(src))
	. = ..()

/obj/effect/simple_grenade/basic/bomb_effect(turf/where_to_check)
	set waitfor = FALSE

	sleep(trigger_delay)

	for(var/mob/living/mobik in where_to_check)
		if(!mobik.simple_combat_on)
			continue
		shake_camera_MARINE(mobik, steps = 2, strength = 2, time_per_step = 2)
		mobik.simple_health_calculation(rand(20,30), 10, 1, 0)

	QDEL_IN(src, 4 SECONDS)

/obj/effect/simple_grenade/anti_terra
	splash_zone = 1
	zone_color = COLOR_CYAN

/obj/effect/simple_grenade/anti_terra/bomb_trigger()
	new /obj/effect/simple_combat_particle/explosion(get_turf(src))
	. = ..()

/obj/effect/simple_grenade/anti_terra/bomb_effect(turf/where_to_check)
	set waitfor = FALSE

	sleep(trigger_delay)

	for(var/mob/living/mobik in where_to_check)
		if(!mobik.simple_combat_on)
			continue

		shake_camera_MARINE(mobik, steps = 2, strength = 2, time_per_step = 2)

		if(!mobik.robotic)
			mobik.simple_health_calculation(rand(5,10), 0, 0, 0)
		else
			mobik.add_status_effect(/datum/simple_status/discharge, 15 SECONDS)

	QDEL_IN(src, 4 SECONDS)

/obj/effect/simple_grenade/shock
	splash_zone = 2
	zone_color = COLOR_YELLOW

/obj/effect/simple_grenade/shock/bomb_trigger()
	new /obj/effect/simple_combat_particle/explosion(get_turf(src))
	. = ..()

/obj/effect/simple_grenade/shock/bomb_effect(turf/where_to_check)
	set waitfor = FALSE

	sleep(trigger_delay)

	for(var/mob/living/mobik in where_to_check)
		if(!mobik.simple_combat_on)
			continue

		mobik.add_status_effect(/datum/simple_status/shocked, 10 SECONDS)
		mobik.add_status_effect(/datum/simple_status/fixation/timed, 5 SECONDS)

	QDEL_IN(src, 4 SECONDS)

/obj/temp_visual/smoke_fd
	icon_state = "smoke wall"
	anchored = TRUE
	opacity = FALSE
	layer = ABOVE_HUMAN_LAYER
	icon = 'icons/effects/smoke.dmi'
	icon_state = "smoke"
	pixel_x = -9
	pixel_y = -6
	duration = 5 SECONDS
	color = COLOR_DARK_GREEN_GRAY
	var/do_scaling_animation = TRUE

/obj/temp_visual/smoke_fd/Initialize(mapload, set_dir)
	if(do_scaling_animation)
		SetTransform(0)
		animate(src, transform = matrix(3, MATRIX_SCALE), time = 4 SECONDS, easing = SINE_EASING|EASE_OUT, ANIMATION_PARALLEL)

	animate(src, alpha = 255, time = 3 SECONDS, easing = SINE_EASING|EASE_OUT, ANIMATION_PARALLEL)
	spawn(3 SECONDS)
		animate(src, alpha = 0, time = 2 SECONDS, easing = SINE_EASING|EASE_IN, ANIMATION_PARALLEL)
	. = ..()

/obj/effect/simple_grenade/neuro
	splash_zone = 2
	zone_color = COLOR_GREEN

/obj/effect/simple_grenade/neuro/bomb_trigger()
	new /obj/effect/simple_combat_particle/explosion(get_turf(src))
	. = ..()

/obj/effect/simple_grenade/neuro/bomb_effect(turf/where_to_check)
	set waitfor = FALSE

	sleep(trigger_delay)

	for(var/floor in RANGE_TURFS(src, splash_zone))
		new /obj/temp_visual/smoke_fd(floor)

	for(var/mob/living/mobik in where_to_check)
		if(!mobik.simple_combat_on)
			continue

		mobik.simple_health_calculation(rand(5,10), 0, 0, 0)
		mobik.add_status_effect(/datum/simple_status/poison, 15 MINUTES)

	QDEL_IN(src, 4 SECONDS)

/////////////////////////////////////////

/mob/living/simple_animal/hostile/terra
	sa_accuracy = 100

/mob/living/simple_animal/hostile/terra/ranger
	name = "ranger drone"
	desc = "Overload it's shields!"

	icon = 'mods/_fd/fd_assets/icons/ranger.dmi'
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

	pass_flags = PASS_FLAG_TABLE

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
	simple_damage = 15

	hitsound = 'sound/weapons/heavysmash.ogg'

	status_to_add = /datum/simple_status/legbroke
	status_apply_prob = 50
	force = 2

/obj/item/natural_weapon/terra/jumper/apply_hit_effect(mob/living/target, mob/living/user, hit_zone)
	if(target.simple_combat_on)

		if(!clawed && !(target.kaiju || istype(target,/mob/living/simple_animal/simple_mecha)))
			if(prob(clawed_chance))
				user.add_status_effect(/datum/simple_status/fixation)
				clawed_chance = initial(clawed_chance)

				target.add_status_effect(/datum/simple_status/fixation)
				clawed = target

				clawed.forceMove(get_turf(src))
				clawed.dir = SOUTH
				user.dir = SOUTH

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

/mob/living/simple_animal/hostile/terra/jumper/Life()
	. = ..()

	if(natural_weapon.clawed)
		if(natural_weapon.clawed.stat != CONSCIOUS || natural_weapon.clawed.get_status_effect(/datum/simple_status/hardcrit))
			natural_weapon.clawed_time_current = 0
			remove_status_effect(/datum/simple_status/fixation)
			natural_weapon.clawed.remove_status_effect(/datum/simple_status/fixation)
			natural_weapon.clawed = null

		layer = 4.12

		natural_weapon.clawed.dir = SOUTH
		dir = SOUTH

/mob/living/simple_animal/hostile/terra/jumper
	name = "jumper drone"
	desc = "Overload it's shields!"

	icon = 'mods/_fd/fd_assets/icons/jumper.dmi'
	icon_state = "jumper"
	icon_living = "jumper"
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

/mob/living/simple_animal/hostile/terra/jumper/death(gibbed, deathmessage, show_dead_message)
	. = ..()

	if(natural_weapon.clawed)
		natural_weapon.clawed_time_current = 0
		remove_status_effect(/datum/simple_status/fixation)
		natural_weapon.clawed.remove_status_effect(/datum/simple_status/fixation)
		natural_weapon.clawed = null

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

	if(victim && !(victim.kaiju || istype(victim,/mob/living/simple_animal/simple_mecha)))
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

		if(!clawed && !(target.kaiju || istype(target,/mob/living/simple_animal/simple_mecha)))
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

	icon = 'mods/_fd/fd_assets/icons/grabber.dmi'
	icon_state = "grabber"
	icon_living = "grabber"
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


/mob/living/simple_animal/hostile/terra/grabber/Life()
	. = ..()

	if(natural_weapon.clawed)
		if(natural_weapon.clawed.stat != CONSCIOUS || natural_weapon.clawed.get_status_effect(/datum/simple_status/hardcrit))
			natural_weapon.clawed_time_current = 0
			remove_status_effect(/datum/simple_status/fixation)
			natural_weapon.clawed.remove_status_effect(/datum/simple_status/fixation)
			natural_weapon.clawed = null

/mob/living/simple_animal/hostile/terra/grabber/death(gibbed, deathmessage, show_dead_message)
	. = ..()

	if(natural_weapon.clawed)
		natural_weapon.clawed_time_current = 0
		remove_status_effect(/datum/simple_status/fixation)
		natural_weapon.clawed.remove_status_effect(/datum/simple_status/fixation)
		natural_weapon.clawed = null

/////////////////////////////////////////

#define ICON_SIZE_ALL 32
/// The X/Width dimension of ICON_SIZE. This will more than likely be the bigger axis.
#define ICON_SIZE_X 32
/// The Y/Height dimension of ICON_SIZE. This will more than likely be the smaller axis.
#define ICON_SIZE_Y 32

/obj/item/fd/turret_undeployed
	name = "compacted weapon"
	desc = "For easier transportation."
	icon = 'mods/_fd/fd_assets/icons/goons/deployableturret.dmi'
	icon_state = "turret_undeployed"
	slot_flags = SLOT_BACK

	item_icons = list(
		slot_back_str = 'mods/_fd/_maps/metro/icons/cool_weapon.dmi')
	item_state_slots = list(
		slot_back_str = "weapon_onback")

	var/obj/structure/fd/turret/inside_gun

/obj/item/fd/turret_undeployed/attack_self(mob/user)
	. = ..()

	if(do_after(user, 2 SECONDS, src, DO_PUBLIC_UNIQUE))
		deploy(user)

/obj/item/fd/turret_undeployed/proc/deploy(mob/living/caller)

	if(!inside_gun)
		inside_gun = new /obj/structure/fd/turret(src)
		inside_gun.inside_bag = src

	inside_gun.forceMove(get_step(caller,caller.dir))
	inside_gun.dir = 1

	inside_gun.faction = caller.faction

	caller.drop_from_inventory(src)
	forceMove(inside_gun)

	if(inside_gun.connected_weapon)
		START_PROCESSING(SSobj, inside_gun)

/obj/structure/fd/turret
	name = "turret"
	desc = "Yeah, this is totally a turret"

	icon = 'mods/_fd/fd_assets/icons/goons/deployableturret.dmi'
	icon_state = "turret"

	anchored = 1
	density = TRUE
	var/faction = "neutral"

	var/obj/item/fd/turret_undeployed/inside_bag
	var/obj/item/gun/connected_weapon
	var/obj/item/projectile/projectile

	var/obj/item/ammo_magazine/magazine
	var/obj/item/cell/powersource

	var/image/gun_overlay
	var/image/targeting

	var/start_with_gun = FALSE
	var/premade_gun = /obj/item/gun

	var/mob/living/current_target
	var/list/mob/living/possible_targets = list()

/obj/structure/fd/turret/Initialize()
	. = ..()

	targeting = image(icon = 'mods/_fd/fd_assets/icons/tgmc/telegraph.dmi', icon_state = "exclamation")

	if(start_with_gun)
		connected_weapon = new premade_gun(src)

		setup_gun(connected_weapon)

/obj/structure/fd/turret/Process()

	for(var/mob/living/L in possible_targets)
		if(!(L in view(7,src)))
			possible_targets -= L
		if(L.stat != CONSCIOUS)
			possible_targets -= L
		if(L.get_status_effect(/datum/simple_status/crit) || L.get_status_effect(/datum/simple_status/hardcrit))
			possible_targets -= L

	if((!can_shoot() || !length(possible_targets)) && current_target)
		current_target.CutOverlays(targeting)
		current_target = null

	if(can_shoot())
		for(var/mob/living/L in view(7,src))
			if(L.faction == faction)
				continue
			if(L.stat != CONSCIOUS)
				continue
			if(L.get_status_effect(/datum/simple_status/crit) || L.get_status_effect(/datum/simple_status/hardcrit))
				continue
			if(L.mob_size <= MOB_SMALL)
				continue

			possible_targets |= L

		if(!current_target)
			if(length(possible_targets))
				playsound(loc, 'sound/weapons/TargetOff.ogg', 75, 1)
				current_target = pick(possible_targets)
				current_target.AddOverlays(targeting)

		if(current_target && (current_target.stat != CONSCIOUS || current_target.get_status_effect(/datum/simple_status/crit) || current_target.get_status_effect(/datum/simple_status/hardcrit)))
			current_target.CutOverlays(targeting)
			if(length(possible_targets))
				playsound(loc, 'sound/weapons/TargetOff.ogg', 75, 1)
				current_target = pick(possible_targets)
				current_target.AddOverlays(targeting)

		if(current_target && !(current_target in view(7,src)))
			current_target.CutOverlays(targeting)
			if(length(possible_targets))
				playsound(loc, 'sound/weapons/TargetOff.ogg', 75, 1)
				current_target = pick(possible_targets)
				current_target.AddOverlays(targeting)

		if(current_target && current_target.alpha <= FAKE_INVIS_ALPHA_THRESHOLD)
			current_target.CutOverlays(targeting)
			if(length(possible_targets))
				playsound(loc, 'sound/weapons/TargetOff.ogg', 75, 1)
				current_target = pick(possible_targets)
				current_target.AddOverlays(targeting)

		if(current_target)
			setup_direction(current_target)

			var/turf/T = get_turf(src)
			var/turf/U = get_turf(current_target)
			if(!istype(T) || !istype(U))
				return

			var/obj/item/projectile/A
			A = new projectile(loc)
			playsound(loc, connected_weapon.fire_sound, 75, 1)

			var/def_zone = get_exposed_defense_zone(current_target)
			A.launch(current_target, def_zone)

			remove_cost()

/obj/structure/fd/turret/use_tool(obj/item/tool, mob/user, list/click_params)
	if(istype(tool,/obj/item/gun) && !connected_weapon && do_after(user, 5 SECONDS, src, DO_PUBLIC_UNIQUE))
		user.drop_from_inventory(tool)
		setup_gun(tool)
		return TRUE

	if(isScrewdriver(tool) && connected_weapon && do_after(user, 5 SECONDS, src, DO_PUBLIC_UNIQUE))
		unattach_gun(user)
		return TRUE

	if(isWrench(tool) && do_after(user, 5 SECONDS, src, DO_PUBLIC_UNIQUE))
		undeploy(user)
		return TRUE

	. = ..()

/obj/item/cell/proc/checked_use_no_spending(amount)
	if(!check_charge(amount))
		return 0
	return 1

/obj/structure/fd/turret/proc/can_shoot()
	if(istype(connected_weapon,/obj/item/gun/energy))
		var/obj/item/gun/energy/E = connected_weapon
		if(powersource.checked_use_no_spending(E.charge_cost))
			return TRUE

	if(istype(connected_weapon,/obj/item/gun/projectile))
		var/obj/item/gun/projectile/P = connected_weapon
		if(P.load_method == MAGAZINE)
			if(length(magazine.stored_ammo))
				return TRUE
		if(P.load_method == SINGLE_CASING|SPEEDLOADER)
			if(length(P.loaded))
				return TRUE
	playsound(loc, 'sound/weapons/empty.ogg', 75, 1)
	return FALSE

/obj/structure/fd/turret/proc/remove_cost()
	if(istype(connected_weapon,/obj/item/gun/energy))
		var/obj/item/gun/energy/E = connected_weapon
		powersource.use(E.charge_cost)
		if(E.self_recharge)
			E.charge_tick = 0
			START_PROCESSING(SSobj, connected_weapon)
		return TRUE

	if(istype(connected_weapon,/obj/item/gun/projectile))
		var/obj/item/gun/projectile/P = connected_weapon
		var/obj/item/ammo_casing/chambered

		if(P.load_method == MAGAZINE)
			chambered = magazine.stored_ammo[1]
			magazine.stored_ammo -= chambered
			return TRUE

		if(P.load_method == SINGLE_CASING|SPEEDLOADER)
			chambered = P.loaded[1]
			P.loaded -= chambered
			return TRUE
	return FALSE

/obj/structure/fd/turret/proc/setup_gun(obj/item/gun/weapon)
	START_PROCESSING(SSobj, src)

	weapon.forceMove(src)
	connected_weapon = weapon

	gun_overlay = image(icon = weapon.icon, icon_state = weapon.icon_state)

	var/matrix/M = matrix()
	if(weapon.sprite_direction != "east")
		M.Turn(90)
	else
		M.Turn(-90)
	gun_overlay.transform = M

	AddOverlays(gun_overlay)

	if(istype(weapon,/obj/item/gun/energy))
		var/obj/item/gun/energy/E = weapon
		projectile = E.projectile_type
		powersource = E.power_supply
		return TRUE
	if(istype(weapon,/obj/item/gun/projectile))
		var/obj/item/gun/projectile/P = weapon
		if(P.load_method == MAGAZINE)
			magazine = P.ammo_magazine
			var/obj/item/ammo_casing/casing

			for(var/obj/item/ammo_casing/C in magazine.stored_ammo)
				if(!casing)
					casing = C

			projectile = casing.projectile_type
			return TRUE
		if(P.load_method == SINGLE_CASING|SPEEDLOADER)
			var/obj/item/ammo_casing/casing
			for(var/obj/item/ammo_casing/C in P.loaded)
				if(!casing)
					casing = C

			projectile = casing.projectile_type
			return TRUE

/obj/structure/fd/turret/proc/unattach_gun(mob/living/caller)
	if(current_target)
		current_target.CutOverlays(targeting)
		current_target = null

	if(length(possible_targets))
		possible_targets.Cut()

	connected_weapon.forceMove(get_turf(src))
	caller.put_in_inactive_hand(connected_weapon)
	connected_weapon = null
	projectile = null

	magazine = null
	powersource = null

	STOP_PROCESSING(SSobj, src)

	CutOverlays(gun_overlay)
	gun_overlay = null

/proc/get_angle_tg(atom/movable/start, atom/movable/end)
	if(!start || !end)
		return 0
	var/dy =(ICON_SIZE_Y * end.y + end.pixel_y) - (ICON_SIZE_Y * start.y + start.pixel_y)
	var/dx =(ICON_SIZE_X * end.x + end.pixel_x) - (ICON_SIZE_X * start.x + start.pixel_x)
	return delta_to_angle(dx, dy)

/proc/delta_to_angle(x, y)
	if(!y)
		return (x >= 0) ? 90 : 270
	. = arctan(x/y)
	if(y < 0)
		. += 180
	else if(x < 0)
		. += 360

/obj/structure/fd/turret/proc/setup_direction(mob/living/target)
	playsound(loc, 'sound/effects/turret/move1.wav', 75, 1)
	animate(src, transform = matrix(get_angle_tg(src,target), MATRIX_ROTATE), time = 3, easing = SINE_EASING|EASE_IN)

/obj/structure/fd/turret/proc/undeploy(mob/living/caller)
	if(!inside_bag)
		inside_bag = new /obj/item/fd/turret_undeployed(src)
		inside_bag.inside_gun = src

	if(connected_weapon)
		if(current_target)
			current_target.CutOverlays(targeting)
			current_target = null

		if(length(possible_targets))
			possible_targets.Cut()

	STOP_PROCESSING(SSobj, src)

	caller.put_in_inactive_hand(inside_bag)
	forceMove(inside_bag)
