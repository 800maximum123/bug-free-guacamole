/obj/overmap/visitable/sector/destroyed_torch
	name = "...𒊒𒁍..."
	desc = "ℸ ̣⍑ᓭ ̣ᒷ ᒷᔑ↸ℸ| リ𝙹 ╎∷∷ℸ ⍑ᔑʖ ̣  ∷ᔑ|𝙹ᒷᒲ⊣ℸʖ⎓𝙹"
	color = "#7500bd"
	sector_flags = OVERMAP_SECTOR_KNOWN
	icon_state = "ship"
	initial_restricted_waypoints = list(
			"GUNBOAT" = list("nav_hangar_gunboat", "nav_gunboat"),
	)
	initial_generic_waypoints = list(
		"nav_gunboat"
	)

/datum/map_template/ruin/away_site/destroyed_torch
	name = "SUNKED TORCH (Campaign)"
	id = "awaysite_dtorch"
	spawn_cost = 2
	description = "..."
	prefix = "mods/_fd/_maps/torch_as_ruin/map/"
	suffixes = list("destroyed_torch.dmm")
	area_usage_test_exempted_root_areas = list(/area/dtorch)
	apc_test_exempt_areas = list(
		/area/dtorch = NO_SCRUBBER|NO_VENT|NO_APC
	)

	shuttles_to_initialise = list(
		/datum/shuttle/autodock/overmap/gunboat,
	)

/area/dtorch
	requires_power = 0

/area/dtorch/atmosalert()
	return

/area/dtorch/fire_alert()
	return

/area/dtorch/fire_reset()
	return

/area/dtorch/readyalert()
	return

/area/dtorch/partyalert()
	return

/area/dtorch/gunboat
	name = "TORCH (ESCAPE BOAT)"

/area/dtorch/deck1
	name = "TORCH (DECK 1, INNER)"

/area/dtorch/deck1/outer
	name = "TORCH (DECK 1, OUTER)"

/area/dtorch/deck2
	name = "TORCH (DECK 2, INNER)"

/area/dtorch/deck2/outer
	name = "TORCH (DECK 2, OUTER)"

/area/dtorch/deck3
	name = "TORCH (DECK 3, INNER)"

/area/dtorch/deck3/outer
	name = "TORCH (DECK 3, OUTER)"

/area/dtorch/deck4
	name = "TORCH (DECK 4, INNER)"

/area/dtorch/deck4/outer
	name = "TORCH (DECK 4, OUTER)"

/area/dtorch/deck5
	name = "TORCH (DECK 5, INNER)"

/area/dtorch/deck5/outer
	name = "TORCH (DECK 5, OUTER)"

/area/dtorch/deck6
	name = "TORCH (DECK 6, INNER)"

/area/dtorch/deck6/outer
	name = "TORCH (DECK 6, OUTER)"

/obj/overmap/visitable/ship/landable/gunboat
	name = "Escape Boat"
	shuttle = "Escape Boat"
	desc = "Собранная на коленке лодка."
	fore_dir = NORTH
	max_speed = 1/(2 SECONDS) //same stats as charon
	burn_delay = 1 SECONDS
	vessel_mass = 5000
	skill_needed = SKILL_BASIC
	free_landing = FALSE

/obj/machinery/computer/shuttle_control/explore/gunboat
	name = "landing control console"
	shuttle_tag = "Escape Boat"

/datum/shuttle/autodock/overmap/gunboat
	name = "Escape Boat"
	move_time = 30
	shuttle_area = list(/area/dtorch/gunboat)
	current_location = "nav_hangar_gunboat"
	landmark_transition = "nav_transit_gunboat"
	range = 1
	fuel_consumption = 0
	ceiling_type = /turf/simulated/floor/shuttle_ceiling
	flags = SHUTTLE_FLAGS_PROCESS
	defer_initialisation = TRUE

/obj/shuttle_landmark/gunboat
	name = "Boat Hangar"
	landmark_tag = "nav_hangar_gunboat"
	base_area = /area/dtorch/deck4/outer

/obj/shuttle_landmark/transit/gunboat
	name = "In transit"
	landmark_tag = "nav_transit_gunboat"

/obj/item/card/id/campaign
	name = "identification card"
	desc = "A card issued to various staff."
	detail_color = COLOR_CIVIE_GREEN

/obj/item/card/id/campaign/Initialize()
	. = ..()
	access = get_all_accesses() | get_all_centcom_access()

/singleton/submap_archetype/destroyed_torch
	descriptor = "Destoryed SCG ship."
	map = "SEV Torch"
	crew_jobs = list(
		/datum/job/submap/dtorch/amelia,
		/datum/job/submap/dtorch/maxim,
		/datum/job/submap/dtorch/gora,
		/datum/job/submap/dtorch/olivia,
		/datum/job/submap/dtorch/naia,
		/datum/job/submap/dtorch/wilhelm,
		/datum/job/submap/dtorch/wind,
		/datum/job/submap/dtorch/joseph,
		/datum/job/submap/dtorch/froise,
		/datum/job/submap/dtorch/looney,
		/datum/job/submap/dtorch/meat,
		/datum/job/submap/dtorch/lira,
		/datum/job/submap/dtorch/zlata,
		/datum/job/submap/dtorch/swift,
		/datum/job/submap/dtorch/raymond,
		/datum/job/submap/dtorch/alma
	)

/obj/submap_landmark/joinable_submap/destroyed_torch
	name = "SEV Torch"
	archetype = /singleton/submap_archetype/destroyed_torch

/datum/job/submap/dtorch
	title = "Survivor"
	total_positions = -1
	create_record = TRUE
	skill_points = 52
	no_skill_buffs = TRUE
	max_skill = list(
		SKILL_BUREAUCRACY = SKILL_MAX,
		SKILL_FINANCE = SKILL_MAX,
		SKILL_EVA = SKILL_MAX,
		SKILL_MECH = SKILL_MAX,
		SKILL_PILOT = SKILL_MAX,
		SKILL_HAULING = SKILL_MAX,
		SKILL_COMPUTER = SKILL_MAX,
		SKILL_BOTANY = SKILL_MAX,
		SKILL_COOKING = SKILL_MAX,
		SKILL_COMBAT = SKILL_MAX,
		SKILL_WEAPONS = SKILL_MAX,
		SKILL_FORENSICS = SKILL_MAX,
		SKILL_CONSTRUCTION = SKILL_MAX,
		SKILL_ELECTRICAL = SKILL_MAX,
		SKILL_ATMOS = SKILL_MAX,
		SKILL_ENGINES = SKILL_MAX,
		SKILL_DEVICES = SKILL_MAX,
		SKILL_SCIENCE = SKILL_MAX,
		SKILL_MEDICAL = SKILL_MAX,
		SKILL_ANATOMY = SKILL_MAX,
		SKILL_CHEMISTRY = SKILL_MAX
	)

/datum/job/submap/dtorch/raymond
	title = "Raymond Datura"
	total_positions = 1
	outfit_type = /singleton/hierarchy/outfit/dtorch/raymond

/singleton/hierarchy/outfit/dtorch/raymond
	name = "Raymond Datura"

	l_ear = /obj/item/device/radio/headset/headset_com
	id_types = list(/obj/item/card/id/campaign)
	id_slot = slot_wear_id

/obj/submap_landmark/spawnpoint/raymond
	name = "Raymond Datura"

/datum/job/submap/dtorch/naia
	title = "Naia Fox"
	total_positions = 1
	outfit_type = /singleton/hierarchy/outfit/dtorch/naia

/singleton/hierarchy/outfit/dtorch/naia
	name = "Naia Fox"

	l_ear = /obj/item/device/radio/headset/headset_com
	id_types = list(/obj/item/card/id/campaign)
	id_slot = slot_wear_id

/obj/submap_landmark/spawnpoint/naia
	name = "Naia Fox"

/datum/job/submap/dtorch/maxim
	title = "Maxim Kuznetsov"
	total_positions = 1
	outfit_type = /singleton/hierarchy/outfit/dtorch/maxim

/singleton/hierarchy/outfit/dtorch/maxim
	name = "Maxim Kuznetsov"

	belt = /obj/item/storage/belt/utility/full
	gloves = /obj/item/clothing/gloves/insulated

	head = /obj/item/clothing/head/welding
	back = /obj/item/storage/backpack/weldpack

	l_ear = /obj/item/device/radio/headset/headset_com
	id_types = list(/obj/item/card/id/campaign)
	id_slot = slot_wear_id

/obj/submap_landmark/spawnpoint/maxim
	name = "Maxim Kuznetsov"

/datum/job/submap/dtorch/meat
	title = "Mr Meat"
	total_positions = 1
	outfit_type = /singleton/hierarchy/outfit/dtorch/meat

/singleton/hierarchy/outfit/dtorch/meat
	name = "Mr Meat"

	l_ear = /obj/item/device/radio/headset/headset_com
	id_types = list(/obj/item/card/id/campaign)
	id_slot = slot_wear_id

/obj/submap_landmark/spawnpoint/meat
	name = "Mr Meat"

/datum/job/submap/dtorch/wind
	title = "Wind in the Void"
	total_positions = 1
	outfit_type = /singleton/hierarchy/outfit/dtorch/wind

/singleton/hierarchy/outfit/dtorch/wind
	name = "Wind in the Void"

	head = /obj/item/clothing/head/hardhat
	belt = /obj/item/storage/belt/utility/full

	l_ear = /obj/item/device/radio/headset
	id_types = list(/obj/item/card/id/campaign)
	id_slot = slot_wear_id

/obj/submap_landmark/spawnpoint/wind
	name = "Wind in the Void"

/datum/job/submap/dtorch/olivia
	title = "Olivia Kellong"
	total_positions = 1
	outfit_type = /singleton/hierarchy/outfit/dtorch/olivia

/singleton/hierarchy/outfit/dtorch/olivia
	name = "Olivia Kellong"

	r_hand = /obj/item/clothing/accessory/wristwatch/null
	belt = /obj/item/nullrod

	l_ear = /obj/item/device/radio/headset/headset_com
	id_types = list(/obj/item/card/id/campaign)
	id_slot = slot_wear_id

/obj/submap_landmark/spawnpoint/olivia
	name = "Olivia Kellong"

/datum/job/submap/dtorch/swift
	title = "SWIFT"
	total_positions = 1
	outfit_type = /singleton/hierarchy/outfit/dtorch/swift

/singleton/hierarchy/outfit/dtorch/swift
	name = "SWIFT"

	uniform = /obj/item/clothing/under/solgov/utility/expeditionary/officer

	l_ear = /obj/item/device/radio/headset/headset_com
	id_types = list(/obj/item/card/id/campaign)
	id_slot = slot_wear_id

/obj/submap_landmark/spawnpoint/swift
	name = "SWIFT"

/datum/job/submap/dtorch/zlata
	title = "Zlata Savina"
	total_positions = 1
	outfit_type = /singleton/hierarchy/outfit/dtorch/zlata

/singleton/hierarchy/outfit/dtorch/zlata
	name = "Zlata Savina"

	r_hand = /obj/item/fd/perci_mvi

	l_ear = /obj/item/device/radio/headset/headset_com
	id_types = list(/obj/item/card/id/campaign)
	id_slot = slot_wear_id

/obj/submap_landmark/spawnpoint/zlata
	name = "Zlata Savina"

/datum/job/submap/dtorch/froise
	title = "Alexander Froise"
	total_positions = 1
	outfit_type = /singleton/hierarchy/outfit/dtorch/froise

/singleton/hierarchy/outfit/dtorch/froise
	name = "Alexander Froise"

	r_hand = /obj/item/material/sword/makeshift

	l_ear = /obj/item/device/radio/headset
	id_types = list(/obj/item/card/id/campaign)
	id_slot = slot_wear_id

/obj/submap_landmark/spawnpoint/froise
	name = "Alexander Froise"

/datum/job/submap/dtorch/amelia
	title = "Amelia Brown"
	total_positions = 1
	outfit_type = /singleton/hierarchy/outfit/dtorch/amelia

/singleton/hierarchy/outfit/dtorch/amelia
	name = "Amelia Brown"

	uniform = /obj/item/clothing/under/color/black
	suit = /obj/item/clothing/suit/storage/oversize_jacket
	back = /obj/item/storage/backpack/satchel/pocketbook/gray
	belt = /obj/item/storage/belt/utility/full

	l_ear = /obj/item/device/radio/headset/headset_com
	glasses = /obj/item/clothing/glasses/welding/superior

	id_types = list(/obj/item/card/id/campaign)
	id_slot = slot_wear_id

/obj/submap_landmark/spawnpoint/amelia
	name = "Amelia Brown"

/datum/job/submap/dtorch/wilhelm
	title = "Wilhelm Canaris"
	total_positions = 1
	outfit_type = /singleton/hierarchy/outfit/dtorch/wilhelm

/singleton/hierarchy/outfit/dtorch/wilhelm
	name = "Wilhelm Canaris"

	uniform = /obj/item/clothing/under/solgov/utility
	suit = /obj/item/clothing/accessory/cloakspace/willheim
	head = /obj/item/clothing/head/helmet/willheim
	back = /obj/item/storage/backpack/satchel/grey

	r_hand = /obj/item/clothing/head/helmet/willheim
	l_hand = /obj/item/gun/energy/laser/lasgun/kanarys

	l_ear = /obj/item/device/radio/headset

	id_types = list(/obj/item/card/id/campaign)
	id_slot = slot_wear_id

/obj/submap_landmark/spawnpoint/wilhelm
	name = "Wilhelm Canaris"

/datum/job/submap/dtorch/alma
	title = "Alma Cointreau"
	total_positions = 1
	outfit_type = /singleton/hierarchy/outfit/dtorch/alma

/singleton/hierarchy/outfit/dtorch/alma
	name = "Alma Cointreau"

	uniform = /obj/item/clothing/under/solgov/utility
	suit = /obj/item/clothing/suit/armor/pcarrier/medium/security
	back = /obj/item/storage/backpack/satchel/grey

	r_hand = /obj/item/gun/projectile/automatic/bullpup_rifle
	l_hand = /obj/item/clothing/accessory/storage/black_vest

	l_ear = /obj/item/device/radio/headset

	id_types = list(/obj/item/card/id/campaign)
	id_slot = slot_wear_id

/obj/submap_landmark/spawnpoint/alma
	name = "Alma Cointreau"

/datum/job/submap/dtorch/gora
	title = "Gora MoRr"
	total_positions = 1
	outfit_type = /singleton/hierarchy/outfit/dtorch/gora

/singleton/hierarchy/outfit/dtorch/gora
	name = "Gora MoRr"

	suit = /obj/item/clothing/suit/storage/hoscoat
	back = /obj/item/gun/projectile/automatic/shotgun/scg

	r_hand = /obj/item/clothing/suit/space/void/battlewizards/prepared
	l_hand = /obj/item/clothing/accessory/storage/black_vest

	l_ear = /obj/item/device/radio/headset/headset_com

	id_types = list(/obj/item/card/id/campaign)
	id_slot = slot_wear_id

/obj/submap_landmark/spawnpoint/gora
	name = "Gora MoRr"

/datum/job/submap/dtorch/looney
	title = "Looney"
	total_positions = 1
	outfit_type = /singleton/hierarchy/outfit/dtorch/looney

/singleton/hierarchy/outfit/dtorch/looney
	name = "Looney"

	uniform = /obj/item/clothing/under/syndicate/tacticool
	suit = /obj/item/clothing/suit/scga/hooded/wintercoat
	back = /obj/item/gun/projectile/automatic/shotgun/scg
	mask = /obj/item/clothing/mask/gas/half

	r_hand = /obj/item/clothing/suit/space/void/battlewizards/captain/prepared
	l_hand = /obj/item/storage/fancy/smokable/phosphor

	l_ear = /obj/item/device/radio/headset

	id_types = list(/obj/item/card/id/campaign)
	id_slot = slot_wear_id

/obj/submap_landmark/spawnpoint/looney
	name = "Looney"

/datum/job/submap/dtorch/joseph
	title = "Joseph Fiddler"
	total_positions = 1
	outfit_type = /singleton/hierarchy/outfit/dtorch/joseph

/singleton/hierarchy/outfit/dtorch/joseph
	name = "Joseph Fiddler"

	uniform = /obj/item/clothing/under/solgov/utility/expeditionary/officer/research
	gloves = /obj/item/clothing/gloves/thick/duty/solgov/sci

	l_ear = /obj/item/device/radio/headset/headset_com

	id_types = list(/obj/item/card/id/campaign)
	id_slot = slot_wear_id

/obj/submap_landmark/spawnpoint/joseph
	name = "Joseph Fiddler"

/datum/job/submap/dtorch/lira
	title = "Lira Schatten"
	total_positions = 1
	outfit_type = /singleton/hierarchy/outfit/dtorch/lira

/singleton/hierarchy/outfit/dtorch/lira
	name = "Lira Schatten"

	uniform = /obj/item/clothing/under/scga/utility/urban/urban/medical/banded
	suit = /obj/item/clothing/suit/storage/toggle/labcoat/cmoalt
	glasses = /obj/item/clothing/glasses/hud/health
	belt = /obj/item/storage/belt/medical/emt
	back = /obj/item/storage/backpack/satchel/pocketbook/brown

	l_ear = /obj/item/device/radio/headset/headset_com

	id_types = list(/obj/item/card/id/campaign)
	id_slot = slot_wear_id

/obj/submap_landmark/spawnpoint/lira
	name = "Lira Schatten"
