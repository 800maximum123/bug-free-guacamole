/obj/item/clothing/accessory/scga_badge
	abstract_type = /obj/item/clothing/accessory/scga_badge
	name = "base badge, SCGA"
	desc = "You should not see this."
	icon = 'packs/factions/scga/badges.dmi'
	accessory_icons = list(
		slot_w_uniform_str = 'packs/factions/scga/badges.dmi',
		slot_wear_suit_str = 'packs/factions/scga/badges.dmi'
	)
	icon_state = null
	on_rolled_down = ACCESSORY_ROLLED_NONE
	w_class = ITEM_SIZE_TINY
	slot = ACCESSORY_SLOT_INSIGNIA
	sprite_sheets = list(
		SPECIES_UNATHI = 'packs/factions/scga/species/badges_unathi.dmi'
	)

/obj/item/clothing/accessory/scga_badge/get_fibers()
	return null


/obj/item/clothing/accessory/scga_badge/enlisted
	name = "army enlisted qualification pin"
	desc = "A shiny little pin badge denoting qualification of an SCGA enlistedman."
	icon_state = "enlisted"
	overlay_state = "enlisted_worn"


/obj/item/clothing/accessory/scga_badge/officer
	name = "army officer qualification pin"
	desc = "A shiny little pin badge denoting qualification of an SCGA officer."
	icon_state = "officer"
	overlay_state = "officer_worn"

//shoulder patches
/obj/item/clothing/accessory/solgov/army_patch
	name = "\improper First Infantry Division patch"
	desc = "A fancy shoulder patch carrying insignia of First Infantry Division, the PDF of Earth and main force on Gaia."
	icon = 'packs/factions/scga/badges.dmi'
	accessory_icons = list(
		slot_w_uniform_str = 'packs/factions/scga/badges.dmi',
		slot_wear_suit_str = 'packs/factions/scga/badges.dmi'
	)
	icon_state = "armypatch1"
	overlay_state = "armypatch1_worn"
	on_rolled_down = ACCESSORY_ROLLED_NONE
	slot = ACCESSORY_SLOT_INSIGNIA

/obj/item/clothing/accessory/solgov/army_patch/secondinf
	name = "\improper Second Infantry Division patch"
	desc = "A hardy shoulder patch carrying insignia of Second Infantry Division, often deployed as peacekeepers and stationed in many places."
	icon_state = "armypatch2"
	overlay_state = "armypatch2_worn"

/obj/item/clothing/accessory/solgov/army_patch/firstcav
	name = "\improper First Cavalry Division patch"
	desc = "A tacticool shoulder patch carrying insignia of First Cavalry Division, the mechanized support arm of the Army."
	icon_state = "armypatch3"
	overlay_state = "armypatch3_worn"

/obj/item/clothing/accessory/solgov/army_patch/firstarm
	name = "\improper First Armored Division patch"
	desc = "A menacing shoulder patch carrying insignia of First Armored Division, the depreciated and partially inactive support force."
	icon_state = "armypatch4"
	overlay_state = "armypatch4_worn"

/obj/item/clothing/accessory/solgov/army_patch/airborne
	name = "\improper First Airborne Division patch"
	desc = "A bleached shoulder patch carrying insignia of First Airborne Division, the main air unit of Army."
	icon_state = "armypatch5"
	overlay_state = "armypatch5_worn"

/obj/item/clothing/accessory/solgov/army_patch/maritime
	name = "\improper Maritime Corps patch"
	desc = "An eyesoring shoulder patch carrying insignia of Army Maritime Corps, the waterborne unit currently on Gaia."
	icon_state = "armypatch6"
	overlay_state = "armypatch6_worn"

//loadout integration
/datum/gear/accessory/armypatch
	display_name = "army patch"
	path = /obj/item/clothing/accessory/solgov/army_patch
	flags = GEAR_HAS_TYPE_SELECTION
//	allowed_branches = list(/datum/mil_branch/scga)
