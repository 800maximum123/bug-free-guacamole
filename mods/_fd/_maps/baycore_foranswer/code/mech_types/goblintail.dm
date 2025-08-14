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
				chained = TRUE
			if("Broken")
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

	var/next_slap = 0

	var/hack_charges = 6
	var/recharging = FALSE
	var/recharge_in = 60 SECONDS

	wreck_type = /obj/structure/fd/mech_wreckage/small/goblin

/obj/item/projectile/bullet/mech/goblintail
	integrity_damage = 5
	hull_damage = 5
	fire_sound = 'sound/weapons/gunshot/gunshot.ogg'
