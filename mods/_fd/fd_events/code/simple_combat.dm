/client/proc/cmd_admin_combat_on()
	set category = "Special Verbs"
	set name = "Combat Mode ON"

	if(!check_rights(R_ADMIN))
		return

	for(var/client/client in GLOB.clients)
		if(isliving(client.mob))
			var/mob/living/L = client.mob
			L.simple_combat_on = TRUE

	verbs -= /client/proc/cmd_admin_combat_on
	verbs += /client/proc/cmd_admin_combat_off

/client/proc/cmd_admin_combat_off()
	set category = "Special Verbs"
	set name = "Combat Mode OFF"

	if(!check_rights(R_ADMIN))
		return

	for(var/client/client in GLOB.clients)
		if(isliving(client.mob))
			var/mob/living/L = client.mob
			L.simple_combat_on = FALSE

	verbs -= /client/proc/cmd_admin_combat_off
	verbs += /client/proc/cmd_admin_combat_on



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
	//screen_loc = "EAST-1:28,SOUTH+4:7"
	screen_loc = "EAST-1:28,SOUTH+1:7"

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

	var/simple_target_zone = ""

	var/datum/simple_status/status_to_add = null
	var/status_timer_to_add = -1
	var/status_ignore_armor = FALSE

	var/status_apply_prob = -1

/obj/item/apply_hit_effect(mob/living/target, mob/living/user, hit_zone)
	if(target && user)
		if(target.simple_combat_on)

			if(user.lying && !target.lying)
				if(!(user.zone_sel.selecting in list(BP_L_FOOT, BP_R_FOOT, BP_L_LEG, BP_R_LEG)))
					user.zone_sel.selecting = pick(list(BP_L_LEG, BP_R_LEG))

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

			simple_target_zone = TT.thrower.zone_sel?.selecting
			if(!simple_target_zone)
				simple_target_zone = BP_CHEST

			if(status_to_add)
				if(status_apply_prob > 0)
					if(prob(status_apply_prob))
						L.simple_health_calculation(simple_damage,simple_armor_penetration,1,0,TT.thrower,status_to_add,status_ignore_armor,status_timer_to_add)
						return TRUE
					else
						L.simple_health_calculation(simple_damage,simple_armor_penetration,1,0)
						return TRUE

				else
					L.simple_health_calculation(simple_damage,simple_armor_penetration,1,0,TT.thrower,status_to_add,status_ignore_armor,status_timer_to_add)
					return TRUE

			else
				L.simple_health_calculation(simple_damage,simple_armor_penetration,1,0,TT.thrower)
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

/obj/item/clothing/use_tool(obj/item/tool, mob/living/user, list/click_params)

	if(isWelder(tool) && simple_armor_bonus > 0 && simple_armor_blockchance < simple_armor_blockchance_max && user.simple_combat_on)
		var/obj/item/weldingtool/welder = tool
		if (istype(tool, /obj/item/weldingtool) && !welder.can_use(1, user, "to repair \the [src]'s physical damage."))
			animation_flash_color(tool, COLOR_RED)
			return TRUE

		playsound(src, 'sound/items/Welder.ogg', 50, TRUE)
		user.visible_message(
			SPAN_NOTICE("\The [user] starts repairing some of the dents on \the [src] with \a [tool]."),
			SPAN_NOTICE("You start repairing some of the dents on \the [src] with \the [tool]."),
		)
		if (!do_after(user, (tool.toolspeed * 1) SECOND, src, DO_PUBLIC_UNIQUE) || !user.use_sanity_check(src, tool))
			return TRUE
		if (simple_armor_blockchance >= simple_armor_blockchance_max)
			USE_FEEDBACK_FAILURE("\The [src] has no physical damage to repair.")
			animation_flash_color(tool, COLOR_RED)
			return TRUE
		if (istype(tool, /obj/item/weldingtool) && !welder.can_use(1, user, "to repair \the [src]'s physical damage."))
			animation_flash_color(tool, COLOR_RED)
			return TRUE

		welder.remove_fuel(1, user)

		simple_armor_blockchance = clamp(simple_armor_blockchance + 10, 0, simple_armor_blockchance_max)
		animation_flash_color(src, COLOR_GREEN)
		playsound(src, 'sound/items/Welder.ogg', 50, TRUE)
		return TRUE
	. = ..()

/obj/item/clothing/MouseEntered(location, control, params)
	. = ..()

	if(loc == usr && isliving(usr))
		var/mob/living/L = usr
		if(L.simple_combat_on && simple_armor_bonus > 0)
			maptext = STYLE_SMALLFONTS_OUTLINE("[simple_armor_blockchance]/[simple_armor_blockchance_max]", 7, COLOR_WHITE, COLOR_BLACK)

/obj/item/clothing/MouseExited(location, control, params)
	. = ..()

	if(maptext)
		maptext = ""

/mob/living
	var/simple_combat_on = FALSE

	var/simple_health = 100
	var/max_simple_health = 100

	var/base_regen_period = 20
	var/regen_period = 20
	var/regen_for = 10

	var/bloodyness = 0
	var/image/bloodyness_overlay_own
	var/image/bloodyness_overlay_others

	var/mob/living/remember_the_victim

	var/simple_armor_natural = 0

	var/obj/screen/health_face/h1
	var/obj/screen/health_pulse/h2

	var/simple_crit_screen = /obj/screen/fullscreen/almost_done
	var/simple_damage_screen = /obj/screen/fullscreen/simple_damage

	var/melee_assist = FALSE

	var/stabilized = FALSE
	var/pre_death = FALSE

/mob/living/carbon/human
	var/unarmed_simple_damage = 5
	var/unarmed_simple_sharpness = 0

/mob/living/Life()

	if(simple_combat_on)
		if(simple_health < max_simple_health && !get_status_effect(/datum/simple_status/hardcrit))
			regen_period -= 1

		if(regen_period <= 0)
			simple_health_calculation(-regen_for,0,0,0)
			regen_period = base_regen_period
	. = ..()

/mob/living/movement_delay()
	. = ..()

	if(simple_combat_on)
		if(get_status_effect(/datum/simple_status/crit))
			. += 10

		if(get_status_effect(/datum/simple_status/legbroke) && !get_status_effect(/datum/simple_status/splinted))
			. += 5

		if(get_status_effect(/datum/simple_status/shocked))
			. += 5

		if(get_status_effect(/datum/simple_status/aftercrit))
			. += 2

		if(get_status_effect(/datum/simple_status/meat_movement))
			. -= 5

		if(get_status_effect(/datum/simple_status/attack_damage_buff))
			. -= 5

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
					B.basecolor = bleed_colour
					B.update_icon()

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
				B.basecolor = bleed_colour
				B.update_icon()
				new /obj/temp_visual/bloodsplatter(loc, hit_dir, bleed_colour)

	if(create_impact)
		new create_impact(src.loc)

/mob/living/proc/melee_block(amount, armor_damage_amp, mob/living/source = null)
	var/target_part = source.zone_sel?.selecting // Смотрит выделенную зону на кукле
	if(!target_part) // Если нам возвращает нулл - значит это симплмоб. Давайте зарандомим ему случайную точку для прострела
		target_part = pick(BP_SIMPLE_TARGETS)

	if(target_part in BP_FULL_HEAD) // Мы целимся в голову?
		var/obj/item/clothing/head/helmet = get_equipped_item(slot_head) // У нас есть шлем?

		if(helmet && amount > 0)
			if(prob(helmet.simple_armor_blockchance))
				amount = clamp(amount - helmet.simple_armor_bonus, 0, amount)
				helmet.simple_armor_blockchance -= clamp(helmet.simple_armor_deformation_speed + armor_damage_amp, 0, helmet.simple_armor_blockchance_max)

				if(helmet.simple_armor_blockchance <= 0) // Мы убили шлем в ноль? Он слетает с нашей головы
					drop_from_inventory(helmet)
					helmet.throw_at(get_edge_target_turf(src, reverse_direction(dir)), 1, 2, src)
				return amount

			else // Забрало не помогло, ГГ
				helmet.simple_armor_blockchance -= clamp(helmet.simple_armor_deformation_speed + armor_damage_amp, 0, helmet.simple_armor_blockchance_max)
				amount += 10

				if(helmet.simple_armor_blockchance <= 0) // Мы убили шлем в ноль? Он слетает с нашей головы
					drop_from_inventory(helmet)
					helmet.throw_at(get_edge_target_turf(src, reverse_direction(dir)), 1, 2, src)

				return amount
		else // Шлема нет, фри кил
			amount += 10
			return amount

	else // Мы целимся во что-то другое?
		var/obj/item/clothing/suit/armor = get_equipped_item(slot_wear_suit) // Проверяем наличие бронежилета или любой другой брони в слоте сьюта

		if((target_part in BP_LEGS_FEET) || (target_part in BP_ARMS_HANDS)) // Если мы бьём по конечностям - урон будет снижен, но могут прокнуться прикольные эффекты
			amount = clamp(amount - 5, 0, amount)

			if(target_part in BP_LEGS_FEET) // Хуячим по ногам? Можем сделать перелом
				bonecheck(source)

			// Атаки по рукам имеют 50% шанс выбить из них предмет
			if(target_part in BP_SIMPLE_TARGETS_L_ARM)
				if(prob(50))
					drop_l_hand()

			if(target_part in BP_SIMPLE_TARGETS_R_ARM)
				if(prob(50))
					drop_r_hand()

		if(armor && amount > 0 && prob(armor.simple_armor_blockchance))
			amount = clamp(amount - armor.simple_armor_bonus, 0, amount)
			armor.simple_armor_blockchance -= clamp(armor.simple_armor_deformation_speed + armor_damage_amp, 0, armor.simple_armor_blockchance_max)
		return amount

/mob/living/proc/ranged_block(amount, obj/item/projectile/source)
	var/target_part = source.def_zone // Смотрит выделенную зону на кукле
	if(!ishuman(source.firer)) // Проверяем, является ли стрелок человеком
		target_part = pick(BP_SIMPLE_TARGETS) // Если нет - рандомим ему область попадания (по дефолту мобу стреляют только в грудь)

	if(target_part in BP_FULL_HEAD) // Мы целимся в голову?
		var/obj/item/clothing/head/helmet = get_equipped_item(slot_head) // У нас есть шлем?

		if(helmet && amount > 0)
			if(prob(helmet.simple_armor_blockchance))
				amount = clamp(amount - helmet.simple_armor_bonus, 0, amount)
				helmet.simple_armor_blockchance -= clamp(helmet.simple_armor_deformation_speed + source.simple_armor_penetration, 0, helmet.simple_armor_blockchance_max)

				if(helmet.simple_armor_blockchance <= 0) // Мы убили шлем в ноль? Он слетает с нашей головы
					drop_from_inventory(helmet)
					helmet.throw_at(get_edge_target_turf(src, reverse_direction(dir)), 1, 2, src)
				return amount

			if(ishuman(source.firer))
				var/mob/living/carbon/human/H = source.firer
				if(prob(20 * (H.get_skill_value(SKILL_WEAPONS))))
					helmet.simple_armor_blockchance -= clamp(helmet.simple_armor_deformation_speed + source.simple_armor_penetration, 0, helmet.simple_armor_blockchance_max)
					if(helmet.simple_armor_blockchance <= 0)
						drop_from_inventory(helmet)
						helmet.throw_at(get_edge_target_turf(src, reverse_direction(dir)), 1, 2, src)
					amount += 30
			if(!ishuman(source.firer) && prob(20))
				helmet.simple_armor_blockchance -= clamp(helmet.simple_armor_deformation_speed + source.simple_armor_penetration, 0, helmet.simple_armor_blockchance_max)
				if(helmet.simple_armor_blockchance <= 0)
					drop_from_inventory(helmet)
					helmet.throw_at(get_edge_target_turf(src, reverse_direction(dir)), 1, 2, src)
				amount += 30
			return amount

		if(ishuman(source.firer))
			var/mob/living/carbon/human/H = source.firer
			if(prob(20 * (H.get_skill_value(SKILL_WEAPONS))))
				amount += 30
		if(!ishuman(source.firer) && prob(20))
			amount += 30
		return amount

	else
		var/obj/item/clothing/suit/armor = get_equipped_item(slot_wear_suit)

		if((target_part in BP_LEGS_FEET) || (target_part in BP_ARMS_HANDS)) // Если мы бьём по конечностям - урон будет снижен, но могут прокнуться прикольные эффекты
			amount = clamp(amount - 5, 0, amount)

			if(target_part in BP_LEGS_FEET) // Хуячим по ногам? Можем сделать перелом
				if(ishuman(source.firer))
					var/mob/living/carbon/human/H = source.firer
					if(prob(40 * (H.get_skill_value(SKILL_WEAPONS))))
						bonecheck(source)
				if(!ishuman(source.firer) && prob(20))
					bonecheck(source)

			if(ishuman(src))
				// Стрельба по рукам имеет 50% шанс выбить из них предмет
				if(target_part in BP_SIMPLE_TARGETS_L_ARM)
					if(ishuman(source.firer))
						var/mob/living/carbon/human/H = source.firer
						if(H.get_skill_value(SKILL_WEAPONS) >= SKILL_TRAINED)
							drop_l_hand()
						else
							if(prob(20 * (H.get_skill_value(SKILL_WEAPONS))))
								drop_l_hand()
					if(!ishuman(source.firer) && prob(20))
						drop_l_hand()

				if(target_part in BP_SIMPLE_TARGETS_R_ARM)
					if(ishuman(source.firer))
						var/mob/living/carbon/human/H = source.firer
						if(H.get_skill_value(SKILL_WEAPONS) >= SKILL_TRAINED)
							drop_r_hand()
						else
							if(prob(20 * (H.get_skill_value(SKILL_WEAPONS))))
								drop_r_hand()
					if(!ishuman(source.firer) && prob(20))
						drop_r_hand()

		if(armor && amount > 0 && prob(armor.simple_armor_blockchance))
			amount = clamp(amount - armor.simple_armor_bonus, 0, amount)
			armor.simple_armor_blockchance -= clamp(armor.simple_armor_deformation_speed + source.simple_armor_penetration, 0, armor.simple_armor_blockchance_max)
		return amount

/mob/living/proc/simple_health_calculation(amount, armor_damage_amp, should_block = TRUE, vfx_effect = TRUE, atom/movable/source = null, datum/simple_status/add_effect = null, effect_apply_anyway = FALSE, effect_duration = -1)
	set waitfor = FALSE
	appearance_flags |= KEEP_TOGETHER

	if(simple_combat_on) // Мы в простом режиме?

// БАФФЫ ДАМАГА
		if(source && isliving(source))
			var/mob/living/L = source
			if(L.get_status_effect(/datum/simple_status/attack_damage_buff))
				amount += 10

			if(L.get_status_effect(/datum/simple_status/invisibility))
				amount += 20
				L.remove_status_effect(/datum/simple_status/invisibility)

// БАФФЫ ДАМАГА

		if(should_block) // Должны ли мы попытаться заблокировать входящий урон?
			amount = clamp(amount - simple_armor_natural, 0, amount) // Если ДА, то сначала вычтем из урона наш натуральный показатель брони, привязанный к мобу

			if(istype(source,/obj/item/projectile)) // Если источник урона - прожектайл, то вызываем этот прок
				amount = ranged_block(amount, source)

			if(isliving(source)) // Если источник урона - моб, то вызываем этот прок
				amount = melee_block(amount, armor_damage_amp, source)

			if(!source) // Если у нас нет источника - проверяем всё по простой формуле ниже
				var/obj/item/clothing/suit/armor = get_equipped_item(slot_wear_suit) // На нас есть броня?
				if(armor && amount > 0 && prob(armor.simple_armor_blockchance)) // Проверяем, способны ли мы заблокировать входящий урон с её помощью
					amount = clamp(amount - armor.simple_armor_bonus, 0, amount) // Вычитаем из урона показатель надетой на нас брони
					armor.simple_armor_blockchance -= clamp(armor.simple_armor_deformation_speed + armor_damage_amp, 0, armor.simple_armor_blockchance_max) // Уменьшаем прочность брони

		// Наконец, вычитаем финальный урон из здоровья, но предварительно проверяем, не в хардкрите ли мы
		if(!get_status_effect(/datum/simple_status/hardcrit))
			simple_health = clamp(simple_health - amount, 0, max_simple_health)

		if(amount > 0) // Урон выше чем ноль?
			if(!get_status_effect(/datum/simple_status/adrenaline))
				regen_period = base_regen_period // Стопорим регенерацию на некоторое время

			overlay_fullscreen("damage",simple_damage_screen)

			if(vfx_effect && source) // Нам нужны спец-эффекты при получении урона? У нас есть источник урона?
				if(ishuman(source)) // Прок на случай, если источником является человек
					simple_health_vfx(TRUE, null, null,source)
				if(istype(source,/obj/item/projectile))
					simple_health_vfx(TRUE, /obj/effect/simple_combat_particle/impact, source, null) // Прок на случай, если источником является прожектайл
			animation_flash_color(src, COLOR_RED)

			if(get_status_effect(/datum/simple_status/shielded))
				var/datum/simple_status/shielded/S = get_status_effect(/datum/simple_status/shielded)
				S.amount = clamp(S.amount - 2, 0, S.amount_max)
				new /obj/temp_visual/discharge(src.loc)

			if(get_status_effect(/datum/simple_status/invisibility))
				remove_status_effect(/datum/simple_status/invisibility)

			if(source)
				bloodyness += 2
				if(ishuman(src))
					setup_bloodyness_overlay_self()

				if(ishuman(source) && source != src)
					var/mob/living/L = source
					L.bloodyness += 5
					L.setup_bloodyness_overlay_other(src)

			sleep(6)

			if(add_effect) // Если то чем нас атаковали имеет какие-то эффекты - добавляем их
				add_status_effect(add_effect, effect_duration)
			clear_fullscreen("damage")

		if(amount < 0 && !get_status_effect(/datum/simple_status/hardcrit)) // Урон меньше нуля? Значит нас похилили
			new /obj/effect/simple_combat_particle/healing(src.loc)
			animation_flash_color(src, COLOR_GREEN)
		if(amount == 0 && should_block) // Урон РАВЕН нулю и мы БЛОКИРОВАЛИ его? Проделываем всё то же самое, что и выше, но слегка иначе
			if(client)
				shake_camera_MARINE(src, steps = 2, strength = 2, time_per_step = 2)

			if(source && istype(source,/obj/item/projectile))
				simple_health_vfx(FALSE, /obj/effect/simple_combat_particle/shieldblock, source, null)
			else
				new /obj/effect/simple_combat_particle/shieldblock(src.loc)
			playsound(loc, SOUNDS_BULLET_METAL, 100, 1)
			animation_flash_color(src, COLOR_CYAN)

			if(get_status_effect(/datum/simple_status/shielded))
				var/datum/simple_status/shielded/S = get_status_effect(/datum/simple_status/shielded)
				S.amount = clamp(S.amount - 1, 0, S.amount_max)
				new /obj/temp_visual/discharge(src.loc)

			if(get_status_effect(/datum/simple_status/invisibility))
				remove_status_effect(/datum/simple_status/invisibility)

			if(add_effect && effect_apply_anyway) // Если эффект накладывается даже без необходимости пробития
				add_status_effect(add_effect, effect_duration)

		if(simple_health > max_simple_health / 2) // Если наше итоговое здоровье больше 50%, а на экране всё ещё есть оверлей - убираем его
			var/obj/screen/fullscreen/screen = screens["almost_done"]
			if(screen)
				clear_fullscreen("almost_done")

		if(simple_health <= max_simple_health / 2) // Если наше итоговое здоровье меньше 50% - накладываем на экран оверлей
			var/obj/screen/fullscreen/screen = screens["almost_done"]
			if(!screen)
				overlay_fullscreen("almost_done",simple_crit_screen)

		check_crit(amount) // Проверяем финальное состояние моба

/mob/living/proc/check_crit(damage)

	if(get_status_effect(/datum/simple_status/crit)) // Мы в крите?
		if(damage > 0) // Нам нанесли какой-то урон?
			if(ishuman(src)) // Если мы человек - тогда впадаем в хардкрит
				add_status_effect(/datum/simple_status/hardcrit, 1 MINUTE)
				return
			else // Если нет - тогда сразу умираем
				remove_status_effect(/datum/simple_status/crit)
				death()
				return

		if(damage < 0) // Нас полечили? Удаляем крит
			remove_status_effect(/datum/simple_status/crit)
			return

	if(!get_status_effect(/datum/simple_status/hardcrit)) // Мы НЕ в ХАРДКРИТЕ?
		if(!get_status_effect(/datum/simple_status/crit)) //И даже НЕ в КРИТЕ?
			if(simple_health <= 0) // Если наше здоровье на нуле - впадаем в крит
				add_status_effect(/datum/simple_status/crit)
				return

/mob/living/proc/bonecheck(atom/movable/source = null)

	if(ishuman(source))
		if(prob(100 / (get_skill_value(SKILL_HAULING))))
			add_status_effect(/datum/simple_status/legbroke)

	if(istype(source,/obj/item/projectile))
		if(prob(100 / (get_skill_value(SKILL_HAULING))))
			add_status_effect(/datum/simple_status/legbroke)

/mob/living/proc/setup_bloodyness_overlay_self()
	return TRUE

/mob/living/proc/setup_bloodyness_overlay_other()
	return TRUE

/mob/living/carbon/human/setup_bloodyness_overlay_other(mob/living/victim)
	var/current_bloodyness = 0
	var/desired_color = COLOR_WHITE
	if(victim)
		remember_the_victim = victim

	CutOverlays(bloodyness_overlay_others, ATOM_ICON_CACHE_ALL)
	bloodyness_overlay_others = null

	if(bloodyness < 5)
		return TRUE

	else
		switch(bloodyness)
			if(5 to 24)
				current_bloodyness = 5
			if(25 to 54)
				current_bloodyness = 25
			if(55 to 84)
				current_bloodyness = 55
			else
				current_bloodyness = 85

		if(victim)
			if(!ishuman(victim))
				desired_color = victim.bleed_colour
			else
				var/mob/living/carbon/human/H = victim
				if(isSynthetic(H))
					desired_color = COLOR_BLACK
				else
					desired_color = H.species.blood_color
		else
			if(!ishuman(remember_the_victim))
				desired_color = remember_the_victim.bleed_colour
			else
				var/mob/living/carbon/human/H = remember_the_victim
				if(isSynthetic(H))
					desired_color = COLOR_BLACK
				else
					desired_color = H.species.blood_color

		bloodyness_overlay_others = image('mods/_fd/fd_events/icons/simple_vfx_statuses.dmi', "[species.name]_o_[current_bloodyness]", layer = ABOVE_HUMAN_LAYER)
		bloodyness_overlay_others.color = desired_color
//		bloodyness_overlay_others.filters = filter(type="motion_blur", x = 2)
		AddOverlays(bloodyness_overlay_others, ATOM_ICON_CACHE_ALL)
		return TRUE

/mob/living/carbon/human/setup_bloodyness_overlay_self()
	var/current_bloodyness = 0
	CutOverlays(bloodyness_overlay_own, ATOM_ICON_CACHE_ALL)
	bloodyness_overlay_own = null

	if(bloodyness < 5)
		return TRUE

	else
		switch(bloodyness)
			if(5 to 24)
				current_bloodyness = 5
			if(25 to 54)
				current_bloodyness = 25
			if(55 to 84)
				current_bloodyness = 55
			else
				current_bloodyness = 85

		bloodyness_overlay_own = image('mods/_fd/fd_events/icons/simple_vfx_statuses.dmi', "[species.name]_[current_bloodyness]", layer = ABOVE_HUMAN_LAYER)
		if(isSynthetic(src))
			bloodyness_overlay_own.color = COLOR_BLACK
		else
			bloodyness_overlay_own.color = species.blood_color
		bloodyness_overlay_own.filters = filter(type="motion_blur", y = -1)
		AddOverlays(bloodyness_overlay_own, ATOM_ICON_CACHE_ALL)
		return TRUE

/mob/living/rejuvenate()
	. = ..()

	if(simple_combat_on)
		if(ishuman(src))
			var/mob/living/carbon/human/H = src
			for(var/obj/item/clothing/armor in H.get_equipped_items())
				armor.simple_armor_blockchance = armor.simple_armor_blockchance_max

		if(get_status_effect(/datum/simple_status/hardcrit))
			stabilized = TRUE
			remove_status_effect(/datum/simple_status/hardcrit)

		simple_health_calculation(-max_simple_health, 0, 0, 0)

		for(var/datum/simple_status/effects in status_effects)
			if(effects.positive_effect)
				continue
			remove_status_effect(effects)

/mob/living/ClickOn(atom/A)

	if(melee_assist)
		var/obj/item/S
		if(ishuman(src))
			S = get_active_hand()
		else
			var/mob/living/simple_animal/animal = src
			S = animal.natural_weapon
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

/obj/item/
	var/robot_friendly = TRUE

/obj/item/fd/simple_combat
	robot_friendly = FALSE

/obj/item/fd/simple_combat/attack_self(mob/living/user)

// Надо ли оно вообще? Ты не можешь держать предметы в этом состоянии
/*	if(user.get_status_effect(/datum/simple_status/hardcrit) && !works_in_hardcrit)
		user.balloon_alert(user, "|В ЭТОМ СОСТОЯНИИ ВЫ НИКАК СЕБЕ НЕ ПОМОЖЕТЕ!|", COLOR_RED)
		animation_flash_color(src, COLOR_RED)
		return FALSE*/

	if(issilicon(user) && !robot_friendly)
		animation_flash_color(src, COLOR_RED)
		return FALSE

	if(user.isSynthetic() && !robot_friendly)
		animation_flash_color(src, COLOR_RED)
		return FALSE

	. = ..()

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

		if(issilicon(src) && !B.robot_friendly)
			animation_flash_color(B, COLOR_RED)
			return FALSE

		if(isSynthetic() && !B.robot_friendly)
			animation_flash_color(B, COLOR_RED)
			return FALSE

		if(get_status_effect(/datum/simple_status/hardcrit))
			balloon_alert(user, "|СНАЧАЛА СТАБИЛИЗИРУЙТЕ ПАЦИЕНТА!|", COLOR_RED)
			animation_flash_color(B, COLOR_RED)
			return FALSE

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
	..()

	if(connected_to)
		connected_to.remove_filter("connected")
		connected_to.anchored = FALSE

	if(transfering_to)
		transfering_to.remove_filter("connected")
		transfering_to.anchored = FALSE

	connected_to = null
	transfering_to = null

	maptext = ""

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

	icon = 'mods/_fd/fd_assets/icons/tg/syringe.dmi'
	icon_state = "stimpen"

	w_class = ITEM_SIZE_SMALL

/mob/living/use_tool(obj/item/tool, mob/living/user, list/click_params)
	if(istype(tool,/obj/item/fd/simple_combat/adrenaline))
		var/obj/item/fd/simple_combat/adrenaline/A = tool

		if(issilicon(src) && !A.robot_friendly)
			animation_flash_color(A, COLOR_RED)
			return FALSE

		if(isSynthetic() && !A.robot_friendly)
			animation_flash_color(A, COLOR_RED)
			return FALSE

		if(get_status_effect(/datum/simple_status/hardcrit))
			balloon_alert(user, "|СНАЧАЛА СТАБИЛИЗИРУЙТЕ ПАЦИЕНТА!|", COLOR_RED)
			animation_flash_color(A, COLOR_RED)
			return FALSE

		if(base_regen_period > 2 && !get_status_effect(/datum/simple_status/crit))
			A.icon_state = "stimpen0"
			animation_flash_color(A, COLOR_GREEN)
			base_regen_period = 2
			regen_for = 5

			add_status_effect(/datum/simple_status/adrenaline)

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
		if(H.base_regen_period > 2 && !H.get_status_effect(/datum/simple_status/crit))
			icon_state = "stimpen0"
			animation_flash_color(src, COLOR_GREEN)
			H.base_regen_period = 2
			H.regen_for = 5

			H.add_status_effect(/datum/simple_status/adrenaline)

			playsound(H, 'sound/effects/refill.ogg', 50)
			addtimer(new Callback(H, TYPE_PROC_REF(/mob/living, reset_adrenaline)), 1 MINUTE)

			sleep(5)
			qdel(src)

		else
			animation_flash_color(src, COLOR_RED)
			return FALSE

/mob/living/proc/reset_adrenaline()
	remove_status_effect(/datum/simple_status/adrenaline)
	base_regen_period = initial(base_regen_period)
	regen_for = initial(regen_for)

/obj/item/fd/simple_combat/revive
	name = "revival fluid"
	desc = "Used to get you up."

	icon = 'mods/_fd/fd_assets/icons/tg/syringe.dmi'
	icon_state = "syndipen"

	w_class = ITEM_SIZE_TINY

/mob/living/use_tool(obj/item/tool, mob/living/user, list/click_params)
	if(istype(tool,/obj/item/fd/simple_combat/revive))
		var/obj/item/fd/simple_combat/revive/R = tool

		if(issilicon(src) && !R.robot_friendly)
			animation_flash_color(R, COLOR_RED)
			return FALSE

		if(isSynthetic() && !R.robot_friendly)
			animation_flash_color(R, COLOR_RED)
			return FALSE

		if((get_status_effect(/datum/simple_status/crit) || get_status_effect(/datum/simple_status/hardcrit)) && do_after(user, 2 SECONDS, src, DO_PUBLIC_UNIQUE))
			R.icon_state = "syndipen0"
			animation_flash_color(R, COLOR_GREEN)
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
			icon_state = "syndipen0"
			animation_flash_color(src, COLOR_GREEN)
			if(H.get_status_effect(/datum/simple_status/hardcrit))
				H.stabilized = TRUE
				H.remove_status_effect(/datum/simple_status/hardcrit)
			if(H.get_status_effect(/datum/simple_status/aftercrit))
				H.remove_status_effect(/datum/simple_status/aftercrit)
			if(H.get_status_effect(/datum/simple_status/bleed))
				H.remove_status_effect(/datum/simple_status/bleed)

			H.regen_period = H.base_regen_period
			H.simple_health_calculation(-5,0,0,0)

			sleep(5)
			qdel(src)

		else
			animation_flash_color(src, COLOR_RED)
			return FALSE

/*/obj/item/fd/simple_combat/splint
	name = "splint"
	desc = "Used to fixate your bone, but not fix it."

	icon = 'mods/_fd/fd_events/icons/simple_medicine.dmi'
	icon_state = "fracturetempfix"

	w_class = ITEM_SIZE_SMALL*/

/obj/item/stack/medical/splint
	robot_friendly = FALSE

/mob/living/use_tool(obj/item/tool, mob/living/user, list/click_params)
	if(istype(tool,/obj/item/stack/medical/splint) && simple_combat_on)
		var/obj/item/stack/medical/splint/S = tool

		if(issilicon(src) && !S.robot_friendly)
			animation_flash_color(S, COLOR_RED)
			return FALSE

		if(isSynthetic() && !S.robot_friendly)
			animation_flash_color(S, COLOR_RED)
			return FALSE

		if(get_status_effect(/datum/simple_status/legbroke) && do_after(user, 5 SECONDS, src, DO_PUBLIC_UNIQUE))
			animation_flash_color(S, COLOR_GREEN)
			add_status_effect(/datum/simple_status/splinted, 10 MINUTES)

			sleep(5)
			qdel(S)

		else
			animation_flash_color(S, COLOR_RED)
			return FALSE

	. = ..()

/obj/item/stack/medical/splint/attack_self(mob/user)
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.simple_combat_on)
			if(H.get_status_effect(/datum/simple_status/legbroke) && do_after(user, 5 SECONDS, src, DO_PUBLIC_UNIQUE))
				animation_flash_color(src, COLOR_GREEN)
				H.add_status_effect(/datum/simple_status/splinted, 10 MINUTES)

				sleep(5)
				qdel(src)

			else
				animation_flash_color(src, COLOR_RED)
				return FALSE

	. = ..()

/*/obj/item/fd/simple_combat/bandage
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
	maptext_y = 2*/

/obj/item/stack/medical/bruise_pack
	robot_friendly = FALSE
	var/uses = 5
	var/uses_max = 5

	maptext_height = 16
	maptext_width = 96
	maptext_x = 4
	maptext_y = 2

/obj/item/stack/medical/bruise_pack/MouseEntered(location, control, params)
	. = ..()

	var/mob/living/L = usr
	if(loc == L && L.simple_combat_on)
		maptext = STYLE_SMALLFONTS_OUTLINE("[uses]/[uses_max]", 7, COLOR_WHITE, COLOR_BLACK)

/obj/item/stack/medical/bruise_pack/MouseExited(location, control, params)
	. = ..()

	if(maptext)
		maptext = ""

/mob/living/use_tool(obj/item/tool, mob/living/user, list/click_params)
	if(istype(tool,/obj/item/stack/medical/bruise_pack) && simple_combat_on)
		var/obj/item/stack/medical/bruise_pack/B = tool

		if(issilicon(src) && !B.robot_friendly)
			animation_flash_color(B, COLOR_RED)
			return FALSE

		if(isSynthetic() && !B.robot_friendly)
			animation_flash_color(B, COLOR_RED)
			return FALSE

		if(get_status_effect(/datum/simple_status/bleed) && do_after(user, 2 SECONDS, src, DO_PUBLIC_UNIQUE))
			animation_flash_color(B, COLOR_GREEN)
			add_status_effect(/datum/simple_status/bandaged, 10 SECONDS)

			B.uses -= 1

			sleep(5)

			if(B.uses <= 0)
				qdel(B)

		else
			animation_flash_color(B, COLOR_RED)
			return FALSE

	. = ..()

/obj/item/stack/medical/bruise_pack/attack_self(mob/user)
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.simple_combat_on)
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

	. = ..()

/*/obj/item/fd/simple_combat/bonegel
	name = "bone gel"
	desc = "Used to restore broken bones."

	icon = 'mods/_fd/fd_events/icons/simple_medicine.dmi'
	icon_state = "fracturefullfix"

	w_class = ITEM_SIZE_SMALL
	var/uses = 4
	var/uses_max = 4

	maptext_height = 16
	maptext_width = 96
	maptext_x = 4
	maptext_y = 2*/

/obj/item/bonegel
	var/uses = 4
	var/uses_max = 4

	maptext_height = 16
	maptext_width = 96
	maptext_x = 4
	maptext_y = 2
	robot_friendly = FALSE

/obj/item/bonegel/MouseEntered(location, control, params)
	. = ..()

	var/mob/living/L = usr
	if(loc == L && L.simple_combat_on)
		maptext = STYLE_SMALLFONTS_OUTLINE("[uses]/[uses_max]", 7, COLOR_WHITE, COLOR_BLACK)

/obj/item/bonegel/MouseExited(location, control, params)
	. = ..()

	if(maptext)
		maptext = ""

/mob/living/use_tool(obj/item/tool, mob/living/user, list/click_params)
	if(istype(tool,/obj/item/bonegel) && simple_combat_on)
		var/obj/item/bonegel/B = tool

		if(issilicon(src) && !B.robot_friendly)
			animation_flash_color(B, COLOR_RED)
			return FALSE

		if(isSynthetic() && !B.robot_friendly)
			animation_flash_color(B, COLOR_RED)
			return FALSE

		if(get_status_effect(/datum/simple_status/legbroke) && do_after(user, 2 SECONDS, src, DO_PUBLIC_UNIQUE))
			animation_flash_color(B, COLOR_GREEN)
			remove_status_effect(/datum/simple_status/legbroke)

			B.uses -= 1

			sleep(5)

			if(B.uses <= 0)
				qdel(B)

		else
			animation_flash_color(B, COLOR_RED)
			return FALSE

	. = ..()

/obj/item/bonegel/attack_self(mob/user)
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.simple_combat_on)
			if(H.get_status_effect(/datum/simple_status/legbroke) && do_after(user, 2 SECONDS, src, DO_PUBLIC_UNIQUE))
				animation_flash_color(src, COLOR_GREEN)
				H.remove_status_effect(/datum/simple_status/legbroke)

				uses -= 1

				sleep(5)

				if(uses <= 0)
					qdel(src)

			else
				animation_flash_color(src, COLOR_RED)
				return FALSE

	. = ..()

/*/obj/item/fd/simple_combat/small_heal
	name = "medical gel"
	desc = "Used to heal minor body damage."

	icon = 'mods/_fd/fd_events/icons/simple_medicine.dmi'
	icon_state = "small_heal"

	w_class = ITEM_SIZE_TINY*/

/obj/item/stack/medical/ointment
	robot_friendly = FALSE

/mob/living/use_tool(obj/item/tool, mob/living/user, list/click_params)
	if(istype(tool,/obj/item/stack/medical/ointment) && simple_combat_on)
		var/obj/item/stack/medical/ointment/S = tool

		if(issilicon(src) && !S.robot_friendly)
			animation_flash_color(S, COLOR_RED)
			return FALSE

		if(isSynthetic() && !S.robot_friendly)
			animation_flash_color(S, COLOR_RED)
			return FALSE

		if(get_status_effect(/datum/simple_status/hardcrit))
			balloon_alert(user, "|СНАЧАЛА СТАБИЛИЗИРУЙТЕ ПАЦИЕНТА!|", COLOR_RED)
			animation_flash_color(S, COLOR_RED)
			return FALSE

		if(simple_health < max_simple_health)
			animation_flash_color(S, COLOR_GREEN)
			simple_health_calculation(-20,0,0,0)

			sleep(5)
			qdel(S)

		else
			animation_flash_color(S, COLOR_RED)
			return FALSE

	. = ..()

/obj/item/stack/medical/ointment/attack_self(mob/user)
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.simple_combat_on)
			if(H.simple_health < H.max_simple_health)
				animation_flash_color(src, COLOR_GREEN)
				H.simple_health_calculation(-20,0,0,0)

				sleep(5)
				qdel(src)

			else
				animation_flash_color(src, COLOR_RED)
				return FALSE

	. = ..()

/*/obj/item/fd/simple_combat/big_heal
	name = "medical injector"
	desc = "Used to heal heavy wounds."

	icon = 'mods/_fd/fd_events/icons/simple_medicine.dmi'
	icon_state = "big_heal"

	w_class = ITEM_SIZE_TINY*/

/obj/item/stack/medical/advanced/bruise_pack
	robot_friendly = FALSE

/mob/living/use_tool(obj/item/tool, mob/living/user, list/click_params)
	if(istype(tool,/obj/item/stack/medical/advanced/bruise_pack) && simple_combat_on)
		var/obj/item/stack/medical/advanced/bruise_pack/B = tool

		if(issilicon(src) && !B.robot_friendly)
			animation_flash_color(B, COLOR_RED)
			return FALSE

		if(isSynthetic() && !B.robot_friendly)
			animation_flash_color(B, COLOR_RED)
			return FALSE

		if(get_status_effect(/datum/simple_status/hardcrit))
			balloon_alert(user, "|СНАЧАЛА СТАБИЛИЗИРУЙТЕ ПАЦИЕНТА!|", COLOR_RED)
			animation_flash_color(B, COLOR_RED)
			return FALSE

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

/obj/item/stack/medical/advanced/bruise_pack/attack_self(mob/user)
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.simple_combat_on)
			if(H.simple_health < H.max_simple_health && do_after(H, 2 SECONDS, H, DO_PUBLIC_UNIQUE))
				animation_flash_color(src, COLOR_GREEN)
				H.remove_status_effect(/datum/simple_status/bleed)
				H.simple_health_calculation(-60,0,0,0)

				sleep(5)
				qdel(src)

			else
				animation_flash_color(src, COLOR_RED)
				return FALSE

	. = ..()

/*/obj/item/fd/simple_combat/full_heal
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
	maptext_y = 2*/

/obj/item/storage/firstaid/combat
	var/uses = 3
	var/uses_max = 3

	maptext_height = 16
	maptext_width = 96
	maptext_x = 4
	maptext_y = 2
	robot_friendly = FALSE

/obj/item/storage/firstaid/combat/MouseEntered(location, control, params)
	. = ..()

	var/mob/living/L = usr
	if(loc == L && L.simple_combat_on)
		maptext = STYLE_SMALLFONTS_OUTLINE("[uses]/[uses_max]", 7, COLOR_WHITE, COLOR_BLACK)

/obj/item/storage/firstaid/combat/MouseExited(location, control, params)
	. = ..()

	if(maptext)
		maptext = ""

/mob/living/use_tool(obj/item/tool, mob/living/user, list/click_params)
	if(istype(tool,/obj/item/storage/firstaid/combat) && src != user && simple_combat_on)
		var/obj/item/storage/firstaid/combat/F = tool

		if(issilicon(src) && !F.robot_friendly)
			animation_flash_color(F, COLOR_RED)
			return FALSE

		if(isSynthetic() && !F.robot_friendly)
			animation_flash_color(F, COLOR_RED)
			return FALSE

		if((simple_health < max_simple_health || length(status_effects)) && do_after(user, 30 SECONDS, src, DO_PUBLIC_UNIQUE))
			animation_flash_color(F, COLOR_GREEN)
			simple_health_calculation(-(max_simple_health - simple_health),0,0,0)

			for(var/datum/simple_status/effects in status_effects)
				if(effects.positive_effect)
					continue
				if(istype(effects,/datum/simple_status/aftercrit))
					continue
				if(istype(effects,/datum/simple_status/hardcrit))
					stabilized = TRUE
				remove_status_effect(effects)

			F.uses -= 1

			sleep(5)

			if(F.uses <= 0)
				qdel(F)

		else
			animation_flash_color(F, COLOR_RED)
			return FALSE

	. = ..()

/obj/item/storage/firstaid/combat/attack_self(mob/user)
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.simple_combat_on)
			animation_flash_color(src, COLOR_RED)
			return FALSE

	. = ..()

/obj/item/storage/firstaid/combat/attack_hand(mob/user)
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.simple_combat_on)
			if(src.loc == user)
				animation_flash_color(src, COLOR_RED)
				return FALSE

	. = ..()

/obj/item/storage/firstaid/combat/MouseDrop(obj/over_object as obj)
	var/mob/living/L = usr
	if(L.simple_combat_on)
		animation_flash_color(src, COLOR_RED)
		return FALSE

	. = ..()

/obj/item/storage/firstaid/combat/AltClick(mob/usr)
	var/mob/living/L = usr
	if(L.simple_combat_on)
		animation_flash_color(src, COLOR_RED)
		return FALSE

	. = ..()

/obj/item/storage/firstaid/combat/can_be_inserted(obj/item/W, mob/user, stop_messages = 0)
	var/mob/living/L = user
	if(L.simple_combat_on)
		animation_flash_color(src, COLOR_RED)
		return FALSE

	. = ..()

/mob/living/use_tool(obj/item/tool, mob/living/user, list/click_params)
	if(isWelder(tool) && isSynthetic() && simple_combat_on)
		if (user == src)
			animation_flash_color(tool, COLOR_RED)
			USE_FEEDBACK_FAILURE("You lack the reach to be able to repair yourself.")
			return TRUE
		if(simple_health >= max_simple_health)
			animation_flash_color(tool, COLOR_RED)
			return TRUE

		var/obj/item/weldingtool/welder = tool

		if (istype(tool, /obj/item/weldingtool) && !welder.can_use(1, user, "to repair \the [src]'s physical damage."))
			animation_flash_color(tool, COLOR_RED)
			return TRUE

		playsound(src, 'sound/items/Welder.ogg', 50, TRUE)
		user.visible_message(
			SPAN_NOTICE("\The [user] starts repairing some of the dents on \the [src] with \a [tool]."),
			SPAN_NOTICE("You start repairing some of the dents on \the [src] with \the [tool]."),
		)

		if (!do_after(user, (tool.toolspeed * 5) SECOND, src, DO_PUBLIC_UNIQUE) || !user.use_sanity_check(src, tool))
			return TRUE
		if (simple_health >= max_simple_health)
			USE_FEEDBACK_FAILURE("\The [src] has no physical damage to repair.")
			animation_flash_color(tool, COLOR_RED)
			return TRUE
		if (!welder.can_use(5, user, "to repair \the [src]'s physical damage."))
			animation_flash_color(tool, COLOR_RED)
			return TRUE

		welder.remove_fuel(5, user)

		simple_health_calculation(-10,0,0,0)
		animation_flash_color(tool, COLOR_GREEN)
		playsound(src, 'sound/items/Welder.ogg', 50, TRUE)

		user.visible_message(
			SPAN_NOTICE("\The [user] repairs some of the dents on \the [src] with \a [tool]."),
			SPAN_NOTICE("You repair some of the dents on \the [src] with \the [tool]."),
		)
		return TRUE

	if (isCoil(tool) && isSynthetic() && simple_combat_on)
		if (user == src)
			animation_flash_color(tool, COLOR_RED)
			USE_FEEDBACK_FAILURE("You lack the reach to be able to repair yourself.")
			return TRUE
		if (!get_status_effect(/datum/simple_status/legbroke))
			animation_flash_color(tool, COLOR_RED)
			USE_FEEDBACK_FAILURE("\The [src] has no electronics damage to repair.")
			return TRUE

		var/obj/item/stack/cable_coil/cable = tool

		if (!cable.can_use(1))
			animation_flash_color(tool, COLOR_RED)
			USE_FEEDBACK_STACK_NOT_ENOUGH(cable, 1, "to repair \the [src]'s electronics damage.")
			return TRUE

		user.visible_message(
			SPAN_NOTICE("\The [user] starts repairing some of the electronics in \the [src] with [cable.get_vague_name(FALSE)]."),
			SPAN_NOTICE("You start repairing some of the electronics in \the [src] with [cable.get_exact_name(1)]."),
		)

		if (!do_after(user, 5 SECOND, src, DO_PUBLIC_UNIQUE) || !user.use_sanity_check(src, tool))
			return TRUE
		if (!get_status_effect(/datum/simple_status/legbroke))
			animation_flash_color(tool, COLOR_RED)
			USE_FEEDBACK_FAILURE("\The [src] has no electronics damage to repair.")
			return TRUE
		if (!cable.can_use(1))
			animation_flash_color(tool, COLOR_RED)
			USE_FEEDBACK_STACK_NOT_ENOUGH(cable, 1, "to repair \the [src]'s electronics damage.")
			return TRUE

		cable.use(1)

		remove_status_effect(/datum/simple_status/legbroke)
		animation_flash_color(tool, COLOR_GREEN)

		user.visible_message(
			SPAN_NOTICE("\The [user] repairs some of the electronics in \the [src] with [cable.get_vague_name(FALSE)]."),
			SPAN_NOTICE("You repair some of the electronics in \the [src] with some [cable.get_exact_name(1)]."),
		)
		return TRUE

	. = ..()

/datum/interactive_note/tutorial_ooc/combat1
	name = "Броня и части тела"
	note_info = {"<br /> \
				Фактическую защиту дают лишь те предметы, что надеты в слот <b><span style="color: yellow;">верхней одежды</span></b> или <b><span style="color: yellow;">головы</span></b><br /> \
				Урон в голову (при пробитии) <b><span style="color: yellow;">всегда будет выше</span></b><br /> \
				Урон по конечностям <b><span style="color: yellow;">всегда будет ниже</span></b>, но имеет дополнительные эффекты<br /> \
				Попадание в ноги может привести к <b><span style="color: yellow;">перелому</span></b><br /> \
				Попадание в руки может <b><span style="color: yellow;">выбить из них предмет</span></b> при наличии<br /> \
				<br /> \
				НПС <b><span style="color: red;">нет смысла</span></b> стрелять по рукам, но более чем полезно стрелять куда-либо ещё<br /> \
				Броня может <b><span style="color: red;">износиться</span></b>. Чем выше её износ - тем ниже шанс заблокировать входящий урон. Чините её используя <b><span style="color: green;">сварку</span></b>"}

/datum/interactive_note/tutorial_ooc/combat1/reveal_note_to_player(mob/living/user)
	user.reading = TRUE

	user.overlay_fullscreen("background_note", note_overlay)
	user.overlay_fullscreen("smallshade", /obj/screen/fullscreen/shade)

	if(connected_note)
		if(!connected_note.ci)
			connected_note.ci = new /obj/screen/cancel_interaction()

		connected_note.ci.connected_mob = user
		user.client.screen += connected_note.ci
		animate(connected_note.ci, transform = matrix(-128, 0, MATRIX_TRANSLATE), alpha = 255, time = 3, easing = SINE_EASING|EASE_IN)

	spawn(0.5 SECONDS)

		var/message = "[note_info]"
		var/message_name = "[name]"

		var/obj/screen/player_message/note_text/maintext = new /obj/screen/player_message/note_text()
		var/obj/screen/novel_message/note_name/nameplate = new /obj/screen/novel_message/note_name()
		maintext.layer = 5.4
		nameplate.layer = 5.4

		nameplate.maptext_x = -75
		nameplate.maptext_y = -15
		maintext.maptext_x = 0
		maintext.maptext_y = -320

		user.client.screen += maintext
		user.client.screen += nameplate
		maintext.set_text(message, COLOR_WHITE)
		nameplate.set_text(message_name, COLOR_WHITE)

/datum/interactive_note/tutorial_ooc/combat2
	name = "Статусы"
	note_info = {"<br /> \
				<b><span style="color: red;">Кровотечение</span></b> - пассивно отнимает здоровье. Убирается <b><span style="color: green;">медкитом</span></b>. Может быть временно остановлено <b><span style="color: green;">бинтами</span></b><br /> \
				<b><span style="color: red;">Перелом</span></b> - понижает базовую скорость передвижения. Убирается <b><span style="color: green;">медкитом</span></b> или <b><span style="color: green;">костным гелем</span></b>. Может быть временно исправлен <b><span style="color: green;">шиной</span></b><br /> \
				<b><span style="color: red;">Крит</span></b> - замедляет, роняет, но всё ещё позволяет производить некоторые интеракции. Убирается <b><span style="color: green;">любым лечением</span></b>. Может превратиться в хардкрит при получении <b><span style="color: red;">любого урона</span></b><br /> \
				<b><span style="color: red;">Хардкрит</span></b> - персонаж при смерти. Не даёт двигаться, роняет. Убирается <b><span style="color: green;">медкитом</span></b>, <b><span style="color: green;">восстанавливающей жидкостью</span></b>, или <b><span style="color: green;">нажатием по персонажу</span></b>. Если помощь не будет оказана в течении минуты - персонаж <b><span style="color: red;">умрёт</span></b>"}

/datum/interactive_note/tutorial_ooc/combat2/reveal_note_to_player(mob/living/user)
	user.reading = TRUE

	user.overlay_fullscreen("background_note", note_overlay)
	user.overlay_fullscreen("smallshade", /obj/screen/fullscreen/shade)

	if(connected_note)
		if(!connected_note.ci)
			connected_note.ci = new /obj/screen/cancel_interaction()

		connected_note.ci.connected_mob = user
		user.client.screen += connected_note.ci
		animate(connected_note.ci, transform = matrix(-128, 0, MATRIX_TRANSLATE), alpha = 255, time = 3, easing = SINE_EASING|EASE_IN)

	spawn(0.5 SECONDS)

		var/message = "[note_info]"
		var/message_name = "[name]"

		var/obj/screen/player_message/note_text/maintext = new /obj/screen/player_message/note_text()
		var/obj/screen/novel_message/note_name/nameplate = new /obj/screen/novel_message/note_name()
		maintext.layer = 5.4
		nameplate.layer = 5.4

		nameplate.maptext_x = -75
		nameplate.maptext_y = -15
		maintext.maptext_x = 0
		maintext.maptext_y = -340

		user.client.screen += maintext
		user.client.screen += nameplate
		maintext.set_text(message, COLOR_WHITE)
		nameplate.set_text(message_name, COLOR_WHITE)

/datum/interactive_note/tutorial_ooc/combat3
	name = "Лечение 1"
	note_info = {"<br /> \
				<b><span style="color: green;">Гель, Инъектор, Медкит</span></b> - восстанавливает N-ое количество здоровья, закрывают <b><span style="color: red;">кровотечение</span></b>. Медкит убирает <b><span style="color: green;">все статусы</span></b><br /> \
				<br /> \
				<b><span style="color: green;">Костный гель</span></b> - полностью убирает <b><span style="color: red;">перелом</span></b><br /> \
				<b><span style="color: green;">Шина</span></b> - временно убирает негативный эффект <b><span style="color: red;">перелома</span></b><br /> \
				<b><span style="color: green;">Бинт</span></b> - временно убирает негативный эффект <b><span style="color: red;">кровотечения</span></b>"}

/datum/interactive_note/tutorial_ooc/combat3/reveal_note_to_player(mob/living/user)
	user.reading = TRUE

	user.overlay_fullscreen("background_note", note_overlay)
	user.overlay_fullscreen("smallshade", /obj/screen/fullscreen/shade)

	if(connected_note)
		if(!connected_note.ci)
			connected_note.ci = new /obj/screen/cancel_interaction()

		connected_note.ci.connected_mob = user
		user.client.screen += connected_note.ci
		animate(connected_note.ci, transform = matrix(-128, 0, MATRIX_TRANSLATE), alpha = 255, time = 3, easing = SINE_EASING|EASE_IN)

	spawn(0.5 SECONDS)

		var/message = "[note_info]"
		var/message_name = "[name]"

		var/obj/screen/player_message/note_text/maintext = new /obj/screen/player_message/note_text()
		var/obj/screen/novel_message/note_name/nameplate = new /obj/screen/novel_message/note_name()
		maintext.layer = 5.4
		nameplate.layer = 5.4

		nameplate.maptext_x = -75
		nameplate.maptext_y = -15
		maintext.maptext_x = 0
		maintext.maptext_y = -260

		user.client.screen += maintext
		user.client.screen += nameplate
		maintext.set_text(message, COLOR_WHITE)
		nameplate.set_text(message_name, COLOR_WHITE)

/datum/interactive_note/tutorial_ooc/combat4
	name = "Лечение 2"

/datum/interactive_note/tutorial_ooc/combat4/reveal_note_to_player(mob/living/user)
	note_info = {"<br /> \
				<b><span style="color: green;">Мешок для хранения крови</span></b> - подсоедините к себе нажатием <b><span style="color: yellow;">[user.retrieve_bind("activate_inhand")]</span></b>, чтобы поместить туда часть своего здоровья и затем нажмите эту же кнопку чтобы отцепить пакет от себя. <b><span style="color: yellow;">Нажмите по другому человеку</span></b>, чтобы передать это здоровье ему. Чтобы отцепить пакет от человека - нажмите по нему ещё раз<br /> \
				<br /> \
				<b><span style="color: green;">Стабилизатор</span></b> - временно повышает вашу <b><span style="color: green;">регенерацию</span></b><br /> \
				<b><span style="color: green;">Восстанавливающая жидкость</span></b> - убирает эффекты <b><span style="color: red;">крита</span></b>, <b><span style="color: red;">хардкрита</span></b>, <b><span style="color: red;">кровотечения</span></b>"}

	user.reading = TRUE

	user.overlay_fullscreen("background_note", note_overlay)
	user.overlay_fullscreen("smallshade", /obj/screen/fullscreen/shade)

	if(connected_note)
		if(!connected_note.ci)
			connected_note.ci = new /obj/screen/cancel_interaction()

		connected_note.ci.connected_mob = user
		user.client.screen += connected_note.ci
		animate(connected_note.ci, transform = matrix(-128, 0, MATRIX_TRANSLATE), alpha = 255, time = 3, easing = SINE_EASING|EASE_IN)

	spawn(0.5 SECONDS)

		var/message = "[note_info]"
		var/message_name = "[name]"

		var/obj/screen/player_message/note_text/maintext = new /obj/screen/player_message/note_text()
		var/obj/screen/novel_message/note_name/nameplate = new /obj/screen/novel_message/note_name()
		maintext.layer = 5.4
		nameplate.layer = 5.4

		nameplate.maptext_x = -75
		nameplate.maptext_y = -15
		maintext.maptext_x = 0
		maintext.maptext_y = -260

		user.client.screen += maintext
		user.client.screen += nameplate
		maintext.set_text(message, COLOR_WHITE)
		nameplate.set_text(message_name, COLOR_WHITE)

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

/obj/item/projectile/beam/particle
	simple_damage = 25

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

/datum/admins/proc/simplecombat_changer(mob/living/player in GLOB.alive_mobs)
	set category = null
	set name = "Change Combat Mode"
	set desc = "Turning on Simple Combat(tm) for some idiots."

	if(!check_rights())
		return

	if(!istype(player) || !player)
		to_chat(usr, "This can only be used on instances of type /mob/living")
		return

	player.simple_combat_on = !player.simple_combat_on
	log_and_message_admins("[player.simple_combat_on? "включил" : "выключил"] симплкомбат для [player]")

// [I hate you, Void. - Maximum123]
/mob/living
	var/robotic = FALSE

/obj/item/gun
	var/sprite_direction = "east"

// [/I hate you, Void. - Maximum123] // Если переносишь - не забывай удалять прошлые инстанции, Макс >:(
