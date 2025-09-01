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

/obj/effect/mech_particle/pierced
	icon_state = "pierced"

/obj/effect/mech_particle/pierced/animation()
	pixel_x = rand(-80, 80)
	pixel_y = rand(1, 200)
	var/pixel_x_1 = pixel_x + 10
	var/pixel_x_2 = pixel_x - 20
	var/pixel_x_3 = pixel_x + 10

	animate(src, 0.2 SECOND, alpha = 255, flags = ANIMATION_PARALLEL)
	animate(src, pixel_x = pixel_x_1, time = 0.2 SECONDS, easing = SINE_EASING | EASE_IN, flags = ANIMATION_PARALLEL)
	animate(src, pixel_x = pixel_x_2, time = 0.3 SECONDS, easing = SINE_EASING | EASE_IN)
	animate(src, pixel_x = pixel_x_3, time = 0.3 SECONDS, easing = SINE_EASING | EASE_IN)
	animate(src, 0.4 SECOND, alpha = 0)

	QDEL_IN(src, 2 SECONDS)
