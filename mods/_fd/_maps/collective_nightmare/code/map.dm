/datum/map_template/ruin/away_site/collective_nightmare
	name = "Collective Nightmare (Non-Campaign)"
	id = "awaysite_nightmare"
	spawn_cost = 2
	description = "..."
	prefix = "mods/_fd/_maps/collective_nightmare/map/"
	suffixes = list("collective_nightmare.dmm")
	area_usage_test_exempted_root_areas = list(/area/nightmare)
	apc_test_exempt_areas = list(
		/area/nightmare = NO_SCRUBBER|NO_VENT|NO_APC
	)

/singleton/submap_archetype/collective_nightmare
	descriptor = "Just an old bar."
	map = "Lunar Bar"
	crew_jobs = list(/datum/job/submap/collective_nightmare)

/obj/submap_landmark/joinable_submap/collective_nightmare
	name = "Lunar Bar"
	archetype = /singleton/submap_archetype/collective_nightmare

/datum/job/submap/collective_nightmare
	title = "Normal Player"
	total_positions = -1
	outfit_type = /singleton/hierarchy/outfit/collective_nightmare
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

/singleton/hierarchy/outfit/collective_nightmare
	name = "Default Player Appearance"

	uniform = /obj/item/clothing/under/det/grey
	shoes = /obj/item/clothing/shoes/laceup

/obj/submap_landmark/spawnpoint/collective_nightmare
	name = "Normal Player"

/datum/interactive_note/nightmare/keys
	name = "Новые замки"
	note_info = {"Недавнее проникновение вышло мне в копейку. Так что, дабы избежать подобного в будущем, я распорядился поменять замки в съёмных комнатах. \
				Ключи, пока что, есть только у меня, сегодня <span style="color: yellow;">поеду</span> делать слепок. Не забудьте предупредить об этом клиентов. Если они <span style="color: yellow;">закроются внутри</span> - вы не откроете их без меня!"}

/obj/structure/fd/interactive/note/nightmare/keys
	name = "Записка"
	attached_text = list(/datum/interactive_note/nightmare/keys)

/datum/interactive_note/nightmare/fred
	name = "Подонок Фред"
	note_info = {"Сижу я тут уже прилично. День или около того. Стены настолько плотные, что ребята даже не в курсе, что этот мудак меня здесь запер. И вряд ли они найдут меня в ближайшее время. \
				Стоило мне только запреметить неладное, как от меня тут же избавились. Наверняка, он уже придумал 100 и 1 причину моего исчезновения. Забавно, не думал что закончу вот так. Из всех возможных вариантов. \
				Кто бы вам что не доказывал, прошу, запомните, <span style="color: yellow;">ФРЕД ИЗ 102-Й - ВАМ НЕ ДРУГ</span>. \
				Он готов продать что угодно и кого угодно, лишь бы выжить самому. Неудивительно, что поймал я его именно на краже еды. У него вся <span style="color: yellow;">комната</span> завалена ею! А ведь, если бы не эта сука, \
				мы бы могли целый день никого не посылать. Впрочем, в каком-то роде, это и моя вина тоже."}

/datum/interactive_note/nightmare/fred/reveal_note_to_player(mob/living/user)
	user.reading = TRUE

	user.overlay_fullscreen("background_note", note_overlay)
	user.overlay_fullscreen("smallshade", /obj/screen/fullscreen/shade)

	if(connected_note)
		if(!connected_note.ci)
			connected_note.ci = new /obj/screen/cancel_interaction()

		connected_note.ci.connected_mob = user
		user.client.screen += connected_note.ci
		animate(connected_note.ci, transform = matrix(-128, 0, MATRIX_TRANSLATE), alpha = 255, time = 3, easing = SINE_EASING|EASE_IN)

	spawn(0.5 SECONDS)

		var/message = "[note_info]"
		var/message_name = "[name]"

		var/obj/screen/player_message/note_text/maintext = new /obj/screen/player_message/note_text()
		var/obj/screen/novel_message/note_name/nameplate = new /obj/screen/novel_message/note_name()
		maintext.layer = 5.4
		nameplate.layer = 5.4

		nameplate.maptext_x = -75
		nameplate.maptext_y = -15
		maintext.maptext_x = 0
		maintext.maptext_y = -300

		user.client.screen += maintext
		user.client.screen += nameplate
		maintext.set_text(message, COLOR_WHITE)
		nameplate.set_text(message_name, COLOR_WHITE)

/datum/interactive_note/nightmare/fred_ending
	name = "Помогите"
	note_info = {"Не знаю, что пугает меня сильнее. Смерть от голода, или неизвестность, таящаяся за дверью. Может быть, меня просто забыли здесь? Всех спасли, а я, блять, застрял в этом персональном Аду навсегда? \
				Это несправедливо. Но такова жизнь. Мне стоит просто смириться, однако мозг всё крутит и крутит эти кадры в моей голове. Кадры того, что могло быть. А может и было. \
				Я схожу с ума. Я хочу пить. В туалет. Много чего хочу. Да только судьба распорядилась иначе. \
				Надеюсь, что для теней двери помехой не являются."}

/obj/structure/fd/interactive/note/nightmare/fred
	name = "Помятая записка"
	attached_text = list(/datum/interactive_note/nightmare/fred,/datum/interactive_note/nightmare/fred_ending)

/datum/interactive_note/nightmare/tutorial1
	name = "Пособие по выживанию 1"
	note_info = {"Если вы надеялись получить здесь ответы на ваши вопросы - соболезную. Никто не знает что это за место. Но существует оно достаточно долго для того, чтобы \
				задеть несколько разных эпох и групп людей. Никто из них, включая меня и ребят что оказались здесь совсем недавно - не смогли обнаружить что-либо, что хотя бы \
				отдалённо, но можно назвать \"<span style="color: red;">выходом</span>\". Многие смирились с фактом его отсутствия. Вам придётся тоже. Если вы хотите прожить в этом кошмаре больше дня, \
				нужно приучить себя к нескольким вещам..."}

/datum/interactive_note/nightmare/tutorial2
	name = "Пособие по выживанию 2"
	note_info = {"Это место - всё время меняется. Даже псевдо-безопасные локации как та, в которой вы сейчас находитесь - со временем разлагаются, пропуская внутрь существ и феномены, сталкиваться с которыми вы НЕ хотите. \
				У этого места - есть свои стражи. <span style="color: red;">Тени</span> людей, сгинувших здесь. Они любят тишину. Тишину полюбите и вы. Пока вы не тревожите их - они не тревожат вас. Если тишина всё же была нарушена - яркая вспышка <span style="color: green;">фотоаппарата</span> \
				должна снова их успокоить. Если вы чувствуете, что ваша рука - больше не ваша - воспользуйтесь <span style="color: green;">консолью</span>. Она <span style="color: green;">сохраняет</span> ваш прежний образ на дискетах внутри."}

/datum/interactive_note/nightmare/tutorial2/reveal_note_to_player(mob/living/user)
	user.reading = TRUE

	user.overlay_fullscreen("background_note", note_overlay)
	user.overlay_fullscreen("smallshade", /obj/screen/fullscreen/shade)

	if(connected_note)
		if(!connected_note.ci)
			connected_note.ci = new /obj/screen/cancel_interaction()

		connected_note.ci.connected_mob = user
		user.client.screen += connected_note.ci
		animate(connected_note.ci, transform = matrix(-128, 0, MATRIX_TRANSLATE), alpha = 255, time = 3, easing = SINE_EASING|EASE_IN)

	spawn(0.5 SECONDS)

		var/message = "[note_info]"
		var/message_name = "[name]"

		var/obj/screen/player_message/note_text/maintext = new /obj/screen/player_message/note_text()
		var/obj/screen/novel_message/note_name/nameplate = new /obj/screen/novel_message/note_name()
		maintext.layer = 5.4
		nameplate.layer = 5.4

		nameplate.maptext_x = -75
		nameplate.maptext_y = -15
		maintext.maptext_x = 0
		maintext.maptext_y = -280

		user.client.screen += maintext
		user.client.screen += nameplate
		maintext.set_text(message, COLOR_WHITE)
		nameplate.set_text(message_name, COLOR_WHITE)

/obj/structure/fd/interactive/note/nightmare/tutorial
	name = "Свора бумаг"
	attached_text = list(/datum/interactive_note/nightmare/tutorial1,/datum/interactive_note/nightmare/tutorial2)

/datum/interactive_note/nightmare/hospital_gas
	name = "Утечка"
	note_info = {"<span style="color: red;">Газ</span> распространялся настолько быстро, что мы едва успели изолировать уже поражённые секции от остальных, ещё относительно пригодных для дыхания. \
				Подобное экстренное болтирование эффективно отрезало нас от большей части ресурсов, что располагались в подвальных помещениях, а также части служебных комнат госпиталя уже на верхних ярусах. \
				Нам приходилось экономить и прежде, но теперь, похоже, сам Бог велел урезать пайки вдвое. Во всяком случае до того момента, пока ситуация не стабилизируется. Казалось бы, только начали привыкать, да? \
				Никогда нельзя забывать о том, в каком коварном месте мы находимся."}

/datum/interactive_note/nightmare/hospital_gas/reveal_note_to_player(mob/living/user)
	user.reading = TRUE

	user.overlay_fullscreen("background_note", note_overlay)
	user.overlay_fullscreen("smallshade", /obj/screen/fullscreen/shade)

	if(connected_note)
		if(!connected_note.ci)
			connected_note.ci = new /obj/screen/cancel_interaction()

		connected_note.ci.connected_mob = user
		user.client.screen += connected_note.ci
		animate(connected_note.ci, transform = matrix(-128, 0, MATRIX_TRANSLATE), alpha = 255, time = 3, easing = SINE_EASING|EASE_IN)

	spawn(0.5 SECONDS)

		var/message = "[note_info]"
		var/message_name = "[name]"

		var/obj/screen/player_message/note_text/maintext = new /obj/screen/player_message/note_text()
		var/obj/screen/novel_message/note_name/nameplate = new /obj/screen/novel_message/note_name()
		maintext.layer = 5.4
		nameplate.layer = 5.4

		nameplate.maptext_x = -75
		nameplate.maptext_y = -15
		maintext.maptext_x = 0
		maintext.maptext_y = -300

		user.client.screen += maintext
		user.client.screen += nameplate
		maintext.set_text(message, COLOR_WHITE)
		nameplate.set_text(message_name, COLOR_WHITE)

/obj/structure/fd/interactive/note/nightmare/gas
	name = "Записка"
	attached_text = list(/datum/interactive_note/nightmare/hospital_gas)

/datum/interactive_note/nightmare/fred2
	name = "Предатель"
	note_info = {"Противогазы, которые дал нам <span style="color: yellow;">Фред</span> - оказались продырявленными. Жадный мудак хотел от нас избавиться. К его сожалению, я гораздо живучее остальных. \
				Как только выберусь отсюда... <br /> \
				<b><span style="color: red;">ОСТАТОК ТЕКСТА ПЕРЕКРЫВАЕТ ЗАСОХШАЯ КРОВЬ</span></b>."}

/obj/structure/fd/interactive/note/nightmare/fred2
	name = "Записка"
	attached_text = list(/datum/interactive_note/nightmare/fred2)

/datum/interactive_note/nightmare/morgue_clue
	name = "Меры предосторожности"
	note_info = {"В текущем положении дел, я решил переместить большую часть своего оборудования и оставшихся в моём распоряжении припасов в морг. \
				Учитывая загрязнение нижних уровней - мало кто рискнёт даже попробывать спуститься к нему. А если и решится - такого авантюриста будет ждать специальный механизм. \
				Простой ребус связанный с <span style="color: yellow;">ячейками морга</span>, решить который в состоянии любой человек, посмотревший на них больше пары секунд. Но зная людей <span style="color: yellow;">Фреда</span>? \
				Для них он окажется камнем преткновения."}

/obj/structure/fd/interactive/note/nightmare/morgue_clue
	name = "Помятая записка"
	attached_text = list(/datum/interactive_note/nightmare/morgue_clue)

/datum/interactive_note/nightmare/morgue_letter1
	name = "Запись 1"
	note_info = {"Снаружи теперь небезопасно. Одно дело - тени, яды, корни...совсем другое - люди с оружием, забывшие где они находятся. Стоило ожидать, что со временем, как только до нас \
				доберутся голод и паранойя - слабые духом пойдут путём насилия и мародёрства, обдирая тех, кто в свою очередь слаб телом. Не успели мы и глазом моргнуть, как Фред, человек которому многие были готовы доверить свои жизни - \
				обратился тираном, которого заботило лишь собственное благополучие. Аня, Кейн, Дэйв...попытались вразумить его, но без поддержки гарнизона, который очень удачно слёг в подвале неделю назад - им очень быстро указали на их место. \
				В могиле. Вероятнее всего, прямо сейчас я единственный разумный человек оставшийся в этом кошмаре."}

/datum/interactive_note/nightmare/morgue_letter1/reveal_note_to_player(mob/living/user)
	user.reading = TRUE

	user.overlay_fullscreen("background_note", note_overlay)
	user.overlay_fullscreen("smallshade", /obj/screen/fullscreen/shade)

	if(connected_note)
		if(!connected_note.ci)
			connected_note.ci = new /obj/screen/cancel_interaction()

		connected_note.ci.connected_mob = user
		user.client.screen += connected_note.ci
		animate(connected_note.ci, transform = matrix(-128, 0, MATRIX_TRANSLATE), alpha = 255, time = 3, easing = SINE_EASING|EASE_IN)

	spawn(0.5 SECONDS)

		var/message = "[note_info]"
		var/message_name = "[name]"

		var/obj/screen/player_message/note_text/maintext = new /obj/screen/player_message/note_text()
		var/obj/screen/novel_message/note_name/nameplate = new /obj/screen/novel_message/note_name()
		maintext.layer = 5.4
		nameplate.layer = 5.4

		nameplate.maptext_x = -75
		nameplate.maptext_y = -15
		maintext.maptext_x = 0
		maintext.maptext_y = -300

		user.client.screen += maintext
		user.client.screen += nameplate
		maintext.set_text(message, COLOR_WHITE)
		nameplate.set_text(message_name, COLOR_WHITE)

/datum/interactive_note/nightmare/morgue_letter2_1
	name = "Запись 2-1"
	note_info = {"Неделя минула практически незаметно. Я смог собрать некоторую информацию извне, пока люди Фреда занимались разграблением очередной группы новоприбывших. В этот раз - это были НЕ люди. \
				Ну, во всяком случае, далеко не все из них являлись таковыми. Мне удалось поговорить, и даже тщательно осмотреть существо, что выглядело как прямоходящий, биологически-точный динозавр с внешним оперением, но значительно...более компактной и хрупкой комплекцией тела. \
				К моему удивлению, она, как позднее представилась - Аррари - вполне складно говорила на неком диалекте Восточно-Европейских языков, чего было достаточно для того чтобы мы могли понять друг друга. \
				Взамен на то, что я смогу вывести её из госпиталя живой - она рассказала мне о месте, из которого она и её друзья прибыли. Судя по всему, их...КОСМИЧЕСКИЙ корабль оказался в эпицентре некого синего шторма. \
				Реактор, который они использовали для перемещения на большие расстояния в кратчайшие сроки, резко срезонировал с частотами этого явления, и выбросил их в это место. Как называют его там - перепутье."}

/datum/interactive_note/nightmare/morgue_letter2_1/reveal_note_to_player(mob/living/user)
	user.reading = TRUE

	user.overlay_fullscreen("background_note", note_overlay)
	user.overlay_fullscreen("smallshade", /obj/screen/fullscreen/shade)

	if(connected_note)
		if(!connected_note.ci)
			connected_note.ci = new /obj/screen/cancel_interaction()

		connected_note.ci.connected_mob = user
		user.client.screen += connected_note.ci
		animate(connected_note.ci, transform = matrix(-128, 0, MATRIX_TRANSLATE), alpha = 255, time = 3, easing = SINE_EASING|EASE_IN)

	spawn(0.5 SECONDS)

		var/message = "[note_info]"
		var/message_name = "[name]"

		var/obj/screen/player_message/note_text/maintext = new /obj/screen/player_message/note_text()
		var/obj/screen/novel_message/note_name/nameplate = new /obj/screen/novel_message/note_name()
		maintext.layer = 5.4
		nameplate.layer = 5.4

		nameplate.maptext_x = -75
		nameplate.maptext_y = -15
		maintext.maptext_x = 0
		maintext.maptext_y = -380

		user.client.screen += maintext
		user.client.screen += nameplate
		maintext.set_text(message, COLOR_WHITE)
		nameplate.set_text(message_name, COLOR_WHITE)

/datum/interactive_note/nightmare/morgue_letter2_2
	name = "Запись 2-2"
	note_info = {"Это подтверждает мою теорию. Прямо сейчас, мы находимся ВНЕ времени. Это место не существует в каком-то конкретном моменте, оно существует ВСЕГДА. И если в том отрезке, откуда прибыла Аррари - ему дали название - значит должны были найтись и люди, что смогли выбраться \
				из него и задокументировать это. Будь то до, или после нас. Пускай моя маленькая подруга и сказала, что не знает больше, даже той информации которая есть у меня теперь достаточно для того чтобы сказать - выход действительно есть. \
				Нужно лишь найти к нему ключ. К сожалению, я не смогу сделать это сам. Пока что. Они обесточили лифт после недавней попытки побега одного из заключённых. Единственный альтернативный путь - вентиляции и технически тоннели. Места слишком опасные и узкие для человека. \
				Но этот мелкий зверёк, пускай и знает меня всего несколько часов - пообещал вернуться. За мной и за другими. Не знаю, почему, но я верю ей. До тех пор, я буду продолжать писать. Изучать феномен и его законы. \
				Возможно, после меня это место найдёт другая, такая же заблудшая душа. И если повезёт - мои записи спасут ей жизнь."}

/datum/interactive_note/nightmare/morgue_letter2_2/reveal_note_to_player(mob/living/user)
	user.reading = TRUE

	user.overlay_fullscreen("background_note", note_overlay)
	user.overlay_fullscreen("smallshade", /obj/screen/fullscreen/shade)

	if(connected_note)
		if(!connected_note.ci)
			connected_note.ci = new /obj/screen/cancel_interaction()

		connected_note.ci.connected_mob = user
		user.client.screen += connected_note.ci
		animate(connected_note.ci, transform = matrix(-128, 0, MATRIX_TRANSLATE), alpha = 255, time = 3, easing = SINE_EASING|EASE_IN)

	spawn(0.5 SECONDS)

		var/message = "[note_info]"
		var/message_name = "[name]"

		var/obj/screen/player_message/note_text/maintext = new /obj/screen/player_message/note_text()
		var/obj/screen/novel_message/note_name/nameplate = new /obj/screen/novel_message/note_name()
		maintext.layer = 5.4
		nameplate.layer = 5.4

		nameplate.maptext_x = -75
		nameplate.maptext_y = -15
		maintext.maptext_x = 0
		maintext.maptext_y = -380

		user.client.screen += maintext
		user.client.screen += nameplate
		maintext.set_text(message, COLOR_WHITE)
		nameplate.set_text(message_name, COLOR_WHITE)

/obj/structure/fd/interactive/note/nightmare/morgue_book
	name = "Дневник"
	icon_state = "mrakiizar_book_closed"
	attached_text = list(/datum/interactive_note/nightmare/morgue_letter1,/datum/interactive_note/nightmare/morgue_letter2_1,/datum/interactive_note/nightmare/morgue_letter2_2)

/datum/interactive_note/nightmare/gen
	name = "Генератор"
	note_info = {"В случае необходимости произвести аварийный запуск генератора, следуйте инструкции ниже...<br /> \
				<br /> \
				Тумблер <b>#1</b>: должен быть <b><span style="color: green;">ВКЛЮЧЁН</span></b><br /> \
				Тумблер <b>#2</b>: должен быть <b><span style="color: red;">ВЫКЛЮЧЕН</span></b><br /> \
				Тумблер <b>#3</b>: должен быть <b><span style="color: red;">ВЫКЛЮЧЕН</span></b><br /> \
				Рычажок: должен быть <b><span style="color: green;">ПОДНЯТ ВВЕРХ</span></b>"}

/obj/structure/fd/interactive/note/nightmare/gen
	name = "Пособие электрика"
	icon_state = "mrakiizar_book_closed"
	attached_text = list(/datum/interactive_note/nightmare/gen)

/datum/interactive_note/nightmare/sabotage
	name = "Выкусите"
	note_info = {"Ключ утоплен, энергосеть перегружена. Никто из этих уродов не сможет пройти дальше. Я в этом убедился. Если уж мне суждено сгнить в этом кошмаре - \
				остальные уж тем более не заслужили возможности сбежать. Совсем скоро, тени окажутся внутри. К сожалению, застать момент того как их рвут на части я уже не смогу. \
				Ну и ладно. Мне будет достаточно просто знать, что Аня и другие теперь отомщены.<br /> \
				<br /> \
				<b>Гори в Аду, Фред</b>."}

/obj/structure/fd/interactive/note/nightmare/sabotage
	name = "Записка"
	attached_text = list(/datum/interactive_note/nightmare/sabotage)

/datum/interactive_note/nightmare/bluespace
	name = "Вскрытие"
	note_info = {"Как я и предполагал, эти сорняки, или во всяком случае вшитые в них осколки - являются прямым источником загрязнения. \
				Они вызывают значительные колебания в пространстве вокруг себя, при этом не имея никаких споровидных отложений, через которые данные растения могли бы распространять свою пыльцу. \
				Они одинаково воздействуют как на мёртвую, так и на живую материю, однако общая симптоматика кажется психосоматической. Объекту необязательно дышать или соприкасаться с источником. \
				Достаточно просто находиться поблизости."}

/datum/interactive_note/nightmare/bluespace2
	name = "Контр-меры"
	note_info = {"Исходя из прошлого рассуждения, я начал искать пути решения проблемы. Более чем очевидно то, что даже это место, несмотря на его безумие - работает по каким-то вполне чётким правилам. \
				Неоспорим факт того, что объект исследований не имеет пыльцы или спор. Следственно, логически, средства защиты против него должны быть полностью бесполезны. \
				Тем не менее, химикаты - это далеко не последняя вещь, способная заставить человека задыхаться. В качестве эксперимента - я извлёк из тела испытуемого небольшой осколок для индивидуального изучения. \
				Каково же было моё удивление, когда оказалось что отдельно от \"носителя\" в лице корней или тела - он абсолютно бесполезен."}

/datum/interactive_note/nightmare/bluespace2/reveal_note_to_player(mob/living/user)
	user.reading = TRUE

	user.overlay_fullscreen("background_note", note_overlay)
	user.overlay_fullscreen("smallshade", /obj/screen/fullscreen/shade)

	if(connected_note)
		if(!connected_note.ci)
			connected_note.ci = new /obj/screen/cancel_interaction()

		connected_note.ci.connected_mob = user
		user.client.screen += connected_note.ci
		animate(connected_note.ci, transform = matrix(-128, 0, MATRIX_TRANSLATE), alpha = 255, time = 3, easing = SINE_EASING|EASE_IN)

	spawn(0.5 SECONDS)

		var/message = "[note_info]"
		var/message_name = "[name]"

		var/obj/screen/player_message/note_text/maintext = new /obj/screen/player_message/note_text()
		var/obj/screen/novel_message/note_name/nameplate = new /obj/screen/novel_message/note_name()
		maintext.layer = 5.4
		nameplate.layer = 5.4

		nameplate.maptext_x = -75
		nameplate.maptext_y = -15
		maintext.maptext_x = 0
		maintext.maptext_y = -300

		user.client.screen += maintext
		user.client.screen += nameplate
		maintext.set_text(message, COLOR_WHITE)
		nameplate.set_text(message_name, COLOR_WHITE)

/datum/interactive_note/nightmare/bluespace3
	name = "Эврика"
	note_info = {"Взятый мной образец претерпел некоторые значительные метаморфозы. \
				Рано говорить о конкретике, но инкубационный период внутри органического носителя, похоже, привил осколку некоторые нейтрализующие качества. \
				Пускай в крупных дозировках он по-прежнему представляет некоторую опасность - в малых количествах он способен практически полностью свести воздействие сорняков на нет. \
				Как и свой родитель - он излучает слабые колебания, достаточные чтобы покрыть совсем небольшую область, однако здесь, я, даже могу назвать природу этих колебаний. Это батарейка органического происхожения."}

/obj/structure/fd/interactive/note/nightmare/bluespace
	name = "Отчёт"
	icon_state = "mrakiizar_book_closed"
	attached_text = list(/datum/interactive_note/nightmare/bluespace,/datum/interactive_note/nightmare/bluespace2)

/obj/structure/fd/interactive/note/nightmare/bluespace2
	name = "Отчёт"
	attached_text = list(/datum/interactive_note/nightmare/bluespace3)

/datum/interactive_note/nightmare/tutorial_ooc
	name = "Базовое управление"

/datum/interactive_note/nightmare/tutorial_ooc/reveal_note_to_player(mob/living/user)
	note_info = {"<br /> \
				Взаимодействуйте с объектами нажатием <b><span style="color: yellow;">[user.retrieve_bind("start_interaction")]</span></b><br /> \
				Откройте архив собранных записей нажатием <b><span style="color: yellow;">[user.retrieve_bind("open_archive")]</span></b><br /> \
				Узнайте своё здоровье зажав <b><span style="color: yellow;">[user.retrieve_bind("healthshow")]</span></b><br /> \
				Управляйте режимом автодоводки в ближнем бою при помощи кнопки на экране или нажатия <b><span style="color: yellow;">[user.retrieve_bind("melee_assist")]</span></b><br /> \
				Прыгайте нажатием <b><span style="color: yellow;">[user.retrieve_bind("dash")]</span></b>"}

	. = ..()

/datum/interactive_note/nightmare/tutorial_ooc2
	name = "Продвинутое управление"
	note_info = {"<br /> \
				Чаще всего, объекты с которыми можно взаимодействовать - выделяются <b><span style="color: yellow;">лупой</span></b><br /> \
				В некоторых случаях, внутри интеракции может быть спрятан <b><span style="color: yellow;">секрет</span></b>. Чтобы его обнаружить - попробуйте поводить мышкой по экрану, пока не увидите новый значок.<br /> \
				Вы можете узнать состояние другого <b><span style="color: yellow;">живого</span></b> существа осмотрев его. Там вам напишет не только его примерное здоровье, но и активные <b><span style="color: yellow;">статусы</span></b>. Ровно так же вы можете осмотреть и себя.<br /> \
				Включённый режим автодоводки позволяет вашему персонажу атаковать <b><span style="color: yellow;">живых</span></b> существ без необходимости <b><span style="color: yellow;">чёткого нажатия</span></b> по ним.<br /> \
				Вы можете прыгать дальше одного тайла, если будете <b><span style="color: yellow;">зажимать</span></b> кнопку прыжка некоторое время.<br /> \
				Вы автоматически присасываетесь к объектам, за которые можно <b><span style="color: yellow;">зацепиться</span></b>, если они находятся рядом. Такими объектами могут быть любые казалось бы неочевидные столбы или трубы на маршруте вашего прыжка. Иногда - даже стены."}

/datum/interactive_note/nightmare/tutorial_ooc2/reveal_note_to_player(mob/living/user)
	user.reading = TRUE

	user.overlay_fullscreen("background_note", note_overlay)
	user.overlay_fullscreen("smallshade", /obj/screen/fullscreen/shade)

	if(connected_note)
		if(!connected_note.ci)
			connected_note.ci = new /obj/screen/cancel_interaction()

		connected_note.ci.connected_mob = user
		user.client.screen += connected_note.ci
		animate(connected_note.ci, transform = matrix(-128, 0, MATRIX_TRANSLATE), alpha = 255, time = 3, easing = SINE_EASING|EASE_IN)

	spawn(0.5 SECONDS)

		var/message = "[note_info]"
		var/message_name = "[name]"

		var/obj/screen/player_message/note_text/maintext = new /obj/screen/player_message/note_text()
		var/obj/screen/novel_message/note_name/nameplate = new /obj/screen/novel_message/note_name()
		maintext.layer = 5.4
		nameplate.layer = 5.4

		nameplate.maptext_x = -75
		nameplate.maptext_y = -15
		maintext.maptext_x = 0
		maintext.maptext_y = -360

		user.client.screen += maintext
		user.client.screen += nameplate
		maintext.set_text(message, COLOR_WHITE)
		nameplate.set_text(message_name, COLOR_WHITE)

/datum/interactive_note/nightmare/tutorial_ooc3
	name = "Подсказка 3 (ООС)"
	note_info = {"<b>БОРЬБА С ТЕНЯМИ</b><br /> \
				<br /> \
				Режим передвижения <b><span style="color: yellow;">\"Creep\"</span></b> значительно уменьшает ваши шансы быть замеченными.<br /> \
				Вы можете активировать вспышку быстро, нажатием <b><span style="color: yellow;">...</span></b>."}

/datum/interactive_note/nightmare/tutorial_ooc3/reveal_note_to_player(mob/living/user)
	note_info = {"<b>БОРЬБА С ТЕНЯМИ</b><br /> \
				<br /> \
				Режим передвижения <b><span style="color: yellow;">\"Creep\"</span></b> значительно уменьшает ваши шансы быть замеченными.<br /> \
				Вы можете активировать вспышку быстро, нажатием <b><span style="color: yellow;">[user.retrieve_bind("activate_inhand")]</span></b>."}

	. = ..()

/datum/interactive_note/nightmare/tutorial_ooc4
	name = "Защита дыхания"
	note_info = {"<br /> \
				Подобные игровые области предполагают наличие в вашем распоряжении любого <b><span style="color: yellow;">противогаза</span></b> заряженного специализированными <b><span style="color: yellow;">фильтрами</span></b>.<br /> \
				Без них, персонаж продержится от силы <b><span style="color: yellow;">10-15 секунд</span></b>, прежде чем начнёт получать <b><span style="color: red;">урон</span></b>.<br /> \
				Место начала и конца заражённой зоны помогут определить всплывающие сообщения или элементы окружения(к примеру - зелёный газ, идущий из труб)."}

/obj/effect/reality_tear
	name = "trap"
	desc = "trap"
	icon = 'mods/_fd/_maps/collective_nightmare/icons/effects.dmi'
	icon_state = "void_conduit"
	mouse_opacity = FALSE
	anchored = TRUE

/obj/effect/reality_tear/Initialize()
	. = ..()
	SetTransform(2)

/area/nightmare/
	adventure_mode = TRUE

/area/nightmare/streets
	name = "City Streets - Real World"
	requires_power = 0

/area/nightmare/bar_real
	name = "Bar - Real World"
	requires_power = 1

/area/nightmare/unreal
	name = "Dark Abyss - Nightmare"
	requires_power = 0

/area/nightmare/unreal/bar_nightmare
	name = "Bar - Nightmare"
	requires_power = 1

/area/nightmare/unreal/bar_nightmare/storage_room
	name = "Bar (Storage) - Nightmare"

/area/nightmare/unreal/hospital
	name = "Hospital - Nightmare"
	requires_power = 0

/area/nightmare/unreal/hospital/left_wing
	name = "Hospital (Left Wing) - Nightmare"
	requires_power = 1

/area/nightmare/unreal/hospital/left_wing/infected
	requires_power = 0
	unbreathable = TRUE

/area/nightmare/unreal/hospital/right_wing
	name = "Hospital (Right Wing) - Nightmare"
	requires_power = 1

/area/nightmare/unreal/hospital/right_wing/infected
	requires_power = 0
	unbreathable = TRUE

/area/nightmare/unreal/hospital/right_wing/janitor
	name = "Hospital (Right Wing, Janitor Storage) - Nightmare"
	requires_power = 0

/area/nightmare/unreal/hospital/right_wing/special_fusebox
	name = "Hospital (For Fusebox) - Nightmare"

/area/nightmare/unreal/hospital/left_wing/ward1
	name = "Hospital (Left Wing, Ward 1) - Nightmare"
	requires_power = 0

/area/nightmare/unreal/hospital/lower_level
	name = "Hospital (Tunnels) - Nightmare"
	requires_power = 1
	unbreathable = TRUE

/area/nightmare/unreal/hospital/lower_level/autopsy_room
	name = "Hospital (Autopsy Room) - Nightmare"

/obj/structure/fd/interactive/vent_exit
	name = "vent"
	desc = "ventilation."

	mouse_opacity = FALSE
	anchored = TRUE
	density = TRUE

	icon = 'mods/_fd/fd_assets/icons/structures/constructed/construct_window.dmi'
	icon_state = "window_grate"

/obj/structure/fd/interactive/vent_exit/interact_with(mob/living/user)
	if(user.mob_size != MOB_SMALL)
		desc_special = {"В неё точно смог бы залезть кто-нибудь <span style="color: yellow;">поменьше</span>."}
		desc_special_show = TRUE
		. = ..()
		return TRUE

	user.forceMove(get_turf(src))
	return TRUE

/obj/structure/fd/interactive/barricade
	name = "barricade"
	desc = "Wooden barricade."

	anchored = TRUE
	density = TRUE

	icon = 'mods/_fd/_maps/collective_nightmare/icons/trench_bridge.dmi'
	icon_state = "trench_bridge1"

/obj/structure/fd/interactive/barricade/interact_with(mob/living/user)

	var/obj/item/I = user.get_active_hand()
	if(!I)
		desc_special = {"Крепкая деревянная барикада. Я бы мог сломать её, будь у меня <span style="color: yellow;">лом</span>."}
		desc_special_show = TRUE
		. = ..()
		return TRUE
	if(!istype(I, /obj/item/crowbar))
		desc_special = {"Этим я её не сломаю. Мне нужен <span style="color: yellow;">лом</span>, или что-то на подобии."}
		desc_special_show = TRUE
		. = ..()
		return TRUE
	if(istype(I, /obj/item/crowbar))
		interactive = FALSE
		user.hide_hint(src)
		playsound(user, 'mods/_fd/_maps/collective_nightmare/sounds/woodhit.ogg', 100)
		throw_planks()
		if(do_after(user, 3 SECONDS, src, DO_PUBLIC_UNIQUE))
			qdel(src)
			return TRUE

/obj/structure/fd/interactive/barricade/proc/throw_planks()
	set waitfor = FALSE
	var/turf/T = get_turf(src)

	for(var/i=1; i <= 3; i++)
		var/obj/structure/fd/samosbor/table_decor12/planks = new /obj/structure/fd/samosbor/table_decor12(get_turf(src))
		planks.icon_state = "0,23"

		sleep(1 SECONDS)
		planks.throw_at(get_step(T, GLOB.alldirs),1,4)

/obj/screen/interactive_door
	name = "Дверь"
	desc = "Просто дверь..."
	icon = 'mods/_fd/fd_assets/icons/structures/doors/door.dmi'
	icon_state = "fancy"

	mouse_opacity = FALSE

	plane = HUD_PLANE
	layer = 5.3

	screen_loc = "CENTER-0.2,CENTER"

/obj/screen/interactive_door/Initialize()
	. = ..()
	SetTransform(6)

/obj/structure/fd/interactive/door
	name = "door"
	desc = "Simple door."

	anchored = TRUE
	density = TRUE
	opacity = TRUE

	icon = 'mods/_fd/fd_assets/icons/structures/doors/door.dmi'
	icon_state = "fancy"

	var/opened = FALSE

	var/key_needed = FALSE
	var/locked = FALSE
	var/obj/item/door_key = null
	var/doorsound = 'mods/_fd/_maps/collective_nightmare/sounds/wooden_door_open.wav'

	var/needs_power = FALSE
	var/powered = FALSE
	var/area/current_location

	var/obj/screen/interactive_door/door

/obj/structure/fd/interactive/door/Initialize()
	. = ..()

	door = new /obj/screen/interactive_door()
	door.icon = icon
	door.icon_state = icon_state

	if(needs_power)
		current_location = get_area(src)
		START_PROCESSING(SSobj,src)

/obj/structure/fd/interactive/door/Process()
	if(current_location.requires_power && powered)
		powered = FALSE

	if(!current_location.requires_power && !powered)
		powered = TRUE

/obj/structure/fd/interactive/door/interact_with(mob/living/user)
	if(!opened)
		if(needs_power)
			if(powered)
				open_door(user)
				return TRUE
			if(!powered)
				desc_special = {"К двери подведено множество проводов, но не похоже чтобы хотя бы по одному из них шло напряжение. Возможно, я смогу найти <span style="color: yellow;">источник питания</span> поблизости?"}
				desc_special_show = TRUE
				. = ..()
				return TRUE

		if(locked)
			if(key_needed)
				var/obj/item/I = user.get_active_hand()
				if(!I)
					desc_special = {"Дверь заперта. Я бы смог открыть её при помощи <span style="color: yellow;">[door_key.name]</span>."}
					desc_special_show = TRUE
					. = ..()
					return TRUE
				if(!istype(I, door_key))
					desc_special = {"Дверь заперта. Я бы смог открыть её, будь у меня <span style="color: yellow;">[door_key.name]</span>."}
					desc_special_show = TRUE
					. = ..()
					return TRUE
				if(istype(I, door_key))
					playsound(user, 'sound/items/metal_clicking_13.ogg', 50)
					locked = FALSE
					desc_special = {"<span style="color: green;">Дверь теперь открыта</span>."}
					desc_special_show = TRUE
					. = ..()
					return TRUE

			else
				desc_special = {"Дверь заперта. На вряд ли у меня получится её открыть."}
				desc_special_show = TRUE
				. = ..()
				return TRUE

		open_door(user)
		return TRUE

	if(opened)
		close_door(user)
		return TRUE

/obj/structure/fd/interactive/door/proc/open_door(mob/living/user)
	for(var/obj/screen/T in user.client.screen)
		if(istype(T, /obj/screen/cancel_interaction))
			user.client.screen -= T
	user.anchored = TRUE

	user.reading = TRUE
	user.currently_interacting = src

	user.overlay_fullscreen("smallshade", /obj/screen/fullscreen/shade)
	user.client.screen += door

	sleep(2 SECONDS)
	door.icon_state = "[initial(icon_state)]opening"
	playsound(user, doorsound, 100)
	sleep(1 SECONDS)
	density = FALSE
	opacity = FALSE

	opened = TRUE
	icon_state = "[initial(icon_state)]open"
	door.icon_state = "[initial(icon_state)]open"

	sleep(1 SECONDS)
	user.anchored = FALSE

	user.reading = FALSE
	user.currently_interacting = null

	user.clear_fullscreen("smallshade")
	for(var/obj/screen/T in user.client.screen)
		if(istype(T, /obj/screen/interactive_door))
			user.client.screen -= T

/obj/structure/fd/interactive/door/proc/close_door(mob/living/user)
	for(var/obj/screen/T in user.client.screen)
		if(istype(T, /obj/screen/cancel_interaction))
			user.client.screen -= T
	user.anchored = TRUE

	user.reading = TRUE
	user.currently_interacting = src

	user.overlay_fullscreen("smallshade", /obj/screen/fullscreen/shade)
	user.client.screen += door

	sleep(2 SECONDS)
	density = TRUE
	opacity = initial(opacity)

	playsound(user, 'mods/_fd/_maps/collective_nightmare/sounds/door_close.ogg', 100)

	opened = FALSE
	icon_state = "[initial(icon_state)]"
	door.icon_state = "[initial(icon_state)]"

	sleep(1 SECONDS)
	user.anchored = FALSE

	user.reading = FALSE
	user.currently_interacting = null

	user.clear_fullscreen("smallshade")
	for(var/obj/screen/T in user.client.screen)
		if(istype(T, /obj/screen/interactive_door))
			user.client.screen -= T

/obj/item/fd/door_key
	name = "key"
	desc = "This one has particular shape!"

	icon = 'mods/_fd/_maps/collective_nightmare/icons/item_access.dmi'
	icon_state = "key_alt"

	w_class = ITEM_SIZE_TINY

/obj/item/fd/door_key/test
	name = "квадратный ключ"

/obj/item/fd/door_key/kitchen
	name = "ключ от морозилки"
	icon_state = "key"

/obj/item/fd/door_key/outer
	name = "ключ от заведения"

/obj/item/fd/door_key/firstzerofirst
	name = "ключ от комнаты %^$##^#*!#"
	icon_state = "key_yellow"

/obj/item/fd/door_key/elevator
	name = "карта доступа к лифту"
	icon_state = "1,1"

/obj/structure/fd/interactive/door/test_locked

	key_needed = TRUE
	locked = TRUE
	door_key = /obj/item/fd/door_key/test

/obj/structure/fd/interactive/door/exterior
	icon_state = "exterior"
	doorsound = 'mods/_fd/_maps/collective_nightmare/sounds/metal_door_open.wav'

/obj/structure/fd/interactive/door/grate
	opacity = FALSE
	icon_state = "grate"

/obj/structure/fd/interactive/door/wood
	icon_state = "wood"
	doorsound = 'mods/_fd/_maps/collective_nightmare/sounds/metal_door_open.wav'

/obj/structure/fd/interactive/door/wood_alt
	icon_state = "wood_alt"

/obj/structure/fd/interactive/door/wood_old
	icon_state = "old"

/obj/structure/fd/interactive/door/wood_old2
	icon_state = "bold"

/obj/structure/fd/interactive/door/agrate
	opacity = FALSE
	icon_state = "agrate"
	doorsound = 'mods/_fd/_maps/collective_nightmare/sounds/metal_door_open.wav'

/obj/structure/fd/interactive/door/fancy
	opacity = FALSE
	icon_state = "fancy_alt"

/obj/structure/fd/interactive/door/metal
	icon_state = "metal"
	doorsound = 'mods/_fd/_maps/collective_nightmare/sounds/metal_door_open.wav'

/obj/structure/fd/interactive/door/metal_glass
	opacity = FALSE
	icon_state = "metal_glass"
	doorsound = 'mods/_fd/_maps/collective_nightmare/sounds/metal_door_open.wav'

/obj/structure/fd/interactive/door/metal_train
	opacity = FALSE
	icon_state = "metal_train"
	doorsound = 'mods/_fd/_maps/collective_nightmare/sounds/metal_door_open.wav'

/obj/structure/fd/interactive/door/nightmare/kitchen
	icon_state = "metal_glass"
	opacity = FALSE

	key_needed = TRUE
	locked = TRUE
	door_key = /obj/item/fd/door_key/kitchen
	doorsound = 'mods/_fd/_maps/collective_nightmare/sounds/metal_door_open.wav'

/obj/structure/fd/interactive/door/nightmare/outer
	icon_state = "fancy_alt"
	opacity = FALSE

	key_needed = TRUE
	locked = TRUE
	door_key = /obj/item/fd/door_key/outer

/obj/structure/fd/interactive/door/nightmare/firstzerofirst
	icon_state = "wood_alt"

	key_needed = TRUE
	locked = TRUE
	door_key = /obj/item/fd/door_key/firstzerofirst

/obj/structure/fd/interactive/door/nightmare/elevator
	icon_state = "grate"
	opacity = FALSE

	key_needed = TRUE
	locked = TRUE
	door_key = /obj/item/fd/door_key/elevator
	doorsound = 'mods/_fd/_maps/collective_nightmare/sounds/metal_door_open.wav'

/obj/structure/fd/interactive/morgue_body
	name = "roller"
	icon = 'mods/_fd/_maps/collective_nightmare/icons/rollerbed.dmi'
	icon_state = "bigrollerbodyalt_down"

	anchored = FALSE
	density = TRUE
	var/corpse_name = "Bob"

	desc_special_show = TRUE
	desc_special = "На бирке написано имя:"

/obj/structure/fd/interactive/morgue_body/Initialize()
	. = ..()
	name = "roller ([corpse_name])"
	desc_special = "На бирке написано имя: [corpse_name]"

/obj/structure/fd/coffin
	name = "morgue cell"
	icon = 'icons/obj/structures/morgue_tray.dmi'
	icon_state = "morgue2"

	layer = ABOVE_HUMAN_LAYER
	var/activated = FALSE
	var/designated_corpse_name = "Bob"

	anchored = TRUE
	density = FALSE

/obj/structure/fd/coffin/Initialize()
	. = ..()
	name = "morgue cell ([designated_corpse_name])"

	for(var/obj/structure/fd/interactive/morgue_body/M in get_turf(src))
		if(M.corpse_name == designated_corpse_name)
			activated = TRUE
			icon_state = "morgue1"

/obj/structure/fd/coffin/Crossed(atom/movable/AM as mob|obj)

	. = ..()
	if(istype(AM,/mob/living))
		AM.forceMove(get_turf(get_step(AM.loc, reverse_direction(AM.dir))))

	if(istype(AM,/obj/structure/fd/interactive/morgue_body))
		var/obj/structure/fd/interactive/morgue_body/M = AM

		if(M.corpse_name == designated_corpse_name)
			activated = TRUE
			icon_state = "morgue1"

/obj/structure/fd/coffin/Uncrossed(atom/movable/AM as mob|obj)
	. = ..()

	if(istype(AM,/obj/structure/fd/interactive/morgue_body))
		var/obj/structure/fd/interactive/morgue_body/M = AM

		if(M.corpse_name == designated_corpse_name && activated)
			activated = FALSE
			icon_state = "morgue2"

/obj/structure/fd/interactive/door/nightmare/morgue_puzzle
	opacity = FALSE
	icon_state = "metal_train"
	doorsound = 'mods/_fd/_maps/collective_nightmare/sounds/metal_door_open.wav'

	locked = TRUE
	var/list/obj/structure/fd/coffin/coffins = list()

/obj/structure/fd/interactive/door/nightmare/morgue_puzzle/Initialize()
	. = ..()

	for(var/obj/structure/fd/coffin/C in orange(20,src))
		coffins += C

	START_PROCESSING(SSobj,src)

/obj/structure/fd/interactive/door/nightmare/morgue_puzzle/Process()

	if(locked)
		var/list/correct_guesses = list()

		for(var/obj/structure/fd/coffin/C in coffins)
			if(C.activated)
				correct_guesses += C

		if(length(correct_guesses) == length(coffins))
			locked = FALSE
			playsound(src, 'sound/items/metal_clicking_13.ogg', 100)

	if(!locked)
		var/list/correct_guesses = list()

		for(var/obj/structure/fd/coffin/C in coffins)
			if(C.activated)
				correct_guesses += C

		if(length(correct_guesses) != length(coffins))
			locked = TRUE

/obj/structure/fd/interactive/door/nightmare/morgue_puzzle/another
	opacity = TRUE
	icon_state = "metal"
	doorsound = 'mods/_fd/_maps/collective_nightmare/sounds/metal_door_open.wav'

/obj/structure/fd/interactive/basic_power/cool_gen/filtration/turn_on()
	area.unbreathable = FALSE
	. = ..()

/obj/structure/fd/interactive/basic_power/cool_gen/filtration/turn_off()
	area.unbreathable = TRUE
	. = ..()

/obj/effect/soulblocker
	name = "blocker"
	desc = "blocker"
	icon = 'mods/_fd/fd_utilities/icons/newsource.dmi'
	icon_state = "noteam"
	mouse_opacity = FALSE
	anchored = TRUE
	density = TRUE

	invisibility = 50

/obj/effect/soulblocker/Crossed(atom/movable/AM as mob|obj)
	. = ..()

	if(istype(AM,/mob/living/simple_animal/connected_player_soul))
		AM.forceMove(get_turf(get_step(AM.loc, reverse_direction(AM.dir))))

/obj/effect/fakerain
	name = "rain"
	desc = "rain"
	icon = 'mods/_fd/_maps/small_exoplanet_1/icons/weather.dmi'
	icon_state = "rain"
	mouse_opacity = FALSE
	anchored = TRUE
	layer = 4.12

/obj/effect/fakerain_sound
	name = "there is nothing"
	icon = 'mods/_fd/fd_utilities/icons/newsource.dmi'
	icon_state = "env_soundscape"
	invisibility = 50
	anchored = TRUE
	mouse_opacity = FALSE
	var/datum/sound_token/sound_token
	var/sound_id

	var/emergency_shutoff = FALSE // ЕСЛИ ВДРУГ БУДЕТ ЛАГАТЬ - МОЖНО РАЗОМ ВЫРУБИТЬ ЗВУКИ ДОЖДЯ У ВСЕХ ЭФФЕКТОВ НА КАРТЕ

/obj/effect/fakerain_sound/Initialize()
	. = ..()
	START_PROCESSING(SSobj,src)

/obj/effect/fakerain_sound/Process()
	update_sound()

/obj/effect/fakerain_sound/proc/update_sound()
	if(!sound_id)
		sound_id = "[type]_[sequential_id(/obj/effect/fakerain)]"
	if(!emergency_shutoff)
		if(!sound_token)
			sound_token = GLOB.sound_player.PlayLoopingSound(src, sound_id, 'mods/_fd/_maps/collective_nightmare/sounds/rain.ogg', volume = 50)
		sound_token.SetVolume(50)
	else if(sound_token)
		QDEL_NULL(sound_token)
