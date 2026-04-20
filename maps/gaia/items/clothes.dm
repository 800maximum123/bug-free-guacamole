// ACCESSORIES
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

// Badges
/obj/item/clothing/accessory/badge/holo/police
	name = "police holobadge"
	desc = "This glowing blue badge marks the holder as a member of police."
	badge_string = "Police"
	badge_access = access_maint_tunnels

/obj/item/clothing/accessory/badge/holo/iccg
	name = "ICCG MP holobadge"
	desc = "This glowing blue badge marks the holder as a member of the 'Independent Colonial Confederation of Gilgamesh' Military Police."
	badge_string = "ICCG MP"
	badge_access = access_iccg_sec

// MISC CLOTHING
/obj/item/clothing/under/rank/atmospheric_technician/firefighter
	desc = "It's a jumpsuit worn by firefighters."
	name = "firefighter's jumpsuit"
	accessories = list(/obj/item/clothing/accessory/fire_overpants)

// MISC ARMOR
/obj/item/clothing/head/helmet/riot/iccg
	desc = "It's a helmet specifically designed to protect against close range attacks. It says 'Sdelano v Novya Zemlya' on the inside."
	camera = /obj/machinery/camera/network/helmet_iccg

/obj/item/clothing/suit/armor/pcarrier/medium/police
	accessories = list(/obj/item/clothing/accessory/armor_plate/medium, /obj/item/clothing/accessory/armor_tag/solgov/sec)

/obj/item/clothing/head/helmet/solgov/security/police
	name = "police helmet"
