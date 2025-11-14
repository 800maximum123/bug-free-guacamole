/obj/item/material/twohanded/spear/assashite
	base_name = ""
	name = "spear"
	desc = "The best weapon of all times and races."
	item_icons = list(
		slot_back_str = 'mods/_fd/fd_customs/customs/aftik/icons/onmob_back_spear_assashite.dmi',
		slot_l_hand_str = 'mods/_fd/fd_customs/customs/aftik/icons/onmob_lefthand_spear_assashite.dmi',
		slot_r_hand_str = 'mods/_fd/fd_customs/customs/aftik/icons/onmob_righthand_spear_assashite.dmi'
	)
	default_material = "steel"
	applies_material_name = 0
	icon = 'mods/_fd/fd_customs/customs/aftik/icons/spear_assashite.dmi'
	icon_state = "spear-assashite"
	base_icon = "spear-assashite"
	max_force = 25
	base_parry_chance = 35
	thrown_force_multiplier = 1.9

/obj/item/clothing/suit/storage/hooded/assashite_raincoat
	name = "old tattered cloak"
	desc = "An old raincoat with a bunch of cat hair."
	icon = 'mods/_fd/fd_customs/customs/aftik/icons/black_cloak_item.dmi'
	icon_state = "black_cloak_item"
	item_state = "black_cloak"
	item_flags = ITEM_FLAG_WASHER_ALLOWED
	item_icons = list(
		slot_wear_suit_str = 'mods/_fd/fd_customs/customs/aftik/icons/onmob_black_cloak.dmi'
		)

	hoodtype = /obj/item/clothing/head/assashite_raincoathood
	suittoggled = 0
	action_button_name = "Toggle Cloak Hood"

/obj/item/clothing/head/assashite_raincoathood
	name = "old tattered hood"
	icon = 'mods/_fd/fd_customs/customs/aftik/icons/onmob_black_cloak.dmi'
	icon_state = "black_cloak_hood"
	item_icons = list(
		slot_head_str = 'mods/_fd/fd_customs/customs/aftik/icons/onmob_black_cloak.dmi'
		)

/obj/item/clothing/accessory/assashite/amulet
	name = "strange assashite amulet"
	desc = "What a fuck IS THIS?!"
	icon_state = "assashite_amulet"
	item_state = "assashite_amulet"
	icon = 'mods/_fd/fd_customs/customs/aftik/icons/assashite_amulet.dmi'
	accessory_icons = list(slot_w_uniform_str = 'mods/_fd/fd_customs/customs/aftik/icons/onmob_accessories_assashite_amulet.dmi', slot_wear_suit_str = 'mods/_fd/fd_customs/customs/aftik/icons/onmob_accessories_assashite_amulet.dmi')
	item_icons = list(slot_wear_mask_str = 'mods/_fd/fd_customs/customs/aftik/icons/onmob_accessories_assashite_amulet.dmi')
	slot = ACCESSORY_SLOT_INSIGNIA
	slot_flags = SLOT_TIE | SLOT_MASK
