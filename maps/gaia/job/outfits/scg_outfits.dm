// JOBS FOR SCG ON GAIA
// Default = Army; Fleet = Armsmen and other deployed/rescued Detachments; Civilain = Loyalist partisans
/singleton/hierarchy/outfit/job/gaia/scg
	name = OUTFIT_JOB_NAME("SCG Gaia Default Outfit")
	hierarchy_type = /singleton/hierarchy/outfit/job/gaia/scg
	l_ear = /obj/item/device/radio/headset/gaia_scg
	r_pocket = null
	pda_type = /obj/item/modular_computer/pda/ert
	id_types = list(/obj/item/card/id/gaia/scg)

	flags = OUTFIT_FLAGS_JOB_DEFAULT | OUTFIT_EXTENDED_SURVIVAL

// -- COMMAND --
// COMMANDING OFFICER
/singleton/hierarchy/outfit/job/gaia/scg/command
	name = OUTFIT_JOB_NAME("SCG Gaia Command Outfit")
	hierarchy_type = /singleton/hierarchy/outfit/job/gaia/scg/command
	l_ear = /obj/item/device/radio/headset/gaia_scg/command
	l_pocket = /obj/item/key/gaia/scg

/singleton/hierarchy/outfit/job/gaia/scg/command/CO
	name = OUTFIT_JOB_NAME("SCG Gaia Commanding Officer")
	uniform = /obj/item/clothing/under/scga/utility/command
	shoes = /obj/item/clothing/shoes/scga/utility
	id_types = list(/obj/item/card/id/gaia/scg/co)

/singleton/hierarchy/outfit/job/gaia/scg/command/CO/New()
	..()
	BACKPACK_OVERRIDE_COMMAND

// PLATOON SERGEANT
/singleton/hierarchy/outfit/job/gaia/scg/command/PS
	name = OUTFIT_JOB_NAME("SCG Gaia Platoon Sergeant")
	uniform = /obj/item/clothing/under/scga/utility/command
	shoes = /obj/item/clothing/shoes/scga/utility
	head = /obj/item/clothing/head/scga/utility/drill
	id_types = list(/obj/item/card/id/gaia/scg/ps)

/singleton/hierarchy/outfit/job/gaia/scg/command/PS/New()
	..()
	BACKPACK_OVERRIDE_COMMAND

/singleton/hierarchy/outfit/job/gaia/scg/command/PS/fleet
	name = OUTFIT_JOB_NAME("SCG Gaia Platoon Sergeant - Fleet")
	uniform = /obj/item/clothing/under/solgov/utility/fleet/combat/command
	shoes = /obj/item/clothing/shoes/dutyboots

// -- SUPPORT STAFF --
// MEDIC
/singleton/hierarchy/outfit/job/gaia/scg/medic
	name = OUTFIT_JOB_NAME("SCG Gaia Medic")
	uniform = /obj/item/clothing/under/scga/utility/medical
	suit = /obj/item/clothing/suit/surgicalapron
	shoes = /obj/item/clothing/shoes/scga/utility
	head = /obj/item/clothing/head/surgery/green
	id_types = list(/obj/item/card/id/gaia/scg/medic)

/singleton/hierarchy/outfit/job/gaia/scg/medic/New()
	..()
	BACKPACK_OVERRIDE_MEDICAL

/singleton/hierarchy/outfit/job/gaia/scg/medic/fleet
	name = OUTFIT_JOB_NAME("SCG Gaia Medic - Fleet")
	uniform = /obj/item/clothing/under/solgov/utility/fleet/combat/medical
	suit = /obj/item/clothing/suit/surgicalapron
	shoes = /obj/item/clothing/shoes/dutyboots
	head = /obj/item/clothing/head/surgery/navyblue

/singleton/hierarchy/outfit/job/gaia/scg/medic/civilain
	name = OUTFIT_JOB_NAME("SCG Gaia Medic - Civilain")
	uniform = /obj/item/clothing/under/rank/medical/scrubs/blue
	suit = /obj/item/clothing/suit/storage/toggle/labcoat
	shoes = /obj/item/clothing/shoes/white

//ENGINEER
/singleton/hierarchy/outfit/job/gaia/scg/engineer
	name = OUTFIT_JOB_NAME("SCG Gaia Engineer")
	uniform = /obj/item/clothing/under/scga/utility/engineering
	shoes = /obj/item/clothing/shoes/scga/utility
	head = /obj/item/clothing/head/hardhat
	id_types = list(/obj/item/card/id/gaia/scg/engineer)

/singleton/hierarchy/outfit/job/gaia/scg/engineer/New()
	..()
	BACKPACK_OVERRIDE_ENGINEERING

/singleton/hierarchy/outfit/job/gaia/scg/engineer/fleet
	name = OUTFIT_JOB_NAME("SCG Gaia Engineer - Fleet")
	uniform = /obj/item/clothing/under/solgov/utility/fleet/combat/engineering
	shoes = /obj/item/clothing/shoes/dutyboots
	head = /obj/item/clothing/head/hardhat

/singleton/hierarchy/outfit/job/gaia/scg/engineer/civilain
	name = OUTFIT_JOB_NAME("SCG Gaia Engineer - Civilain")
	uniform = /obj/item/clothing/under/hazard
	shoes = /obj/item/clothing/shoes/workboots
	head = /obj/item/clothing/head/hardhat/orange

// -- COMBAT (meatshields) --
// SQUAD LEADER
/singleton/hierarchy/outfit/job/gaia/scg/squad_leader
	name = OUTFIT_JOB_NAME("SCG Gaia Squad Leader")
	uniform = /obj/item/clothing/under/scga/utility/security
	shoes = /obj/item/clothing/shoes/scga/utility
	id_types = list(/obj/item/card/id/gaia/scg/squad_leader)

/singleton/hierarchy/outfit/job/gaia/scg/squad_leader/fleet
	name = OUTFIT_JOB_NAME("SCG Gaia Squad Leader - Fleet")
	uniform = /obj/item/clothing/under/solgov/utility/fleet/combat
	shoes = /obj/item/clothing/shoes/dutyboots

// TROOPER
/singleton/hierarchy/outfit/job/gaia/scg/trooper
	name = OUTFIT_JOB_NAME("SCG Gaia Trooper")
	uniform = /obj/item/clothing/under/scga/utility
	shoes = /obj/item/clothing/shoes/scga/utility

/singleton/hierarchy/outfit/job/gaia/scg/trooper/fleet
	name = OUTFIT_JOB_NAME("SCG Gaia Trooper - Fleet")
	uniform = /obj/item/clothing/under/solgov/utility/fleet/combat
	shoes = /obj/item/clothing/shoes/dutyboots

/singleton/hierarchy/outfit/job/gaia/scg/trooper/civilain
	name = OUTFIT_JOB_NAME("SCG Gaia Trooper - Civilain")
	uniform = /obj/item/clothing/under/frontier
	shoes = /obj/item/clothing/shoes/workboots
