// BOMBER EVENT 1

/proc/titles(list/sequence)
    // Проверяем, что список sequence не пустой и существует
    if(!sequence || !length(sequence))
        return

    var/obj/screen/background = new /obj/screen
    background.icon = 'mods/_fd/fd_assets/icons/hud.dmi'
    background.icon_state = "background"
    background.screen_loc = "WEST,SOUTH"
    background.plane = 7
    background.layer = 6

    var/obj/screen/text_display = new /obj/screen
    text_display.screen_loc = "WEST,CENTER"
    text_display.icon_state = "black"
    text_display.maptext_width = 400
    text_display.maptext_height = 100
    text_display.maptext_x = 48
    text_display.plane = 7
    text_display.layer = 6
    // Add objects to all clients' screens
    for(var/client/C)
        C.screen += background
        C.screen += text_display

    for(var/list/item in sequence)
        var/text = item[1]
        var/duration = item[2]
        text_display.maptext = "<center><font color='#9e0101' size='3'>[html_encode(text)]</font></center>"
        sleep(duration * 10)

    // Remove objects from all clients' screens
    for(var/client/C)
        C.screen -= background
        C.screen -= text_display

    qdel(background)
    qdel(text_display)

/proc/titles_no_back(list/sequence)
    // Проверяем, что список sequence не пустой и существует
    if(!sequence || !length(sequence))
        return
    var/obj/screen/text_display = new /obj/screen
    text_display.screen_loc = "WEST,CENTER"
    text_display.icon_state = "blank"
    text_display.maptext_width = 400
    text_display.maptext_height = 100
    text_display.maptext_x = 48
    text_display.plane = 7
    text_display.layer = 6
    // Add objects to all clients' screens
    for(var/client/C)
        C.screen += text_display

    for(var/list/item in sequence)
        var/text = item[1]
        var/duration = item[2]
        text_display.maptext = "<center><font color='#9e0101' size='3'>[html_encode(text)]</font></center>"
        sleep(duration * 10)

    // Remove objects from all clients' screens
    for(var/client/C)
        C.screen -= text_display

    qdel(text_display)

/proc/titles_blue(list/sequence)
    // Проверяем, что список sequence не пустой и существует
    if(!sequence || !length(sequence))
        return

    var/obj/screen/background = new /obj/screen
    background.icon = 'mods/_fd/fd_assets/icons/hud.dmi'
    background.icon_state = "background"
    background.screen_loc = "WEST,SOUTH"
    background.plane = 7
    background.layer = 6

    var/obj/screen/text_display = new /obj/screen
    text_display.screen_loc = "WEST,CENTER"
    text_display.icon_state = "black"
    text_display.maptext_width = 400
    text_display.maptext_height = 100
    text_display.maptext_x = 48
    text_display.plane = 7
    text_display.layer = 6
    // Add objects to all clients' screens
    for(var/client/C)
        C.screen += background
        C.screen += text_display

    for(var/list/item in sequence)
        var/text = item[1]
        var/duration = item[2]
        text_display.maptext = "<center><font color='#1dccc3' size='3'>[html_encode(text)]</font></center>"
        sleep(duration * 10)

    // Remove objects from all clients' screens
    for(var/client/C)
        C.screen -= background
        C.screen -= text_display

    qdel(background)
    qdel(text_display)

/proc/titles_white(list/sequence)
    // Проверяем, что список sequence не пустой и существует
    if(!sequence || !length(sequence))
        return

    var/obj/screen/background = new /obj/screen
    background.icon = 'mods/_fd/fd_assets/icons/hud.dmi'
    background.icon_state = "background"
    background.screen_loc = "WEST,SOUTH"
    background.plane = 7
    background.layer = 6

    var/obj/screen/text_display = new /obj/screen
    text_display.screen_loc = "WEST,CENTER"
    text_display.icon_state = "black"
    text_display.maptext_width = 400
    text_display.maptext_height = 100
    text_display.maptext_x = 48
    text_display.plane = 7
    text_display.layer = 6
    // Add objects to all clients' screens
    for(var/client/C)
        C.screen += background
        C.screen += text_display

    for(var/list/item in sequence)
        var/text = item[1]
        var/duration = item[2]
        text_display.maptext = "<center><font color='#c4c4c4' size='3'>[html_encode(text)]</font></center>"
        sleep(duration * 10)

    // Remove objects from all clients' screens
    for(var/client/C)
        C.screen -= background
        C.screen -= text_display

    qdel(background)
    qdel(text_display)

/proc/title_1()

    var/sound/title_1 = 'mods/_fd/fd_assets/sounds/title_1.ogg'

    world << title_1
    titles(list(
        list("|Конец этой войны увидят только мёртвые| - цитата Адмирала Достоевского", 5),
        list("", 17),
        list("Июнь 2317-го года", 10),
        list("", 8),
        list("Конфликт продолжается уже три года", 10),
        list("", 15),
        list("Человечество находится на грани поражения", 10),
        list("", 5),
        list("Мантикора - это последняя надежда переломить исход противостояния", 10),
    ))

    //captain_transmission() ГАЙЯ

/proc/title_2()

    titles_white(list(
        list("Какое-то время спустя...", 10)
    ))

    var/message = "<span style='color:red; font-size: 20px;'>Вы ощущаете себя просто отвратительно...словно все ваши внутренности вывернуло наизнанку...</span>"
    for(var/mob/M in GLOB.player_list)
        to_chat(M, message)

/proc/bad_ending()

    var/sound/bad = 'mods/_fd/fd_assets/sounds/music/ending_bad.ogg'

    world << bad

    titles(list(
        list("Несмотря на все приложенные усилия...", 10),
        list("", 5),
        list("...в конечном счёте мы оказались слишком слабы", 10),
        list("", 10),
        list("Можно ли сказать, было ли это чем-то вне нашей лиги?", 15),
        list("", 10),
        list("В любом случае, что ещё нам оставалось?...", 10)
    ))

/proc/good_ending()

    var/sound/good = 'mods/_fd/fd_assets/sounds/music/ending_good.ogg'

    world << good

    titles_blue(list(
        list("Новая разработка была успешно доставлена на борт Старой Риги", 15),
        list("", 10),
        list("Пускай в войне нам уже не победить...", 10),
        list("", 10),
        list("Мы внесли огромный вклад в выживание всей человеческой расы", 15),
        list("", 10),
        list("Наверняка, мы даже не застанем того момента, когда Земля вновь поднимется из пепла", 15),
        list("", 10),
        list("Но по крайней мере умрём зная о том, что это ещё не конец...", 10),
    ))




// BOMBER EVENT 2

// Достоевский

/mob/living/simple_animal/holo_npc/dostoevsky
	name = "Alexey Dostoevsky"
	desc = "Старый адмирал Экспедиционного Корпуса и текущий глава ЦПСС и ОСЧ. Этот человек готов на всё, чтобы победить."
	icon = 'mods/_fd/event_tools/icons/holo_npc.dmi'
	icon_state = "alexey"
	icon_living = "alexey"
	icon_dead = "alexey"
/mob/living/simple_animal/holo_npc/dostoevsky/Life()
	if(!seen)
		animate(src, 3 SECONDS, alpha = 150)
		seen = TRUE
		start_thinking()

	..()


/mob/living/simple_animal/holo_npc/dostoevsky/start_thinking()
	alpha = 0
	invisibility = 50

	spawn(5 SECOND)
		invisibility = 0
		animate(src, 5 SECONDS, alpha = 150)
	spawn(10 SECONDS)
		ISay("Так... Эта штуковина пишет? К-хм...")
		playsound(src.loc, 'sound/effects/radio_chatter.ogg', 100, 1)
	spawn(15 SECONDS)
		ISay("Здравия желаю, экипаж Мантикоры")
		playsound(src.loc, 'sound/effects/radio_chatter.ogg', 100, 1)
	spawn(22 SECONDS)
		ISay("Это сообщение вы должны посмотреть, когда прибудете к месту назначения")
		playsound(src.loc, 'sound/effects/radio_chatter.ogg', 100, 1)
	spawn(28 SECONDS)
		playsound(src.loc, 'sound/effects/radio_chatter.ogg', 100, 1)
		ISay("Как вы уже знаете, сегодня вы - отправляетесь в тыл врага")
	spawn(35 SECONDS)
		ISay("А именно - в пояс Агассиза, где, по нашим данным, расположен важный узел снабжения Восхождения")
		playsound(src.loc, 'sound/effects/radio_chatter.ogg', 100, 1)
	spawn(47 SECONDS)
		ISay("Именно от него зависит успех наступления 3-ого Кристального флота по направлению к Тейе")
		playsound(src.loc, 'sound/effects/radio_chatter.ogg', 100, 1)
	spawn(55 SECONDS)
		ISay("Задержки в поставках противника обеспечат нашему флоту время на перегруппировку и возможность контратаки")
		playsound(src.loc, 'sound/effects/radio_chatter.ogg', 100, 1)
	spawn(60 SECONDS)
		ISay("Ваша задача - обнаружение и уничтожение объекта")
		playsound(src.loc, 'sound/effects/radio_chatter.ogg', 100, 1)
	spawn(65 SECONDS)
		ISay("Для этого, по моему приказу, вы были снабжены ядерным боезапасом")
		playsound(src.loc, 'sound/effects/radio_chatter.ogg', 100, 1)
	spawn(70 SECONDS)
		ISay("Используйте его с умом...")
		playsound(src.loc, 'sound/effects/radio_chatter.ogg', 100, 1)
	spawn(74 SECONDS)
		ISay("В пояс Агассиза ведут блюспейс-врата, которые, вероятно, ещё не были скомпроментированы противником")
		playsound(src.loc, 'sound/effects/radio_chatter.ogg', 100, 1)
	spawn(82 SECONDS)
		ISay("Они находятся в слоях космической пыли, потому соблюдайте бдительность")
		playsound(src.loc, 'sound/effects/radio_chatter.ogg', 100, 1)
	spawn(86 SECONDS)
		ISay("У вас будет лишь один шанс: войти в сектор, обнаружить и уничтожить, а после - покинуть сектор")
		playsound(src.loc, 'sound/effects/radio_chatter.ogg', 100, 1)
	spawn(92 SECONDS)
		ISay("Вопросы есть?")
		playsound(src.loc, 'sound/effects/radio_chatter.ogg', 100, 1)
	spawn(95 SECONDS)
		ISay("...")
		playsound(src.loc, 'sound/effects/radio_chatter.ogg', 100, 1)
	spawn(100 SECONDS)
		ISay("Впрочем, какие вопросы могут быть голограмме, правда? Она вам вряд ли ответит...")
		playsound(src.loc, 'sound/effects/radio_chatter.ogg', 100, 1)
	spawn(108 SECONDS)
		ISay("И да, запомните: как только вы пройдёте внутрь врат - вы обязаны соблюдать режим полного радиомолчания")
		playsound(src.loc, 'sound/effects/radio_chatter.ogg', 100, 1)
	spawn(103 SECONDS)
		ISay("На этом всё, Мантикора")
		playsound(src.loc, 'sound/effects/radio_chatter.ogg', 100, 1)
	spawn(108 SECONDS)
		ISay("Готовьтесь к миссии... И удачи вам")
		playsound(src.loc, 'sound/effects/radio_chatter.ogg', 100, 1)
	spawn(114 SECONDS)
		ISay("Всё, вырубай запи-")
		playsound(src.loc, 'sound/effects/radio_chatter.ogg', 100, 1)
	spawn(116 SECONDS)
		qdel(src)

// Пилот группы Ворона

/mob/living/simple_animal/holo_npc/voron
	name = "Henry Tacker"
	desc = "Пилот разведчика, одетый в стандартный войдсьют Флота ЦПСС."
	icon = 'mods/_fd/event_tools/icons/holo_npc.dmi'
	icon_state = "voron"
	icon_living = "voron"
	icon_dead = "voron"
/mob/living/simple_animal/holo_npc/voron/Life()
	if(!seen)
		animate(src, 3 SECONDS, alpha = 150)
		seen = TRUE
		start_thinking()

	..()

/mob/living/simple_animal/holo_npc/voron/start_thinking()
	alpha = 0
	invisibility = 50

	spawn(5 SECOND)
		invisibility = 0
		animate(src, 5 SECONDS, alpha = 150)
	spawn(10 SECONDS)
		ISay("Объект обнаружен. Размеры комплекса превышают расчётные. Активность минимальна, но следы свежие. Что-то не так.")
		playsound(src.loc, 'sound/effects/radio_chatter.ogg', 100, 1)
	spawn(17 SECONDS)
		ISay("База не просто пуста — её специально оставили. Нестабильность магнитных полей астероидов маскирует энергетические сигнатуры.")
		playsound(src.loc, 'sound/effects/radio_chatter.ogg', 100, 1)
	spawn(24 SECONDS)
		ISay("Перехватил грузовой манифест. Эвакуировали 48 часов назад, но не всё успели. Координаты следующей точки доставки загружены в навигатор.")
		playsound(src.loc, 'sound/effects/radio_chatter.ogg', 100, 1)
	spawn(31 SECONDS)
		ISay("Они могли оставить здесь ловушки. Рекомендую исследовать каждый сектор.")
		playsound(src.loc, 'sound/effects/radio_chatter.ogg', 100, 1)
	spawn(35 SECONDS)
		ISay("Повторяю: база была разводным мостом. Настоящий узел уже перемещен. Координаты нового местоположения в приложенных данных.")
		playsound(src.loc, 'sound/effects/radio_chatter.ogg', 100, 1)
	spawn(42 SECONDS)
		ISay("Приказ: молчать. Младший лейтенант Генри Такер, отбой.")
		playsound(src.loc, 'sound/effects/radio_chatter.ogg', 100, 1)
	spawn(46 SECONDS)
		qdel(src)

/proc/start_title()

    var/sound/start_title = 'mods/_fd/fd_assets/sounds/start_title.ogg'

    world << start_title

    titles(list(
        list("", 16),
        list("Июль 2316", 5),
        list("", 4),
        list("Флотилии ЦПСС и ГКК отчаянно держат оборону", 4),
        list("", 3),
        list("Фронтовые линии человечества - двигаются назад", 4),
        list("", 5),
        list("Если так продолжится, то наше поражение - это лишь вопрос времени", 4),
        list("", 3),
        list("Нам необходим другой подход", 4),
        list("", 3),
        list("И по этой причине, командование 5-ого флота ЦПСС решилось на смелый шаг", 5),
        list("", 3),
        list("Для обеспечения передышки нашим силам, был отправлен бомбардировщик нового образца: SFV Manticore", 5),
        list("", 3),
        list("Согласно данным разведки, в глубинах Пояса Агассиза скрывается база снабжения противника", 5),
        list("", 3),
        list("Нас отправили уничтожить её", 3),
        list("", 3),
        list("Но разведданные — как тени: они могут скрывать больше, чем кажется...", 4),
        list("", 3),
        list("«Тени над Поясом Агассиза»", 10),
        list("", 5),
    ))

/proc/dostoevsky_message()

	var/message_dostoevsky = "<span style='color:blue; font-size: 22px;'>Вы слышите мягкий звон, исходящий от голопадов. Следует взглянуть, что это...</span>"
	for(var/mob/M in GLOB.player_list)
		to_chat(M, message_dostoevsky)

	sleep(25)

	var/sound/dostoevsky = 'mods/_fd/fd_assets/sounds/dostoevsky_message.ogg'
	world << dostoevsky

	sleep(60)

	for(var/obj/holo_spawner/spawner in world)
		if (spawner.character_id == "dostoevsky")
			spawner.start_scene()
			qdel(spawner)

	sleep(1200)
	var/lets_do_it = "<span style='color:blue; font-size: 20px;'>Чтож, у нас есть лишь один путь: вперёд! Ко вратам!</span>"
	for(var/mob/M in GLOB.player_list)
		to_chat(M, lets_do_it)

	titles_no_back(list(
		list("ЗАДАНИЕ: ПРОЙТИ ВО ВРАТА", 1),
		list("", 1),
		list("ЗАДАНИЕ: ПРОЙТИ ВО ВРАТА", 1),
		list("", 1),
		list("ЗАДАНИЕ: ПРОЙТИ ВО ВРАТА", 1),
		list("", 1),
		list("ЗАДАНИЕ: ПРОЙТИ ВО ВРАТА", 1),
		list("", 1),
		list("ЗАДАНИЕ: ПРОЙТИ ВО ВРАТА", 1),
		list("", 1),
		list("ЗАДАНИЕ: ПРОЙТИ ВО ВРАТА", 1)
	))

/proc/in_system()

	var/sound/in_system = 'mods/_fd/fd_assets/sounds/in_system.ogg'
	world << in_system

	sleep(100)

	titles_no_back(list(
		list("ЗАДАНИЕ: НАЙТИ БАЗУ СНАБЖЕНИЯ", 1),
		list("", 1),
		list("ЗАДАНИЕ: НАЙТИ БАЗУ СНАБЖЕНИЯ", 1),
		list("", 1),
		list("ЗАДАНИЕ: НАЙТИ БАЗУ СНАБЖЕНИЯ", 1),
		list("", 1),
		list("ЗАДАНИЕ: НАЙТИ БАЗУ СНАБЖЕНИЯ", 1),
		list("", 1),
		list("ЗАДАНИЕ: НАЙТИ БАЗУ СНАБЖЕНИЯ", 1),
		list("", 1),
		list("ЗАДАНИЕ: НАЙТИ БАЗУ СНАБЖЕНИЯ", 1)
	))

/proc/collect_bb()

	var/sound/collect_bb = 'mods/_fd/fd_assets/sounds/collect_bb.ogg'
	world << collect_bb

	sleep(150)

	titles_no_back(list(
		list("ЗАДАНИЕ: ДОБЫТЬ ЧЁРНЫЙ ЯЩИК", 1),
		list("", 1),
		list("ЗАДАНИЕ: ДОБЫТЬ ЧЁРНЫЙ ЯЩИК", 1),
		list("", 1),
		list("ЗАДАНИЕ: ДОБЫТЬ ЧЁРНЫЙ ЯЩИК", 1),
		list("", 1),
		list("ЗАДАНИЕ: ДОБЫТЬ ЧЁРНЫЙ ЯЩИК", 1),
		list("", 1),
		list("ЗАДАНИЕ: ДОБЫТЬ ЧЁРНЫЙ ЯЩИК", 1),
		list("", 1),
		list("ЗАДАНИЕ: ДОБЫТЬ ЧЁРНЫЙ ЯЩИК", 1)
	))

/proc/ambush()

	var/message_ambush = "<span style='color:red; font-size: 20px;'>На сенсорах происходит странная активность...</span>"
	for(var/mob/M in GLOB.player_list)
		to_chat(M, message_ambush)

	sleep(50)

	everyone_look_at_overmap()

	sleep(120)

	var/list/map_turfs = block(locate(2,2,GLOB.using_map.overmap_z),locate(GLOB.using_map.overmap_size-2,GLOB.using_map.overmap_size-2,GLOB.using_map.overmap_z))
	for(var/turf/T in map_turfs)
		for(var/obj/npc_ship_spawner/npc in T)
			if(npc)
				npc.appear()

	sleep(90)

	var/sound/ambush_music = 'mods/_fd/fd_assets/sounds/music/ambush.ogg'
	world << ambush_music

	titles_no_back(list(
		list("ЗАСАДА!", 1),
		list("", 1),
		list("ЗАСАДА!", 1),
		list("", 1),
		list("ЗАСАДА!", 1),
		list("", 1),
		list("ЗАСАДА!", 1),
		list("", 1),
		list("ЗАСАДА!", 1)
	))

	sleep(150)

	var/message_gate_off = "<span style='color:red; font-size: 18px;'>ВНИМАНИЕ ВСЕМ КОРАБЛЯМ: Автоматическая трансляция Контрольного узла «Моностринг». Гейтвей нестабилен. Обнаружена преднамеренная дестабилизация гейтвея в зоне Контрольного узла. Избегайте транзита до стабилизации. Аварийный протокол активирован.</span>"
	for(var/mob/M in GLOB.player_list)
		to_chat(M, message_gate_off)

	sleep(100)

	titles_no_back(list(
		list("ЗАДАНИЕ: НАЙТИ СПОСОБ АКТИВИРОВАТЬ ВРАТА", 1),
		list("", 1),
		list("ЗАДАНИЕ: НАЙТИ СПОСОБ АКТИВИРОВАТЬ ВРАТА", 1),
		list("", 1),
		list("ЗАДАНИЕ: НАЙТИ СПОСОБ АКТИВИРОВАТЬ ВРАТА", 1),
		list("", 1),
		list("ЗАДАНИЕ: НАЙТИ СПОСОБ АКТИВИРОВАТЬ ВРАТА", 1),
		list("", 1),
		list("ЗАДАНИЕ: НАЙТИ СПОСОБ АКТИВИРОВАТЬ ВРАТА", 1),
		list("", 1),
		list("ЗАДАНИЕ: НАЙТИ СПОСОБ АКТИВИРОВАТЬ ВРАТА", 1)
	))

/proc/gate_active()

	var/message_gate_active = "<span style='color:blue; font-size: 22px;'>ВНИМАНИЕ ВСЕМ КОРАБЛЯМ: Автоматическая трансляция Контрольного узла «Моностринг». Гейтвей АКТИВЕН. Аварийный протокол: деактивирован. Приятного полёта!</span>"
	for(var/mob/M in GLOB.player_list)
		to_chat(M, message_gate_active)

	sleep(60)

	titles_no_back(list(
		list("ЗАДАНИЕ: ДОБРАТЬСЯ ДО ВРАТ", 1),
		list("", 1),
		list("ЗАДАНИЕ: ДОБРАТЬСЯ ДО ВРАТ", 1),
		list("", 1),
		list("ЗАДАНИЕ: ДОБРАТЬСЯ ДО ВРАТ", 1),
		list("", 1),
		list("ЗАДАНИЕ: ДОБРАТЬСЯ ДО ВРАТ", 1),
		list("", 1),
		list("ЗАДАНИЕ: ДОБРАТЬСЯ ДО ВРАТ", 1),
		list("", 1),
		list("ЗАДАНИЕ: ДОБРАТЬСЯ ДО ВРАТ", 1)
	))

/proc/end_title()

    var/message_end_title = "<span style='color:blue; font-size: 19px;'>Мы ушли! Мы справились! МЫ ЖИВЫ!</span>"
    for(var/mob/M in GLOB.player_list)
        to_chat(M, message_end_title)

    sleep(120)

    var/sound/end_title = 'mods/_fd/fd_assets/sounds/end_title.ogg'
    world << end_title

    titles_blue(list(
        list("", 7),
        list("Мы победили...?", 5),
        list("", 3),
        list("Или, всё же, это поражение?..", 5),
        list("", 3),
        list("Как бы то ни было - мы живы", 5),
        list("", 3),
        list("Мы недооценили своего противника", 5),
        list("Переоценили свою удачу", 5),
        list("И позволили Восхождению переиграть себя...", 5),
        list("", 7),
        list("Но и им не удалось достать нас, правда?", 5),
        list("", 4),
        list("Что же это, очередной шаг назад?", 5),
        list("Или, всё же, мы шагнули вперед?", 5),
        list("", 4),
        list("Нет...", 5),
        list("Сегодня мы остались на том же месте", 5),
        list("", 4),
        list("И это не плохо!", 5),
        list("", 3),
        list("Мы находим и признаём собственные ошибки, учимся смотреть реальности в глаза...", 5),
        list("И просто стараемся идти дальше", 5),
        list("Только так мы можем победить", 5),
        list("", 10),
    ))








// TORCH EVENT

/mob/living/simple_animal/holo_npc/gyne
	name = "ascent gyne hologram"
	desc = ""
	icon = 'mods/_fd/fd_assets/icons/gyne.dmi'
	icon_state = "gyne"
	icon_living = "gyne"
	icon_dead = "gyne"
	color = "#c45fff"
	pixel_x = -5

/mob/living/simple_animal/holo_npc/gyne/Life()
	if(!seen)
		animate(src, 3 SECONDS, alpha = 150)
		seen = TRUE
		start_thinking()

	..()

/mob/living/simple_animal/holo_npc/gyne/start_thinking()
	alpha = 0
	invisibility = 50

	spawn(5 SECOND)
		invisibility = 0
		animate(src, 5 SECONDS, alpha = 150)

	spawn(10 SECONDS)
		ISay("Примитивные мешки с мясом...")
		playsound(src.loc, 'sound/voice/ascent1.ogg', 100, 1)
	spawn(15 SECONDS)
		ISay("Ваш железоголовый капитанишка привёл вас на жалкую и мучительную смерть")
		playsound(src.loc, 'sound/voice/ascent2.ogg', 100, 1)
	spawn(20 SECONDS)
		ISay("Вы окружены, Факелу никогда не покинуть этой звезды")
		playsound(src.loc, 'sound/voice/ascent3.ogg', 100, 1)
	spawn(25 SECONDS)
		playsound(src.loc, 'sound/voice/ascent4.ogg', 100, 1)
		ISay("На своей ржавой рухляти далеко вам не уйти")
	spawn(30 SECONDS)
		ISay("Сдавайтесь и, ВОЗМОЖНО, ваши никчёмные жизни будут сохранены")
		playsound(src.loc, 'sound/voice/ascent1.ogg', 100, 1)
	spawn(35 SECONDS)
		ISay("Нет?..")
		playsound(src.loc, 'sound/voice/ascent5.ogg', 100, 1)
	spawn(40 SECONDS)
		ISay("Чтож... Ваши похороны, мясо")
		playsound(src.loc, 'sound/voice/ascent2.ogg', 100, 1)
	spawn(45 SECONDS)
		qdel(src)

/mob/living/simple_animal/holo_npc/gyne_taunt
	name = "ascent gyne hologram"
	desc = ""
	icon = 'mods/_fd/fd_assets/icons/gyne.dmi'
	icon_state = "gyne"
	icon_living = "gyne"
	icon_dead = "gyne"
	color = "#c45fff"
	pixel_x = -5

/mob/living/simple_animal/holo_npc/gyne_taunt/Life()
	if(!seen)
		animate(src, 3 SECONDS, alpha = 150)
		seen = TRUE
		start_thinking()

	..()

/mob/living/simple_animal/holo_npc/gyne_taunt/start_thinking()
	alpha = 0
	invisibility = 50

	spawn(5 SECOND)
		invisibility = 0
		animate(src, 5 SECONDS, alpha = 150)

	spawn(10 SECONDS)
		ISay("Вы всё ещё пытаетесь?..")
		playsound(src.loc, 'sound/voice/ascent1.ogg', 100, 1)
	spawn(15 SECONDS)
		ISay("Жалкое зрелище... Вы лишь оттягиваете неизбежное. Бежать НЕКУДА")
		playsound(src.loc, 'sound/voice/ascent2.ogg', 100, 1)
	spawn(20 SECONDS)
		ISay("Рано или поздно, снаряды закончатся. Топливные баки опустеют. Щиты падут.")
		playsound(src.loc, 'sound/voice/ascent3.ogg', 100, 1)
	spawn(25 SECONDS)
		playsound(src.loc, 'sound/voice/ascent4.ogg', 100, 1)
		ISay("Вы не сможете убегать вечно, у вас нет ни шанса")
	spawn(30 SECONDS)
		ISay("...")
	spawn(37 SECONDS)
		ISay("Ваш выбор. Через час от вас останутся лишь горелые ошмётки")
		playsound(src.loc, 'sound/voice/ascent5.ogg', 100, 1)
	spawn(43 SECONDS)
		qdel(src)

/proc/event_phase_1()
	var/sound/explosion = 'sound/effects/explosionfar.ogg'
	var/sound/explosion2 = 'mods/_fd/fd_assets/sounds/explosion2.ogg'
	var/sound/chatter = 'mods/_fd/fd_assets/sounds/chatter.ogg'

	world << chatter

	sleep(10)

	var/message_ascent1 = "<span style='color:purple; font-size: 22px;'>/// ⎓𝙹∷ᓵᒷ↸ ᓵ𝙹ᒲᒲ⚍リ╎ᓵᔑℸ ̣ ╎𝙹リ ᓭᒷᓭᓭ╎𝙹リ ╎リ╎ℸ ̣ ╎ᔑℸ ̣ ᒷ↸ ///</span>"
	for(var/mob/M in GLOB.player_list)
		to_chat(M, message_ascent1)

	sleep(20)

	var/message_ascent2 = "<span style='color:purple; font-size: 22px;'>/// ╎リℸ ̣ ᒷ∷リᔑꖎ ᓭ||ᓭℸ ̣ ᒷᒲᓭ ⍑ᔑᓭ ʖᒷᒷリ ᓵ𝙹ᒲ!¡∷𝙹ᒲ╎ᓭᒷ↸ ///</span>"
	for(var/mob/M in GLOB.player_list)
		to_chat(M, message_ascent2)

	sleep(20)

	var/message_ascent3 = "<span style='color:purple; font-size: 22px;'>/// ⍊ᒷᓭᓭᒷꖎ ⎓╎∷ᒷ∴ᔑꖎꖎ ᓭ⍑⚍ℸ ̣ ℸ ̣ ╎リ⊣ ↸𝙹∴リ !¡∷𝙹ᓵᒷᒷᓭ ⍑ᔑᓭ ʖᒷ⊣⚍リ ///</span>"
	for(var/mob/M in GLOB.player_list)
		to_chat(M, message_ascent3)

	sleep(10)

	var/message_ascent4 = "<span style='color:purple; font-size: 22px;'>/// !¡∷𝙹⊣∷ᒷᓭᓭ ᓭℸ ̣ ᔑℸ ̣ ᒷ: ℸ ̣ ᒷリ !¡ᒷ∷ᓵᒷリℸ ̣///</span>"
	for(var/mob/M in GLOB.player_list)
		to_chat(M, message_ascent4)

	sleep(5)

	var/message_ascent5 = "<span style='color:purple; font-size: 22px;'>/// ℸ ̣ ∴ᒷリℸ ̣ || !¡ᒷ∷ᓵᒷリℸ ̣ ///</span>"
	for(var/mob/M in GLOB.player_list)
		to_chat(M, message_ascent5)

	sleep(10)

	var/message_ascent6 = "<span style='color:purple; font-size: 22px;'>/// ℸ ̣ ⍑╎∷ℸ ̣  ///</span>"
	for(var/mob/M in GLOB.player_list)
		to_chat(M, message_ascent6)

	sleep(5)

	var/message_ascent7 = "<span style='color:purple; font-size: 22px;'>/// ⎓𝙹∷ℸ ̣ || ///</span>"
	for(var/mob/M in GLOB.player_list)
		to_chat(M, message_ascent7)

	sleep(5)

	var/message_ascent8 = "<span style='color:purple; font-size: 22px;'>/// ⎓╎⎓ℸ ̣  ///</span>"
	for(var/mob/M in GLOB.player_list)
		to_chat(M, message_ascent8)

	sleep(10)

	var/message_ascent9 = "<span style='color:purple; font-size: 22px;'>/// ᓭ╎ ̇/ℸ ̣ || ///</span>"
	for(var/mob/M in GLOB.player_list)
		to_chat(M, message_ascent9)

	sleep(5)

	var/message_ascent10 = "<span style='color:purple; font-size: 22px;'>/// ᓭᒷ⍊ᒷリℸ ̣  ///</span>"
	for(var/mob/M in GLOB.player_list)
		to_chat(M, message_ascent10)

	sleep(5)

	var/message_ascent11 = "<span style='color:purple; font-size: 22px;'>/// ᒷ╎⊣⍑ℸ ̣ || ///</span>"
	for(var/mob/M in GLOB.player_list)
		to_chat(M, message_ascent11)

	sleep(10)

	var/message_ascent12 = "<span style='color:purple; font-size: 22px;'>/// リ╎リ⊣⍑ℸ ̣ ///</span>"
	for(var/mob/M in GLOB.player_list)
		to_chat(M, message_ascent12)

	sleep(30)

	var/message_ascent13 = "<span style='color:purple; font-size: 22px;'>/// 𝙹リᒷ ⍑⚍リ↸∷ᒷ↸ !¡ᒷ∷ᓵᒷリℸ ̣. ᓭ⚍ᓵᓵᒷᓭᓭ ///</span>"
	for(var/mob/M in GLOB.player_list)
		to_chat(M, message_ascent13)

	sleep(30)

// Вот тут мы в теории должны открывать всем игрокам овермапу относительно текущего положения Факела

	everyone_look_at_overmap()

	sleep(120)

	var/list/map_turfs = block(locate(2,2,GLOB.using_map.overmap_z),locate(GLOB.using_map.overmap_size-2,GLOB.using_map.overmap_size-2,GLOB.using_map.overmap_z))
	for(var/turf/T in map_turfs)
		for(var/obj/npc_ship_spawner/npc in T)
			if(npc)
				npc.appear()

	sleep(130)

	for(var/obj/holo_spawner/spawner in world)
		if (spawner.character_id == "gyne")
			spawner.start_scene()
			qdel(spawner)

	sleep(550)

	for(var/mob/living/C in GLOB.player_list)
		shake_camera(C, 100, 1)

	world << explosion
	sleep(8)
	world << explosion
	sleep(10)
	world << explosion
	sleep(5)
	world << explosion
	sleep(20)
	world << explosion
	sleep(10)
	world << explosion
	sleep(6)
	world << explosion
	sleep(6)
	world << explosion
	sleep(15)
	world << explosion2

	for(var/area/A in world)
		A.set_emergency_lighting(TRUE)

	var/message = "<span style='color:red; font-size: 27px;'>ATTENTION ALL CREW! IFF WARFARE HAS BEEN DEACTIVATED! BLUESPACE DRIVE STATUS: OFFLINE!</span>"
	for(var/mob/M in GLOB.player_list)
		to_chat(M, message)

	sleep(30)

	var/sound/siren = 'sound/effects/siren.ogg'
	world << siren

/proc/event_phase_2()
	var/sound/chatter_small = 'mods/_fd/fd_assets/sounds/chatter_small.ogg'

	world << chatter_small
	var/message = "<span style='color:red; font-size: 24px;'>ATTENTION ᓵ∷ᒷ∴! COMMUN╎ᓵᔑℸ ̣ ╎𝙹リ ᓭᒷᓭᓭ╎𝙹リ EN⎓𝙹∷CED! </span>"
	for(var/mob/M in GLOB.player_list)
		to_chat(M, message)

	sleep(30)

	for(var/obj/holo_spawner/spawner in world)
		if (spawner.character_id == "gyne_taunt")
			spawner.start_scene()
			qdel(spawner)

	sleep(4000)

	var/sound/sound_notice = 'sound/ambience/bsd_alarm.ogg'
	world << sound_notice

	sleep(20)

	var/message1_1 = "<span style='color:cyan; font-size: 20px;'>| TRANSMISSION SOURCE: TRK17 |</span>"
	for(var/mob/M in GLOB.player_list)
		to_chat(M, message1_1)
	sleep(10)
	var/message1_2 = "<span style='color:cyan; font-size: 20px;'>| TRANSMISSION TARGET: HUMAN AFFILIATED VESSEL 'SEV TORCH' |</span>"
	for(var/mob/M in GLOB.player_list)
		to_chat(M, message1_2)
	sleep(10)
	var/message1_3 = "<span style='color:cyan; font-size: 20px;'>| MESSAGE: TRK17 EM-FIELD STATUS: ONLINE |</span>"
	for(var/mob/M in GLOB.player_list)
		to_chat(M, message1_3)
	sleep(10)
	var/message1_4 = "<span style='color:cyan; font-size: 20px;'>| POWER-OFF PROCESS INITIATED |</span>"
	for(var/mob/M in GLOB.player_list)
		to_chat(M, message1_4)
	sleep(10)
	var/message1_5 = "<span style='color:blue; font-size: 22px;'> | OFFLINE STATUS ETA: 20 MINUTES |</span>"
	for(var/mob/M in GLOB.player_list)
		to_chat(M, message1_5)

	sleep(9000)
	world << sound_notice

	var/message2_1 = "<span style='color:cyan; font-size: 20px;'>| TRANSMISSION SOURCE: TRK17 |</span>"
	for(var/mob/M in GLOB.player_list)
		to_chat(M, message2_1)
	sleep(10)
	var/message2_2 = "<span style='color:cyan; font-size: 20px;'>| TRANSMISSION TARGET: HUMAN AFFILIATED VESSEL 'SEV TORCH' |</span>"
	for(var/mob/M in GLOB.player_list)
		to_chat(M, message2_2)
	sleep(10)
	var/message2_3 = "<span style='color:cyan; font-size: 20px;'>| MESSAGE: TRK17 EM-FIELD STATUS: OFFLINE |</span>"
	for(var/mob/M in GLOB.player_list)
		to_chat(M, message2_3)
	sleep(10)
	var/message2_4 = "<span style='color:cyan; font-size: 20px;'>| REBOOT PROCESS INITIATED |</span>"
	for(var/mob/M in GLOB.player_list)
		to_chat(M, message2_4)
	sleep(10)
	var/message2_5 = "<span style='color:blue; font-size: 22px;'> | ONLINE STATUS ETA: 5 MINUTES |</span>"
	for(var/mob/M in GLOB.player_list)
		to_chat(M, message2_5)

/obj/effect/pebbles_particles
	name = "particles"
	desc = "particles"
	icon = 'mods/_fd/event_tools/icons/pebbles.dmi'
	icon_state = "pebbles_1"
	alpha = 100
	layer = ABOVE_HUMAN_LAYER
	light_color = "#4ff32e"
	light_range = 1
	light_power = 0.3
	plane = 4

/turf/simulated/floor
	var/pebbles_affected = FALSE

/proc/event_phase_3()
	var/sound/sound_field = 'mods/_fd/fd_assets/sounds/field_siren.ogg'
	var/sound/boom = 'mods/_fd/fd_assets/sounds/boom.ogg'
	world << sound_field

	for(var/obj/machinery/bluespacedrive/drive in world)
		drive.icon_state = "bsd_core_broken"
		drive.ClearOverlays()
		drive.particles = null
		empulse(get_turf(drive), 3, 6)

	for(var/area/A in world)
		for(var/turf/simulated/floor/spawn_here in A)
			if(prob(30) && spawn_here.pebbles_affected == FALSE)
				var/obj/effect/pebbles_particles/pebbles = new /obj/effect/pebbles_particles(get_turf(spawn_here))
				var/obj/effect/pebbles_particles/pebbles_another = new /obj/effect/pebbles_particles(get_turf(spawn_here))
				var/obj/effect/pebbles_particles/pebbles_third = new /obj/effect/pebbles_particles(get_turf(spawn_here))
				var/obj/effect/pebbles_particles/pebbles_fourth = new /obj/effect/pebbles_particles(get_turf(spawn_here))
				var/random_number = pick(1,2,3,4)

				pebbles.icon_state = "pebbles_[random_number]"
				pebbles_another.icon_state = "pebbles_[random_number]"
				pebbles_third.icon_state = "pebbles_[random_number]"
				pebbles_fourth.icon_state = "pebbles_[random_number]"

				pebbles.SetTransform(0.1)
				pebbles_another.SetTransform(0.3)
				pebbles_third.SetTransform(0.5)
				pebbles_fourth.SetTransform(0.3)

				pebbles.pixel_x = rand(5,20)
				pebbles_another.pixel_x = rand(5,20)
				pebbles_third.pixel_x = rand(5,20)
				pebbles_fourth.pixel_x = rand(5,20)

				pebbles.pixel_y = rand(5,20)
				pebbles_another.pixel_y = rand(5,20)
				pebbles_third.pixel_y = rand(5,20)
				pebbles_fourth.pixel_y = rand(5,20)

				spawn_here.pebbles_affected = TRUE

		for(var/obj/machinery/sparks_on in A)
			if(prob(40))
				var/datum/effect/spark_spread/sparks = new /datum/effect/spark_spread()
				sparks.set_up(1, 1, sparks_on.loc)
				sparks.start()

	for(var/mob/living/C in GLOB.player_list)
		shake_camera(C, 520, 1)

	spawn(20)
		var/message1_1 = "<span style='color:cyan; font-size: 20px;'> | TRANSMISSION SOURCE: TRK17 |</span>"
		for(var/mob/M in GLOB.player_list)
			to_chat(M, message1_1)

	spawn(40)
		var/message1_2 = "<span style='color:cyan; font-size: 20px;'>| TRANSMISSION TARGET: HUMAN AFFILIATED VESSEL 'SEV TORCH' |</span>"
		for(var/mob/M in GLOB.player_list)
			to_chat(M, message1_2)

	spawn(60)
		var/message1_3 = "<span style='color:cyan; font-size: 20px;'>| MESSAGE: TRK17 EM-FIELD STATUS ONLINE PROGRESS: 50% | WARNING! EM-PULSE IMMINENT! |</span>"
		for(var/mob/M in GLOB.player_list)
			to_chat(M, message1_3)

	spawn(160)
		var/message1_4 = "<span style='color:cyan; font-size: 20px;'>| MESSAGE: TRK17 EM-FIELD STATUS ONLINE PROGRESS: 67% | WARNING! EM-PULSE IMMINENT! |</span>"
		for(var/mob/M in GLOB.player_list)
			to_chat(M, message1_4)

	spawn(240)
		var/message1_5 = "<span style='color:cyan; font-size: 20px;'>| MESSAGE: TRK17 EM-FIELD STATUS ONLINE PROGRESS: 79% | WARNING! EM-PULSE IMMINENT! |</span>"
		for(var/mob/M in GLOB.player_list)
			to_chat(M, message1_5)

	spawn(430)
		var/message1_6 = "<span style='color:cyan; font-size: 20px;'>| MESSAGE: TRK17 EM-FIELD STATUS ONLINE PROGRESS: 95% | WARNING! EM-PULSE IMMINENT! |</span>"
		for(var/mob/M in GLOB.player_list)
			to_chat(M, message1_6)

	sleep(470)

	world << boom

	for(var/mob/living/M in GLOB.player_list)
		M.Weaken(15)

	spawn(50)
		for(var/mob/living/M in GLOB.player_list)
			M.Sleeping(3000)

	sleep(50)

	var/sound/sound_field2 = 'mods/_fd/fd_assets/sounds/field_siren_titles.ogg'
	world << sound_field2
