//I have somehow spaghetti coded this. Merge with ../structures/closets.dm later

/*
 * Lightbrigade Command
 */
/singleton/closet_appearance/secure_closet/lbrig/command
	extra_decals = list(
		"stripe_vertical_mid_full" = COLOR_CLOSET_GOLD
	)

/singleton/closet_appearance/secure_closet/lbrig/command/bo
	extra_decals = list(
		"stripe_vertical_left_full" = COLOR_CLOSET_GOLD,
		"stripe_vertical_right_full" = COLOR_CLOSET_GOLD
	)

/singleton/closet_appearance/secure_closet/lbrig/command/xo
	extra_decals = list(
		"stripe_vertical_left_full" = COLOR_CLOSET_GOLD,
		"stripe_vertical_right_full" = COLOR_CLOSET_GOLD,
		"command" = COLOR_CLOSET_GOLD
	)

/singleton/closet_appearance/secure_closet/lbrig/command/co
	extra_decals = list(
		"stripe_vertical_left_full" = COLOR_CLOSET_GOLD,
		"stripe_vertical_mid_full" = COLOR_OFF_WHITE,
		"stripe_vertical_right_full" = COLOR_CLOSET_GOLD,
		"command" = COLOR_OFF_WHITE
	)

/obj/structure/closet/secure_closet/lbrig/CO
	name = "commanding officer's locker"
	req_access = list(access_captain)
	closet_appearance = /singleton/closet_appearance/secure_closet/torch/command/co

/obj/structure/closet/secure_closet/lbrig/CO/WillContain()
	return list(
		/obj/item/device/radio/headset/heads/torchexec,
		/obj/item/clothing/glasses/sunglasses,
		/obj/item/device/radio/headset/heads/torchexec/alt,
		/obj/item/storage/belt/general,
		/obj/item/melee/telebaton,
		/obj/item/device/flash,
		/obj/item/gun/energy/confuseray,
		/obj/item/device/megaphone,
		/obj/item/storage/box/radiokeys,
		/obj/item/storage/box/encryptionkey/command,
		/obj/item/storage/box/ids,
		/obj/item/material/clipboard,
		/obj/item/folder/blue,
		/obj/item/material/knife/folding/swiss/officer,
		/obj/item/storage/backpack/satchel/com,
		/obj/item/clothing/suit/armor/pcarrier/medium/command,
		/obj/item/clothing/head/helmet/solgov/command,
		/obj/item/clothing/accessory/storage/holster/armpit,
		/obj/item/gun/projectile/pistol/military
	)

/obj/structure/closet/secure_closet/lbrig/XO
	name = "executive officer's locker"
	req_access = list(access_hop)
	closet_appearance = /singleton/closet_appearance/secure_closet/torch/command/xo

/obj/structure/closet/secure_closet/lbrig/XO/WillContain()
	return list(
		/obj/item/clothing/glasses/sunglasses,
		/obj/item/device/radio/headset/heads/torchexec,
		/obj/item/storage/belt/general,
		/obj/item/melee/telebaton,
		/obj/item/device/flash,
		/obj/item/gun/energy/confuseray,
		/obj/item/device/megaphone,
		/obj/item/storage/box/headset,
		/obj/item/device/radio/headset/heads/torchexec/alt,
		/obj/item/storage/box/radiokeys,
		/obj/item/storage/box/large/ids,
		/obj/item/storage/box/PDAs,
		/obj/item/material/clipboard,
		/obj/item/folder/blue,
		/obj/item/material/knife/folding/swiss/officer,
		/obj/item/storage/backpack/satchel/com,
		/obj/item/storage/box/imprinting,
		/obj/item/clothing/suit/armor/pcarrier/medium/command,
		/obj/item/clothing/head/helmet/solgov/command,
		/obj/item/clothing/accessory/storage/holster/armpit,
		/obj/item/gun/projectile/pistol/military
	)

/obj/structure/closet/secure_closet/lbrig/bridgeofficer
	name = "bridge officer's locker"
	req_access = list(access_bridge, access_keycard_auth)
	closet_appearance = /singleton/closet_appearance/secure_closet/torch/command/bo

/obj/structure/closet/secure_closet/lbrig/bridgeofficer/WillContain()
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
		/obj/item/storage/belt/general,
		/obj/item/material/knife/folding/swiss/officer,
		/obj/item/clothing/accessory/storage/holster/armpit,
		/obj/item/gun/projectile/pistol/military,
		new /datum/atom_creator/weighted(list(/obj/item/storage/backpack, /obj/item/storage/backpack/satchel/grey)),
		new /datum/atom_creator/weighted(list(/obj/item/storage/backpack/dufflebag, /obj/item/storage/backpack/messenger)),
		new /datum/atom_creator/weighted(list(/obj/item/device/flashlight, /obj/item/device/flashlight/flare, /obj/item/device/flashlight/flare/glowstick/random))
	)

/obj/structure/closet/secure_closet/engineering_chief_lbrig
	name = "chief engineer's locker"
	req_access = list(access_ce)
	closet_appearance = /singleton/closet_appearance/secure_closet/torch/engineering/ce

/obj/structure/closet/secure_closet/engineering_chief_lbrig/WillContain()
	return list(
		/obj/item/clothing/accessory/storage/brown_vest,
		/obj/item/blueprints,
		/obj/item/clothing/head/hardhat/white,
		/obj/item/clothing/head/welding,
		/obj/item/clothing/gloves/insulated,
		/obj/item/device/radio/headset/heads/ce,
		/obj/item/device/radio/headset/heads/ce/alt,
		/obj/item/storage/belt/utility/full,
		/obj/item/storage/belt/general,
		/obj/item/clothing/suit/storage/hazardvest,
		/obj/item/clothing/mask/gas,
		/obj/item/device/multitool,
		/obj/item/device/flash,
		/obj/item/gun/energy/confuseray,
		/obj/item/taperoll/engineering,
		/obj/item/device/megaphone,
		/obj/item/crowbar/brace_jack,
		/obj/item/clothing/glasses/meson,
		/obj/item/clothing/glasses/welding/superior,
		/obj/item/clothing/suit/armor/pcarrier/medium/command,
		/obj/item/clothing/head/helmet/solgov/command,
		/obj/item/material/clipboard,
		/obj/item/storage/box/armband/engine,
		/obj/item/material/knife/folding/swiss/officer,
		/obj/item/clothing/accessory/storage/holster/armpit,
		/obj/item/gun/projectile/pistol/military,
		new /datum/atom_creator/weighted(list(/obj/item/storage/backpack/industrial, /obj/item/storage/backpack/satchel/eng)),
		new /datum/atom_creator/weighted(list(/obj/item/storage/backpack/dufflebag/eng, /obj/item/storage/backpack/messenger/engi))
	)

/obj/structure/closet/secure_closet/CMO_lbrig/WillContain()
	return list(
		/obj/item/clothing/suit/bio_suit/cmo,
		/obj/item/clothing/head/bio_hood/cmo,
		/obj/item/clothing/shoes/white,
		/obj/item/clothing/suit/storage/toggle/labcoat/cmo,
		/obj/item/device/radio/headset/heads/cmo,
		/obj/item/device/radio/headset/heads/cmo/alt,
		/obj/item/device/flash,
		/obj/item/gun/energy/confuseray,
		/obj/item/device/megaphone,
		/obj/item/reagent_containers/hypospray/vial,
		/obj/item/storage/fancy/vials,
		/obj/item/device/scanner/health,
		/obj/item/clothing/accessory/stethoscope,
		/obj/item/device/flashlight/pen,
		/obj/item/clothing/glasses/hud/health,
		/obj/item/clothing/suit/armor/pcarrier/medium/command,
		/obj/item/clothing/head/helmet/solgov/command,
		/obj/item/storage/firstaid/adv,
		/obj/item/storage/belt/general,
		/obj/item/material/knife/folding/swiss/officer,
		/obj/item/clothing/accessory/storage/holster/armpit,
		/obj/item/gun/projectile/pistol/military,
		new /datum/atom_creator/weighted(list(/obj/item/storage/backpack/medic, /obj/item/storage/backpack/satchel/med)),
		new /datum/atom_creator/weighted(list(/obj/item/storage/backpack/dufflebag/med, /obj/item/storage/backpack/messenger/med)),
		RANDOM_SCRUBS
	)

/*
 * Lightbrigade - Miscellaneous
 */

/obj/structure/closet/secure_closet/security_lbrig
	name = "master at arms' locker"
	req_access = list(access_brig)
	closet_appearance = /singleton/closet_appearance/secure_closet/lbrig/security

/obj/structure/closet/secure_closet/security_lbrig/WillContain()
	return list(
		/obj/item/clothing/suit/armor/pcarrier/medium/security,
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
		/obj/item/device/megaphone,
		/obj/item/clothing/gloves/thick,
		/obj/item/device/holowarrant,
		/obj/item/device/flashlight/maglight,
		/obj/item/storage/belt/security,
		/obj/item/material/knife/folding/swiss/sec,
		/obj/item/clothing/accessory/storage/holster/armpit,
		/obj/item/gun/projectile/pistol/military,
		new /datum/atom_creator/weighted(list(/obj/item/storage/backpack/security, /obj/item/storage/backpack/satchel/sec)),
		new /datum/atom_creator/weighted(list(/obj/item/storage/backpack/dufflebag/sec, /obj/item/storage/backpack/messenger/sec))
	)

/obj/structure/closet/secure_closet/bar_lbrig
	name = "bar locker"
	desc = "It's a storage unit for bar equipment."
	req_access = list(access_kitchen)

/obj/structure/closet/secure_closet/bar_torch/WillContain()
	return list(
		/obj/item/clothing/head/soft/black,
		/obj/item/device/radio/headset/headset_service,
		/obj/item/reagent_containers/food/drinks/shaker,
		/obj/item/reagent_containers/food/drinks/shaker,
		/obj/item/glass_jar,
		/obj/item/book/manual/barman_recipes
	)
