/obj/effect/mech_particle
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/mechs/mech_ui.dmi'
	layer = ABOVE_HUMAN_LAYER
	mouse_opacity = FALSE
	alpha = 0

/obj/effect/mech_particle/Initialize()
	. = ..()
	animation()

/obj/effect/mech_particle/proc/animation()
	pixel_x = rand(-80, 80)
	pixel_y = rand(1, 50)
	var/pixel_y_adjust = pixel_y + 100

	animate(src, 0.5 SECOND, alpha = 255, flags = ANIMATION_PARALLEL)
	animate(src, pixel_y = pixel_y_adjust, alpha = 0, time = 2 SECONDS, easing = SINE_EASING | EASE_IN, flags = ANIMATION_PARALLEL)

	QDEL_IN(src, 2 SECONDS)

/obj/effect/mech_particle/chained
	icon_state = "chained"

/obj/effect/mech_particle/overheated
	icon_state = "overheated"

/obj/effect/mech_particle/malfunctioned
	icon_state = "malfunctioned"

/obj/effect/mech_particle/hacked
	icon_state = "hacked"

/obj/effect/mech_particle/vulnerable
	icon_state = "vulnerable"

/obj/effect/mech_particle/vulnerable/animation()
	pixel_x = rand(-80, 80)
	pixel_y = rand(50, 150)
	var/pixel_y_adjust = pixel_y - 100

	animate(src, 0.5 SECOND, alpha = 255, flags = ANIMATION_PARALLEL)
	animate(src, pixel_y = pixel_y_adjust, alpha = 0, time = 2 SECONDS, easing = SINE_EASING | EASE_OUT, flags = ANIMATION_PARALLEL)

	QDEL_IN(src, 2 SECONDS)

	. = ..()

/obj/effect/mech_particle/accelerating
	icon_state = "accelerating"
