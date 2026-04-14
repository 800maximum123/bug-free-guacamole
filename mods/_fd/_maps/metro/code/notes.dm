/obj/structure/fd/interactive/note/gasmask
	name = "Новые средства защиты"
	attached_text = list(/datum/interactive_note/gasmask, /datum/interactive_note/gasmask1)

/datum/interactive_note/gasmask
	name = "Приказ 41"
	note_info = {"Уважаемые рабочие бригады №31! Связи с количеством жалоб связанных с ядовитыми парами <span style="color: green;">Htz-23</span> были введены новые правила: <br>
	1. Теперь минимальное число людей в обходе составляет 6 человек по 2 парой <br>
	2. Инженер Мобиус смог разработать средства противодействия ядовитым парам, партия <span style="color: yellow;">фильтров</span> прибудет со следующей недели. Более подробное описание и способ применения фильторов прилагается на обратной стороне приказа."}

/datum/interactive_note/gasmask1
	name = "Фильтры"
	note_info = {"<span style="color: yellow;">НАПОЛНИТЕЛЬ </span> - испытательный вариант фильтров против ядовитых паров Htz-23. Один фильтр способен эксплуатироваться в течении <span style="color: green;">~3 минут.</span> <br>
	Время может варьироваться от степени концетрации ядовитых паров. Убедительная просьба отписать своё мнение Мэдсену для последующег- "}


/obj/structure/fd/interactive/note/brigade
	name = "Пометки"
	attached_text = list(/datum/interactive_note/brigade)

/datum/interactive_note/brigade
	name = "Новые приказы"
	note_info = {"Мэдсен приказал всем начать полную изоляцию от внешнего мира, теперь мы сами по себе. Последняя беседа с майором должно быть поставило его в патовую ситуацию. Ничего, благо у нас достаточно ресурсов что-бы обеспечить себя как минимум на год беззаботного проживания тут. Кто-то шутит что Терра будет искать нас словно тех парней с Земли. Которые укопались в джунглях с огромной сетью туннелей. Ну-ну."}

/obj/structure/fd/interactive/note/locks
	name = "Замки"
	attached_text = list(/datum/interactive_note/locks)

/datum/interactive_note/locks
	name = "Замки?"
	note_info = {"Это конечно отлично что мы сделали что-то на вроде анклава, но зачем ставить <span style="color: blue;">кодовые замки</span>? Старшие инженеры думают, что роботы попросту не выдерут двери с петлями??? Хрень собачья. Листки с паролями раздали каждому лично в руки. Если закончится туалетная бумага, подтирусь ими."}


// lvl2
//sklad
/obj/structure/fd/interactive/note/lvl2/warehouse/password
	name = "Защищённые хранилища"
	attached_text = list(/datum/interactive_note/lvl2/warehouse/password)

/datum/interactive_note/lvl2/warehouse/password
	name = "Запреты"
	note_info = {"Кто-то начал воровать электроннику и инструменты из неремотнопригодных. Оставшие завхоз запер в кладе на кодовый замок. Ну хоть от первого хранилища пароль он выдал - <span style="color: yellow;" Восемь Шесть Четыре Пять </span>". <br>
	 Второй он запечатал и отправил Джейку в серверную. Старый подозревает вообще кого угодно? Если электрики попросят новые предохранители - пусть сами идут к нему и разбираются почему остальные под замком"}

/obj/structure/fd/interactive/note/lvl2/warehouse/toilet
	name = "Всем без исключения"
	attached_text = list(/datum/interactive_note/lvl2/warehouse/password/toilet_1, /datum/interactive_note/lvl2/warehouse/password/toilet_2)

/datum/interactive_note/lvl2/warehouse/password/toilet_1
	name = "Обязательно к прочтению"
	note_info = {"ВНИМАНИЕ! По поручению Мэдсена была введена новая система безопасности с кодовыми замками! Они будут обновлятся каждый второй четверг для нашей с вами сохранности. Каждому сотрудник был предоставлен пароль от его отдела! <br> Т█к же настоятельно просим пе█естать со██щать о поло█анных средствах связи, для этого есть отде█ снабжения"}

/datum/interactive_note/lvl2/warehouse/password/toilet_2
	name = "Пароли"
	note_info = {"От█ел: <span style="color: yellow;" Снабжение и Транспортировка </span>" <br> Сотруд█ик: Джеймс Ма█ <br> Коды: 19█8 - █аш личный код <br> <span style="color: yellow;">1</span>███ - нас█с███ комната и личн██ шкаф█"}

	//<span style="color: yellow;">текст </span> - выделения текста
	// / - красная строка?
