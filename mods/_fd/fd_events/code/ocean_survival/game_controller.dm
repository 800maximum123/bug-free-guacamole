/obj/screen/wave_timer
	var/obj/structre/fd/ocean_gamemode_controller/controller
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

/obj/structre/fd/ocean_gamemode_controller
	var/obj/screen/wave_timer/connected_timer
	var/wave_timeframe = 3 HOURS
	var/wave_timeframe_current = 3 HOURS

	icon = 'mods/_fd/fd_utilities/icons/newsource.dmi'
	icon_state = "round_events"
	invisibility = 101

/obj/structre/fd/ocean_gamemode_controller/Initialize()
	. = ..()
	connected_timer = new /obj/screen/wave_timer()
	connected_timer.controller = src

/obj/structre/fd/ocean_gamemode_controller/Process()
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
	if(wave_timeframe_current < 0)
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

/obj/structre/fd/ocean_gamemode_controller/proc/start_the_game()
	for(var/mob/living/L in GLOB.player_list)
		L.ocean_gamemode_lore()

	sleep(50)

	shitcoded_screenalert(name = "Атлас", title = "ЭКСТРЕННАЯ ТРАНСЛЯЦИЯ", text = "Внимание, сохраняйте ваше спокойствие. Голос, который вы слышите прямо сейчас - предзаписанное сообщение на случай чрезвычайной ситуации.", icon_choice = 'mods/_fd/fd_events/icons/screen_alert_images.dmi', icon_choice_state = "robot_blue")
	sleep(10 SECONDS)

	shitcoded_screenalert(name = "Атлас", title = "ЭКСТРЕННАЯ ТРАНСЛЯЦИЯ", text = "Тщательно осмотрите себя. При наличии открытого кровотечения, ушибов, или визуального искривления ваших конечностей - осмотрите спасательную капсулу на наличие комплекта первой помощи и немедленно подайте сигнал другим возможным выжившим через терминал.", icon_choice = 'mods/_fd/fd_events/icons/screen_alert_images.dmi', icon_choice_state = "robot_blue")
	sleep(15 SECONDS)

	shitcoded_screenalert(name = "Атлас", title = "ЭКСТРЕННАЯ ТРАНСЛЯЦИЯ", text = "В случае активного затопления внутреннего отсека спасательной капсулы постарайтесь найти и устранить брешь, или, при отсутствии иной возможности - покиньте её как можно быстрее.", icon_choice = 'mods/_fd/fd_events/icons/screen_alert_images.dmi', icon_choice_state = "robot_blue")
	sleep(10 SECONDS)

	shitcoded_screenalert(name = "Атлас", title = "ЭКСТРЕННАЯ ТРАНСЛЯЦИЯ", text = "Не забывайте сохранять спокойствие. Факт того, что вы совершили успешную посадку - уже переводит вас из КАТЕГОРИЯ СМЕРТНОСТИ 3 в КАТЕГОРИЯ СМЕРТНОСТИ 2. По статистике, 43% пострадавших, оказавшихся в КС2 успешно возвращаются домой с минимальными физическими и серьёзными психическими последствиями.", icon_choice = 'mods/_fd/fd_events/icons/screen_alert_images.dmi', icon_choice_state = "robot_blue")
	sleep(15 SECONDS)

	shitcoded_screenalert(name = "Атлас", title = "ЭКСТРЕННАЯ ТРАНСЛЯЦИЯ", text = "Если локация вашей посадки предполагает безопасное нахождение вне спасательной капсулы - специалисты рекомендуют использовать всё, что может потенциально увеличить вашу видимость для спасательной команды и увеличить продовольственные запасы, необходимые для вашего функционирования до их прибытия. Все эти вещи могут повысить ваши шансы и перевести вас в КАТЕГОРИЯ СМЕРТНОСТИ 3, наиболее маловероятных жертв катастрофы.", icon_choice = 'mods/_fd/fd_events/icons/screen_alert_images.dmi', icon_choice_state = "robot_blue")
	sleep(15 SECONDS)

	shitcoded_screenalert(name = "Атлас", title = "ЭКСТРЕННАЯ ТРАНСЛЯЦИЯ", text = "Ориентировочное время прибытия помощи: 899 Земных дней.", icon_choice = 'mods/_fd/fd_events/icons/screen_alert_images.dmi', icon_choice_state = "robot_blue")
	sleep(10 SECONDS)

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

/obj/structre/fd/ocean_gamemode_controller/proc/end_the_game()
	return
