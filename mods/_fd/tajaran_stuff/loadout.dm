// [Overrides]

/datum/gear/uniform/tajara
	display_name = "Tajaran | vintage uniform"
	path = /obj/item/clothing/under/taj_old_uniform
	whitelisted = list(SPECIES_TAJARA)
	sort_category = "Xenowear"

/datum/gear/uniform/tajara/taj_new_fatigues
	display_name = " Tajaran | tajaran fatigues"
	path = /obj/item/clothing/under/taj_new_fatigues

// [/Overrides]

// Uniform

/datum/gear/uniform/tajara/taj_dress
	display_name = "Assashite | assashite dress"
	path = /obj/item/clothing/under/taj_dress

/datum/gear/uniform/tajara/taj_dress/heart
	display_name = "Assashite | assashite trimmed dress"
	path = /obj/item/clothing/under/taj_dress/heart

/datum/gear/uniform/tajara/taj_nune
	display_name = "Assashite | shei'shi robe"
	path = /obj/item/clothing/under/taj_nune

/datum/gear/uniform/tajara/taj_pants
	display_name = "Assashite | assashite grey pants"
	path = /obj/item/clothing/under/taj_pants

/datum/gear/uniform/tajara/taj_pants/mil
	display_name = "Assashite | assashite green pants"
	path = /obj/item/clothing/under/taj_pants/mil

/datum/gear/uniform/tajara/taj_pants/jaggy
	display_name = "Assashite | assashite pants"
	path = /obj/item/clothing/under/taj_pants/jaggy

/datum/gear/uniform/tajara/taj_jumpsuit
	display_name = "Assashite | tribal suit"
	path = /obj/item/clothing/under/taj_jumpsuit


// Accessories

/datum/gear/accessory/leafy
	display_name = "Assashite | assashite leafy raincoat"
	path = /obj/item/clothing/accessory/tajaran
	whitelisted = list(SPECIES_TAJARA)
	sort_category = "Xenowear"

/datum/gear/accessory/tradcloak
	display_name = "Assashite | assashite traditional cloak"
	path = /obj/item/clothing/accessory/tajaran/tradition
	whitelisted = list(SPECIES_TAJARA)
	sort_category = "Xenowear"

/*
/datum/gear/accessory/capes
	display_name = "(Tajara) shoulder capes"
	path = /obj/item/clothing/accessory/shouldercape
	whitelisted = list(SPECIES_TAJARA)
	sort_category = "Xenowear"

/datum/gear/accessory/capes/New()
	..()
	var/capes = list()
	capes["simple cape"] = /obj/item/clothing/accessory/shouldercape/grunt
	capes["decorated cape"] = /obj/item/clothing/accessory/shouldercape/officer
	capes["government cape"] = /obj/item/clothing/accessory/shouldercape/command
	gear_tweaks += new/datum/gear_tweak/path(capes)
*/
