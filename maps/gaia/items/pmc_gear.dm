/obj/item/clothing/under/sestris_pmc
	name = "midnight regiment polo uniform"
	desc = "A black set of a tactical polo shirt with sturdy utility pants, fit for semi-arid climate. A Sestris flag and a Brigade Legere patch are both sewn in on the shoulders."
	icon = 'maps/gaia/icons/items/clothing/pmc_gear.dmi'
	item_icons = list(
		slot_l_hand_str = "under_utility_held_l",
		slot_r_hand_str = "under_utility_held_r",
		slot_w_uniform_str = 'maps/gaia/icons/items/clothing/pmc_gear_mob.dmi'
	)
	sprite_sheets = list()
	body_parts_covered = FULL_TORSO | ARMS | FULL_LEGS
	siemens_coefficient = 0.9
	armor = list(
		melee = ARMOR_MELEE_MINOR,
		energy = ARMOR_ENERGY_MINOR
	)
	icon_state = "pmcpolo"
	worn_state = "pmcpolo"

/obj/item/clothing/accessory/armor_plate/pmc
	name = "anti-impact armor plate"
	desc = "A lightweight plasteel-reinforced synthetic armor plate with additional cushioning to negate ballistic shocks. Attaches to a plate carrier."
	icon = 'maps/gaia/icons/items/clothing/pmc_gear.dmi'
	icon_state = "armor_pmc"
	armor = list(
		melee = ARMOR_MELEE_RESISTANT,
		bullet = ARMOR_BALLISTIC_RESISTANT,
		laser = ARMOR_LASER_SMALL,
		bomb = ARMOR_BOMB_MINOR
	)

/obj/item/clothing/suit/armor/pcarrier/pmc
	name = "khaki sleek plate carrier"
	desc = "An even less encumbering variant of a plate carrier, used by certain private security firms. Can be equipped with armor plates, but provides no protection of its own."
	icon = 'maps/gaia/icons/items/clothing/pmc_gear.dmi'
	icon_state = "pcarrier_pmc"
	item_state = "pcarrier_pmc"
	item_icons = list(slot_wear_suit_str = 'maps/gaia/icons/items/clothing/pmc_gear_mob.dmi')
	valid_accessory_slots = list(ACCESSORY_SLOT_INSIGNIA, ACCESSORY_SLOT_DECOR, ACCESSORY_SLOT_ARMOR_C, ACCESSORY_SLOT_ARMOR_A, ACCESSORY_SLOT_ARMOR_L, ACCESSORY_SLOT_ARMOR_S, ACCESSORY_SLOT_ARMOR_M)
	accessories = list(/obj/item/clothing/accessory/armor_plate/pmc, /obj/item/clothing/accessory/arm_guards/pmc, /obj/item/clothing/accessory/leg_guards/pmc, /obj/item/clothing/accessory/storage/pouches/pmc)

/obj/item/clothing/accessory/storage/pouches/pmc
	desc = "A collection of khaki pouches that can be attached to a plate carrier. Carries up to two items."
	icon = 'maps/gaia/icons/items/clothing/pmc_gear.dmi'
	accessory_icons = list(
		slot_tie_str = 'maps/gaia/icons/items/clothing/pmc_gear_mob.dmi',
		slot_wear_suit_str = 'maps/gaia/icons/items/clothing/pmc_gear_mob.dmi'
	)
	icon_state = "pouches_pmc"

/obj/item/clothing/accessory/arm_guards/pmc
	name = "midnight regiment khaki arm guards"
	desc = "A pair of khaki arm pads reinforced with cushioned armor plates. Bears the flag of Sestris and the Brigade Legere logo. Attaches to a plate carrier."
	icon = 'maps/gaia/icons/items/clothing/pmc_gear.dmi'
	accessory_icons = list(
		slot_tie_str = 'maps/gaia/icons/items/clothing/pmc_gear_mob.dmi',
		slot_wear_suit_str = 'maps/gaia/icons/items/clothing/pmc_gear_mob.dmi'
	)
	icon_state = "armguards_pmc"
	armor = list(
		melee = ARMOR_MELEE_RESISTANT,
		bullet = ARMOR_BALLISTIC_PISTOL,
		laser = ARMOR_LASER_MINOR,
		bomb = ARMOR_BOMB_MINOR
	)

/obj/item/clothing/accessory/leg_guards/pmc
	name = "khaki leg guards"
	desc = "A pair of khaki leg pads reinforced with light plasteel armor plates and additional cushioning. Attaches to a plate carrier."
	icon = 'maps/gaia/icons/items/clothing/pmc_gear.dmi'
	accessory_icons = list(
		slot_tie_str = 'maps/gaia/icons/items/clothing/pmc_gear_mob.dmi',
		slot_wear_suit_str = 'maps/gaia/icons/items/clothing/pmc_gear_mob.dmi'
	)
	icon_state = "legguards_pmc"
	armor = list(
		melee = ARMOR_MELEE_RESISTANT,
		bullet = ARMOR_BALLISTIC_RESISTANT,
		laser = ARMOR_LASER_MINOR,
		bomb = ARMOR_BOMB_MINOR
	)

/obj/item/clothing/accessory/armor_tag/pmc
	name = "BLPMC armor tag"
	desc = "A green armor tag with BRIGADE LEGERE written on it."
	accessory_icons = list(
		slot_tie_str = 'maps/gaia/icons/items/clothing/pmc_gear_mob.dmi',
		slot_wear_suit_str = 'maps/gaia/icons/items/clothing/pmc_gear_mob.dmi'
	)
	icon_state = "tag_pmc"
	slot = ACCESSORY_SLOT_ARMOR_M

/obj/item/clothing/accessory/helmet_cover/pmc
	name = "BLPMC helmet cover"
	desc = "A fabric cover for armored helmets. This one is crimson and bears a red IFF stripe of the Brigade Legere PMC."
	icon = 'maps/gaia/icons/items/clothing/pmc_gear.dmi'
	accessory_icons = list(
		slot_tie_str = 'maps/gaia/icons/items/clothing/pmc_gear_mob.dmi',
		slot_head_str = 'maps/gaia/icons/items/clothing/pmc_gear_mob.dmi'
	)
	icon_state = "helmcover_pmc"

/obj/item/clothing/head/helmet/pmc
	name = "mercenary combat helmet"
	desc = "A tactical helmet with words BRIGADE LEGERE printed on the back. Has a tiny camera built-in on the side."
	camera = /obj/machinery/camera/network/helmet_iccg
	armor = list(
		melee = ARMOR_MELEE_MAJOR,
		bullet = ARMOR_BALLISTIC_RIFLE,
		laser = ARMOR_LASER_HANDGUNS,
		energy = ARMOR_ENERGY_RESISTANT,
		bomb = ARMOR_BOMB_PADDED
		)
	accessories = list(/obj/item/clothing/accessory/helmet_cover/pmc)

