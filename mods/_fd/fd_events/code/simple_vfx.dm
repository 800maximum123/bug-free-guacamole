/obj/effect/simple_combat_particle
	icon = 'mods/_fd/fd_events/icons/simple_vfx_statuses.dmi'
	layer = ABOVE_HUMAN_LAYER
	mouse_opacity = FALSE
	alpha = 0

/obj/effect/simple_combat_particle/Initialize()
	. = ..()
	animation()

/obj/effect/simple_combat_particle/proc/animation()
	pixel_x = rand(-5, 5)
	pixel_y = rand(-10, 10)
	var/pixel_y_adjust = pixel_y + 10

	animate(src, 0.3 SECOND, alpha = 255, flags = ANIMATION_PARALLEL)
	animate(src, pixel_y = pixel_y_adjust, alpha = 0, time = 0.8 SECONDS, easing = SINE_EASING | EASE_IN, flags = ANIMATION_PARALLEL)

	QDEL_IN(src, 1 SECONDS)

/obj/effect/simple_combat_particle/healing
	icon_state = "healing"

/obj/effect/simple_combat_particle/healing/Initialize()
	SetTransform(0.5)
	. = ..()

/obj/effect/simple_combat_particle/downed
	icon_state = "crit"

/obj/effect/simple_combat_particle/downed/Initialize()
	SetTransform(0.5)
	. = ..()

/obj/effect/simple_combat_particle/zzaped
	icon_state = "zzaped"

/obj/effect/simple_combat_particle/zzaped/Initialize()
	SetTransform(0.5)
	. = ..()

/obj/effect/simple_combat_particle/zzaped/animation()
	pixel_x = rand(-10, 10)
	pixel_y = rand(-15, 15)
	var/pixel_y_adjust = pixel_y + 15

	animate(src, 0.3 SECOND, alpha = 255, flags = ANIMATION_PARALLEL)
	animate(src, pixel_y = pixel_y_adjust, alpha = 0, time = 0.8 SECONDS, easing = BOUNCE_EASING | EASE_OUT, flags = ANIMATION_PARALLEL)

	QDEL_IN(src, 1 SECONDS)

/obj/effect/simple_combat_particle/fracture
	icon_state = "fractured"

/obj/effect/simple_combat_particle/fracture/Initialize()
	SetTransform(0.5)
	. = ..()

/obj/effect/simple_combat_particle/bleeding
	icon_state = "bleed"

/obj/effect/simple_combat_particle/bleeding/Initialize()
	SetTransform(0.5)
	. = ..()

/obj/effect/simple_combat_particle/bleeding/animation()
	pixel_x = rand(-5, 5)

	var/pick_the_number = rand(10, 20)
	pixel_y = pick_the_number

	animate(src, 0.3 SECOND, alpha = 255, flags = ANIMATION_PARALLEL)
	animate(src, pixel_y = pixel_y - pick_the_number, alpha = 0, time = 0.8 SECONDS, easing = SINE_EASING | EASE_OUT, flags = ANIMATION_PARALLEL)

	QDEL_IN(src, 1 SECONDS)

/obj/effect/simple_combat_particle/overheated
	icon_state = "overheated"

/obj/effect/simple_combat_particle/overheated/Initialize()
	SetTransform(0.5)
	. = ..()

/obj/effect/simple_combat_particle/impact
	icon = 'mods/_fd/fd_events/icons/simple_vfx_impact.dmi'
	alpha = 255

/obj/effect/simple_combat_particle/impact/Initialize()
	var/random_number = rand(1,4)
	icon_state = "impact_[random_number]"
	SetTransform(0.8)
	. = ..()

/obj/effect/simple_combat_particle/impact/animation()
	pixel_x = rand(-24, -16)
	pixel_y = rand(-6, 6)

	QDEL_IN(src, 2 SECONDS)

/obj/effect/simple_combat_particle/shieldblock
	icon = 'mods/_fd/fd_events/icons/simple_vfx_impact.dmi'
	alpha = 255

/obj/effect/simple_combat_particle/shieldblock/Initialize()
	var/random_number = rand(1,4)
	icon_state = "shieldblock_[random_number]"
	SetTransform(0.8)
	. = ..()

/obj/effect/simple_combat_particle/shieldblock/animation()
	pixel_x = rand(-24, -16)
	pixel_y = rand(-6, 6)

	QDEL_IN(src, 2 SECONDS)

/obj/effect/simple_combat_particle/damage_number

	alpha = 255
	var/text_size = 16

/obj/effect/simple_combat_particle/damage_number/Initialize(new_loc, text, color, outline_color = COLOR_BLACK)
	maptext = STYLE_SMALLFONTS_OUTLINE(text, text_size, color, outline_color)
	. = ..()

/obj/effect/simple_combat_particle/damage_number/animation()
	var/new_pixel_x = rand(-80, 80)
	var/new_pixel_y = rand(-40, 40)
	transform = matrix().Update(0.01, 0.01)

	animate(src, time = 0.5 SECONDS, pixel_x = new_pixel_x, pixel_y = new_pixel_y, transform = matrix(), easing = SINE_EASING, flags = ANIMATION_PARALLEL)
	spawn(1 SECONDS)
		animate(src, time = 1.5 SECONDS, alpha = 0, pixel_y = new_pixel_y - 100, easing = SINE_EASING|EASE_IN, flags = ANIMATION_PARALLEL)

	QDEL_IN(src, 3 SECONDS)
