/obj/item/clothing/head/helmet/traumateam
	name = "Trauma team helmet"
	desc = "Seven minutes or a refund."
	icon = 'mods/_fd/fd_assets/code/trauma/icon.dmi'
	item_icons = list(
		slot_head_str = 'mods/_fd/fd_assets/code/trauma/onmob.dmi'
	)
	icon_state = "trauma_team"
	item_state = "trauma_team"
	valid_accessory_slots = null
	body_parts_covered = HEAD|FACE|EYES
	item_flags = ITEM_FLAG_BLOCK_GAS_SMOKE_EFFECT|ITEM_FLAG_AIRTIGHT
	flags_inv = BLOCKHAIR|HIDEEYES|HIDEEARS
	armor = list(
		melee = 7,
		bullet = 10,
		energy = 10,
		bomb = 50,
		bio = 100,
		rad = 50)
	action_button_name = "Flip Face Shield"

/obj/item/clothing/head/helmet/traumateam/attack_self(mob/user)
	action_button_name = "Flip Face Shield"
	body_parts_covered ^= EYES|FACE
	icon_state = initial(icon_state)
	item_state = initial(item_state)
	var/action = "lowers"

	if (~body_parts_covered & EYES)
		icon_state += "_up"
		item_state += "_up"
		action = "raises"

	visible_message(SPAN_ITALIC("\The [user] [action] the face shield on \the [src]."), range = 3)
	update_clothing_icon()

//	-----

/obj/item/clothing/suit/armor/traumateam
	name = "Trauma team armor"
	desc = "Seven minutes or a refund."
	icon = 'mods/_fd/fd_assets/code/trauma/icon.dmi'
	item_icons = list(
		slot_wear_suit_str = 'mods/_fd/fd_assets/code/trauma/onmob.dmi'
	)
	icon_state = "trauma_team_suit"
	item_state = "trauma_team_suit"
	armor = list(
		melee = 7,
		bullet = 10,
		energy = 10,
		bomb = 20,
		bio = 100,
		rad = 50
	)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
