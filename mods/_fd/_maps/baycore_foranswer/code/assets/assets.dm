/obj/structure/fd/baycore/resupply
	name = "станция ремонта"
	desc = "То место, где можно пополнить припасы и залатать свою верную кабылу между битвами."
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/assets.dmi'
	icon_state = "building2"
	density = FALSE
	anchored = TRUE
	opacity = FALSE

	var/uses = 20

/obj/structure/fd/baycore/resupply/Initialize()
	. = ..()
	SetTransform(3)

/obj/structure/fd/baycore/resupply/attack_animal(mob/user)
	if(get_dist(src, user) > 2)
		return
	if(!istype(user, /mob/living/simple_animal/hostile/fd/mech))
		return
	if(!uses)
		to_chat(user, SPAN_WARNING("У станции ремонта больше не осталось использований!"))
	var/mob/living/simple_animal/hostile/fd/mech/mech_user = user
	playsound(get_turf(src), 'sound/effects/lift_heavy_start.ogg', 100)
	if(!do_after(user, 4 SECONDS, src, DO_PUBLIC_UNIQUE))
		return
	uses--
	mech_user.resupply()
	mech_user.visible_message(SPAN_INFO("[mech_user] пополняет припасы из станции ремонта."))

/obj/structure/fd/baycore/fake_overmap
	name = "overmap"
	desc = "overmap."
	icon = 'mods/_fd/fd_assets/icons/overmap_eris.dmi'
	icon_state = "field"
	density = FALSE
	anchored = TRUE
	opacity = FALSE

	mouse_opacity = FALSE // Нельзя прокликать

/obj/structure/fd/baycore/space_city
	name = "spacecity"
	desc = "spacecity."
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/assets.dmi'
	icon_state = "spacecity"
	density = FALSE
	anchored = TRUE
	opacity = FALSE

	mouse_opacity = FALSE

/obj/structure/fd/baycore/odp
	name = "odp"
	desc = "odp."
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/assets.dmi'
	icon_state = "odp"
	density = FALSE
	anchored = TRUE
	opacity = FALSE

	mouse_opacity = FALSE

/obj/structure/fd/baycore/planet
	name = "planet"
	desc = "planet."
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/assets.dmi'
	icon_state = "planet"
	density = FALSE
	anchored = TRUE
	opacity = FALSE

	mouse_opacity = FALSE

/obj/structure/fd/baycore/jumppad
	name = "jumppad"
	desc = "jumppad."
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/assets.dmi'
	icon_state = "jumppad"
	density = FALSE
	anchored = TRUE
	opacity = FALSE

	mouse_opacity = FALSE

/obj/structure/fd/baycore/building
	name = "building"
	desc = "building."
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/assets.dmi'
	icon_state = "building"
	density = FALSE
	anchored = TRUE
	opacity = FALSE

	mouse_opacity = FALSE

/obj/structure/fd/baycore/building2
	name = "building2"
	desc = "building 2."
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/assets.dmi'
	icon_state = "building2"
	density = FALSE
	anchored = TRUE
	opacity = FALSE

	mouse_opacity = FALSE

/obj/structure/fd/baycore/building3
	name = "building3"
	desc = "building 3."
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/assets.dmi'
	icon_state = "building3"
	density = FALSE
	anchored = TRUE
	opacity = FALSE

	mouse_opacity = FALSE

/obj/structure/fd/baycore/building4
	name = "building4"
	desc = "building 4."
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/assets.dmi'
	icon_state = "building4"
	density = FALSE
	anchored = TRUE
	opacity = FALSE

	mouse_opacity = FALSE
