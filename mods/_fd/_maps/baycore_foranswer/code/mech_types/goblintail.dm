/mob/living/simple_animal/fd/lancer/proc/hacked()
// 1984 ЗДЕСЬ НИКОМУ НИХЕРА НИЧЕГО
	set waitfor = FALSE

	hacked = TRUE
	overlay_fullscreen("scanlines", /obj/screen/fullscreen/scanline)
	for(var/stage in 1 to 5)
		var/list/options = list()
		options["DEBUG"] = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "31")
		for(var/difficulty in 1 to (stage * 2) + 1)
			options["[difficulty]"] = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "38")

		var/qte_timer = world.time + 3 SECONDS

		playsound(src, 'packs/infinity/sound/mecha/UI_SCI-FI_Tone_10_stereo.ogg', 60, TRUE)
		var/chosen_option = show_radial_menu(src, src, shuffle(options), radius = 60, require_near = TRUE, offset_x = 125, offset_y = 125)
		if((chosen_option != "DEBUG") || (world.time > qte_timer))
			playsound(src, 'packs/infinity/sound/mecha/UI_SCI-FI_Tone_Deep_Wet_15_stereo_error.ogg', 60, TRUE)
			break

		if(stage == 5)
			playsound(src, 'packs/infinity/sound/mecha/UI_SCI-FI_Tone_Deep_Wet_22_stereo_complite.ogg', 60)
			hacked = FALSE

	if(hacked)
		var/debuff = pick("overheated","Stunned","Broken")
		switch(debuff)
			if("overheated")
				overheated = TRUE
				overheated_timer = initial(overheated_timer)
				heat = 0
				if(has_overheated_state)
					icon_state = "[icon_living]_charged"
				add_filter("heated", 5, list("type" = "outline", , "size" = 0, "color" = COLOR_AMBER))
				add_filter("heated_blur", 4, list("type" = "blur", , "size" = 0))
				animate(get_filter("heated"), time = 15 SECONDS, size = 1, flags = ANIMATION_PARALLEL)
				animate(get_filter("heated_blur"), time = 10 SECONDS, size = 1, flags = ANIMATION_PARALLEL)
				animate(src, time = 10 SECONDS, color = "#fc987a", flags = ANIMATION_PARALLEL)
				playsound(get_turf(src),'sound/mecha/internaldmgalarm.ogg',20)
				playsound(get_turf(src),'sound/effects/iron_sizzle.ogg',100,TRUE)
			if("Stunned")
				chained_for = world.time + 10 SECONDS
				chained = TRUE
			if("Broken")
				malf_for = world.time + 10 SECONDS
				malfunctioned = TRUE

	clear_fullscreen("scanlines")
	hacked = FALSE

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

/mob/living/simple_animal/fd/lancer/goblintail/resupply()
	. = ..()
	gun_ammo = initial(gun_ammo)

/mob/living/simple_animal/fd/lancer/goblintail
	name = "L-APU Goblintail"
	desc = "An spec-ops lightweight APU model with installed stealth-tech."
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/mechs/scout_def.dmi'
	icon_state = "scout"

	integrity = 300
	integrity_max = 300

	heat_overflow = 10
	repairs = 2

	base_movement_cooldown = 3

	spare_magazines = 4

	pixel_x = -105
	default_pixel_x = -105
	pixel_y = -76
	default_pixel_y = -76

	var/cloaked = FALSE
	var/cloak_color = "#27d6a2"
	var/next_cloak_in = 0

	var/next_slap = 0

	var/hack_charges = 6
	var/recharging = FALSE
	var/recharge_in = 60 SECONDS

	wreck_type = /obj/structure/fd/mech_wreckage/small/goblin

/mob/living/simple_animal/fd/lancer/goblintail/Stat()
	. = ..()
	if(statpanel("Mech Status"))
		stat(SPAN_COLOR("#c675fc", "Зарядов Взлома:"), SPAN_COLOR("#c675fc", "[hack_charges]"))
		if(recharging)
			stat(SPAN_COLOR("#ec75fc", "Следующий Заряд:"), SPAN_COLOR("#ec75fc","[recharge_in - world.time / 10] Секунд"))

/mob/living/simple_animal/fd/lancer/goblintail/damage_animation(amount, ignore_armor = FALSE)
	. = ..()

	if(cloaked)
		cloaked = FALSE

/mob/living/simple_animal/fd/lancer/goblintail/Life()

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

	// Для абилки Наполеона. В клоаке у нас по определению не должно быть 255 альфы, так что по-идее всё должно быть ок
	if(cloaked && alpha == 255)
		icon_state = icon_living
		cloaked = FALSE
		set_light(0)

	. = ..()

/mob/living/simple_animal/fd/lancer/goblintail/choose_weapon()
	var/list/options = list(
		"Submachine Gun" = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "24"),
		"Whip" = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "24")
	)
	var/chosen_option = show_radial_menu(src, src, options, radius = 30, require_near = TRUE, offset_x = 105, offset_y = 90)
	if(!chosen_option)
		return FALSE
	weapon_equipped = chosen_option
	playsound(get_turf(src), 'packs/infinity/sound/items/change_jaws.ogg', 80, TRUE)

/mob/living/simple_animal/fd/lancer/goblintail/consume_ammo()
	if(gun_ammo <= 0)
		return FALSE
	gun_ammo--
	return TRUE

/mob/living/simple_animal/fd/lancer/goblintail/ClickOn(atom/A, params)
	var/modifiers = params2list(params)

	if(A == src)
		if(hacked)
			return FALSE

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

						visible_message(SPAN_NOTICE("[src] начинает перезаряжать своё орудие."), SPAN_INFO("Ты начинаешь перезаряжать своё орудие."))
						if(!do_after(src, 10 SECONDS))
							return FALSE

						playsound(get_turf(src), 'mods/_fd/immersive_sounds/sounds/SOMA/server_lever_reset_01.ogg', 80)
						visible_message(SPAN_NOTICE("[src] загружает новую порцию патрон в систему."), SPAN_INFO("Ты загружаешь новую порцию патрон в систему."))

						gun_ammo = initial(gun_ammo)
						spare_magazines -= 1

				if("Toggle Safety")
					weapon_safety = !weapon_safety
					playsound(get_turf(src), 'packs/infinity/sound/effects/using/switch/small2.ogg', 80, TRUE)

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

	else if(modifiers["shift"] && istype(A, /mob/living/simple_animal/fd/lancer))
		scan(A, params)

	else if(modifiers["alt"])
		if(!cloaked)
			return FALSE

		if(istype(A, /mob/living/simple_animal/fd/lancer))
			var/mob/living/simple_animal/fd/lancer/M = A
			if(hack_charges <= 0)
				return FALSE
			if(!do_after(src, 5 SECONDS, do_flags = DO_BOTH_CAN_MOVE))
				return FALSE
			M.hacked()
			if(!overheated)
				hack_charges -= 1
				heat += 2
			return TRUE

	else if(modifiers["ctrl"])

	else if(modifiers["left"] && istype(A, /obj/structure/fd/baycore/resupply))
		A.attack_animal(src)

	else if(modifiers["left"] && !weapon_safety)
		switch(weapon_equipped)
			if("Submachine Gun")
				var/damage_bonus = 0
				if(cloaked)
					damage_bonus += 20
					cloaked = FALSE
					next_cloak_in = world.time + 10 SECONDS
				mech_shoot(A, /obj/item/projectile/bullet/mech/goblintail, 1 SECONDS, 3, 2, damage_bonus)

			if("Whip")
				if(damaged)
					return FALSE
				if(get_dist(A, src) > 3)
					return FALSE
				if(world.time <= next_slap)
					return FALSE

				do_attack_animation(A)
				if(istype(A, /mob/living/simple_animal/fd/lancer))
					var/mob/living/simple_animal/fd/lancer/M = A
					var/damage_incoming = 50
					if(cloaked)
						damage_incoming += 50
						cloaked = FALSE
					if(M.vulnerable)
						damage_incoming *= 2
					damage_incoming -= M.armor_stat
					if(!M.damaged)
						M.integrity -= damage_incoming
						M.damage_animation(damage_incoming)
				next_slap = world.time + 5 SECONDS

	else if(modifiers["drag"])

	else
		. = ..()

/obj/item/projectile/bullet/mech/goblintail
	mech_damage = 5
	fire_sound = 'sound/weapons/gunshot/gunshot.ogg'
