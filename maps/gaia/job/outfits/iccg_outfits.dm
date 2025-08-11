// JOBS FOR ICCG ON GAIA
/singleton/hierarchy/outfit/job/gaia/iccg
	name = OUTFIT_JOB_NAME("ICCG Gaia Default Outfit")
	hierarchy_type = /singleton/hierarchy/outfit/job/gaia/iccg
	l_ear = /obj/item/device/radio/headset/gaia_iccg
	pda_type = /obj/item/modular_computer/pda

// -- COMMAND --
// COMMANDING OFFICER
/singleton/hierarchy/outfit/job/gaia/iccg/command
	name = OUTFIT_JOB_NAME("ICCG Gaia Command Outfit")
	hierarchy_type = /singleton/hierarchy/outfit/job/gaia/iccg/command
	l_pocket = /obj/item/key/gaia/iccg

/singleton/hierarchy/outfit/job/gaia/iccg/command/CO
	name = OUTFIT_JOB_NAME("ICCG Gaia Commanding Officer")
	uniform = /obj/item/clothing/under/iccgn/service_command
	shoes = /obj/item/clothing/shoes/iccgn/service
	head = /obj/item/clothing/head/iccgn/service_command
	id_types = list(/obj/item/card/id/torch/gold)
	pda_type = /obj/item/modular_computer/pda/captain
	backpack_contents = list(/obj/item/clothing/accessory/solgov/department/command/fleet = 1)

/singleton/hierarchy/outfit/job/gaia/iccg/command/CO/New()
	..()
	BACKPACK_OVERRIDE_COMMAND

// PLATOON SERGEANT
/singleton/hierarchy/outfit/job/gaia/iccg/command/XO
	name = OUTFIT_JOB_NAME("ICCG Gaia Executive Officer")
	uniform = /obj/item/clothing/under/iccgn/utility
	shoes = /obj/item/clothing/shoes/iccgn/utility
	head = /obj/item/clothing/head/iccgn/beret
	id_types = list(/obj/item/card/id/torch/silver)
	pda_type = /obj/item/modular_computer/pda/heads/hop
	backpack_contents = list(/obj/item/clothing/accessory/solgov/department/command/fleet = 1)

/singleton/hierarchy/outfit/job/gaia/iccg/command/XO/New()
	..()
	BACKPACK_OVERRIDE_COMMAND

// -- SUPPORT STAFF --
// MEDIC
/singleton/hierarchy/outfit/job/gaia/iccg/medic
	name = OUTFIT_JOB_NAME("ICCG Gaia Medic")
	uniform = /obj/item/clothing/under/iccgn/utility
	suit = /obj/item/clothing/suit/storage/toggle/labcoat/dark
	shoes = /obj/item/clothing/shoes/iccgn/utility
	head = /obj/item/clothing/head/surgery/black
	backpack_contents = list(/obj/item/clothing/accessory/solgov/department/medical/fleet = 1)

/singleton/hierarchy/outfit/job/gaia/iccg/medic/New()
	..()
	BACKPACK_OVERRIDE_MEDICAL

//ENGINEER
/singleton/hierarchy/outfit/job/gaia/iccg/engineer
	name = OUTFIT_JOB_NAME("ICCG Gaia Engineer")
	uniform = /obj/item/clothing/under/iccgn/utility
	shoes = /obj/item/clothing/shoes/iccgn/utility
	head = /obj/item/clothing/head/hardhat/red
	backpack_contents = list(/obj/item/clothing/accessory/solgov/department/engineering/fleet = 1)

/singleton/hierarchy/outfit/job/gaia/iccg/engineer/New()
	..()
	BACKPACK_OVERRIDE_ENGINEERING

// MILITARY POLICE
/singleton/hierarchy/outfit/job/gaia/iccg/mp
	name = OUTFIT_JOB_NAME("ICCG Gaia Military Police")
	uniform = /obj/item/clothing/under/iccgn/service
	suit = /obj/item/clothing/suit/iccgn/service_enlisted
	shoes = /obj/item/clothing/shoes/iccgn/service
	head = /obj/item/clothing/head/iccgn/service
	l_pocket = /obj/item/handcuffs
	r_pocket = /obj/item/device/flash
	backpack_contents = list(/obj/item/clothing/accessory/armband/solgov/mp = 1, /obj/item/key/gaia/iccg = 1, /obj/item/clothing/accessory/solgov/department/security/fleet = 1)

/singleton/hierarchy/outfit/job/gaia/iccg/mp/New()
	..()
	BACKPACK_OVERRIDE_SECURITY

// -- COMBAT (meatshields) --
// SQUAD LEADER
/singleton/hierarchy/outfit/job/gaia/iccg/squad_leader
	name = OUTFIT_JOB_NAME("ICCG Gaia Squad Leader")
	uniform = /obj/item/clothing/under/iccgn/utility
	shoes = /obj/item/clothing/shoes/iccgn/utility
	head = /obj/item/clothing/head/iccgn/beret

// TROOPER
/singleton/hierarchy/outfit/job/gaia/iccg/trooper
	name = OUTFIT_JOB_NAME("ICCG Gaia Trooper")
	uniform = /obj/item/clothing/under/iccgn/utility
	shoes = /obj/item/clothing/shoes/iccgn/utility
