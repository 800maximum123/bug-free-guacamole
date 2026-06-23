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
	icon = 'mods/_fd/fd_assets/icons/tg/weather_effects.dmi'
	icon_state = "rain_high"
	requires_power = 0

/area/bunker/lounge
	name = "Beach Lounge"
	requires_power = 0

/area/bunker/interlude
	name = "Bluespace Interlude (Bunker)"
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

/area/bunker/lower/monorail/tramway
	name = "Bunker - Tramway"

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



/obj/item/reagent_containers/food/snacks/fd_crops
	name = "crop"
	desc = "Some kind of harvestable crop. Looks kinda tasty."
	icon = 'maps/torch_doh/harvest.dmi'
	icon_state = "berrypile"

/obj/item/reagent_containers/food/snacks/fd_crops/corn
	icon_state = "corn"
	nutriment_desc = list("corn" = 2)
	nutriment_amt = 4
	bitesize = 1
/obj/item/reagent_containers/food/snacks/fd_crops/corn/Initialize()
	.=..()
	reagents.add_reagent(/datum/reagent/nutriment/cornoil, 5)

/obj/item/reagent_containers/food/snacks/fd_crops/saltygreen
	icon_state = "siti"
	nutriment_desc = list("salt" = 5, "dryness" = 2)
	nutriment_amt = 4
	bitesize = 1
/obj/item/reagent_containers/food/snacks/fd_crops/saltygreen/Initialize()
	.=..()
	reagents.add_reagent(/datum/reagent/sodiumchloride, 2)

/obj/item/reagent_containers/food/snacks/fd_crops/tastycactus
	icon_state = "galaxythistle"
	nutriment_desc = list("heartiness" = 2, "sweetness" = 5)
	nutriment_amt = 2
	bitesize = 1
/obj/item/reagent_containers/food/snacks/fd_crops/tastycactus/Initialize()
	.=..()
	reagents.add_reagent(/datum/reagent/nutriment/honey, 5)
	reagents.add_reagent(/datum/reagent/bicaridine, 5)

/obj/item/reagent_containers/food/snacks/fd_crops/sugarcrop
	icon_state = "moonflower"
	nutriment_desc = list("sugar" = 5)
	nutriment_amt = 2
	bitesize = 2
/obj/item/reagent_containers/food/snacks/fd_crops/sugarcrop/Initialize()
	.=..()
	reagents.add_reagent(/datum/reagent/sugar, 5)

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
/*	var/mob/living/currently_connected_texter_1
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

	visuals.set_text(final_message)*/

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

/obj/structure/fd/random_junk/big_fire
	mouse_opacity = FALSE

	icon = 'mods/_fd/fd_assets/icons/goons/fire_chemical.dmi'
	icon_state = "red_full"

	layer = 4.10
	plane = 6

	alpha = 0
	pixel_y = 22

	light_color = COLOR_DARK_ORANGE

/obj/structure/fd/random_junk/big_fire/Initialize()
	. = ..()
	SetTransform(null,1.3,2)

/obj/item/beach_ball/bleba
	icon = 'mods/_fd/fd_assets/icons/tg/rift.dmi'
	icon_state = "mossglob"

	name = "Блёба"
	desc = "Странный сгусток мха. Кажется, у него есть глаза."

/obj/structure/fd/random_junk/big_campfire
	name = "campfire"
	desc = "Very big campfire."
	icon = 'mods/_fd/fd_assets/icons/goons/exploration.dmi'
	icon_state = "woodclutter4"

	anchored = TRUE
	density = TRUE

	interactive = TRUE
	desc_special_show = TRUE

	var/can_be_lit = FALSE
	var/already_lit = FALSE
	var/obj/structure/fd/random_junk/big_fire/fire

	desc_special = {"Костёр уже давно потух."}

	color = "#333333"

/obj/structure/fd/random_junk/big_campfire/Initialize()
	. = ..()
	SetTransform(2)
	fire = new /obj/structure/fd/random_junk/big_fire(get_turf(src))

/obj/structure/fd/random_junk/big_campfire/interact_with(mob/living/user)

	if(!can_be_lit)
		. = ..()
		return TRUE

	var/list/options = list(
		"ПОТУШИТЬ" = image('mods/_fd/_maps/collective_nightmare/icons/radial.dmi', "red"),
		"ЗАЖЕЧЬ" = image('mods/_fd/_maps/collective_nightmare/icons/radial.dmi', "green"),
	)
	var/chosen_option = show_radial_menu(user, src, options, radius = 60, require_near = TRUE)
	if(!chosen_option)
		return FALSE
	switch(chosen_option)
		if("ПОТУШИТЬ")

			if(!already_lit)
				balloon_alert(user, "|КОСТЁР И НЕ ГОРИТ!|", COLOR_RED)
				return FALSE

			desc_special = {"Куча обугленных дров."}
			animate(fire, alpha = 0, time = 0.3 SECONDS, easing = SINE_EASING)
			fire.light_power = initial(fire.light_power)
			fire.light_range = initial(fire.light_range)

			already_lit = FALSE
			return TRUE

		if("ЗАЖЕЧЬ")
			if(already_lit)
				balloon_alert(user, "|КОСТЁР УЖЕ ГОРИТ!|", COLOR_RED)
				return FALSE

			desc_special = {"Тепло костра наполняет вас решимостью."}
			animate(fire, alpha = 255, time = 0.3 SECONDS, easing = SINE_EASING)
			fire.light_power = 2
			fire.light_range = 5

			already_lit = TRUE
			return TRUE

/obj/structure/fd/random_junk/horn
	name = "white horn"
	desc = "Belongs to some kind of animal probably."
	icon = 'mods/_fd/fd_assets/icons/goons/tail.dmi'
	icon_state = "tail-lizard-detail-1"

	anchored = TRUE
	density = FALSE

	interactive = TRUE
	desc_special_show = TRUE

	desc_special = {"/"В честь победы Амелии над лесным чудищем/". Под тесктом указана дата - <b>XX.XX.2338</b>."}

/obj/structure/fd/random_junk/horn/Initialize()
	. = ..()
	SetTransform(1.5)

/singleton/submap_archetype/bunker
	descriptor = "Abandoned Bunker."
	map = "TRK-17 Torch Bunker"
	crew_jobs = list(
		/datum/job/submap/bunker/amelia,
		/datum/job/submap/bunker/perci,
		/datum/job/submap/bunker/maxim,
		/datum/job/submap/bunker/olivia,
		/datum/job/submap/bunker/wilhelm,
		/datum/job/submap/bunker/wind,
		/datum/job/submap/bunker/joseph,
		/datum/job/submap/bunker/meat,
		/datum/job/submap/bunker/lira,
		/datum/job/submap/bunker/alma,
		/datum/job/submap/bunker/anna,
		/datum/job/submap/bunker/rin,
		/datum/job/submap/bunker/tau,
		/datum/job/submap/bunker/tongtong,
		/datum/job/submap/bunker/duke,
		/datum/job/submap/bunker/bobby,
		/datum/job/submap/bunker/jeanne,
		/datum/job/submap/bunker/ivy,
		/datum/job/submap/bunker/silas,

		/datum/job/submap/fort_manticore/krieger,
		/datum/job/submap/fort_manticore/rain,
	)

/obj/submap_landmark/joinable_submap/bunker
	name = "TRK-17 Torch Bunker"
	archetype = /singleton/submap_archetype/bunker

/datum/job/submap/bunker
	title = "Survivor"
	total_positions = -1
	create_record = TRUE
	skill_points = 70
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
	required_language = LANGUAGE_HUMAN_EURO

/datum/job/submap/bunker/post_equip_rank(mob/living/person, alt_title)
	. = ..()
	person.generate_binds()

/singleton/hierarchy/outfit/bunker
	name = "Default Bunker Appearance"

	uniform = /obj/item/clothing/under/solgov/utility
	shoes = /obj/item/clothing/shoes/jackboots

/datum/job/submap/bunker/anna
	title = "Anna Ortiz"
	total_positions = 1
	outfit_type = /singleton/hierarchy/outfit/bunker/anna

/singleton/hierarchy/outfit/bunker/anna
	name = "Anna Ortiz"

	l_ear = /obj/item/device/radio/headset/syndicate
	id_types = list(/obj/item/card/id/campaign)
	id_slot = slot_wear_id

/obj/submap_landmark/spawnpoint/bunker/anna
	name = "Anna Ortiz"

/datum/job/submap/bunker/rin
	title = "Rinirili"
	total_positions = 1
	outfit_type = /singleton/hierarchy/outfit/bunker/rin

/singleton/hierarchy/outfit/bunker/rin
	name = "Rinirili"

	id_types = list(/obj/item/card/id/campaign)
	id_slot = slot_wear_id

/obj/submap_landmark/spawnpoint/bunker/rin
	name = "Rinirili"

/datum/job/submap/bunker/tau
	title = "Ruth Solveig Erin Tau"
	total_positions = 1
	outfit_type = /singleton/hierarchy/outfit/bunker/tau

/singleton/hierarchy/outfit/bunker/tau
	name = "Ruth Solveig Erin Tau"

	id_types = list(/obj/item/card/id/campaign)
	id_slot = slot_wear_id

/obj/submap_landmark/spawnpoint/bunker/tau
	name = "Ruth Solveig Erin Tau"

/datum/job/submap/bunker/tongtong
	title = "Tongtong"
	total_positions = 1
	outfit_type = /singleton/hierarchy/outfit/bunker/tongtong

/singleton/hierarchy/outfit/bunker/tongtong
	name = "Tongtong"

	id_types = list(/obj/item/card/id/campaign)
	id_slot = slot_wear_id

/obj/submap_landmark/spawnpoint/bunker/tongtong
	name = "Tongtong"

/datum/job/submap/bunker/duke
	title = "Duke Pratt"
	total_positions = 1
	outfit_type = /singleton/hierarchy/outfit/bunker/duke

/singleton/hierarchy/outfit/bunker/duke
	name = "Duke Pratt"

	id_types = list(/obj/item/card/id/campaign)
	id_slot = slot_wear_id

/obj/submap_landmark/spawnpoint/bunker/duke
	name = "Duke Pratt"

/datum/job/submap/bunker/bobby
	title = "Bobby Rankovich"
	total_positions = 1
	outfit_type = /singleton/hierarchy/outfit/bunker/bobby

/singleton/hierarchy/outfit/bunker/bobby
	name = "Bobby Rankovich"

	id_types = list(/obj/item/card/id/campaign)
	id_slot = slot_wear_id

/obj/submap_landmark/spawnpoint/bunker/bobby
	name = "Bobby Rankovich"

/datum/job/submap/bunker/jeanne
	title = "Jeanne Gerber"
	total_positions = 1
	outfit_type = /singleton/hierarchy/outfit/bunker/jeanne

/singleton/hierarchy/outfit/bunker/jeanne
	name = "Jeanne Gerber"

	id_types = list(/obj/item/card/id/campaign)
	id_slot = slot_wear_id

/obj/submap_landmark/spawnpoint/bunker/jeanne
	name = "Jeanne Gerber"

/datum/job/submap/bunker/ivy
	title = "Takehiko Ivy"
	total_positions = 1
	outfit_type = /singleton/hierarchy/outfit/bunker/ivy

/singleton/hierarchy/outfit/bunker/ivy
	name = "Takehiko Ivy"

	id_types = list(/obj/item/card/id/campaign)
	id_slot = slot_wear_id

	r_hand = /obj/item/material/sword/katana

/obj/submap_landmark/spawnpoint/bunker/ivy
	name = "Takehiko Ivy"

/obj/item/fd/simple_grenade/insta_kill
	name = "grenade (SUICIDE)"
	icon_state = "wasp"
	active_state = "wasp1"
	icon = 'mods/_fd/fd_assets/icons/goons/grenade.dmi'
	life_span = 2
	grenade_type = /obj/effect/simple_grenade/suicide

/obj/effect/simple_grenade/suicide
	splash_zone = 1
	zone_color = COLOR_RED

/obj/effect/simple_grenade/suicide/bomb_trigger()
	new /obj/effect/simple_combat_particle/explosion_alt(get_turf(src))
	. = ..()

/obj/effect/simple_grenade/suicide/bomb_effect(turf/where_to_check)
	set waitfor = FALSE

	sleep(trigger_delay)

	for(var/mob/living/mobik in where_to_check)
		if(!mobik.simple_combat_on)
			continue
		shake_camera_MARINE(mobik, steps = 2, strength = 2, time_per_step = 2)
		mobik.simple_health_calculation(mobik.max_simple_health, 50, 0, 0)
		if(mobik.simple_health <= 0)
			if(ishuman(mobik))
				var/mob/living/carbon/human/H = mobik
				H.gib()
			else
				mobik.death()

	QDEL_IN(src, 4 SECONDS)

/datum/job/submap/bunker/dan
	title = "Daniels McDavish"
	total_positions = 1
	outfit_type = /singleton/hierarchy/outfit/bunker/dan

/datum/job/submap/bunker/dan/post_equip_rank(mob/living/person, alt_title)
	. = ..()

	person.add_status_effect(/datum/simple_status/aftercrit, 5 HOURS)

/singleton/hierarchy/outfit/bunker/dan
	name = "Daniels McDavish"

	suit = /obj/item/clothing/suit/storage/manticore_combat
	uniform = /obj/item/clothing/under/manticore_combat

	r_hand = /obj/item/gun/energy/laser
	l_hand = /obj/item/fd/simple_grenade/insta_kill

	id_types = list(/obj/item/card/id/campaign)
	id_slot = slot_wear_id

/obj/submap_landmark/spawnpoint/bunker/dan
	name = "Daniels McDavish"

/datum/job/submap/bunker/silas
	title = "Silas Kane"
	total_positions = 1
	outfit_type = /singleton/hierarchy/outfit/bunker/silas

/singleton/hierarchy/outfit/bunker/silas
	name = "Silas Kane"
	r_hand = /obj/item/device/synthesized_instrument/guitar/multi

	id_types = list(/obj/item/card/id/campaign)
	id_slot = slot_wear_id

/obj/submap_landmark/spawnpoint/bunker/silas
	name = "Silas Kane"

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

	id_types = list(/obj/item/card/id/campaign)
	id_slot = slot_wear_id

/obj/submap_landmark/spawnpoint/bunker/maxim
	name = "Maxim Kuznetsov"

/datum/job/submap/bunker/meat
	title = "Mr Meat"
	total_positions = 1
	outfit_type = /singleton/hierarchy/outfit/bunker/meat

/datum/job/submap/bunker/meat/post_equip_rank(mob/living/person, alt_title)
	. = ..()
	person.max_simple_health = 500
	person.simple_health = 500

	person.simple_armor_natural = 5
	person.add_status_effect(/datum/simple_status/meat_movement)

/singleton/hierarchy/outfit/bunker/meat
	name = "Mr Meat"

	l_ear = /obj/item/device/radio/headset/syndicate
	id_types = list(/obj/item/card/id/campaign)
	id_slot = slot_wear_id

/obj/submap_landmark/spawnpoint/bunker/meat
	name = "Mr Meat"

/datum/job/submap/bunker/wind
	title = "Wind in the Void"
	total_positions = 1
	outfit_type = /singleton/hierarchy/outfit/bunker/wind

/datum/job/submap/bunker/wind/post_equip_rank(mob/living/person, alt_title)
	. = ..()
	person.max_simple_health = 500
	person.simple_health = 500

	person.simple_armor_natural = 5

/singleton/hierarchy/outfit/bunker/wind
	name = "Wind in the Void"

	head = /obj/item/clothing/head/hardhat
	belt = /obj/item/storage/belt/utility/full

	id_types = list(/obj/item/card/id/campaign)
	id_slot = slot_wear_id

/obj/submap_landmark/spawnpoint/bunker/wind
	name = "Wind in the Void"

/datum/job/submap/bunker/olivia
	title = "Olivia Kellong"
	total_positions = 1
	outfit_type = /singleton/hierarchy/outfit/bunker/olivia

/singleton/hierarchy/outfit/bunker/olivia
	name = "Olivia Kellong"

	back = /obj/item/storage/backpack/satchel/grey

	r_hand = /obj/item/clothing/accessory/wristwatch/nullwatch
	belt = /obj/item/nullrod

	id_types = list(/obj/item/card/id/campaign)
	id_slot = slot_wear_id
	glasses = /obj/item/clothing/glasses/hud/science/lobster

/obj/submap_landmark/spawnpoint/bunker/olivia
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

/obj/item/fd/perci_mvi
	name = "MVI Implant"
	desc = "Устройство, собранное Ампером и Мири'ам перед смертью. Что оно вообще делает?..."
	icon = 'mods/_fd/fd_assets/icons/obj/items/stock_parts.dmi'
	icon_state = "adv_scan_module"
	w_class = ITEM_SIZE_TINY

/datum/job/submap/bunker/zlata
	title = "Zlata Savina"
	total_positions = 1
	outfit_type = /singleton/hierarchy/outfit/bunker/zlata

/singleton/hierarchy/outfit/bunker/zlata
	name = "Zlata Savina"

	uniform = /obj/item/clothing/under/dark
	suit = /obj/item/clothing/suit/storage/toggle/labcoat/dark
	gloves = /obj/item/clothing/gloves/insulated/dark

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

	glasses = /obj/item/clothing/glasses/prescription

	id_types = list(/obj/item/card/id/campaign)
	id_slot = slot_wear_id

/obj/submap_landmark/spawnpoint/bunker/amelia
	name = "Amelia Brown"

/obj/effect/simple_grenade/basic/smaller
	splash_zone = 1

/obj/item/gun/projectile/automatic/iccgn/bolter/simple // использует патроны из симплбоёвки
	magazine_type = /obj/item/ammo_magazine/rifle/bolter/simple
	allowed_magazines = /obj/item/ammo_magazine/rifle/bolter/simple

/obj/item/ammo_magazine/rifle/bolter/simple
	ammo_type = /obj/item/ammo_casing/rifle/bolter/simple

/obj/item/ammo_casing/rifle/bolter/simple
	projectile_type = /obj/item/projectile/bullet/rifle/bolter/simple

/obj/item/projectile/bullet/rifle/bolter/simple
	simple_damage = 30
	simple_armor_penetration = 10

	status_to_add = /datum/simple_status/explosion
	status_ignore_armor = TRUE

	status_apply_prob = 50

/obj/item/projectile/bullet/rifle/bolter/simple/on_hit(atom/target, blocked)
	new /obj/effect/simple_grenade/basic/smaller(get_turf(target))

	. = ..()

/obj/item/clothing/suit/storage/perci_coat
	name = "dark coat"
	desc = "Furcoat with pretty dark colors and installed armored plates."
	icon = 'mods/_fd/fd_customs/customs/zakterar/zakterar_robot.dmi'
	icon_state = "domo arigato"
	item_icons = list(
		slot_wear_suit_str = 'mods/_fd/fd_customs/customs/zakterar/zakterar_robot.dmi')

	simple_armor_bonus = 20
	simple_armor_deformation_speed = 2

/obj/item/clothing/under/perci_invisible
	name = "bodysuit"
	desc = "Bodysuit."

	mouse_opacity = FALSE

	icon = 'mods/_fd/fd_customs/customs/zakterar/zakterar_robot.dmi'
	item_icons = list(slot_w_uniform_str = 'mods/_fd/fd_customs/customs/zakterar/zakterar_robot_worn.dmi')
	icon_state = "worn"
	worn_state = "worn"
	gender_icons = 0

/obj/item/clothing/shoes/jackboots/perci_invisible
	name = "heels"
	desc = "Heels."

	icon_state = null
	item_state = null

	mouse_opacity = FALSE

/datum/job/submap/bunker/perci
	title = "Percival Endsley"
	total_positions = 1
	outfit_type = /singleton/hierarchy/outfit/bunker/perci

/datum/job/submap/bunker/perci/post_equip_rank(mob/living/person, alt_title)
	. = ..()

	person.max_simple_health = 200
	person.simple_health = 200

	person.simple_armor_natural = 5

/singleton/hierarchy/outfit/bunker/perci
	name = "Percival Endsley"

	uniform = /obj/item/clothing/under/perci_invisible
	suit = /obj/item/clothing/suit/storage/perci_coat
	back = /obj/item/storage/backpack/satchel/pocketbook/gray

	r_hand = /obj/item/gun/projectile/automatic/iccgn/bolter/simple

	shoes = /obj/item/clothing/shoes/jackboots/perci_invisible

	l_ear = /obj/item/device/radio/headset/syndicate

	backpack_contents = list(/obj/item/ammo_magazine/rifle/bolter/simple = 1)
	id_types = list(/obj/item/card/id/campaign)
	id_slot = slot_wear_id

/obj/submap_landmark/spawnpoint/bunker/perci
	name = "Percival Endsley"

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

	id_types = list(/obj/item/card/id/campaign)
	id_slot = slot_wear_id

/obj/submap_landmark/spawnpoint/bunker/wilhelm
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

	backpack_contents = list(/obj/item/ammo_magazine/mil_rifle = 1)

	id_types = list(/obj/item/card/id/campaign)
	id_slot = slot_wear_id

/obj/submap_landmark/spawnpoint/bunker/alma
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

/obj/item/material/sword/katana/vibro/cassandra
	simple_damage = 60
	name = "Катана Кассандры"
	desc = "Фамильное оружие семьи Де Виго. Что бы это ни значило."

	icon = 'mods/_fd/fd_assets/icons/tg/sword.dmi'
	icon_state = "energy_katana"
	item_icons = list(
		slot_l_hand_str = 'mods/_fd/fd_assets/icons/tg/onmob/swords_lefthand.dmi',
		slot_r_hand_str = 'mods/_fd/fd_assets/icons/tg/onmob/swords_righthand.dmi',
	)
	item_state_slots = list(
		slot_l_hand_str = "energy_katana",
		slot_r_hand_str = "energy_katana",
	)

/datum/job/submap/bunker/looney
	title = "Looney"
	total_positions = 1
	outfit_type = /singleton/hierarchy/outfit/bunker/looney

/singleton/hierarchy/outfit/bunker/looney
	name = "Looney"

	uniform = /obj/item/clothing/under/syndicate/tacticool
	suit = /obj/item/clothing/suit/storage/slivacoat
	back = /obj/item/gun/projectile/automatic/shotgun/scg
	mask = /obj/item/clothing/mask/gas/half

	r_hand = /obj/item/clothing/suit/space/void/battlewizards/captain/prepared
	l_hand = /obj/item/storage/fancy/smokable/phosphor
	belt = /obj/item/material/sword/katana/vibro/cassandra

	l_ear = /obj/item/device/radio/headset/syndicate

	id_types = list(/obj/item/card/id/campaign)
	id_slot = slot_wear_id

/obj/submap_landmark/spawnpoint/looney
	name = "Looney"

/datum/job/submap/bunker/joseph
	title = "Joseph Fiddler"
	total_positions = 1
	outfit_type = /singleton/hierarchy/outfit/bunker/joseph

/datum/job/submap/bunker/joseph/post_equip_rank(mob/living/person, alt_title)
	. = ..()
	person.max_simple_health = 200
	person.simple_health = 200

	person.simple_armor_natural = 5

/singleton/hierarchy/outfit/bunker/joseph
	name = "Joseph Fiddler"

	uniform = /obj/item/clothing/under/solgov/utility/expeditionary/officer/research
	gloves = /obj/item/clothing/gloves/thick/duty/solgov/sci

	l_ear = /obj/item/device/radio/headset/syndicate

	id_types = list(/obj/item/card/id/campaign)
	id_slot = slot_wear_id

/obj/submap_landmark/spawnpoint/bunker/joseph
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
	backpack_contents = list(/obj/item/luckycoin = 1)

	l_ear = /obj/item/device/radio/headset/syndicate

	id_types = list(/obj/item/card/id/campaign)
	id_slot = slot_wear_id

/obj/submap_landmark/spawnpoint/bunker/lira
	name = "Lira Schatten"

#include "..\map\bunker.dmm"
