/obj/item
	var/can_fish = FALSE
	var/fishing_range = 1
	var/min_fishing_duration = 20 SECONDS
	var/max_fishing_duration = 1 MINUTES
	var/fishing_timing = 2 SECONDS
	var/last_use_fishing

/obj/item/attack_self(mob/user)
	. = ..()
	last_use_fishing = world.time

/obj/item/material/twohanded/spear
	can_fish = TRUE
	fishing_range = 0
	fishing_timing = 1 SECOND
	min_fishing_duration = 40 SECONDS
	max_fishing_duration = 90 SECONDS

/obj/item/fishing_rod
	icon_state = "pole_inhand"
	icon = 'mods/_fd/fishing/icons/fishing_rod.dmi'
	item_icons = list(
		slot_r_hand_str = 'mods/_fd/fishing/icons/fishing_rod_inhand.dmi',
		slot_l_hand_str = 'mods/_fd/fishing/icons/fishing_rod_inhand.dmi'
		)
	item_state = "pole_inhand"
	name = "fishing rod"
	desc = "Gone fishing."
	slot_flags = SLOT_BACK
	w_class = ITEM_SIZE_LARGE

	can_fish = TRUE
	fishing_range = 5
	min_fishing_duration = 1 MINUTES
	max_fishing_duration = 3 MINUTES
	fishing_timing = 5 SECONDS
