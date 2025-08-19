/obj/effect/mech
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/mechs/mech_ui.dmi'
	layer = ABOVE_HUMAN_LAYER
	mouse_opacity = FALSE
	alpha = 0

/obj/effect/mech/Initialize()
	. = ..()
	pixel_x = rand(-80, 80)
	pixel_y = rand(1, 50)
	var/pixel_y_adjust = pixel_y + 100
	animate(src, 0.5 SECOND, alpha = 255)

	animate(src, pixel_y = pixel_y_adjust, time = 2 SECONDS, easing = LINEAR_EASING | EASE_IN, flags = ANIMATION_PARALLEL)
	animate(src, 3 SECOND, alpha = 0, flags = ANIMATION_PARALLEL)

	QDEL_IN(src, 5 SECONDS)

/obj/effect/mech/chained
	icon_state = "chained"

/obj/effect/mech/overheated
	icon_state = "overheated"

/obj/effect/mech/malfunctioned
	icon_state = "malfunctioned"

/obj/effect/mech/hacked
	icon_state = "hacked"

/obj/effect/mech/vulnerable
	icon_state = "vulnerable"

/obj/effect/mech/vulnerable/Initialize()
	pixel_x = rand(-80, 80)
	pixel_y = rand(50, 150)
	var/pixel_y_adjust = pixel_y - 100
	animate(src, 0.5 SECOND, alpha = 255)

	animate(src, pixel_y = pixel_y_adjust, time = 2 SECONDS, easing = LINEAR_EASING | EASE_IN, flags = ANIMATION_PARALLEL)
	animate(src, 3 SECOND, alpha = 0, flags = ANIMATION_PARALLEL)

	QDEL_IN(src, 5 SECONDS)

	. = ..()
