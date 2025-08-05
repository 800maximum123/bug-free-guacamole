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
			for(var/mob/living/simple_animal/hostile/fd/mech/saladin/D in range(12,src))
				if(D.protected == M)
					D.shield_integrity -= final_damage
					D.heat += final_damage
					D.damage_animation(0)
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





// HEAVY
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
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/mechs/heavy_def.dmi'
	icon_state = "heavy"
	icon_living = "heavy"

	pixel_x = -110
	default_pixel_x = -110
	pixel_y = -30
	default_pixel_y = -30

	speed = 3

	armor_stat = 5
	integrity_stat = 1000
	integrity_stat_max = 1000

	heat_overflow = 10
	weapon_equiped = "Assault Cannon"
	repairs_left = 2

	death_states = 7

	death_hitbox_x = 256
	death_hitbox_y = 64

	has_ammo = TRUE
	spare_magazines = 1

	var/speed_buff = 0 // Разгон ствола за счёт перегрева
	var/start_counting = FALSE
	var/buff_timer = 30 SECONDS

	var/cannon_ammo = 600

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
				pew.icon_state = "bolter"
				pew_sound = 'sound/weapons/gunshot/minigun.ogg'

				spawn(fire_delay)
					if(istype(pew))
						playsound(pew.loc, pew_sound, 10, 1)
						pew.original = A
						pew.current = A
						pew.starting = get_turf(src)
						pew.shot_from = src
						pew.launch(A, BP_CHEST, (A.x-src.x), (A.y-src.y))
			shot_delay = world.time + 4 SECONDS - speed_buff




// SUPPORT
//// GET HEALED GET HEALED GET HEALED

/mob/living/simple_animal/hostile/fd/mech/lancaster
	name = "SUPP-APU Lancaster"
	desc = "Special engineering machine, manufactured to bring fast aid to the other personal units on the battlefield."
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/mechs/engineer_def.dmi'
	icon_state = "engineer"
	icon_living = "engineer"

	pixel_x = -105
	default_pixel_x = -105
	pixel_y = -55
	default_pixel_y = -55

	speed = 0

	armor_stat = 2
	integrity_stat = 500
	integrity_stat_max = 500
	death_states = 1

	heat_overflow = 5
	overheat_timer = 10

	weapon_equiped = "Plasma Cutter"

	death_hitbox_x = 256
	death_hitbox_y = 64

	repairs_left = 4
	var/restock_charges = 12

	var/cooling_process = 30 SECONDS
	var/start_counting = FALSE

	var/mob/living/simple_animal/hostile/fd/mech/passenger = null
	var/mutable_appearance/passenger_overlay

/mob/living/simple_animal/hostile/fd/mech/lancaster/Life()
	if(heat > 0 && !start_counting)
		start_counting = TRUE
		cooling_process += world.time

	if(world.time >= cooling_process && start_counting)
		heat -= 1
		cooling_process = initial(cooling_process)
		start_counting = FALSE

	. = ..()

/mob/living/simple_animal/hostile/fd/mech/lancaster/proc/choose_resupp()
	var/list/mechs_in_radius = list()

	var/list/options = list(
		"Reboot Self" = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "34"),
		"Patch Allie/Self" = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "36"),
		"Restock Allie" = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "30")
	)
	var/chosen_option = show_radial_menu(src, src, options, radius = 30, require_near = TRUE)
	switch(chosen_option)
		if("Reboot Self")
			if(!damaged)
				return FALSE
			if(!do_after(src, 60 SECONDS))
				return FALSE
			damaged = FALSE
			integrity_stat = integrity_stat_max / 2
			repairs_left -= 1
			remove_filter("down")
			return TRUE

		if("Patch Allie/Self")
			if(restock_charges <= 0)
				return FALSE
			for(var/mob/living/simple_animal/hostile/fd/mech/M in view(2,src))
				if(M.stat != DEAD)
					mechs_in_radius += M
			var/mob/living/simple_animal/hostile/fd/mech/target_choice = show_radial_menu(src, src, mechs_in_radius, radius = 100, require_near = TRUE)
			if(!target_choice)
				return FALSE
			if(!do_after(src, 10 SECONDS))
				return FALSE
			if(target_choice.damaged && target_choice.stat != DEAD)
				target_choice.damaged = FALSE
			target_choice.integrity_stat += 100
			target_choice.heat = 0
			if(target_choice.integrity_stat > target_choice.integrity_stat_max)
				target_choice.integrity_stat = target_choice.integrity_stat_max
			restock_charges -= 1
			return TRUE

		if("Restock Allie")
			if(restock_charges <= 0)
				return FALSE
			for(var/mob/living/simple_animal/hostile/fd/mech/M in oview(1,src))
				if(M.stat != DEAD && M.has_ammo)
					mechs_in_radius += M
			var/mob/living/simple_animal/hostile/fd/mech/target_choice = show_radial_menu(src, src, mechs_in_radius, radius = 100, require_near = TRUE)
			if(!target_choice)
				return FALSE
			if(!do_after(src, 10 SECONDS))
				return FALSE
			target_choice.spare_magazines += 2
			restock_charges -= 1
			return TRUE

/mob/living/simple_animal/hostile/fd/mech/lancaster/ClickOn(atom/A, params)
	if(A == src && stat != DEAD)
		var/list/options = list(
			"Toggle Fire" = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "6"),
			"Resupply Mech" = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "17"),
			"Unattach Passenger" = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "20"),
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

			if("Resupply Mech")
				choose_resupp()
				return TRUE

			if("Unattach Passenger")
				if(!isnull(passenger))
					passenger.forceMove(get_turf(src))
					passenger = null
					contents -= passenger
					speed = 0
					CutOverlays(passenger_overlay)
					return TRUE

				return FALSE

	var/modifiers = params2list(params)

	if(modifiers["alt"])
		if(!isnull(passenger))
			return FALSE
		if(istype(A, /mob/living/simple_animal/hostile/fd/mech))
			var/mob/living/simple_animal/hostile/fd/mech/M = A
			if(M == src)
				return FALSE
			if(!do_after(src, 5 SECONDS))
				return FALSE
			M.forceMove(src)
			passenger = M
			passenger_overlay = mutable_appearance(M.icon, M.icon_state)
			passenger_overlay.pixel_y = M.pixel_y + 100
			passenger_overlay.mouse_opacity = FALSE
			speed = 6

			AddOverlays(passenger_overlay)
			return TRUE

	. = ..()

	if(weapon_equiped == "Plasma Cutter")
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

			for(var/bullet, bullet<2, bullet++)
				fire_delay += 1

				pew = new /obj/item/projectile/bullet/mech(get_turf(src))
				pew.real_damage = 3
				pew.piercing = TRUE
				pew.icon_state = "pulse0_bl"
				pew.life_span = 5
				pew_sound = 'sound/weapons/plasma_cutter.ogg'

				spawn(fire_delay)
					if(istype(pew))
						playsound(pew.loc, pew_sound, 10, 1)
						pew.original = A
						pew.current = A
						pew.starting = get_turf(src)
						pew.shot_from = src
						pew.launch(A, BP_CHEST, (A.x-src.x), (A.y-src.y))
			shot_delay = world.time + 1 SECONDS



// EXPERIMENTAL
// BUUUUUUUUUUUUUUURN

/mob/living/simple_animal/hostile/fd/mech/saladin
	name = "SUPP-APU Saladin"
	desc = "An special experimental mech, utilizing some of the stolen enemy tech."
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/mechs/experimental_def.dmi'
	icon_state = "experimental"
	icon_living = "experimental"

	pixel_x = -115
	default_pixel_x = -115
	pixel_y = -25
	default_pixel_y = -25

	integrity_stat = 300
	integrity_stat_max = 300

	heat_overflow = 40
	overheat_timer = 60

	weapon_equiped = "Thermal Release"

	repairs_left = 2
	death_states = 2

	var/jump_counter = FALSE
	var/jump_cooldown = 10 SECONDS

	var/mob/living/simple_animal/hostile/fd/mech/protected = null
	var/shield_integrity = 20
	var/shield_cooldown = 0

/mob/living/simple_animal/hostile/fd/mech/saladin/Life()

	if(shield_integrity <= 0)
		if(!isnull(protected))
			protected.CutOverlays(field_overlay)
			protected.overprotected = FALSE

			shield_integrity = initial(shield_integrity)
			protected = null
			shield_cooldown = world.time + 10 SECONDS

	if(!isnull(protected))
		for(protected in range(12,src))
			if(!protected)
				protected.CutOverlays(field_overlay)
				protected.overprotected = FALSE

				shield_integrity = initial(shield_integrity)
				protected = null
				shield_cooldown = world.time + 5 SECONDS

	. = ..()

/mob/living/simple_animal/hostile/fd/mech/saladin/ClickOn(atom/A, params)
	var/modifiers = params2list(params)

	if(modifiers["shift"])
		if(istype(A, /mob/living/simple_animal/hostile/fd/mech))
			var/mob/living/simple_animal/hostile/fd/mech/M = A
			if(world.time <= shield_cooldown)
				return FALSE
			if(M == protected)
				protected.overprotected = FALSE
				protected.CutOverlays(field_overlay)
				shield_integrity = initial(shield_integrity)
				protected = null

				shield_cooldown = world.time + 5 SECONDS
				return TRUE
			if(!do_after(src, 2 SECONDS))
				return FALSE

			protected = M
			field_overlay = mutable_appearance('mods/_fd/_maps/baycore_foranswer/icons/mechs/experimental_def.dmi', "shield")
			field_overlay.pixel_x = M.pixel_x + 100
			field_overlay.mouse_opacity = FALSE

			protected.overprotected = TRUE
			protected.AddOverlays(field_overlay)
			return TRUE

	if(A == src)
		var/list/options = list(
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
		if("Thermal Release")
			if(!can_shoot)
				return FALSE
			if(damaged)
				return FALSE
			if(heat <= 0)
				return FALSE
			if(world.time <= shot_delay)
				return FALSE
			else
				var/obj/item/projectile/bullet/mech/experimental/pew
				var/pew_sound

				pew = new /obj/item/projectile/bullet/mech/experimental(get_turf(src))
				pew.real_damage = 5
				pew.icon = 'mods/_fd/fd_assets/icons/projectiles.dmi'
				pew.icon_state = "heavylaser"
				pew_sound = 'sound/weapons/laser3.ogg'

				if(istype(pew))
					heat -= 1
					playsound(pew.loc, pew_sound, 25, 1)
					pew.original = A
					pew.current = A
					pew.starting = get_turf(src)
					pew.shot_from = src
					pew.launch(A)
					shot_delay = world.time + 2 SECONDS
