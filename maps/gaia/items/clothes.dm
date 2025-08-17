// Armor Tags
/obj/item/clothing/accessory/armor_tag/solgov/army
	name = "\improper Army crest"
	desc = "An emblem depicting the crest of the SCG Army."
	icon_override = 'maps/gaia/icons/obj_accessories.dmi'
	icon = 'maps/gaia/icons/obj_accessories.dmi'
	accessory_icons = list(slot_w_uniform_str = 'maps/gaia/icons/onmob_accessories.dmi', slot_wear_suit_str = 'maps/gaia/icons/onmob_accessories.dmi')
	icon_state = "armyflag"

/obj/item/clothing/accessory/armor_tag/iccg
	name = "\improper ICCG Flag"
	desc = "An emblem depicting the Independent Colonial Confederation of Gilgamesh flag."
	icon_override = 'maps/gaia/icons/obj_accessories.dmi'
	icon = 'maps/gaia/icons/obj_accessories.dmi'
	accessory_icons = list(slot_w_uniform_str = 'maps/gaia/icons/onmob_accessories.dmi', slot_wear_suit_str = 'maps/gaia/icons/onmob_accessories.dmi')
	icon_state = "iccgflag"
	slot = ACCESSORY_SLOT_ARMOR_M

// Armor
/obj/item/clothing/suit/armor/pcarrier/green/scg
	accessories = list(/obj/item/clothing/accessory/armor_plate/merc, /obj/item/clothing/accessory/storage/pouches/large/green, /obj/item/clothing/accessory/armor_tag/solgov)

/obj/item/clothing/suit/armor/pcarrier/green/iccg
	accessories = list(/obj/item/clothing/accessory/armor_plate/merc, /obj/item/clothing/accessory/storage/pouches/large/green, /obj/item/clothing/accessory/armor_tag/iccg)

/obj/item/clothing/head/helmet/green
	accessories = list(/obj/item/clothing/accessory/helmet_cover/green, /obj)
