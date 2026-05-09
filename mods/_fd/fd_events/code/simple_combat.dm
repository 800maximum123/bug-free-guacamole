/datum/keybinding/living/fd/simple_combat
	category = CATEGORY_FD_SIMPLE

/datum/keybinding/living/fd/simple_combat/can_use(client/user)
	. = ..()

	var/mob/living/L = user.mob
	if(!L.simple_combat_on)
		return FALSE

/datum/keybinding/living/fd/simple_combat/healthshow
	hotkey_keys = list("H")
	name = "healthshow"
	full_name = "General: Check Health"
	description = ""

/datum/keybinding/living/fd/simple_combat/healthshow/down(client/user)
	var/mob/living/L = user.mob

	if(!L.h1)
		L.h1 = new /obj/screen/health_face()
		L.h1.host = L
		L.client.screen += L.h1

	if(!L.h2)
		L.h2 = new /obj/screen/health_pulse()
		L.h2.host = L
		L.client.screen += L.h2

	animate(L.h1, transform = matrix(-32, 0, MATRIX_TRANSLATE), alpha = 255, time = 3, easing = SINE_EASING|EASE_IN, flags = ANIMATION_PARALLEL)
	animate(transform = matrix(-30, MATRIX_ROTATE), time = 3, easing = SINE_EASING|EASE_IN, flags = ANIMATION_PARALLEL)

	animate(L.h2, transform = matrix(-32, 0, MATRIX_TRANSLATE), alpha = 255, time = 3, easing = SINE_EASING|EASE_IN, flags = ANIMATION_PARALLEL)
	animate(transform = matrix(-30, MATRIX_ROTATE), time = 3, easing = SINE_EASING|EASE_IN, flags = ANIMATION_PARALLEL)

	animate(L.client, pixel_x = -32, time = 3, easing = SINE_EASING|EASE_IN, flags = ANIMATION_PARALLEL)

	return TRUE

/datum/keybinding/living/fd/simple_combat/healthshow/up(client/user)
	var/mob/living/L = user.mob

	animate(L.h1, transform = matrix(0, 0, MATRIX_TRANSLATE), alpha = 0, time = 3, easing = SINE_EASING|EASE_IN, flags = ANIMATION_PARALLEL|ANIMATION_LINEAR_TRANSFORM)
	animate(transform = matrix(0, MATRIX_ROTATE), time = 3, easing = SINE_EASING|EASE_IN, flags = ANIMATION_PARALLEL|ANIMATION_LINEAR_TRANSFORM)

	animate(L.h2, transform = matrix(0, 0, MATRIX_TRANSLATE), alpha = 0, time = 3, easing = SINE_EASING|EASE_IN, flags = ANIMATION_PARALLEL)
	animate(transform = matrix(0, MATRIX_ROTATE), time = 3, easing = SINE_EASING|EASE_IN, flags = ANIMATION_PARALLEL)

	animate(L.client, pixel_x = 0, time = 3, easing = SINE_EASING|EASE_IN, flags = ANIMATION_PARALLEL)

	return TRUE

/datum/keybinding/living/fd/simple_combat/melee_assist
	hotkey_keys = list("O")
	name = "melee_assist"
	full_name = "General: Attack Assistant"
	description = ""

/datum/keybinding/living/fd/simple_combat/melee_assist/down(client/user)
	var/mob/living/L = user.mob

	if(L.melee_assist)
		L.melee_assist = FALSE
		return TRUE
	else
		L.melee_assist = TRUE
		return TRUE

/obj/screen/fullscreen/simple_damage
	icon = 'mods/_fd/_maps/collective_nightmare/icons/tgmc_screens.dmi'
	icon_state = "damage"
	scale_to_view = TRUE
	alpha = 0

/obj/screen/fullscreen/simple_damage/Initialize()
	. = ..()
	animate(src, alpha = 255, time = 5, LINEAR_EASING)

/obj/screen/health_face
	name = "лицо"
	desc = "Ты не должен нажимать на него"
	icon = 'mods/_fd/fd_events/icons/screen_gen.dmi'
	icon_state = "health6"
	alpha = 0

	plane = HUD_PLANE
	layer = 5.4

	mouse_opacity = FALSE

	var/mob/living/host
	screen_loc = "CENTER,CENTER"

/obj/screen/health_face/Initialize()
	. = ..()

	START_PROCESSING(SSobj,src)

/obj/screen/health_face/Process()
	update_health_status()

/obj/screen/health_face/proc/update_health_status()

	if(host.simple_health >= host.max_simple_health)
		icon_state = "health6"
	if(host.simple_health < host.max_simple_health && host.simple_health > host.max_simple_health / 1.2)
		icon_state = "health5"
	if(host.simple_health < host.max_simple_health / 1.2 && host.simple_health > host.max_simple_health / 1.5)
		icon_state = "health4"
	if(host.simple_health < host.max_simple_health / 1.5 && host.simple_health > host.max_simple_health / 2)
		icon_state = "health3"
	if(host.simple_health < host.max_simple_health / 2 && host.simple_health > host.max_simple_health / 4)
		icon_state = "health2"
	if(host.simple_health < host.max_simple_health / 4 && host.simple_health > host.max_simple_health / 8)
		icon_state = "health1"
	if(host.simple_health <= 0)
		icon_state = "health0"

/obj/screen/health_pulse
	name = "пульс"
	desc = "Ты не должен нажимать на него"
	icon = 'mods/_fd/fd_events/icons/screen_gen.dmi'
	icon_state = "pulse6"
	alpha = 0

	plane = HUD_PLANE
	layer = 5.4

	mouse_opacity = FALSE

	var/mob/living/host
	screen_loc = "CENTER+0.3,CENTER-0.6"

/obj/screen/health_pulse/Initialize()
	. = ..()

	START_PROCESSING(SSobj,src)

/obj/screen/health_pulse/Process()
	update_health_status()

/obj/screen/health_pulse/proc/update_health_status()

	if(host.simple_health >= host.max_simple_health)
		icon_state = "pulse6"
	if(host.simple_health < host.max_simple_health && host.simple_health > host.max_simple_health / 1.2)
		icon_state = "pulse5"
	if(host.simple_health < host.max_simple_health / 1.2 && host.simple_health > host.max_simple_health / 1.5)
		icon_state = "pulse4"
	if(host.simple_health < host.max_simple_health / 1.5 && host.simple_health > host.max_simple_health / 2)
		icon_state = "pulse3"
	if(host.simple_health < host.max_simple_health / 2 && host.simple_health > host.max_simple_health / 4)
		icon_state = "pulse2"
	if(host.simple_health < host.max_simple_health / 4 && host.simple_health > host.max_simple_health / 8)
		icon_state = "pulse1"
	if(host.simple_health <= 0)
		icon_state = "pulse0"

/obj/item
	var/simple_damage = 2
	var/simple_armor_penetration = 0

/obj/item/apply_hit_effect(mob/living/target, mob/living/user, hit_zone)
	if(target.simple_combat_on)
		target.simple_health_calculation(simple_damage,1,simple_armor_penetration)
		return TRUE
	..()

/obj/item/throw_impact(atom/hit_atom, datum/thrownthing/TT)
	if(istype(hit_atom,/mob/living))
		var/mob/living/L = hit_atom
		if(L.simple_combat_on)
			L.simple_health_calculation(simple_damage,1,simple_armor_penetration)

	..()

/obj/item/projectile
	simple_damage = 5

/obj/item/projectile/attack_mob(mob/living/target_mob, distance, special_miss_modifier)
	if(target_mob.simple_combat_on)
		target_mob.bullet_impact_visuals(src, def_zone, simple_damage)
		target_mob.simple_health_calculation(simple_damage,1,simple_armor_penetration)
		return TRUE

	..()

/obj/item/clothing
	var/simple_armor_bonus = 0
	var/simple_armor_blockchance = 100

	var/simple_armor_deformation_speed = 5

/mob/living
	var/simple_combat_on = FALSE

	var/simple_health = 100
	var/max_simple_health = 100

	var/heavy_wounded = FALSE
	var/base_regen_period = 10
	var/regen_period = 10
	var/regen_for = 10

	var/simple_armor_natural = 0

	var/obj/screen/health_face/h1
	var/obj/screen/health_pulse/h2

	var/melee_assist = FALSE

/mob/living/Life()

	if(simple_combat_on)
		if(simple_health < max_simple_health)
			regen_period -= 1

		if(regen_period <= 0)
			simple_health_calculation(-regen_for,0,0)
			regen_period = base_regen_period

		if(simple_health <= 0 && !heavy_wounded)
			give_player_wound()

		if(simple_health > 0 && heavy_wounded)
			clear_player_wound()

	. = ..()

/mob/living/movement_delay()
	. = ..()

	if(heavy_wounded)
		. += 10

/mob/living/proc/give_player_wound()
	heavy_wounded = TRUE
	anchored = TRUE

	overlay_fullscreen("dead",/obj/screen/fullscreen/underworld_vision)
	add_filter("wounded", 1, list("type" = "outline", , "size" = 1, "color" = COLOR_RED))

	regen_period += 110
	SetTransform(1,0,0,90)
	anchored = FALSE

/mob/living/proc/clear_player_wound()
	heavy_wounded = FALSE

	remove_filter("wounded")
	clear_fullscreen("dead")
	SetTransform(1,0,0,0)

/mob/living/proc/simple_health_calculation(amount, should_block = TRUE, armor_damage_amp)
	set waitfor = FALSE

	if(simple_combat_on)

		var/before_calculation = simple_health

		if(should_block)
			amount = clamp(amount - simple_armor_natural, 0, amount)

			var/obj/item/clothing/suit/armor = get_equipped_item(slot_wear_suit)
			if(armor && amount > 0 && prob(armor.simple_armor_blockchance))
				amount = clamp(amount - armor.simple_armor_bonus, 0, amount)
				armor.simple_armor_blockchance -= armor.simple_armor_deformation_speed + armor_damage_amp

		simple_health = clamp(simple_health - amount, 0, max_simple_health)
		if(before_calculation > simple_health)
			regen_period = base_regen_period

			overlay_fullscreen("damage",/obj/screen/fullscreen/simple_damage)

			animation_flash_color(src, COLOR_RED)
			sleep(6)

			clear_fullscreen("damage")

		if(before_calculation <= simple_health)
			if(amount == 0 && should_block)
				if(client)
					shake_camera_MARINE(src, steps = 2, strength = 2, time_per_step = 2)

				playsound(loc, SOUNDS_BULLET_METAL, 100, 1)
				animation_flash_color(src, COLOR_CYAN)
			else
				animation_flash_color(src, COLOR_GREEN)

		if(!ishuman(src))
			if(heavy_wounded)
				death()

		if(simple_health <= max_simple_health / 2)
			var/obj/screen/fullscreen/screen = screens["almost_done"]
			if(!screen)
				overlay_fullscreen("almost_done",/obj/screen/fullscreen/almost_done)

		if(simple_health > max_simple_health / 2)
			var/obj/screen/fullscreen/screen = screens["almost_done"]
			if(screen)
				clear_fullscreen("almost_done")

/mob/living/ClickOn(atom/A)

	if(melee_assist)
		var/obj/item/S = get_active_hand()
		if(world.time <= next_move)
			return FALSE

		var/turf/target_turf = get_turf(get_step(src, Get_Compass_Dir(src, A)))
		var/mob/living/target = null
		for(var/mob/living/L in target_turf)
			target = L

		if(!isnull(target) && !isnull(S) && a_intent == I_HURT)
			next_move += S.attack_cooldown
			target.use_weapon(S, src)

	..()

/proc/angle_to_dir(angle)
	switch(angle) //diagonal directions get priority over straight directions in edge cases
		if (22.5 to 67.5)
			return NORTHEAST
		if (112.5 to 157.5)
			return SOUTHEAST
		if (202.5 to 247.5)
			return SOUTHWEST
		if (292.5 to 337.5)
			return NORTHWEST
		if (0 to 22.5)
			return NORTH
		if (67.5 to 112.5)
			return EAST
		if (157.5 to 202.5)
			return SOUTH
		if (247.5 to 292.5)
			return WEST
		else
			return NORTH

/proc/Get_Compass_Dir(atom/start, atom/end)//get_dir() only considers an object to be north/south/east/west if there is zero deviation. This uses rounding instead.
	return angle_to_dir(Get_Angle(get_turf(start), get_turf(end)))

/obj/item/fd/simple_combat/bloodbag
	name = "bloodbag"
	desc = "Used to transfer blood."

	icon = 'mods/_fd/fd_events/icons/simple_medicine.dmi'
	icon_state = "blood_0"

	w_class = ITEM_SIZE_SMALL
	var/current_health_inside = 0
	var/max_health_inside = 40
	var/mob/living/connected_to
	var/mob/living/transfering_to

/obj/item/fd/simple_combat/bloodbag/Initialize()
	. = ..()
	START_PROCESSING(SSobj,src)

/obj/item/fd/simple_combat/bloodbag/Process()
	if(current_health_inside < max_health_inside)

		if(connected_to && connected_to.simple_health > 0)
			current_health_inside = clamp(current_health_inside + 10, 0, max_health_inside)
			connected_to.simple_health_calculation(10,0,0)

			animation_flash_color(src, COLOR_GREEN)
			update_health_inside()

	if(current_health_inside > 0)
		if(transfering_to && transfering_to.simple_health < transfering_to.max_simple_health)
			if(current_health_inside < 10)
				transfering_to.simple_health_calculation(-current_health_inside,0,0)
				current_health_inside = 0
				update_health_inside()

			else
				current_health_inside = clamp(current_health_inside - 10, 0, max_health_inside)
				transfering_to.simple_health_calculation(-10,0,0)

				update_health_inside()

			animation_flash_color(src, COLOR_RED)

/mob/living/use_tool(obj/item/tool, mob/living/user, list/click_params)
	if(istype(tool,/obj/item/fd/simple_combat/bloodbag))
		var/obj/item/fd/simple_combat/bloodbag/B = tool
		if(B.transfering_to != src)
			add_filter("transfering", 1, list("type" = "outline", , "size" = 1, "color" = COLOR_WHITE))

			user.anchored = TRUE
			B.transfering_to = src
			B.maptext = STYLE_SMALLFONTS_OUTLINE("CONNECTED", 7, COLOR_WHITE, COLOR_BLACK)
			return TRUE
		if(B.transfering_to == src)
			remove_filter("transfering")

			user.anchored = FALSE
			B.transfering_to = null
			B.maptext = ""
			return TRUE

	. = ..()

/obj/item/fd/simple_combat/bloodbag/attack_self(mob/user)
	. = ..()

	if(ishuman(user) && user != connected_to)
		var/mob/living/carbon/human/H = user
		if(H.simple_health > 0)
			H.add_filter("connected", 1, list("type" = "outline", , "size" = 1, "color" = COLOR_WHITE))
			connected_to = H
			maptext = STYLE_SMALLFONTS_OUTLINE("CONNECTED", 7, COLOR_WHITE, COLOR_BLACK)
			return TRUE

	if(ishuman(user) && user == connected_to)
		var/mob/living/carbon/human/H = user
		H.remove_filter("connected")
		connected_to = null
		maptext = ""
		return TRUE

/obj/item/fd/simple_combat/bloodbag/dropped()
	connected_to.remove_filter("connected")
	connected_to = null

	transfering_to.remove_filter("transfering")
	transfering_to = null

	maptext = STYLE_SMALLFONTS_OUTLINE("CONNECTED", 7, COLOR_WHITE, COLOR_BLACK)

	. = ..()

/obj/item/fd/simple_combat/bloodbag/proc/update_health_inside()
	icon_state = "blood_0"

	if(current_health_inside > 10 && current_health_inside <= 20)
		icon_state = "blood_10"

	if(current_health_inside > 20 && current_health_inside <= 30)
		icon_state = "blood_20"

	if(current_health_inside > 30 && current_health_inside <= 40)
		icon_state = "blood_40"

	if(current_health_inside > 40)
		icon_state = "blood_40"

/obj/item/fd/simple_combat/adrenaline
	name = "stabilization drug"
	desc = "Used to speed-up your regeneration."

	icon = 'mods/_fd/fd_events/icons/simple_medicine.dmi'
	icon_state = "adrenaline"

	w_class = ITEM_SIZE_SMALL

/mob/living/use_tool(obj/item/tool, mob/living/user, list/click_params)
	if(istype(tool,/obj/item/fd/simple_combat/adrenaline))
		var/obj/item/fd/simple_combat/adrenaline/A = tool
		if(base_regen_period > 2 && !heavy_wounded)
			animation_flash_color(A, COLOR_GREEN)
			base_regen_period = 2
			regen_for = 5

			playsound(src, 'sound/effects/refill.ogg', 50)
			addtimer(new Callback(src, PROC_REF(reset_adrenaline)), 15 SECONDS)

			sleep(5)
			qdel(A)

		else
			animation_flash_color(A, COLOR_RED)
			return FALSE

	. = ..()

/obj/item/fd/simple_combat/adrenaline/attack_self(mob/user)
	. = ..()

	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.base_regen_period > 2 && !H.heavy_wounded)
			animation_flash_color(src, COLOR_GREEN)
			H.base_regen_period = 2
			H.regen_for = 5

			playsound(H, 'sound/effects/refill.ogg', 50)
			addtimer(new Callback(H, TYPE_PROC_REF(/mob/living, reset_adrenaline)), 15 SECONDS)

			sleep(5)
			qdel(src)

		else
			animation_flash_color(src, COLOR_RED)
			return FALSE

/mob/living/proc/reset_adrenaline()
	base_regen_period = initial(base_regen_period)
	regen_for = initial(regen_for)

/obj/item/fd/simple_combat/revive
	name = "revival fluid"
	desc = "Used to get you up."

	icon = 'mods/_fd/fd_events/icons/simple_medicine.dmi'
	icon_state = "revive"

	w_class = ITEM_SIZE_TINY

/mob/living/use_tool(obj/item/tool, mob/living/user, list/click_params)
	if(istype(tool,/obj/item/fd/simple_combat/revive))
		var/obj/item/fd/simple_combat/revive/R = tool
		if(heavy_wounded)
			animation_flash_color(R, COLOR_GREEN)
			clear_player_wound()
			regen_period = base_regen_period
			simple_health_calculation(-10,0,0)

			sleep(5)
			qdel(R)

		else
			animation_flash_color(R, COLOR_RED)
			return FALSE

	. = ..()

/obj/item/fd/simple_combat/revive/attack_self(mob/user)
	. = ..()

	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.heavy_wounded)
			animation_flash_color(src, COLOR_GREEN)
			H.clear_player_wound()
			H.regen_period = H.base_regen_period
			H.simple_health_calculation(-5,0,0)

			sleep(5)
			qdel(src)

		else
			animation_flash_color(src, COLOR_RED)
			return FALSE

/obj/item/fd/simple_combat/small_heal
	name = "medical gel"
	desc = "Used to heal minor body damage."

	icon = 'mods/_fd/fd_events/icons/simple_medicine.dmi'
	icon_state = "small_heal"

	w_class = ITEM_SIZE_TINY

/mob/living/use_tool(obj/item/tool, mob/living/user, list/click_params)
	if(istype(tool,/obj/item/fd/simple_combat/small_heal))
		var/obj/item/fd/simple_combat/small_heal/S = tool
		if(simple_health < max_simple_health)
			animation_flash_color(S, COLOR_GREEN)
			simple_health_calculation(-20,0,0)

			sleep(5)
			qdel(S)

		else
			animation_flash_color(S, COLOR_RED)
			return FALSE

	. = ..()

/obj/item/fd/simple_combat/small_heal/attack_self(mob/user)
	. = ..()

	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.simple_health < H.max_simple_health)
			animation_flash_color(src, COLOR_GREEN)
			H.simple_health_calculation(-20,0,0)

			sleep(5)
			qdel(src)

		else
			animation_flash_color(src, COLOR_RED)
			return FALSE

/obj/item/fd/simple_combat/big_heal
	name = "medical injector"
	desc = "Used to heal heavy wounds."

	icon = 'mods/_fd/fd_events/icons/simple_medicine.dmi'
	icon_state = "big_heal"

	w_class = ITEM_SIZE_TINY

/mob/living/use_tool(obj/item/tool, mob/living/user, list/click_params)
	if(istype(tool,/obj/item/fd/simple_combat/big_heal))
		var/obj/item/fd/simple_combat/big_heal/B = tool
		if(simple_health < max_simple_health)
			animation_flash_color(B, COLOR_GREEN)
			simple_health_calculation(-40,0,0)

			sleep(5)
			qdel(B)

		else
			animation_flash_color(B, COLOR_RED)
			return FALSE

	. = ..()

/obj/item/fd/simple_combat/big_heal/attack_self(mob/user)
	. = ..()

	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.simple_health < H.max_simple_health)
			animation_flash_color(src, COLOR_GREEN)
			H.simple_health_calculation(-40,0,0)

			sleep(5)
			qdel(src)

		else
			animation_flash_color(src, COLOR_RED)
			return FALSE

/datum/interactive_note/tutorial_ooc/simple_medicine
	name = "Подсказка 3 (ООС)"
	note_info = {"<b>КАЗУАЛЬНАЯ МЕДИЦИНА</b><br /> \
				<br /> \
				Используйте медицинский гель и инъекцию в руке или на ком-то, чтобы <b><span style="color: green;">восстановить от 20 до 50 ед. здоровья</span></b><br /> \
				Используйте стабилизатор в руке или на ком-то, чтобы <b><span style="color: yellow;">временно ускорить регенерацию</span></b><br /> \
				Используйте оживляющую жидкость в руке или на ком-то, чтобы <b><span style="color: green;">возобновить регенерацию после падения</span></b><br /> \
				Используйте пакет с кровью в руке, чтобы <b><span style="color: red;">перекачать в него часть своего здоровья</span></b>, или на ком-то, чтобы <b><span style="color: green;">передать ему это здоровье</span></b>"}

/obj/item/melee/baton
	simple_damage = 10

/obj/item/material/twohanded/jack
	simple_damage = 20

/obj/item/material/twohanded/fireaxe
	simple_damage = 20
	simple_armor_penetration = 10

/obj/item/material/sword/katana
	simple_damage = 20
	simple_armor_penetration = 10

/obj/item/material/knife/combat
	simple_damage = 10

/obj/item/crowbar/emergency_forcing_tool
	simple_damage = 10
	simple_armor_penetration = 5

/obj/item/material/hatchet
	simple_damage = 10
	simple_armor_penetration = 5

/obj/item/material/armblade
	simple_damage = 20
	simple_armor_penetration = 10

/obj/item/projectile/energy/plasmastun/attack_mob(mob/living/target_mob, distance, special_miss_modifier)

	if(target_mob.simple_combat_on)
		target_mob.bullet_impact_visuals(src, def_zone, simple_damage)
		target_mob.simple_health_calculation(simple_damage,0,0)
		return TRUE

	if(!istype(target_mob))
		return

	//roll to-hit
	var/miss_modifier = max(distance_falloff*(distance)*(distance) - hitchance_mod + special_miss_modifier, -30)
	//makes moving targets harder to hit, and stationary easier to hit
	var/movment_mod = min(5, (world.time - target_mob.l_move_time) - 5)

	if (damage_falloff)
		var/damage_mod = 1
		for (var/list/entry as anything in damage_falloff_list)
			if (entry[1] > distance)
				break
			damage_mod = entry[2]
		damage = damage * damage_mod
		armor_penetration = armor_penetration * damage_mod
		agony = agony * damage_mod
	//running in a straight line isnt as helpful tho
	if(movment_mod < 0)
		if(target_mob.last_move == get_dir(firer, target_mob))
			movment_mod *= 0.25
		else if(target_mob.last_move == get_dir(target_mob,firer))
			movment_mod *= 0.5
	miss_modifier -= movment_mod
	var/hit_zone = get_zone_with_miss_chance(def_zone, target_mob, miss_modifier, ranged_attack=(distance > 1 || original != target_mob)) //if the projectile hits a target we weren't originally aiming at then retain the chance to miss

	var/result = PROJECTILE_FORCE_MISS
	if(hit_zone)
		def_zone = hit_zone //set def_zone, so if the projectile ends up hitting someone else later (to be implemented), it is more likely to hit the same part
		if(!target_mob.aura_check(AURA_TYPE_BULLET, src,def_zone))
			return 1
		result = target_mob.bullet_act(src, def_zone)

	if(result == PROJECTILE_FORCE_MISS)
		if(!silenced)
			target_mob.visible_message(SPAN_NOTICE("\The [src] misses [target_mob] narrowly!"))
			if(LAZYLEN(miss_sounds))
				playsound(target_mob.loc, pick(miss_sounds), 60, 1)
		return 0

	//hit messages
	if(silenced)
		to_chat(target_mob, SPAN_DANGER("You've been hit in the [parse_zone(def_zone)] by \the [src]!"))
	else
		target_mob.visible_message(SPAN_DANGER("\The [target_mob] is hit by \the [src] in the [parse_zone(def_zone)]!"))//X has fired Y is now given by the guns so you cant tell who shot you if you could not see the shooter

	//admin logs
	if(!no_attack_log)
		if(istype(firer, /mob))

			var/attacker_message = "shot with \a [src.type]"
			var/victim_message = "shot with \a [src.type]"
			var/admin_message = "shot (\a [src.type])"

			admin_attack_log(firer, target_mob, attacker_message, victim_message, admin_message)
		else
			admin_victim_log(target_mob, "was shot by an <b>UNKNOWN SUBJECT (No longer exists)</b> using \a [src]")

	//sometimes bullet_act() will want the projectile to continue flying
	if (result == PROJECTILE_CONTINUE)
		return 0

	return 1

/obj/item/projectile/energy/electrode/stunshot/attack_mob(mob/living/target_mob, distance, special_miss_modifier)

	if(target_mob.simple_combat_on)
		target_mob.bullet_impact_visuals(src, def_zone, simple_damage)
		target_mob.simple_health_calculation(simple_damage,0,0)
		return TRUE

	if(!istype(target_mob))
		return

	//roll to-hit
	var/miss_modifier = max(distance_falloff*(distance)*(distance) - hitchance_mod + special_miss_modifier, -30)
	//makes moving targets harder to hit, and stationary easier to hit
	var/movment_mod = min(5, (world.time - target_mob.l_move_time) - 5)

	if (damage_falloff)
		var/damage_mod = 1
		for (var/list/entry as anything in damage_falloff_list)
			if (entry[1] > distance)
				break
			damage_mod = entry[2]
		damage = damage * damage_mod
		armor_penetration = armor_penetration * damage_mod
		agony = agony * damage_mod
	//running in a straight line isnt as helpful tho
	if(movment_mod < 0)
		if(target_mob.last_move == get_dir(firer, target_mob))
			movment_mod *= 0.25
		else if(target_mob.last_move == get_dir(target_mob,firer))
			movment_mod *= 0.5
	miss_modifier -= movment_mod
	var/hit_zone = get_zone_with_miss_chance(def_zone, target_mob, miss_modifier, ranged_attack=(distance > 1 || original != target_mob)) //if the projectile hits a target we weren't originally aiming at then retain the chance to miss

	var/result = PROJECTILE_FORCE_MISS
	if(hit_zone)
		def_zone = hit_zone //set def_zone, so if the projectile ends up hitting someone else later (to be implemented), it is more likely to hit the same part
		if(!target_mob.aura_check(AURA_TYPE_BULLET, src,def_zone))
			return 1
		result = target_mob.bullet_act(src, def_zone)

	if(result == PROJECTILE_FORCE_MISS)
		if(!silenced)
			target_mob.visible_message(SPAN_NOTICE("\The [src] misses [target_mob] narrowly!"))
			if(LAZYLEN(miss_sounds))
				playsound(target_mob.loc, pick(miss_sounds), 60, 1)
		return 0

	//hit messages
	if(silenced)
		to_chat(target_mob, SPAN_DANGER("You've been hit in the [parse_zone(def_zone)] by \the [src]!"))
	else
		target_mob.visible_message(SPAN_DANGER("\The [target_mob] is hit by \the [src] in the [parse_zone(def_zone)]!"))//X has fired Y is now given by the guns so you cant tell who shot you if you could not see the shooter

	//admin logs
	if(!no_attack_log)
		if(istype(firer, /mob))

			var/attacker_message = "shot with \a [src.type]"
			var/victim_message = "shot with \a [src.type]"
			var/admin_message = "shot (\a [src.type])"

			admin_attack_log(firer, target_mob, attacker_message, victim_message, admin_message)
		else
			admin_victim_log(target_mob, "was shot by an <b>UNKNOWN SUBJECT (No longer exists)</b> using \a [src]")

	//sometimes bullet_act() will want the projectile to continue flying
	if (result == PROJECTILE_CONTINUE)
		return 0

	return 1

/obj/item/projectile/beam/midlaser
	simple_damage = 20
	simple_armor_penetration = 5

/obj/item/projectile/beam/smalllaser
	simple_damage = 10

/obj/item/projectile/bullet/shotgun
	simple_damage = 20
	simple_armor_penetration = 5

/obj/item/projectile/bullet/rifle
	simple_damage = 10

/obj/item/projectile/bullet/pistol
	simple_damage = 10

/obj/item/projectile/bullet/pistol/strong
	simple_damage = 20
	simple_armor_penetration = 5
