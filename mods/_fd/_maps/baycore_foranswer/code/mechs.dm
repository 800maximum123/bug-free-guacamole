/obj/item/projectile/bullet/mech
	name = "bullet"
	icon_state = "bullet"
	fire_sound = null
	damage = 0
	damage_type = DAMAGE_BRUTE
	damage_flags = DAMAGE_FLAG_BULLET
	embed = FALSE

	var/real_damage = 1 // Реальный дамаг по мехам
	var/piercing = FALSE // Игнорирует армор?

/obj/item/projectile/bullet/mech/on_hit(atom/target, blocked = 0)
	if(istype(target, /mob/living/simple_animal/hostile/fd/mech))
		var/mob/living/simple_animal/hostile/fd/mech/M = target
		var/final_damage = real_damage
		if(!piercing)
			final_damage -= M.armor_stat
		if(!M.damaged)
			M.integrity_stat -= final_damage
		if(piercing)
			M.damage_animation(final_damage, ignore_armor = TRUE)
		else
			M.damage_animation(final_damage)

/mob/living/simple_animal/hostile/fd/mech
	name = "Mechanized Infantry Unit (MIU)"
	desc = "An special experimental vehicle."
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/mech_size1.dmi'
	icon_state = "blackbeard"

	var/armor_stat = 0 // Снижает урона на [X]

	var/integrity_stat = 100 // Текущее ХП
	var/integrity_stat_max = 100 // Максимальное ХП

	var/heat = 0 // Перегрев. Сбрасывается до нуля, когда достигает [heat_overflow]
	var/heat_overflow = 5 // Максимальное количество перегрева, после достижения которого мы перегреваемся

	var/overheated = FALSE // Мы перегрелись. Мы получаем урон, но также можем бесплатно использовать любые абилки пока таймер не кончится
	var/overheat_timer = 30 // Остужение через [X]

	var/weapon_equiped = "Standart Pistol"

	var/repairs_left = 1 // Сколько раз мы сможем подниматься из мёртвых?
	var/damaged = FALSE // Мы в "крите"?

	var/can_shoot = TRUE

/mob/living/simple_animal/hostile/fd/mech/proc/damage_animation(amount, ignore_armor = FALSE)
	if(damaged)
		return FALSE

	if(armor_stat > amount && !ignore_armor)
		animate(src, color = COLOR_DEEP_SKY_BLUE, time = 0.5 SECOND, easing = CUBIC_EASING | EASE_IN)
		spawn(0.6 SECOND)
			animate(src, color = initial(color), time = 0.5 SECOND, easing = CUBIC_EASING | EASE_OUT)
	else
		animate(src, color = COLOR_RED, time = 0.5 SECOND, easing = CUBIC_EASING | EASE_IN)
		spawn(0.6 SECOND)
			animate(src, color = initial(color), time = 0.5 SECOND, easing = CUBIC_EASING | EASE_OUT)

/mob/living/simple_animal/hostile/fd/mech/proc/choose_weapon()
	var/list/options = list(
		"Standart Pistol" = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "24"),
		"Standart Rifle" = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "24")
	)
	var/chosen_option = show_radial_menu(src, src, options, radius = 20, require_near = TRUE)
	switch(chosen_option)
		if("Standart Pistol")
			weapon_equiped = "Standart Pistol"
		if("Standart Rifle")
			weapon_equiped = "Standart Rifle"

/mob/living/simple_animal/hostile/fd/mech/Life()

	if(damaged && repairs_left <= 0)
		qdel(src)

	if(integrity_stat <= 0)
		damaged = TRUE
		add_filter("down", 1, list("type" = "outline", , "size" = 1, "color" = COLOR_RED))

	if(overheated && overheat_timer > 0 && !damaged)
		integrity_stat -= 1
		overheat_timer -= 1
		damage_animation(1, ignore_armor = TRUE)

	if(overheated && overheat_timer <= 0)
		overheated = FALSE
		overheat_timer = initial(overheat_timer)
		remove_filter("heated")

	if(heat == heat_overflow)
		heat = 0
		overheated = TRUE
		add_filter("heated", 1, list("type" = "outline", , "size" = 2, "color" = COLOR_ORANGE))

	. = ..()

/mob/living/simple_animal/hostile/fd/mech/Move()
	if(damaged)
		return 0

	. = ..()

/mob/living/simple_animal/hostile/fd/mech/ClickOn(atom/A, params)
	if(A == src)
		var/list/options = list(
			"Change Weapon" = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "24"),
			"Toggle Fire" = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "6"),
			"Reboot" = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "34"),
		)

		var/chosen_option = show_radial_menu(src, src, options, radius = 20, require_near = TRUE)
		switch(chosen_option)

			if("Toggle Fire")
				if(can_shoot)
					can_shoot = FALSE
					return TRUE
				if(!can_shoot)
					can_shoot = TRUE
					return TRUE

			if("Change Weapon")
				choose_weapon()
				return TRUE

			if("Reboot")
				if(!damaged)
					return FALSE
				if(do_after(src, 60 SECONDS))
					damaged = FALSE
					integrity_stat = integrity_stat_max / 2
					repairs_left -= 1
					remove_filter("down")

	. = ..()



	switch(weapon_equiped)
		if("Standart Pistol")
			if(world.time <= next_click) // Hard check, before anything else, to avoid crashing
				return FALSE
			if(!can_shoot)
				return FALSE
			if(damaged)
				return FALSE
			else
				var/obj/item/projectile/bullet/mech/pew
				var/pew_sound

				pew = new /obj/item/projectile/bullet/mech(get_turf(src))
				pew.real_damage = 10
				pew_sound = 'sound/weapons/guns/ricochet4.ogg'

				if(istype(pew))
					playsound(pew.loc, pew_sound, 25, 1)
					pew.original = A
					pew.current = A
					pew.starting = get_turf(src)
					pew.shot_from = src
					pew.launch(A)
					next_click = world.time + 2 SECONDS

		if("Standart Rifle")
			if(world.time <= next_click) // Hard check, before anything else, to avoid crashing
				return FALSE
			if(!can_shoot)
				return FALSE
			if(damaged)
				return FALSE
			else
				var/obj/item/projectile/bullet/mech/pew
				var/pew_sound
				var/fire_delay

				for(var/bullet, bullet<3, bullet++)
					fire_delay += 3

					pew = new /obj/item/projectile/bullet/mech(get_turf(src))
					pew.real_damage = 5
					pew_sound = 'sound/weapons/guns/ricochet4.ogg'

					spawn(fire_delay)
						if(istype(pew))
							playsound(pew.loc, pew_sound, 25, 1)
							pew.original = A
							pew.current = A
							pew.starting = get_turf(src)
							pew.shot_from = src
							pew.launch(A, BP_CHEST, (A.x-src.x), (A.y-src.y))
				next_click = world.time + 3 SECONDS
