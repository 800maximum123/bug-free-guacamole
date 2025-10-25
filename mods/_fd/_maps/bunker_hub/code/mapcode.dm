/obj/overmap/visitable/sector/bunker_hub
	name = "TRK-17"
	desc = "Green terraformed world with rich flora and fauna"
	sector_flags = OVERMAP_SECTOR_KNOWN
	icon_state = "globe"
	color = "#63c2c2"
	initial_generic_waypoints = list(
		"nav_alab_1"
	)
	var/list/lightmain

/obj/overmap/visitable/sector/bunker_hub/Initialize()
	..()

	lightmain = block(locate(world.maxx, world.maxy, max(map_z)), locate(1, 1, min(map_z)))
	for(var/atom/A as anything in lightmain)
		if(!istype(A.loc, /area/bunker/jungle) || !istype(A, /turf/) || A.density)
			lightmain -= A
	update_daynight()

/obj/overmap/visitable/sector/bunker_hub/proc/update_daynight(light = 2, light_color_m = "#b3afab")
	for(var/turf/T as anything in lightmain)
		T.set_light(1, light, l_color = light_color_m)

/datum/map_template/ruin/away_site/bunker_hub
	name = "TRK-17 HUB (Campaign)"
	id = "awaysite_bunker_hub"
	spawn_cost = 2
	description = "..."
	prefix = "mods/_fd/_maps/bunker_hub/map/"
	suffixes = list("bunker.dmm")
	area_usage_test_exempted_root_areas = list(/area/bunker)
	apc_test_exempt_areas = list(
		/area/bunker = NO_SCRUBBER|NO_VENT|NO_APC
	)

/obj/shuttle_landmark/nav_bunker_hub
	name = "Nearest Beach"
	landmark_tag = "nav_bunker_hub"
	base_area = /area/bunker/jungle

//БАЗА

/area/bunker/

//ВНЕШНИЙ МИР
/area/bunker/jungle
	name = "Jungle"
	icon = 'mods/_fd/_maps/small_exoplanet_1/icons/weather.dmi'
	icon_state = "rain"
	requires_power = 0

/area/bunker/jungle/lz
	name = "Landing Zone"

//ПЕРВЫЙ ЭТАЖ
/area/bunker/kpp
	name = "Bunker - KPP"

/area/bunker/kitchen
	name = "Bunker - Kitchen"

/area/bunker/kitchen/bufet
	name = "Bunker - Bufet"

/area/bunker/kitchen/freezer
	name = "Bunker - Freezer"

/area/bunker/command
	name = "Bunker - Command Room"

/area/bunker/barracks
	name = "Bunker - Bravo Barracks"

/area/bunker/barracks/preporation
	name = "Bunker - Preporation Room"

/area/bunker/barracks/gvardiya
	name = "Bunker - Gvardiya Barracks"

/area/bunker/barracks/preporation_gvardiya
	name = "Bunker - Gvardiya Preporation Room"

/area/bunker/corridors
	name ="Corridors"

/area/bunker/corridors/north
	name = "Bunker - North Corridor"

/area/bunker/corridors/center
	name = "Bunker - Center Corridor"

/area/bunker/corridors/west
	name = "Bunker - West Corridor"

/area/bunker/corridors/south
	name = "Bunker - South Corridor"

/area/bunker/corridors/south
	name = "Bunker - South Corridor"

/area/bunker/corridors/east
	name = "Bunker - East Corridor"

/area/bunker/eng
	name = "Bunker - Technical Room"

/area/bunker/eng/workshop
	name = "Bunker - Workshop"

/area/bunker/rooms
	name = "Bunker - Room 0"

/area/bunker/rooms/room1
	name = "Bunker - Room 1"

/area/bunker/rooms/room2
	name = "Bunker - Room 2"

/area/bunker/rooms/room3
	name = "Bunker - Room 3"

/area/bunker/rooms/room4
	name = "Bunker - Room 4"

/area/bunker/rooms/room5
	name = "Bunker - Room 5"

/area/bunker/rooms/room6
	name = "Bunker - Room 6"

/area/bunker/rooms/room6
	name = "Bunker - Room 6"

/area/bunker/rooms/room7
	name = "Bunker - Room 7"

/area/bunker/rooms/room8
	name = "Bunker - Room 8"

/area/bunker/rooms/room9
	name = "Bunker - Room 9"

/area/bunker/rooms/room10
	name = "Bunker - Room 10"

/area/bunker/rooms/room11
	name = "Bunker - Room 11"

/area/bunker/rooms/room12
	name = "Bunker - Room 12"

/area/bunker/rooms/room13
	name = "Bunker - Room 13"

/area/bunker/rooms/room14
	name = "Bunker - Room 14"

// НИЖНИЙ УРОВЕНЬ
// Коридоры
/area/bunker/lower/
	name = "Bunker - Lower Level"

/area/bunker/lower/corridos
	name = "Bunker - Corridors"

/area/bunker/lower/kpp1
	name = "Bunker - Stairs KPP"

/area/bunker/lower/kpp2
	name = "Bunker - Science KPP"

//Инженерка
/area/bunker/lower/eng
	name = "Bunker - Engineer Hub"

/area/bunker/lower/eng/warehouse

	name = "Bunker - Warehouse"

/area/bunker/lower/eng/reactor
	name = "Bunker - Reactor"

//Монорельс
/area/bunker/lower/monorail
	name = "Bunker - Monorail"

//Мед крыло
/area/bunker/lower/med
	name = "Bunker - Medical Wing"

/area/bunker/lower/med/cryo
	name = "Bunker - Cryocell"

/area/bunker/lower/med/chem
	name = "Bunker - Chem Lab"

/area/bunker/lower/med/med_bay
	name = "Bunker - Patient Room"

/area/bunker/lower/med/warehouse
	name = "Bunker - Medical Storage"

/area/bunker/lower/med/lobby
	name = "Bunker - Medical Lobby"

/area/bunker/lower/med/mortuary
	name = "Bunker - Mortuary"

/area/bunker/lower/med/surgery
	name = "Bunker - Surgery"

//Лаборатория

/area/bunker/lower/lab
	name = "Bunker - Laboratory"

/area/bunker/lower/lab/office
	name = "Bunker - Office"

/area/bunker/lower/lab/cryolab
	name = "Bunker - VR Lab"

/area/bunker/lower/lab/virology
	name = "Bunker - Virology Lab"

/area/bunker/lower/lab/bslab
	name = "Bunker - Hydroponics Lab"

/singleton/submap_archetype/bunker
	descriptor = "Abandoned Bunker."
	map = "TRK-17 Torch Bunker"
	crew_jobs = list(
		/datum/job/submap/bunker/amelia,
		/datum/job/submap/bunker/maxim,
		/datum/job/submap/bunker/gora,
		/datum/job/submap/bunker/olivia,
		/datum/job/submap/bunker/naia,
		/datum/job/submap/bunker/wilhelm,
		/datum/job/submap/bunker/wind,
		/datum/job/submap/bunker/joseph,
		/datum/job/submap/bunker/froise,
		/datum/job/submap/bunker/looney,
		/datum/job/submap/bunker/meat,
		/datum/job/submap/bunker/lira,
		/datum/job/submap/bunker/zlata,
		/datum/job/submap/bunker/swift,
		/datum/job/submap/bunker/raymond,
		/datum/job/submap/bunker/alma
	)

/obj/submap_landmark/joinable_submap/bunker
	name = "TRK-17 Torch Bunker"
	archetype = /singleton/submap_archetype/bunker

/datum/job/submap/bunker
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

/datum/job/submap/bunker/raymond
	title = "Raymond Datura"
	total_positions = 1
	outfit_type = /singleton/hierarchy/outfit/bunker/raymond

/singleton/hierarchy/outfit/bunker/raymond
	name = "Raymond Datura"

	l_ear = /obj/item/device/radio/headset/headset_com
	id_types = list(/obj/item/card/id/campaign)
	id_slot = slot_wear_id

/obj/submap_landmark/spawnpoint/raymond
	name = "Raymond Datura"

/datum/job/submap/bunker/naia
	title = "Naia Fox"
	total_positions = 1
	outfit_type = /singleton/hierarchy/outfit/bunker/naia

/singleton/hierarchy/outfit/bunker/naia
	name = "Naia Fox"

	l_ear = /obj/item/device/radio/headset/headset_com
	id_types = list(/obj/item/card/id/campaign)
	id_slot = slot_wear_id

/obj/submap_landmark/spawnpoint/naia
	name = "Naia Fox"

/datum/job/submap/bunker/maxim
	title = "Maxim Kuznetsov"
	total_positions = 1
	outfit_type = /singleton/hierarchy/outfit/bunker/maxim

/singleton/hierarchy/outfit/bunker/maxim
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

/datum/job/submap/bunker/meat
	title = "Mr Meat"
	total_positions = 1
	outfit_type = /singleton/hierarchy/outfit/bunker/meat

/singleton/hierarchy/outfit/bunker/meat
	name = "Mr Meat"

	l_ear = /obj/item/device/radio/headset/headset_com
	id_types = list(/obj/item/card/id/campaign)
	id_slot = slot_wear_id

/obj/submap_landmark/spawnpoint/meat
	name = "Mr Meat"

/datum/job/submap/bunker/wind
	title = "Wind in the Void"
	total_positions = 1
	outfit_type = /singleton/hierarchy/outfit/bunker/wind

/singleton/hierarchy/outfit/bunker/wind
	name = "Wind in the Void"

	head = /obj/item/clothing/head/hardhat
	belt = /obj/item/storage/belt/utility/full

	l_ear = /obj/item/device/radio/headset
	id_types = list(/obj/item/card/id/campaign)
	id_slot = slot_wear_id

/obj/submap_landmark/spawnpoint/wind
	name = "Wind in the Void"

/datum/job/submap/bunker/olivia
	title = "Olivia Kellong"
	total_positions = 1
	outfit_type = /singleton/hierarchy/outfit/bunker/olivia

/singleton/hierarchy/outfit/bunker/olivia
	name = "Olivia Kellong"

	r_hand = /obj/item/clothing/accessory/wristwatch/null
	belt = /obj/item/nullrod

	l_ear = /obj/item/device/radio/headset/headset_com
	id_types = list(/obj/item/card/id/campaign)
	id_slot = slot_wear_id

/obj/submap_landmark/spawnpoint/olivia
	name = "Olivia Kellong"

/datum/job/submap/bunker/swift
	title = "SWIFT"
	total_positions = 1
	outfit_type = /singleton/hierarchy/outfit/bunker/swift

/singleton/hierarchy/outfit/bunker/swift
	name = "SWIFT"

	uniform = /obj/item/clothing/under/solgov/utility/expeditionary/officer

	l_ear = /obj/item/device/radio/headset/headset_com
	id_types = list(/obj/item/card/id/campaign)
	id_slot = slot_wear_id

/obj/submap_landmark/spawnpoint/swift
	name = "SWIFT"

/datum/job/submap/bunker/zlata
	title = "Zlata Savina"
	total_positions = 1
	outfit_type = /singleton/hierarchy/outfit/bunker/zlata

/singleton/hierarchy/outfit/bunker/zlata
	name = "Zlata Savina"

	r_hand = /obj/item/fd/perci_mvi

	l_ear = /obj/item/device/radio/headset/headset_com
	id_types = list(/obj/item/card/id/campaign)
	id_slot = slot_wear_id

/obj/submap_landmark/spawnpoint/zlata
	name = "Zlata Savina"

/datum/job/submap/bunker/froise
	title = "Alexander Froise"
	total_positions = 1
	outfit_type = /singleton/hierarchy/outfit/bunker/froise

/singleton/hierarchy/outfit/bunker/froise
	name = "Alexander Froise"

	r_hand = /obj/item/material/sword/makeshift

	l_ear = /obj/item/device/radio/headset
	id_types = list(/obj/item/card/id/campaign)
	id_slot = slot_wear_id

/obj/submap_landmark/spawnpoint/froise
	name = "Alexander Froise"

/datum/job/submap/bunker/amelia
	title = "Amelia Brown"
	total_positions = 1
	outfit_type = /singleton/hierarchy/outfit/bunker/amelia

/singleton/hierarchy/outfit/bunker/amelia
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

/datum/job/submap/bunker/wilhelm
	title = "Wilhelm Canaris"
	total_positions = 1
	outfit_type = /singleton/hierarchy/outfit/bunker/wilhelm

/singleton/hierarchy/outfit/bunker/wilhelm
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

/datum/job/submap/bunker/alma
	title = "Alma Cointreau"
	total_positions = 1
	outfit_type = /singleton/hierarchy/outfit/bunker/alma

/singleton/hierarchy/outfit/bunker/alma
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

/datum/job/submap/bunker/gora
	title = "Gora MoRr"
	total_positions = 1
	outfit_type = /singleton/hierarchy/outfit/bunker/gora

/singleton/hierarchy/outfit/bunker/gora
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

/datum/job/submap/bunker/looney
	title = "Looney"
	total_positions = 1
	outfit_type = /singleton/hierarchy/outfit/bunker/looney

/singleton/hierarchy/outfit/bunker/looney
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

/datum/job/submap/bunker/joseph
	title = "Joseph Fiddler"
	total_positions = 1
	outfit_type = /singleton/hierarchy/outfit/bunker/joseph

/singleton/hierarchy/outfit/bunker/joseph
	name = "Joseph Fiddler"

	uniform = /obj/item/clothing/under/solgov/utility/expeditionary/officer/research
	gloves = /obj/item/clothing/gloves/thick/duty/solgov/sci

	l_ear = /obj/item/device/radio/headset/headset_com

	id_types = list(/obj/item/card/id/campaign)
	id_slot = slot_wear_id

/obj/submap_landmark/spawnpoint/joseph
	name = "Joseph Fiddler"

/datum/job/submap/bunker/lira
	title = "Lira Schatten"
	total_positions = 1
	outfit_type = /singleton/hierarchy/outfit/bunker/lira

/singleton/hierarchy/outfit/bunker/lira
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
