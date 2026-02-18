// JOBS FOR ICCG ON GAIA
/singleton/hierarchy/outfit/job/gaia/iccg
	name = OUTFIT_JOB_NAME("ICCG Gaia Default Outfit")
	hierarchy_type = /singleton/hierarchy/outfit/job/gaia/iccg
	l_ear = /obj/item/device/radio/headset/gaia_iccg
	r_pocket = null
	pda_type = /obj/item/modular_computer/pda/syndicate
	id_types = list(/obj/item/card/id/gaia/iccg)

	flags = OUTFIT_FLAGS_JOB_DEFAULT | OUTFIT_EXTENDED_SURVIVAL

// -- COMMAND --
// COMMANDING OFFICER
/singleton/hierarchy/outfit/job/gaia/iccg/command
	name = OUTFIT_JOB_NAME("ICCG Gaia Command Outfit")
	hierarchy_type = /singleton/hierarchy/outfit/job/gaia/iccg/command
	l_pocket = /obj/item/key/gaia/iccg

/singleton/hierarchy/outfit/job/gaia/iccg/command/CO
	name = OUTFIT_JOB_NAME("ICCG Gaia Commanding Officer")
	uniform = /obj/item/clothing/under/iccgn/combat/command
	shoes = /obj/item/clothing/shoes/iccgn/utility
	id_types = list(/obj/item/card/id/gaia/iccg/co)
	backpack_contents = list(/obj/item/melee/telebaton = 1)

/singleton/hierarchy/outfit/job/gaia/iccg/command/CO/New()
	..()
	BACKPACK_OVERRIDE_COMMAND

// PLATOON SERGEANT
/singleton/hierarchy/outfit/job/gaia/iccg/command/XO
	name = OUTFIT_JOB_NAME("ICCG Gaia Executive Officer")
	uniform = /obj/item/clothing/under/iccgn/combat/command
	shoes = /obj/item/clothing/shoes/iccgn/utility
	id_types = list(/obj/item/card/id/gaia/iccg/xo)
	backpack_contents = list(/obj/item/melee/telebaton = 1)

/singleton/hierarchy/outfit/job/gaia/iccg/command/XO/New()
	..()
	BACKPACK_OVERRIDE_COMMAND

// -- SUPPORT STAFF --
// MEDIC
/singleton/hierarchy/outfit/job/gaia/iccg/medic
	name = OUTFIT_JOB_NAME("ICCG Gaia Medic")
	uniform = /obj/item/clothing/under/iccgn/combat/medical
	suit = /obj/item/clothing/suit/storage/toggle/labcoat/dark
	shoes = /obj/item/clothing/shoes/iccgn/utility
	head = /obj/item/clothing/head/soft/scp_cap
	id_types = list(/obj/item/card/id/gaia/iccg/medic)

/singleton/hierarchy/outfit/job/gaia/iccg/medic/pmc
	name = OUTFIT_JOB_NAME("ICCG PMC Gaia Medic")
	uniform = /obj/item/clothing/under/scp_uniform
	suit = /obj/item/clothing/suit/surgicalapron
	shoes = /obj/item/clothing/shoes/jackboots
	backpack_contents = list(/obj/item/clothing/accessory/armor_tag/scp = 1, /obj/item/clothing/accessory/armor/helmcover/scp_cover = 1)

/singleton/hierarchy/outfit/job/gaia/iccg/medic/New()
	..()
	BACKPACK_OVERRIDE_MEDICAL

//ENGINEER
/singleton/hierarchy/outfit/job/gaia/iccg/engineer
	name = OUTFIT_JOB_NAME("ICCG Gaia Engineer")
	uniform = /obj/item/clothing/under/iccgn/combat/engineering
	shoes = /obj/item/clothing/shoes/iccgn/utility
	head = /obj/item/clothing/head/hardhat/red
	id_types = list(/obj/item/card/id/gaia/iccg/engineer)

/singleton/hierarchy/outfit/job/gaia/iccg/engineer/pmc
	name = OUTFIT_JOB_NAME("ICCG PMC Gaia Engineer")
	uniform = /obj/item/clothing/under/scp_uniform
	shoes = /obj/item/clothing/shoes/jackboots
	head = /obj/item/clothing/head/soft/scp_cap
	backpack_contents = list(/obj/item/clothing/accessory/armor_tag/scp = 1, /obj/item/clothing/accessory/armor/helmcover/scp_cover = 1)

/singleton/hierarchy/outfit/job/gaia/iccg/engineer/New()
	..()
	BACKPACK_OVERRIDE_ENGINEERING

// MILITARY POLICE
/singleton/hierarchy/outfit/job/gaia/iccg/mp
	name = OUTFIT_JOB_NAME("ICCG Gaia Military Police")
	uniform = /obj/item/clothing/under/iccgn/combat/security
	shoes = /obj/item/clothing/shoes/iccgn/utility
	l_pocket = /obj/item/handcuffs
	r_pocket = /obj/item/device/flash
	id_types = list(/obj/item/card/id/gaia/iccg/mp)
	backpack_contents = list(/obj/item/clothing/accessory/armband/solgov/mp = 1, /obj/item/key/gaia/iccg = 1)

/singleton/hierarchy/outfit/job/gaia/iccg/mp/New()
	..()
	BACKPACK_OVERRIDE_SECURITY

// -- COMBAT (meatshields) --
// SQUAD LEADER
/singleton/hierarchy/outfit/job/gaia/iccg/squad_leader
	name = OUTFIT_JOB_NAME("ICCG Gaia Squad Leader")
	uniform = /obj/item/clothing/under/iccgn/combat/command
	shoes = /obj/item/clothing/shoes/iccgn/utility
	id_types = list(/obj/item/card/id/gaia/iccg/squad_leader)

// TROOPER
/singleton/hierarchy/outfit/job/gaia/iccg/trooper
	name = OUTFIT_JOB_NAME("ICCG Gaia Trooper")
	uniform = /obj/item/clothing/under/iccgn/combat
	shoes = /obj/item/clothing/shoes/iccgn/utility

/singleton/hierarchy/outfit/job/gaia/iccg/trooper/pmc
	name = OUTFIT_JOB_NAME("ICCG PMC Gaia Trooper")
	uniform = /obj/item/clothing/under/scp_uniform
	shoes = /obj/item/clothing/shoes/jackboots
	head = /obj/item/clothing/head/soft/scp_cap
	backpack_contents = list(/obj/item/clothing/accessory/armor_tag/scp = 1, /obj/item/clothing/accessory/armor/helmcover/scp_cover = 1)
