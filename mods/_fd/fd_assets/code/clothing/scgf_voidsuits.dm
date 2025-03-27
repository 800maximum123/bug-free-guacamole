// Standard Issue SCGF Voidsuit & Helmet

/obj/item/clothing/suit/space/void/pilot/scgf
	icon = 'maps/torch/icons/obj/obj_suit_solgov.dmi'
	item_icons = list(slot_wear_suit_str = 'maps/torch/icons/mob/onmob_suit_solgov.dmi')

/obj/item/clothing/head/helmet/space/void/pilot/scgf
	light_overlay = "helmet_light_alt"
	icon = 'maps/torch/icons/obj/obj_head_solgov.dmi'
	item_icons = list(slot_head_str = 'maps/torch/icons/mob/onmob_head_solgov.dmi')

// Command SCGF Voidsuit & Helmet

/obj/item/clothing/suit/space/void/pilot/scgf/command
	icon = 'maps/torch/icons/obj/obj_suit_solgov.dmi'
	item_icons = list(slot_wear_suit_str = 'maps/torch/icons/mob/onmob_suit_solgov.dmi')

/obj/item/clothing/head/helmet/space/void/pilot/scgf/command
	light_overlay = "helmet_light_alt"
	icon = 'maps/torch/icons/obj/obj_head_solgov.dmi'
	item_icons = list(slot_head_str = 'maps/torch/icons/mob/onmob_head_solgov.dmi')

// Storage

/obj/machinery/suit_storage_unit/pilot/scgf
	suit = /obj/item/clothing/suit/space/void/pilot/scgf
	helmet = /obj/item/clothing/head/helmet/space/void/pilot/scgf

/obj/machinery/suit_storage_unit/pilot/command
	suit = /obj/item/clothing/suit/space/void/pilot/scgf/command
	helmet = /obj/item/clothing/head/helmet/space/void/pilot/scgf/command

// Prepared

/obj/item/clothing/suit/space/void/pilot/scgf/prepared
	helmet = /obj/item/clothing/head/helmet/space/void/pilot/scgf
	item_flags = ITEM_FLAG_THICKMATERIAL | ITEM_FLAG_INVALID_FOR_CHAMELEON

	/obj/item/clothing/suit/space/void/pilot/scgf/command/prepared
	helmet = /obj/item/clothing/head/helmet/space/void/pilot/scgf/command
	item_flags = ITEM_FLAG_THICKMATERIAL | ITEM_FLAG_INVALID_FOR_CHAMELEON
