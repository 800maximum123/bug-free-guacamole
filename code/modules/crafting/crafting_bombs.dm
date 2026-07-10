// Improvised soda can bomb
/singleton/crafting_stage/wiring/can_bomb
	item_icon_state = "ied_wired"
	progress_message = "You add a length of wire and secure it around the hollow frame."
	item_desc = "A can that had its label ripped off, with a length of wire jutting out of it."
	next_stages = list(/singleton/crafting_stage/can_bomb)

/singleton/crafting_stage/can_bomb
	completion_trigger_type  = /obj/item/welder_tank
	progress_message = "You add the welding fuel tank and rig the wire to its output, sealing the bomb."
	product = /obj/item/grenade/frag/makeshift // explosive.dm

// FRAG TRIPWIRE
/*
/singleton/crafting_stage/material/tripwire1
	begins_with_object_type = /obj/item/grenade/frag
	progress_message = "You attach some cable to the grenade pin."
	item_desc = "Frag grenade with cable attached to its pin."
	item_icon_state = "tripwire_item-unfinished"
	completion_trigger_type = /obj/item/stack/cable_coil
	stack_consume_amount = 1
	next_stages = list(/singleton/crafting_stage/material/tripwire2)

/singleton/crafting_stage/material/tripwire2
	completion_trigger_type = /obj/item/stack/material/rods
	progress_message = "You tie the end of the cable to the rod."
	stack_consume_amount = 1
	product = /obj/item/device/mine/tripwire

/singleton/crafting_stage/material/tripwire2/get_product(obj/item/work)
	var/obj/item/grenade/frag/grenade = locate() in work
	return ispath(product, /obj/item/device/mine/tripwire) && new product(get_turf(work), grenade)
*/
