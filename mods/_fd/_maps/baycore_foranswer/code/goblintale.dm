/mob/living/simple_animal/hostile/fd/mech/goblintale
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

	death_states = 4

	var/cloacked = FALSE

/mob/living/simple_animal/hostile/fd/mech/goblintale/ClickOn(atom/A, params)
	if(A == src)
		var/list/options = list(
			"Change Weapon" = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "24"),
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
		if("Submachine Gun")
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
					if(cloaked)
						pew.real_damage += 5
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
