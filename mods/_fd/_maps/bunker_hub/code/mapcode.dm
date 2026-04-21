#define STYLE_CHATBOXFONTS(X, S, C1) SPAN_STYLE("text-align: left; font-family: 'Small Fonts'; color: [C1]; font-size: [S]px", "[X]")

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
	name = "TRK-17 BUNKER HUB (Campaign)"
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


/area/bunker/lower/lab/gateway
	name = "Bunker - Gateway Research Wing"


/obj/item/paper/bunker/gateway/warning
	name = "Gateway Notes"
	info = {"
			<center><b><span style='color: green'>ТРЕНИРОВАЧНЫЙ ПОЛИГОН 9-B</span></b></center>
			<center><b><span style='color: red'><small>ТОЛЬКО ДЛЯ ПЕРСОНАЛА УРОВНЯ 4 И ВЫШЕ</small></span></b></center>
			<i>Последниее открытие GATEWAY повредило энергосистему ПОЛИГОНА, что повлекло за собой досрочный вывод из ВРа испытуемых. По решению главного исследователя и главного инженера ПОЛИГОНА все последующие открытия GATEWAY только по разрешению >3 учёных не ниже 4 уровня.</i>
			<br>
			<small>Через 3 суток Терра должна привести необходимые детали для замены, примите их на взлётной площадке.</small>
			"}

/obj/item/paper/bunker/gateway/warning2
	name = "We have a problem"
	info = {"
			<i>Проблема оказалась куда глубже чем мы думали. 5-й и 6-й контур от перегрева вывело из строя всю программу запуска с сохранёнными данными, 3 набора предохранителей и поджарил консоль управления. Если и проводить запуск, то только после полной замены всех комплектующих. А если спрашивать лично меня - перевести ворота на Южный Полигон 31-К. Там есть все условия для стабильных запусков ворот. </i>
			"}



///////////////////////////////////////////////////////////////////////////////////////

/obj/structure/fd/wild_crops
	name = "crop"
	desc = "Some kind of harvestable crop. You can pull it out with your bare hands!"

	icon = 'maps/torch_doh/growing_vegetables.dmi'
	icon_state = "corn-harvest"

	var/harvest_result = /obj/item/reagent_containers/food/snacks/fd_crops

/obj/structure/fd/wild_crops/Initialize()
	. = ..()
	add_filter("harvestable", 1, list("type" = "outline", , "size" = 0.75, "color" = COLOR_LIME))

/obj/structure/fd/wild_crops/attack_hand(mob/living/user)
	. = ..()

	if(do_after(user, 5 SECONDS, src, DO_PUBLIC_UNIQUE))

		alpha = 0
		mouse_opacity = 0

		addtimer(new Callback(src, PROC_REF(refill)), 10 MINUTES)

		if(!user.skill_check(SKILL_BOTANY, SKILL_TRAINED) && prob(50))
			return
		else
			new harvest_result(get_turf(src))

/obj/structure/fd/wild_crops/proc/refill()
	animate(src, 1 SECONDS, alpha = 255)
	mouse_opacity = 1

/obj/item/reagent_containers/food/snacks/fd_crops
	name = "crop"
	desc = "Some kind of harvestable crop. Looks kinda tasty."
	icon = 'maps/torch_doh/harvest.dmi'
	icon_state = "berrypile"

//КУКУРУЗА
/obj/structure/fd/wild_crops/trk_corn
	harvest_result = /obj/item/reagent_containers/food/snacks/fd_crops/corn

/obj/item/reagent_containers/food/snacks/fd_crops/corn
	icon_state = "corn"
	nutriment_desc = list("corn" = 2)
	nutriment_amt = 4
	bitesize = 1
/obj/item/reagent_containers/food/snacks/fd_crops/corn/Initialize()
	.=..()
	reagents.add_reagent(/datum/reagent/nutriment/cornoil, 5)

//ПРОЧИЕ ФРУКТЫ И ОВОЩИ
/obj/structure/fd/wild_crops/trk_saltygreen
	icon = 'maps/torch_doh/growing_flowers.dmi'
	icon_state = "corpse-flower-harvest"
	harvest_result = /obj/item/reagent_containers/food/snacks/fd_crops/saltygreen

/obj/item/reagent_containers/food/snacks/fd_crops/saltygreen
	icon_state = "siti"
	nutriment_desc = list("salt" = 5, "dryness" = 2)
	nutriment_amt = 4
	bitesize = 1
/obj/item/reagent_containers/food/snacks/fd_crops/saltygreen/Initialize()
	.=..()
	reagents.add_reagent(/datum/reagent/sodiumchloride, 2)

/obj/structure/fd/wild_crops/trk_tastycactus
	icon = 'maps/torch_doh/growing_flowers.dmi'
	icon_state = "galaxythistle-harvest"
	harvest_result = /obj/item/reagent_containers/food/snacks/fd_crops/tastycactus

/obj/item/reagent_containers/food/snacks/fd_crops/tastycactus
	icon_state = "galaxythistle"
	nutriment_desc = list("heartiness" = 2, "sweetness" = 5)
	nutriment_amt = 2
	bitesize = 1
/obj/item/reagent_containers/food/snacks/fd_crops/tastycactus/Initialize()
	.=..()
	reagents.add_reagent(/datum/reagent/nutriment/honey, 5)
	reagents.add_reagent(/datum/reagent/bicaridine, 5)

//ПРИПРАВЫ
/obj/structure/fd/wild_crops/trk_sugarcrop
	icon = 'maps/torch_doh/growing_flowers.dmi'
	icon_state = "moonflower-harvest"
	harvest_result = /obj/item/reagent_containers/food/snacks/fd_crops/sugarcrop

/obj/item/reagent_containers/food/snacks/fd_crops/sugarcrop
	icon_state = "moonflower"
	nutriment_desc = list("sugar" = 5)
	nutriment_amt = 2
	bitesize = 2
/obj/item/reagent_containers/food/snacks/fd_crops/sugarcrop/Initialize()
	.=..()
	reagents.add_reagent(/datum/reagent/sugar, 5)

/obj/structure/fd/wild_crops/trk_coldcrop
	icon = 'maps/torch_doh/growing_fruits.dmi'
	icon_state = "bluetomato-grow6"
	harvest_result = /obj/item/reagent_containers/food/snacks/fd_crops/coldcrop

/obj/item/reagent_containers/food/snacks/fd_crops/coldcrop
	icon_state = "ambrosiadeus"
	nutriment_desc = list("mint" = 5)
	nutriment_amt = 2
	bitesize = 2
/obj/item/reagent_containers/food/snacks/fd_crops/coldcrop/Initialize()
	.=..()
	reagents.add_reagent(/datum/reagent/drink/ice, 2)
	reagents.add_reagent(/datum/reagent/nutriment/mint, 2)
	reagents.add_reagent(/datum/reagent/tricordrazine, 5)

/obj/structure/fd/wild_crops/trk_firecrop
	icon = 'maps/torch_doh/growing_fruits.dmi'
	icon_state = "cherry_bomb-harvest"
	harvest_result = /obj/item/reagent_containers/food/snacks/fd_crops/firecrop

/obj/item/reagent_containers/food/snacks/fd_crops/firecrop
	icon_state = "coffee_arabica"
	nutriment_desc = list("pepper" = 2, "spicy!" = 5, "popcorn" = 2)
	nutriment_amt = 1
	bitesize = 1
/obj/item/reagent_containers/food/snacks/fd_crops/firecrop/Initialize()
	.=..()
	reagents.add_reagent(/datum/reagent/capsaicin, 4)
	reagents.add_reagent(/datum/reagent/blackpepper, 2)
	reagents.add_reagent(/datum/reagent/dylovene, 4)

/obj/structure/fd/wild_crops/trk_coffecrop
	icon = 'maps/torch_doh/growing_fruits.dmi'
	icon_state = "apple-grow5"
	harvest_result = /obj/item/reagent_containers/food/snacks/fd_crops/coffecrop

/obj/item/reagent_containers/food/snacks/fd_crops/coffecrop
	icon_state = "coffee_robusta"
	nutriment_desc = list("chocolate" = 4, "dryness" = 2)
	nutriment_amt = 1
	bitesize = 1
/obj/item/reagent_containers/food/snacks/fd_crops/coffecrop/Initialize()
	.=..()
	reagents.add_reagent(/datum/reagent/drink/coffee/cafe_latte, 6)

/obj/structure/fd/perci_console
	icon = 'mods/_fd/fd_customs/customs/doctoralex/props.dmi'
	icon_state = "oldcomp"
	name = "old console"
	desc = "Старьё, которое, по всем законам, кажется не должно работать."
	var/mob/living/currently_connected_texter_1
	var/mob/currently_connected_texter_2

/obj/structure/fd/perci_console/attack_hand(mob/living/user)
	. = ..()
	if(!currently_connected_texter_1)
		currently_connected_texter_1 = user
		user.overlay_fullscreen("inchat", /obj/screen/fullscreen/blind)
		START_PROCESSING(SSobj, src)

	if(currently_connected_texter_1 != user)
		return

	if(currently_connected_texter_1 == user)
		setup_message(user)

/obj/structure/fd/perci_console/attack_ghost(mob/observer/ghost/user)
	. = ..()
	if(currently_connected_texter_2 != user)
		return

	if(currently_connected_texter_2 == user)
		setup_message(user)

/obj/structure/fd/perci_console/Process()

	if(get_dist(currently_connected_texter_1, src) > 1)
		currently_connected_texter_1.clear_fullscreen("inchat")
		currently_connected_texter_1 = null
		return PROCESS_KILL

/obj/screen/novel_message/chat_message
	alpha = 255

/obj/screen/novel_message/chat_message/set_text(text)
	SetTransform(2)
	maptext = STYLE_CHATBOXFONTS("[text]", 7, COLOR_GREEN)

	spawn(10 SECONDS)
		animate(src, 1 SECOND, alpha = 0)

	QDEL_IN(src, 11 SECONDS)

/obj/structure/fd/perci_console/proc/setup_message(mob/user, text_to_show)
	set waitfor = FALSE

	var/list/should_see_text = list()
	if(!text_to_show)
		text_to_show = input(user, "Сообщение:", "Введите сообщение, которое вы хотели бы чтобы отобразилось компьютерному другу:", "...") as null|text

	if(!text_to_show)
		return

	for(var/obj/screen/novel_message/chat_message/messages in world)
		var/move_by_pixels = messages.maptext_y + 30
		animate(messages, maptext_y = move_by_pixels, time = 1 SECOND, easing = SINE_EASING|EASE_IN)

	sleep(1 SECOND)

	should_see_text += currently_connected_texter_1
	should_see_text += currently_connected_texter_2

	var/final_message = "/...[text_to_show]"

	var/obj/screen/novel_message/chat_message/visuals = new /obj/screen/novel_message/chat_message()
	visuals.maptext_y = -200
	visuals.maptext_x = -50
	for(var/mob/M in should_see_text)
		if(M.client)
			M.client.screen += visuals

	visuals.set_text(final_message)

/mob/living/simple_animal/fd/perci_bot1
	name = "drone"
	desc = "Simple spider-like drone."
	icon = 'mods/_fd/_maps/bunker_hub/icons/perci_bot.dmi'
	maxHealth = 99999
	health = 99999
	icon_state = "blitz"

	mob_size = MOB_SMALL
	pass_flags = PASS_FLAG_TABLE
	density = FALSE

/mob/living/simple_animal/fd/perci_bot2
	name = "creepy robot"
	desc = "Shell of long-dead IPC."
	icon = 'mods/_fd/_maps/bunker_hub/icons/perci_bot.dmi'
	maxHealth = 99999
	health = 99999
	icon_state = "baseline_grey_off"

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
		/datum/job/submap/bunker/alma,
		///MANTICORE GUESTS///
		/datum/job/submap/fort_manticore/roku,
		/datum/job/submap/fort_manticore/rifler,
		/datum/job/submap/fort_manticore/ace,
		/datum/job/submap/fort_manticore/rain,
		/datum/job/submap/fort_manticore/lukash,
		/datum/job/submap/fort_manticore/xrim,
		/datum/job/submap/fort_manticore/victor,
		/datum/job/submap/fort_manticore/kai,
		/datum/job/submap/fort_manticore/cf355,
		/datum/job/submap/fort_manticore/rk381,
		/datum/job/submap/fort_manticore/pavel,
		/datum/job/submap/fort_manticore/luke,
		/datum/job/submap/fort_manticore/adriano,
		/datum/job/submap/fort_manticore/lin
	)

/obj/submap_landmark/joinable_submap/bunker
	name = "TRK-17 Torch Bunker"
	archetype = /singleton/submap_archetype/bunker

/datum/job/submap/bunker
	title = "Survivor"
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

/singleton/hierarchy/outfit/bunker
	name = "Default Bunker Appearance"

	uniform = /obj/item/clothing/under/solgov/utility
	shoes = /obj/item/clothing/shoes/jackboots

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

	uniform = /obj/item/clothing/under/dark
	suit = /obj/item/clothing/suit/storage/toggle/labcoat/dark
	gloves = /obj/item/clothing/gloves/insulated/dark
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

	belt = /obj/item/storage/belt/security

	l_ear = /obj/item/device/radio/headset/headset_sec/alt
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

	uniform = /obj/item/clothing/under/rank/psych/turtleneck/sweater
	suit = /obj/item/clothing/suit/storage/amelia_combatrig
	back = /obj/item/storage/backpack/satchel/pocketbook/gray

	l_ear = /obj/item/device/radio/headset/headset_com
	glasses = /obj/item/clothing/glasses/prescription

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
	suit = /obj/item/clothing/suit/storage/looney_jacket
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
