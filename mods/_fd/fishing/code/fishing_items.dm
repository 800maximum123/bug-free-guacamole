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
