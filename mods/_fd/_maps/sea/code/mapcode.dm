/obj/overmap/visitable/sector/seaplanet
	name = "Sea"
	desc = "Blue ocean world"
	sector_flags = OVERMAP_SECTOR_KNOWN
	icon_state = "globe"
	color = "#63c2c2"
	initial_generic_waypoints = list()
	var/list/lightmain

/obj/overmap/visitable/sector/seaplanet/Initialize()
	..()

	lightmain = block(locate(world.maxx, world.maxy, max(map_z)), locate(1, 1, min(map_z)))
	for(var/atom/A as anything in lightmain)
		if(istype(A.loc, /area/sea/underwater) || !istype(A, /turf/) || A.density)
			lightmain -= A
	update_daynight()

/obj/overmap/visitable/sector/seaplanet/proc/update_daynight(light = 2, light_color_m = "#d8ffff")
	for(var/turf/T as anything in lightmain)
		T.set_light(1, light, l_color = light_color_m)

/singleton/submap_archetype/sea
	descriptor = "Sea"
	map = "Sea"
	crew_jobs = list(/datum/job/submap/sea)

/obj/submap_landmark/joinable_submap/sea
	name = "Sea"
	archetype = /singleton/submap_archetype/sea

/datum/job/submap/sea
	title = "Survivor"
	total_positions = -1
	outfit_type = /singleton/hierarchy/outfit/sea
	create_record = TRUE
	skill_points = 72
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

/datum/job/submap/sea/post_equip_rank(mob/living/person, alt_title)
	. = ..()
	person.simple_combat_on = TRUE
	person.generate_binds()
	person.anchored = TRUE

/singleton/hierarchy/outfit/sea
	name = "Survivor Appearance"

	uniform = /obj/item/clothing/under/fa/vacsuit
	back = /obj/item/storage/backpack/satchel

	backpack_contents = list(/obj/item/storage/box/survival = 1)

/obj/submap_landmark/spawnpoint/sea
	name = "Survivor"

/obj/screen/wave_timer
	var/obj/structure/fd/ocean_gamemode_controller/controller
	maptext_width = 280
	maptext_height = 280
	screen_loc = "CENTER,CENTER+5"

	icon = null
	icon_state = null

/obj/screen/wave_timer/Initialize()
	. = ..()
	SetTransform(2)

/obj/screen/wave_timer/proc/show_screentext(message = {"test"})
	maptext = STYLE_SMALLFONTS_OUTLINE("[message]", 7, COLOR_WHITE, COLOR_BLACK)

/obj/screen/wave_timer/proc/reset_screentext()
	maptext = ""

/mob/living
	var/obj/screen/wave_timer/wave_timer

/mob/living/Life()
	if(gate_timer && !(gate_timer in client.screen))
		client.screen += gate_timer

	. = ..()

/obj/structure/fd/ocean_gamemode_controller
	var/obj/screen/wave_timer/connected_timer
	var/wave_timeframe = 3 HOURS
	var/wave_timeframe_current = 3 HOURS

	icon = 'mods/_fd/fd_utilities/icons/newsource.dmi'
	icon_state = "round_events"
	invisibility = 101

/obj/structure/fd/ocean_gamemode_controller/Initialize()
	. = ..()
	connected_timer = new /obj/screen/wave_timer()
	connected_timer.controller = src

/obj/structure/fd/ocean_gamemode_controller/Process()
	if(wave_timeframe_current > 0)
		wave_timeframe_current -= 1
		if(wave_timeframe_current > (wave_timeframe / 2))
			connected_timer.show_screentext({"До наводнения: <b><span style="color: yellow;">[wave_timeframe_current]</span></b>"})
			connected_timer.maptext_x = -24
			connected_timer.maptext_y = 0
		else
			connected_timer.show_screentext({"До наводнения: <b><span style="color: red;">[wave_timeframe_current]</span></b>"})
			connected_timer.maptext_x = -24
			connected_timer.maptext_y = 0
	if(wave_timeframe_current <= 0)
		end_the_game()

/obj/structure/fd/placeholder/ocean_gamemode_blockers

/mob/proc/ocean_gamemode_lore()
	overlay_fullscreen("background",/obj/screen/fullscreen/fd/blackout)
	var/message = {"Сирены звучат со всех сторон."}

	var/obj/screen/player_message/maintext = new /obj/screen/player_message()
	maintext.plane = HUD_PLANE
	maintext.layer = HUD_ABOVE_HUD_LAYER
	maintext.maptext_x = 0
	maintext.maptext_y = -210

	client.screen += maintext
	maintext.set_text(message, COLOR_WHITE)

	spawn(6 SECONDS)
		message = {"Обычная археологическая разведка закончилась настоящей катастрофой."}
		maintext.set_text(message, COLOR_WHITE)

	spawn(14 SECONDS)
		message = {"С трудом, спотыкаясь и толкая других - вы бежите по коридорам Факела, к шлюпкам, надеясь что на вас <span style="color: red;">хватит места</span>."}
		maintext.set_text(message, COLOR_WHITE)

	spawn(22 SECONDS)
		message = {"Ремни на ваших плечах давят. Потолок слишком низкий. Бочкообразную капсулу в которую вы залезли трясёт, а жар внутри становится практически невозможным."}
		maintext.set_text(message, COLOR_WHITE)

	spawn(30 SECONDS)
		message = {"Взгляд плывёт, голова кружится. В конечном счёте, очередной толчок заставляет ваш затылок соприкоснуться с металлической стеной, и вы <span style="color: red;">теряете сознание</span>."}
		maintext.set_text(message, COLOR_WHITE)

	spawn(40 SECONDS)
		message = ""
		maintext.set_text(message, COLOR_WHITE)

		overlay_fullscreen("eyesopen",/obj/screen/fullscreen/fd/awakening)

	spawn(40.5 SECONDS)
		clear_fullscreen("background")

	spawn(43 SECONDS)
		clear_fullscreen("eyesopen")
		generate_binds()

	spawn(48 SECONDS)
		for(var/obj/screen/messages in client.screen)
			if(istype(messages, /obj/screen/player_message))
				client.screen -= messages
				qdel(messages)

/mob/proc/ocean_gamemode_lore2()
	var/message = {"Просто прекрасно..."}

	var/obj/screen/player_message/maintext = new /obj/screen/player_message()
	maintext.plane = HUD_PLANE
	maintext.layer = HUD_ABOVE_HUD_LAYER
	maintext.maptext_x = 0
	maintext.maptext_y = -210

	client.screen += maintext
	maintext.set_text(message, COLOR_WHITE)

	spawn(6 SECONDS)
		message = {"Всего лишь десятилетие на планете, где гигантское цунами сметает всё на своём пути каждые несколько часов."}
		maintext.set_text(message, COLOR_WHITE)

	spawn(14 SECONDS)
		message = {"Нам придётся придумать <span style="color: yellow;">свой</span> выход из положения, если мы действительно хотим отсюда выбраться."}
		maintext.set_text(message, COLOR_WHITE)

	spawn(22 SECONDS)
		message = {"Похоже, мы упали где-то на мелководье. Судя по мусору вокруг - волна прошла совсем недавно. У нас есть все шансы, нужно лишь...<span style="color: yellow;">найти рабочий челнок</span>."}
		maintext.set_text(message, COLOR_WHITE)

	spawn(30 SECONDS)
		message = {"..."}
		maintext.set_text(message, COLOR_WHITE)

	spawn(32 SECONDS)
		message = {"Сказать проще чем сделать."}
		maintext.set_text(message, COLOR_WHITE)

	spawn(36 SECONDS)
		for(var/obj/screen/messages in client.screen)
			if(istype(messages, /obj/screen/player_message))
				client.screen -= messages
				qdel(messages)

/obj/structure/fd/ocean_gamemode_controller/proc/start_the_game()
	for(var/mob/living/L in GLOB.player_list)
		L.ocean_gamemode_lore()

	sleep(50 SECONDS)

	shitcoded_screenalert(name = "Атлас", title = "ЭКСТРЕННАЯ ТРАНСЛЯЦИЯ", text = "Внимание, сохраняйте ваше спокойствие. Голос, который вы слышите прямо сейчас - предзаписанное сообщение на случай чрезвычайной ситуации.", icon_choice = 'mods/_fd/fd_events/icons/screen_alert_images.dmi', icon_choice_state = "robot_blue")
	sleep(15 SECONDS)

	shitcoded_screenalert(name = "Атлас", title = "ЭКСТРЕННАЯ ТРАНСЛЯЦИЯ", text = "Тщательно осмотрите себя. При наличии открытого кровотечения, ушибов, или визуального искривления ваших конечностей - обыщите спасательную капсулу на наличие комплекта первой помощи и немедленно подайте сигнал другим возможным выжившим через терминал.", icon_choice = 'mods/_fd/fd_events/icons/screen_alert_images.dmi', icon_choice_state = "robot_blue")
	sleep(15 SECONDS)

	shitcoded_screenalert(name = "Атлас", title = "ЭКСТРЕННАЯ ТРАНСЛЯЦИЯ", text = "В случае активного затопления внутреннего отсека спасательной капсулы постарайтесь найти и устранить брешь, или, при отсутствии иной возможности - покиньте её как можно быстрее.", icon_choice = 'mods/_fd/fd_events/icons/screen_alert_images.dmi', icon_choice_state = "robot_blue")
	sleep(15 SECONDS)

	shitcoded_screenalert(name = "Атлас", title = "ЭКСТРЕННАЯ ТРАНСЛЯЦИЯ", text = "Не забывайте сохранять спокойствие. Факт того, что вы совершили успешную посадку - уже переводит вас из КАТЕГОРИЯ СМЕРТНОСТИ 3 в КАТЕГОРИЯ СМЕРТНОСТИ 2.", icon_choice = 'mods/_fd/fd_events/icons/screen_alert_images.dmi', icon_choice_state = "robot_blue")
	sleep(15 SECONDS)

	shitcoded_screenalert(name = "Атлас", title = "ЭКСТРЕННАЯ ТРАНСЛЯЦИЯ", text = "По статистике, 43% пострадавших, оказавшихся в КС2 успешно возвращаются домой с минимальными физическими и серьёзными психическими последствиями.", icon_choice = 'mods/_fd/fd_events/icons/screen_alert_images.dmi', icon_choice_state = "robot_blue")
	sleep(15 SECONDS)

	shitcoded_screenalert(name = "Атлас", title = "ЭКСТРЕННАЯ ТРАНСЛЯЦИЯ", text = "Если локация вашей посадки предполагает безопасное нахождение вне спасательной капсулы - специалисты рекомендуют использовать всё, что может потенциально увеличить вашу видимость для спасательной команды и...", icon_choice = 'mods/_fd/fd_events/icons/screen_alert_images.dmi', icon_choice_state = "robot_blue")
	sleep(15 SECONDS)

	shitcoded_screenalert(name = "Атлас", title = "ЭКСТРЕННАЯ ТРАНСЛЯЦИЯ", text = "...увеличить продовольственные запасы, необходимые для вашего функционирования до их прибытия. Все эти вещи могут повысить ваши шансы и перевести вас в КАТЕГОРИЯ СМЕРТНОСТИ 3, наиболее маловероятных жертв катастрофы.", icon_choice = 'mods/_fd/fd_events/icons/screen_alert_images.dmi', icon_choice_state = "robot_blue")
	sleep(15 SECONDS)

	shitcoded_screenalert(name = "Атлас", title = "ЭКСТРЕННАЯ ТРАНСЛЯЦИЯ", text = "Ориентировочное время прибытия помощи: 899 Земных дней.", icon_choice = 'mods/_fd/fd_events/icons/screen_alert_images.dmi', icon_choice_state = "robot_blue")
	sleep(20 SECONDS)

	for(var/obj/structure/fd/placeholder/ocean_gamemode_blockers/B in world)
		qdel(B)

	for(var/mob/living/L in GLOB.player_list)
		L.anchored = FALSE
		L.ocean_gamemode_lore2()

	sleep(20 SECONDS)
	START_PROCESSING(SSobj,src)
	sleep(1 SECONDS)

	for(var/mob/living/L in GLOB.player_list)
		L.client.screen += connected_timer
		L.wave_timer = connected_timer

/obj/structure/fd/ocean_gamemode_controller/proc/end_the_game()
	var/list/escaped_people = list()

	for(var/obj/structure/fd/ocean_gamemode_pod/P in world)
		if(P.engine && P.wing && P.system && P.basic_repair_done)
			escaped_people += P.mobs_inside

			P.flyoff()

	for(var/mob/living/L in GLOB.player_list)
		L.anchored = TRUE

		L.overlay_fullscreen("background",/obj/screen/fullscreen/fd/blackout)
		var/message = {""}
		if(L in escaped_people)
			message = {"Вы <span style="color: green;">спаслись</span>"}
		else
			message = {"<span style="color: red;">Океан поглотил вас</span>"}

		var/obj/screen/player_message/maintext = new /obj/screen/player_message()
		maintext.plane = HUD_PLANE
		maintext.layer = HUD_ABOVE_HUD_LAYER
		maintext.maptext_x = 0
		maintext.maptext_y = -210

		L.client.screen += maintext
		maintext.set_text(message, COLOR_WHITE)

	sleep(10 SECONDS)

	cutscene_cinema_end()

/obj/structure/fd/ocean_gamemode_pod_parts
	density = TRUE

	name = "parts"
	desc = "We can use it. Totally."

	icon = 'mods/_fd/fd_assets/icons/goons/ship.dmi'
	icon_state = "parts"
	interactive = TRUE
	desc_special_show = TRUE
	desc_special = {"Сменная запчасть для челнока. Может пригодиться."}

/obj/structure/fd/ocean_gamemode_pod_parts/engine
	name = "engine"
	icon_state = "engine-3"

/obj/structure/fd/ocean_gamemode_pod_parts/wings
	name = "wings"
	icon_state = "frame"

/obj/structure/fd/ocean_gamemode_pod_parts/system
	name = "system mainframe"
	icon_state = "ship_gps"

/obj/structure/fd/ocean_gamemode_pod
	var/engine = null
	var/wing = null
	var/system = null

	var/basic_repair_done = FALSE

	name = "broken shuttle"
	desc = "We can use it. Totally."

	icon = 'mods/_fd/fd_assets/icons/goons/64x64.dmi'
	icon_state = "syndsat-crashed"

	density = TRUE
	anchored = TRUE
	pixel_y = -16
	pixel_x = -16

	maptext_y = 48
	maptext_x = -10

	maptext_width = 128
	maptext_height = 96

	var/list/mobs_inside = list()
	var/seats = 10

/obj/structure/fd/ocean_gamemode_pod/proc/flyoff()
	animate(src, pixel_y = -32, time = 1 SECONDS, easing = SINE_EASING | EASE_OUT)
	animate(transform = matrix(40, MATRIX_ROTATE), alpha = 0, pixel_y = -192, pixel_x = 192, time = 5 SECONDS, easing = CUBIC_EASING | EASE_IN)

/obj/structure/fd/ocean_gamemode_pod/Process()
	if(engine)
		maptext = STYLE_SMALLFONTS_OUTLINE("ENGINE:", 7, COLOR_WHITE, COLOR_BLACK)
		maptext += STYLE_SMALLFONTS_OUTLINE(" OP", 7, COLOR_GREEN, COLOR_BLACK)
	if(!engine)
		maptext = STYLE_SMALLFONTS_OUTLINE("ENGINE:", 7, COLOR_WHITE, COLOR_BLACK)
		maptext += STYLE_SMALLFONTS_OUTLINE(" N", 7, COLOR_RED, COLOR_BLACK)
///////////////////////////////////
	if(wing)
		maptext += STYLE_SMALLFONTS_OUTLINE(" | WINGS:", 7, COLOR_WHITE, COLOR_BLACK)
		maptext += STYLE_SMALLFONTS_OUTLINE(" OP", 7, COLOR_GREEN, COLOR_BLACK)
	if(!wing)
		maptext += STYLE_SMALLFONTS_OUTLINE(" | WINGS:", 7, COLOR_WHITE, COLOR_BLACK)
		maptext += STYLE_SMALLFONTS_OUTLINE(" N", 7, COLOR_RED, COLOR_BLACK)
///////////////////////////////////
	if(system)
		maptext += STYLE_SMALLFONTS_OUTLINE(" | SYSTEM:", 7, COLOR_WHITE, COLOR_BLACK)
		maptext += STYLE_SMALLFONTS_OUTLINE(" OP<br>", 7, COLOR_GREEN, COLOR_BLACK)
	if(!system)
		maptext += STYLE_SMALLFONTS_OUTLINE(" | SYSTEM:", 7, COLOR_WHITE, COLOR_BLACK)
		maptext += STYLE_SMALLFONTS_OUTLINE(" N<br>", 7, COLOR_RED, COLOR_BLACK)
///////////////////////////////////
	maptext += STYLE_SMALLFONTS_OUTLINE("           [length(mobs_inside)]/[seats]", 7, COLOR_WHITE, COLOR_BLACK)

/obj/structure/fd/ocean_gamemode_pod/attack_hand(mob/living/user)
	. = ..()

	if(basic_repair_done)
		if(length(mobs_inside) < seats && !(user in mobs_inside) && do_after(user, 5 SECONDS, src, DO_PUBLIC_UNIQUE))
			if(length(mobs_inside) < seats)
				user.forceMove(src)
				mobs_inside += user
			else
				balloon_alert_to_viewers("|ALL SEATS TAKEN|", null, COLOR_RED)
			return TRUE

		if(user in mobs_inside)
			user.forceMove(get_turf(src))
			mobs_inside -= user
			return TRUE

		else
			balloon_alert_to_viewers("|ALL SEATS TAKEN|", null, COLOR_RED)
			return FALSE

/obj/structure/fd/ocean_gamemode_pod/use_tool(obj/item/tool, mob/living/user, list/click_params)
	. = ..()

	if(isWelder(tool) && !basic_repair_done)
		var/obj/item/weldingtool/WT = tool
		if(!WT.can_use(10, user))
			return TRUE

		playsound(loc, pick('sound/items/Welder.ogg', 'sound/items/Welder2.ogg'), 50, 1)
		if(do_after(user, (WT.toolspeed * 10) SECONDS, src, DO_REPAIR_CONSTRUCT))
			if(!src || !WT.remove_fuel(5, user)) return
			balloon_alert_to_viewers("|BASIC FUNCTIONALITY RESTORED|", null, COLOR_GREEN)
			icon_state = "syndsat"
			basic_repair_done = TRUE
			START_PROCESSING(SSobj,src)
		return TRUE

/obj/structure/fd/ocean_gamemode_pod/MouseDrop_T(atom/movable/dropped, mob/living/user)
	. = ..()

	if(!engine && istype(dropped,/obj/structure/fd/ocean_gamemode_pod_parts/engine))
		engine = dropped
		dropped.forceMove(src)
		balloon_alert_to_viewers("|NEW ENGINE INSTALLED|", null, COLOR_GREEN)
		return TRUE

	if(!wing && istype(dropped,/obj/structure/fd/ocean_gamemode_pod_parts/wings))
		wing = dropped
		dropped.forceMove(src)
		balloon_alert_to_viewers("|NEW WINGS ATTACHED|", null, COLOR_GREEN)
		return TRUE

	if(!system && istype(dropped,/obj/structure/fd/ocean_gamemode_pod_parts/system))
		system = dropped
		dropped.forceMove(src)
		balloon_alert_to_viewers("|SYSTEM MAINFRAME ACTIVE|", null, COLOR_GREEN)
		return TRUE

/obj/structure/fd/bird
	icon = 'icons/mob/simple_animal/crow.dmi'
	icon_state = "crow"

	name = "bird"
	density = FALSE
	anchored = TRUE

/obj/structure/fd/bird/Initialize()
	. = ..()
	START_PROCESSING(SSobj,src)

/obj/structure/fd/bird/Process()
	var/list/spookers = list()
	for(var/mob/living/L in range(3,src))
		spookers += L

	if(length(spookers) && alpha == 255)
		fly_away()
		STOP_PROCESSING(SSobj,src)

/obj/structure/fd/bird/proc/fly_away()
	mouse_opacity = 2

	var/direction = pick(1, -1)
	var/horizontal_dist = rand(7, 5 * world.icon_size)
	var/horizontal_time = round(Frand(1 SECOND, 5 SECONDS), 0.1)

	layer = ABOVE_HUMAN_LAYER //conveniently named

	dir = direction ? EAST : WEST

	var/vertical_ease = pick(EASE_IN|BACK_EASING, QUAD_EASING|EASE_OUT)
	var/vertical_dist = 20 * world.icon_size
	var/vertical_time = round(Frand(1.5 SECONDS, 4 SECONDS), 0.1)

	animate(src, pixel_x = horizontal_dist * direction, time = horizontal_time, easing = EASE_OUT|QUAD_EASING)
	animate(src, pixel_y = vertical_dist, time = vertical_time, easing = vertical_ease, flags = ANIMATION_PARALLEL)
	animate(src, delay = vertical_time - (1 SECOND), alpha = 0, time = round(Frand(1 SECOND, 3 SECONDS)), flags = ANIMATION_PARALLEL)
