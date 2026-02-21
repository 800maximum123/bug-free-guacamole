/obj/item/clothing/suit/armor/pcarrier/gaia
	icon = 'armor-gaia.dmi'
	icon_state = "gaia-armor"
	item_state = "gaia-armor"
	item_icons = list(slot_wear_suit_str = 'mods/_fd/fd_assets/code/clothing/armor-gaia-onmob.dmi')
	accessories = list(/obj/item/clothing/accessory/armor_plate/tactical, /obj/item/clothing/accessory/arm_guards/gaia, /obj/item/clothing/accessory/leg_guards/gaia, /obj/item/clothing/accessory/storage/pouches)

/obj/item/clothing/suit/armor/pcarrier/gaia/sol
	icon_state = "sol-armor"
	item_state = "sol-armor"
	accessories = list(/obj/item/clothing/accessory/armor_plate/tactical, /obj/item/clothing/accessory/arm_guards/gaia/sol, /obj/item/clothing/accessory/leg_guards/gaia/sol, /obj/item/clothing/accessory/storage/pouches)

/obj/item/clothing/head/helmet/gaia
	name = "tactical helmet"
	desc = "A helmet made from advanced ceramic. Comfortable and robust."
	armor = list(
		melee = ARMOR_MELEE_MAJOR,
		bullet = ARMOR_BALLISTIC_RIFLE,
		laser = ARMOR_LASER_HANDGUNS,
		energy = ARMOR_ENERGY_RESISTANT,
		bomb = ARMOR_BOMB_PADDED
		)
	siemens_coefficient = 0.6

	icon = 'armor-gaia.dmi'
	icon_state = "gaia-helmet"
	item_state = "gaia-helmet"
	item_icons = list(slot_head_str = 'mods/_fd/fd_assets/code/clothing/armor-gaia-onmob.dmi')


/obj/item/clothing/head/helmet/gaia/sol
	icon_state = "sol-helmet"
	item_state = "sol-helmet"

/obj/item/clothing/accessory/arm_guards/gaia
	name = "heavy arm guards"
	desc = "A pair of arm pads reinforced with heavy armor plating. Attaches to a plate carrier."
	icon_state = "shoulder-pads"
	armor = list(
		melee = ARMOR_MELEE_RESISTANT,
		bullet = ARMOR_BALLISTIC_PISTOL,
		laser = ARMOR_LASER_HANDGUNS,
		energy = ARMOR_ENERGY_RESISTANT,
		bomb = ARMOR_BOMB_PADDED
	)
	accessory_icons = list(slot_tie_str = 'mods/_fd/fd_assets/code/clothing/armor-gaia-onmob.dmi',
						slot_wear_suit_str = 'mods/_fd/fd_assets/code/clothing/armor-gaia-onmob.dmi'
						)
	icon = 'mods/_fd/fd_assets/code/clothing/armor-gaia-onmob.dmi'


/obj/item/clothing/accessory/leg_guards/gaia
	name = "heavy leg guards"
	desc = "A pair of heavily armored leg pads. Attaches to a plate carrier."
	icon_state = "leg-plates"
	armor = list(
		melee = ARMOR_MELEE_RESISTANT,
		bullet = ARMOR_BALLISTIC_PISTOL,
		laser = ARMOR_LASER_HANDGUNS,
		energy = ARMOR_ENERGY_RESISTANT,
		bomb = ARMOR_BOMB_PADDED
	)
	accessory_icons = list(slot_tie_str = 'mods/_fd/fd_assets/code/clothing/armor-gaia-onmob.dmi',
						slot_wear_suit_str = 'mods/_fd/fd_assets/code/clothing/armor-gaia-onmob.dmi'
						)
	icon = 'mods/_fd/fd_assets/code/clothing/armor-gaia-onmob.dmi'


/obj/item/clothing/accessory/arm_guards/gaia/sol
	icon_state = "shoulder"

/obj/item/clothing/accessory/leg_guards/gaia/sol
	icon_state = "leg"

/obj/item/clothing/accessory/storage/pouches
	slots = 3 STORAGE_SLOTS
