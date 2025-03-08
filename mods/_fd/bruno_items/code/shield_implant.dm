/obj/item/shield/riot/metal/shield_implant
	name = "shield implant"
	//icon = 'mods/_fd/bruno_items/icons/shield_implant.dmi'
	//icon_state = "shield_implant"
	//item_state = "shield_implant"
	icon = 'icons/obj/weapons/melee_physical.dmi'
	icon_state = "metal"
	item_state = "metal"
	obj_flags = OBJ_FLAG_CONDUCTIBLE
	slot_flags = SLOT_BACK
	force = 6.0
	throwforce = 7.0
	throw_range = 3
	w_class = ITEM_SIZE_HUGE
	matter = list(MATERIAL_PLASTEEL = 8500)
	max_block = 50
	can_block_lasers = TRUE
	slowdown_general = 0.5

/obj/item/organ/internal/augment/active/item/shield_implant
	name = "shield implant"
	desc = "A deployable shield impant."
	action_button_name = "Deploy shield"
	icon_state = "hydraulic"
	augment_slots = AUGMENT_ARM
	item = /obj/item/shield/riot/metal/shield_implant
	default_action_type = /datum/action/item_action/organ/augment/fd
	origin_tech = list(TECH_COMBAT = 3, TECH_ESOTERIC = 4)
	deploy_sound = 'sound/effects/holster/sheathout.ogg'
	retract_sound = 'sound/effects/holster/sheathin.ogg'
	augment_flags = AUGMENT_MECHANICAL | AUGMENT_BIOLOGICAL
