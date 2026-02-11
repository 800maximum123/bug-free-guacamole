//appearances
/singleton/closet_appearance/secure_closet/lbrig
	color = COLOR_GRAY20
	decals = list(
		"lower_side_vent"
	)


/singleton/closet_appearance/secure_closet/lbrig/armsman
	extra_decals = list(
		"stripe_vertical_left_full" = COLOR_NT_RED,
		"stripe_vertical_right_full" = COLOR_NT_RED
	)

/singleton/closet_appearance/secure_closet/lbrig/armsman/engi
	extra_decals = list(
		"stripe_vertical_left_full" = COLOR_NT_RED,
		"stripe_vertical_right_full" = COLOR_WARM_YELLOW
	)

/singleton/closet_appearance/secure_closet/lbrig/armsman/medic
	extra_decals = list(
		"stripe_vertical_left_full" = COLOR_NT_RED,
		"stripe_vertical_right_full" = COLOR_BABY_BLUE
	)

/singleton/closet_appearance/secure_closet/lbrig/armsman/lead
	extra_decals = list(
		"stripe_vertical_left_full" = COLOR_NT_RED,
		"stripe_vertical_right_full" = COLOR_CLOSET_GOLD
	)

/singleton/closet_appearance/secure_closet/lbrig/opchief
	extra_decals = list(
		"stripe_vertical_left_full" = COLOR_CLOSET_GOLD,
		"stripe_vertical_right_full" = COLOR_OFF_WHITE
	)

/singleton/closet_appearance/secure_closet/lbrig/pilot
	extra_decals = list(
		"stripe_vertical_left_full" = COLOR_CLOSET_GOLD,
		"stripe_vertical_right_full" = COLOR_PURPLE
	)

/singleton/closet_appearance/secure_closet/lbrig/security
	extra_decals = list(
		"stripe_vertical_mid_full" = COLOR_NT_RED,
		"security" = COLOR_NT_RED
	)

//closets
//MAs - they have slightly different gear here
/obj/structure/closet/secure_closet/security_lbrig
	name = "master at arms' locker"
	req_access = list(access_brig)
	closet_appearance = /singleton/closet_appearance/secure_closet/lbrig/security

/obj/structure/closet/secure_closet/security_lbrig/WillContain()
	return list(
		/obj/item/clothing/head/helmet/solgov/security,
		/obj/item/device/radio/headset/headset_sec,
		/obj/item/device/radio/headset/headset_sec/alt,
		/obj/item/storage/belt/holster/security,
		/obj/item/device/flash,
		/obj/item/reagent_containers/spray/pepper,
		/obj/item/grenade/chem_grenade/teargas,
		/obj/item/melee/baton/loaded,
		/obj/item/taperoll/police,
		/obj/item/storage/firstaid/light,
		/obj/item/device/hailer,
		/obj/item/clothing/accessory/storage/black_vest,
		/obj/item/gun/energy/gun/small/secure,
		/obj/item/gun/projectile/pistol/m19/empty,
		/obj/item/ammo_magazine/pistol/double/rubber,
		/obj/item/device/megaphone,
		/obj/item/clothing/gloves/thick,
		/obj/item/device/holowarrant,
		/obj/item/device/flashlight/maglight,
		/obj/item/storage/belt/security,
		/obj/item/material/knife/folding/swiss/sec,
		new /datum/atom_creator/weighted(list(/obj/item/storage/backpack/security, /obj/item/storage/backpack/satchel/sec)),
		new /datum/atom_creator/weighted(list(/obj/item/storage/backpack/dufflebag/sec, /obj/item/storage/backpack/messenger/sec))
	)

//armsmen
/obj/structure/closet/secure_closet/armsman
	name = "armsman locker"
	req_access = list(access_explorer)
	closet_appearance = /singleton/closet_appearance/secure_closet/lbrig/armsman

/obj/structure/closet/secure_closet/armsman/WillContain()
	return list(
	/obj/item/gun/projectile/pistol/m22f/empty,
	/obj/item/ammo_magazine/pistol/double,
	/obj/item/rig/ert/fleet/armsman,
	/obj/item/device/radio/headset/armsman,
	/obj/item/storage/firstaid/light,
	/obj/item/device/flashlight/maglight
	)

/obj/structure/closet/secure_closet/armsman_engi
	name = "armsman engineer locker"
	req_access = list(access_explorer)
	closet_appearance = /singleton/closet_appearance/secure_closet/lbrig/armsman/engi

/obj/structure/closet/secure_closet/armsman_engi/WillContain()
	return list(
	/obj/item/gun/projectile/pistol/m22f/empty,
	/obj/item/ammo_magazine/pistol/double,
	/obj/item/rig/ert/fleet/armsman,
	/obj/item/device/radio/headset/armsman,
	/obj/item/storage/firstaid/light,
	/obj/item/device/flashlight/maglight,
	/obj/item/storage/box/emps,
	/obj/item/storage/box/smokes,
	/obj/item/storage/belt/utility/full,
	/obj/item/clothing/gloves/insulated/black,
	/obj/item/device/multitool
	)

/obj/structure/closet/secure_closet/armsman_medic
	name = "armsman medic locker"
	req_access = list(access_explorer)
	closet_appearance = /singleton/closet_appearance/secure_closet/lbrig/armsman/medic

/obj/structure/closet/secure_closet/armsman_medic/WillContain()
	return list(
	/obj/item/gun/projectile/pistol/m22f/empty,
	/obj/item/ammo_magazine/pistol/double,
	/obj/item/rig/ert/fleet/armsman,
	/obj/item/device/radio/headset/armsman,
	/obj/item/storage/firstaid/light,
	/obj/item/device/flashlight/maglight,
	)

/obj/structure/closet/secure_closet/armsman_lead
	name = "armsman team leader locker"
	req_access = list(access_explorer)
	closet_appearance = /singleton/closet_appearance/secure_closet/lbrig/armsman/lead

/obj/structure/closet/secure_closet/armsman_lead/WillContain()
	return list(
	/obj/item/gun/projectile/pistol/m22f/empty,
	/obj/item/ammo_magazine/pistol/double,
	/obj/item/rig/ert/fleet/armsman,
	/obj/item/device/radio/headset/armsman/lead,
	/obj/item/storage/firstaid/light,
	/obj/item/device/flashlight/maglight,
	)

//officers
/obj/structure/closet/secure_closet/lbrig_bridgeofficer
	name = "bridge officer's locker"
	req_access = list(access_bridge, access_keycard_auth)
	closet_appearance = /singleton/closet_appearance/secure_closet/torch/command/bo

/obj/structure/closet/secure_closet/lbrig_bridgeofficer/WillContain()
	return list(
		/obj/item/device/radio,
		/obj/item/pen,
		/obj/item/device/tape/random,
		/obj/item/device/taperecorder,
		/obj/item/device/flash,
		/obj/item/device/megaphone,
		/obj/item/material/clipboard,
		/obj/item/folder/blue,
		/obj/item/modular_computer/tablet/lease/preset/command,
		/obj/item/device/radio/headset/bridgeofficer,
		/obj/item/device/radio/headset/bridgeofficer/alt,
		/obj/item/gun/projectile/pistol/m19/empty,
		/obj/item/ammo_magazine/pistol/double,
		/obj/item/ammo_magazine/pistol/double/rubber,
		/obj/item/storage/belt/general,
		/obj/item/material/knife/folding/swiss/officer,
		new /datum/atom_creator/weighted(list(/obj/item/storage/backpack, /obj/item/storage/backpack/satchel/grey)),
		new /datum/atom_creator/weighted(list(/obj/item/storage/backpack/dufflebag, /obj/item/storage/backpack/messenger)),
		new /datum/atom_creator/weighted(list(/obj/item/device/flashlight, /obj/item/device/flashlight/flare, /obj/item/device/flashlight/flare/glowstick/random))
	)

/obj/structure/closet/secure_closet/opchief
	name = "operation chief's locker"
	req_access = list(access_bridge, access_senadv)
	closet_appearance = /singleton/closet_appearance/secure_closet/lbrig/opchief

/obj/structure/closet/secure_closet/opchief/WillContain()
	return list(
		/obj/item/device/radio,
		/obj/item/device/flash,
		/obj/item/device/megaphone,
		/obj/item/material/clipboard,
		/obj/item/folder/blue,
		/obj/item/modular_computer/tablet/lease/preset/command,
		/obj/item/device/radio/headset/heads/torchexec,
		/obj/item/device/radio/headset/heads/torchexec/alt,
		/obj/item/gun/projectile/pistol/m19/empty,
		/obj/item/ammo_magazine/pistol/double,
		/obj/item/ammo_magazine/pistol/double/rubber,
		/obj/item/storage/belt/general,
		/obj/item/material/knife/folding/swiss/officer,
		new /datum/atom_creator/weighted(list(/obj/item/storage/backpack, /obj/item/storage/backpack/satchel/grey)),
		new /datum/atom_creator/weighted(list(/obj/item/storage/backpack/dufflebag, /obj/item/storage/backpack/messenger)),
		new /datum/atom_creator/weighted(list(/obj/item/device/flashlight, /obj/item/device/flashlight/flare, /obj/item/device/flashlight/flare/glowstick/random))
	)
