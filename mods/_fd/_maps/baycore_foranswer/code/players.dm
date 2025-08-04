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
