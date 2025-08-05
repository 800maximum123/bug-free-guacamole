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

		if(M.overprotected)
			var/mob/living/simple_animal/hostile/fd/mech/saladin/D
			if(get_dist(D, src) < 13)
				if(D.protected == M)
					D.shield_integrity -= final_damage
					D.heat += 1
					D.damage_animation(0, ignore_armor = FALSE)
					return TRUE

		if(!M.damaged)
			M.integrity_stat -= final_damage
		if(piercing)
			M.damage_animation(final_damage, ignore_armor = TRUE)
		else
			M.damage_animation(final_damage)

/obj/item/projectile/bullet/mech/experimental/on_hit(atom/target, blocked = 0)
	. = ..()

	if(istype(target, /mob/living/simple_animal/hostile/fd/mech))
		var/mob/living/simple_animal/hostile/fd/mech/M = target

		M.heat += 2

/mob/living/simple_animal/hostile/fd/mech
	name = "Armored Personal Unit (APU)"
	desc = "An special experimental vehicle."
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/mechs/breacher_def.dmi'
	icon_state = "breacher"
	icon_living = "breacher"

	health = 9999999
	maxHealth = 9999999

	var/armor_stat = 0 // Снижает урона на [X]
	var/shielded = FALSE // Дрейк способен перетягивать входящий урон на себя
	var/overprotected = FALSE // Саладин накидывает оверхп
	var/mutable_appearance/field_overlay

	var/integrity_stat = 100 // Текущее ХП
	var/integrity_stat_max = 100 // Максимальное ХП

	var/heat = 0 // Перегрев. Сбрасывается до нуля, когда достигает [heat_overflow]
	var/heat_overflow = 5 // Максимальное количество перегрева, после достижения которого мы перегреваемся

	var/overheated = FALSE // Мы перегрелись. Мы получаем урон, но также можем бесплатно использовать любые абилки пока таймер не кончится
	var/overheat_timer = 30 // Остужение через [X]
	var/has_overheated_state = FALSE

	var/weapon_equiped = "Standart Pistol"

	var/repairs_left = 1 // Сколько раз мы сможем подниматься из мёртвых?
	var/damaged = FALSE // Мы в "крите"?

	var/can_shoot = TRUE
	var/has_ammo = FALSE
	var/spare_magazines = 0
	var/shot_delay = 0

	var/death_states = 4

	var/death_hitbox_x = 0
	var/death_hitbox_y = 0

/mob/living/simple_animal/hostile/fd/mech/death()
	..(FALSE, "suddenly breaks apart.", "You have been destroyed.")
	var/state_number = rand(1, death_states)
	icon_dead = "[icon_living]_death_[state_number]"
	icon_state = icon_dead

	pixel_x = 0
	pixel_y = 0
	default_pixel_x = 0
	default_pixel_y = 0

	density = TRUE

	bound_width = death_hitbox_x
	bound_height = death_hitbox_y

/mob/living/simple_animal/hostile/fd/mech/proc/damage_animation(amount, ignore_armor = FALSE)
	if(damaged)
		return FALSE

	if(armor_stat >= amount && !ignore_armor)
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

/mob/living/simple_animal/hostile/fd/mech/verb/change_view()
	set name = "Change View"
	set category = "Mech"
	set desc = "This will let you change your scope size."

	src.client.view = input("Select view range:", "FUCK YE", 7) in list(7,8,10,12)

/mob/living/simple_animal/hostile/fd/mech/Life()

	if(damaged && repairs_left <= 0)
		death()

	if(integrity_stat <= 0)
		damaged = TRUE
		add_filter("down", 1, list("type" = "outline", , "size" = 1, "color" = COLOR_RED))

	if(overheated && overheat_timer > 0 && !damaged)
		integrity_stat -= 1
		overheat_timer -= 1
		damage_animation(1, ignore_armor = TRUE)

	if(overheated && overheat_timer <= 0)
		overheated = FALSE
		if(has_overheated_state && stat != DEAD)
			icon_state = initial(icon_state)
		overheat_timer = initial(overheat_timer)
		remove_filter("heated")

	if(heat == heat_overflow)
		heat = 0
		overheated = TRUE
		if(has_overheated_state)
			icon_state = "[icon_living]_charged"
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
