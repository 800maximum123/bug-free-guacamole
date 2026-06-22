/obj/item/fd/bluespace_device
	name = "Strange device"
	desc = "A hand-made device, used for navigating trough bluespace"
	icon = 'mods/_fd/fd_assets/icons/obj/items/device.dmi'
	icon_state = "finder1"
	w_class = ITEM_SIZE_TINY

/obj/item/stack/school/coin5
	name = "school coin"
	desc = "An victory coin. This one costs 5 points."
	icon = 'mods/_fd/fd_assets/icons/obj/items/oddities.dmi'
	icon_state = "coin"
	max_amount = 10

/obj/item/stack/school/coin10
	name = "school coin"
	desc = "An victory coin. This one costs 10 points."
	icon = 'mods/_fd/fd_assets/icons/obj/items/oddities.dmi'
	icon_state = "coin_gold"
	max_amount = 10

/obj/item/photo/map
	img = 'mods/_fd/fd_assets/icons/map_highfleet.png'
	photo_size = 10

/obj/item/melee/umbrella
	name = "umbrella"
	desc = "To keep the rain off you. Use with caution on windy days."
	icon = 'mods/_fd/fd_assets/icons/obj/items/umbrella.dmi'
	icon_state = "umbrella_closed"
	slot_flags = SLOT_BELT
	force = 3
	throwforce = 3
	w_class = ITEM_SIZE_NORMAL
	var/open = FALSE

/obj/item/melee/umbrella/Initialize()
	. = ..()
	update_icon()

/obj/item/melee/umbrella/attack_self()
	src.toggle_umbrella()

/obj/item/melee/umbrella/proc/toggle_umbrella()
	open = !open
	icon_state = "umbrella_[open ? "open" : "closed"]"
	item_icons = list(
		slot_l_hand_str = 'mods/_fd/fd_assets/icons/onmob/lefthand.dmi',
		slot_r_hand_str = 'mods/_fd/fd_assets/icons/onmob/righthand.dmi',
		)
	item_state = icon_state
	update_icon()
	w_class = open ? ITEM_SIZE_LARGE : ITEM_SIZE_NORMAL
	if(ishuman(src.loc))
		var/mob/living/carbon/human/H = src.loc
		H.update_inv_l_hand(0)
		H.update_inv_r_hand()
	playsound(src.loc, "mods/_fd/fd_assets/sounds/umbrella-[open ? "open" : "close"].ogg", 25, 1)

// Randomizes color
/obj/item/melee/umbrella/random/Initialize()
	color = get_random_colour()
	. = ..()
