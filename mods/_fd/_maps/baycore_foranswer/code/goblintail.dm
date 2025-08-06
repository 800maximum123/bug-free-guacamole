/mob/living/simple_animal/hostile/fd/mech/proc/hacked()
// НИКОГО НИЧЕГО НИКОМУ НИКОГДА
	overlay_fullscreen("scanlines",/obj/screen/fullscreen/scanline)
	hacked = TRUE
	hacking_qte = world.time + 5 SECONDS
	if(world.time >= hacking_qte && hacked)
		clear_fullscreen("scanlines")
		var/debuff = pick("Overheated","Stunned","Broken")
		switch(debuff)
			if("Overheated")
				overheated = TRUE
				return TRUE
			if("Stunned")
				chained_for = world.time + 10 SECONDS
				chained = TRUE
				return TRUE
			if("Broken")
				malf_for = world.time + 10 SECONDS
				malfunction = TRUE
				return TRUE

/mob/living/simple_animal/hostile/fd/mech/goblintail
	name = "L-APU Goblintail"
	desc = "An spec-ops lightweight APU model with installed stealth-tech."
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/mechs/scout_def.dmi'
	icon_state = "scout"
	icon_living = "scout"

	integrity_stat = 300
	integrity_stat_max = 300

	heat_overflow = 10
	repairs_left = 2

	movement_cooldown = 2

	weapon_equiped = "Submachine Gun"

	spare_magazines = 4
	has_ammo = TRUE

	var/gun_ammo = 80

	pixel_x = -105
	default_pixel_x = -105
	pixel_y = -50
	default_pixel_y = -50

	var/cloaked = FALSE
	var/cloak_color = "#27d6a2"
	var/next_cloak_in = 0

	var/next_slap = 0

	var/hack_charges = 6
	var/recharging = FALSE
	var/recharge_in = 60 SECONDS

/mob/living/simple_animal/hostile/fd/mech/goblintail/Stat()
	. = ..()
	if(statpanel("Mech"))
		stat(null, SPAN_BOLD(SPAN_COLOR("#c675fc", "Зарядов Взлома: [hack_charges]")))
		if(recharging)
			stat(null, SPAN_COLOR("#ec75fc", "Следующий Заряд: [recharge_in - world.time / 10] Секунд"))

/mob/living/simple_animal/hostile/fd/mech/goblintail/damage_animation(amount, ignore_armor = FALSE)
	. = ..()

	if(hack_charges < initial(hack_charges) && !recharging)
		recharging = TRUE
		recharge_in += world.time

	if(world.time >= recharge_in && recharging)
		hack_charges = initial(hack_charges)
		recharge_in = initial(recharge_in)
		recharging = FALSE

	if(cloaked)
		cloaked = FALSE

/mob/living/simple_animal/hostile/fd/mech/goblintail/Life()
	if(!cloaked && alpha != 255)
		icon_state = icon_living
		animate(src, 1 SECOND, alpha = 255)
		set_light(0)

	. = ..()

/mob/living/simple_animal/hostile/fd/mech/goblintail/choose_weapon()
	var/list/options = list(
		"Submachine Gun" = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "24"),
		"Whip" = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "24")
	)
	var/chosen_option = show_radial_menu(src, src, options, radius = 30, require_near = TRUE, offset_x = 105, offset_y = 90)
	switch(chosen_option)
		if("Submachine Gun")
			weapon_equiped = "Submachine Gun"
			return TRUE
		if("Whip")
			weapon_equiped = "Whip"
			return TRUE

/mob/living/simple_animal/hostile/fd/mech/goblintail/consume_ammo()
	if(gun_ammo <= 0)
		return FALSE
	gun_ammo--
	return TRUE

/mob/living/simple_animal/hostile/fd/mech/goblintail/ClickOn(atom/A, params)
	if(A == src && hacked)
		if(!do_after(src, 2 SECONDS))
			return FALSE
		hacked = FALSE
		return TRUE

	if(A == src)
		var/list/options = list(
			"Change Weapon" = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "24"),
			"Reload Weapon" = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "17"),
			"Toggle Safety" = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "6"),
			"Cloak On/Off" = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "19"),
			"Reboot" = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "34"),
		)

		var/chosen_option = show_radial_menu(src, src, options, radius = 30, require_near = TRUE, offset_x = 105, offset_y = 90)
		if(!chosen_option)
			return FALSE
		switch(chosen_option)

			if("Reload Weapon")
				if(weapon_equiped == "Submachine Gun")
					if(spare_magazines <= 0)
						return FALSE
					if(!do_after(src, 10 SECONDS))
						return FALSE

					gun_ammo = initial(gun_ammo)
					spare_magazines -= 1
					return TRUE

			if("Toggle Safety")
				if(can_shoot)
					can_shoot = FALSE
					return TRUE
				if(!can_shoot)
					can_shoot = TRUE
					return TRUE

			if("Change Weapon")
				choose_weapon()
				return TRUE

			if("Cloak On/Off")
				if(cloaked)
					icon_state = icon_living
					cloaked = FALSE
					animate(src, 1 SECOND, alpha = 255)
					set_light(0)
					next_cloak_in = world.time + 5 SECONDS
					return TRUE
				if(!cloaked)
					if(world.time <= next_cloak_in)
						return FALSE
					icon_state = "[icon_living]_cloak"
					animate(src, 1 SECOND, alpha = 30)
					set_light(3, 2, l_color = cloak_color)
					cloaked = TRUE
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

	var/modifiers = params2list(params)

	if(modifiers["alt"])
		if(!cloaked)
			return FALSE

		if(istype(A, /mob/living/simple_animal/hostile/fd/mech))
			var/mob/living/simple_animal/hostile/fd/mech/M = A
			if(hack_charges <= 0)
				return FALSE
			if(!do_after(src, 5 SECONDS))
				return FALSE
			M.hacked()
			if(!overheated)
				hack_charges -= 1
				heat += 2
			return TRUE

	. = ..()

	switch(weapon_equiped)
		if("Submachine Gun")
			var/damage_bonus = 0
			if(cloaked)
				damage_bonus += 20
				cloaked = FALSE
			mech_shoot(A, /obj/item/projectile/bullet/mech/goblintail, (next_fire = world.time + 1 SECONDS), 3, 2, damage_bonus)

		if("Whip")
			if(damaged)
				return FALSE
			if(get_dist(A, src) > 3)
				return FALSE
			if(world.time <= next_slap)
				return FALSE

			do_attack_animation(A)
			if(istype(A, /mob/living/simple_animal/hostile/fd/mech))
				var/mob/living/simple_animal/hostile/fd/mech/M = A
				var/damage_incoming = 50
				if(cloaked)
					damage_incoming += 50
					cloaked = FALSE
				damage_incoming -= M.armor_stat
				if(!M.damaged)
					M.integrity_stat -= damage_incoming
					M.damage_animation(damage_incoming)
			next_slap = world.time + 5 SECONDS

/obj/item/projectile/bullet/mech/goblintail
	real_damage = 5
	fire_sound = 'sound/weapons/gunshot/gunshot.ogg'
