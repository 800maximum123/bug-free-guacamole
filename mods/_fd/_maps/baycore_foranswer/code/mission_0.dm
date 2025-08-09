/obj/screen/fullscreen/mech/captain
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/pilots/cutscenes.dmi'
	icon_state = "stain"
	allstate = 1
	plane = HUD_PLANE
	layer = HUD_ABOVE_HUD_LAYER

/obj/screen/fullscreen/mech/lt1
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/pilots/cutscenes.dmi'
	icon_state = "gard"
	allstate = 1
	plane = HUD_PLANE
	layer = HUD_ABOVE_HUD_LAYER

/obj/screen/fullscreen/mech/lt2
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/pilots/cutscenes.dmi'
	icon_state = "kennet"
	allstate = 1
	plane = HUD_PLANE
	layer = HUD_ABOVE_HUD_LAYER

/obj/screen/fullscreen/mech/robot
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/pilots/cutscenes.dmi'
	icon_state = "rk560leo"
	allstate = 1
	plane = HUD_PLANE
	layer = HUD_ABOVE_HUD_LAYER

/obj/screen/fullscreen/mech/document_alexandra
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/pilots/cutscenes.dmi'
	icon_state = "alexandra"
	allstate = 1
	plane = HUD_PLANE
	layer = UNDER_HUD_LAYER

/obj/screen/fullscreen/mech/document_ootsuki
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/pilots/cutscenes.dmi'
	icon_state = "ootsuki"
	allstate = 1
	plane = HUD_PLANE
	layer = UNDER_HUD_LAYER

/obj/screen/fullscreen/mech/document_emilio
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/pilots/cutscenes.dmi'
	icon_state = "emilio"
	allstate = 1
	plane = HUD_PLANE
	layer = UNDER_HUD_LAYER

/obj/screen/fullscreen/mech/document_hat12
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/pilots/cutscenes.dmi'
	icon_state = "hat12"
	allstate = 1
	plane = HUD_PLANE
	layer = UNDER_HUD_LAYER

/obj/screen/fullscreen/mech/document_vladimir
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/pilots/cutscenes.dmi'
	icon_state = "vladimir"
	allstate = 1
	plane = HUD_PLANE
	layer = UNDER_HUD_LAYER

/obj/screen/fullscreen/mech/document_stella
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/pilots/cutscenes.dmi'
	icon_state = "stella"
	allstate = 1
	plane = HUD_PLANE
	layer = UNDER_HUD_LAYER

/obj/screen/fullscreen/mech/document_coil
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/pilots/cutscenes.dmi'
	icon_state = "coil"
	allstate = 1
	plane = HUD_PLANE
	layer = UNDER_HUD_LAYER

/obj/screen/fullscreen/mech/document_emmy
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/pilots/cutscenes.dmi'
	icon_state = "emmy"
	allstate = 1
	plane = HUD_PLANE
	layer = UNDER_HUD_LAYER

/obj/screen/fullscreen/mech/document_john
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/pilots/cutscenes.dmi'
	icon_state = "john"
	allstate = 1
	plane = HUD_PLANE
	layer = UNDER_HUD_LAYER

/obj/screen/fullscreen/mech/document_amaryllis
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/pilots/cutscenes.dmi'
	icon_state = "amaryllis"
	allstate = 1
	plane = HUD_PLANE
	layer = UNDER_HUD_LAYER

/obj/screen/fullscreen/mech/document_valery
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/pilots/cutscenes.dmi'
	icon_state = "valery"
	allstate = 1
	plane = HUD_PLANE
	layer = UNDER_HUD_LAYER

/obj/screen/fullscreen/mech/document_valery/Initialize()
	. = ..()
	spawn(2 SECONDS)
		var/pixel_switch_x = pixel_x - 100
		var/pixel_switch_y = pixel_y + 150
		animate(src, pixel_x = pixel_switch_x, time = 2 SECONDS, easing = LINEAR_EASING | EASE_IN)
		animate(src, transform = matrix(0.7, MATRIX_SCALE), time = 1 SECOND, easing = SINE_EASING)
		animate(src, pixel_y = pixel_switch_y, time = 1 SECONDS, easing = SINE_EASING | EASE_IN)

/obj/screen/fullscreen/mech/document_krass
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/pilots/cutscenes.dmi'
	icon_state = "krass"
	allstate = 1
	plane = HUD_PLANE
	layer = UNDER_HUD_LAYER

/obj/screen/fullscreen/mech/document_bernard
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/pilots/cutscenes.dmi'
	icon_state = "bernard"
	allstate = 1
	plane = HUD_PLANE
	layer = UNDER_HUD_LAYER

/obj/screen/fullscreen/mech/document_kazi
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/pilots/cutscenes.dmi'
	icon_state = "kazi"
	allstate = 1
	plane = HUD_PLANE
	layer = UNDER_HUD_LAYER

//////////////////////////////////////////////////////////////////////////////////////////////////////

/proc/mech_roster()
	for(var/mob/all in GLOB.player_list)
		all.overlay_fullscreen("alexandra", /obj/screen/fullscreen/mech/document_alexandra)
		all.overlay_fullscreen("ootsuki", /obj/screen/fullscreen/mech/document_ootsuki)
		all.overlay_fullscreen("emilio", /obj/screen/fullscreen/mech/document_emilio)
		all.overlay_fullscreen("hat12", /obj/screen/fullscreen/mech/document_hat12)
		all.overlay_fullscreen("vladimir", /obj/screen/fullscreen/mech/document_vladimir)
		all.overlay_fullscreen("stella", /obj/screen/fullscreen/mech/document_stella)
		all.overlay_fullscreen("coil", /obj/screen/fullscreen/mech/document_coil)
		all.overlay_fullscreen("emmy", /obj/screen/fullscreen/mech/document_emmy)
		all.overlay_fullscreen("john", /obj/screen/fullscreen/mech/document_john)
		all.overlay_fullscreen("amaryllis", /obj/screen/fullscreen/mech/document_amaryllis)
		all.overlay_fullscreen("valery", /obj/screen/fullscreen/mech/document_valery)
		all.overlay_fullscreen("krass", /obj/screen/fullscreen/mech/document_krass)
		all.overlay_fullscreen("bernard", /obj/screen/fullscreen/mech/document_bernard)
		all.overlay_fullscreen("kazi", /obj/screen/fullscreen/mech/document_kazi)
		all.Stun(99999)

////// МЕХИ СИМУЛЯКРЫ //////

/mob/living/simple_animal/hostile/fd/mech/napoleon/holo
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/mechs/heavy_def.dmi'
	icon_state = ""
	icon_living = ""

	wreck_type = null

	integrity = 250
	integrity_max = 250
	repairs_left = 0

	heat_overflow = 5

/mob/living/simple_animal/hostile/fd/mech/napoleon/holo/mech_shoot(atom/target, bullet_type, cooldown, amount, interval, damage_bonus, bullet_icon, sound)
	. = ..(damage_bonus = -2)


/mob/living/simple_animal/hostile/fd/mech/drake/holo
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/mechs/heavy_def.dmi'
	icon_state = ""
	icon_living = ""

	wreck_type = null

	integrity = 500
	integrity_max = 500
	repairs_left = 0

	heat_overflow = 5

/mob/living/simple_animal/hostile/fd/mech/drake/holo/mech_shoot(atom/target, bullet_type, cooldown, amount, interval, damage_bonus, bullet_icon, sound)
	. = ..(damage_bonus = -2)


/mob/living/simple_animal/hostile/fd/mech/lancaster/holo
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/mechs/heavy_def.dmi'
	icon_state = ""
	icon_living = ""

	wreck_type = null

	integrity = 250
	integrity_max = 250
	repairs_left = 0

	heat_overflow = 3

/mob/living/simple_animal/hostile/fd/mech/lancaster/holo/mech_shoot(atom/target, bullet_type, cooldown, amount, interval, damage_bonus, bullet_icon, sound)
	. = ..(damage_bonus = -2)


/mob/living/simple_animal/hostile/fd/mech/saladin/holo
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/mechs/heavy_def.dmi'
	icon_state = ""
	icon_living = ""

	wreck_type = null

	integrity = 150
	integrity_max = 150
	repairs_left = 0

	heat_overflow = 20

/mob/living/simple_animal/hostile/fd/mech/saladin/holo/mech_shoot(atom/target, bullet_type, cooldown, amount, interval, damage_bonus, bullet_icon, sound)
	. = ..(damage_bonus = -2)


/mob/living/simple_animal/hostile/fd/mech/goblintail/holo
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/mechs/heavy_def.dmi'
	icon_state = ""
	icon_living = ""

	wreck_type = null

	integrity = 150
	integrity_max = 150
	repairs_left = 0

	heat_overflow = 5

/mob/living/simple_animal/hostile/fd/mech/goblintail/holo/mech_shoot(atom/target, bullet_type, cooldown, amount, interval, damage_bonus, bullet_icon, sound)
	. = ..(damage_bonus = -2)

/// Без нельсона куз он очень опасный даже с дебаффами, а ещё мне лень снижать урон милишки :P
