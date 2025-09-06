/datum/gear/suit/blueapron
	allowed_branches = CIVILIAN_BRANCHES

/datum/gear/suit/overalls
	allowed_branches = CIVILIAN_BRANCHES

/datum/gear/suit/medcoat
	allowed_roles = MEDICAL_ROLES

/datum/gear/suit/trenchcoat
	allowed_branches = CIVILIAN_BRANCHES

/datum/gear/suit/poncho
	allowed_branches = CIVILIAN_BRANCHES

/datum/gear/suit/security_poncho
	allowed_branches = CIVILIAN_BRANCHES

/datum/gear/suit/medical_poncho
	allowed_branches = CIVILIAN_BRANCHES

/datum/gear/suit/engineering_poncho
	allowed_branches = CIVILIAN_BRANCHES

/datum/gear/suit/science_poncho
	allowed_branches = CIVILIAN_BRANCHES

/datum/gear/suit/nanotrasen_poncho
	allowed_branches = CIVILIAN_BRANCHES

/datum/gear/suit/cargo_poncho
	allowed_branches = CIVILIAN_BRANCHES

/datum/gear/suit/suit_jacket
	allowed_branches = CIVILIAN_BRANCHES

/datum/gear/suit/custom_suit_jacket
	allowed_branches = CIVILIAN_BRANCHES

/datum/gear/suit/custom_suit_jacket_double
	allowed_branches = CIVILIAN_BRANCHES

/datum/gear/suit/hoodie
	allowed_branches = CIVILIAN_BRANCHES

/datum/gear/suit/hoodie_sel
	allowed_branches = CIVILIAN_BRANCHES

/datum/gear/suit/pullover
	allowed_branches = CIVILIAN_BRANCHES

/datum/gear/suit/zipper
	allowed_branches = CIVILIAN_BRANCHES

/datum/gear/suit/labcoat
	allowed_roles = MEDICAL_ROLES

/datum/gear/suit/labcoat_corp
	allowed_roles = MEDICAL_ROLES
	allowed_branches = CIVILIAN_BRANCHES

/datum/gear/suit/labcoat_blue
	allowed_roles = MEDICAL_ROLES

/datum/gear/suit/wintercoat_dais
	display_name = "winter coat, DAIS"
	allowed_roles = ENGINEERING_ROLES
	allowed_branches = CIVILIAN_BRANCHES
	flags = GEAR_HAS_NO_CUSTOMIZATION

/datum/gear/suit/coat
	allowed_branches = CIVILIAN_BRANCHES

/datum/gear/suit/leather
	allowed_branches = CIVILIAN_BRANCHES

/datum/gear/suit/wintercoat
	allowed_branches = CIVILIAN_BRANCHES

/datum/gear/suit/track
	allowed_branches = CIVILIAN_BRANCHES

/datum/gear/tactical/pcarrier
	display_name = "black plate carrier"
	path = /obj/item/clothing/suit/armor/pcarrier
	cost = 1
	slot = slot_wear_suit

/datum/gear/tactical/pcarrier/navy
	display_name = "navy blue plate carrier"
	path = /obj/item/clothing/suit/armor/pcarrier/navy

/datum/gear/tactical/pcarrier/misc
	display_name = "miscellaneous plate carrier selection"

/datum/gear/tactical/pcarrier/misc/New()
	..()
	var/armors = list()
	armors["green plate carrier"] = /obj/item/clothing/suit/armor/pcarrier/green
	armors["tan plate carrier"] = /obj/item/clothing/suit/armor/pcarrier/tan
	gear_tweaks += new/datum/gear_tweak/path(armors)
