#ifndef MODPACK_TAJARA
// Сюда вынес оверрайды Модпака Таяр, для быстрого поиска в случае чего.

/obj/item/clothing/under/taj_old_uniform
	desc = "A worn-out tajar uniform, reminiscent of the old days. The fabric is frayed in places, but still wearable."
	name = "old tajaran uniform"
	icon = 'mods/_fd/tajaran_stuff/icons/clothes/under.dmi'
	item_icons = list(slot_w_uniform_str = 'mods/_fd/tajaran_stuff/icons/onmob/onmob_under.dmi')
	gender_icons = TRUE

/obj/item/clothing/under/taj_new_fatigues
	desc = "Lightweight combat uniform adapted for hot climates. It has tajara emblems on it. There is a cutout on the back for something."
	name = "tajaran fatigues"
	icon = 'mods/_fd/tajaran_stuff/icons/clothes/under.dmi'
	item_icons = list(slot_w_uniform_str = 'mods/_fd/tajaran_stuff/icons/onmob/onmob_under.dmi')
	gender_icons = TRUE

/obj/item/clothing/suit/storage/taj_overcoat
	name = "vintage tajaran overcoat"
	desc = "A lengthy coat made of wooly, but sturdy and hydrophobic material. Designed mostly to protect against strong wind and other harsh weather conditions on Ahdomai, when having fur is not enough. There is a weird U-shape hole on the back of the coat for tail!"
	icon = 'mods/_fd/tajaran_stuff/icons/clothes/suit.dmi'
	item_icons = list(slot_wear_suit_str = 'mods/_fd/tajaran_stuff/icons/onmob/onmob_suit.dmi')
	species_restricted = null // Na-h. We don't need that.

/obj/item/clothing/accessory/shouldercape
	name = "shoulder cape"
	desc = "A simple shoulder cape."
	icon = 'mods/_fd/tajaran_stuff/icons/objects/obj_accessories.dmi'
	accessory_icons = list(slot_w_uniform_str = 'mods/_fd/tajaran_stuff/icons/onmob/onmob_accessories.dmi', slot_wear_suit_str = 'mods/_fd/tajaran_stuff/icons/onmob/onmob_accessories.dmi')
	slot = ACCESSORY_SLOT_INSIGNIA

#endif
