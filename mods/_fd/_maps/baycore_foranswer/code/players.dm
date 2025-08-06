/mob/living/simple_animal/hostile/fd/mech/goblintail/beer
	name = "L-APU Beer&Sake"
	desc = "This one belongs to Takeda."
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/mechs/scout_beer.dmi'
	icon_state = "beer"
	icon_living = "beer"

	pixel_x = -108
	default_pixel_x = -108
	pixel_y = -70
	default_pixel_y = -70

	wreck_type = /obj/structure/fd/mech_wreckage/small/saladin/beer

/obj/structure/fd/mech_wreckage/small/saladin/beer
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/mechs/scout_beer.dmi'
	icon_state = "beer_death_1"
	density = FALSE

	layer = DECAL_LAYER

	pixel_y = 0
	pixel_x = 0
	bound_width = 96
	bound_height = 96

/obj/structure/fd/mech_wreckage/small/saladin/beer/Initialize()
	. = ..()
	var/state = rand(1,2)
	icon_state = "beer_death_[state]"

/mob/living/carbon/human/pilot/takeda
	name = "Ootsuki Takeda"
	desc = "Сложенный мужчина за 40 с азиатским типом лица, почему-то везде тоскает свою катану."
	see_in_dark = 8
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/pilots/pilots_list.dmi'
	icon_state = "ootsuki"

/obj/sprite_helper/pilot/takeda
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/pilots/pilots_list.dmi'
	icon_state = "ootsuki"

/mob/living/carbon/human/pilot/takeda/fix_icons()
	icon = null
	icon_state = null
	stand_icon = null
	lying_icon = null
	update_icon = FALSE
	if (!vis_contents.len)
		vis_contents += new /obj/sprite_helper/pilot/takeda
	var/obj/sprite_helper/pilot/takeda/SH = vis_contents[vis_contents.len]
	if (lying || resting)
		SH.icon = turn(icon('mods/_fd/_maps/baycore_foranswer/icons/pilots/pilots_list.dmi'), 90)
	else
		SH.icon = 'mods/_fd/_maps/baycore_foranswer/icons/pilots/pilots_list.dmi'
	SH.dir = dir

/mob/living/simple_animal/hostile/fd/mech/drake/redguard
	name = "H-APU Redguard"
	desc = "This one belongs to 'Hands-Up'."
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/mechs/heavy_redguard.dmi'
	icon_state = "redguard"
	icon_living = "redguard"

	pixel_x = -110
	default_pixel_x = -110
	pixel_y = -30
	default_pixel_y = -30
	wreck_type = /obj/structure/fd/mech_wreckage/big/redguard

/obj/structure/fd/mech_wreckage/big/redguard
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/mechs/heavy_redguard.dmi'
	icon_state = "redguard_death_1"

	pixel_y = 0
	pixel_x = 0
	bound_width = 256
	bound_height = 64

/obj/structure/fd/mech_wreckage/big/redguard/Initialize()
	. = ..()
	var/state = rand(1,7)
	icon_state = "redguard_death_[state]"

/mob/living/carbon/human/pilot/alexandra
	name = "Alexandra 'Hands-Up' Zhukova"
	desc = "Рыжая женщина лет 27-и, острый характер. Почему 'Руки Вверх'? Хмм... *Раскручивает стволы пулемёта* РУКИ ВВЕРХ!"
	see_in_dark = 8
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/pilots/pilots_list.dmi'
	icon_state = "alexandra"

/obj/sprite_helper/pilot/alexandra
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/pilots/pilots_list.dmi'
	icon_state = "alexandra"

/mob/living/carbon/human/pilot/alexandra/fix_icons()
	icon = null
	icon_state = null
	stand_icon = null
	lying_icon = null
	update_icon = FALSE
	if (!vis_contents.len)
		vis_contents += new /obj/sprite_helper/pilot/alexandra
	var/obj/sprite_helper/pilot/alexandra/SH = vis_contents[vis_contents.len]
	if (lying || resting)
		SH.icon = turn(icon('mods/_fd/_maps/baycore_foranswer/icons/pilots/pilots_list.dmi'), 90)
	else
		SH.icon = 'mods/_fd/_maps/baycore_foranswer/icons/pilots/pilots_list.dmi'
	SH.dir = dir
