/obj/overmap/visitable/sector/manticore_hub
	name = "TRK-17"
	desc = "Green terraformed world with rich flora and fauna"
	sector_flags = OVERMAP_SECTOR_KNOWN
	icon_state = "globe"
	color = "#63c2c2"
	initial_generic_waypoints = list(
		"nav_alab_1"
	)
	var/list/lightmain

/obj/overmap/visitable/sector/manticore_hub/Initialize()
	..()

	lightmain = block(locate(world.maxx, world.maxy, max(map_z)), locate(1, 1, min(map_z)))
	for(var/atom/A as anything in lightmain)
		if(!istype(A.loc, /area/fort_manticore/jungle) || !istype(A, /turf/) || A.density)
			lightmain -= A
	update_daynight()

/obj/overmap/visitable/sector/manticore_hub/proc/update_daynight(light = 2, light_color_m = "#b3afab")
	for(var/turf/T as anything in lightmain)
		T.set_light(1, light, l_color = light_color_m)

/datum/map_template/ruin/away_site/manticore_hub
	name = "TRK-17 MANTICORE HUB (Campaign)"
	id = "awaysite_manticore_hub"
	spawn_cost = 2
	description = "..."
	prefix = "mods/_fd/_maps/fort_manticore/map/"
	suffixes = list("fort_manticore.dmm")
	area_usage_test_exempted_root_areas = list(/area/fort_manticore)
	apc_test_exempt_areas = list(
		/area/bunker = NO_SCRUBBER|NO_VENT|NO_APC
	)

/obj/shuttle_landmark/nav_manticore_hub
	name = "Fort \"Manticore\" LZ"
	landmark_tag = "nav_manticore_hub"
	base_area = /area/fort_manticore/jungle


/area/fort_manticore/

//ВНЕШНИЙ МИР
/area/fort_manticore/jungle
	name = "Jungle"
	icon = 'mods/_fd/_maps/small_exoplanet_1/icons/weather.dmi'
	icon_state = "rain"
	requires_power = 0

// Боевой эквип Мантикоры
/obj/item/clothing/under/manticore_combat
	name = "tactical turtleneck"
	desc = "An modern military sweater."
	icon = 'mods/_fd/_maps/fort_manticore/icons/clothing.dmi'
	item_icons = list(slot_w_uniform_str = 'mods/_fd/_maps/fort_manticore/icons/clothing_mob.dmi')
	icon_state = "uniform"
	worn_state = "uniform"

	gender_icons = TRUE

/obj/item/clothing/suit/storage/vista_labcoat
	name = "insulated labcoat"
	desc = "For maximum security and your evil plans!"
	icon = 'mods/_fd/_maps/fort_manticore/icons/clothing.dmi'
	item_icons = list(slot_wear_suit_str = 'mods/_fd/_maps/fort_manticore/icons/clothing_mob.dmi')
	icon_state = "vista_labcoat"
	item_state = "vista_labcoat"
	slots = 2
	body_parts_covered = UPPER_TORSO|ARMS
	allowed = list(/obj/item/device/scanner/gas,/obj/item/stack/medical,/obj/item/reagent_containers/dropper,/obj/item/reagent_containers/syringe,/obj/item/reagent_containers/hypospray,/obj/item/device/scanner/health,/obj/item/device/flashlight/pen,/obj/item/reagent_containers/glass/bottle,/obj/item/reagent_containers/glass/beaker,/obj/item/reagent_containers/pill,/obj/item/storage/pill_bottle,/obj/item/paper)
	armor = list(
		bio = ARMOR_BIO_SHIELDED,
		rad = ARMOR_RAD_RESISTANT
		)
	valid_accessory_slots = list(ACCESSORY_SLOT_ARMBAND, ACCESSORY_SLOT_INSIGNIA, ACCESSORY_SLOT_RANK)
	restricted_accessory_slots = list(ACCESSORY_SLOT_ARMBAND)

/obj/item/clothing/suit/storage/manticore_combat
	name = "light armor plate"
	desc = "Used by planet security and PMC."
	icon = 'mods/_fd/_maps/fort_manticore/icons/clothing.dmi'
	item_icons = list(slot_wear_suit_str = 'mods/_fd/_maps/fort_manticore/icons/clothing_mob.dmi')
	icon_state = "armor"
	item_state = "armor"

	equip_delay = 2 SECONDS
	slots = 4
	body_parts_covered = FULL_TORSO
	cold_protection = FULL_TORSO
	heat_protection = FULL_TORSO
	armor = list(
		melee = ARMOR_MELEE_VERY_HIGH,
		bullet = ARMOR_BALLISTIC_RESISTANT,
		laser = ARMOR_LASER_HANDGUNS,
		energy = ARMOR_ENERGY_STRONG,
		bomb = ARMOR_BOMB_PADDED
		)

/obj/item/clothing/head/helmet/manticore_combat
	name = "modern armored helmet"
	desc = "Used by planet security and PMC."
	icon = 'mods/_fd/_maps/fort_manticore/icons/clothing.dmi'
	item_icons = list(slot_head_str = 'mods/_fd/_maps/fort_manticore/icons/clothing_mob.dmi')
	icon_state = "helmet"
	item_state = "helmet"

	armor = list(
		melee = ARMOR_MELEE_VERY_HIGH,
		bullet = ARMOR_BALLISTIC_RESISTANT,
		laser = ARMOR_LASER_HANDGUNS,
		energy = ARMOR_ENERGY_STRONG,
		bomb = ARMOR_BOMB_PADDED
		)

/obj/item/clothing/head/helmet/manticore_combat/rifler
	icon_state = "helmet_rifler"
	item_state = "helmet_rifler"

/obj/item/clothing/head/beret/rifler
	icon = 'mods/_fd/_maps/fort_manticore/icons/clothing.dmi'
	item_icons = list(slot_head_str = 'mods/_fd/_maps/fort_manticore/icons/clothing_mob.dmi')
	icon_state = "beret_rifler"
	item_state = "beret_rifler"

/obj/item/clothing/accessory/scarf/shouldercape/rifler
	name = "old shoulder cloak"
	desc = "Harshly used cloak, which obviously had seen some serious shit..."
	icon = 'mods/_fd/_maps/fort_manticore/icons/clothing.dmi'
	accessory_icons = list(
		slot_w_uniform_str = 'mods/_fd/_maps/fort_manticore/icons/clothing_mob.dmi',
		slot_wear_suit_str = 'mods/_fd/_maps/fort_manticore/icons/clothing_mob.dmi')
	icon_state = "rifler_cloak"
	item_state = "rifler_cloak"
	slot = ACCESSORY_SLOT_INSIGNIA

/singleton/submap_archetype/fort_manticore
	descriptor = "Rebel camp."
	map = "TRK-17 Fort \"Manticore\""
	crew_jobs = list(
		/datum/job/submap/fort_manticore/roku,
		/datum/job/submap/fort_manticore/rifler
	)

/obj/submap_landmark/joinable_submap/fort_manticore
	name = "TRK-17 Fort \"Manticore\""
	archetype = /singleton/submap_archetype/fort_manticore

/datum/job/submap/fort_manticore
	title = "Citizen"
	total_positions = -1
	create_record = TRUE
	skill_points = 62
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

/singleton/hierarchy/outfit/fort_manticore
	name = "Default Fort Appearance"

	uniform = /obj/item/clothing/under/manticore_combat
	shoes = /obj/item/clothing/shoes/jackboots

/datum/job/submap/fort_manticore/roku
	title = "DAIS-Roku-2349"
	total_positions = 1
	outfit_type = /singleton/hierarchy/outfit/fort_manticore/roku

/obj/item/fd/custom_implanter
	name = "Удаляется после инита так что похуй?"
	desc = "Сейм щит"
	var/item_to_spawn = /obj/item/organ/internal/augment
/obj/item/fd/custom_implanter/Initialize()
	. = ..()
	if(ishuman(loc))
		var/mob/living/carbon/human/H = loc
		new item_to_spawn(H)
/obj/item/fd/custom_implanter/roku
	name = "Удаляется после инита так что похуй?"
	desc = "Сейм щит"
	item_to_spawn = /obj/item/organ/internal/augment/adrenalin_injection

/obj/item/storage/pill_bottle/foodpill
	name = "pill bottle (Нутрименты)"
	desc = "Баночка с пилюлями сомнительного вкуса. Зато питательно и сразу рвёшься в бой."
	max_storage_space = 40
	startswith = list(/obj/item/reagent_containers/pill/foodpill = 40)
	wrapper_color = COLOR_GRAY
/obj/item/reagent_containers/pill/foodpill
	name = "Food-Pill (20u)"
	desc = "Пилюля со всем самым важным."
	icon_state = "pill4"
/obj/item/reagent_containers/pill/foodpill/New()
	..()
	reagents.add_reagent(/datum/reagent/nutriment/protein, 10)
	reagents.add_reagent(/datum/reagent/nutriment/coffee, 10)
	color = reagents.get_color()

/singleton/hierarchy/outfit/fort_manticore/roku
	name = "DAIS-Roku-2349"

	glasses = /obj/item/clothing/glasses/hud/it
	r_hand = /obj/item/fd/custom_implanter/roku

	l_ear = /obj/item/device/radio/headset/headset_com
	id_types = list(/obj/item/card/id/campaign)
	id_slot = slot_wear_id

/datum/job/submap/fort_manticore/rifler
	title = "Christiana Rifler"
	total_positions = 1
	outfit_type = /singleton/hierarchy/outfit/fort_manticore/rifler

/singleton/hierarchy/outfit/fort_manticore/rifler
	name = "Christiana Rifler"

	head = /obj/item/clothing/head/beret/rifler
	mask = /obj/item/clothing/accessory/scarf/shouldercape/rifler

	l_ear = /obj/item/device/radio/headset/headset_com
	id_types = list(/obj/item/card/id/campaign)
	id_slot = slot_wear_id
