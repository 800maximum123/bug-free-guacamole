/obj/item/clothing/accessory/gaiacop
	desc = "Do not believe the lies, someone fucked up and gave you this instead of the real badge."
	icon = 'maps/gaia/icons/gaian_cops.dmi'
	accessory_icons = list(slot_w_uniform_str = 'maps/gaia/icons/gaian_cops_mob.dmi', slot_wear_suit_str = 'maps/gaia/icons/gaian_cops_mob.dmi')
	icon_state = "copbadge"
	w_class = ITEM_SIZE_TINY

/obj/item/clothing/accessory/gaiacop/townribbon
	name = "urban police ribbon"
	desc = "A white-on-red ribbon, issued by Napoleon Region Police Force to denote wearer's assignment to the town of Urbamanca and surrounding areas."
	icon_state = "townribbon"
	slot = ACCESSORY_SLOT_INSIGNIA
	on_rolled_down = ACCESSORY_ROLLED_NONE

/obj/item/clothing/accessory/badge/holo/gaiacop
	name = "gaian police officer badge"
	desc = "A shiny gold-plated badge of the Napoleon Region Police Force. Denotes the wearer as Patrol Officer."
	icon = 'maps/gaia/icons/gaian_cops.dmi'
	accessory_icons = list(slot_w_uniform_str = 'maps/gaia/icons/gaian_cops_mob.dmi', slot_wear_suit_str = 'maps/gaia/icons/gaian_cops_mob.dmi')
	color = null
	icon_state = "copbadge"
	badge_string = "Napoleon Region Police Force"
	badge_access = access_maint_tunnels

/obj/item/clothing/accessory/badge/holo/gaiacop/sergeant
	name = "gaian police sergeant badge"
	desc = "A shiny gold-plated badge of the Napoleon Region Police Force. Denotes the wearer as Patrol Sergeant."

/obj/item/clothing/under/gaiacop
	name = "gaian police uniform"
	desc = "A french grey policeman's uniform of Napoleon Region Police Force. Comes with a sharp collar, sturdy pants and an awesome synthleather belt."
	icon = 'maps/gaia/icons/gaian_cops.dmi'
	item_icons = list(
		slot_l_hand_str = "under_utility_held_l",
		slot_r_hand_str = "under_utility_held_r",
		slot_w_uniform_str = 'maps/gaia/icons/gaian_cops_mob.dmi'
	)
	sprite_sheets = list()
	body_parts_covered = FULL_TORSO | ARMS | FULL_LEGS
	siemens_coefficient = 0.9
	armor = list(
		melee = ARMOR_MELEE_MINOR,
		energy = ARMOR_ENERGY_MINOR
	)
	icon_state = "gaiacop"
	worn_state = "gaiacop"
	gender_icons = 1

/obj/item/clothing/under/gaiacop/officer
	accessories = list(/obj/item/clothing/accessory/badge/holo/gaiacop,/obj/item/clothing/accessory/gaiacop/townribbon, /obj/item/clothing/accessory/blue_clip)
	item_flags = ITEM_FLAG_WASHER_ALLOWED | ITEM_FLAG_INVALID_FOR_CHAMELEON

/obj/item/clothing/under/gaiacop/sergeant
	accessories = list(/obj/item/clothing/accessory/badge/holo/gaiacop/sergeant,/obj/item/clothing/accessory/gaiacop/townribbon, /obj/item/clothing/accessory/blue_clip)
	item_flags = ITEM_FLAG_WASHER_ALLOWED | ITEM_FLAG_INVALID_FOR_CHAMELEON

/obj/item/clothing/head/gaiacop
	name = "gaian police hat"
	desc = "A light grey wide-brimmed hat with a Napoleon Region Police Force pin and a blue ribbon. Displays your authority and saves you from heat stroke."
	icon = 'maps/gaia/icons/gaian_cops.dmi'
	item_icons = list(slot_head_str = 'maps/gaia/icons/gaian_cops_mob.dmi')
	icon_state = "cophat"
	siemens_coefficient = 0.9
	item_state_slots = list(
		slot_l_hand_str = "helmet",
		slot_r_hand_str = "helmet")
	body_parts_covered = 0
