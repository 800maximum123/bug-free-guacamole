// ADMIN
/obj/structure/closet/secure_closet/gaia/scg_montgomery
	name = "colonel's locker"
	req_access = list(access_cent_captain)
	closet_appearance = /singleton/closet_appearance/secure_closet/command

/obj/structure/closet/secure_closet/gaia/scg_montgomery/WillContain()
	return list(
		/obj/item/storage/backpack/satchel/leather/khaki,
		/obj/item/clothing/suit/scga/service_officer,
		/obj/item/clothing/head/scga/beret/firstinf,
		/obj/item/clothing/under/scga/service_command,
		/obj/item/clothing/shoes/laceup,
		/obj/item/clothing/accessory/scga_rank/o6,
		/obj/item/clothing/accessory/scga_badge/officer,
		/obj/item/clothing/accessory/medal/solgov/civ/service,
		/obj/item/clothing/accessory/black,
		/obj/item/clothing/accessory/storage/holster/armpit,
		/obj/item/device/radio/headset/specops,
		/obj/item/gun/projectile/revolver,
	)

// SOLAR CENTRAL GOVERNMENT
/obj/structure/closet/secure_closet/gaia/scg_commander
	name = "personal 'commander' closet"
	desc = "It's a secure locker for personnel. There is a hastly written note on it: 'For the Commander'"
	req_access = list(access_captain)

/obj/structure/closet/secure_closet/gaia/scg_commander/WillContain()
	return list(
		new/datum/atom_creator/weighted(list(/obj/item/storage/backpack/command, /obj/item/storage/backpack/satchel/com)),
		new/datum/atom_creator/simple(/obj/item/storage/backpack/dufflebag/com, 50),
		/obj/item/clothing/accessory/badge/solgov/tags,
		/obj/item/clothing/suit/scga/service_officer,
		/obj/item/clothing/under/scga/service_command,
		/obj/item/clothing/head/scga/service/wheel_command,
		/obj/item/clothing/glasses/sunglasses,
		/obj/item/clothing/shoes/laceup,
		/obj/item/clothing/suit/armor/pcarrier/medium/sol,
		/obj/item/clothing/head/helmet/solgov/command,
		/obj/item/device/radio/off/gaia_scg,
		/obj/item/device/flashlight/maglight,
		/obj/item/device/megaphone,
		/obj/item/device/binoculars/nvg,
		/obj/item/melee/telebaton,
		/obj/item/solbanner,
		/obj/random/cash,
		/obj/item/material/knife/folding/swiss/officer,
		/obj/item/storage/mre/random,
	)

/obj/structure/closet/secure_closet/gaia/scg_sergeant
	name = "personal 'platoon sergeant' closet"
	desc = "It's a secure locker for personnel. There is a hastly written note on it: 'For the Platoon Sergeant'"
	req_access = list(access_hop)

/obj/structure/closet/secure_closet/gaia/scg_commander/WillContain()
	return list(
		new/datum/atom_creator/weighted(list(/obj/item/storage/backpack/command, /obj/item/storage/backpack/satchel/com)),
		new/datum/atom_creator/simple(/obj/item/storage/backpack/dufflebag/com, 50),
		/obj/item/clothing/accessory/badge/solgov/tags,
		/obj/item/clothing/suit/scga/service_officer,
		/obj/item/clothing/under/scga/service_command,
		/obj/item/clothing/head/scga/service/wheel_command,
		/obj/item/clothing/glasses/aviators_black,
		/obj/item/clothing/shoes/laceup,
		/obj/item/clothing/suit/armor/pcarrier/medium/sol,
		/obj/item/clothing/head/helmet/solgov/command,
		/obj/item/device/radio/off/gaia_scg,
		/obj/item/device/flashlight/maglight,
		/obj/item/device/megaphone,
		/obj/item/device/binoculars/nvg,
		/obj/item/melee/telebaton,
		/obj/random/cash,
		/obj/item/material/knife/folding/swiss/officer,
		/obj/item/storage/mre/random,
	)

/obj/structure/closet/crate/gaia/scg_foot
	name = "foot crate"
	desc = "A rectangular steel crate for keeping soldier's personal belongings."

/obj/structure/closet/crate/gaia/scg_foot/WillContain()
	return list(
		new/datum/atom_creator/weighted(list(/obj/item/storage/backpack/rucksack, /obj/item/storage/backpack/rucksack/tan, /obj/item/storage/backpack/rucksack/green)),
		new/datum/atom_creator/weighted(list(
			/obj/item/clothing/under/solgov/utility/fleet,
			/obj/item/clothing/under/solgov/utility/fleet/polopants,
			/obj/item/clothing/under/solgov/utility/fleet/combat,
			/obj/item/clothing/under/scga/utility,
			/obj/item/clothing/under/scga/utility/urban,
			/obj/item/clothing/under/scga/utility/tan,
			/obj/item/clothing/under/gray_camo,
			/obj/item/clothing/under/syndicate,
			)),
		new/datum/atom_creator/simple(/obj/item/soap/random, 30),
		new/datum/atom_creator/simple(/obj/item/towel/random, 50),
		new/datum/atom_creator/simple(/obj/item/reagent_containers/spray/cleaner/deodorant, 30),
		new/datum/atom_creator/simple(/obj/item/storage/fancy/smokable/luckystars, 30),
		new/datum/atom_creator/simple(/obj/item/reagent_containers/food/snacks/donut/jelly, 1), // "WHAT THE FUCK IS THAT?"
		/obj/item/clothing/accessory/badge/solgov/tags,
		/obj/item/clothing/glasses/ballistic,
		/obj/item/clothing/gloves/thick/duty,
		/obj/item/clothing/shoes/dutyboots,
		/obj/item/storage/firstaid/individual/military,
		/obj/item/cell/device/high,
		/obj/item/device/radio/off/gaia_scg,
		/obj/item/device/flashlight/maglight,
		/obj/item/crowbar/prybar,
		/obj/item/reagent_containers/food/snacks/liquidfood,
	)

/obj/structure/closet/crate/gaia/scg_foot/officer
	name = "officer's foot crate"
	desc = "A rectangular steel crate for keeping officer's personal belongings."

/obj/structure/closet/crate/gaia/scg_foot/officer/WillContain()
	return list(
		new/datum/atom_creator/weighted(list(/obj/item/storage/backpack/satchel/leather/black, /obj/item/storage/backpack/satchel/leather/navy, /obj/item/storage/backpack/satchel/leather/khaki)),
		new/datum/atom_creator/weighted(list(
			/obj/item/clothing/under/solgov/service/fleet,
			/obj/item/clothing/under/scga/service_command,
			)),
		new/datum/atom_creator/simple(/obj/item/soap/random, 70),
		new/datum/atom_creator/simple(/obj/item/towel/random, 90),
		new/datum/atom_creator/simple(/obj/item/haircomb, 70),
		new/datum/atom_creator/simple(/obj/random/cash, 70),
		new/datum/atom_creator/simple(/obj/item/reagent_containers/spray/cleaner/deodorant, 50),
		new/datum/atom_creator/simple(/obj/item/storage/fancy/smokable/luckystars, 50),
		new/datum/atom_creator/simple(/obj/item/material/sword/replica/officersword, 30),
		/obj/item/clothing/accessory/badge/solgov/tags,
		/obj/item/clothing/glasses/sunglasses/big,
		/obj/item/clothing/shoes/laceup,
		/obj/item/storage/firstaid/individual/military,
		/obj/item/cell/device/high,
		/obj/item/cell/device/high,
		/obj/item/device/radio/off/gaia_scg,
		/obj/item/device/flashlight/maglight,
		/obj/item/device/megaphone,
		/obj/item/device/binoculars/random,
		/obj/item/device/gps,
		/obj/item/crowbar/prybar,
		/obj/item/material/knife/folding/swiss/officer,
		/obj/item/storage/mre/random,
	)
