// Custom pcarriers by DarkSovet <3
// PCARRIER
/obj/item/clothing/suit/armor/pcarrier/gaia
	icon = 'maps/gaia/icons/items/clothing/armor-gaia.dmi'
	icon_state = "gcc-armor"
	item_state = "gcc-armor"
	item_icons = list(slot_wear_suit_str = 'maps/gaia/icons/items/clothing/armor-gaia-onmob.dmi')
	accessories = list(/obj/item/clothing/accessory/armor_plate/tactical, /obj/item/clothing/accessory/arm_guards/gaia, /obj/item/clothing/accessory/leg_guards/gaia, /obj/item/clothing/accessory/storage/pouches, /obj/item/clothing/accessory/armor_tag/iccg)

/obj/item/clothing/suit/armor/pcarrier/gaia/mp
	accessories = list(/obj/item/clothing/accessory/armor_plate/medium, /obj/item/clothing/accessory/arm_guards/gaia, /obj/item/clothing/accessory/leg_guards/gaia, /obj/item/clothing/accessory/storage/pouches, /obj/item/clothing/accessory/armor_tag/iccg, /obj/item/clothing/accessory/armor_tag/solgov/sec)

/obj/item/clothing/suit/armor/pcarrier/gaia/sol
	icon_state = "sol-armor"
	item_state = "sol-armor"
	accessories = list(/obj/item/clothing/accessory/armor_plate/tactical, /obj/item/clothing/accessory/arm_guards/gaia/sol, /obj/item/clothing/accessory/leg_guards/gaia/sol, /obj/item/clothing/accessory/storage/pouches, /obj/item/clothing/accessory/armor_tag/solgov)

// HELMETS
/obj/item/clothing/head/helmet/gaia
	name = "tactical helmet"
	desc = "Reinforced headgear. Protects the head from impacts. It says 'Sdelano v Novya Zemlya' on the inside."
	camera = /obj/machinery/camera/network/helmet_iccg
	radio = /obj/item/device/radio/attachable_camera/iccg
	armor = list(
		melee = ARMOR_MELEE_MAJOR,
		bullet = ARMOR_BALLISTIC_RIFLE,
		laser = ARMOR_LASER_HANDGUNS,
		energy = ARMOR_ENERGY_RESISTANT,
		bomb = ARMOR_BOMB_PADDED
		)
	siemens_coefficient = 0.6

	icon = 'maps/gaia/icons/items/clothing/armor-gaia.dmi'
	icon_state = "gcc-helmet"
	item_state = "gcc-helmet"
	item_icons = list(slot_head_str = 'maps/gaia/icons/items/clothing/armor-gaia-onmob.dmi')

/obj/item/clothing/head/helmet/gaia/sol
	desc = "Reinforced headgear. Protects the head from impacts. It says 'MADE IN SCG' on the inside."
	camera = /obj/machinery/camera/network/helmet_scg
	radio = /obj/item/device/radio/attachable_camera/scg
	icon_state = "sol-helmet"
	item_state = "sol-helmet"

// ARM GUARDS
/obj/item/clothing/accessory/arm_guards/gaia
	name = "heavy arm guards"
	desc = "A pair of arm pads reinforced with heavy armor plating. Attaches to a plate carrier."
	icon_state = "gcc-shoulder-pads"
	armor = list(
		melee = ARMOR_MELEE_RESISTANT,
		bullet = ARMOR_BALLISTIC_PISTOL,
		laser = ARMOR_LASER_HANDGUNS,
		energy = ARMOR_ENERGY_RESISTANT,
		bomb = ARMOR_BOMB_PADDED
	)
	accessory_icons = list(slot_tie_str = 'maps/gaia/icons/items/clothing/armor-gaia-onmob.dmi',
						slot_wear_suit_str = 'maps/gaia/icons/items/clothing/armor-gaia-onmob.dmi'
						)
	icon = 'maps/gaia/icons/items/clothing/armor-gaia-onmob.dmi'

/obj/item/clothing/accessory/arm_guards/gaia/sol
	icon_state = "sol-shoulder-plates"

// LEG GUARDS
/obj/item/clothing/accessory/leg_guards/gaia
	name = "heavy leg guards"
	desc = "A pair of heavily armored leg pads. Attaches to a plate carrier."
	icon_state = "gcc-leg-plates"
	armor = list(
		melee = ARMOR_MELEE_RESISTANT,
		bullet = ARMOR_BALLISTIC_PISTOL,
		laser = ARMOR_LASER_HANDGUNS,
		energy = ARMOR_ENERGY_RESISTANT,
		bomb = ARMOR_BOMB_PADDED
	)
	accessory_icons = list(slot_tie_str = 'maps/gaia/icons/items/clothing/armor-gaia-onmob.dmi',
						slot_wear_suit_str = 'maps/gaia/icons/items/clothing/armor-gaia-onmob.dmi'
						)
	icon = 'maps/gaia/icons/items/clothing/armor-gaia-onmob.dmi'

/obj/item/clothing/accessory/leg_guards/gaia/sol
	icon_state = "sol-leg-plates"
