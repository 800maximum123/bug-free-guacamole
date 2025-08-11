/turf/unsimulated/floor/moving
	name = "moving floor"
	desc = "Not the smartest idea to jump out."
	icon = 'gaia/icons/turf.dmi'

/turf/unsimulated/floor/moving/Entered(mob/living/L)
	. = ..()

	if(istype(L))
		to_chat(L, SPAN_DANGER("OH FUCK!"))
		L.forceMove(get_step(src, EAST))
		L.SetParalysis(1)
		if(prob(50))
			L.adjustBruteLoss(15)
			playsound(L, 'sounds/weapons/genhit1.ogg', 40, TRUE)
			L.visible_message(SPAN_WARNING("[L] hits hard against [src]!"))

/turf/unsimulated/floor/moving/concrete
	name = "moving concrete"
	icon_state = "concrete"

/turf/unsimulated/floor/moving/road
	name = "moving road"
	icon_state = "hexacrete_dark"

/turf/unsimulated/floor/moving/grass
	name = "moving grass"
	icon_state = "greygrass"
	color = "#799c4b"

/turf/unsimulated/floor/moving/barren
	name = "moving ground"
	icon_state = "asteroid"
