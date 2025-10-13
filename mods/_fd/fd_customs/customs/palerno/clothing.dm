/obj/item/clothing/under/ibis
	name = "Pilot Suit 'Aegis-9'"
	desc = "Standart anti-G suit for a mech pilot, released in a limited series for participants in the experimental neurointerface program."

	icon = 'mods/_fd/fd_customs/customs/palerno/icon/emmy_clothe.dmi'
	icon_state = "pilot_flightsuit"
	item_icons = list(
		slot_w_uniform_str = 'mods/_fd/fd_customs/customs/palerno/onmob/suit.dmi',
		slot_l_hand_str = 'icons/mob/onmob/items/lefthand_spacesuits.dmi',
		slot_r_hand_str = 'icons/mob/onmob/items/righthand_spacesuits.dmi')
	worn_state = "pilot_flightsuit"
	item_state_slots = list(
		slot_l_hand_str = "syndicate-black-green",
		slot_r_hand_str = "syndicate-black-green"
	)

	cold_protection = ARMS | FULL_TORSO | LEGS
	heat_protection = ARMS | FULL_TORSO | LEGS
	armor = list(
		melee = ARMOR_MELEE_KNIVES,
		bullet = ARMOR_BALLISTIC_SMALL,
		laser = ARMOR_LASER_MINOR,
		energy = ARMOR_ENERGY_MINOR,
		bomb = ARMOR_BOMB_MINOR
		)

/obj/item/clothing/head/helmet/ibis
	name = "Pilot Helmet Mk5"
	desc = "The helmet contains a projection HUD with perception enhancement and a direct neural response interface. On the ear plate, a scratched smiley face ':3' can be noticed."
	icon = 'mods/_fd/fd_customs/customs/palerno/icon/emmy_clothe.dmi'
	icon_state = "pilot_mech_helmet_item"
	item_state = "pilot_mech_helmet"

	flags_inv = HIDEMASK | HIDEEARS | HIDEEYES | BLOCKHAIR | HIDEFACE
	body_parts_covered = FULL_HEAD

	item_icons = list(
		slot_head_str = 'mods/_fd/fd_customs/customs/palerno/onmob/helmet.dmi',
		slot_l_hand_str = 'icons/mob/onmob/items/lefthand_hats.dmi',
		slot_r_hand_str = 'icons/mob/onmob/items/righthand_hats.dmi'
	)
	item_state_slots = list(
		slot_l_hand_str = "syndicate-helm-green-dark",
		slot_r_hand_str = "syndicate-helm-green-dark"
		)

/obj/item/storage/box/emmy
	name = "box"
	desc = "Time for war, 621"

/obj/item/storage/box/emmy/New()
	..()
	new /obj/item/clothing/under/ibis(src)
	new /obj/item/clothing/head/helmet/ibis(src)
