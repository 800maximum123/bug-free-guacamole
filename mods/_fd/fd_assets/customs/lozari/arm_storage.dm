/obj/item/organ/internal/augment/active/arm_storage
	name = "Arm storage augment"
	desc = "An augment installed in a prosthetic arm, capable of storing one small item."
	action_button_name = "Store/Retrieve Item"
	icon = 'mods/_fd/fd_assets/customs/lozari/arm_storage.dmi'
	icon_state = "storage_augment"
	augment_slots = AUGMENT_ARM
	augment_flags = AUGMENT_MECHANICAL
	var/obj/item/stored_item

/obj/item/organ/internal/augment/active/arm_storage/activate()
	if (!can_activate())
		return

	var/obj/item/held_item = owner.get_active_hand()
	if (held_item)
		if (stored_item)
			to_chat(owner, "The augment already contains an item.")
			return
		if (held_item.w_class > ITEM_SIZE_SMALL)
			to_chat(owner, "The item is too large to store in the augment.")
			return
		owner.unEquip(held_item)
		stored_item = held_item
		held_item.forceMove(src)
		to_chat(owner, "You store [held_item] in your [limb].")
	else
		if (!stored_item)
			to_chat(owner, "There is no item in the augment to retrieve.")
			return
		owner.put_in_active_hand(stored_item)
		to_chat(owner, "You retrieve [stored_item] from your [limb].")
		stored_item = null

/obj/item/organ/internal/augment/active/arm_storage/Destroy()
	if (stored_item)
		QDEL_NULL(stored_item)
	. = ..()
