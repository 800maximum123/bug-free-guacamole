/obj/structure/vines
	name = "vines"
	icon = 'mods/_fd/fd_assets/icons/obj/flora/spacevines.dmi'
	icon_state = "light_1"
	layer = ABOVE_WINDOW_LAYER
	opacity = 0
	density = FALSE

/obj/structure/vines/Initialize()
	.=..()
	set_extension(src, /datum/extension/turf_hand)

/obj/structure/vines/bullet_act(obj/item/projectile/P, def_zone)
	if(!P.nodamage)
		visible_message(SPAN_WARNING("[P] tears [src] down!"))
		qdel(src)
	else
		..(P, def_zone)

/obj/structure/vines/attack_hand(mob/user)
	playsound(get_turf(loc), "rustle", 15, 1, -5)
	qdel(src)
	..()

/obj/structure/vines/light2
	icon_state = "light_2"

/obj/structure/vines/light3
	icon_state = "light_3"

/obj/structure/vines/heavy1
	icon_state = "heavy_1"
	opacity = 1

/obj/structure/vines/heavy2
	icon_state = "heavy_2"
	opacity = 1

/obj/structure/vines/heavy3
	icon_state = "heavy_3"
	opacity = 1

/obj/structure/vines/heavy4
	icon_state = "heavy_4"
	opacity = 1

/obj/structure/vines/heavy5
	icon_state = "heavy_5"
	opacity = 1

/obj/structure/vines/heavy6
	icon_state = "heavy_6"
	opacity = 1
