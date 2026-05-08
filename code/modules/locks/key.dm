// KEY
/obj/item/key
	name = "key"
	desc = "Used to unlock things."
	icon = 'icons/obj/keys.dmi'
	icon_state = "keys"
	w_class = ITEM_SIZE_TINY
	var/key_data = ""

/obj/item/key/New(newloc,data)
	if(data)
		key_data = data
	..(newloc)

/obj/item/key/proc/get_data(mob/user)
	return key_data

/obj/item/key/soap
	name = "soap key"
	desc = "a fragile key made using a bar of soap."
	var/uses = 0

/obj/item/key/soap/get_data(mob/user)
	uses--
	if(uses == 1)
		to_chat(user, SPAN_WARNING("\The [src] is going to break soon!"))
	else if(uses <= 0)
		to_chat(user, SPAN_WARNING("\The [src] crumbles in your hands."))
		qdel(src)
	return ..()

// KEYCHAIN
/obj/item/storage/keychain
	name = "keychain"
	desc = "A keychain to hold your keys, can hold up to 10 keys."
	icon = 'icons/obj/keys.dmi'
	icon_state = "keychain"
	w_class = ITEM_SIZE_TINY
	max_storage_space = ITEM_SIZE_TINY * 10
	contents_allowed = list(
		/obj/item/key,
		/obj/item/toy,
	)
