/mob/living/simple_animal/hostile/fd/mech/proc/hacked()
// НИКОГО НИЧЕГО НИКОМУ НИКОГДА
	overlay_fullscreen("scanlines",/obj/screen/fullscreen/scanline)
	hacked = TRUE
	hacking_qte = world.time + 5 SECONDS
	if(world.time >= hacking_qte && hacked)
		clear_fullscreen("scanlines")
		var/debuff = pick("Overheated","Stunned")
		switch(debuff)
			if("Overheated")
				overheated = TRUE
				return TRUE
			if("Stunned")
				chained_for = world.time + 10 SECONDS
				chained = TRUE
				return TRUE

/mob/living/simple_animal/hostile/fd/mech/goblintail
	name = "L-APU"
	desc = "An special experimental vehicle."
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/mechs/scout_def.dmi'
	icon_state = "scout"
	icon_living = "scout"

	integrity_stat = 300
	integrity_stat_max = 300

	heat_overflow = 10
	repairs_left = 2

	weapon_equiped = "Submachine Gun"

	has_ammo = TRUE
	spare_magazines = 4
	var/gun_ammo = 80

	death_states = 4

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
	var/chosen_option = show_radial_menu(src, src, options, radius = 30, require_near = TRUE)
	switch(chosen_option)
		if("Submachine Gun")
			weapon_equiped = "Submachine Gun"
			return TRUE
		if("Whip")
			weapon_equiped = "Whip"
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
			"Toggle Fire" = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "6"),
			"Cloak On/Off" = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "19"),
			"Reboot" = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "34"),
		)

		var/list/modifiers = params2list(params)
		var/chosen_option

		if(modifiers["vis-x"] && modifiers["vis-y"])
			chosen_option = show_radial_menu(src, src, options, radius = 30, require_near = TRUE, offset_x = text2num(modifiers["vis-x"]), offset_y = text2num(modifiers["vix-y"]))
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
					animate(src, 1 SECOND, alpha = 50)
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

		if(istype(A, /mob/living/simple_animal/hostile/fd/mech))
			var/mob/living/simple_animal/hostile/fd/mech/M = A
			if(hack_charges <= 0)
				return FALSE
			if(!do_after(src, 5 SECONDS))
				return FALSE
			M.hacked()
			hack_charges -= 1
			return TRUE

	. = ..()

	switch(weapon_equiped)
		if("Submachine Gun")
			if(!can_shoot)
				return FALSE
			if(gun_ammo <= 0)
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
					gun_ammo -= 1
					fire_delay += 2

					if(gun_ammo <= 0)
						continue

					pew = new /obj/item/projectile/bullet/mech(get_turf(src))
					pew.real_damage = 5
					if(cloaked)
						pew.real_damage += 20
						cloaked = FALSE
					pew_sound = 'sound/weapons/gunshot/gunshot.ogg'

					spawn(fire_delay)
						if(istype(pew))
							playsound(pew.loc, pew_sound, 25, 1)
							pew.original = A
							pew.current = A
							pew.starting = get_turf(src)
							pew.shot_from = src
							pew.launch(A, BP_CHEST, (A.x-src.x), (A.y-src.y))
				shot_delay = world.time + 1 SECONDS

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
