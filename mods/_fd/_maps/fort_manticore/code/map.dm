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

/singleton/submap_archetype/fort_manticore
	descriptor = "Rebel camp."
	map = "TRK-17 Fort \"Manticore\""
	crew_jobs = list(
		/datum/job/submap/fort_manticore/roku
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

	uniform = /obj/item/clothing/under/solgov/utility
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

	l_hand = /obj/item/storage/pill_bottle/foodpill
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

	l_ear = /obj/item/device/radio/headset/headset_com
	id_types = list(/obj/item/card/id/campaign)
	id_slot = slot_wear_id
