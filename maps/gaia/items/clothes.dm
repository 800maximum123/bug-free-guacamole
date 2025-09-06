// Accessories

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
	accessories = list(/obj/item/clothing/accessory/armor_plate/merc, /obj/item/clothing/accessory/storage/pouches/large/green, /obj/item/clothing/accessory/armor_tag/solgov, /obj/item/clothing/accessory/arm_guards/green, /obj/item/clothing/accessory/leg_guards/green)

/obj/item/clothing/suit/armor/pcarrier/green/scg/medium
	accessories = list(/obj/item/clothing/accessory/armor_plate/medium, /obj/item/clothing/accessory/storage/pouches/green, /obj/item/clothing/accessory/armor_tag/solgov, /obj/item/clothing/accessory/arm_guards/green, /obj/item/clothing/accessory/leg_guards/green)

/obj/item/clothing/suit/armor/pcarrier/iccg
	accessories = list(/obj/item/clothing/accessory/armor_plate/merc, /obj/item/clothing/accessory/storage/pouches/large, /obj/item/clothing/accessory/armor_tag/iccg, /obj/item/clothing/accessory/arm_guards, /obj/item/clothing/accessory/leg_guards)

/obj/item/clothing/suit/armor/pcarrier/iccg/medium
	accessories = list(/obj/item/clothing/accessory/armor_plate/medium, /obj/item/clothing/accessory/storage/pouches, /obj/item/clothing/accessory/armor_tag/iccg, /obj/item/clothing/accessory/arm_guards, /obj/item/clothing/accessory/leg_guards)

/obj/item/clothing/head/helmet/green
	accessories = list(/obj/item/clothing/accessory/helmet_cover/green)

/obj/item/clothing/head/helmet/green/scg
	desc = "Reinforced headgear. Protects the head from impacts. It says 'MADE IN SCG' on the inside."
	camera = /obj/machinery/camera/network/helmet_scg

/obj/item/clothing/head/helmet/iccg
	desc = "Reinforced headgear. Protects the head from impacts. It says 'Sdelano v Novya Zemlya' on the inside."
	camera = /obj/machinery/camera/network/helmet_iccg

/obj/item/clothing/head/helmet/riot/iccg
	desc = "It's a helmet specifically designed to protect against close range attacks. It says 'Sdelano v Novya Zemlya' on the inside."
	camera = /obj/machinery/camera/network/helmet_iccg

// Citizens
/obj/item/clothing/accessory/badge/holo/police
	name = "police holobadge"
	desc = "This glowing blue badge marks the holder as a member of police."
	badge_string = "Police"
	badge_access = access_maint_tunnels

/obj/item/clothing/suit/armor/pcarrier/medium/police
	accessories = list(/obj/item/clothing/accessory/armor_plate/medium, /obj/item/clothing/accessory/armor_tag/solgov/sec)

/obj/item/clothing/head/helmet/solgov/security/police
	name = "police helmet"

/obj/item/clothing/head/caphat/cap/police
	name = "police cap"
	desc = "Somehow it emits both safety and fear."

/obj/item/clothing/under/rank/security/alt/police
	accessories = list(/obj/item/clothing/accessory/badge/holo/police)
	name = "police officer's jumpsuit"
