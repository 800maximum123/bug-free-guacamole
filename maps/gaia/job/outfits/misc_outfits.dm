/singleton/hierarchy/outfit/job/gaia
	name = OUTFIT_JOB_NAME("Gaian Outfit")
	hierarchy_type = /singleton/hierarchy/outfit/job/gaia
	uniform = /obj/item/clothing/under/color/grey
	r_pocket = /obj/item/device/radio
	id_types = list(/obj/item/card/id/gaia)

	flags = OUTFIT_FLAGS_JOB_DEFAULT | OUTFIT_ADJUSTMENT_SKIP_SURVIVAL_GEAR

// CITIZEN
/singleton/hierarchy/outfit/job/gaia/citizen
	name = OUTFIT_JOB_NAME("Gaian Citizen")

/singleton/hierarchy/outfit/job/gaia/homeless
	name = OUTFIT_JOB_NAME("Gaian Homeless")
	id_types = null // No ID lol
	pda_type = null

// MAYOR
/singleton/hierarchy/outfit/job/gaia/mayor
	name = OUTFIT_JOB_NAME("Gaian Mayor")
	uniform = /obj/item/clothing/under/suit_jacket/navy
	shoes = /obj/item/clothing/shoes/laceup
	glasses = /obj/item/clothing/glasses/monocle
	l_ear = /obj/item/device/radio/headset/heads/captain
	l_pocket = /obj/item/device/megaphone
	id_types = list(/obj/item/card/id/gaia/mayor)
	backpack_contents = list(/obj/item/melee/baton/telebaton = 1, /obj/item/storage/keychain/mayor = 1)

// POLICE
/singleton/hierarchy/outfit/job/gaia/police
	name = OUTFIT_JOB_NAME("Gaian Police Officer")
	uniform = /obj/item/clothing/under/gaiacop/towner
	shoes = /obj/item/clothing/shoes/leather
	head = /obj/item/clothing/head/gaiacop
	id_types = list(/obj/item/card/id/gaia/cop)
	l_ear = /obj/item/device/radio/headset/headset_sec
	l_pocket = /obj/item/device/flash
	r_pocket = /obj/item/handcuffs
	backpack_contents = list(/obj/item/device/radio = 1, /obj/item/key/gaia/police = 1)

// FIREFIGHTER
/singleton/hierarchy/outfit/job/gaia/firefighter
	name = OUTFIT_JOB_NAME("Gaian Firefighter")
	uniform = /obj/item/clothing/under/color/red/firefighter
	shoes = /obj/item/clothing/shoes/workboots
	id_types = list(/obj/item/card/id/gaia/firefighter)
	l_ear = /obj/item/device/radio/headset/headset_eng
	backpack_contents = list(/obj/item/device/radio = 1, /obj/item/extinguisher/mini = 1, /obj/item/key/gaia/firefighter = 1)

// MEDICAL
/singleton/hierarchy/outfit/job/gaia/paramedic
	name = OUTFIT_JOB_NAME("Gaian Paramedic")
	uniform = /obj/item/clothing/under/rank/medical/scrubs/blue
	shoes = /obj/item/clothing/shoes/white
	gloves = /obj/item/clothing/gloves/latex
	id_types = list(/obj/item/card/id/gaia/paramedic)
	l_ear = /obj/item/device/radio/headset/headset_med
	l_pocket = /obj/item/device/scanner/health
	l_hand = /obj/item/storage/firstaid/stab
	backpack_contents = list(/obj/item/device/radio = 1, /obj/item/key/gaia/medical = 1)

/singleton/hierarchy/outfit/job/gaia/doctor
	name = OUTFIT_JOB_NAME("Gaian Doctor")
	uniform = /obj/item/clothing/under/rank/medical
	shoes = /obj/item/clothing/shoes/white
	gloves = /obj/item/clothing/gloves/latex/nitrile
	id_types = list(/obj/item/card/id/gaia/paramedic)
	l_ear = /obj/item/device/radio/headset/headset_med
	l_pocket = /obj/item/device/scanner/health
	l_hand = /obj/item/storage/firstaid/stab
	backpack_contents = list(/obj/item/device/radio = 1, /obj/item/key/gaia/medical = 1)

// WORKER
/singleton/hierarchy/outfit/job/gaia/worker
	name = OUTFIT_JOB_NAME("Gaian Construction Worker")
	uniform = /obj/item/clothing/under/hazard
	shoes = /obj/item/clothing/shoes/workboots
	head = /obj/item/clothing/head/hardhat
	belt = /obj/item/storage/belt/utility/full
	id_types = list(/obj/item/card/id/gaia/worker)
	l_ear = /obj/item/device/radio/headset/headset_eng
	backpack_contents = list(/obj/item/device/radio = 1, /obj/item/key/gaia/engineering = 1)

/singleton/hierarchy/outfit/job/gaia/miner
	name = OUTFIT_JOB_NAME("Gaian Shaft Miner")
	uniform = /obj/item/clothing/under/rank/miner
	shoes = /obj/item/clothing/shoes/workboots
	head = /obj/item/clothing/head/hardhat/orange
	belt = /obj/item/storage/belt/archaeology
	id_types = list(/obj/item/card/id/gaia/worker)
	l_hand = /obj/item/pickaxe/drill
	l_ear = /obj/item/device/radio/headset/headset_eng
	l_pocket = /obj/item/key/gaia/engineering

// MISC
/singleton/hierarchy/outfit/job/gaia/chaplain
	name = OUTFIT_JOB_NAME("Gaian Chaplain")
	uniform = /obj/item/clothing/under/rank/chaplain
	l_hand = /obj/item/storage/bible
	l_pocket = /obj/item/key/gaia/church

/singleton/hierarchy/outfit/job/gaia/prisoner
	name = OUTFIT_JOB_NAME("Gaian Prisoner")
	uniform = /obj/item/clothing/under/color/orange
	shoes = /obj/item/clothing/shoes/orange
	pda_type = null
	id_types = null
	l_ear = null
