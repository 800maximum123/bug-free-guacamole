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

// Комнаты экипажа
/area/fort_manticore/rooms
	name = "Rooms"


// Кубик
/area/fort_manticore/rooms/cube
	name = "Rooms - Qoobic"

/area/fort_manticore/rooms/cube/fl2
	name = "Rooms - Qoobic"

//Склад + Эйс
/area/fort_manticore/rooms/warehouse
	name = "Warehouse"

/area/fort_manticore/rooms/warehouse/ace
	name = "Rooms - Ace"

//Року
/area/fort_manticore/rooms/roku
	name = "Rooms - 2349"

//Райфлё
/area/fort_manticore/rooms/rifler
	name = "Rooms - Rifler"

//Ринили
/area/fort_manticore/rooms/rinirili
	name = "Rooms - Rinirili"

//Рейн
/area/fort_manticore/rooms/emmy
	name = "Rooms - Rain"

//Куази
/area/fort_manticore/rooms/quazi
	name = "Rooms - Quazi"

//Кригер
/area/fort_manticore/rooms/kriger
	name = "Rooms - Krieger"

//Мантикоров
/area/fort_manticore/rooms/manticora
	name = "Rooms - Manticora"

//Клотхильд
/area/fort_manticore/rooms/chlothilde
	name = "Rooms - Chlothilde"

//Уфур
/area/fort_manticore/rooms/ufur
	name = "Rooms - Ufur"

//CF and RK
/area/fort_manticore/rooms/cf_rk
	name = "Rooms - CF & RK"

//Martiesa
/area/fort_manticore/rooms/martiesa
	name = "Rooms - Martiesa"

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

	flags_inv = HIDEEARS|BLOCKHAIR

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

/obj/item/clothing/head/beret/lin
	name = "peaked cap"
	desc = "An military-like peaked cap with some gold on it."
	icon = 'mods/_fd/_maps/fort_manticore/icons/clothing.dmi'
	item_icons = list(slot_head_str = 'mods/_fd/_maps/fort_manticore/icons/clothing_mob.dmi')
	icon_state = "cap_lin"
	item_state = "cap_lin"

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
		/datum/job/submap/fort_manticore/rifler,
		/datum/job/submap/fort_manticore/ace,
		/datum/job/submap/fort_manticore/krieger,
		/datum/job/submap/fort_manticore/rain,
		/datum/job/submap/fort_manticore/lukash,
		/datum/job/submap/fort_manticore/xrim,
		/datum/job/submap/fort_manticore/victor,
		/datum/job/submap/fort_manticore/kai,
		/datum/job/submap/fort_manticore/cf355,
		/datum/job/submap/fort_manticore/rk381,
		/datum/job/submap/fort_manticore/pavel,
		/datum/job/submap/fort_manticore/cubic,
		/datum/job/submap/fort_manticore/luke,
		/datum/job/submap/fort_manticore/adriano,
		/datum/job/submap/fort_manticore/lin
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
	reagents.add_reagent(/datum/reagent/nutriment/protein, 15)
	reagents.add_reagent(/datum/reagent/nutriment/coffee, 15)
	color = reagents.get_color()

/singleton/hierarchy/outfit/fort_manticore/roku
	name = "DAIS-Roku-2349"

	glasses = /obj/item/clothing/glasses/hud/it
	r_hand = /obj/item/fd/custom_implanter/roku

	id_types = list(/obj/item/card/id/campaign)
	id_slot = slot_wear_id

/obj/submap_landmark/spawnpoint/manticore/roku
	name = "DAIS-Roku-2349"

/datum/job/submap/fort_manticore/rifler
	title = "Christiana Rifler"
	total_positions = 1
	outfit_type = /singleton/hierarchy/outfit/fort_manticore/rifler

/singleton/hierarchy/outfit/fort_manticore/rifler
	name = "Christiana Rifler"

	head = /obj/item/clothing/head/beret/rifler
	mask = /obj/item/clothing/accessory/scarf/shouldercape/rifler

	l_ear = /obj/item/device/radio/headset/syndicate
	id_types = list(/obj/item/card/id/campaign)
	id_slot = slot_wear_id

/obj/submap_landmark/spawnpoint/manticore/rifler
	name = "Christiana Rifler"

/datum/job/submap/fort_manticore/ace
	title = "Mortimer Ace"
	total_positions = 1
	outfit_type = /singleton/hierarchy/outfit/fort_manticore/ace

/singleton/hierarchy/outfit/fort_manticore/ace
	name = "Mortimer Ace"

	l_ear = /obj/item/device/radio/headset/syndicate
	id_types = list(/obj/item/card/id/campaign)
	id_slot = slot_wear_id

/obj/submap_landmark/spawnpoint/manticore/ace
	name = "Mortimer Ace"

/datum/job/submap/fort_manticore/krieger
	title = "Aldegar Krieger"
	total_positions = 1
	outfit_type = /singleton/hierarchy/outfit/fort_manticore/krieger

/singleton/hierarchy/outfit/fort_manticore/krieger
	name = "Aldegar Krieger"

	id_types = list(/obj/item/card/id/campaign)
	id_slot = slot_wear_id

/obj/submap_landmark/spawnpoint/manticore/krieger
	name = "Aldegar Krieger"

/datum/job/submap/fort_manticore/rain
	title = "Emmy Rain"
	total_positions = 1
	outfit_type = /singleton/hierarchy/outfit/fort_manticore/rain

/mob/living/exosuit/premade/rain_echo
	name = "IB-ECHO"
	desc = "Потрёпанный, но надёжный друг."
/mob/living/exosuit/premade/rain_echo/Initialize()
	if(!arms)
		arms = new /obj/item/mech_component/manipulators/combat(src)
		arms.color = "#BEBEC8"
	if(!legs)
		legs = new /obj/item/mech_component/propulsion/combat(src)
		legs.color = "#BEBEC8"
	if(!head)
		head = new /obj/item/mech_component/sensors/rain_echo(src)
		head.color = "#BEBEC8"
	if(!body)
		body = new /obj/item/mech_component/chassis/combat(src)
		body.color = "#BEBEC8"

	. = ..()
/mob/living/exosuit/premade/rain_echo/spawn_mech_equipment()
	..()
	install_system(new /obj/item/mech_equipment/mounted_system/taser/ballistic/rain_echo(src), HARDPOINT_LEFT_HAND)
	install_system(new /obj/item/mech_equipment/mounted_system/taser/ballistic/smg(src), HARDPOINT_RIGHT_HAND)
	install_system(new /obj/item/mech_equipment/ionjets/strafe(src), HARDPOINT_BACK)
	install_system(new /obj/item/mech_equipment/light(src), HARDPOINT_LEFT_SHOULDER)
	install_system(new /obj/item/mech_equipment/shields/rain_echo(src), HARDPOINT_RIGHT_SHOULDER)
/obj/item/mech_component/sensors/rain_echo
	name = "combat sensors"
	gender = PLURAL
	exosuit_desc_string = "high-resolution thermal sensors"
	icon_state = "combat_head"
	vision_flags = SEE_MOBS
	see_invisible = SEE_INVISIBLE_NOLIGHTING
	power_use = 200

/obj/item/mech_component/sensors/rain_echo/prebuild()
	..()
	software = new(src)
	software.installed_software = list(MECH_SOFTWARE_UTILITY, MECH_SOFTWARE_ENGINEERING, MECH_SOFTWARE_WEAPONS, MECH_SOFTWARE_MEDICAL)

/obj/item/gun/projectile/automatic/assault_rifle/mounted/rain_echo
	burst = 1
	can_autofire = TRUE
	fire_delay = null
	max_shells = 600
	firemodes = list(
		list(mode_name="autofire", burst=1, fire_delay=null, move_delay=null, one_hand_penalty=0, burst_accuracy=null, dispersion=null),
		)
/obj/item/mech_equipment/mounted_system/taser/ballistic/rain_echo
	holding_type = /obj/item/gun/projectile/automatic/assault_rifle/mounted/rain_echo
/obj/item/mech_equipment/shields/rain_echo
	max_charge = 300
	charge = 300
	cooldown = 0.5 SECONDS
	restricted_hardpoints = list(HARDPOINT_RIGHT_SHOULDER)

/singleton/hierarchy/outfit/fort_manticore/rain
	name = "Emmy Rain"

	uniform = /obj/item/clothing/under/ibis
	head = /obj/item/clothing/head/helmet/ibis

	id_types = list(/obj/item/card/id/campaign)
	id_slot = slot_wear_id

/obj/submap_landmark/spawnpoint/manticore/rain
	name = "Emmy Rain"

/datum/job/submap/fort_manticore/lukash
	title = "Lukash Prochazka"
	total_positions = 1
	outfit_type = /singleton/hierarchy/outfit/fort_manticore/lukash

/singleton/hierarchy/outfit/fort_manticore/lukash
	name = "Lukash Prochazka"

	l_ear = /obj/item/device/radio/headset/syndicate
	id_types = list(/obj/item/card/id/campaign)
	id_slot = slot_wear_id

/obj/submap_landmark/spawnpoint/manticore/lukash
	name = "Lukash Prochazka"

/datum/job/submap/fort_manticore/xrim
	title = "Xrim Quazi'Morax"
	total_positions = 1
	outfit_type = /singleton/hierarchy/outfit/fort_manticore/xrim

/singleton/hierarchy/outfit/fort_manticore/xrim
	name = "Xrim Quazi'Morax"

	l_ear = /obj/item/device/radio/headset/syndicate
	id_types = list(/obj/item/card/id/campaign)
	id_slot = slot_wear_id

/obj/submap_landmark/spawnpoint/manticore/xrim
	name = "Xrim Quazi'Morax"

/datum/job/submap/fort_manticore/victor
	title = "Victor Manticora"
	total_positions = 1
	outfit_type = /singleton/hierarchy/outfit/fort_manticore/victor

/singleton/hierarchy/outfit/fort_manticore/victor
	name = "Victor Manticora"

	id_types = list(/obj/item/card/id/campaign)
	id_slot = slot_wear_id

/obj/submap_landmark/spawnpoint/manticore/victor
	name = "Victor Manticora"

/datum/job/submap/fort_manticore/kai
	title = "Ufurzar Shuurr'kai"
	total_positions = 1
	outfit_type = /singleton/hierarchy/outfit/fort_manticore/kai

/singleton/hierarchy/outfit/fort_manticore/kai
	name = "Ufurzar Shuurr'kai"

	id_types = list(/obj/item/card/id/campaign)
	id_slot = slot_wear_id

/obj/submap_landmark/spawnpoint/manticore/kai
	name = "Ufurzar Shuurr'kai"

/datum/job/submap/fort_manticore/cf355
	title = "CF-355"
	total_positions = 1
	outfit_type = /singleton/hierarchy/outfit/fort_manticore/cf355

/singleton/hierarchy/outfit/fort_manticore/cf355
	name = "CF-355"

	id_types = list(/obj/item/card/id/campaign)
	id_slot = slot_wear_id

/obj/submap_landmark/spawnpoint/manticore/cf355
	name = "CF-355"

/datum/job/submap/fort_manticore/rk381
	title = "RK-381"
	total_positions = 1
	outfit_type = /singleton/hierarchy/outfit/fort_manticore/rk381

/singleton/hierarchy/outfit/fort_manticore/rk381
	name = "RK-381"

	id_types = list(/obj/item/card/id/campaign)
	id_slot = slot_wear_id

/obj/submap_landmark/spawnpoint/manticore/rk381
	name = "RK-381"

/datum/job/submap/fort_manticore/pavel
	title = "Pavel Strelkov"
	total_positions = 1
	outfit_type = /singleton/hierarchy/outfit/fort_manticore/pavel

/singleton/hierarchy/outfit/fort_manticore/pavel
	name = "Pavel Strelkov"

	l_ear = /obj/item/device/radio/headset/syndicate
	id_types = list(/obj/item/card/id/campaign)
	id_slot = slot_wear_id

/obj/submap_landmark/spawnpoint/manticore/pavel
	name = "Pavel Strelkov"

/datum/job/submap/fort_manticore/cubic
	title = "Uxim'zu Qoobic"
	total_positions = 1
	outfit_type = /singleton/hierarchy/outfit/fort_manticore/cubic

/singleton/hierarchy/outfit/fort_manticore/cubic
	name = "Uxim'zu Qoobic"

	id_types = list(/obj/item/card/id/campaign)
	id_slot = slot_wear_id

/obj/submap_landmark/spawnpoint/manticore/cubic
	name = "Uxim'zu Qoobic"

/datum/job/submap/fort_manticore/luke
	title = "Luke Liltroy"
	total_positions = 1
	outfit_type = /singleton/hierarchy/outfit/fort_manticore/luke

/singleton/hierarchy/outfit/fort_manticore/luke
	name = "Luke Liltroy"

	id_types = list(/obj/item/card/id/campaign)
	id_slot = slot_wear_id

/obj/submap_landmark/spawnpoint/manticore/luke
	name = "Luke Liltroy"

/datum/job/submap/fort_manticore/adriano
	title = "Adriano Martiesa"
	total_positions = 1
	outfit_type = /singleton/hierarchy/outfit/fort_manticore/adriano

/singleton/hierarchy/outfit/fort_manticore/adriano
	name = "Adriano Martiesa"

	l_ear = /obj/item/device/radio/headset/syndicate
	id_types = list(/obj/item/card/id/campaign)
	id_slot = slot_wear_id

/obj/submap_landmark/spawnpoint/manticore/adriano
	name = "Adriano Martiesa"

/datum/job/submap/fort_manticore/lin
	title = "Lin Mei"
	total_positions = 1
	outfit_type = /singleton/hierarchy/outfit/fort_manticore/lin

/singleton/hierarchy/outfit/fort_manticore/lin
	name = "Lin Mei"

	head = /obj/item/clothing/head/beret/lin

	id_types = list(/obj/item/card/id/campaign)
	id_slot = slot_wear_id

/obj/submap_landmark/spawnpoint/manticore/lin
	name = "Lin Mei"
