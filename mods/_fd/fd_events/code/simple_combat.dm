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

	L.client.screen -= L.h1
	L.client.screen -= L.h2

	return TRUE

/datum/keybinding/living/fd/simple_combat/melee_assist
	hotkey_keys = list("O")
	name = "melee_assist"
	full_name = "General: Attack Assistant"
	description = ""

/datum/keybinding/living/fd/simple_combat/melee_assist/down(client/user)
	var/mob/living/L = user.mob

	L.melee_assistant_icon.toggle_assistant(L)

/obj/screen/melee_assistant
	name = "Toggle Melee Assistant"
	icon_state = "meleeassist_off"
	screen_loc = "EAST-1:28,SOUTH+4:7"

/obj/screen/melee_assistant/Click(location, control, params)
	if(isliving(usr))
		var/mob/living/user = usr
		if(user.simple_combat_on)
			toggle_assistant(user)
			return 1
		else
			animation_flash_color(src, COLOR_RED)
			return 0

	animation_flash_color(src, COLOR_RED)
	return 0

/obj/screen/melee_assistant/proc/toggle_assistant(mob/living/user)
	if(user.melee_assist)
		user.melee_assist = FALSE
		icon_state = "meleeassist_off"
		return 1

	if(!user.melee_assist)
		user.melee_assist = TRUE
		icon_state = "meleeassist"
		return 1

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

	var/datum/simple_status/status_to_add = null
	var/status_timer_to_add = -1
	var/status_ignore_armor = FALSE

	var/status_apply_prob = -1

/obj/item/apply_hit_effect(mob/living/target, mob/living/user, hit_zone)
	if(target.simple_combat_on)
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
	..()

/obj/item/throw_impact(atom/hit_atom, datum/thrownthing/TT)
	if(istype(hit_atom,/mob/living))
		var/mob/living/L = hit_atom
		if(L.simple_combat_on)

			if(status_to_add)
				if(status_apply_prob > 0)
					if(prob(status_apply_prob))
						L.simple_health_calculation(simple_damage,simple_armor_penetration,1,0,null,status_to_add,status_ignore_armor,status_timer_to_add)
						return TRUE
					else
						L.simple_health_calculation(simple_damage,simple_armor_penetration,1,0)
						return TRUE

				else
					L.simple_health_calculation(simple_damage,simple_armor_penetration,1,0,null,status_to_add,status_ignore_armor,status_timer_to_add)
					return TRUE

			else
				L.simple_health_calculation(simple_damage,simple_armor_penetration,1,0)
				return TRUE
	..()

/obj/item/projectile
	simple_damage = 10

/obj/item/projectile/attack_mob(mob/living/target_mob, distance, special_miss_modifier)
	if(target_mob.simple_combat_on)

		if(status_to_add)
			if(status_apply_prob > 0)
				if(prob(status_apply_prob))
					target_mob.simple_health_calculation(simple_damage,simple_armor_penetration,1,1,src,status_to_add,status_ignore_armor,status_timer_to_add)
					return TRUE
				else
					target_mob.simple_health_calculation(simple_damage,simple_armor_penetration,1,1,src)
					return TRUE

			else
				target_mob.simple_health_calculation(simple_damage,simple_armor_penetration,1,1,src,status_to_add,status_ignore_armor,status_timer_to_add)
				return TRUE

		else
			target_mob.simple_health_calculation(simple_damage,simple_armor_penetration,1,1,src)
			return TRUE
	..()

/obj/item/clothing
	var/simple_armor_bonus = 0
	var/simple_armor_blockchance = 100
	var/simple_armor_blockchance_max = 100

	var/simple_armor_deformation_speed = 5

/mob/living
	var/simple_combat_on = FALSE

	var/simple_health = 100
	var/max_simple_health = 100

	var/base_regen_period = 20
	var/regen_period = 20
	var/regen_for = 10

	var/simple_armor_natural = 0

	var/obj/screen/health_face/h1
	var/obj/screen/health_pulse/h2

	var/melee_assist = FALSE

	var/stabilized = FALSE
	var/pre_death = FALSE

/mob/living/carbon/human
	var/unarmed_simple_damage = 5
	var/unarmed_simple_sharpness = 0

/mob/living/Life()

	if(simple_combat_on)
		if(simple_health < max_simple_health)
			regen_period -= 1

		if(regen_period <= 0)
			simple_health_calculation(-regen_for,0,0,0)
			regen_period = base_regen_period

		if(simple_health <= 0 && !get_status_effect(/datum/simple_status/crit) && !pre_death)
			add_status_effect(/datum/simple_status/crit)

		if(simple_health > 0 && get_status_effect(/datum/simple_status/crit) && !pre_death)
			remove_status_effect(/datum/simple_status/crit)

	. = ..()

/mob/living/movement_delay()
	. = ..()

	if(simple_combat_on)
		if(get_status_effect(/datum/simple_status/crit))
			. += 10

		if(get_status_effect(/datum/simple_status/legbroke) && !get_status_effect(/datum/simple_status/splinted))
			. += 5

/mob/living/proc/simple_health_vfx(show_blood = TRUE, obj/effect/simple_combat_particle/create_impact = null, obj/item/projectile/proj = null, mob/living/attacker = null)

	if(proj)
		var/list/impact_sounds = LAZYACCESS(proj.impact_sounds, get_bullet_impact_effect_type(proj.def_zone))
		if(length(impact_sounds))
			playsound(src, pick(impact_sounds), 75)

		var/change_curve = pick(1,2)

		switch(change_curve)
			if(1)
				var/random_number = rand(-4,4)
				var/pixel_x_change = pixel_x + random_number
				animate(src, pixel_x = pixel_x_change, time = 0.4 SECONDS, easing = JUMP_EASING | EASE_OUT, flags = ANIMATION_PARALLEL)
			if(2)
				var/pixel_y_change
				if(dir == SOUTH)
					pixel_y_change = pixel_y + 4
				else
					pixel_y_change = pixel_y - 4
				animate(src, pixel_y = pixel_y_change, time = 0.4 SECONDS, easing = JUMP_EASING | EASE_OUT, flags = ANIMATION_PARALLEL)

		spawn(0.6 SECONDS)
			pixel_x = default_pixel_x
			pixel_y = default_pixel_y

	if(show_blood)
		var/hit_dir

		if(proj)
			if(istype(proj,/obj/item/projectile/bullet))
				hit_dir = get_dir(proj.starting, src)
				var/obj/decal/cleanable/blood/B = blood_splatter(get_step(src, hit_dir), src, 1, hit_dir)
				B.icon_state = pick("dir_splatter_1","dir_splatter_2")
				B.SetTransform(scale = min(1, round(proj.damage / 50, 0.2)))
				if(ishuman(src))
					var/mob/living/carbon/human/H = src
					new /obj/temp_visual/bloodsplatter(loc, hit_dir, H.species.blood_color)
				else
					new /obj/temp_visual/bloodsplatter(loc, hit_dir, bleed_colour)
		else
			hit_dir = get_dir(attacker, src)
			var/obj/decal/cleanable/blood/B = blood_splatter(get_step(src, hit_dir), src, 1, hit_dir)
			B.icon_state = pick("dir_splatter_1","dir_splatter_2")
			B.SetTransform(0.5)
			if(ishuman(src))
				var/mob/living/carbon/human/H = src
				new /obj/temp_visual/bloodsplatter(loc, hit_dir, H.species.blood_color)
			else
				new /obj/temp_visual/bloodsplatter(loc, hit_dir, bleed_colour)

	if(create_impact)
		new create_impact(src.loc)

/mob/living/proc/melee_block(amount, armor_damage_amp, mob/living/source = null)
	if((source.zone_sel.selecting == BP_MOUTH || source.zone_sel.selecting == BP_EYES || source.zone_sel.selecting == BP_HEAD))
		var/obj/item/clothing/head/helmet = get_equipped_item(slot_head)

		if(helmet && amount > 0)
			if(prob(helmet.simple_armor_blockchance))
				amount = clamp(amount - helmet.simple_armor_bonus, 0, amount)
				helmet.simple_armor_blockchance -= clamp(helmet.simple_armor_deformation_speed + armor_damage_amp, 0, helmet.simple_armor_blockchance_max)

				if(helmet.simple_armor_blockchance <= 0)
					drop_from_inventory(helmet)
					helmet.throw_at(get_edge_target_turf(src, reverse_direction(dir)), 1, 2, src)
				return amount

			else
				helmet.simple_armor_blockchance -= clamp(helmet.simple_armor_deformation_speed + armor_damage_amp, 0, helmet.simple_armor_blockchance_max)
				amount += 10

				if(helmet.simple_armor_blockchance <= 0)
					drop_from_inventory(helmet)
					helmet.throw_at(get_edge_target_turf(src, reverse_direction(dir)), 1, 2, src)

				return amount
		else
			amount += 10
			return amount

	else
		var/obj/item/clothing/suit/armor = get_equipped_item(slot_wear_suit)
		if(armor && amount > 0 && prob(armor.simple_armor_blockchance))
			amount = clamp(amount - armor.simple_armor_bonus, 0, amount)
			armor.simple_armor_blockchance -= clamp(armor.simple_armor_deformation_speed + armor_damage_amp, 0, armor.simple_armor_blockchance_max)
		return amount

/mob/living/proc/ranged_block(amount, obj/item/projectile/source)
	if((source.def_zone == BP_MOUTH || source.def_zone == BP_EYES || source.def_zone == BP_HEAD))
		var/obj/item/clothing/head/helmet = get_equipped_item(slot_head)
		var/mob/living/carbon/human/H = source.firer

		if(helmet && amount > 0)
			if(prob(helmet.simple_armor_blockchance))
				amount = clamp(amount - helmet.simple_armor_bonus, 0, amount)
				helmet.simple_armor_blockchance -= clamp(helmet.simple_armor_deformation_speed + source.simple_armor_penetration, 0, helmet.simple_armor_blockchance_max)

				if(helmet.simple_armor_blockchance <= 0)
					drop_from_inventory(helmet)
					helmet.throw_at(get_edge_target_turf(src, reverse_direction(dir)), 1, 2, src)
				return amount

			else if(prob(20 * (H.get_skill_value(SKILL_WEAPONS))))
				helmet.simple_armor_blockchance -= clamp(helmet.simple_armor_deformation_speed + source.simple_armor_penetration, 0, helmet.simple_armor_blockchance_max)
				if(helmet.simple_armor_blockchance <= 0)
					drop_from_inventory(helmet)
					helmet.throw_at(get_edge_target_turf(src, reverse_direction(dir)), 1, 2, src)
				amount += 20
			return amount
		else if(prob(20 * (H.get_skill_value(SKILL_WEAPONS))))
			amount += 30
		return amount

	else
		var/obj/item/clothing/suit/armor = get_equipped_item(slot_wear_suit)
		if(armor && amount > 0 && prob(armor.simple_armor_blockchance))
			amount = clamp(amount - armor.simple_armor_bonus, 0, amount)
			armor.simple_armor_blockchance -= clamp(armor.simple_armor_deformation_speed + source.simple_armor_penetration, 0, armor.simple_armor_blockchance_max)
		return amount

/mob/living/proc/simple_health_calculation(amount, armor_damage_amp, should_block = TRUE, vfx_effect = TRUE, atom/movable/source = null, datum/simple_status/add_effect = null, effect_apply_anyway = FALSE, effect_duration = -1)
	set waitfor = FALSE
	appearance_flags |= KEEP_TOGETHER

	if(simple_combat_on)

		var/before_calculation = simple_health
		if(should_block)
			amount = clamp(amount - simple_armor_natural, 0, amount)

			if(istype(source,/obj/item/projectile))
				amount = ranged_block(amount, source)

			if(ishuman(source))
				amount = melee_block(amount, armor_damage_amp, source)

			if(!source)
				var/obj/item/clothing/suit/armor = get_equipped_item(slot_wear_suit)
				if(armor && amount > 0 && prob(armor.simple_armor_blockchance))
					amount = clamp(amount - armor.simple_armor_bonus, 0, amount)
					armor.simple_armor_blockchance -= clamp(armor.simple_armor_deformation_speed + armor_damage_amp, 0, armor.simple_armor_blockchance_max)

		simple_health = clamp(simple_health - amount, 0, max_simple_health)
		if(before_calculation > simple_health)
			regen_period = base_regen_period

			overlay_fullscreen("damage",/obj/screen/fullscreen/simple_damage)

			if(vfx_effect && source)
				if(ishuman(source))
					simple_health_vfx(TRUE, null, null,source)
				if(istype(source,/obj/item/projectile))
					simple_health_vfx(TRUE, /obj/effect/simple_combat_particle/impact, source, null)
			animation_flash_color(src, COLOR_RED)
			sleep(6)

			if(source)
				bonecheck(source)

			if(add_effect)
				add_status_effect(add_effect, effect_duration)
			clear_fullscreen("damage")

		if(before_calculation <= simple_health)
			if(amount == 0 && should_block)
				if(client)
					shake_camera_MARINE(src, steps = 2, strength = 2, time_per_step = 2)

				if(source && istype(source,/obj/item/projectile))
					simple_health_vfx(FALSE, /obj/effect/simple_combat_particle/shieldblock, source, null)
				else
					new /obj/effect/simple_combat_particle/shieldblock(src.loc)
				playsound(loc, SOUNDS_BULLET_METAL, 100, 1)
				animation_flash_color(src, COLOR_CYAN)

				if(add_effect && effect_apply_anyway)
					add_status_effect(add_effect, effect_duration)

				if(source)
					bonecheck(source)

			else if(amount < 0)
				new /obj/effect/simple_combat_particle/healing(src.loc)
				animation_flash_color(src, COLOR_GREEN)

		if(get_status_effect(/datum/simple_status/crit))
			pre_death = TRUE
			if(!ishuman(src))
				remove_status_effect(/datum/simple_status/crit)
				death()
			if(!get_status_effect(/datum/simple_status/hardcrit))
				remove_status_effect(/datum/simple_status/crit)
				add_status_effect(/datum/simple_status/hardcrit, 1 MINUTE)

		if(simple_health <= max_simple_health / 2)
			var/obj/screen/fullscreen/screen = screens["almost_done"]
			if(!screen)
				overlay_fullscreen("almost_done",/obj/screen/fullscreen/almost_done)

		if(simple_health > max_simple_health / 2)
			var/obj/screen/fullscreen/screen = screens["almost_done"]
			if(screen)
				clear_fullscreen("almost_done")

/mob/living/proc/bonecheck(atom/movable/source = null)

	if(ishuman(source))
		var/mob/living/carbon/human/H = source
		if((H.zone_sel.selecting == BP_R_LEG || H.zone_sel.selecting == BP_L_LEG) && prob(100 / (get_skill_value(SKILL_HAULING))))
			add_status_effect(/datum/simple_status/legbroke)
	if(istype(source,/obj/item/projectile))
		var/obj/item/projectile/P = source
		if((P.def_zone == BP_R_LEG || P.def_zone == BP_L_LEG) && prob(100 / (get_skill_value(SKILL_HAULING))))
			add_status_effect(/datum/simple_status/legbroke)

/mob/living/rejuvenate()
	. = ..()

	if(simple_combat_on)
		simple_health_calculation(-max_simple_health, 0, 0, 0)

		if(ishuman(src))
			var/mob/living/carbon/human/H = src
			for(var/obj/item/clothing/armor in H.get_equipped_items())
				armor.simple_armor_blockchance = armor.simple_armor_blockchance_max


		for(var/datum/simple_status/effects in status_effects)
			if(istype(effects,/datum/simple_status/hardcrit))
				stabilized = TRUE
			remove_status_effect(effects)

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
			connected_to.simple_health_calculation(10,0,0,0)

			animation_flash_color(src, COLOR_GREEN)
			update_health_inside()

	if(current_health_inside > 0)
		if(transfering_to && transfering_to.simple_health < transfering_to.max_simple_health)
			if(current_health_inside < 10)
				transfering_to.simple_health_calculation(-current_health_inside,0,0,0)
				current_health_inside = 0
				update_health_inside()

			else
				current_health_inside = clamp(current_health_inside - 10, 0, max_health_inside)
				transfering_to.simple_health_calculation(-10,0,0,0)

				update_health_inside()

			animation_flash_color(src, COLOR_RED)

/mob/living/use_tool(obj/item/tool, mob/living/user, list/click_params)
	if(istype(tool,/obj/item/fd/simple_combat/bloodbag))
		var/obj/item/fd/simple_combat/bloodbag/B = tool
		if(!B.transfering_to)
			if(B.transfering_to != src && B.connected_to != src)
				appearance_flags |= KEEP_TOGETHER
				add_filter("connected", 1, list("type" = "outline", , "size" = 1, "color" = COLOR_WHITE))

				user.anchored = TRUE

				B.transfering_to = src
				B.maptext = STYLE_SMALLFONTS_OUTLINE("CONNECTED", 7, COLOR_WHITE, COLOR_BLACK)
				anchored = TRUE

				return TRUE
		if(B.transfering_to == src)

			user.anchored = FALSE

			B.transfering_to.anchored = FALSE
			B.transfering_to.remove_filter("connected")
			B.transfering_to = null

			if(B.connected_to)
				B.connected_to.remove_filter("connected")
				B.connected_to.anchored = FALSE
				B.connected_to = null

			B.maptext = ""
			return TRUE

	. = ..()

/obj/item/fd/simple_combat/bloodbag/attack_self(mob/user)
	. = ..()

	if(!connected_to)

		if(ishuman(user) && user != connected_to)
			var/mob/living/carbon/human/H = user
			if(H.simple_health > 0)
				connected_to = H
				connected_to.appearance_flags |= KEEP_TOGETHER
				connected_to.add_filter("connected", 1, list("type" = "outline", , "size" = 1, "color" = COLOR_WHITE))
				connected_to.anchored = TRUE
				maptext = STYLE_SMALLFONTS_OUTLINE("CONNECTED", 7, COLOR_WHITE, COLOR_BLACK)
				return TRUE

	if(ishuman(user) && user == connected_to)
		connected_to.remove_filter("connected")
		connected_to.anchored = FALSE
		connected_to = null

		if(transfering_to)
			transfering_to.remove_filter("connected")
			transfering_to.anchored = FALSE
			transfering_to = null

		maptext = ""
		return TRUE

/obj/item/fd/simple_combat/bloodbag/dropped()
	if(connected_to)
		connected_to.remove_filter("connected")
		connected_to.anchored = FALSE

	if(transfering_to)
		transfering_to.remove_filter("connected")
		transfering_to.anchored = FALSE

	connected_to = null
	transfering_to = null

	maptext = ""

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
		if(base_regen_period > 2 && !(get_status_effect(/datum/simple_status/crit) || get_status_effect(/datum/simple_status/hardcrit)))
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
		if(H.base_regen_period > 2 && !(H.get_status_effect(/datum/simple_status/crit) || H.get_status_effect(/datum/simple_status/hardcrit)))
			animation_flash_color(src, COLOR_GREEN)
			H.base_regen_period = 2
			H.regen_for = 5

			playsound(H, 'sound/effects/refill.ogg', 50)
			addtimer(new Callback(H, TYPE_PROC_REF(/mob/living, reset_adrenaline)), 1 MINUTE)

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
		if((get_status_effect(/datum/simple_status/crit) || get_status_effect(/datum/simple_status/hardcrit)) && do_after(user, 2 SECONDS, src, DO_PUBLIC_UNIQUE))
			animation_flash_color(R, COLOR_GREEN)
			if(get_status_effect(/datum/simple_status/crit))
				remove_status_effect(/datum/simple_status/crit)
			if(get_status_effect(/datum/simple_status/hardcrit))
				stabilized = TRUE
				remove_status_effect(/datum/simple_status/hardcrit)
			if(get_status_effect(/datum/simple_status/bleed))
				remove_status_effect(/datum/simple_status/bleed)
			regen_period = base_regen_period
			simple_health_calculation(-10,0,0,0)

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
		if((H.get_status_effect(/datum/simple_status/crit) || H.get_status_effect(/datum/simple_status/hardcrit)) && do_after(H, 2 SECONDS, H, DO_PUBLIC_UNIQUE))
			animation_flash_color(src, COLOR_GREEN)
			if(H.get_status_effect(/datum/simple_status/crit))
				H.remove_status_effect(/datum/simple_status/crit)
			if(H.get_status_effect(/datum/simple_status/hardcrit))
				H.stabilized = TRUE
				H.remove_status_effect(/datum/simple_status/hardcrit)
			if(H.get_status_effect(/datum/simple_status/bleed))
				H.remove_status_effect(/datum/simple_status/bleed)
			H.regen_period = H.base_regen_period
			H.simple_health_calculation(-5,0,0,0)

			sleep(5)
			qdel(src)

		else
			animation_flash_color(src, COLOR_RED)
			return FALSE

/obj/item/fd/simple_combat/splint
	name = "splint"
	desc = "Used to fixate your bone, but not fix it."

	icon = 'mods/_fd/fd_events/icons/simple_medicine.dmi'
	icon_state = "fracturetempfix"

	w_class = ITEM_SIZE_SMALL

/mob/living/use_tool(obj/item/tool, mob/living/user, list/click_params)
	if(istype(tool,/obj/item/fd/simple_combat/splint))
		var/obj/item/fd/simple_combat/splint/S = tool
		if(get_status_effect(/datum/simple_status/legbroke) && do_after(user, 5 SECONDS, src, DO_PUBLIC_UNIQUE))
			animation_flash_color(S, COLOR_GREEN)
			add_status_effect(/datum/simple_status/splinted, 1 MINUTE)

			sleep(5)
			qdel(S)

		else
			animation_flash_color(S, COLOR_RED)
			return FALSE

	. = ..()

/obj/item/fd/simple_combat/splint/attack_self(mob/user)
	. = ..()

	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.get_status_effect(/datum/simple_status/legbroke) && do_after(user, 5 SECONDS, src, DO_PUBLIC_UNIQUE))
			animation_flash_color(src, COLOR_GREEN)
			H.add_status_effect(/datum/simple_status/splinted, 1 MINUTE)

			sleep(5)
			qdel(src)

		else
			animation_flash_color(src, COLOR_RED)
			return FALSE

/obj/item/fd/simple_combat/bandage
	name = "bandage"
	desc = "Used to stop bleeding."

	icon = 'mods/_fd/fd_events/icons/simple_medicine.dmi'
	icon_state = "bleedstop"

	w_class = ITEM_SIZE_TINY
	var/uses = 5
	var/uses_max = 5

	maptext_height = 16
	maptext_width = 96
	maptext_x = 4
	maptext_y = 2

/obj/item/fd/simple_combat/bandage/MouseEntered(location, control, params)
	. = ..()

	if(loc == usr)
		maptext = STYLE_SMALLFONTS_OUTLINE("[uses]/[uses_max]", 7, COLOR_WHITE, COLOR_BLACK)

/obj/item/fd/simple_combat/bandage/MouseExited(location, control, params)
	. = ..()

	if(maptext)
		maptext = ""

/mob/living/use_tool(obj/item/tool, mob/living/user, list/click_params)
	if(istype(tool,/obj/item/fd/simple_combat/bandage))
		var/obj/item/fd/simple_combat/bandage/B = tool
		if(get_status_effect(/datum/simple_status/bleed) && do_after(user, 2 SECONDS, src, DO_PUBLIC_UNIQUE))
			animation_flash_color(B, COLOR_GREEN)
			remove_status_effect(/datum/simple_status/bleed)

			B.uses -= 1

			sleep(5)

			if(B.uses <= 0)
				qdel(B)

		else
			animation_flash_color(B, COLOR_RED)
			return FALSE

	. = ..()

/obj/item/fd/simple_combat/bandage/attack_self(mob/user)
	. = ..()

	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.get_status_effect(/datum/simple_status/bleed) && do_after(user, 2 SECONDS, src, DO_PUBLIC_UNIQUE))
			animation_flash_color(src, COLOR_GREEN)
			H.remove_status_effect(/datum/simple_status/bleed)

			uses -= 1

			sleep(5)

			if(uses <= 0)
				qdel(src)

		else
			animation_flash_color(src, COLOR_RED)
			return FALSE

/obj/item/fd/simple_combat/bonegel
	name = "bone gel"
	desc = "Used to restore broken bones."

	icon = 'mods/_fd/fd_events/icons/simple_medicine.dmi'
	icon_state = "fracturefullfix"

	w_class = ITEM_SIZE_SMALL

/mob/living/use_tool(obj/item/tool, mob/living/user, list/click_params)
	if(istype(tool,/obj/item/fd/simple_combat/bonegel))
		var/obj/item/fd/simple_combat/bonegel/B = tool
		if(get_status_effect(/datum/simple_status/legbroke) && do_after(user, 2 SECONDS, src, DO_PUBLIC_UNIQUE))
			animation_flash_color(B, COLOR_GREEN)
			remove_status_effect(/datum/simple_status/legbroke)

			sleep(5)
			qdel(B)

		else
			animation_flash_color(B, COLOR_RED)
			return FALSE

	. = ..()

/obj/item/fd/simple_combat/bonegel/attack_self(mob/user)
	. = ..()

	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.get_status_effect(/datum/simple_status/legbroke) && do_after(user, 2 SECONDS, src, DO_PUBLIC_UNIQUE))
			animation_flash_color(src, COLOR_GREEN)
			H.remove_status_effect(/datum/simple_status/legbroke)

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
			simple_health_calculation(-20,0,0,0)

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
			H.simple_health_calculation(-20,0,0,0)

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
		if(simple_health < max_simple_health && do_after(user, 2 SECONDS, src, DO_PUBLIC_UNIQUE))
			animation_flash_color(B, COLOR_GREEN)
			remove_status_effect(/datum/simple_status/bleed)
			simple_health_calculation(-60,0,0,0)

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
		if(H.simple_health < H.max_simple_health && do_after(H, 2 SECONDS, H, DO_PUBLIC_UNIQUE))
			animation_flash_color(src, COLOR_GREEN)
			H.remove_status_effect(/datum/simple_status/bleed)
			H.simple_health_calculation(-60,0,0,0)

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

	w_class = ITEM_SIZE_SMALL

/mob/living/use_tool(obj/item/tool, mob/living/user, list/click_params)
	if(istype(tool,/obj/item/fd/simple_combat/big_heal))
		var/obj/item/fd/simple_combat/big_heal/B = tool
		if(simple_health < max_simple_health && do_after(user, 2 SECONDS, src, DO_PUBLIC_UNIQUE))
			animation_flash_color(B, COLOR_GREEN)
			if(get_status_effect(/datum/simple_status/bleed))
				remove_status_effect(/datum/simple_status/bleed)
			simple_health_calculation(-60,0,0,0)

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
		if(H.simple_health < H.max_simple_health && do_after(H, 2 SECONDS, H, DO_PUBLIC_UNIQUE))
			animation_flash_color(src, COLOR_GREEN)
			if(H.get_status_effect(/datum/simple_status/bleed))
				H.remove_status_effect(/datum/simple_status/bleed)
			H.simple_health_calculation(-60,0,0,0)

			sleep(5)
			qdel(src)

		else
			animation_flash_color(src, COLOR_RED)
			return FALSE

/obj/item/fd/simple_combat/full_heal
	name = "medkit"
	desc = "Used to fully restore your body."

	icon = 'mods/_fd/fd_events/icons/simple_medicine.dmi'
	icon_state = "fullheal"

	w_class = ITEM_SIZE_NORMAL
	var/uses = 3
	var/uses_max = 3

	maptext_height = 16
	maptext_width = 96
	maptext_x = 4
	maptext_y = 2

/obj/item/fd/simple_combat/full_heal/MouseEntered(location, control, params)
	. = ..()

	if(loc == usr)
		maptext = STYLE_SMALLFONTS_OUTLINE("[uses]/[uses_max]", 7, COLOR_WHITE, COLOR_BLACK)

/obj/item/fd/simple_combat/full_heal/MouseExited(location, control, params)
	. = ..()

	if(maptext)
		maptext = ""

/mob/living/use_tool(obj/item/tool, mob/living/user, list/click_params)
	if(istype(tool,/obj/item/fd/simple_combat/full_heal))
		var/obj/item/fd/simple_combat/full_heal/F = tool
		if(simple_health < max_simple_health && do_after(user, 30 SECONDS, src, DO_PUBLIC_UNIQUE))
			animation_flash_color(F, COLOR_GREEN)
			for(var/datum/simple_status/effects in status_effects)
				if(istype(effects,/datum/simple_status/hardcrit))
					stabilized = TRUE
				remove_status_effect(effects)
			simple_health_calculation(-(max_simple_health - simple_health),0,0,0)
			F.uses -= 1

			sleep(5)

			if(F.uses <= 0)
				qdel(F)

		else
			animation_flash_color(F, COLOR_RED)
			return FALSE

	. = ..()

/obj/item/fd/simple_combat/full_heal/attack_self(mob/user)
	. = ..()

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

	status_to_add = /datum/simple_status/legbroke
	status_apply_prob = 10

/obj/item/material/twohanded/jack
	simple_damage = 20

	status_to_add = /datum/simple_status/legbroke
	status_ignore_armor = TRUE

	status_apply_prob = 30

/obj/item/material/twohanded/fireaxe
	simple_damage = 20
	simple_armor_penetration = 10

	status_to_add = /datum/simple_status/bleed
	status_timer_to_add = 5 SECONDS

	status_apply_prob = 30

/obj/item/material/sword/katana
	simple_damage = 20
	simple_armor_penetration = 10

	status_to_add = /datum/simple_status/bleed
	status_timer_to_add = 20 SECONDS

	status_apply_prob = 70

/obj/item/material/knife/combat
	simple_damage = 10

	status_to_add = /datum/simple_status/bleed
	status_timer_to_add = 5 SECONDS

	status_apply_prob = 50

/obj/item/crowbar/emergency_forcing_tool
	simple_damage = 10
	simple_armor_penetration = 5

	status_to_add = /datum/simple_status/bleed
	status_timer_to_add = 5 SECONDS

	status_apply_prob = 30

/obj/item/material/hatchet
	simple_damage = 10
	simple_armor_penetration = 5

	status_to_add = /datum/simple_status/bleed
	status_timer_to_add = 5 SECONDS

	status_apply_prob = 30

/obj/item/material/armblade
	simple_damage = 20
	simple_armor_penetration = 10

	status_to_add = /datum/simple_status/bleed
	status_timer_to_add = 20 SECONDS

	status_apply_prob = 70

/obj/item/projectile/beam/midlaser
	simple_damage = 25
	simple_armor_penetration = 5

/obj/item/projectile/beam/smalllaser
	simple_damage = 15

/obj/item/projectile/bullet
	status_to_add = /datum/simple_status/bleed
	status_timer_to_add = 20 SECONDS

	status_apply_prob = 5

/obj/item/projectile/bullet/shotgun
	simple_damage = 20
	simple_armor_penetration = 5

/obj/item/projectile/bullet/rifle
	simple_damage = 20

/obj/item/projectile/bullet/pistol
	simple_damage = 15

/obj/item/projectile/bullet/pistol/strong
	simple_damage = 25
	simple_armor_penetration = 5
