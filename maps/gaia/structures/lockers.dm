// ADMIN
/obj/structure/closet/secure_closet/gaia/scg_montgomery
	name = "Colonel Montogomery's locker"
	closet_appearance = /singleton/closet_appearance/secure_closet/command

/obj/structure/closet/secure_closet/gaia/scg_montgomery/WillContain()
	return list(
		/obj/item/storage/backpack/satchel/leather/khaki,
		/obj/item/screwdriver,
		/obj/item/clothing/glasses/aviators_black,
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

/obj/structure/closet/secure_closet/gaia/iccg_alistratova
	name = "Kapitan Alistratova's locker"
	closet_appearance = /singleton/closet_appearance/secure_closet/command

/obj/structure/closet/secure_closet/gaia/iccg_alistratova/WillContain()
	return list(
		/obj/item/storage/backpack/satchel/leather/black,
		/obj/item/screwdriver,
		/obj/item/clothing/glasses/eyepatch/hud/security,
		/obj/item/clothing/suit/iccgn/dress_command,
		/obj/item/clothing/head/iccgn/service_command,
		/obj/item/clothing/under/iccgn/service_command,
		/obj/item/clothing/shoes/iccgn/service,
		/obj/item/clothing/accessory/iccgn_rank/of6,
		/obj/item/clothing/accessory/iccgn_badge/officer,
		/obj/item/clothing/accessory/iccgn_patch/surface,
		/obj/item/clothing/accessory/medal/iron,
		/obj/item/clothing/accessory/armband,
		/obj/item/clothing/accessory/storage/holster/armpit,
		/obj/item/device/radio/headset/specops,
		/obj/item/gun/projectile/pistol/magnum_pistol,
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
		/obj/item/clothing/accessory/storage/webbing_large,
		/obj/item/clothing/glasses/sunglasses,
		/obj/item/storage/firstaid/small_combat,
		/obj/item/device/radio/off/gaia_scg,
		/obj/item/device/flashlight/maglight,
		/obj/item/device/megaphone,
		/obj/item/device/binoculars/x4,
		/obj/item/device/gps/scg,
		/obj/item/melee/baton/telebaton,
		/obj/item/solbanner,
		/obj/random/cash,
		/obj/item/material/knife/folding/swiss/officer,
		/obj/item/storage/mre/random,
	)

/obj/structure/closet/secure_closet/gaia/scg_sergeant
	name = "personal 'platoon sergeant' closet"
	desc = "It's a secure locker for personnel. There is a hastly written note on it: 'For the Platoon Sergeant'"
	req_access = list(access_hop)

/obj/structure/closet/secure_closet/gaia/scg_sergeant/WillContain()
	return list(
		new/datum/atom_creator/weighted(list(/obj/item/storage/backpack/command, /obj/item/storage/backpack/satchel/com)),
		new/datum/atom_creator/simple(/obj/item/storage/backpack/dufflebag/com, 50),
		/obj/item/clothing/accessory/badge/solgov/tags,
		/obj/item/clothing/accessory/storage/webbing_large,
		/obj/item/clothing/glasses/aviators_black,
		/obj/item/clothing/shoes/laceup,
		/obj/item/storage/firstaid/small_combat,
		/obj/item/device/radio/off/gaia_scg,
		/obj/item/device/flashlight/maglight,
		/obj/item/device/megaphone,
		/obj/item/device/binoculars/x4,
		/obj/item/device/gps/scg,
		/obj/item/melee/baton/telebaton,
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
		new/datum/atom_creator/simple(/obj/item/soap/random, 30),
		new/datum/atom_creator/simple(/obj/item/towel/random, 50),
		new/datum/atom_creator/simple(/obj/item/reagent_containers/spray/cleaner/deodorant, 30),
		new/datum/atom_creator/simple(/obj/random/smokes, 30),
		new/datum/atom_creator/simple(/obj/item/reagent_containers/food/snacks/donut/jelly, 1), // "WHAT THE FUCK IS THAT?"
		/obj/item/clothing/accessory/badge/solgov/tags,
		/obj/item/clothing/accessory/storage/webbing_large,
		/obj/item/clothing/glasses/ballistic,
		/obj/item/clothing/gloves/thick/duty,
		/obj/item/storage/firstaid/small_combat,
		/obj/item/device/binoculars,
		/obj/item/device/gps/scg,
		/obj/item/cell/device/high,
		/obj/item/device/radio/off/gaia_scg,
		/obj/item/device/flashlight/maglight,
		/obj/item/crowbar/prybar,
		/obj/item/storage/mre/random,
	)

/obj/structure/closet/crate/gaia/scg_foot/officer
	name = "officer's foot crate"
	desc = "A rectangular steel crate for keeping officer's personal belongings."

/obj/structure/closet/crate/gaia/scg_foot/officer/WillContain()
	return list(
		new/datum/atom_creator/weighted(list(/obj/item/storage/backpack/satchel/leather/black, /obj/item/storage/backpack/satchel/leather/navy, /obj/item/storage/backpack/satchel/leather/khaki)),
		new/datum/atom_creator/simple(/obj/item/soap/random, 70),
		new/datum/atom_creator/simple(/obj/item/towel/random, 90),
		new/datum/atom_creator/simple(/obj/item/haircomb, 70),
		new/datum/atom_creator/simple(/obj/random/cash, 70),
		new/datum/atom_creator/simple(/obj/item/reagent_containers/spray/cleaner/deodorant, 50),
		new/datum/atom_creator/simple(/obj/random/smokes, 50),
		/obj/item/clothing/accessory/badge/solgov/tags,
		/obj/item/clothing/accessory/storage/webbing_large,
		/obj/item/clothing/glasses/ballistic,
		/obj/item/storage/firstaid/small_combat,
		/obj/item/cell/device/high,
		/obj/item/device/radio/off/gaia_scg,
		/obj/item/device/flashlight/maglight,
		/obj/item/device/megaphone,
		/obj/item/device/binoculars/x2,
		/obj/item/device/gps/scg,
		/obj/item/crowbar/prybar,
		/obj/item/material/knife/folding/swiss/officer,
		/obj/item/storage/mre/random,
	)

// INDEPENDENT COLONIAL CONFEDERATION OF GILGAMESH
/obj/structure/closet/secure_closet/gaia/iccg_commander
	name = "'komandir vzvoda' closet"
	desc = "It's a secure locker for the ICCG commander."
	req_access = list(access_iccg_com_cap)

/obj/structure/closet/secure_closet/gaia/iccg_commander/WillContain()
	return list(
		new/datum/atom_creator/weighted(list(/obj/item/storage/backpack/command, /obj/item/storage/backpack/satchel/com)),
		new/datum/atom_creator/simple(/obj/item/storage/backpack/dufflebag/com, 50),
		/obj/item/clothing/accessory/badge/dog_tags,
		/obj/item/clothing/accessory/storage/webbing_large,
		/obj/item/storage/firstaid/small_combat,
		/obj/item/device/radio/off/gaia_scg,
		/obj/item/device/flashlight/maglight,
		/obj/item/device/megaphone,
		/obj/item/device/binoculars/x4,
		/obj/item/device/gps/iccg,
		/obj/item/melee/baton/telebaton,
//		/obj/item/solbanner, TODO: make a custom ICCG one
		/obj/random/cash,
		/obj/item/material/knife/folding/swiss/loot,
		/obj/item/reagent_containers/food/snacks/liquidfood,
	)

/obj/structure/closet/secure_closet/gaia/iccg_xo
	name = "'nachalnik shtaba' closet"
	desc = "It's a secure locker for the ICCG second-in-command."
	req_access = list(access_iccg_com_xo)

/obj/structure/closet/secure_closet/gaia/iccg_xo/WillContain()
	return list(
		new/datum/atom_creator/weighted(list(/obj/item/storage/backpack/command, /obj/item/storage/backpack/satchel/com)),
		new/datum/atom_creator/simple(/obj/item/storage/backpack/dufflebag/com, 50),
		/obj/item/clothing/accessory/badge/dog_tags,
		/obj/item/clothing/accessory/storage/webbing_large,
		/obj/item/clothing/glasses/aviators_black,
		/obj/item/storage/firstaid/small_combat,
		/obj/item/device/radio/off/gaia_iccg,
		/obj/item/device/flashlight/maglight,
		/obj/item/device/megaphone,
		/obj/item/device/binoculars/x4,
		/obj/item/device/gps/iccg,
		/obj/item/melee/baton/telebaton,
		/obj/random/cash,
		/obj/item/material/knife/folding/swiss/loot,
		/obj/item/reagent_containers/food/snacks/liquidfood,
	)

/obj/structure/closet/gaia/iccg_soldier
	name = "'lichnii sostav' closet"
	desc = "A rectangular steel crate for keeping soldier's personal belongings."

/obj/structure/closet/gaia/iccg_soldier/WillContain()
	return list(
		/obj/item/storage/backpack/rucksack,
		/obj/item/clothing/accessory/badge/dog_tags,
		/obj/item/clothing/accessory/storage/webbing_large,
		/obj/item/clothing/glasses/ballistic,
		/obj/item/storage/firstaid/small_combat,
		/obj/item/device/binoculars,
		/obj/item/device/gps/iccg,
		/obj/item/cell/device/high,
		/obj/item/device/radio/off/gaia_iccg,
		/obj/item/device/flashlight/maglight,
		/obj/item/crowbar/prybar,
		/obj/item/reagent_containers/food/snacks/liquidfood,
	)

/obj/structure/closet/gaia/iccg_officer
	name = "'officerski sostav' closet"
	desc = "A rectangular steel crate for keeping officer's personal belongings."

/obj/structure/closet/gaia/iccg_officer/WillContain()
	return list(
		/obj/item/storage/backpack/satchel/pocketbook/gray,
		/obj/item/clothing/accessory/badge/dog_tags,
		/obj/item/clothing/accessory/storage/webbing_large,
		/obj/item/clothing/glasses/ballistic,
		/obj/item/storage/firstaid/small_combat,
		/obj/item/cell/device/high,
		/obj/item/device/radio/off/gaia_iccg,
		/obj/item/device/flashlight/maglight,
		/obj/item/device/megaphone,
		/obj/item/device/binoculars/x2,
		/obj/item/device/gps/iccg,
		/obj/item/crowbar/prybar,
		/obj/item/material/knife/folding/swiss/loot,
		/obj/item/reagent_containers/food/snacks/liquidfood,
	)

// CIVVIES
/obj/structure/closet/secure_closet/gaia/mayor
	name = "mayor's locker"
	req_access = list(access_captain)
	closet_appearance = /singleton/closet_appearance/secure_closet/mayor

/obj/structure/closet/secure_closet/gaia/mayor/WillContain()
	return list(
		new/datum/atom_creator/weighted(list(/obj/item/storage/backpack/command, /obj/item/storage/backpack/satchel/com)),
		new/datum/atom_creator/simple(/obj/item/storage/backpack/dufflebag/com, 50),
		/obj/item/device/radio/headset/heads/captain,
		/obj/item/storage/belt/general,
		/obj/item/melee/baton/telebaton,
		/obj/item/gun/energy/confuseray,
		/obj/item/device/holowarrant,
		/obj/item/folder,
		/obj/item/material/clipboard/ebony,
		/obj/item/modular_computer/tablet/lease/preset/command,
		/obj/item/pen/multi/cmd,
		/obj/item/pen/fancy,
		/obj/item/clothing/head/helmet/ballistic,
		/obj/item/clothing/suit/armor/bulletproof/vest,
		/obj/item/clothing/accessory/armor_plate/sneaky/tactical,
		/obj/item/clothing/glasses/sunglasses/big,
		/obj/item/clothing/head/that,
		/obj/item/clothing/suit/storage/toggle/longjacket,
		/obj/item/clothing/under/suit_jacket,
		/obj/item/clothing/shoes/laceup,
		/obj/item/storage/briefcase,
		/obj/item/storage/secure/briefcase,
	)

/obj/structure/closet/secure_closet/gaia/police
	name = "police officer's locker"
	req_access = list(access_security)
	closet_appearance = /singleton/closet_appearance/secure_closet/police

/obj/structure/closet/secure_closet/gaia/police/WillContain()
	return list(
		new/datum/atom_creator/weighted(list(/obj/item/storage/backpack/command, /obj/item/storage/backpack/satchel/com)),
		new/datum/atom_creator/simple(/obj/item/storage/backpack/dufflebag/com, 50),
		/obj/item/device/radio/headset/headset_sec,
		/obj/item/storage/belt/holster/security,
		/obj/item/storage/belt/security,
		/obj/item/crowbar/prybar,
		/obj/item/device/flash,
		/obj/item/reagent_containers/spray/pepper,
		/obj/item/grenade/chem_grenade/teargas,
		/obj/item/melee/baton/telebaton,
		/obj/item/clothing/glasses/hud/security/prot/aviators,
		/obj/item/taperoll/police,
		/obj/item/device/hailer,
		/obj/item/device/megaphone,
		/obj/item/device/holowarrant,
		/obj/item/gun/energy/taser,
		/obj/item/clothing/accessory/storage/black_vest,
		/obj/item/clothing/head/gaiacop,
		/obj/item/clothing/under/gaiacop,
		/obj/item/clothing/shoes/leather,
		/obj/item/storage/firstaid/light,
	)

/obj/structure/closet/secure_closet/gaia/firefighter
	name = "firefighter's locker"
	req_access = list(access_atmospherics)
	closet_appearance = /singleton/closet_appearance/secure_closet/firefighter

/obj/structure/closet/secure_closet/gaia/firefighter/WillContain()
	return list(
		new/datum/atom_creator/weighted(list(/obj/item/storage/backpack/industrial, /obj/item/storage/backpack/satchel/eng)),
		new/datum/atom_creator/simple(/obj/item/storage/backpack/dufflebag/eng, 50),
		/obj/item/device/radio/headset/headset_eng,
		/obj/item/storage/belt/utility/atmostech,
		/obj/item/storage/belt/fire_belt/full,
		/obj/item/storage/belt/medical/emt,
		/obj/item/grenade/chem_grenade/water,
		/obj/item/grenade/chem_grenade/water,
		/obj/item/clothing/glasses/hud/health/goggle,
		/obj/item/clothing/accessory/storage/webbing_large,
		/obj/item/taperoll/atmos,
		/obj/item/clothing/head/hardhat/firefighter,
		/obj/item/clothing/mask/gas,
		/obj/item/clothing/suit/fire/firefighter,
		/obj/item/clothing/gloves/fire,
		/obj/item/clothing/accessory/fire_overpants,
		/obj/item/clothing/shoes/workboots,
		/obj/item/clothing/under/color/red/firefighter,
		/obj/item/device/flashlight/upgraded,
		/obj/item/extinguisher,
		/obj/item/storage/firstaid/light,
	)

/obj/structure/closet/secure_closet/gaia/worker
	name = "municipal engineer's locker"
	req_access = list(access_engine_equip)
	closet_appearance = /singleton/closet_appearance/secure_closet/worker

/obj/structure/closet/secure_closet/gaia/worker/WillContain()
	return list(
		new/datum/atom_creator/weighted(list(/obj/item/clothing/accessory/storage/brown_vest = 70, /obj/item/clothing/accessory/storage/webbing = 30)),
		new/datum/atom_creator/weighted(list(/obj/item/storage/backpack/industrial, /obj/item/storage/backpack/satchel/eng)),
		new/datum/atom_creator/simple(/obj/item/storage/backpack/dufflebag/eng, 50),
		/obj/item/device/radio/headset/headset_eng,
		/obj/item/storage/belt/utility,
		/obj/item/device/multitool,
		/obj/item/device/multitool/multimeter,
		/obj/item/storage/toolbox/mechanical,
		/obj/item/storage/toolbox/electrical,
		/obj/item/clothing/gloves/thick,
		/obj/item/clothing/gloves/insulated,
		/obj/item/clothing/head/hardhat/orange,
		/obj/item/clothing/head/hardhat,
		/obj/item/clothing/suit/storage/hazardvest,
		/obj/item/clothing/mask/gas,
		/obj/item/clothing/glasses/meson,
		/obj/item/clothing/shoes/workboots,
		/obj/item/clothing/under/hazard,
		/obj/item/taperoll/engineering,
	)

/obj/structure/closet/secure_closet/gaia/paramedic
	name = "paramedic locker"
	desc = "Supplies for a first responder."
	closet_appearance = /singleton/closet_appearance/secure_closet/medical
	req_access = list(access_medical_equip)

/obj/structure/closet/secure_closet/gaia/paramedic/WillContain()
	return list(
		/obj/item/device/radio/headset/headset_med,
		/obj/item/storage/box/autoinjectors,
		/obj/item/storage/box/syringes,
		/obj/item/reagent_containers/glass/bottle/inaprovaline,
		/obj/item/reagent_containers/glass/bottle/antitoxin,
		/obj/item/storage/belt/medical/emt,
		/obj/item/clothing/mask/gas,
		/obj/item/clothing/head/hardhat/light/medic,
		/obj/item/clothing/suit/storage/hazardvest/med,
		/obj/item/clothing/suit/storage/toggle/fr_jacket,
		/obj/item/clothing/suit/storage/toggle/labcoat,
		/obj/item/device/flashlight,
		/obj/item/tank/oxygen_emergency_extended,
		/obj/item/clothing/glasses/hud/health,
		/obj/item/device/scanner/health,
		/obj/random/medical,
		/obj/item/crowbar,
		/obj/item/extinguisher/mini,
		/obj/item/storage/box/freezer,
		/obj/item/clothing/accessory/storage/white_vest,
	)
