
//Main Clothing
/obj/item/clothing/under/scga
	abstract_type = /obj/item/clothing/under/scga
	name = "base uniform, SCGA"
	desc = "You should not see this."
	icon = 'packs/factions/scga/clothing.dmi'
	item_icons = list(
		slot_w_uniform_str = 'packs/factions/scga/clothing.dmi'
	)
	armor = list(
		melee = ARMOR_MELEE_MINOR,
		energy = ARMOR_BALLISTIC_MINOR
	)
	sprite_sheets = list(
		SPECIES_UNATHI = 'packs/factions/scga/species/clothing_unathi.dmi'
	)


/obj/item/clothing/under/scga/pt
	name = "army PT uniform"
	desc = "A flexible set of black shirt and pants. Does NOT leave much to the imagination."
	icon_state = "under_pt"
	item_state_slots = list(
		slot_l_hand_str = "under_pt_held_l",
		slot_r_hand_str = "under_pt_held_r",
		slot_w_uniform_str = "under_pt_worn"
	)


/obj/item/clothing/under/scga/fatigues
	name = "army off-duty clothing"
	desc = "A loose set of green tank-top and brown short-pants. Miami, sexy."
	icon_state = "under_fatigues"
	item_state_slots = list(
		slot_l_hand_str = "under_fatigues_held_l",
		slot_r_hand_str = "under_fatigues_held_r",
		slot_w_uniform_str = "under_fatigues_worn"
	)
	body_parts_covered = FULL_TORSO


/obj/item/clothing/under/scga/utility
	name = "green army fatigues"
	desc = "Robust utility uniform of SCG Army, coloured lovely forest green for hiding in woodland."
	icon_state = "under_utility"
	item_state_slots = list(
		slot_l_hand_str = "under_utility_held_l",
		slot_r_hand_str = "under_utility_held_r",
		slot_w_uniform_str = "under_utility_worn"
	)

/obj/item/clothing/under/scga/utility/command
	accessories = list(/obj/item/clothing/accessory/solgov/department/command/fleet)

/obj/item/clothing/under/scga/utility/engineering
	accessories = list(/obj/item/clothing/accessory/solgov/department/engineering/fleet)

/obj/item/clothing/under/scga/utility/security
	accessories = list(/obj/item/clothing/accessory/solgov/department/security/fleet)

/obj/item/clothing/under/scga/utility/medical
	accessories = list(/obj/item/clothing/accessory/solgov/department/medical/fleet)

/obj/item/clothing/under/scga/utility/medical/banded
	accessories = list(/obj/item/clothing/accessory/solgov/department/medical/fleet, /obj/item/clothing/accessory/armband/medblue)

/obj/item/clothing/under/scga/utility/supply
	accessories = list(/obj/item/clothing/accessory/solgov/department/supply/fleet)

/obj/item/clothing/under/scga/utility/service
	accessories = list(/obj/item/clothing/accessory/solgov/department/service/fleet)

/obj/item/clothing/under/scga/utility/exploration
	accessories = list(/obj/item/clothing/accessory/solgov/department/exploration/fleet)


/obj/item/clothing/under/scga/utility/tan
	name = "tan army fatigues"
	desc = "Robust utility uniform of SCG Army, coloured tasteful arid tan for hiding in deserts and arid areas."
	icon_state = "under_utility_tan"
	item_state_slots = list(
		slot_l_hand_str = "under_utility_tan_held_l",
		slot_r_hand_str = "under_utility_tan_held_r",
		slot_w_uniform_str = "under_utility_tan_worn"
	)

/obj/item/clothing/under/scga/utility/tan/command
	accessories = list(/obj/item/clothing/accessory/solgov/department/command/fleet)

/obj/item/clothing/under/scga/utility/tan/engineering
	accessories = list(/obj/item/clothing/accessory/solgov/department/engineering/fleet)

/obj/item/clothing/under/scga/utility/tan/security
	accessories = list(/obj/item/clothing/accessory/solgov/department/security/fleet)

/obj/item/clothing/under/scga/utility/tan/medical
	accessories = list(/obj/item/clothing/accessory/solgov/department/medical/fleet)

/obj/item/clothing/under/scga/utility/tan/banded
	accessories = list(/obj/item/clothing/accessory/solgov/department/medical/fleet, /obj/item/clothing/accessory/armband/medblue)

/obj/item/clothing/under/scga/utility/tan/supply
	accessories = list(/obj/item/clothing/accessory/solgov/department/supply/fleet)

/obj/item/clothing/under/scga/utility/tan/service
	accessories = list(/obj/item/clothing/accessory/solgov/department/service/fleet)

/obj/item/clothing/under/scga/utility/tan/exploration
	accessories = list(/obj/item/clothing/accessory/solgov/department/exploration/fleet)


/obj/item/clothing/under/scga/utility/urban
	name = "urban army fatigues"
	desc = "Robust utility uniform of SCG Army, coloured grey for blending into urban areas and space installations."
	icon_state = "under_utility_urban"
	item_state_slots = list(
		slot_l_hand_str = "under_utility_urban_held_l",
		slot_r_hand_str = "under_utility_urban_held_r",
		slot_w_uniform_str = "under_utility_urban_worn"
	)

/obj/item/clothing/under/scga/utility/urban/command
	accessories = list(/obj/item/clothing/accessory/solgov/department/command/fleet)

/obj/item/clothing/under/scga/utility/urban/engineering
	accessories = list(/obj/item/clothing/accessory/solgov/department/engineering/fleet)

/obj/item/clothing/under/scga/utility/urban/security
	accessories = list(/obj/item/clothing/accessory/solgov/department/security/fleet)

/obj/item/clothing/under/scga/utility/urban/medical
	accessories = list(/obj/item/clothing/accessory/solgov/department/medical/fleet)

/obj/item/clothing/under/scga/utility/urban/urban/medical/banded
	accessories = list(/obj/item/clothing/accessory/solgov/department/medical/fleet, /obj/item/clothing/accessory/armband/medblue)

/obj/item/clothing/under/scga/utility/urban/supply
	accessories = list(/obj/item/clothing/accessory/solgov/department/supply/fleet)

/obj/item/clothing/under/scga/utility/urban/service
	accessories = list(/obj/item/clothing/accessory/solgov/department/service/fleet)

/obj/item/clothing/under/scga/utility/urban/exploration
	accessories = list(/obj/item/clothing/accessory/solgov/department/exploration/fleet)


/obj/item/clothing/under/scga/service
	name = "army service uniform"
	desc = "A slimming brown service shirt and green pants. Standard service uniform for the SCG Army."
	icon_state = "under_service"
	item_state_slots = list(
		slot_l_hand_str = "under_service_held_l",
		slot_r_hand_str = "under_service_held_r",
		slot_w_uniform_str = "under_service_worn"
	)


/obj/item/clothing/under/scga/service/skirt
	name = "army service skirt"
	desc = "A slimming brown service shirt and a green skirt. Standard service uniform for the SCG Army."
	icon_state = "under_service_skirt"
	item_state_slots = list(
		slot_l_hand_str = "under_service_skirt_held_l",
		slot_r_hand_str = "under_service_skirt_held_r",
		slot_w_uniform_str = "under_service_skirt_worn"
	)


/obj/item/clothing/under/scga/service_command
	name = "army officer's service uniform"
	desc = "A slimming brown service shirt and green pants with beige streaks, for senior officers. Belonging to the solar army command service uniform."
	icon_state = "under_command"
	item_state_slots = list(
		slot_l_hand_str = "under_command_held_l",
		slot_r_hand_str = "under_command_held_r",
		slot_w_uniform_str = "under_command_worn"
	)


/obj/item/clothing/under/scga/service_command/skirt
	name = "army officer's service skirt"
	desc = "A slimming brown service shirt and green skirt with beige streaks, for senior officers. Belonging to the solar army command service uniform."
	icon_state = "under_command_skirt"
	item_state_slots = list(
		slot_l_hand_str = "under_command_skirt_held_l",
		slot_r_hand_str = "under_command_skirt_held_r",
		slot_w_uniform_str = "under_command_skirt_worn"
	)


/obj/item/clothing/under/scga/dress
	name = "army dress uniform"
	desc = "A classy brown shirt and black dress pants. Part of the solar army dress uniform."
	icon_state = "under_dress"
	item_state_slots = list(
		slot_l_hand_str = "under_dress_held_l",
		slot_r_hand_str = "under_dress_held_r",
		slot_w_uniform_str = "under_dress_worn"
	)


/obj/item/clothing/under/scga/dress/skirt
	name = "army dress skirt"
	desc = "A classy brown shirt and black dress skirt. Part of the solar army dress uniform."
	icon_state = "under_dress_skirt"
	item_state_slots = list(
		slot_l_hand_str = "under_dress_skirt_held_l",
		slot_r_hand_str = "under_dress_skirt_held_r",
		slot_w_uniform_str = "under_dress_skirt_worn"
	)

/obj/item/clothing/under/scga/dress_command
	name = "army officer's dress uniform"
	desc = "A classy brown shirt and black dress pants with gold streaks, for senior officers. Part of the solar army command dress uniform."
	icon_state = "under_dress_command"
	item_state_slots = list(
		slot_l_hand_str = "under_dress_command_held_l",
		slot_r_hand_str = "under_dress_command_held_r",
		slot_w_uniform_str = "under_dress_command_worn"
	)

/obj/item/clothing/under/scga/dress_command/skirt
	name = "army officer's dress skirt"
	desc = "A classy brown shirt and black dress skirt with gold streaks, for senior officers. Part of the solar army command dress uniform."
	icon_state = "under_dress_command_skirt"
	item_state_slots = list(
		slot_l_hand_str = "under_dress_command_skirt_held_l",
		slot_r_hand_str = "under_dress_command_skirt_held_r",
		slot_w_uniform_str = "under_dress_command_skirt_worn"
	)


//Over Clothing
/obj/item/clothing/suit/scga
	abstract_type = /obj/item/clothing/suit/scga
	name = "base jacket, SCGA"
	desc = "You should not see this."
	icon = 'packs/factions/scga/clothing.dmi'
	item_icons = list(
		slot_wear_suit_str = 'packs/factions/scga/clothing.dmi'
	)
	valid_accessory_slots = list(
		ACCESSORY_SLOT_RANK,
		ACCESSORY_SLOT_INSIGNIA,
		ACCESSORY_SLOT_MEDAL
	)
	allowed = list()


/obj/item/clothing/suit/scga/hooded/wintercoat
	name = "army utility wintercoat"
	desc = "A comfortable, but rather heavy winter coat in green."
	icon_state = "suit_wintercoat"
	item_state_slots = list(
		slot_l_hand_str = "suit_wintercoat_held_l",
		slot_r_hand_str = "suit_wintercoat_held_r",
		slot_wear_suit_str = "suit_wintercoat_worn"
	)
	accessories = list(
		/obj/item/clothing/accessory/storage/pockets,
		/obj/item/clothing/accessory/scga_badge/enlisted
	)


/obj/item/clothing/suit/scga/service
	name = "army service jacket"
	desc = "A rugged green service over-jacket. Part of the solar army service uniform for enlisted."
	icon_state = "suit_service"
	item_state_slots = list(
		slot_l_hand_str = "suit_service_held_l",
		slot_r_hand_str = "suit_service_held_r",
		slot_wear_suit_str = "suit_service_worn"
	)
	accessories = list(
		/obj/item/clothing/accessory/storage/pockets,
		/obj/item/clothing/accessory/scga_badge/enlisted
	)


/obj/item/clothing/suit/scga/service_officer
	name = "army officer's service jacket"
	desc = "A rugged green service over-jacket. Part of the solar army service uniform for officers."
	icon_state = "suit_service_officer"
	item_state_slots = list(
		slot_l_hand_str = "suit_service_officer_held_l",
		slot_r_hand_str = "suit_service_officer_held_r",
		slot_wear_suit_str = "suit_service_officer_worn"
	)
	accessories = list(
		/obj/item/clothing/accessory/storage/pockets,
		/obj/item/clothing/accessory/scga_badge/officer
	)


/obj/item/clothing/suit/scga/dress
	name = "army dress jacket"
	desc = "A strapping dress jacket. Part of the solar army dress uniform."
	icon_state = "suit_dress"
	item_state_slots = list(
		slot_l_hand_str = "suit_dress_held_l",
		slot_r_hand_str = "suit_dress_held_r",
		slot_wear_suit_str = "suit_dress_worn"
	)


/obj/item/clothing/suit/scga/dress_command
	name = "army officer's dress jacket"
	desc = "A strapping dress jacket. Part of the solar army dress uniform for senior officers."
	icon_state = "suit_dress_command"
	item_state_slots = list(
		slot_l_hand_str = "suit_dress_command_held_l",
		slot_r_hand_str = "suit_dress_command_held_r",
		slot_wear_suit_str = "suit_dress_command_worn"
	)


//Gloves
/obj/item/clothing/gloves/scga
	abstract_type = /obj/item/clothing/gloves/scga
	name = "base gloves, SCGA"
	desc = "You should not see this."
	icon = 'packs/factions/scga/clothing.dmi'
	item_icons = list(
		slot_gloves_str = 'packs/factions/scga/clothing.dmi'
	)
	sprite_sheets = list()


/obj/item/clothing/gloves/scga/duty
	name = "army duty gloves"
	desc = "Tough, brown duty gloves, Army standard issue. Complete with reinforced knuckles."
	icon_state = "gloves_utility"
	item_state_slots = list(
		slot_l_hand_str = "gloves_utility_held_l",
		slot_r_hand_str = "gloves_utility_held_r",
		slot_gloves_str = "gloves_utility_worn"
	)


//Shoes
/obj/item/clothing/shoes/scga
	abstract_type = /obj/item/clothing/shoes/scga
	name = "base shoes, SCGA"
	desc = "You should not see this."
	icon = 'packs/factions/scga/clothing.dmi'
	item_icons = list(
		slot_shoes_str = 'packs/factions/scga/clothing.dmi'
	)
	sprite_sheets = list()


/obj/item/clothing/shoes/scga/utility
	name = "jungle duty boots"
	desc = "Hardy, strong-soled boots in jungle beige camouflage configuration. Recognisable as SCGA standard-issue."
	icon_state = "boots_utility"
	item_state_slots = list(
		slot_l_hand_str = "boots_utility_held_l",
		slot_r_hand_str = "boots_utility_held_r",
		slot_shoes_str = "boots_utility_worn"
	)
	armor = list(
		melee = ARMOR_MELEE_RESISTANT,
		bullet = ARMOR_BALLISTIC_MINOR,
		laser = ARMOR_LASER_MINOR,
		energy = ARMOR_ENERGY_MINOR,
		bomb = ARMOR_BOMB_PADDED,
		bio = ARMOR_BIO_MINOR
		)
	siemens_coefficient = 0.7


/obj/item/clothing/shoes/scga/utility/tan
	name = "tan duty boots"
	desc = "Hardy, strong-soled boots in dusty tan camouflage configuration. Recognisable as SCGA standard-issue."
	icon_state = "boots_utility_tan"
	item_state_slots = list(
		slot_l_hand_str = "boots_utility_tan_held_l",
		slot_r_hand_str = "boots_utility_tan_held_r",
		slot_shoes_str = "boots_utility_tan_worn"
	)


/obj/item/clothing/shoes/scga/dress
	name = "army dress shoes"
	desc = "Flat, shiny dress shoes. They're actually pre-fabricated with the polish, so you only need to dust them regularly."
	icon_state = "shoes_dress"
	item_state_slots = list(
		slot_l_hand_str = "shoes_dress_held_l",
		slot_r_hand_str = "shoes_dress_held_r",
		slot_shoes_str = "shoes_dress_worn"
	)


//Hats
/obj/item/clothing/head/scga
	abstract_type = /obj/item/clothing/head/scga
	name = "base hat, SCGA"
	desc = "You should not see this."
	icon = 'packs/factions/scga/clothing.dmi'
	item_icons = list(
		slot_head_str = 'packs/factions/scga/clothing.dmi'
	)
	sprite_sheets = list()


/obj/item/clothing/head/scga/beret
	name = "army diplo security beret"
	desc = "A tan beret denoting service in the SCG Army Diplomatic Security Group. For embassy guards that are more inclined towards style than safety."
	icon_state = "hat_beret"
	item_state_slots = list(
		slot_l_hand_str = "hat_beret_held_l",
		slot_r_hand_str = "hat_beret_held_r",
		slot_head_str = "hat_beret_worn"
	)


/obj/item/clothing/head/scga/utility
	name = "army green utility cover"
	desc = "A stern, green utility cover with a small SCG Army crest on the front."
	icon_state = "hat_utility"
	item_state_slots = list(
		slot_l_hand_str = "hat_utility_held_l",
		slot_r_hand_str = "hat_utility_held_r",
		slot_head_str = "hat_utility_worn"
	)


/obj/item/clothing/head/scga/utility/tan
	name = "army tan utility cover"
	desc = "A stern, tan utility cover with a small SCG Army crest on the front."
	icon_state = "hat_utility_tan"
	item_state_slots = list(
		slot_l_hand_str = "hat_utility_tan_held_l",
		slot_r_hand_str = "hat_utility_tan_held_r",
		slot_head_str = "hat_utility_tan_worn"
	)


/obj/item/clothing/head/scga/utility/urban
	name = "army urban utility cover"
	desc = "A stern, urban utility cover with a small SCG Army crest on the front."
	icon_state = "hat_utility_urban"
	item_state_slots = list(
		slot_l_hand_str = "hat_utility_urban_held_l",
		slot_r_hand_str = "hat_utility_urban_held_r",
		slot_head_str = "hat_utility_urban_worn"
	)


/obj/item/clothing/head/scga/utility/ushanka
	name = "army ushanka hat"
	desc = "A comfy, padded ushanka hat with a small SCG Army crest on the front."
	icon_state = "hat_ushanka"
	item_state_slots = list(
		slot_l_hand_str = "hat_ushanka_held_l",
		slot_r_hand_str = "hat_ushanka_held_r",
		slot_head_str = "hat_ushanka_worn"
	)


/obj/item/clothing/head/scga/utility/ushanka/green
	name = "green army ushanka hat"
	desc = "A comfy, padded ushanka hat in green with a small SCG Army crest on the front."
	icon_state = "hat_ushanka_green"
	item_state_slots = list(
		slot_l_hand_str = "hat_ushanka_green_held_l",
		slot_r_hand_str = "hat_ushanka_green_held_r",
		slot_head_str = "hat_ushanka_green_worn"
	)


/obj/item/clothing/head/scga/utility/drill
	name = "drill sergeant's hat"
	desc = "A firm green drill hat for senior non-commissioned officers. Perfect for sipping your morning coffee and yelling at recruits."
	icon_state = "hat_drill"
	item_state_slots = list(
		slot_l_hand_str = "hat_drill_held_l",
		slot_r_hand_str = "hat_drill_held_r",
		slot_head_str = "hat_drill_worn"
	)


/obj/item/clothing/head/scga/service/garrison
	name = "army garrison cap"
	desc = "A peaked garrison cap for enlisted with a small SCG Army crest on the front."
	icon_state = "hat_garrison"
	item_state_slots = list(
		slot_l_hand_str = "hat_garrison_held_l",
		slot_r_hand_str = "hat_garrison_held_r",
		slot_head_str = "hat_garrison_worn"
	)


/obj/item/clothing/head/scga/service/garrison_officer
	name = "army garrison cap"
	desc = "A peaked garrison cap for officers with a small SCG Army crest on the front."
	icon_state = "hat_garrison_officer"
	item_state_slots = list(
		slot_l_hand_str = "hat_garrison_officer_held_l",
		slot_r_hand_str = "hat_garrison_officer_held_r",
		slot_head_str = "hat_garrison_officer_worn"
	)


/obj/item/clothing/head/scga/service/wheel
	name = "army service wheel cover"
	desc = "A rounded wheel cover for officers with a small SCG Army crest on the front."
	icon_state = "hat_wheel"
	item_state_slots = list(
		slot_l_hand_str = "hat_wheel_held_l",
		slot_r_hand_str = "hat_wheel_held_r",
		slot_head_str = "hat_wheel_worn"
	)


/obj/item/clothing/head/scga/service/wheel_command
	name = "army service wheel cover"
	desc = "A rounded wheel cover for senior officers with a small SCG Army crest on the front."
	icon_state = "hat_wheel_command"
	item_state_slots = list(
		slot_l_hand_str = "hat_wheel_command_held_l",
		slot_r_hand_str = "hat_wheel_command_held_r",
		slot_head_str = "hat_wheel_command_worn"
	)


/obj/item/clothing/head/scga/dress/garrison
	name = "army dress garrison cap"
	desc = "A white, peaked garrison cap for enlisted with a small SCG Army crest on the front."
	icon_state = "hat_dress_garrison"
	item_state_slots = list(
		slot_l_hand_str = "hat_dress_garrison_held_l",
		slot_r_hand_str = "hat_dress_garrison_held_r",
		slot_head_str = "hat_dress_garrison_worn"
	)


/obj/item/clothing/head/scga/dress/wheel
	name = "army dress wheel cover"
	desc = "A white, rounded wheel cover for officers with a small SCG Army crest on the front."
	icon_state = "hat_dress_wheel"
	item_state_slots = list(
		slot_l_hand_str = "hat_dress_wheel_held_l",
		slot_r_hand_str = "hat_dress_wheel_held_r",
		slot_head_str = "hat_dress_wheel_worn"
	)


/obj/item/clothing/head/scga/dress/wheel_command
	name = "army dress wheel cover"
	desc = "A white, rounded wheel cover for senior officers with a small SCG Army crest on the front."
	icon_state = "hat_dress_wheel_command"
	item_state_slots = list(
		slot_l_hand_str = "hat_dress_wheel_command_held_l",
		slot_r_hand_str = "hat_dress_wheel_command_held_r",
		slot_head_str = "hat_dress_wheel_command_worn"
	)

//fancy berets
/obj/item/clothing/head/scga/beret/firstinf
	name = "first infantry beret"
	desc = "A black beret carrying insignia of SCG Army First Infantry Division, the current active Earth PDF and Gaia force. For infantrymen that are more inclined towards style than safety."
	icon_state = "beret_firstinf"
	item_state_slots = list(
		slot_l_hand_str = "hat_utility_tan_held_l",
		slot_r_hand_str = "hat_utility_tan_held_r",
		slot_head_str = "beret_firstinf_worn"
	)

/obj/item/clothing/head/scga/beret/airborne
	name = "first airborne beret"
	desc = "A red beret carrying insignia of SCG Army First Airborne Division, the main planetary air unit. For pilots that are more inclined towards style than safety."
	icon_state = "beret_air"
	item_state_slots = list(
		slot_l_hand_str = "hat_utility_tan_held_l",
		slot_r_hand_str = "hat_utility_tan_held_r",
		slot_head_str = "beret_air_worn"
	)

/obj/item/clothing/head/scga/beret/secondinf
	name = "second infantry beret"
	desc = "A black beret carrying insignia of SCG Army Second Infantry Division, the main peacekeeping and excercise unit off-Gaia. For infantrymen that are more inclined towards style than safety."
	icon_state = "beret_secondinf"
	item_state_slots = list(
		slot_l_hand_str = "hat_utility_tan_held_l",
		slot_r_hand_str = "hat_utility_tan_held_r",
		slot_head_str = "beret_secondinf_worn"
	)

/obj/item/clothing/head/scga/beret/firstcav
	name = "first cavalry beret"
	desc = "An olive beret carrying insignia of SCG Army First Cavalry Division, the mechanized unit tasked with assisting both infantry divisions. For mech pilots that are more inclined towards style than safety."
	icon_state = "beret_firstcav"
	item_state_slots = list(
		slot_l_hand_str = "hat_utility_tan_held_l",
		slot_r_hand_str = "hat_utility_tan_held_r",
		slot_head_str = "beret_firstcav_worn"
	)

/obj/item/clothing/head/scga/beret/firstarm
	name = "first armored beret"
	desc = "An olive beret carrying insignia of SCG Army First Armored Division, the smallest active unit tasked with heavy combat support. For tank crews that are more inclined towards style than safety."
	icon_state = "beret_firstarm"
	item_state_slots = list(
		slot_l_hand_str = "hat_utility_tan_held_l",
		slot_r_hand_str = "hat_utility_tan_held_r",
		slot_head_str = "beret_firstarm_worn"
	)

/obj/item/clothing/head/scga/beret/maritime
	name = "army maritime corps beret"
	desc = "An olive beret carrying insignia of SCG Army Maritime Corps, the waterborne navy stationed on Gaia. For sailors that are more inclined towards style than safety."
	icon_state = "beret_maritime"
	item_state_slots = list(
		slot_l_hand_str = "hat_utility_tan_held_l",
		slot_r_hand_str = "hat_utility_tan_held_r",
		slot_head_str = "beret_maritime_worn"
	)

//loadout injection
/datum/gear/head/armyberet
	display_name = "army beret selection"
	description = "A beret denoting service in one of the divisions within the SCG Army."
	path = /obj/item/clothing/head/scga/beret
//	allowed_branches = list(/datum/mil_branch/scga)

/datum/gear/head/armyberet/New()
	..()
	var/berets = list()
	berets["first infantry beret"] = /obj/item/clothing/head/scga/beret/firstinf
	berets["first airborne beret"] = /obj/item/clothing/head/scga/beret/airborne
	berets["second infantry beret"] = /obj/item/clothing/head/scga/beret/secondinf
	berets["first cavalry beret"] = /obj/item/clothing/head/scga/beret/firstcav
	berets["first armored beret"] = /obj/item/clothing/head/scga/beret/firstarm
	berets["maritime corps beret"] = /obj/item/clothing/head/scga/beret/maritime
	gear_tweaks += new/datum/gear_tweak/path(berets)
