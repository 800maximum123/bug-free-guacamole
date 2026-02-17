/obj/structure/vines
	name = "vines"
	icon = 'mods/_fd/fd_assets/icons/obj/flora/spacevines.dmi'
	icon_state = "light_1"
	anchored = TRUE
	layer = ABOVE_HUMAN_LAYER
	opacity = 0
	density = FALSE
	health_max = 25

/obj/structure/vines/Initialize()
	.=..()
	set_extension(src, /datum/extension/turf_hand)

/obj/structure/vines/bullet_act(obj/item/projectile/P, def_zone)
	if(!P.nodamage)
		visible_message(SPAN_WARNING("[P] tears [src] down!"))
		qdel(src)
	else
		..(P, def_zone)

/obj/structure/vines/on_death()
	qdel(src)

/obj/structure/vines/Destroy()
	. = ..()
	visible_message(SPAN_WARNING("[src] chops down!"))

/obj/structure/vines/light2
	icon_state = "light_2"

/obj/structure/vines/light3
	icon_state = "light_3"

/obj/structure/vines/heavy1
	icon_state = "heavy_1"
	health_max = 50
	opacity = 1

/obj/structure/vines/heavy2
	icon_state = "heavy_2"
	health_max = 50
	opacity = 1

/obj/structure/vines/heavy3
	icon_state = "heavy_3"
	health_max = 50
	opacity = 1

/obj/structure/vines/heavy4
	icon_state = "heavy_4"
	health_max = 50
	opacity = 1

/obj/structure/vines/heavy5
	icon_state = "heavy_5"
	health_max = 50
	opacity = 1

/obj/structure/vines/heavy6
	icon_state = "heavy_6"
	health_max = 50
	opacity = 1
