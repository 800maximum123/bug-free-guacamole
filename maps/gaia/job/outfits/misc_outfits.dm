/singleton/hierarchy/outfit/job/gaia
	name = OUTFIT_JOB_NAME("Gaian Outfit")
	hierarchy_type = /singleton/hierarchy/outfit/job/gaia
	uniform = /obj/item/clothing/under/color/grey
	pda_type = null
	r_pocket = /obj/item/device/radio/hailing
	id_types = list(/obj/item/card/id/gaia)

	flags = OUTFIT_FLAGS_JOB_DEFAULT | OUTFIT_ADJUSTMENT_SKIP_SURVIVAL_GEAR

/singleton/hierarchy/outfit/job/gaia/police
	name = OUTFIT_JOB_NAME("Gaian Town Police Officer")
	uniform = /obj/item/clothing/under/gaiacop/officer
	shoes = /obj/item/clothing/shoes/leather
	head = /obj/item/clothing/head/gaiacop
	l_pocket = /obj/item/device/flash/advanced
	r_pocket = /obj/item/handcuffs

/singleton/hierarchy/outfit/job/gaia/policesergeant
	name = OUTFIT_JOB_NAME("Gaian Town Police Sergeant")
	uniform = /obj/item/clothing/under/gaiacop/sergeant
	shoes = /obj/item/clothing/shoes/leather
	head = /obj/item/clothing/head/gaiacop
	l_pocket = /obj/item/device/flash/advanced
	r_pocket = /obj/item/handcuffs

/singleton/hierarchy/outfit/job/gaia/firefighter
	name = OUTFIT_JOB_NAME("Gaian Firefighter")
	uniform = /obj/item/clothing/under/rank/atmospheric_technician
	suit = /obj/item/clothing/suit/fire/firefighter
	shoes = /obj/item/clothing/shoes/workboots
	head = /obj/item/clothing/head/hardhat/firefighter
	gloves = /obj/item/clothing/gloves/fire
	belt = /obj/item/storage/belt/fire_belt/full
	backpack_contents = list(/obj/item/clothing/accessory/fire_overpants, /obj/item/extinguisher)

/singleton/hierarchy/outfit/job/gaia/paramedic
	name = OUTFIT_JOB_NAME("Gaian Paramedic")
	uniform = /obj/item/clothing/under/rank/medical/scrubs/blue
	suit = /obj/item/clothing/suit/storage/hazardvest/med
	shoes = /obj/item/clothing/shoes/white
	head = /obj/item/clothing/head/hardhat/light/medic
	gloves = /obj/item/clothing/gloves/latex
	l_pocket = /obj/item/device/scanner/health
	l_hand = /obj/item/storage/firstaid/stab

/singleton/hierarchy/outfit/job/gaia/worker
	name = OUTFIT_JOB_NAME("Gaian Construction Worker")
	uniform = /obj/item/clothing/under/hazard
	suit = /obj/item/clothing/suit/storage/hazardvest
	shoes = /obj/item/clothing/shoes/workboots
	head = /obj/item/clothing/head/hardhat
	belt = /obj/item/storage/belt/utility/full

/singleton/hierarchy/outfit/job/gaia/miner
	name = OUTFIT_JOB_NAME("Gaian Shaft Miner")
	uniform = /obj/item/clothing/under/rank/miner
	suit = /obj/item/clothing/suit/storage/hazardvest
	shoes = /obj/item/clothing/shoes/workboots
	head = /obj/item/clothing/head/hardhat
	belt = /obj/item/storage/belt/archaeology
	l_hand = /obj/item/pickaxe/drill

/singleton/hierarchy/outfit/job/gaia/mayor
	name = OUTFIT_JOB_NAME("Gaian Mayor")
	uniform = /obj/item/clothing/under/suit_jacket/navy
	shoes = /obj/item/clothing/shoes/laceup
	glasses = /obj/item/clothing/glasses/monocle
	l_pocket = /obj/item/device/megaphone

/singleton/hierarchy/outfit/job/gaia/chaplain
	name = OUTFIT_JOB_NAME("Gaian Chaplain")
	uniform = /obj/item/clothing/under/rank/chaplain
	l_hand = /obj/item/storage/bible

/singleton/hierarchy/outfit/job/gaia/prisoner
	name = OUTFIT_JOB_NAME("Gaian Prisoner")
	uniform = /obj/item/clothing/under/color/orange
	shoes = /obj/item/clothing/shoes/orange
	pda_type = null
	id_types = null
