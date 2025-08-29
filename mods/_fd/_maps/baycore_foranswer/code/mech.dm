/mob/living/simple_animal/fd/lancer
	name = "Armored Personal Unit (APU)"
	desc = "An special experimental vehicle."
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/mechs/trooper_def.dmi'
	icon_state = "trooper"

	faction = "Players"

	ai_holder = null

	health = 9999999
	maxHealth = 9999999

	pixel_x = -111
	default_pixel_x = -111
	pixel_y = -50
	default_pixel_y = -50

	runechat_x_offset = 125
	runechat_y_offset = 125

	bleed_colour = "#000000"

	see_in_dark = 30

	/// Список способностей меха
	var/list/datum/mech_ability/abilities = list(
		/// ТЕСТ
		/datum/mech_ability/action/bunker,
		/datum/mech_ability/ground_slam,
		/datum/mech_ability/action/toggle_cloak,
		/datum/mech_ability/intrusion,
	)
	/// Список базовых способностей меха
	var/list/datum/mech_ability/default_abilities = list(
		/datum/mech_ability/action/change_module,
		/datum/mech_ability/action/reboot,
		/datum/mech_ability/action/toggle_safety,
		/datum/mech_ability/action/boosters_passive,
		/datum/mech_ability/boosters_quick
	)

	/// Список модулей меха
	var/list/datum/mech_equipment/equipment = list(
		/datum/mech_equipment/firearm,
		/datum/mech_equipment/weapon,
		/// ТЕСТ
		/datum/mech_equipment/firearm/assault_cannon,
		/datum/mech_equipment/weapon/shield
	)
	/// Выбранный на текущий момент модуль
	var/datum/mech_equipment/selected_equipment = null

	/// Список статус-эффектов меха
	var/list/datum/mech_status/status_effects = list()

	var/armor_stat = 0 // Снижает урон на [X]
	var/armor_durability = 100 // Износ брони

	var/integrity = 100 // Текущее ХП
	var/integrity_max = 100 // Максимальное ХП

	/// Число перегрева. Сбрасывается, когда достигает [heat_max]
	var/heat = 0
	/// Максимальное число [heat]. По достижению происходит [overheat]
	var/heat_max = 5

	/// Число, которое раз в 2 секунды прибавляется к [heat]
	var/heat_regen = 0

	var/has_overheated_state = FALSE

	var/mech_condition = CONSCIOUS

	/// Выведен ли мех из строя?
	var/damaged = FALSE
	/// Число "возраждений" нашего меха
	var/repairs = 1

	/// На предохранителе ли все наши модули?
	var/weapon_safety = TRUE
	/// Число запасных магазинов для пополнения патрон
	var/spare_magazines = 0

	/// Задержка перед показом результатов сканирования
	var/scan_delay = 1.5 SECONDS

	var/zoom = 0
	var/base_movement_cooldown = 3

	var/wreck_type = /obj/structure/fd/mech_wreckage

	/// Текущий пилот меха, находящийся внутри
	var/mob/living/carbon/human/pilot/pilot
	/// Мех, которому будет передаватся весь полученный нами урон
	var/mob/living/simple_animal/fd/lancer/protected_by

/mob/living/simple_animal/fd/lancer/Initialize()
	icon_living = icon_state

	. = ..()

	add_language(LANGUAGE_PILOT)

	var/list/ability_types = default_abilities.Copy() + abilities.Copy()
	abilities.Cut()
	for(var/ability in ability_types)
		new ability(src)

	var/list/equipment_types = equipment.Copy()
	equipment.Cut()
	for(var/equip in equipment_types)
		new equip(src)

	if(length(equipment))
		selected_equipment = equipment[1]

/mob/living/simple_animal/fd/lancer/proc/adjust_heat(amount)
	heat = round(max(heat + amount, 0), 0.1)
	handle_heat()

/mob/living/simple_animal/fd/lancer/proc/handle_heat()
	if(heat >= heat_max)
		heat -= heat_max
		add_status_effect(/datum/mech_status/overheated, 30 SECONDS)

/mob/living/simple_animal/fd/lancer/proc/recieve_damage(integrity_damage = 0, hull_damage = 1, shredding = FALSE, do_animation = TRUE)
	var/final_damage = integrity_damage
	var/nullified = TRUE

	handle_health()

	for(var/datum/mech_ability/action/toggle_cloak/cloak as anything in abilities)
		if(istype(cloak) && cloak.state)
			cloak.use()

	if(damaged)
		return FALSE

	if(!QDELETED(protected_by))
		redirect_damage(protected_by, integrity_damage, hull_damage, shredding, do_animation)
		log_and_message_admins(SPAN_WARNING("<b> [src] только что передел [protected_by] урон в размере [integrity_damage] INTEG!</i></b>"))
		return TRUE

	if(!shredding && prob(armor_durability))
		final_damage = integrity_damage - armor_stat

	if(get_status_effect(/datum/mech_status/vulnerable))
		final_damage *= 2

	if(final_damage > 0)
		integrity = max(integrity - final_damage, 0)
		log_and_message_admins(SPAN_WARNING("<b> [src] только что получил урон в размере [final_damage] INTEG!</i></b>"))
		nullified = FALSE

	if(hull_damage)
		armor_durability = max(armor_durability - rand(1,hull_damage), 0)

	if(do_animation && !damaged)
		damage_animation(nullified)

	return TRUE

/mob/living/simple_animal/fd/lancer/proc/redirect_damage(mob/living/simple_animal/fd/lancer/target, real_damage = 0, armor_damage = 1, ap = FALSE, animation = TRUE)
	log_and_message_admins(SPAN_WARNING("<b> [src] получил перенаправленный урон на [real_damage] INTEG!</i></b>"))
	target.recieve_damage(integrity_damage = real_damage, hull_damage = armor_damage, shredding = ap, do_animation = animation)

/mob/living/simple_animal/fd/lancer/proc/damage_animation(damage_blocked = FALSE)
	if(damage_blocked)
		animate(src, color = COLOR_DEEP_SKY_BLUE, time = 0.2 SECOND, easing = CUBIC_EASING | EASE_IN, flags = ANIMATION_PARALLEL)
		spawn(0.4 SECOND)
			animate(src, color = initial(color), time = 0.2 SECOND, easing = CUBIC_EASING | EASE_OUT, flags = ANIMATION_PARALLEL)
	else
		animate(src, color = COLOR_RED, time = 0.2 SECOND, easing = CUBIC_EASING | EASE_IN, flags = ANIMATION_PARALLEL)
		spawn(0.4 SECOND)
			animate(src, color = initial(color), time = 0.2 SECOND, easing = CUBIC_EASING | EASE_OUT, flags = ANIMATION_PARALLEL)

/mob/living/simple_animal/fd/lancer/proc/add_ability(ability_type)
	return new ability_type(src)

/mob/living/simple_animal/fd/lancer/proc/add_weapon(weapon_type)
	return new weapon_type(src)

/// Нужно переделать под новую систему эффектов
/mob/living/simple_animal/fd/lancer/proc/resupply()
	SHOULD_CALL_PARENT(TRUE)
	mech_revive()

	damaged = FALSE
	integrity = integrity_max
	heat = 0
	spare_magazines = initial(spare_magazines)
	repairs = initial(repairs)
	for(var/status_effect in status_effects)
		qdel(status_effect)

/mob/living/simple_animal/fd/lancer/can_pull()
	return FALSE

/mob/living/simple_animal/fd/lancer/proc/scan(mob/living/simple_animal/fd/lancer/mech_target, params)
	set waitfor = FALSE

	to_chat(src, SPAN_NOTICE("Вы пытаетесь просканировать сигнатуру [mech_target]..."))
	openToolTip(src, mech_target, params, "? ? ?", FONT_GIANT("Анализ . . ."))

	if(!do_after(src, scan_delay, mech_target, DO_DEFAULT|DO_BOTH_CAN_MOVE|DO_USER_UNIQUE_ACT))
		to_chat(src, SPAN_WARNING("Сканирование было прервано."))
		return

	openToolTip(src, mech_target, params, FONT_LARGE(mech_target.name), mech_target.get_scan_info())
	playsound(get_turf(src), 'sound/effects/scanbeep.ogg', 30)

	to_chat(src, SPAN_NOTICE("Сканирование завершено."))
	to_chat(mech_target, SPAN_WARNING("Ваша сигнатура была просканирована."))

/mob/living/simple_animal/fd/lancer/proc/get_scan_info()
	. = ""
	var/integrity_color = gradient(COLOR_RED, COLOR_DARKMODE_TEXT, (integrity*1.5)/integrity_max)
	. += FONT_NORMAL("<li>[SPAN_COLOR(integrity_color, "Структуры: [Percent(integrity,integrity_max,1)]%")]")
	var/heat_color = gradient("#ff8800", COLOR_RED, heat/heat_max)
	. += FONT_NORMAL("<li>[SPAN_COLOR(heat_color, "Перегрева: [Percent(heat,heat_max,1)]%")]")
	. += FONT_NORMAL("</li>")

	for(var/datum/mech_ability/ability as anything in abilities)
		. += ability.get_scan_info(src)

/mob/living/simple_animal/fd/lancer/proc/power_up()
	if(mech_condition != UNCONSCIOUS)
		return FALSE

	visible_message(SPAN_DANGER("[src] вновь начинается двигаться, медленно поднимаясь с земли!"), SPAN_INFO("[src] вновь начинается двигаться, медленно поднимаясь с земли."))
	animate(src, time = 2 SECONDS, color = initial(color), transform = matrix(), easing = SINE_EASING, flags = ANIMATION_PARALLEL)

	playsound(get_turf(src), 'sound/mecha/powerup.ogg', 60)
	spawn(3 SECONDS) // в будущем надо сделать таймером, дабы без багов
		mech_condition = CONSCIOUS
		playsound(get_turf(src), 'sound/mecha/nominal.ogg', 60)

	return TRUE

/mob/living/simple_animal/fd/lancer/proc/power_down()
	if(mech_condition != CONSCIOUS)
		return FALSE

	mech_condition = UNCONSCIOUS

	animate(src, time = 2 SECONDS, color = COLOR_GRAY, transform = matrix(-30, MATRIX_ROTATE), easing = SINE_EASING, flags = ANIMATION_PARALLEL)
	playsound(get_turf(src), 'sound/mecha/mech-shutdown.ogg', 150)
	return TRUE

/mob/living/simple_animal/fd/lancer/proc/mech_revive(delay = FALSE, heal = FALSE)
	set waitfor = FALSE

	if(!damaged)
		return FALSE

	if(delay)
		visible_message(SPAN_NOTICE("[src] тихо жужжит, начиная процесс экстренного ремонта."), SPAN_INFO("Ты запускаешь протокол экстренного ремонта [src]."))
		if(!do_after(src, 30 SECONDS, src, DO_SHOW_PROGRESS|DO_PUBLIC_PROGRESS|DO_BOTH_UNIQUE_ACT|DO_BOTH_CAN_MOVE|DO_BOTH_CAN_TURN))
			return FALSE

	if(heal)
		integrity = max(integrity, integrity_max / 2)
		repairs -= 1

	damaged = FALSE
	power_up()

	animate(get_filter("damaged"), time = 1 SECONDS, size = 0, flags = ANIMATION_PARALLEL)
	return TRUE

/mob/living/simple_animal/fd/lancer/Stat()
	. = ..()
	if(!statpanel("Mech Status"))
		return

	stat(FONT_LARGE(name), null)

	if(initial(repairs)) // ноль на ноль делить нельзя
		var/repairs_color = gradient(COLOR_RED, COLOR_DARKMODE_TEXT, repairs/initial(repairs))
		stat(MECH_STAT("Комплектов Починки:", repairs_color), MECH_STAT("[repairs] / [initial(repairs)]", repairs_color))

	if(integrity_max)
		var/integrity_color = gradient(COLOR_RED, COLOR_DARKMODE_TEXT, (integrity*1.4)/integrity_max)
		stat(MECH_STAT("Структуры:", integrity_color), MECH_STAT("[integrity] / [integrity_max] ([Percent(integrity,integrity_max,1)]%)", integrity_color))

	if(heat_max)
		var/heat_color = gradient("#ff8800", COLOR_RED, heat/heat_max)
		stat(MECH_STAT("Перегрева:", heat_color), MECH_STAT("[heat] / [heat_max] ([Percent(heat,heat_max,1)]%)", heat_color))

	if(initial(spare_magazines))
		var/ammo_color = gradient(COLOR_RED, COLOR_DARKMODE_TEXT, spare_magazines/initial(spare_magazines))
		stat(MECH_STAT("Запасных Магазинов:", ammo_color), MECH_STAT("[spare_magazines] / [initial(spare_magazines)]", ammo_color))

	for(var/datum/mech_equipment/equip as anything in equipment)
		var/data_set = equip.get_stat_info(src)
		for(var/list/data as anything in data_set)
			stat(data["title"], data["desc"])

	for(var/datum/mech_ability/ability as anything in abilities)
		var/data_set = ability.get_stat_info(src)
		for(var/list/data as anything in data_set)
			stat(data["title"], data["desc"])

/mob/living/simple_animal/fd/lancer/death()
	mech_condition = DEAD
	add_status_effect(/datum/mech_status/anchored, source = "death")
	playsound(get_turf(src),'sound/mecha/mech-shutdown.ogg',150)
	playsound(get_turf(src),'sound/mecha/hydraulic.ogg',40)
	playsound(get_turf(src),'sound/mecha/weapdestr.ogg',60)
	playsound(get_turf(src),'sound/effects/iron_sizzle.ogg',100,TRUE)
	animate(src, time = 5 SECONDS, color = COLOR_RED_LIGHT, transform = matrix(30, MATRIX_ROTATE), easing = CUBIC_EASING|EASE_OUT, flags = ANIMATION_PARALLEL)
	// Добавить сюда анимацию тряски перед уничтожением
	spawn(3 SECONDS)
		if(wreck_type)
			new wreck_type(get_turf(src))
		playsound(get_turf(src),'sound/mecha/Explosion_02.mp3', 60)
		..(FALSE, "suddenly breaks apart.", "You have been destroyed.")
		QDEL_NULL(src)
	return TRUE

/mob/living/simple_animal/fd/lancer/verb/zoom()
	set category = "IC"
	set name = "Мех - Настроить оптику"

	if(!src.client)
		return FALSE
	var/cannotzoom

	if(mech_condition != CONSCIOUS)
		to_chat(src, SPAN_WARNING("Прямо сейчас линза не может сфокусироваться!"))
		cannotzoom = 1

	if(!zoom && !cannotzoom)
		src.toggle_zoom_hud()
		src.client.view = 9
		zoom = 1

		var/tilesize = 35
		var/viewoffset = tilesize * 6

		switch(src.dir)
			if (NORTH)
				src.client.pixel_x = 0
				src.client.pixel_y = viewoffset
			if (SOUTH)
				src.client.pixel_x = 0
				src.client.pixel_y = -viewoffset
			if (EAST)
				src.client.pixel_x = viewoffset
				src.client.pixel_y = 0
			if (WEST)
				src.client.pixel_x = -viewoffset
				src.client.pixel_y = 0
		src.visible_message("[src] прицеливается.")
		src.set_face_dir()

	else
		src.client.view = world.view
		src.toggle_zoom_hud()
		zoom = 0
		src.client.pixel_x = 0
		src.client.pixel_y = 0
		src.set_face_dir(newdir = null)

	return TRUE

/mob/living/simple_animal/fd/lancer/verb/change_view()
	set name = "Мех - Сменить радиус зрения"
	set category = "IC"
	set desc = "This will let you change your view range."

	src.client.view = input("Select view range:", "FUCK YEAH", 12) in list(7,8,9,10,11,12,13,14)

/mob/living/simple_animal/fd/lancer/verb/exit_mech()
	set name = "Мех - Покинуть"
	set category = "IC"
	set desc = "Позволяет покинуть боевую машину."

	if(!pilot)
		to_chat(src, SPAN_DEBUG("Ты ебанутый? Ты кем вылезать собрался?"))
		return

	if(alert(src, "Вы точно хотите покинуть мех?", "Покинуть мех", "Да", "Нет") == "Нет")
		return

	if(!do_after(src, 5 SECONDS, src, DO_PUBLIC_UNIQUE))
		return

	power_down()

	pilot.forceMove(get_turf(src))
	pilot.ckey = ckey
	pilot.client.view = 7
	pilot = null

/mob/living/simple_animal/fd/lancer/proc/recalculate_mech_speed()
	. = base_movement_cooldown
	if(get_status_effect(/datum/mech_status/overheated))
		. -= 1
	if(selected_equipment)
		. += selected_equipment.speed_debuff
	for(var/datum/mech_ability/ability as anything in abilities)
		. += ability.speed_debuff
	movement_cooldown = .

/mob/living/simple_animal/fd/lancer/proc/handle_health()
	set waitfor = FALSE

	if(integrity > 0)
		return

	if(damaged)
		return

	if(repairs <= 0)
		death()
		return

	damaged = TRUE

	add_filter("damaged", 10, list("type" = "outline", , "size" = 0, "color" = COLOR_RED))
	animate(get_filter("damaged"), time = 4 SECONDS, size = 1, flags = ANIMATION_PARALLEL)

	playsound(get_turf(src), 'sound/mecha/critdestr.ogg', 60)

	power_down()
	mech_revive(TRUE, TRUE)

/mob/living/simple_animal/fd/lancer/Life()
	if(mech_condition == DEAD)
		return

	adjust_heat(heat_regen)

	if(get_status_effect(/datum/mech_status/overheated))
		recieve_damage(2, 0, TRUE, FALSE)
		playsound(get_turf(src), 'sound/effects/razorweb_hiss.ogg', 80, TRUE)

	if(integrity <= 0)
		playsound(get_turf(src),'sound/mecha/internaldmgalarm.ogg', 20)

	handle_health()

	recalculate_mech_speed()

	. = ..()

/mob/living/simple_animal/fd/lancer/SelfMove(dir)
	if(mech_condition > CONSCIOUS)
		return FALSE

	if(damaged)
		return FALSE

	if(get_status_effect(/datum/mech_status/chained))
		return FALSE

	. = ..()
	if(!.)
		return

	next_move = world.time + movement_cooldown

/mob/living/simple_animal/fd/lancer/ClickOn(atom/A, params)
	if(mech_condition > CONSCIOUS)
		return FALSE

	if(next_click > world.time) // Hard check, before anything else, to avoid crashing
		return FALSE

	next_click = world.time + 2

	if(damaged)
		return FALSE

	if(A.z != z)
		return FALSE

	var/params_list = params2list(params)

	if(!handle_abilities(A, params))
		if(params_list["shift"] && params_list["left"])
			if(istype(A, /mob/living/simple_animal/fd/lancer))
				scan(A, params)
			return A.ShiftClick(src)

		if(selected_equipment)
			selected_equipment.use(A, params)

	return TRUE

/mob/living/simple_animal/fd/lancer/proc/handle_abilities(atom/A, params)
	. = FALSE

	var/params_list = params2list(params)

	/// Генерируем и активируем список действий при клике на себя
	if(A == src && params_list["left"])
		. = TRUE

		if(get_status_effect(/datum/mech_status/malfunctioned))
			playsound(get_turf(src), 'sound/machines/buzz-two.ogg', 25, TRUE, falloff = 4)
			return .

		var/list/options = list()
		var/list/actions = list()
		for(var/datum/mech_ability/ability as anything in abilities)
			if(!ability.is_action)
				continue

			options[ability.name] = image(ability.action_icon, ability.action_state)
			options[ability.name]?:color = ability.action_color

			actions[ability.name] = ability

		playsound(src, 'packs/infinity/sound/mecha/UI_SCI-FI_Tone_10_stereo.ogg', 40, falloff = 4)

		var/chosen_option = show_radial_menu(src, src, options, radius = 60, require_near = TRUE, offset_x = 125, offset_y = 125)
		if(!chosen_option)
			playsound(src, 'packs/infinity/sound/mecha/UI_SCI-FI_Tone_Deep_Wet_22_stereo_complite.ogg', 40, TRUE, falloff = 4)
			return .

		var/datum/mech_ability/action = actions[chosen_option]
		if(action.use(null, params))
			playsound(src, 'packs/infinity/sound/mecha/UI_SCI-FI_Tone_Deep_Wet_22_stereo_complite.ogg', 40, TRUE, falloff = 4)
			return .

		playsound(src, 'sound/machines/buzz-two.ogg', 25, TRUE, falloff = 4)

	/// Далее смотрим, есть ли у нас способности с парамс-триггерами
	for(var/datum/mech_ability/ability as anything in abilities)
		for(var/click_param in ability.required_params)
			if(!params_list[click_param])
				continue
			if(!ability.use(A, params))
				playsound(src, 'sound/machines/buzz-two.ogg', 25, TRUE, falloff = 4)
			. = TRUE

	return .

/obj/screen/fullscreen/noise/hacked
	icon_state = "1 moderate"
	alpha = 0

/obj/screen/fullscreen/noise/hacked/Initialize()
	. = ..()
	animate(src, color = COLOR_VIOLET, alpha = 255, time = 2 SECONDS)

/obj/screen/fullscreen/fishbed/hacked
	alpha = 0

/obj/screen/fullscreen/fishbed/hacked/Initialize()
	. = ..()
	animate(src, color = COLOR_VIOLET, alpha = 255, time = 2 SECONDS)
