/obj/item/clothing/suit/storage/toggle/edgecoat
	name = "old trench coat"
	desc = "An old, tattered, but still very heavy trench coat."
	icon = 'mods/_fd/fd_customs/customs/bioplan/bigshitasscloak.dmi'
	item_icons = list(slot_wear_suit_str = 'mods/_fd/fd_customs/customs/bioplan/EDGECOAT.dmi')
	icon_state = "edgecoat"
	valid_accessory_slots = list(ACCESSORY_SLOT_INSIGNIA)
	armor = list(melee = 55, bullet = 35, laser = 0,energy = 10, bomb = 5, bio = 0, rad = 0)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	allowed = list(
		/obj/item/tank/oxygen_emergency,
		/obj/item/tank/oxygen_emergency_extended,
		/obj/item/tank/nitrogen_emergency,
		/obj/item/device/flashlight,
		/obj/item/gun/energy,
		/obj/item/gun/projectile,
		/obj/item/ammo_magazine,
		/obj/item/ammo_casing,
		/obj/item/melee/baton,
		/obj/item/handcuffs,
		/obj/item/storage/fancy/smokable,
		/obj/item/flame/lighter,
		/obj/item/device/taperecorder
	)

/obj/item/clothing/shoes/noble_boots
	name = "noble boots"
	desc = "Very good shoes that still look good even after so much time."
	icon = 'mods/_fd/fd_customs/customs/bioplan/nobleboots.dmi'
	icon_state = "noble_boots"
	item_icons = list(slot_shoes_str = 'mods/_fd/fd_customs/customs/bioplan/nobleboots_onmob.dmi')
	item_state = "noble_boots"
