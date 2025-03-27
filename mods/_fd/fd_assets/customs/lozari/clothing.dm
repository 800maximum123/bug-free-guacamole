/obj/item/clothing/under/dark
	name = "dark robotist uniform"
	desc = "A fashionable polo and pair of trousers made from patented biohazard-resistant synthetic fabrics. This one is darker and has much more red than normal counterparts."

	icon = 'mods/_fd/fd_assets/customs/lozari/icons/dark_robotist_uniform.dmi'
	icon_state = "dark_robotist"
	item_icons = list(
		slot_w_uniform_str = 'mods/_fd/fd_assets/customs/lozari/onmob/dark_robotist_uniform.dmi')
	worn_state = "dark_robotist"

/obj/item/clothing/suit/storage/toggle/labcoat/dark
	name = "dark labcoat"
	desc = "A suit that protects against minor chemical spills. This one is darker and has much more red than normal counterparts."
	icon = 'mods/_fd/fd_assets/customs/lozari/icons/dark_robotist_labcoat.dmi'
	icon_state = "labcoat_dark_robo"
	item_icons = list(
		slot_wear_suit_str = 'mods/_fd/fd_assets/customs/lozari/onmob/dark_robotist_labcoat.dmi',
		slot_l_hand_str = 'icons/mob/onmob/items/lefthand_uniforms.dmi',
		slot_r_hand_str = 'icons/mob/onmob/items/righthand_uniforms.dmi')
	item_state_slots = list(
		slot_l_hand_str = "ba_suit",
		slot_r_hand_str = "ba_suit")

/obj/item/clothing/gloves/insulated/dark
	name = "gloves"
	desc = "These gloves will protect the wearer from electric shocks. This ones are darker than normal counterparts."
	icon = 'mods/_fd/fd_assets/customs/lozari/icons/dark_robotist_gloves.dmi'
	icon_state = "dark_robotist"
	item_icons = list(
		slot_gloves_str = 'mods/_fd/fd_assets/customs/lozari/onmob/dark_robotist_gloves.dmi',
		slot_l_hand_str = 'icons/mob/onmob/items/lefthand.dmi',
		slot_r_hand_str = 'icons/mob/onmob/items/righthand.dmi'
		)
	item_state = "dark_robotist"
	item_state_slots = list(
		slot_l_hand_str = "bgloves",
		slot_r_hand_str = "bgloves")
