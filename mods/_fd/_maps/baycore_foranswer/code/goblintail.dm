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

/obj/structure/fd/mech_wreckage/small/goblin
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/mechs/scout_def.dmi'
	icon_state = "scout_death_1"

	pixel_y = 0
	pixel_x = 0
	bound_width = 160
	bound_height = 64

/obj/structure/fd/mech_wreckage/small/goblin/Initialize()
	. = ..()
	var/state = rand(1,4)
	icon_state = "scout_death_[state]"

/mob/living/simple_animal/hostile/fd/mech/goblintail
	name = "L-APU Goblintail"
	desc = "An spec-ops lightweight APU model with installed stealth-tech."
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/mechs/scout_def.dmi'
	icon_state = "scout"
	icon_living = "scout"

	integrity = 300
	integrity_max = 300

	heat_overflow = 10
	repairs_left = 2

	movement_cooldown = 2

	weapon_equipped = "Submachine Gun"

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

	wreck_type = /obj/structure/fd/mech_wreckage/small/goblin

/mob/living/simple_animal/hostile/fd/mech/goblintail/Stat()
	. = ..()
	if(statpanel("Mech"))
		stat(SPAN_COLOR("#c675fc", "Зарядов Взлома:"), SPAN_COLOR("#c675fc", "[hack_charges]"))
		if(recharging)
			stat(SPAN_COLOR("#ec75fc", "Следующий Заряд:"), SPAN_COLOR("#ec75fc","[recharge_in - world.time / 10] Секунд"))

/mob/living/simple_animal/hostile/fd/mech/goblintail/damage_animation(amount, ignore_armor = FALSE)
	. = ..()

	if(cloaked)
		cloaked = FALSE

/mob/living/simple_animal/hostile/fd/mech/goblintail/Life()

	if(hack_charges < initial(hack_charges) && !recharging)
		recharging = TRUE
		recharge_in += world.time

	if(world.time >= recharge_in && recharging)
		hack_charges = initial(hack_charges)
		recharge_in = initial(recharge_in)
		recharging = FALSE

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
			weapon_equipped = "Submachine Gun"
			return TRUE
		if("Whip")
			weapon_equipped = "Whip"
			return TRUE

/mob/living/simple_animal/hostile/fd/mech/goblintail/consume_ammo()
	if(gun_ammo <= 0)
		return FALSE
	gun_ammo--
	return TRUE

/mob/living/simple_animal/hostile/fd/mech/goblintail/ClickOn(atom/A, params)
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
					if(weapon_equipped == "Submachine Gun")
						if(spare_magazines <= 0)
							return FALSE
						if(!do_after(src, 10 SECONDS))
							return FALSE

						gun_ammo = initial(gun_ammo)
						spare_magazines -= 1

				if("Toggle Safety")
					weapon_safety = !weapon_safety

				if("Change Weapon")
					choose_weapon()

				if("Cloak On/Off")
					if(cloaked)
						icon_state = icon_living
						cloaked = FALSE
						animate(src, 1 SECOND, alpha = 255)
						set_light(0)
						next_cloak_in = world.time + 5 SECONDS
					else
						if(world.time <= next_cloak_in)
							return FALSE
						icon_state = "[icon_living]_cloak"
						animate(src, 1 SECOND, alpha = 30)
						set_light(3, 2, l_color = cloak_color)
						cloaked = TRUE

				if("Reboot")
					mech_reboot()

			return FALSE

	else if(modifiers["middle"])

	else if(modifiers["shift"])
		if(istype(A, /mob/living/simple_animal/hostile/fd/mech))
			scan(A, params)

	else if(modifiers["alt"])
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

	else if(modifiers["ctrl"])

	else if(modifiers["left"] && !weapon_safety)
		switch(weapon_equipped)
			if("Submachine Gun")
				var/damage_bonus = 0
				if(cloaked)
					damage_bonus += 20
					cloaked = FALSE
					next_cloak_in = world.time + 10 SECONDS
				mech_shoot(A, /obj/item/projectile/bullet/mech/goblintail, (world.time + 1 SECONDS), 3, 2, damage_bonus)

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
						M.integrity -= damage_incoming
						M.damage_animation(damage_incoming)
				next_slap = world.time + 5 SECONDS

	else
		. = ..()

/obj/item/projectile/bullet/mech/goblintail
	real_damage = 5
	fire_sound = 'sound/weapons/gunshot/gunshot.ogg'
