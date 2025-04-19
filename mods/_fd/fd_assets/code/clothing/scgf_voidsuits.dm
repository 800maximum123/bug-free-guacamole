// Standard Issue SCGF Voidsuit & Helmet

/obj/item/clothing/suit/space/void/pilot/scgf
	icon = 'mods/_fd/fd_assets/icons/obj/fleet_voidsuit_item.dmi'
	icon_state = "fleet_standard_voidsuit"
	item_icons = list(slot_wear_suit_str = 'mods/_fd/fd_assets/icons/onmob/fleet_standard_voidsuit.dmi')
	name = "Standard-issue SCGF voidsuit"

/obj/item/clothing/head/helmet/space/void/pilot/scgf
	light_overlay = "helmet_light_alt"
	icon = 'mods/_fd/fd_assets/icons/obj/fleet_helmet_item.dmi'
	icon_override = 'mods/_fd/fd_assets/icons/onmob/fleet_standard_voidsuit_helmet.dmi'
	icon_state = "fleet_standard_voidsuit_helmet"
	item_state = "fleet_standard_voidsuit_helmet"
	item_icons = list(slot_head_str = 'mods/_fd/fd_assets/icons/onmob/fleet_standard_voidsuit_helmet.dmi')
	name = "Standard-issue SCGF helmet"

// Storage

/obj/machinery/suit_storage_unit/pilot/scgf
	suit = /obj/item/clothing/suit/space/void/pilot/scgf
	helmet = /obj/item/clothing/head/helmet/space/void/pilot/scgf

// Prepared

/obj/item/clothing/suit/space/void/pilot/scgf/prepared
	helmet = /obj/item/clothing/head/helmet/space/void/pilot/scgf
	item_flags = ITEM_FLAG_THICKMATERIAL | ITEM_FLAG_INVALID_FOR_CHAMELEON
	tank = /obj/item/tank/oxygen

/obj/item/clothing/suit/space/void/pilot/scgf/prepared/no_helm
	helmet = null
