/obj/item/clothing/accessory/tajaran
	name = "assashite leafy raincoat"
	desc = "A raincoat, woven from durable leaves, which protects from heavy rains on the Pirx."
	icon_state = "sheet_cape"
	item_state = "sheet_cape"
	icon = 'mods/_fd/tajaran_stuff/icons/clothes/suit.dmi'
	accessory_icons = list(slot_w_uniform_str = 'mods/_fd/tajaran_stuff/icons/onmob/onmob_suit.dmi', slot_wear_suit_str = 'mods/_fd/tajaran_stuff/icons/onmob/onmob_suit.dmi')
	item_icons = list(slot_belt_str = 'mods/_fd/tajaran_stuff/icons/onmob/onmob_suit.dmi')
	slot = ACCESSORY_SLOT_INSIGNIA // Adding again in case we want to change it in the future.
	slot_flags = SLOT_TIE | SLOT_BELT
	item_flags = ITEM_FLAG_IS_BELT

/obj/item/clothing/accessory/tajaran/tradition
	name = "assashite traditional cloak"
	desc = "A beautiful tribal cloak made of leather and pieces of cloth. The assashite use it for rituals and daily wear."
	icon_state = "trad_cape"
	item_state = "trad_cape"
	item_icons = list(slot_wear_suit_str = 'mods/_fd/tajaran_stuff/icons/onmob/onmob_suit.dmi')
	slot_flags = SLOT_TIE | SLOT_OCLOTHING

/obj/item/clothing/accessory/tajaran/maika
	name = "assashite traditional maika"
	desc = "National assassin clothing - maika."
	icon = 'mods/_fd/tajaran_stuff/icons/clothing.dmi'
	icon_state = "maika_f"
	item_state = "maika"
	accessory_icons = list(slot_w_uniform_str = 'mods/_fd/tajaran_stuff/icons/clothing.dmi')
	item_icons = list(slot_wear_uniform_str = 'mods/_fd/tajaran_stuff/icons/clothing.dmi')
	slot_flags = SLOT_TIE | SLOT_ICLOTHING