/*

00:01-00:02: По левой части экрана, снизу вверх, скользит лого ЦПСС
00:03-00:04: По правой части экрана, сверху вниз, скользит лого ГКК
00:05-00:06: По центру между ними появляется Браун. Он поворачивает голову влево
00:07-00:12: Камера делает пролёт в направлении его взгляда, демонстрируя нам коридор. С одной стороны стоит экипаж Факела, с другой он же (и возможно его команда)
00:13-00:22: Большой пролёт камеры наверх через окна над улицами. Появляется надпись "FINAL DESTINATION", и так же быстро исчезает

- Во снах найти ответ я стремлюсь для того, чтобы вновь увидеть свет
00:23-00:28: Камера справа налево летит мимо Эмми, стоящей около сломанного меха. Справа выскакивает она же крупным планом

- Среди простых людей я бессильно теряюсь на потоке дней...
00:29-00:35: Кадр резко переключается на Лиру крупным планом(делать ли ей фейд?), которая чуть-чуть продолжает движение спрайта следом за Эмми.
Затем, резко поворачивается направо и камера улетает

- Что было, то уже в прошлом, тот мир ушёл безнадёжно
00:36-00:38: Окита в толпе смотрит направо. Поверх накидываем крупняк

- Вот бы взглянуть было можно в те небеса
00:39-00:42: Кадр резко переключается на другую сторону улицы и Луни. Он тянет руку в сторону Окиты и появляется его спрайт крупным планом

- Для них истина простая - то, что потери слезами
00:43-00:45: Кладбище. Адриано стоит перед мемориалом

- Не возвратить нам назад...
00:46-00:47: Свифт стоит около мешков с трупами, как в той сцене в сиротках

- ТЫ ЗНАЕШЬ САМ
00:48: Полуголая Злата крупным планом. ВОПРОСЫ??? МИЛФА

- Увы, грехи не смоются в рыданьях,
00:49-00:50: Датура и Мартин стоят в окружении чьих-то тел, пока камера пролетает налево

- И в нас навеки будет боль воспоминаний
00:51-00:52: Ная держит мёртвую Дину на руках

- Опять блуждаю в тёмном лабиринте
00:53-00:54: Нуль едет по вентиляции на юг и камера движется следом

- В поисках лучшей жизни
00:55: Нуль выезжает к Лин, и та поворачивается к нему, отрываясь от книги. Показываем её крупным планом

- Хочу излить привычные заботы
00:56-00:57: СиЭф и ЭрКа идут по коридору, резко поворачиваясь к камере

- Пустым листам в потрёпанном блокноте
00:58-00:59: Райфлер сидит за радио

- Только места не найти отныне...
01:00-01:01: Фиддлер стоит над такмапой. Крупный план

- ...мне в реальном мире
01:02: Если я смогу достать спрайт Терры - вставить сюда её крупным планом напротив Фиддлера. В ином случае - сойдёт его человеческая версия

*/

/proc/opening1_line1()
	var/novel_message = "Но прочь сомнения..."
	var/colored = COLOR_WHITE

	var/obj/screen/novel_message/start_credits/nofade_simple/visuals = new /obj/screen/novel_message/start_credits/nofade_simple()
	visuals.maptext_x = -100
	visuals.maptext_y = 0
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 4 SECONDS)

/proc/opening1_line2()
	var/novel_message = "...я буду жить дальше!"
	var/colored = COLOR_WHITE

	var/obj/screen/novel_message/start_credits/nofade_simple/visuals = new /obj/screen/novel_message/start_credits/nofade_simple()
	visuals.maptext_x = 100
	visuals.maptext_y = -410
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 2 SECONDS)

/proc/opening1_line3()
	var/novel_message = "И дышать без сожаления..."
	var/colored = PIPE_COLOR_RED

	var/obj/screen/novel_message/start_credits/nofade_simple/visuals = new /obj/screen/novel_message/start_credits/nofade_simple()
	visuals.maptext_x = 0
	visuals.maptext_y = -200
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 2 SECONDS)

/proc/opening1_line4()
	var/novel_message = "Я немного стала старше,"
	var/colored = COLOR_WHITE

	var/obj/screen/novel_message/start_credits/nofade_simple/visuals = new /obj/screen/novel_message/start_credits/nofade_simple()
	visuals.maptext_x = 0
	visuals.maptext_y = 0
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 2 SECONDS)

/proc/opening1_line5()
	var/novel_message = "начать хочу сначала со временем..."
	var/colored = COLOR_WHITE

	var/obj/screen/novel_message/start_credits/nofade_simple/visuals = new /obj/screen/novel_message/start_credits/nofade_simple()
	visuals.maptext_x = 0
	visuals.maptext_y = -410
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 4 SECONDS)

/proc/opening1_line6()
	var/novel_message = "За продолженьем сна..."
	var/colored = COLOR_WHITE

	var/obj/screen/novel_message/start_credits/nofade_simple/visuals = new /obj/screen/novel_message/start_credits/nofade_simple()
	visuals.maptext_x = -100
	visuals.maptext_y = 0
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 6 SECONDS)

/proc/opening1_line7()
	var/novel_message = "...без оглядки помчаться вновь хотелось мне"
	var/colored = COLOR_WHITE

	var/obj/screen/novel_message/start_credits/nofade_simple/visuals = new /obj/screen/novel_message/start_credits/nofade_simple()
	visuals.maptext_x = 100
	visuals.maptext_y = -410
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 4 SECONDS)

/proc/opening1_line8()
	var/novel_message = "Но средь простых людей"
	var/colored = COLOR_WHITE

	var/obj/screen/novel_message/start_credits/nofade_simple/visuals = new /obj/screen/novel_message/start_credits/nofade_simple()
	visuals.maptext_x = 0
	visuals.maptext_y = 0
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 6 SECONDS)

/proc/opening1_line9()
	var/novel_message = "я бессильно теряюсь на потоке дней..."
	var/colored = COLOR_WHITE

	var/obj/screen/novel_message/start_credits/nofade_simple/visuals = new /obj/screen/novel_message/start_credits/nofade_simple()
	visuals.maptext_x = 0
	visuals.maptext_y = -410
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 4 SECONDS)

/proc/opening1_line10()
	var/novel_message = "Что было, то уже в прошлом,"
	var/colored = COLOR_WHITE

	var/obj/screen/novel_message/start_credits/nofade_simple/visuals = new /obj/screen/novel_message/start_credits/nofade_simple()
	visuals.maptext_x = -30
	visuals.maptext_y = -200
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 4 SECONDS)

/proc/opening1_line11()
	var/novel_message = "тот мир ушёл безнадёжно,"
	var/colored = PIPE_COLOR_RED

	var/obj/screen/novel_message/start_credits/nofade_simple/visuals = new /obj/screen/novel_message/start_credits/nofade_simple()
	visuals.maptext_x = 0
	visuals.maptext_y = -210
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 2 SECONDS)

/proc/opening1_line12()
	var/novel_message = "Вот бы взглянуть было можно"
	var/colored = COLOR_WHITE

	var/obj/screen/novel_message/start_credits/nofade_simple/visuals = new /obj/screen/novel_message/start_credits/nofade_simple()
	visuals.maptext_x = 0
	visuals.maptext_y = -200
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 4 SECONDS)

/proc/opening1_line13()
	var/novel_message = "в те небеса..."
	var/colored = PIPE_COLOR_RED

	var/obj/screen/novel_message/start_credits/nofade_simple/visuals = new /obj/screen/novel_message/start_credits/nofade_simple()
	visuals.maptext_x = 0
	visuals.maptext_y = -210
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 2 SECONDS)

/proc/opening1_line14()
	var/novel_message = "Для них истина простая -"
	var/colored = COLOR_WHITE

	var/obj/screen/novel_message/start_credits/nofade_simple/visuals = new /obj/screen/novel_message/start_credits/nofade_simple()
	visuals.maptext_x = 0
	visuals.maptext_y = 0
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 4 SECONDS)

/proc/opening1_line15()
	var/novel_message = "то что потери слезами"
	var/colored = COLOR_WHITE

	var/obj/screen/novel_message/start_credits/nofade_simple/visuals = new /obj/screen/novel_message/start_credits/nofade_simple()
	visuals.maptext_x = 0
	visuals.maptext_y = -410
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 2 SECONDS)

/proc/opening1_line16()
	var/novel_message = "не возвратить нам назад..."
	var/colored = COLOR_WHITE

	var/obj/screen/novel_message/start_credits/nofade_simple/visuals = new /obj/screen/novel_message/start_credits/nofade_simple()
	visuals.maptext_x = 0
	visuals.maptext_y = -200
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 2 SECONDS)

/obj/screen/novel_message/start_credits/big_nofade_special
	alpha = 255

/obj/screen/novel_message/start_credits/big_nofade_special/set_text(text, text_color, time = 5 SECONDS)
	SetTransform(3)

	maptext = "<span class='maptext' style='text-align: center; font-size: 300%; color: [text_color]'>[text]</span>"

	spawn(time)
		alpha = 0
	QDEL_IN(src, time)

/proc/opening1_line17()
	var/novel_message = "ТЫ"
	var/colored = PIPE_COLOR_RED

	var/obj/screen/novel_message/start_credits/big_nofade_special/visuals = new /obj/screen/novel_message/start_credits/big_nofade_special()
	visuals.maptext_y = -70
	visuals.maptext_x = -110
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 2 SECONDS)

/proc/opening1_line17_1()
	var/novel_message = "ЗНАЕШЬ"
	var/colored = PIPE_COLOR_RED

	var/obj/screen/novel_message/start_credits/big_nofade_special/visuals = new /obj/screen/novel_message/start_credits/big_nofade_special()
	visuals.maptext_y = -70
	visuals.maptext_x = -70
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 1.8 SECONDS)

/proc/opening1_line17_2()
	var/novel_message = "САМ"
	var/colored = PIPE_COLOR_RED

	var/obj/screen/novel_message/start_credits/big_nofade_special/visuals = new /obj/screen/novel_message/start_credits/big_nofade_special()
	visuals.maptext_y = -70
	visuals.maptext_x = -30
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 1.6 SECONDS)


/proc/opening1_line18()
	var/novel_message = "Грехи былые слезы точно не отмоют,"
	var/colored = COLOR_WHITE

	var/obj/screen/novel_message/start_credits/nofade_simple/visuals = new /obj/screen/novel_message/start_credits/nofade_simple()
	visuals.maptext_x = -100
	visuals.maptext_y = 0
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 2 SECONDS)

/proc/opening1_line19()
	var/novel_message = "и этой цепью были скованы мы двое"
	var/colored = COLOR_WHITE

	var/obj/screen/novel_message/start_credits/nofade_simple/visuals = new /obj/screen/novel_message/start_credits/nofade_simple()
	visuals.maptext_x = 100
	visuals.maptext_y = -410
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 2 SECONDS)

/proc/opening1_line20()
	var/novel_message = "Опять блуждаю в тёмном лабиринте..."
	var/colored = COLOR_WHITE

	var/obj/screen/novel_message/start_credits/nofade_simple/visuals = new /obj/screen/novel_message/start_credits/nofade_simple()
	visuals.maptext_x = -80
	visuals.maptext_y = -200
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 3 SECONDS)

/proc/opening1_line21()
	var/novel_message = "...в поисках лучшей жизни"
	var/colored = PIPE_COLOR_RED

	var/obj/screen/novel_message/start_credits/nofade_simple/visuals = new /obj/screen/novel_message/start_credits/nofade_simple()
	visuals.maptext_x = -60
	visuals.maptext_y = -210
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 2 SECONDS)

/proc/opening1_line22()
	var/novel_message = "Хочу излить привычные заботы"
	var/colored = COLOR_WHITE

	var/obj/screen/novel_message/start_credits/nofade_simple/visuals = new /obj/screen/novel_message/start_credits/nofade_simple()
	visuals.maptext_x = 0
	visuals.maptext_y = -200
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 4 SECONDS)

/proc/opening1_line23()
	var/novel_message = "пустым листам в потрёпанном блокноте"
	var/colored = COLOR_WHITE

	var/obj/screen/novel_message/start_credits/nofade_simple/visuals = new /obj/screen/novel_message/start_credits/nofade_simple()
	visuals.maptext_x = 0
	visuals.maptext_y = -210
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 2 SECONDS)

/proc/opening1_line24()
	var/novel_message = "Ведь места не найти отныне..."
	var/colored = COLOR_WHITE

	var/obj/screen/novel_message/start_credits/nofade_simple/visuals = new /obj/screen/novel_message/start_credits/nofade_simple()
	visuals.maptext_x = 100
	visuals.maptext_y = -410
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 4 SECONDS)

/proc/opening1_line25()
	var/novel_message = "...мне в реальном мире"
	var/colored = PIPE_COLOR_RED

	var/obj/screen/novel_message/start_credits/nofade_simple/visuals = new /obj/screen/novel_message/start_credits/nofade_simple()
	visuals.maptext_x = -100
	visuals.maptext_y = 0
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 2 SECONDS)

/proc/opening1_line26()
	var/novel_message = "Мечты мы ради..."
	var/colored = COLOR_WHITE

	var/obj/screen/novel_message/start_credits/nofade_simple/visuals = new /obj/screen/novel_message/start_credits/nofade_simple()
	visuals.maptext_x = -50
	visuals.maptext_y = -100
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 3 SECONDS)

/proc/opening1_line27()
	var/novel_message = "...живём на свете"
	var/colored = COLOR_WHITE

	var/obj/screen/novel_message/start_credits/nofade_simple/visuals = new /obj/screen/novel_message/start_credits/nofade_simple()
	visuals.maptext_x = 50
	visuals.maptext_y = -300
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 2 SECONDS)

/proc/opening1_line28()
	var/novel_message = "Чей силуэт едва ли виден..."
	var/colored = COLOR_WHITE

	var/obj/screen/novel_message/start_credits/nofade_simple/visuals = new /obj/screen/novel_message/start_credits/nofade_simple()
	visuals.maptext_x = 0
	visuals.maptext_y = -200
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 2 SECONDS)

/proc/opening1_line29()
	var/novel_message = "...в лунных сетях"
	var/colored = PIPE_COLOR_RED

	var/obj/screen/novel_message/start_credits/nofade_simple/visuals = new /obj/screen/novel_message/start_credits/nofade_simple()
	visuals.maptext_x = 0
	visuals.maptext_y = -210
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 2 SECONDS)

/proc/opening1_line30()
	var/novel_message = "Пусть шансов мало..."
	var/colored = COLOR_WHITE

	var/obj/screen/novel_message/start_credits/nofade_simple/visuals = new /obj/screen/novel_message/start_credits/nofade_simple()
	visuals.maptext_x = -100
	visuals.maptext_y = -200
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 4 SECONDS)

/proc/opening1_line31()
	var/novel_message = "...уж некуда нам отступать!"
	var/colored = COLOR_WHITE

	var/obj/screen/novel_message/start_credits/nofade_simple/visuals = new /obj/screen/novel_message/start_credits/nofade_simple()
	visuals.maptext_x = -110
	visuals.maptext_y = -210
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 2 SECONDS)

/proc/opening1_line32()
	var/novel_message = "ДОРОГИ ЗАБУДЬ НАЗАД"
	var/colored = PIPE_COLOR_RED

	var/obj/screen/novel_message/start_credits/nofade_simple/visuals = new /obj/screen/novel_message/start_credits/nofade_simple()
	visuals.maptext_x = 0
	visuals.maptext_y = -200
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 2 SECONDS)

/proc/opening1_line33()
	var/novel_message = "И раз моё сердце всё ещё бьётся..."
	var/colored = COLOR_WHITE

	var/obj/screen/novel_message/start_credits/nofade_simple/visuals = new /obj/screen/novel_message/start_credits/nofade_simple()
	visuals.maptext_x = 0
	visuals.maptext_y = -180
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 4 SECONDS)

/proc/opening1_line34()
	var/novel_message = "...не смею я свернуть с пути"
	var/colored = COLOR_WHITE

	var/obj/screen/novel_message/start_credits/nofade_simple/visuals = new /obj/screen/novel_message/start_credits/nofade_simple()
	visuals.maptext_x = 30
	visuals.maptext_y = -200
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 2 SECONDS)

/proc/opening1_line35()
	var/novel_message = "(ПОСМОТРИ)"
	var/colored = PIPE_COLOR_RED

	var/obj/screen/novel_message/start_credits/nofade_simple/visuals = new /obj/screen/novel_message/start_credits/nofade_simple()
	visuals.maptext_x = 10
	visuals.maptext_y = -210
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 2 SECONDS)

/proc/opening1_line36()
	var/novel_message = "Что боль былая..."
	var/colored = COLOR_WHITE

	var/obj/screen/novel_message/start_credits/nofade_simple/visuals = new /obj/screen/novel_message/start_credits/nofade_simple()
	visuals.maptext_x = 0
	visuals.maptext_y = -200
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 3 SECONDS)

/proc/opening1_line37()
	var/novel_message = "...может нам преподнести!"
	var/colored = COLOR_WHITE

	var/obj/screen/novel_message/start_credits/nofade_simple/visuals = new /obj/screen/novel_message/start_credits/nofade_simple()
	visuals.maptext_x = 0
	visuals.maptext_y = -210
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 3 SECONDS)


/proc/fd_titledrop()
	var/novel_message = "\"FINAL DESTINATION\""
	var/colored = COLOR_ASSEMBLY_BLACK

	var/obj/screen/novel_message/start_credits/big/visuals = new /obj/screen/novel_message/start_credits/big()
	visuals.maptext_y = -80
	visuals.maptext_x = 15
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 6 SECONDS)

/proc/fd_openingstudio()
	var/novel_message = "АВТОРЫ ОРИГИНАЛА"
	var/colored = PIPE_COLOR_RED

	var/obj/screen/novel_message/start_credits/nofade_simple/visuals = new /obj/screen/novel_message/start_credits/nofade_simple()
	visuals.maptext_x = 20
	visuals.maptext_y = -160
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 6 SECONDS)

/proc/fd_openingstudio2()
	var/novel_message = "\"STUDIO BONES\""
	var/colored = COLOR_ASSEMBLY_BLACK

	var/obj/screen/novel_message/start_credits/big_nofade/visuals = new /obj/screen/novel_message/start_credits/big_nofade()
	visuals.maptext_y = -60
	visuals.maptext_x = 15
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 6 SECONDS)

/proc/fd_ourstudio()
	var/novel_message = "ПЕРЕДЕЛАЛИ ДЛЯ ВАС"
	var/colored = PIPE_COLOR_RED

	var/obj/screen/novel_message/start_credits/nofade_simple/visuals = new /obj/screen/novel_message/start_credits/nofade_simple()
	visuals.maptext_x = -20
	visuals.maptext_y = -215
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 6 SECONDS)

/proc/fd_ourstudio2()
	var/novel_message = "ТО \"UNDERGROUND FRONT\""
	var/colored = COLOR_ASSEMBLY_BLACK

	var/obj/screen/novel_message/start_credits/big_nofade/visuals = new /obj/screen/novel_message/start_credits/big_nofade()
	visuals.maptext_y = -90
	visuals.maptext_x = 15
	for(var/client/M in GLOB.clients)
		M.screen += visuals
		visuals.set_text(novel_message, colored, time = 6 SECONDS)

/mob/living/simple_animal/cutscene_character/zlata/s2ep2/big_version
	plane = HUD_PLANE
	mouse_opacity = FALSE
	alpha = 0

/mob/living/simple_animal/cutscene_character/zlata/s2ep2/big_version/Initialize()
	. = ..()
	SetTransform(30)

/mob/living/simple_animal/cutscene_character/zlata/s2ep2/big_version/Life()
	. = ..()
	layer = 4.8

/mob/living/simple_animal/cutscene_character/naia/s2ep2/big_version
	plane = HUD_PLANE
	mouse_opacity = FALSE
	alpha = 0

/mob/living/simple_animal/cutscene_character/naia/s2ep2/big_version/Initialize()
	. = ..()
	SetTransform(13)

/mob/living/simple_animal/cutscene_character/naia/s2ep2/big_version/Life()
	. = ..()
	layer = 4.9

/mob/living/simple_animal/cutscene_character/datura/s2ep2/big_version
	plane = HUD_PLANE
	mouse_opacity = FALSE
	alpha = 0

/mob/living/simple_animal/cutscene_character/datura/s2ep2/big_version/Initialize()
	. = ..()
	SetTransform(13)

/mob/living/simple_animal/cutscene_character/datura/s2ep2/big_version/Life()
	. = ..()
	layer = 4.9

/mob/living/simple_animal/cutscene_character/fiddler/s2ep2/big_version
	plane = HUD_PLANE
	mouse_opacity = FALSE
	alpha = 0

/mob/living/simple_animal/cutscene_character/fiddler/s2ep2/big_version/Initialize()
	. = ..()
	SetTransform(13)

/mob/living/simple_animal/cutscene_character/fiddler/s2ep2/big_version/Life()
	. = ..()
	layer = 4.9

/mob/living/simple_animal/cutscene_character/amelia/s2ep2/big_version
	plane = HUD_PLANE
	mouse_opacity = FALSE
	alpha = 0

/mob/living/simple_animal/cutscene_character/amelia/s2ep2/big_version/Initialize()
	. = ..()
	SetTransform(13)

/mob/living/simple_animal/cutscene_character/amelia/s2ep2/big_version/Life()
	. = ..()
	layer = 4.9

/mob/living/simple_animal/cutscene_character/emmy/big_version
	plane = HUD_PLANE
	mouse_opacity = FALSE
	alpha = 0

/mob/living/simple_animal/cutscene_character/emmy/big_version/Initialize()
	. = ..()
	SetTransform(13)

/mob/living/simple_animal/cutscene_character/emmy/big_version/Life()
	. = ..()
	layer = 4.9

/mob/living/simple_animal/cutscene_character/kai/big_version
	plane = HUD_PLANE
	mouse_opacity = FALSE
	alpha = 0

/mob/living/simple_animal/cutscene_character/kai/big_version/Initialize()
	. = ..()
	SetTransform(13)

/mob/living/simple_animal/cutscene_character/kai/big_version/Life()
	. = ..()
	layer = 4.9

/mob/living/simple_animal/cutscene_character/luny/s2ep2/big_version
	plane = HUD_PLANE
	mouse_opacity = FALSE
	alpha = 0

/mob/living/simple_animal/cutscene_character/luny/s2ep2/big_version/Initialize()
	. = ..()
	SetTransform(13)

/mob/living/simple_animal/cutscene_character/luny/s2ep2/big_version/Life()
	. = ..()
	layer = 4.9

/mob/living/simple_animal/cutscene_character/gora/s2ep2/big_version
	plane = HUD_PLANE
	mouse_opacity = FALSE
	alpha = 0

/mob/living/simple_animal/cutscene_character/gora/s2ep2/big_version/Initialize()
	. = ..()
	SetTransform(13)

/mob/living/simple_animal/cutscene_character/gora/s2ep2/big_version/Life()
	. = ..()
	layer = 4.9

/mob/living/simple_animal/cutscene_character/lira/s2ep2/big_version
	plane = HUD_PLANE
	mouse_opacity = FALSE
	alpha = 0

/mob/living/simple_animal/cutscene_character/lira/s2ep2/big_version/Initialize()
	. = ..()
	SetTransform(13)

/mob/living/simple_animal/cutscene_character/lira/s2ep2/big_version/Life()
	. = ..()
	layer = 4.9

/mob/living/simple_animal/cutscene_character/tears
	name = "Слеза"
	desc = "..."
	icon = 'maps/torch_doh/cutscenes/icons/Character_Zlata.dmi'
	icon_state = "tears"
	icon_living = "tears"
	icon_dead = "tears"
	should_show_name = FALSE
	alpha = 0

	plane = HUD_PLANE

/mob/living/simple_animal/cutscene_character/tears/Life()
	. = ..()
	layer = 4.9

/mob/living/simple_animal/cutscene_character/roots
	name = "Сорняки"
	desc = "..."
	icon = 'maps/torch_doh/growing.dmi'
	icon_state = "nettle-grow1"
	icon_living = "nettle-grow1"
	icon_dead = "nettle-grow1"
	should_show_name = FALSE

	alpha = 0

/mob/living/simple_animal/cutscene_character/metal_rods
	name = "Прутья"
	desc = "..."
	icon = 'icons/obj/materials/materials.dmi'
	icon_state = "rod"
	icon_living = "rod"
	icon_dead = "rod"
	should_show_name = FALSE

/mob/living/simple_animal/cutscene_character/metal_rods/Initialize()
	. = ..()
	add_filter("telekinesis", 1, list("type" = "outline", , "size" = 1, "color" = COLOR_CYAN))

/mob/living/simple_animal/cutscene_character/metal_rods/Life()
	. = ..()
	layer = 4.9

/mob/living/simple_animal/cutscene_character/actor
	name = "Массовка"
	desc = "..."
	icon = 'maps/torch_doh/cutscenes/icons/actor.dmi'
	icon_state = "actor"
	icon_living = "actor"
	icon_dead = "actor"
	should_show_name = FALSE

/mob/living/simple_animal/cutscene_character/actor/Initialize()
	. = ..()
	add_filter("distortion", 1, list("type" = "blur", "size" = 1))

/mob/living/simple_animal/cutscene_character/actor/downed/Initialize()
	. = ..()
	SetTransform(rotation = 90)

/mob/living/simple_animal/cutscene_character/null_drone
	name = "Нуль"
	desc = "..."
	icon = 'mods/_fd/fd_customs/customs/taushai/icon/omoikane.dmi'
	icon_state = "omoikane"
	icon_living = "omoikane"
	icon_dead = "omoikane"
	should_show_name = FALSE

/mob/living/simple_animal/cutscene_character/martin
	name = "Мартин Э."
	desc = "..."
	icon = 'maps/torch_doh/cutscenes/icons/npc_and_past_characters.dmi'
	icon_state = "Martin"
	icon_living = "Martin"
	icon_dead = "Martin"
	should_show_name = FALSE

/mob/living/simple_animal/cutscene_character/pierre
	name = "Пьерр Э."
	desc = "..."
	icon = 'maps/torch_doh/cutscenes/icons/npc_and_past_characters.dmi'
	icon_state = "Pierre Endsley"
	icon_living = "Pierre Endsley"
	icon_dead = "Pierre Endsley"
	should_show_name = FALSE

/mob/living/simple_animal/cutscene_character/kyler
	name = "Кайлер Ш."
	desc = "..."
	icon = 'maps/torch_doh/cutscenes/icons/npc_and_past_characters.dmi'
	icon_state = "Kyler Schofield"
	icon_living = "Kyler Schofield"
	icon_dead = "Kyler Schofield"
	should_show_name = FALSE

/mob/living/simple_animal/cutscene_character/okita
	name = "Окита Т."
	desc = "..."
	icon = 'maps/torch_doh/cutscenes/icons/npc_and_past_characters.dmi'
	icon_state = "okita_combat2"
	icon_living = "okita_combat2"
	icon_dead = "okita_combat2"
	should_show_name = FALSE

/mob/living/simple_animal/cutscene_character/dina
	name = "Дина Х."
	desc = "..."
	icon = 'maps/torch_doh/cutscenes/icons/npc_and_past_characters.dmi'
	icon_state = "Dina Hossu"
	icon_living = "Dina Hossu"
	icon_dead = "Dina Hossu"
	should_show_name = FALSE

/mob/living/simple_animal/cutscene_character/dina/Life()
	. = ..()
	layer = 4.9

/mob/living/simple_animal/cutscene_character/okita/big_version
	plane = HUD_PLANE
	mouse_opacity = FALSE
	alpha = 0

/mob/living/simple_animal/cutscene_character/okita/big_version/Initialize()
	. = ..()
	SetTransform(13)

/mob/living/simple_animal/cutscene_character/okita/big_version/Life()
	. = ..()
	layer = 4.9

/mob/living/simple_animal/cutscene_character/rk381
	name = "RK-381"
	desc = "..."
	icon = 'maps/torch_doh/cutscenes/icons/Character_RK.dmi'
	icon_state = "Current"
	icon_living = "Current"
	icon_dead = "Current"
	should_show_name = FALSE

/mob/living/simple_animal/cutscene_character/lin
	name = "Лин М."
	desc = "..."
	icon = 'maps/torch_doh/cutscenes/icons/Character_Lin.dmi'
	icon_state = "Current"
	icon_living = "Current"
	icon_dead = "Current"
	should_show_name = FALSE

/mob/living/simple_animal/cutscene_character/victor
	name = "Виктор М."
	desc = "..."
	icon = 'maps/torch_doh/cutscenes/icons/Character_Victor.dmi'
	icon_state = "Current"
	icon_living = "Current"
	icon_dead = "Current"
	should_show_name = FALSE

/mob/living/simple_animal/cutscene_character/aldegar
	name = "Алдегар К."
	desc = "..."
	icon = 'maps/torch_doh/cutscenes/icons/Character_Aldegar.dmi'
	icon_state = "Current"
	icon_living = "Current"
	icon_dead = "Current"
	should_show_name = FALSE

/mob/living/simple_animal/cutscene_character/roku
	name = "DAIS-Roku-2349"
	desc = "..."
	icon = 'maps/torch_doh/cutscenes/icons/Character_Roku.dmi'
	icon_state = "Current"
	icon_living = "Current"
	icon_dead = "Current"
	should_show_name = FALSE

/mob/living/simple_animal/cutscene_character/xrim
	name = "Ксрим"
	desc = "..."
	icon = 'maps/torch_doh/cutscenes/icons/Character_Xrim.dmi'
	icon_state = "Current"
	icon_living = "Current"
	icon_dead = "Current"
	should_show_name = FALSE

/mob/living/simple_animal/cutscene_character/cubic
	name = "Кубик"
	desc = "..."
	icon = 'maps/torch_doh/cutscenes/icons/Character_Qoobic.dmi'
	icon_state = "Current"
	icon_living = "Current"
	icon_dead = "Current"
	should_show_name = FALSE

/mob/living/simple_animal/cutscene_character/ace
	name = "Мортимер Э."
	desc = "..."
	icon = 'maps/torch_doh/cutscenes/icons/Character_Ace.dmi'
	icon_state = "Current"
	icon_living = "Current"
	icon_dead = "Current"
	should_show_name = FALSE

/mob/living/simple_animal/cutscene_character/linch
	name = "Лукаш П."
	desc = "..."
	icon = 'maps/torch_doh/cutscenes/icons/Character_Linch.dmi'
	icon_state = "Current"
	icon_living = "Current"
	icon_dead = "Current"
	should_show_name = FALSE

/mob/living/simple_animal/cutscene_character/adriano
	name = "Адриано М."
	desc = "..."
	icon = 'maps/torch_doh/cutscenes/icons/Character_Adriano.dmi'
	icon_state = "Current"
	icon_living = "Current"
	icon_dead = "Current"
	should_show_name = FALSE

/mob/living/simple_animal/cutscene_character/perci_robot
	name = "Персиваль 2.0"
	desc = "..."
	icon = 'maps/torch_doh/cutscenes/icons/Character_Perci.dmi'
	icon_state = "Current"
	icon_living = "Current"
	icon_dead = "Current"
	should_show_name = FALSE

/mob/living/simple_animal/cutscene_character/perci_robot/big_version
	plane = HUD_PLANE
	mouse_opacity = FALSE
	alpha = 0

/mob/living/simple_animal/cutscene_character/perci_robot/big_version/Initialize()
	. = ..()
	SetTransform(13)

/mob/living/simple_animal/cutscene_character/perci_robot/big_version/Life()
	. = ..()
	layer = 4.9

/mob/living/simple_animal/cutscene_character/brownteam/ostin
	name = "Остин Г."
	desc = "..."
	icon = 'maps/torch_doh/cutscenes/icons/npc_and_past_characters.dmi'
	icon_state = "ostin equipped"
	icon_living = "ostin equipped"
	icon_dead = "ostin equipped"
	should_show_name = FALSE

/mob/living/simple_animal/cutscene_character/brownteam/anri
	name = "Анри"
	desc = "..."
	icon = 'maps/torch_doh/cutscenes/icons/npc_and_past_characters.dmi'
	icon_state = "anri clothing"
	icon_living = "anri clothing"
	icon_dead = "anri clothing"
	should_show_name = FALSE

/mob/living/simple_animal/cutscene_character/brownteam/ser
	name = "Сэр"
	desc = "..."
	icon = 'maps/torch_doh/cutscenes/icons/npc_and_past_characters.dmi'
	icon_state = "S.E.R"
	icon_living = "S.E.R"
	icon_dead = "S.E.R"
	should_show_name = FALSE

/mob/living/simple_animal/cutscene_character/brownteam/ser/Initialize()
	. = ..()
	SetTransform(2)

/mob/living/simple_animal/cutscene_character/brownteam/stan
	name = "Стэнли В."
	desc = "..."
	icon = 'maps/torch_doh/cutscenes/icons/npc_and_past_characters.dmi'
	icon_state = "stanley clothing"
	icon_living = "stanley clothing"
	icon_dead = "stanley clothing"
	should_show_name = FALSE

/mob/living/simple_animal/cutscene_character/brownteam/stone
	name = "Эмми С."
	desc = "..."
	icon = 'maps/torch_doh/cutscenes/icons/npc_and_past_characters.dmi'
	icon_state = "ammy clothing"
	icon_living = "ammy clothing"
	icon_dead = "ammy clothing"
	should_show_name = FALSE

/mob/living/simple_animal/cutscene_character/brownteam/baxter
	name = "Декстер Б."
	desc = "..."
	icon = 'maps/torch_doh/cutscenes/icons/npc_and_past_characters.dmi'
	icon_state = "baxter clothing"
	icon_living = "baxter clothing"
	icon_dead = "baxter clothing"
	should_show_name = FALSE

/mob/living/simple_animal/cutscene_character/brownteam/willhelm_original
	name = "Вильгельм К."
	desc = "..."
	icon = 'maps/torch_doh/cutscenes/icons/npc_and_past_characters.dmi'
	icon_state = "canaris_canon"
	icon_living = "canaris_canon"
	icon_dead = "canaris_canon"
	should_show_name = FALSE

/mob/living/simple_animal/cutscene_character/brownteam/bassow
	name = "Данил Б."
	desc = "..."
	icon = 'maps/torch_doh/cutscenes/icons/npc_and_past_characters.dmi'
	icon_state = "bassow"
	icon_living = "bassow"
	icon_dead = "bassow"
	should_show_name = FALSE

/mob/living/simple_animal/cutscene_character/brown
	name = "Майкл Б."
	desc = "..."
	icon = 'maps/torch_doh/cutscenes/icons/Character_Brown.dmi'
	icon_state = "Current"
	icon_living = "Current"
	icon_dead = "Current"
	should_show_name = FALSE

/mob/living/simple_animal/cutscene_character/brown/big_version
	plane = HUD_PLANE
	mouse_opacity = FALSE
	alpha = 0

/mob/living/simple_animal/cutscene_character/brown/big_version/Initialize()
	. = ..()
	SetTransform(13)

/mob/living/simple_animal/cutscene_character/brown/big_version/Life()
	. = ..()
	layer = 4.9

/mob/living/simple_animal/cutscene_character/brown/big_version/shadow
	color = "#b40000"

/mob/living/simple_animal/cutscene_character/brown/big_version/shadow/Initialize()
	. = ..()

/mob/living/simple_animal/cutscene_character/brown/big_version/shadow/Life()
	. = ..()
	layer = 4.3

// Да, это персонажи. Почему? Потому что таким образом мне проще манипулировать анимациями
/mob/living/simple_animal/cutscene_character/scg_seal
	icon = 'maps/torch/icons/obj/solgov-decals.dmi'
	icon_state = "solgov_realseal"
	plane = HUD_PLANE

	name = "Лого ЦПСС"
	mouse_opacity = FALSE
	should_show_name = FALSE
	alpha = 0

/mob/living/simple_animal/cutscene_character/scg_seal/Initialize()
	. = ..()
	SetTransform(11)

/mob/living/simple_animal/cutscene_character/iccgn_seal
	icon = 'mods/_fd/_maps/gccv_ulyanovsk/icons/ulyanovsk.dmi'
	icon_state = "iccg_seal"
	plane = HUD_PLANE

	name = "Лого ГКК"
	mouse_opacity = FALSE
	should_show_name = FALSE
	alpha = 0

/mob/living/simple_animal/cutscene_character/iccgn_seal/Initialize()
	. = ..()
	SetTransform(11)

/obj/effect/cutscene_camera/s2op1/sc1
	camera_id = "Опенинг 1 - Кадр 1"

/obj/effect/cutscene_camera/s2op1/sc2
	camera_id = "Опенинг 1 - Кадр 2"

/obj/effect/cutscene_camera/s2op1/sc3
	camera_id = "Опенинг 1 - Кадр 3"

/obj/effect/cutscene_camera/s2op1/sc4
	camera_id = "Опенинг 1 - Кадр 4"

/obj/effect/cutscene_camera/s2op1/sc5
	camera_id = "Опенинг 1 - Кадр 5"

/obj/effect/cutscene_camera/s2op1/sc6
	camera_id = "Опенинг 1 - Кадр 6"

/obj/effect/cutscene_camera/s2op1/sc7
	camera_id = "Опенинг 1 - Кадр 7"

/obj/effect/cutscene_camera/s2op1/sc8
	camera_id = "Опенинг 1 - Кадр 8"

/obj/effect/cutscene_camera/s2op1/sc9
	camera_id = "Опенинг 1 - Кадр 9"

/obj/effect/cutscene_camera/s2op1/sc10
	camera_id = "Опенинг 1 - Кадр 10"

/obj/effect/cutscene_camera/s2op1/sc11
	camera_id = "Опенинг 1 - Кадр 11"

/obj/effect/cutscene_camera/s2op1/sc12
	camera_id = "Опенинг 1 - Кадр 12"

/obj/effect/cutscene_camera/s2op1/sc13
	camera_id = "Опенинг 1 - Кадр 13"

/obj/effect/cutscene_camera/s2op1/sc14
	camera_id = "Опенинг 1 - Кадр 14"

/obj/effect/cutscene_camera/s2op1/sc15
	camera_id = "Опенинг 1 - Кадр 15"

/obj/effect/cutscene_camera/s2op1/sc16
	camera_id = "Опенинг 1 - Кадр 16"

/obj/effect/cutscene_camera/s2op1/sc17
	camera_id = "Опенинг 1 - Кадр 17"

/obj/effect/cutscene_camera/s2op1/sc18
	camera_id = "Опенинг 1 - Кадр 18"

/obj/effect/cutscene_camera/s2op1/sc19
	camera_id = "Опенинг 1 - Кадр 19"

/proc/fds2op1()
	start_cutscene(/datum/modular_cutscene/fds2op1sc1)

/datum/modular_cutscene/fds2op1sc1/setup_actions(...)
	actions = list(
		ADD_SCREEN(/blackout/animated_better) = 4 SECONDS,
		REMOVE_SCREEN(/blackout/animated_better, 1 SECONDS),
		TP_CAMERA("Опенинг 1 - Кадр 1"),
		PLAY_SOUND(sound('maps/torch_doh/cutscenes/sounds/again.ogg', volume = 50)),
		MOVE_CAMERA(40, -3, 0, null) = 1 SECOND,
		CALL_GLOB(opening1_line1),
		CHANGE_ACTOR_VISIBILITY(actor("Лого ЦПСС"), 255, 2 SECONDS, SINE_EASING, ANIMATION_PARALLEL),
		SHIFT_ACTOR(actor("Лого ЦПСС"), 32, 352, 12 SECONDS, LINEAR_EASING|EASE_IN, ANIMATION_PARALLEL) = 2 SECONDS,
		CALL_GLOB(opening1_line2),
		CHANGE_ACTOR_VISIBILITY(actor("Лого ГКК"), 255, 2 SECONDS, SINE_EASING, ANIMATION_PARALLEL),
		SHIFT_ACTOR(actor("Лого ГКК"), 32, -352, 12 SECONDS, LINEAR_EASING|EASE_IN, ANIMATION_PARALLEL) = 1 SECONDS,
		CHANGE_ACTOR_VISIBILITY(actor("Тень Брауна - Опенинг-1"), 150, 1 SECONDS, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Браун - Опенинг-1"), 255, 1 SECONDS, SINE_EASING, null) = 1 SECONDS,
		CALL_GLOB(opening1_line3),
		TURN_ACTOR(actor("Тень Брауна - Опенинг-1"), WEST),
		TURN_ACTOR(actor("Браун - Опенинг-1"), WEST) = 2 SECONDS,
		ADD_SCREEN(/cinema_borders),
		MOVE_CAMERA(0, -3, 3 SECONDS, CUBIC_EASING|EASE_OUT) = 1 SECONDS,
		CALL_GLOB(opening1_line4) = 2 SECONDS,
		CALL_GLOB(opening1_line5) = 1 SECONDS,
		MOVE_ACTOR(actor("Амелия - Опенинг-1"), EAST) = 0.5 SECONDS,
		CHANGE_ACTOR_VISIBILITY(actor("Браун - Опенинг-2"), 255, 0.5 SECONDS, LINEAR_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Амелия - Опенинг-2"), 255, 0.5 SECONDS, LINEAR_EASING, null) = 0.5 SECONDS,
		TURN_ACTOR(actor("Амелия - Опенинг-2"), NORTH),
		TURN_ACTOR(actor("Амелия - Опенинг-1"), NORTH),
		MOVE_ACTOR(actor("Амелия - Опенинг-1"), EAST) = 1 SECONDS,
		CALL_GLOB(fd_titledrop),
		MOVE_CAMERA(0, 30, 5 SECONDS, CUBIC_EASING|EASE_IN) = 3 SECONDS,
		CHANGE_ACTOR_VISIBILITY(actor("Лого ЦПСС"), 0, 0, null, null),
		CHANGE_ACTOR_VISIBILITY(actor("Лого ГКК"), 0, 0, null, null),
		ADD_SCREEN(/blackout/animated_better) = 7 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/fds2op1sc2)
	)

/datum/modular_cutscene/fds2op1sc2/setup_actions(...)
	actions = list(
		TP_CAMERA("Опенинг 1 - Кадр 2"),
		ADD_SCREEN(/cinema_borders),
		MOVE_CAMERA(15, 0, 0, null),
		CALL_GLOB(opening1_line6),
		MOVE_CAMERA(-1, 0, 10 SECONDS, CUBIC_EASING|EASE_OUT) = 2 SECONDS,
		CALL_GLOB(opening1_line7),
		CHANGE_ACTOR_VISIBILITY(actor("Эмми - Опенинг-1"), 255, 0.5 SECONDS, SINE_EASING, ANIMATION_PARALLEL),
		SHIFT_ACTOR(actor("Эмми - Опенинг-1"), 0, -96, 10 SECONDS, LINEAR_EASING|EASE_IN, ANIMATION_PARALLEL) = 4 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/fds2op1sc3)
	)

/datum/modular_cutscene/fds2op1sc3/setup_actions(...)
	actions = list(
		TP_CAMERA("Опенинг 1 - Кадр 3"),
		ADD_SCREEN(/cinema_borders),
		CHANGE_ACTOR_VISIBILITY(actor("Лира - Опенинг-1"), 255, 0, null, null),
		SHIFT_ACTOR(actor("Лира - Опенинг-1"), 0, -64, 20 SECONDS, LINEAR_EASING|EASE_IN, ANIMATION_PARALLEL) = 1 SECONDS,
		CALL_GLOB(opening1_line8) = 2 SECONDS,
		CALL_GLOB(opening1_line9),
		TURN_ACTOR(actor("Лира - Опенинг-1"), EAST) = 1 SECONDS,
		MOVE_CAMERA(20, 0, 5 SECONDS, SINE_EASING|EASE_OUT) = 3 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/fds2op1sc4)
	)

/datum/modular_cutscene/fds2op1sc4/setup_actions(...)
	actions = list(
		TP_CAMERA("Опенинг 1 - Кадр 4"),
		ADD_SCREEN(/cinema_borders),
		MOVE_CAMERA(0, 0, 0, null),
		MOVE_CAMERA(3, 0, 7 SECONDS, LINEAR_EASING|EASE_IN),
		CALL_GLOB(opening1_line10),
		CHANGE_ACTOR_VISIBILITY(actor("Окита - Опенинг-1"), 255, 0, null, null) = 2 SECONDS,
		CALL_GLOB(opening1_line11) = 1 SECONDS,
		CHANGE_ACTOR_VISIBILITY(actor("Окита - Опенинг-1"), 0, 0, null, null),
		START_CUTSCENE(/datum/modular_cutscene/fds2op1sc5)
	)

/datum/modular_cutscene/fds2op1sc5/setup_actions(...)
	actions = list(
		TP_CAMERA("Опенинг 1 - Кадр 5"),
		ADD_SCREEN(/cinema_borders),
		CALL_GLOB(opening1_line12),
		MOVE_ACTOR(actor("Луни - Опенинг-1"), WEST) = 1 SECONDS,
		CHANGE_ACTOR_VISUALS(actor("Луни - Опенинг-1"), "OP 1 - 1"),
		SHIFT_ACTOR(actor("Луни - Опенинг-1"), -16, 0, 2 SECONDS, SINE_EASING|EASE_IN, null) = 0.5 SECONDS,
		CHANGE_ACTOR_VISIBILITY(actor("Луни - Опенинг-2"), 255, 1 SECONDS, SINE_EASING, ANIMATION_PARALLEL),
		SHIFT_ACTOR(actor("Луни - Опенинг-2"), -16, -64, 2 SECONDS, SINE_EASING|EASE_IN, ANIMATION_PARALLEL) = 0.5 SECONDS,
		CALL_GLOB(opening1_line13) = 2 SECONDS,
		CHANGE_ACTOR_VISIBILITY(actor("Луни - Опенинг-2"), 0, 0, null, null),
		START_CUTSCENE(/datum/modular_cutscene/fds2op1sc6)
	)

/datum/modular_cutscene/fds2op1sc6/setup_actions(...)
	actions = list(
		TP_CAMERA("Опенинг 1 - Кадр 6"),
		ADD_SCREEN(/cinema_borders),
		MOVE_CAMERA(0, 6, 0, null),
		CALL_GLOB(opening1_line14),
		MOVE_CAMERA(0, -6, 5 SECONDS, LINEAR_EASING|EASE_IN) = 1 SECONDS,
		CALL_GLOB(opening1_line15) = 2 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/fds2op1sc7)
	)

/datum/modular_cutscene/fds2op1sc7/setup_actions(...)
	actions = list(
		TP_CAMERA("Опенинг 1 - Кадр 7"),
		CALL_GLOB(opening1_line16),
		ADD_SCREEN(/cinema_borders) = 2 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/fds2op1sc8)
	)

/datum/modular_cutscene/fds2op1sc8/setup_actions(...)
	actions = list(
		TP_CAMERA("Опенинг 1 - Кадр 8"),
		ADD_SCREEN(/cinema_borders),
		MOVE_CAMERA(0, 0, 0, null),
		CHANGE_ACTOR_VISIBILITY(actor("Злата - Опенинг-1"), 255, 0, null, null),
		CHANGE_ACTOR_VISIBILITY(actor("Слеза"), 150, 0.3 SECONDS, SINE_EASING, ANIMATION_PARALLEL),
		SHIFT_ACTOR(actor("Слеза"), 86, -32, 1 SECONDS, CUBIC_EASING|EASE_OUT, ANIMATION_PARALLEL) = 0.3 SECONDS,
		CALL_GLOB(opening1_line17) = 0.4 SECONDS,
		CALL_GLOB(opening1_line17_1) = 0.3 SECONDS,
		CALL_GLOB(opening1_line17_2) = 0.5 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/fds2op1sc9)
	)

/datum/modular_cutscene/fds2op1sc9/setup_actions(...)
	actions = list(
		TP_CAMERA("Опенинг 1 - Кадр 9"),
		ADD_SCREEN(/cinema_borders),
		MOVE_CAMERA(6, 0, 0, null),
		CALL_GLOB(opening1_line18),
		CHANGE_ACTOR_VISIBILITY(actor("Датура - Опенинг-1"), 255, 0, null, ANIMATION_PARALLEL),
		SHIFT_ACTOR(actor("Датура - Опенинг-1"), -288, -96, 10 SECONDS, LINEAR_EASING|EASE_IN, ANIMATION_PARALLEL),
		MOVE_CAMERA(-6, 0, 4 SECONDS, LINEAR_EASING|EASE_IN) = 2 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/fds2op1sc10)
	)

/datum/modular_cutscene/fds2op1sc10/setup_actions(...)
	actions = list(
		TP_CAMERA("Опенинг 1 - Кадр 10"),
		ADD_SCREEN(/cinema_borders),
		CHANGE_ACTOR_VISIBILITY(actor("Датура - Опенинг-1"), 0, 0, null, null),
		CHANGE_ACTOR_MATRIX(actor("Дина - Опенинг-1"), 65, 0, null, null),
		MOVE_CAMERA(0, 6, 0, null),
		CALL_GLOB(opening1_line19),
		CHANGE_ACTOR_VISIBILITY(actor("Ная - Опенинг-1"), 255, 0, null, ANIMATION_PARALLEL),
		SHIFT_ACTOR(actor("Ная - Опенинг-1"), -96, -288, 6 SECONDS, LINEAR_EASING|EASE_IN, ANIMATION_PARALLEL),
		MOVE_CAMERA(0, -6, 6 SECONDS, LINEAR_EASING|EASE_IN) = 2 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/fds2op1sc11)
	)

/datum/modular_cutscene/fds2op1sc11/setup_actions(...)
	actions = list(
		TP_CAMERA("Опенинг 1 - Кадр 11"),
		ADD_SCREEN(/cinema_borders),
		CHANGE_ACTOR_VISIBILITY(actor("Ная - Опенинг-1"), 0, 0, null, null),
		CALL_GLOB(opening1_line20),
		MOVE_ACTOR(actor("Нуль - Опенинг-1"), SOUTH) = 0.2 SECONDS,
		MOVE_ACTOR(actor("Нуль - Опенинг-1"), SOUTH) = 0.2 SECONDS,
		MOVE_ACTOR(actor("Нуль - Опенинг-1"), SOUTH) = 0.2 SECONDS,
		MOVE_ACTOR(actor("Нуль - Опенинг-1"), SOUTH) = 0.2 SECONDS,
		MOVE_ACTOR(actor("Нуль - Опенинг-1"), SOUTH) = 0.2 SECONDS,
		TURN_ACTOR(actor("Нуль - Опенинг-1"), EAST),
		CHANGE_ACTOR_VISUALS(actor("Нуль - Опенинг-1"), "omoikane"),
		MOVE_ACTOR(actor("Нуль - Опенинг-1"), SOUTH) = 1 SECONDS,
		TURN_ACTOR(actor("Лин - Опенинг-1"), WEST),
		CALL_GLOB(opening1_line21) = 1 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/fds2op1sc12)
	)

/datum/modular_cutscene/fds2op1sc12/setup_actions(...)
	actions = list(
		TP_CAMERA("Опенинг 1 - Кадр 12"),
		ADD_SCREEN(/cinema_borders),
		MOVE_CAMERA(0, 0, 0, null),
		MOVE_CAMERA(19, 0, 10 SECONDS, LINEAR_EASING|EASE_IN),
		MOVE_ACTOR(actor("СиЭф - Опенинг-1"), NORTH) = 0.5 SECONDS,
		TURN_ACTOR(actor("СиЭф - Опенинг-1"), SOUTH),
		CALL_GLOB(opening1_line22),
		TURN_ACTOR(actor("ЭрКа - Опенинг-1"), SOUTH) = 0.5 SECONDS,
		MOVE_ACTOR(actor("ЭрКа - Опенинг-1"), NORTH) = 1 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/fds2op1sc13)
	)

/datum/modular_cutscene/fds2op1sc13/setup_actions(...)
	actions = list(
		TP_CAMERA("Опенинг 1 - Кадр 13"),
		ADD_SCREEN(/cinema_borders),
		CALL_GLOB(opening1_line23) = 1 SECONDS,
		TURN_ACTOR(actor("Райфлер - Опенинг-1"), EAST) = 1 SECONDS,
		CALL_GLOB(opening1_line24),
		CHANGE_ACTOR_VISIBILITY(actor("Фиддлер - Опенинг-1"), 255, 1 SECONDS, SINE_EASING, null) = 1 SECONDS,
		SHIFT_ACTOR(actor("Фиддлер - Опенинг-3"), -11, 16, 2 SECONDS, SINE_EASING|EASE_IN, null) = 1 SECONDS,
		CALL_GLOB(opening1_line25),
		CHANGE_ACTOR_VISIBILITY(actor("Фиддлер - Опенинг-2"), 255, 0.5 SECONDS, SINE_EASING, null) = 1 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/fds2op1sc14)
	)

/datum/modular_cutscene/fds2op1sc14/setup_actions(...)
	actions = list(
		TP_CAMERA("Опенинг 1 - Кадр 14"),
		ADD_SCREEN(/cinema_borders),
		MOVE_CAMERA(-1, 3, 0, null),
		CALL_GLOB(opening1_line26),
		CHANGE_ACTOR_MATRIX(actor("Мясо - Опенинг-1"), -65, 0, null, null),
		MOVE_CAMERA(0, 0, 0.5 SECONDS, SINE_EASING|EASE_IN),
		CHANGE_ACTOR_MATRIX(actor("Мясо - Опенинг-1"), 0, 1 SECONDS, SINE_EASING|EASE_IN, ANIMATION_PARALLEL),
		SHIFT_ACTOR(actor("Мясо - Опенинг-1"), 20, 0, 0.5 SECONDS, SINE_EASING|EASE_IN, ANIMATION_PARALLEL) = 0.3 SECONDS,
		CHANGE_ACTOR_VISUALS(actor("Мясо - Опенинг-1"), "OP 1 - 2") = 0.2 SECONDS,
		MOVE_CAMERA(20, 0, 4 SECONDS, LINEAR_EASING|EASE_IN),

		CHANGE_ACTOR_VISIBILITY(actor("Сорняк 1-2"), 255, 0.2 SECONDS, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Сорняк 1"), 255, 0.2 SECONDS, SINE_EASING, null) = 0.2 SECONDS,
		CHANGE_ACTOR_VISUALS(actor("Сорняк 1"), "nettle-grow2"),
		CHANGE_ACTOR_VISUALS(actor("Сорняк 1-2"), "nettle-grow2"),
		CHANGE_ACTOR_VISIBILITY(actor("Сорняк 2-2"), 255, 0.2 SECONDS, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Сорняк 2"), 255, 0.2 SECONDS, SINE_EASING, null) = 0.2 SECONDS,
		CHANGE_ACTOR_VISUALS(actor("Сорняк 1"), "nettle-grow3"),
		CHANGE_ACTOR_VISUALS(actor("Сорняк 1-2"), "nettle-grow3"),
		CHANGE_ACTOR_VISUALS(actor("Сорняк 2"), "nettle-grow2"),
		CHANGE_ACTOR_VISUALS(actor("Сорняк 2-2"), "nettle-grow2"),
		CHANGE_ACTOR_VISIBILITY(actor("Сорняк 3-2"), 255, 0.2 SECONDS, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Сорняк 3"), 255, 0.2 SECONDS, SINE_EASING, null) = 0.2 SECONDS,

		CHANGE_ACTOR_MATRIX(actor("Прут 1"), -134, 0.5 SECONDS, SINE_EASING|EASE_OUT, null),
		CHANGE_ACTOR_MATRIX(actor("Прут 2"), -134, 0.5 SECONDS, SINE_EASING|EASE_OUT, null),
		CHANGE_ACTOR_MATRIX(actor("Прут 3"), -134, 0.5 SECONDS, SINE_EASING|EASE_OUT, null),
		SHIFT_ACTOR(actor("Амелия - Опенинг-3"), -5, -5, 0.5 SECONDS, SINE_EASING|EASE_IN, null),

		CHANGE_ACTOR_VISUALS(actor("Сорняк 1"), "nettle-grow4"),
		CHANGE_ACTOR_VISUALS(actor("Сорняк 2"), "nettle-grow3"),
		CHANGE_ACTOR_VISUALS(actor("Сорняк 3"), "nettle-grow2"),
		CHANGE_ACTOR_VISUALS(actor("Сорняк 1-2"), "nettle-grow4"),
		CHANGE_ACTOR_VISUALS(actor("Сорняк 2-2"), "nettle-grow3"),
		CHANGE_ACTOR_VISUALS(actor("Сорняк 3-2"), "nettle-grow2"),
		CHANGE_ACTOR_VISIBILITY(actor("Сорняк 4-2"), 255, 0.2 SECONDS, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Сорняк 4"), 255, 0.2 SECONDS, SINE_EASING, null) = 0.2 SECONDS,
		CHANGE_ACTOR_VISUALS(actor("Сорняк 2"), "nettle-grow4"),
		CHANGE_ACTOR_VISUALS(actor("Сорняк 3"), "nettle-grow3"),
		CHANGE_ACTOR_VISUALS(actor("Сорняк 4"), "nettle-grow2"),
		CHANGE_ACTOR_VISUALS(actor("Сорняк 2-2"), "nettle-grow4"),
		CHANGE_ACTOR_VISUALS(actor("Сорняк 3-2"), "nettle-grow3"),
		CHANGE_ACTOR_VISUALS(actor("Сорняк 4-2"), "nettle-grow2"),
		CHANGE_ACTOR_VISIBILITY(actor("Сорняк 5-2"), 255, 0.2 SECONDS, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Сорняк 5"), 255, 0.2 SECONDS, SINE_EASING, null) = 0.2 SECONDS,

		CALL_GLOB(opening1_line27),

		CHANGE_ACTOR_VISUALS(actor("Сорняк 3"), "nettle-grow4"),
		CHANGE_ACTOR_VISUALS(actor("Сорняк 4"), "nettle-grow3"),
		CHANGE_ACTOR_VISUALS(actor("Сорняк 5"), "nettle-grow2"),
		CHANGE_ACTOR_VISUALS(actor("Сорняк 3-2"), "nettle-grow4"),
		CHANGE_ACTOR_VISUALS(actor("Сорняк 4-2"), "nettle-grow3"),
		CHANGE_ACTOR_VISUALS(actor("Сорняк 5-2"), "nettle-grow2"),
		CHANGE_ACTOR_VISIBILITY(actor("Сорняк 6-2"), 255, 0.2 SECONDS, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Сорняк 6"), 255, 0.2 SECONDS, SINE_EASING, null) = 0.2 SECONDS,

		TURN_ACTOR(actor("Амелия - Опенинг-3"), SOUTH),

		CHANGE_ACTOR_VISUALS(actor("Сорняк 4"), "nettle-grow4"),
		CHANGE_ACTOR_VISUALS(actor("Сорняк 5"), "nettle-grow3"),
		CHANGE_ACTOR_VISUALS(actor("Сорняк 6"), "nettle-grow2"),
		CHANGE_ACTOR_VISUALS(actor("Сорняк 4-2"), "nettle-grow4"),
		CHANGE_ACTOR_VISUALS(actor("Сорняк 5-2"), "nettle-grow3"),
		CHANGE_ACTOR_VISUALS(actor("Сорняк 6-2"), "nettle-grow2"),
		CHANGE_ACTOR_VISIBILITY(actor("Сорняк 7-2"), 255, 0.2 SECONDS, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Сорняк 7"), 255, 0.2 SECONDS, SINE_EASING, null) = 0.2 SECONDS,
		CHANGE_ACTOR_VISUALS(actor("Сорняк 5"), "nettle-grow4"),
		CHANGE_ACTOR_VISUALS(actor("Сорняк 6"), "nettle-grow3"),
		CHANGE_ACTOR_VISUALS(actor("Сорняк 7"), "nettle-grow2"),
		CHANGE_ACTOR_VISUALS(actor("Сорняк 5-2"), "nettle-grow4"),
		CHANGE_ACTOR_VISUALS(actor("Сорняк 6-2"), "nettle-grow3"),
		CHANGE_ACTOR_VISUALS(actor("Сорняк 7-2"), "nettle-grow2"),
		CHANGE_ACTOR_VISIBILITY(actor("Сорняк 8-2"), 255, 0.2 SECONDS, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Сорняк 8"), 255, 0.2 SECONDS, SINE_EASING, null) = 0.2 SECONDS,

		SHIFT_ACTOR(actor("Амелия - Опенинг-3"), 10, -10, 0.5 SECONDS, SINE_EASING|EASE_OUT, null),

		CHANGE_ACTOR_VISUALS(actor("Сорняк 6"), "nettle-grow4"),
		CHANGE_ACTOR_VISUALS(actor("Сорняк 7"), "nettle-grow3"),
		CHANGE_ACTOR_VISUALS(actor("Сорняк 8"), "nettle-grow2"),
		CHANGE_ACTOR_VISUALS(actor("Сорняк 6-2"), "nettle-grow4"),
		CHANGE_ACTOR_VISUALS(actor("Сорняк 7-2"), "nettle-grow3"),
		CHANGE_ACTOR_VISUALS(actor("Сорняк 8-2"), "nettle-grow2"),
		CHANGE_ACTOR_VISIBILITY(actor("Сорняк 9-2"), 255, 0.2 SECONDS, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Сорняк 9"), 255, 0.2 SECONDS, SINE_EASING, null) = 0.2 SECONDS,

		SHIFT_ACTOR(actor("Прут 3"), 460, 0, 0.2 SECONDS, SINE_EASING|EASE_IN, null),

		CHANGE_ACTOR_VISUALS(actor("Сорняк 7"), "nettle-grow4"),
		CHANGE_ACTOR_VISUALS(actor("Сорняк 8"), "nettle-grow3"),
		CHANGE_ACTOR_VISUALS(actor("Сорняк 9"), "nettle-grow2"),
		CHANGE_ACTOR_VISUALS(actor("Сорняк 7-2"), "nettle-grow4"),
		CHANGE_ACTOR_VISUALS(actor("Сорняк 8-2"), "nettle-grow3"),
		CHANGE_ACTOR_VISUALS(actor("Сорняк 9-2"), "nettle-grow2"),
		CHANGE_ACTOR_VISIBILITY(actor("Сорняк 10-2"), 255, 0.2 SECONDS, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Сорняк 10"), 255, 0.2 SECONDS, SINE_EASING, null) = 0.2 SECONDS,

		TURN_ACTOR(actor("Амелия - Опенинг-3"), EAST),
		SHIFT_ACTOR(actor("Прут 1"), 460, -10, 0.2 SECONDS, SINE_EASING|EASE_IN, null),

		CHANGE_ACTOR_VISUALS(actor("Сорняк 8"), "nettle-grow4"),
		CHANGE_ACTOR_VISUALS(actor("Сорняк 9"), "nettle-grow3"),
		CHANGE_ACTOR_VISUALS(actor("Сорняк 10"), "nettle-grow2"),
		CHANGE_ACTOR_VISUALS(actor("Сорняк 8-2"), "nettle-grow4"),
		CHANGE_ACTOR_VISUALS(actor("Сорняк 9-2"), "nettle-grow3"),
		CHANGE_ACTOR_VISUALS(actor("Сорняк 10-2"), "nettle-grow2"),
		CHANGE_ACTOR_VISIBILITY(actor("Сорняк 11-2"), 255, 0.2 SECONDS, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Сорняк 11"), 255, 0.2 SECONDS, SINE_EASING, null) = 0.2 SECONDS,
		CHANGE_ACTOR_VISUALS(actor("Сорняк 9"), "nettle-grow4"),
		CHANGE_ACTOR_VISUALS(actor("Сорняк 10"), "nettle-grow3"),
		CHANGE_ACTOR_VISUALS(actor("Сорняк 11"), "nettle-grow2"),
		CHANGE_ACTOR_VISUALS(actor("Сорняк 9-2"), "nettle-grow4"),
		CHANGE_ACTOR_VISUALS(actor("Сорняк 10-2"), "nettle-grow3"),
		CHANGE_ACTOR_VISUALS(actor("Сорняк 11-2"), "nettle-grow2"),
		CHANGE_ACTOR_VISIBILITY(actor("Сорняк 12-2"), 255, 0.2 SECONDS, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Сорняк 12"), 255, 0.2 SECONDS, SINE_EASING, null) = 0.2 SECONDS,

		SHIFT_ACTOR(actor("Прут 2"), 460, 4, 0.2 SECONDS, SINE_EASING|EASE_IN, null),

		CHANGE_ACTOR_VISUALS(actor("Сорняк 10"), "nettle-grow4"),
		CHANGE_ACTOR_VISUALS(actor("Сорняк 11"), "nettle-grow3"),
		CHANGE_ACTOR_VISUALS(actor("Сорняк 12"), "nettle-grow2"),
		CHANGE_ACTOR_VISUALS(actor("Сорняк 10-2"), "nettle-grow4"),
		CHANGE_ACTOR_VISUALS(actor("Сорняк 11-2"), "nettle-grow3"),
		CHANGE_ACTOR_VISUALS(actor("Сорняк 12-2"), "nettle-grow2"),
		CHANGE_ACTOR_VISIBILITY(actor("Сорняк 13-2"), 255, 0.2 SECONDS, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Сорняк 13"), 255, 0.2 SECONDS, SINE_EASING, null) = 0.2 SECONDS,
		CHANGE_ACTOR_VISUALS(actor("Сорняк 11"), "nettle-grow4"),
		CHANGE_ACTOR_VISUALS(actor("Сорняк 12"), "nettle-grow3"),
		CHANGE_ACTOR_VISUALS(actor("Сорняк 13"), "nettle-grow2"),
		CHANGE_ACTOR_VISUALS(actor("Сорняк 11-2"), "nettle-grow4"),
		CHANGE_ACTOR_VISUALS(actor("Сорняк 12-2"), "nettle-grow3"),
		CHANGE_ACTOR_VISUALS(actor("Сорняк 13-2"), "nettle-grow2"),
		CHANGE_ACTOR_VISIBILITY(actor("Сорняк 14-2"), 255, 0.2 SECONDS, SINE_EASING, null),
		CHANGE_ACTOR_VISIBILITY(actor("Сорняк 14"), 255, 0.2 SECONDS, SINE_EASING, null) = 0.2 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/fds2op1sc15)
	)

/datum/modular_cutscene/fds2op1sc15/setup_actions(...)
	actions = list(
		TP_CAMERA("Опенинг 1 - Кадр 15"),
		ADD_SCREEN(/cinema_borders),
		MOVE_CAMERA(-5, 0, 0, null),
		MOVE_CAMERA(5, 0, 5 SECONDS, LINEAR_EASING|EASE_IN),
		CALL_GLOB(opening1_line28),
		MOVE_ACTOR(actor("Персиваль - Опенинг-1"), NORTH) = 1 SECONDS,
		MOVE_ACTOR(actor("Персиваль - Опенинг-1"), NORTH) = 0.5 SECONDS,
		TURN_ACTOR(actor("Персиваль - Опенинг-1"), EAST) = 0.5 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/fds2op1sc16)
	)

/datum/modular_cutscene/fds2op1sc16/setup_actions(...)
	actions = list(
		TP_CAMERA("Опенинг 1 - Кадр 16"),
		ADD_SCREEN(/cinema_borders),
		CALL_GLOB(opening1_line29),
		CHANGE_ACTOR_VISIBILITY(actor("Персиваль РОБОТ - Опенинг-1"), 255, 2 SECONDS, SINE_EASING, ANIMATION_PARALLEL),
		SHIFT_ACTOR(actor("Персиваль РОБОТ - Опенинг-1"), 96, -96, 2 SECONDS, LINEAR_EASING|EASE_IN, ANIMATION_PARALLEL) = 2 SECONDS,
		CALL_GLOB(opening1_line30),
		TURN_ACTOR(actor("Персиваль РОБОТ - Опенинг-1"), SOUTH),
		TURN_ACTOR(actor("Персиваль РОБОТ - Опенинг-2"), SOUTH) = 1 SECONDS,
		MOVE_ACTOR(actor("Персиваль РОБОТ - Опенинг-2"), SOUTH),
		MOVE_CAMERA(5, -6, 8 SECONDS, LINEAR_EASING|EASE_IN) = 1 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/fds2op1sc17)
	)

/datum/modular_cutscene/fds2op1sc17/setup_actions(...)
	actions = list(
		TP_CAMERA("Опенинг 1 - Кадр 17"),
		ADD_SCREEN(/cinema_borders),
		CALL_GLOB(opening1_line31),
		CHANGE_ACTOR_VISIBILITY(actor("Гора - Опенинг-1"), 255, 2 SECONDS, SINE_EASING, ANIMATION_PARALLEL),
		SHIFT_ACTOR(actor("Гора - Опенинг-1"), 96, -96, 6 SECONDS, LINEAR_EASING|EASE_IN, ANIMATION_PARALLEL),
		MOVE_ACTOR(actor("Гора - Опенинг-2"), NORTH) = 1 SECONDS,
		TURN_ACTOR(actor("Гора - Опенинг-2"), WEST) = 2 SECONDS,
		CALL_GLOB(opening1_line32) = 2 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/fds2op1sc18)
	)

/datum/modular_cutscene/fds2op1sc18/setup_actions(...)
	actions = list(
		TP_CAMERA("Опенинг 1 - Кадр 18"),
		ADD_SCREEN(/cinema_borders),
		CHANGE_ACTOR_VISIBILITY(actor("Гора - Опенинг-1"), 0, 0, null, null),
		MOVE_CAMERA(5, 5, 0, null),
		MOVE_CAMERA(5, -5, 8 SECONDS, LINEAR_EASING|EASE_IN),
		CALL_GLOB(opening1_line33),
		CHANGE_ACTOR_VISIBILITY(actor("Уфу - Опенинг-1"), 255, 2 SECONDS, SINE_EASING, ANIMATION_PARALLEL),
		SHIFT_ACTOR(actor("Уфу - Опенинг-1"), -224, -96, 8 SECONDS, LINEAR_EASING|EASE_IN, ANIMATION_PARALLEL),
		MOVE_ACTOR(actor("Люк - Опенинг-1"), WEST) = 0.5 SECONDS,
		MOVE_ACTOR(actor("Виктор - Опенинг-1"), SOUTH),
		TURN_ACTOR(actor("Виктор - Опенинг-1"), EAST),
		TURN_ACTOR(actor("Люк - Опенинг-1"), SOUTH) = 1.5 SECONDS,
		TURN_ACTOR(actor("Виктор - Опенинг-1"), WEST),
		MOVE_ACTOR(actor("Люк - Опенинг-1"), SOUTH) = 1 SECONDS,
		TURN_ACTOR(actor("Уфу - Опенинг-1"), WEST),
		TURN_ACTOR(actor("Уфу - Опенинг-2"), WEST),
		MOVE_ACTOR(actor("Виктор - Опенинг-1"), WEST),
		CALL_GLOB(opening1_line34),
		MOVE_ACTOR(actor("Люк - Опенинг-1"), SOUTH) = 1 SECONDS,
		ADD_SCREEN(/blackout/animated_better),
		TURN_ACTOR(actor("Люк - Опенинг-1"), EAST),
		MOVE_ACTOR(actor("Виктор - Опенинг-1"), WEST) = 1 SECONDS,
		CALL_GLOB(opening1_line35) = 2 SECONDS,
		START_CUTSCENE(/datum/modular_cutscene/fds2op1sc19)
	)

/datum/modular_cutscene/fds2op1sc19/setup_actions(...)
	actions = list(
		TP_CAMERA("Опенинг 1 - Кадр 19"),
		ADD_SCREEN(/blackout),
		CHANGE_ACTOR_VISIBILITY(actor("Злата - Опенинг-1"), 0, 0, null, null),
		CHANGE_ACTOR_MATRIX(actor("Четвёртая - Опенинг-1"), 65, 0, null, null),
		CHANGE_ACTOR_MATRIX(actor("Люк - Опенинг-2"), 15, 0, null, null),
		MOVE_CAMERA(0, -20, 0, null),
		REMOVE_SCREEN(/blackout, 2 SECONDS),
		CALL_GLOB(opening1_line36),
		MOVE_CAMERA(0, 0, 4 SECONDS, SINE_EASING|EASE_IN) = 2 SECONDS,
		CALL_GLOB(opening1_line37) = 5 SECONDS,
		ADD_SCREEN(/blackout),
		CALL_GLOB(fd_openingstudio),
		CALL_GLOB(fd_openingstudio2),
		CALL_GLOB(fd_ourstudio),
		CALL_GLOB(fd_ourstudio2) = 6 SECONDS,
		RETURN_VIEWERS
	)
