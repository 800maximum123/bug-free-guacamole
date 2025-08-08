/obj/item/projectile/bullet/mech
	name = "bullet"
	icon_state = "bullet"
	fire_sound = null
	damage = 0
	damage_type = DAMAGE_BRUTE
	damage_flags = DAMAGE_FLAG_BULLET
	embed = FALSE
	fire_sound = 'sound/weapons/guns/ricochet4.ogg'

	var/real_damage = 10 // Реальный дамаг по мехам
	var/piercing = FALSE // Игнорирует армор?

/obj/item/projectile/bullet/mech/on_hit(atom/target, blocked = 0)
	if(istype(target, /mob/living/simple_animal/hostile/fd/mech))
		var/mob/living/simple_animal/hostile/fd/mech/M = target
		var/final_damage = real_damage
		if(!piercing)
			final_damage -= M.armor_stat

		if(M.shielded)
			for(var/mob/living/simple_animal/hostile/fd/mech/drake/D in view(2,src))
				if(!D.damaged)
					D.integrity -= final_damage
				if(piercing)
					D.damage_animation(final_damage, ignore_armor = TRUE)
					return TRUE
				else
					D.damage_animation(final_damage)
					return TRUE

		if(M.overprotected)
			for(var/mob/living/simple_animal/hostile/fd/mech/saladin/D in range(13, get_turf(src)))
				if(D.protected != M)
					continue
				D.shield_integrity -= final_damage
				D.heat += 1
				D.damage_animation(0, ignore_armor = FALSE)
				return TRUE

		if(!M.damaged)
			M.integrity -= final_damage
		if(piercing)
			M.damage_animation(real_damage, ignore_armor = TRUE)
		else
			M.damage_animation(real_damage)

/obj/structure/fd/mech_wreckage
	name = "Wreckage"
	desc = "Giant pile of scrap"

	icon = 'mods/_fd/_maps/baycore_foranswer/icons/mechs/breacher_def.dmi'
	icon_state = "breacher_death_1"
	density = TRUE
	anchor_fall = TRUE

	layer = ABOVE_HUMAN_LAYER

	pixel_y = 0
	pixel_x = 0

/mob/living/simple_animal/hostile/fd/mech
	name = "Armored Personal Unit (APU)"
	desc = "An special experimental vehicle."
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/mechs/breacher_def.dmi'
	icon_state = "breacher"
	icon_living = "breacher"

	ai_holder = null

	health = 9999999
	maxHealth = 9999999

	runechat_x_offset = 125
	runechat_y_offset = 125
	bleed_colour = "#000000"

	var/armor_stat = 0 // Снижает урон на [X]
	var/shielded = FALSE // Дрейк способен перетягивать входящий урон на себя
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

	var/weapon_safety = FALSE
	var/has_ammo = FALSE
	var/spare_magazines = 0
	var/next_fire = 0

	var/scan_delay = 1.5 SECONDS

	var/hacking_qte = 0
	var/hacked = FALSE
	var/chained = FALSE
	var/chained_for = 0
	var/malfunction = FALSE
	var/malf_for = 0

	var/wreck_type = /obj/structure/fd/mech_wreckage
	var/dead = FALSE

/mob/living/simple_animal/hostile/fd/mech/proc/scan(mob/living/simple_animal/hostile/fd/mech/mech_target, params)
	set waitfor = FALSE

	to_chat(src, SPAN_SUBTLE("Вы пытаетесь просканировать сигнатуру [mech_target]..."))
	openToolTip(src, mech_target, params, "? ? ?", FONT_GIANT("Анализ . . ."))

	if(!do_after(src, scan_delay, do_flags = DO_DEFAULT|DO_BOTH_CAN_MOVE))
		to_chat(src, SPAN_WARNING("Сканирование было прервано."))
		return

	openToolTip(src, mech_target, params, FONT_LARGE(mech_target.name), mech_target.get_information())
	playsound(loc, 'sound/effects/scanbeep.ogg', 30)

	to_chat(src, SPAN_NOTICE("Сканирование завершено."))
	to_chat(mech_target, SPAN_SUBTLE("Ваша сигнатура была просканирована."))

/mob/living/simple_animal/hostile/fd/mech/proc/get_information()
	. = ""
	var/integrity_color = gradient(COLOR_RED, COLOR_DARKMODE_TEXT, (integrity*1.4)/integrity_max)
	. += FONT_NORMAL("<li>[SPAN_COLOR(integrity_color, "Структуры: [Percent(integrity,integrity_max,1)]%")]")
	var/heat_color = gradient("#ff8800", COLOR_RED, heat/heat_overflow)
	. += FONT_NORMAL("<li>[SPAN_COLOR(heat_color, "Перегрева: [Percent(heat,heat_overflow,1)]%")]")
	. += FONT_NORMAL("</li>")
	. += FONT_NORMAL(SPAN_COLOR(COLOR_DARKMODE_TEXT, desc))

/mob/living/simple_animal/hostile/fd/mech/proc/mech_reboot(delay = TRUE, heal = TRUE)
	set waitfor = FALSE

	if(!damaged)
		return FALSE

	if(delay && !do_after(src, 60 SECONDS))
		return FALSE

	if(heal)
		integrity = integrity_max / 2
	damaged = FALSE
	anchored = FALSE
	heat = 0
	repairs_left -= 1

	playsound(get_turf(src),'sound/mecha/powerup.ogg',60)
	spawn(3 SECONDS)
		playsound(get_turf(src),'sound/mecha/nominal.ogg',60)

	animate(get_filter("down"), time = 1 SECONDS, size = 0.01, flags = ANIMATION_PARALLEL)
	animate(src, time = 2 SECONDS, color = initial(color), transform = matrix(), easing = SINE_EASING, flags = ANIMATION_PARALLEL)
	spawn(2 SECONDS)
		remove_filter("down")
	return TRUE

/mob/living/simple_animal/hostile/fd/mech/Stat()
	. = ..()
	if(statpanel("Mech"))
		stat(name, null)

		if(has_ammo)
			var/ammo_color = gradient(COLOR_RED, COLOR_DARKMODE_TEXT, spare_magazines/initial(spare_magazines))
			stat(SPAN_COLOR(ammo_color, "Запасных Магазинов:"), SPAN_COLOR(ammo_color, "[spare_magazines]"))

		var/repairs_color = gradient(COLOR_RED, COLOR_DARKMODE_TEXT, repairs_left/initial(repairs_left))
		stat(SPAN_COLOR(repairs_color, "Комплектов Починки:"), SPAN_COLOR(repairs_color, "[repairs_left]"))

		var/integrity_color = gradient(COLOR_RED, COLOR_DARKMODE_TEXT, (integrity*1.4)/integrity_max)
		stat(SPAN_COLOR(integrity_color, "Структуры:"), SPAN_COLOR(integrity_color, "[integrity]/[integrity_max] ([Percent(integrity,integrity_max,1)]%)"))

		var/heat_color = gradient("#ff8800", COLOR_RED, heat/heat_overflow)
		stat(SPAN_COLOR(heat_color, "Перегрева:"), SPAN_COLOR(heat_color, "[heat]/[heat_overflow] ([Percent(heat,heat_overflow,1)]%)"))

/mob/living/simple_animal/hostile/fd/mech/death()
	dead = TRUE
	anchored = TRUE
	playsound(get_turf(src),'sound/mecha/mech-shutdown.ogg',150)
	playsound(get_turf(src),'sound/mecha/hydraulic.ogg',40)
	playsound(get_turf(src),'sound/mecha/weapdestr.ogg',60)
	//playsound(get_turf(src),'sound/effects/rocket_backwards.ogg',25) Нужно найти звук "перегрева" получше
	var/anim_time = rand(3 SECONDS, 4 SECONDS)
	animate(src, time = anim_time, color = COLOR_RED_LIGHT, transform = matrix(30, MATRIX_ROTATE), easing = SINE_EASING|EASE_OUT)
	// Добавить сюда анимацию тряски перед уничтожением
	spawn(anim_time)
		playsound(get_turf(src),'sound/mecha/Explosion_02.mp3',60)
		new wreck_type (get_turf(src))
		..(FALSE, "suddenly breaks apart.", "You have been destroyed.")
		qdel(src)

/mob/living/simple_animal/hostile/fd/mech/proc/damage_animation(amount, ignore_armor = FALSE)
	if(damaged)
		return FALSE

	if(armor_stat >= amount && !ignore_armor)
		animate(src, color = COLOR_DEEP_SKY_BLUE, time = 0.2 SECOND, easing = CUBIC_EASING | EASE_IN, flags = ANIMATION_PARALLEL)
		spawn(0.4 SECOND)
			animate(src, color = initial(color), time = 0.2 SECOND, easing = CUBIC_EASING | EASE_OUT, flags = ANIMATION_PARALLEL)
	else
		animate(src, color = COLOR_RED, time = 0.2 SECOND, easing = CUBIC_EASING | EASE_IN, flags = ANIMATION_PARALLEL)
		spawn(0.4 SECOND)
			animate(src, color = initial(color), time = 0.2 SECOND, easing = CUBIC_EASING | EASE_OUT, flags = ANIMATION_PARALLEL)

/mob/living/simple_animal/hostile/fd/mech/proc/choose_weapon()
	var/list/options = list(
		"Standart Pistol" = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "24"),
		"Standart Rifle" = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "24")
	)
	var/chosen_option = show_radial_menu(src, src, options, radius = 30, require_near = TRUE, offset_x = 125, offset_y = 125)
	if(!chosen_option)
		return FALSE
	weapon_equipped = chosen_option

/mob/living/simple_animal/hostile/fd/mech/verb/change_view()
	set name = "Mech - Change View"
	set category = "IC"
	set desc = "This will let you change your view range."

	src.client.view = input("Select view range:", "FUCK YEAH", 7) in list(7,8,9,10,11,12)

/mob/living/simple_animal/hostile/fd/mech/Life()

	if(world.time >= chained_for && chained)
		chained = FALSE

	if(world.time >= malf_for && malfunction)
		malfunction = FALSE

	if(overheated && overheat_timer > 0 && !damaged)
		integrity -= 1
		overheat_timer -= 1
		damage_animation(1, ignore_armor = TRUE)

	if(overheated && overheat_timer <= 0)
		overheated = FALSE
		if(has_overheated_state && !dead)
			icon_state = initial(icon_state)
		overheat_timer = initial(overheat_timer)
		remove_filter("heated")

	if(integrity <= 0)
		playsound(get_turf(src),'sound/mecha/internaldmgalarm.ogg',20)
		if(!damaged)
			damaged = TRUE
			if(repairs_left <= 0 && !dead)
				death()
				return ..()
			playsound(get_turf(src),'sound/mecha/mech-shutdown.ogg',100)
			playsound(get_turf(src),'sound/mecha/critdestr.ogg',60)
			add_filter("down", 1, list("type" = "outline", , "size" = 0.01, "color" = COLOR_RED))
			animate(get_filter("down"), time = 4 SECONDS, size = 1, flags = ANIMATION_PARALLEL)
			animate(src, time = 2 SECONDS, color = COLOR_GRAY, transform = matrix(-30, MATRIX_ROTATE), easing = SINE_EASING, flags = ANIMATION_PARALLEL)
			anchored = TRUE

	if(heat >= heat_overflow)
		heat = 0
		overheated = TRUE
		if(has_overheated_state)
			icon_state = "[icon_living]_charged"
		add_filter("heated", 4, list("type" = "outline", , "size" = 2, "color" = COLOR_ORANGE))

	if(shielded)
		for(var/mob/living/simple_animal/hostile/fd/mech/drake/M in view(2,src))
			if(!M)
				shielded = FALSE
			if(M.damaged)
				shielded = FALSE

	. = ..()

/mob/living/simple_animal/hostile/fd/mech/Move()
	if(damaged)
		return 0

	if(chained)
		return FALSE

	. = ..()

/mob/living/simple_animal/hostile/fd/mech/proc/consume_ammo()
	return TRUE

/mob/living/simple_animal/hostile/fd/mech/proc/mech_shoot(atom/target, bullet_type = /obj/item/projectile/bullet/mech, cooldown, amount = 1, interval = 0, damage_bonus, bullet_icon, sound)
	set waitfor = FALSE

	if(world.time < next_fire)
		return FALSE

	for(var/shot, shot<amount, shot++)
		if(weapon_safety)
			return FALSE
		if(malfunction)
			return FALSE
		if(damaged)
			return FALSE
		if(!consume_ammo())
			playsound(get_turf(src),'sound/weapons/empty.ogg', 80, 1)
			return FALSE

		next_fire = cooldown
		var/obj/item/projectile/bullet/mech/pew = new bullet_type(get_turf(src))

		if(sound)
			pew.fire_sound = sound
		playsound(pew.loc, pew.fire_sound, 15, 1)

		if(damage_bonus)
			pew.real_damage += damage_bonus
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
			playsound(get_turf(src), pick(list('sound/weapons/guns/casingfall1.ogg','sound/weapons/guns/casingfall2.ogg','sound/weapons/guns/casingfall3.ogg')), 25, 1)

		sleep(interval)

/mob/living/simple_animal/hostile/fd/mech/ClickOn(atom/A, params)
	var/modifiers = params2list(params)

	if(A == src)
		if(hacked)
			if(!do_after(src, 2 SECONDS))
				return FALSE
			hacked = FALSE
			return TRUE

		if(modifiers["left"])
			var/list/options = list(
				"Change Weapon" = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "24"),
				"Toggle Safety" = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "6"),
				"Reboot" = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "34"),
			)

			var/chosen_option = show_radial_menu(src, src, options, radius = 30, require_near = TRUE, offset_x = 125, offset_y = 125)
			if(!chosen_option)
				return FALSE

			switch(chosen_option)
				if("Toggle Safety")
					weapon_safety = !weapon_safety

				if("Change Weapon")
					choose_weapon()

				if("Reboot")
					mech_reboot()

			return FALSE

	else if(modifiers["middle"])

	else if(modifiers["shift"])
		if(istype(A, /mob/living/simple_animal/hostile/fd/mech))
			scan(A, params)

	else if(modifiers["alt"])

	else if(modifiers["ctrl"])

	else if(modifiers["left"] && !weapon_safety)
		switch(weapon_equipped)
			if("Standart Pistol")
				mech_shoot(A, /obj/item/projectile/bullet/mech/pistol, (world.time + 1 SECONDS))

			if("Standart Rifle")
				mech_shoot(A, /obj/item/projectile/bullet/mech, (world.time + 1 SECONDS), 3, 2)

	else
		. = ..()

/obj/item/projectile/bullet/mech/pistol
	real_damage = 5
