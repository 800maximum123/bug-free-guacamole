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

		if(M.shielded)
			for(var/mob/living/simple_animal/hostile/fd/mech/drake/D in view(2,src))
				if(!D.damaged)
					D.integrity_stat -= final_damage
				if(piercing)
					D.damage_animation(final_damage, ignore_armor = TRUE)
					return TRUE
				else
					D.damage_animation(final_damage)
					return TRUE

		if(!M.damaged)
			M.integrity_stat -= final_damage
		if(piercing)
			M.damage_animation(final_damage, ignore_armor = TRUE)
		else
			M.damage_animation(final_damage)

/mob/living/simple_animal/hostile/fd/mech
	name = "Armored Personal Unit (APU)"
	desc = "An special experimental vehicle."
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/mech_size1.dmi'
	icon_state = "blackbeard"

	health = 9999999
	maxHealth = 9999999

	var/armor_stat = 0 // Снижает урона на [X]
	var/shielded = FALSE // Дрейк способен перетягивать входящий урон на себя

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
	var/shot_delay = 0

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
	var/chosen_option = show_radial_menu(src, src, options, radius = 30, require_near = TRUE)
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

	. = ..()

/mob/living/simple_animal/hostile/fd/mech/ClickOn(atom/A, params)
	if(A == src)
		var/list/options = list(
			"Change Weapon" = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "24"),
			"Toggle Fire" = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "6"),
			"Reboot" = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "34"),
		)

		var/chosen_option = show_radial_menu(src, src, options, radius = 30, require_near = TRUE)
		if(!chosen_option)
			return FALSE
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
				if(!do_after(src, 60 SECONDS))
					return FALSE
				damaged = FALSE
				integrity_stat = integrity_stat_max / 2
				repairs_left -= 1
				remove_filter("down")
				return TRUE

	. = ..()

	switch(weapon_equiped)
		if("Standart Pistol")
			if(!can_shoot)
				return FALSE
			if(damaged)
				return FALSE
			if(world.time <= shot_delay)
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
					shot_delay = world.time + 1 SECONDS

		if("Standart Rifle")
			if(!can_shoot)
				return FALSE
			if(damaged)
				return FALSE
			if(world.time <= shot_delay)
				return FALSE
			else
				var/obj/item/projectile/bullet/mech/pew
				var/pew_sound
				var/fire_delay

				for(var/bullet, bullet<3, bullet++)
					fire_delay += 2

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
				shot_delay = world.time + 2 SECONDS





// DRAKE - LL3
//// Tank
//// Siege mode is OP
//// Minigun as main and only weapon, holds it ONE-HANDEDLY

/obj/item/shield/riot/mech
	var/real_damage = 10
	var/throw_distance = 3

/obj/item/shield/riot/mech/resolve_attackby(atom/atom, mob/living/user, click_params)
	if(istype(atom, /mob/living/simple_animal/hostile/fd/mech))
		var/mob/living/simple_animal/hostile/fd/mech/M = atom
		M.throw_at(get_edge_target_turf(M, get_dir(user, M)), throw_distance, 2, user)

		var/final_damage = real_damage
		final_damage -= M.armor_stat
		if(!M.damaged)
			M.integrity_stat -= final_damage
			M.damage_animation(final_damage)

/mob/living/simple_animal/hostile/fd/mech/drake
	name = "H-APU Drake"
	desc = "The Drake was the first, and most resilient APU ever designed by ''Shield''."
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/mech_size2.dmi'
	icon_state = "drake"

	pixel_x = -48
	pixel_y = -16
	default_pixel_x = -48
	default_pixel_y = -16

	speed = 3

	armor_stat = 5
	integrity_stat = 500
	integrity_stat_max = 500

	heat_overflow = 10
	weapon_equiped = "Assault Cannon"
	repairs_left = 2

	var/speed_buff = 0 // Разгон ствола за счёт перегрева
	var/start_counting = FALSE
	var/buff_timer = 30 SECONDS

	var/cannon_ammo = 600
	var/spare_magazines = 1

	var/bunkermode = FALSE

/mob/living/simple_animal/hostile/fd/mech/drake/Move()
	if(bunkermode)
		return 0

	. = ..()

/mob/living/simple_animal/hostile/fd/mech/drake/Life()
	if(speed_buff > 0 && !start_counting)
		start_counting = TRUE
		buff_timer += world.time

	if(world.time >= buff_timer && start_counting)
		speed_buff = 0
		buff_timer = initial(buff_timer)
		start_counting = FALSE

	if(bunkermode && !damaged)
		for(var/mob/living/simple_animal/hostile/fd/mech/M in oview(2,src))
			M.shielded = TRUE

	. = ..()

/mob/living/simple_animal/hostile/fd/mech/drake/choose_weapon()
	var/list/options = list(
		"Assault Cannon" = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "24"),
		"Shield" = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "24")
	)
	var/chosen_option = show_radial_menu(src, src, options, radius = 30, require_near = TRUE)
	switch(chosen_option)
		if("Assault Cannon")
			weapon_equiped = "Assault Cannon"
			natural_weapon = /obj/item/natural_weapon
		if("Shield")
			weapon_equiped = "Shield"
			natural_weapon = /obj/item/shield/riot/mech

/mob/living/simple_animal/hostile/fd/mech/drake/ClickOn(atom/A, params)
	if(A == src)
		var/list/options = list(
			"Change Weapon" = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "24"),
			"Reload Weapon" = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "17"),
			"Spin Cannon" = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "22"),
			"Setup Bunker" = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "18"),
			"Toggle Fire" = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "6"),
			"Reboot" = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "34"),
		)

		var/chosen_option = show_radial_menu(src, src, options, radius = 30, require_near = TRUE)
		if(!chosen_option)
			return FALSE
		switch(chosen_option)

			if("Toggle Fire")
				if(can_shoot)
					can_shoot = FALSE
					return TRUE
				if(!can_shoot)
					can_shoot = TRUE
					return TRUE

			if("Reload Weapon")
				if(weapon_equiped == "Assault Cannon")
					if(spare_magazines <= 0)
						return FALSE
					if(!do_after(src, 10 SECONDS))
						return FALSE

					cannon_ammo = initial(cannon_ammo)
					spare_magazines -= 1
					return TRUE

			if("Setup Bunker")
				if(bunkermode)
					bunkermode = FALSE
					armor_stat = initial(armor_stat)
					return TRUE
				if(!bunkermode)
					bunkermode = TRUE
					armor_stat = 15
					return TRUE

			if("Spin Cannon")
				if(damaged)
					return FALSE
				if(speed_buff >= 4 SECONDS)
					return FALSE
				if(!do_after(src, 2 SECONDS))
					return FALSE
				speed_buff += 1 SECOND
				if(overheated)
					integrity_stat -= 10
					damage_animation(10, ignore_armor = TRUE)
				else
					heat += 1
				return TRUE

			if("Change Weapon")
				choose_weapon()
				return TRUE

			if("Reboot")
				if(!damaged)
					return FALSE
				if(!do_after(src, 60 SECONDS))
					return FALSE
				damaged = FALSE
				integrity_stat = integrity_stat_max / 2
				repairs_left -= 1
				remove_filter("down")
				return TRUE

	. = ..()

	if(weapon_equiped == "Assault Cannon")
		if(!can_shoot)
			return FALSE
		if(cannon_ammo <= 0)
			return FALSE
		if(damaged)
			return FALSE
		if(world.time <= shot_delay)
			return FALSE
		else
			var/obj/item/projectile/bullet/mech/pew
			var/pew_sound
			var/fire_delay

			for(var/bullet, bullet<6, bullet++)
				cannon_ammo -= 1
				fire_delay += 1

				if(cannon_ammo <= 0)
					continue

				pew = new /obj/item/projectile/bullet/mech(get_turf(src))
				pew.real_damage = 10
				pew_sound = 'sound/weapons/guns/ricochet4.ogg'

				spawn(fire_delay)
					if(istype(pew))
						playsound(pew.loc, pew_sound, 25, 1)
						pew.original = A
						pew.current = A
						pew.starting = get_turf(src)
						pew.shot_from = src
						pew.launch(A, BP_CHEST, (A.x-src.x), (A.y-src.y))
			shot_delay = world.time + 4 SECONDS - speed_buff
