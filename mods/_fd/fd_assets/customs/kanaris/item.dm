// Cloak

/obj/item/clothing/accessory/cloakspace/willheim
	name = "cloak"
	desc = "Durable cloak from SpaceFashion. Resistant to environmental hazards and physical impact. Pleasant to the touch."
	icon = 'mods/_fd/fd_assets/customs/kanaris/willheim.dmi'
	icon_state = "kanarys_cloak"

	accessory_icons = list(
		slot_w_uniform_str = 'mods/_fd/fd_assets/customs/kanaris/willheim.dmi',
		slot_wear_suit_str = 'mods/_fd/fd_assets/customs/kanaris/willheim.dmi')
	item_icons = list(
		slot_wear_suit_str = 'mods/_fd/fd_assets/customs/kanaris/willheim.dmi')

//	armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 0)
	slot_flags = SLOT_OCLOTHING
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	siemens_coefficient = 0.9
	w_class = ITEM_SIZE_NORMAL
	slot = ACCESSORY_SLOT_INSIGNIA
	slot_flags = SLOT_OCLOTHING

	valid_accessory_slots = null

// ARMORY

/obj/item/clothing/head/helmet/willheim
	name = "decorative victorian helmet"
	desc = "An pretty old-fashioned three-cornered hat on top of sci-fi'ish cybernetic helmet with red visor. Not practical at all, really."
	icon = 'mods/_fd/fd_assets/customs/kanaris/willheim.dmi'
	icon_state = "kanarys_helmet"
	item_state = "kanarys_helmet"
	item_icons = list(
		slot_head_str = 'mods/_fd/fd_assets/customs/kanaris/willheim.dmi',
		slot_l_hand_str = 'icons/mob/onmob/items/lefthand_hats.dmi',
		slot_r_hand_str = 'icons/mob/onmob/items/righthand_hats.dmi'
	)
	item_state_slots = list(
		slot_l_hand_str = "helmet",
		slot_r_hand_str = "helmet"
		)

/obj/item/clothing/suit/armor/willheim
	name = "violet knight armor"
	desc = "Someone can know this armor pattern for it's obvious owners - Kabila's Rangers - furious headhunters, and bandits on other hand, bringing peace and quiet to the all-year desert of dead planet in Pirx system."
	icon = 'mods/_fd/fd_assets/customs/kanaris/willheim.dmi'
	icon_state = "kanarys_armor"
	item_state = "kanarys_armor"
	item_icons = list(
		slot_wear_suit_str = 'mods/_fd/fd_assets/customs/kanaris/willheim.dmi',
		slot_l_hand_str = 'icons/mob/onmob/items/lefthand_spacesuits.dmi',
		slot_r_hand_str = 'icons/mob/onmob/items/righthand_spacesuits.dmi'
	)
	item_state_slots = list(
		slot_l_hand_str = "syndicate-black-green",
		slot_r_hand_str = "syndicate-black-green"
	)
	equip_delay = 4 SECONDS
	flags_inv = HIDESHOES | HIDETAIL | CLOTHING_BULKY | HIDEJUMPSUIT
//	slowdown = 1
	valid_accessory_slots = list(ACCESSORY_SLOT_INSIGNIA)
	body_parts_covered = ARMS | FULL_TORSO | FULL_LEGS
	cold_protection = ARMS | FULL_TORSO | FULL_LEGS
	heat_protection = ARMS | FULL_TORSO | FULL_LEGS
	armor = list(
		melee = ARMOR_MELEE_KNIVES,
		bullet = ARMOR_BALLISTIC_SMALL,
		laser = ARMOR_LASER_MINOR,
		energy = ARMOR_ENERGY_MINOR,
		bomb = ARMOR_BOMB_MINOR
		)

/obj/item/storage/box/willheim
	name = "box"
	desc = "It's just an ordinary box."

/obj/item/storage/box/willheim/New()
	..()
	new /obj/item/clothing/suit/armor/willheim(src)
	new /obj/item/clothing/head/helmet/willheim(src)
	new /obj/item/gun/energy/laser/lasgun/kanarys(src)
	new /obj/item/cell/guncell/lasgun(src)
	new /obj/item/cell/guncell/lasgun(src)
