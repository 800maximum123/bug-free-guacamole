/mob/living/simple_animal/hostile/fd/lancer
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
	var/list/abilities = list(
		/datum/mech_ability/action/change_weapon,
		/datum/mech_ability/action/reboot,
		/datum/mech_ability/action/toggle_safety,
	)

	/// Выбранный тип оружия
	var/datum/mech_weapon/selected_weapon = null
	/// Список оружия меха
	var/list/weapons = list(
		/datum/mech_weapon,
	)

	var/armor_stat = 0 // Снижает урон на [X]
	var/armor_durability = 100 // Износ брони
	var/shielded = 0// Дрейк способен перетягивать входящий урон на себя
	var/overprotected = FALSE // Саладин накидывает оверхп
	var/mutable_appearance/field_overlay

	var/integrity = 100 // Текущее ХП
	var/integrity_max = 100 // Максимальное ХП

	var/heat = 0 // Перегрев. Сбрасывается до нуля, когда достигает [heat_overflow]
	var/heat_overflow = 5 // Максимальное количество перегрева, после достижения которого мы перегреваемся

	var/overheated = FALSE // Мы перегрелись. Мы получаем урон, но также можем бесплатно использовать любые абилки пока таймер не кончится
	var/overheat_timer = 30 // Остужение через [X]
	var/has_overheated_state = FALSE

	var/weapon_equipped = "Standart Pistol"

	var/repairs_left = 1 // Сколько раз мы сможем подниматься из мёртвых?
	var/damaged = FALSE // Мы в "крите"?

	/// На предохранителе ли всё оружие?
	var/weapon_safety = TRUE

	var/has_ammo = FALSE // Есть ли у нас запас патронов?
	var/spare_magazines = 0 // Запасные магазины для пополнения патрон
	var/next_fire = 0 // Время после которого можно будет вновь выстрелить

	var/scan_delay = 1.5 SECONDS // Задержка перед показом результатов сканирования

	var/hacked = FALSE
	var/chained = FALSE
	var/chained_for = 0
	var/malfunction = FALSE
	var/malf_for = 0

	var/wreck_type = /obj/structure/fd/mech_wreckage
	var/dead = FALSE

	var/leader_target = FALSE
	var/target_for = 0

	var/mob/living/carbon/human/pilot/pilot // Текущий пилот меха

/mob/living/simple_animal/hostile/fd/lancer/Initialize()
	icon_living = icon_state

	. = ..()

	add_language(LANGUAGE_PILOT)

	var/list/ability_datums = list()
	for(var/ability_type in abilities)
		ability_datums += new ability_type(src)
	abilities = ability_datums

	var/list/weapon_datums = list()
	for(var/weapon_type in weapons)
		weapon_datums += new weapon_type(src)
	weapons = weapon_datums

	if(length(weapons))
		selected_weapon = weapons[1]

/*/mob/living/simple_animal/hostile/fd/lancer/proc/Effect(type, time = 1 SECONDS)
	switch()

/mob/living/simple_animal/hostile/fd/lancer/proc/SetEffect(type, time = 1 SECONDS)

/mob/living/simple_animal/hostile/fd/lancer/proc/AdjustEffect(type, time = 1 SECONDS)*/

/*/mob/proc/Stun(amount)
	if(status_flags & CANSTUN)
		facing_dir = null
		stunned = max(max(stunned,amount),0) //can't go below 0, getting a low amount of stun doesn't lower your current stun
		UpdateLyingBuckledAndVerbStatus()
	return

/mob/proc/SetStunned(amount) //if you REALLY need to set stun to a set amount without the whole "can't go below current stunned"
	if(status_flags & CANSTUN)
		stunned = max(amount,0)
		UpdateLyingBuckledAndVerbStatus()
	return

/mob/proc/AdjustStunned(amount)
	if(status_flags & CANSTUN)
		stunned = max(stunned + amount,0)
		UpdateLyingBuckledAndVerbStatus()
	return*/

/mob/living/simple_animal/hostile/fd/lancer/proc/do_damage(integrity_damage, hull_damage, shredding = FALSE, do_animation = TRUE)
	var/final_damage = 0
	var/nullified = TRUE

	if(damaged)
		return FALSE

	if(!shredding && prob(armor_durability))
		final_damage = integrity_damage - armor_stat

	if(final_damage > 0)
		integrity -= final_damage
		nullified = FALSE

	armor_durability -= rand(1,hull_damage)

	if(do_animation && !damaged)
		damage_animation(nullified)

	return TRUE

/mob/living/simple_animal/hostile/fd/lancer/proc/damage_animation(damage_blocked = FALSE)
	if(damage_blocked)
		animate(src, color = COLOR_DEEP_SKY_BLUE, time = 0.2 SECOND, easing = CUBIC_EASING | EASE_IN, flags = ANIMATION_PARALLEL)
		spawn(0.4 SECOND)
			animate(src, color = initial(color), time = 0.2 SECOND, easing = CUBIC_EASING | EASE_OUT, flags = ANIMATION_PARALLEL)
	else
		animate(src, color = COLOR_RED, time = 0.2 SECOND, easing = CUBIC_EASING | EASE_IN, flags = ANIMATION_PARALLEL)
		spawn(0.4 SECOND)
			animate(src, color = initial(color), time = 0.2 SECOND, easing = CUBIC_EASING | EASE_OUT, flags = ANIMATION_PARALLEL)


/mob/living/simple_animal/hostile/fd/lancer/proc/add_ability(ability_type)
	abilities += new ability_type(src)

/mob/living/simple_animal/hostile/fd/lancer/proc/resupply()
	SHOULD_CALL_PARENT(TRUE)
	mech_reboot(FALSE, FALSE)

	integrity = integrity_max
	heat = 0
	overheated = FALSE
	repairs_left = initial(repairs_left)
	damaged = FALSE
	overheat_timer = initial(overheat_timer)
	spare_magazines = initial(spare_magazines)
	hacked = FALSE
	chained = FALSE
	chained_for = 0
	malfunction = FALSE
	malf_for = 0
	leader_target = FALSE
	target_for = 0

/mob/living/simple_animal/hostile/fd/lancer/can_pull()
	return FALSE

/mob/living/simple_animal/hostile/fd/lancer/proc/scan(mob/living/simple_animal/hostile/fd/lancer/mech_target, params)
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

/mob/living/simple_animal/hostile/fd/lancer/proc/get_scan_info()
	. = ""
	var/integrity_color = gradient(COLOR_RED, COLOR_DARKMODE_TEXT, (integrity*1.4)/integrity_max)
	. += FONT_NORMAL("<li>[SPAN_COLOR(integrity_color, "Структуры: [Percent(integrity,integrity_max,1)]%")]")
	var/heat_color = gradient("#ff8800", COLOR_RED, heat/heat_overflow)
	. += FONT_NORMAL("<li>[SPAN_COLOR(heat_color, "Перегрева: [Percent(heat,heat_overflow,1)]%")]")
	. += FONT_NORMAL("</li>")

	for(var/datum/mech_ability/ability as anything in abilities)
		. += ability.get_scan_info(src)

/mob/living/simple_animal/hostile/fd/lancer/proc/mech_reboot(delay = TRUE, heal = TRUE)
	set waitfor = FALSE

	if(!damaged)
		return FALSE

	if(delay)
		visible_message(SPAN_NOTICE("[src] тихо жужжит, начиная процесс экстренного ремонта."), SPAN_INFO("Ты запускаешь протокол экстренного ремонта [src]."))
		if(!do_after(src, 60 SECONDS))
			return FALSE

	if(heal)
		integrity = integrity_max / 2
		repairs_left -= 1

	damaged = FALSE
	anchored = FALSE
	heat = 0

	visible_message(SPAN_DANGER("[src] вновь начинается двигаться, медленно поднимаясь с земли!"), SPAN_INFO("[src] вновь начинается двигатся, медленно поднимаясь с земли."))

	playsound(get_turf(src),'sound/mecha/powerup.ogg',60)
	spawn(3 SECONDS)
		playsound(get_turf(src),'sound/mecha/nominal.ogg',60)

	animate(get_filter("down"), time = 1 SECONDS, size = 0, flags = ANIMATION_PARALLEL)
	animate(src, time = 2 SECONDS, color = initial(color), transform = matrix(), easing = SINE_EASING, flags = ANIMATION_PARALLEL)
	return TRUE

/mob/living/simple_animal/hostile/fd/lancer/Stat()
	. = ..()
	if(!statpanel("Mech Status"))
		return

	stat(FONT_LARGE(name), null)

	if(has_ammo)
		var/ammo_color = gradient(COLOR_RED, COLOR_DARKMODE_TEXT, spare_magazines/initial(spare_magazines))
		stat(FONT_NORMAL(SPAN_COLOR(ammo_color, "Запасных Магазинов:")), FONT_NORMAL(SPAN_COLOR(ammo_color, "[spare_magazines]")))

	if(initial(repairs_left)) // ноль на ноль делить нельзя
		var/repairs_color = gradient(COLOR_RED, COLOR_DARKMODE_TEXT, repairs_left/initial(repairs_left))
		stat(FONT_NORMAL(SPAN_COLOR(repairs_color, "Комплектов Починки:")), FONT_NORMAL(SPAN_COLOR(repairs_color, "[repairs_left]")))

	if(integrity_max)
		var/integrity_color = gradient(COLOR_RED, COLOR_DARKMODE_TEXT, (integrity*1.4)/integrity_max)
		stat(FONT_NORMAL(SPAN_COLOR(integrity_color, "Структуры:")), FONT_NORMAL(SPAN_COLOR(integrity_color, "[integrity]/[integrity_max] ([Percent(integrity,integrity_max,1)]%)")))

	if(heat_overflow)
		var/heat_color = gradient("#ff8800", COLOR_RED, heat/heat_overflow)
		stat(FONT_NORMAL(SPAN_COLOR(heat_color, "Перегрева:")), FONT_NORMAL(SPAN_COLOR(heat_color, "[heat]/[heat_overflow] ([Percent(heat,heat_overflow,1)]%)")))

	for(var/datum/mech_ability/ability as anything in abilities)
		var/data_set = ability.get_stat_info(src)
		for(var/list/data as anything in data_set)
			stat(data["title"], data["desc"])

	for(var/datum/mech_weapon/weapon as anything in weapons)
		var/data_set = weapon.get_stat_info(src)
		for(var/list/data as anything in data_set)
			stat(data["title"], data["desc"])

/mob/living/simple_animal/hostile/fd/lancer/death()
	dead = TRUE
	anchored = TRUE
	playsound(get_turf(src),'sound/mecha/mech-shutdown.ogg',150)
	playsound(get_turf(src),'sound/mecha/hydraulic.ogg',40)
	playsound(get_turf(src),'sound/mecha/weapdestr.ogg',60)
	playsound(get_turf(src),'sound/effects/iron_sizzle.ogg',100,TRUE)
	animate(src, time = 4 SECONDS, color = COLOR_RED_LIGHT, transform = matrix(30, MATRIX_ROTATE), easing = CUBIC_EASING|EASE_OUT)
	// Добавить сюда анимацию тряски перед уничтожением
	spawn(rand(3 SECONDS, 4 SECONDS))
		if(wreck_type)
			new wreck_type (get_turf(src))
			playsound(get_turf(src),'sound/mecha/Explosion_02.mp3', 60)
		..(FALSE, "suddenly breaks apart.", "You have been destroyed.")
		qdel(src)

/mob/living/simple_animal/hostile/fd/lancer/proc/choose_weapon()
	var/list/options = list(
		"Standart Pistol" = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "24"),
		"Standart Rifle" = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "24")
	)
	var/chosen_option = show_radial_menu(src, src, options, radius = 30, require_near = TRUE, offset_x = 125, offset_y = 125)
	if(!chosen_option)
		return FALSE
	weapon_equipped = chosen_option
	playsound(get_turf(src), 'packs/infinity/sound/items/change_jaws.ogg', 80, TRUE)

/mob/living/simple_animal/hostile/fd/lancer/verb/change_view()
	set name = "Мех - Сменить радиус зрения"
	set category = "IC"
	set desc = "This will let you change your view range."

	src.client.view = input("Select view range:", "FUCK YEAH", 12) in list(7,8,9,10,11,12,13,14)

/mob/living/simple_animal/hostile/fd/lancer/verb/exit_mech()
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

	pilot.forceMove(get_step(get_turf(src), dir))
	pilot.ckey = ckey
	pilot.client.view = 7
	pilot = null

/mob/living/simple_animal/hostile/fd/lancer/Life()

	if(world.time >= chained_for && chained)
		chained = FALSE
		visible_message(SPAN_WARNING("[src] вновь начал исправно двигатся!"))

	if(world.time >= malf_for && malfunction)
		malfunction = FALSE
		visible_message(SPAN_WARNING("[src] вновь начал исправно функционировать!"))

	if(world.time >= target_for && leader_target)
		leader_target = FALSE
		visible_message(SPAN_WARNING("[src] теряет статус приоритетной цели!"))

	if(overheated && overheat_timer > 0 && !damaged)
		integrity -= 2
		overheat_timer -= 1
		// Попробуем заменить анимацию урона на звук шипения, посмотрим лучше ли будет выглядеть
		//damage_animation(1, ignore_armor = TRUE)
		playsound(get_turf(src),'sound/effects/razorweb_hiss.ogg',80,TRUE)

	if(overheated && overheat_timer <= 0)
		overheated = FALSE
		movement_cooldown += 1
		if(has_overheated_state && !dead)
			icon_state = initial(icon_state)
		animate(get_filter("heated"), time = 10 SECONDS, size = 0, flags = ANIMATION_PARALLEL)
		animate(get_filter("heated_blur"), time = 10 SECONDS, size = 0, flags = ANIMATION_PARALLEL)
		animate(src, time = 15 SECONDS, color = initial(color), transform = matrix(), flags = ANIMATION_PARALLEL)

	if(integrity <= 0)
		playsound(get_turf(src),'sound/mecha/internaldmgalarm.ogg',20)
		if(!damaged)
			damaged = TRUE
			if(repairs_left <= 0 && !dead)
				death()
				return ..()
			playsound(get_turf(src),'sound/mecha/mech-shutdown.ogg',100)
			playsound(get_turf(src),'sound/mecha/critdestr.ogg',60)
			add_filter("down", 10, list("type" = "outline", , "size" = 0, "color" = COLOR_RED))
			animate(get_filter("down"), time = 4 SECONDS, size = 1, flags = ANIMATION_PARALLEL)
			animate(src, time = 2 SECONDS, color = COLOR_GRAY, transform = matrix(-30, MATRIX_ROTATE), easing = SINE_EASING, flags = ANIMATION_PARALLEL)
			anchored = TRUE

	if(heat >= heat_overflow && !overheated)
		heat = 0
		overheated = TRUE
		movement_cooldown -= 1
		overheat_timer = initial(overheat_timer)
		if(has_overheated_state)
			icon_state = "[icon_living]_charged"
		add_filter("heated", 5, list("type" = "outline", , "size" = 0, "color" = COLOR_AMBER))
		add_filter("heated_blur", 4, list("type" = "blur", , "size" = 0))
		animate(get_filter("heated"), time = 15 SECONDS, size = 1, flags = ANIMATION_PARALLEL)
		animate(get_filter("heated_blur"), time = 10 SECONDS, size = 1, flags = ANIMATION_PARALLEL)
		animate(src, time = 10 SECONDS, color = "#fc987a", flags = ANIMATION_PARALLEL)
		playsound(get_turf(src),'sound/mecha/internaldmgalarm.ogg',20)
		playsound(get_turf(src),'sound/effects/iron_sizzle.ogg',100,TRUE)

/*	if(shielded)
		for(var/mob/living/simple_animal/hostile/fd/lancer/drake/M in view(2,src))
			if(!M)
				shielded = FALSE
			if(M.damaged)
				shielded = FALSE*/

	. = ..()

/mob/living/simple_animal/hostile/fd/lancer/SelfMove(dir)
	if(damaged)
		return 0

	if(chained)
		return FALSE

	. = ..()

/mob/living/simple_animal/hostile/fd/lancer/proc/consume_ammo()
	return TRUE

/mob/living/simple_animal/hostile/fd/lancer/proc/mech_shoot(atom/target, bullet_type = /obj/item/projectile/bullet/mech, cooldown, amount = 1, interval = 0, damage_bonus, bullet_icon, sound)
	set waitfor = FALSE

	if(world.time < next_fire)
		return FALSE

	next_fire = world.time + cooldown

	for(var/shot, shot<amount, shot++)
		if(weapon_safety)
			return FALSE
		if(malfunction)
			playsound(get_turf(src),'sound/weapons/empty.ogg', 80, TRUE)
			to_chat(src, SPAN_WARNING("Оружие заклинило!"))
			return FALSE
		if(damaged)
			return FALSE
		if(!consume_ammo())
			playsound(get_turf(src),'sound/weapons/empty.ogg', 80, TRUE)
			return FALSE

		var/obj/item/projectile/bullet/mech/pew = new bullet_type(get_turf(src))

		if(sound)
			pew.fire_sound = sound
		playsound(pew.loc, pew.fire_sound, 30, 1)

		if(damage_bonus)
			pew.integrity_damage += damage_bonus
		if(bullet_icon)
			pew.icon_state = bullet_icon

		pew.SetTransform(2)

		pew.original = target
		pew.current = target
		pew.starting = get_turf(src)
		pew.shot_from = src
		pew.permutated += src

		pew.launch(target, BP_CHEST)
		spawn(rand(0.5 SECONDS, 1 SECONDS))
			playsound(get_turf(src), pick(list('sound/weapons/guns/casingfall1.ogg','sound/weapons/guns/casingfall2.ogg','sound/weapons/guns/casingfall3.ogg')), 25, TRUE)

		sleep(interval)

/mob/living/simple_animal/hostile/fd/lancer/ClickOn(atom/A, params)
	if(next_click > world.time) // Hard check, before anything else, to avoid crashing
		return FALSE

	if(damaged)
		return FALSE

	var/params_list = params2list(params)

	next_click = world.time + 1

	if(!handle_abilities(A, params))
		handle_weapons(A, params)

	if(params_list["shift"] && params_list["left"])
		if(istype(A, /mob/living/simple_animal/hostile/fd/lancer))
			var/mob/living/simple_animal/hostile/fd/lancer/scan_target = A
			scan_target.scan(A, params)
		A.ShiftClick(src)

	return TRUE

/mob/living/simple_animal/hostile/fd/lancer/proc/handle_abilities(atom/A, params)
	if(hacked)
		playsound(get_turf(src), 'sound/machines/buzz-two.ogg', 25, TRUE)
		return FALSE

	var/params_list = params2list(params)

	/// Генерируем и активируем список действий при клике на себя
	if(A == src && params_list["left"])
		. = TRUE

		var/list/options = list()
		var/list/actions = list()
		for(var/datum/mech_ability/ability as anything in abilities)
			if(!ability.is_action)
				continue

			options[ability.name] = image(ability.action_icon, ability.action_state)
			actions[ability.name] = ability

		var/chosen_option = show_radial_menu(src, src, options, radius = 30, require_near = TRUE, offset_x = 125, offset_y = 125)
		if(!chosen_option)
			return .

		var/datum/mech_ability/action = actions[chosen_option]
		if(!action.use(null, params))
			playsound(get_turf(src), 'sound/machines/buzz-two.ogg', 25, TRUE)

	/// Далее смотрим, есть ли у нас способности с парамс-триггерами
	for(var/datum/mech_ability/ability as anything in abilities)
		for(var/click_param in ability.required_params)
			if(click_param in params_list)
				ability.use(A, params)
				. = TRUE

	return .

/mob/living/simple_animal/hostile/fd/lancer/proc/handle_weapons(atom/A, params)
	var/params_list = params2list(params)
	if(!params_list["left"])
		return

	if(!selected_weapon)
		return

	return selected_weapon.fire(A, params)
