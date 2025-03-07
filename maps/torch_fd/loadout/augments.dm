/datum/gear/augment
	sort_category = "Augments"
	category = /datum/gear/augment

/datum/gear/augment/chest_fluff
	display_name = "Chest Augments (Fluff)"
	description = "Chest cybernetic augments without or with very small in-game effects."
	path = /obj/item/organ/internal/augment
	cost = 2

/datum/gear/augment/chest_fluff/New()
	..()
	var/list/options = list()
	options["internal air system"] = /obj/item/organ/internal/augment/active/internal_air_system
	options["leukocyte breeder"] = /obj/item/organ/internal/augment/active/leukocyte_breeder
	options["emergency battery"] = /obj/item/organ/internal/augment/emergency_battery
	options["skeletal bracing"] = /obj/item/organ/internal/augment/skeletal_bracing
	options["ultraviolet shielding"] = /obj/item/organ/internal/augment/ultraviolet_shielding
	gear_tweaks += new /datum/gear_tweak/path (options)

/datum/gear/augment/chest_major
	display_name = "Chest Augments (Major)"
	description = "Chest cybernetic augments with various heavy in-game effects."
	path = /obj/item/organ/internal/augment
	cost = 4

/datum/gear/augment/chest_major/New()
	..()
	var/list/options = list()
	options["nerve dampeners"] = /obj/item/organ/internal/augment/active/nerve_dampeners
	options["tesla spine"] = /obj/item/organ/internal/augment/tesla
	options["subdermal armor"] = /obj/item/organ/internal/augment/armor
	gear_tweaks += new /datum/gear_tweak/path (options)

/datum/gear/augment/head_fluff
	display_name = "Head Augments (Fluff)"
	description = "Head cybernetic augments without or with very small in-game effects."
	path = /obj/item/organ/internal/augment
	cost = 2

/datum/gear/augment/head_fluff/New()
	..()
	var/list/options = list()
	options["glare dampeners"] = /obj/item/organ/internal/augment/active/item/glare_dampeners
	options["integrated filth HUD"] = /obj/item/organ/internal/augment/active/hud/janitor
	options["iatric monitor"] = /obj/item/organ/internal/augment/active/iatric_monitor
	options["synthetic hair extensions"] = /obj/item/organ/internal/augment/active/cyber_hair
	options["circadian conditioner"] = /obj/item/organ/internal/augment/circadian_conditioner
	options["codex access chip"] = /obj/item/organ/internal/augment/codex_access
	options["neurostimulator implant"] = /obj/item/organ/internal/augment/neurostimulator_implant
	options["pain assistant"] = /obj/item/organ/internal/augment/pain_assistant
	options["genetic backup"] = /obj/item/organ/internal/augment/genetic_backup
	options["data chip"] = /obj/item/organ/internal/augment/data_chip
	gear_tweaks += new /datum/gear_tweak/path (options)

/datum/gear/augment/head_major
	display_name = "Head Augments (Major)"
	description = "Head cybernetic augments with various heavy in-game effects."
	path = /obj/item/organ/internal/augment
	cost = 4

/datum/gear/augment/head_major/New()
	..()
	var/list/options = list()
	options["synapse interceptor"] = /obj/item/organ/internal/augment/boost/reflex
	options["vision enhanced retinas"] = /obj/item/organ/internal/augment/active/enhanced_vision
	options["integrated h-eye-lighting module"] = /obj/item/organ/internal/augment/active/flash_eyes
	options["integrated health HUD"] = /obj/item/organ/internal/augment/active/hud/health
	options["integrated security HUD"] = /obj/item/organ/internal/augment/active/hud/security
	options["integrated sciHUD"] = /obj/item/organ/internal/augment/active/hud/science
	gear_tweaks += new /datum/gear_tweak/path (options)

/datum/gear/augment/r_arm
	display_name = "(Primary) Arm Augments"
	description = "In-hand cybernetic augments with various major in-game effects."
	path = /obj/item/organ/internal/augment
	cost = 4

/datum/gear/augment/r_arm/New()
	..()
	var/list/options = list()
	options["embedded blade"] = /obj/item/organ/internal/augment/active/item/armblade
	options["concealed wrist blade"] = /obj/item/organ/internal/augment/active/item/wrist_blade
	options["integrated circuit frame"] = /obj/item/organ/internal/augment/active/item/circuit/fd
	options["pop-out shotgun"] = /obj/item/organ/internal/augment/active/item/popout_shotgun
	options["pneumatic power gauntlet"] = /obj/item/organ/internal/augment/active/item/powerfist
	options["arm storage"] = /obj/item/organ/internal/augment/active/arm_storage
	gear_tweaks += new /datum/gear_tweak/path (options)

/datum/gear/augment/l_arm
	display_name = "(Secondary) Arm Augments"
	description = "In-hand cybernetic augments with various major in-game effects."
	path = /obj/item/organ/internal/augment
	cost = 4

/datum/gear/augment/l_arm/New()
	..()
	var/list/options = list()
	options["embedded blade"] = /obj/item/organ/internal/augment/active/item/armblade
	options["concealed wrist blade"] = /obj/item/organ/internal/augment/active/item/wrist_blade
	options["integrated circuit frame"] = /obj/item/organ/internal/augment/active/item/circuit/fd
	options["pop-out shotgun"] = /obj/item/organ/internal/augment/active/item/popout_shotgun
	options["pneumatic power gauntlet"] = /obj/item/organ/internal/augment/active/item/powerfist
	options["arm storage"] = /obj/item/organ/internal/augment/active/arm_storage
	gear_tweaks += new /datum/gear_tweak/path (options)

/datum/gear/augment/r_hand
	display_name = "(Primary) Hand Augments"
	description = "In-hand cybernetic augments with various major in-game effects."
	path = /obj/item/organ/internal/augment
	cost = 4

/datum/gear/augment/r_hand/New()
	..()
	var/list/options = list()
	options["cyberclaws"] = /obj/item/organ/internal/augment/active/item/wolverine
	options["integrated circuit frame"] = /obj/item/organ/internal/augment/active/item/circuit
	options["engineering toolset"] = /obj/item/organ/internal/augment/active/polytool_fd/engineer
	options["surgical toolset"] = /obj/item/organ/internal/augment/active/polytool_fd/surgical
	options["general utility implant"] = /obj/item/organ/internal/augment/active/polytool_fd/general
	options["integrated timepiece"] = /obj/item/organ/internal/augment/active/timepiece
	gear_tweaks += new /datum/gear_tweak/path (options)

/datum/gear/augment/l_hand
	display_name = "(Secondary) Hand Augments"
	description = "In-hand cybernetic augments with various major in-game effects."
	path = /obj/item/organ/internal/augment
	cost = 4

/datum/gear/augment/l_hand/New()
	..()
	var/list/options = list()
	options["cyberclaws"] = /obj/item/organ/internal/augment/active/item/wolverine
	options["integrated circuit frame"] = /obj/item/organ/internal/augment/active/item/circuit
	options["engineering toolset"] = /obj/item/organ/internal/augment/active/polytool_fd/engineer
	options["surgical toolset"] = /obj/item/organ/internal/augment/active/polytool_fd/surgical
	options["general utility implant"] = /obj/item/organ/internal/augment/active/polytool_fd/general
	options["integrated timepiece"] = /obj/item/organ/internal/augment/active/timepiece
	gear_tweaks += new /datum/gear_tweak/path (options)

/datum/gear/augment/other
	display_name = "Other Augments (Major)"
	description = "Cybernetic augments with various heavy in-game effects."
	path = /obj/item/organ/internal/augment
	cost = 4

/datum/gear/augment/other/New()
	..()
	var/list/options = list()
	options["agility enhancer"] = /obj/item/organ/internal/augment/active/agility
	gear_tweaks += new /datum/gear_tweak/path (options)
