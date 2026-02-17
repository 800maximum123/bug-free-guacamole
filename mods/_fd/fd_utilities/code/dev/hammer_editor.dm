/obj/structure/fd/mapping
	name = "MAPPING TOOLS"
	icon = 'mods/_fd/fd_utilities/icons/source.dmi'
	icon_state = "obselete"
	invisibility = 50

// Полезные приблуды

/obj/structure/fd/mapping/light_marker // Создаёт исключительно радиальный источник света
	name = "LIGHT EMITTER"
	icon_state = "light"

	var/complex = FALSE //1 - Маркер присваивает свет всем турфам в marker_range
	//0 - Маркер и есть источник света, а marker_range определяет дальность его распространения
	//Большие источники света в единичной инстанции вызывают пролаг при каждом обновлении
	//Если вы хотите сделать большой свет и предполагаете что игроки как-то смогут его приломлять - complex должен обязательно стоять на 1

	var/marker_range = 1
	var/marker_power = 1

	var/marker_id = "test" //Если мы хотим одновременно обновить несколько маркеров света
	var/should_update_others = FALSE //Проверяет, должны ли мы обновлять остальные маркеры с таким же айди, когда вызываем обновление этого

/obj/structure/fd/mapping/light_marker/Initialize()
	. = ..()
	setup_marker()

/obj/structure/fd/mapping/light_marker/proc/setup_marker(affected_range = marker_range, power_setting = marker_power, prefered_color = color)
	if(complex)
		for(var/turf/A in view(affected_range, src.loc))
			if(A.density)
				continue
			A.set_light(1, power_setting, prefered_color)
	else
		set_light(affected_range, power_setting, prefered_color)

/obj/structure/fd/mapping/light_marker/proc/update_marker()

	color = input(usr, "Выберите новый цвет освещения", "Каким он будет?") as color
	marker_power = input(usr, "Выберите новую силу освещения", "Какой она будет?") as num
	marker_range = input(usr, "Выберите новый радиус освещения", "Каким он будет?") as num

	if(should_update_others)
		for(var/obj/structure/fd/mapping/light_marker/LM in world)
			if(LM.marker_id != marker_id)
				continue
			LM.setup_marker()
			log_and_message_admins("Параметры одного или нескольких источников света были обновлены по координатам: (<A HREF='?_src_=holder;adminplayerobservecoodjump=1;X=[x];Y=[y];Z=[z]'>JMP</a>)")
	else
		setup_marker()
		log_and_message_admins("Параметры одного или нескольких источников света были обновлены по координатам: (<A HREF='?_src_=holder;adminplayerobservecoodjump=1;X=[x];Y=[y];Z=[z]'>JMP</a>)")

/obj/structure/fd/mapping/screentext_triggermarker // Выводит на экран крупный красивый текст с указанным содержанием
	name = "SCREENTEXT NARRATION"
	icon_state = "devturf1"

	alpha = 50

	var/text_to_show = "test"
	var/multi_trigger = 0 //2 - Текст высвечивается случайному живому человеку в радиусе зрения маркера
	//1 - Текст отобразится всем в радиусе зрения маркера
	//0 - Текст отобразится только наступившему

	var/trigger_uses = -1 //Выставьте больше нуля, если вы хотите чтобы маркер активировался N-ое кол-во раз
	var/list/already_triggered_by = list()

/obj/structure/fd/mapping/screentext_triggermarker/Crossed(mob/living/M)
	. = ..()

	if(istype(M))

		if(trigger_uses == 0)
			return

		if(multi_trigger == 0)
			if(!(M in already_triggered_by))
				trigger_marker(M)

		if(multi_trigger == 1)
			if(trigger_uses > 0)
				trigger_uses -= 1
			for(M in view())
				if(M in already_triggered_by)
					continue
				trigger_marker(M)

		if(multi_trigger == 2)
			for(M in view())
				var/list/random_targets = list()

				if(M in already_triggered_by)
					continue

				random_targets += M
				var/mob/living/random_target = pick(random_targets)
				trigger_marker(random_target)

/obj/structure/fd/mapping/screentext_triggermarker/proc/trigger_marker(mob/living/M)
	var/text_message = "[text_to_show]"
	var/colored = color

	var/obj/screen/novel_message/start_credits/nofade_simple/visuals = new /obj/screen/novel_message/start_credits/nofade_simple()
	visuals.maptext_x = 0
	visuals.maptext_y = -210

	M.client.screen += visuals
	visuals.set_text(text_message, colored, time = 10 SECONDS)

	if(multi_trigger != 1 && trigger_uses > 0)
		trigger_uses -= 1

	already_triggered_by += M
	log_and_message_admins("Человек активировал триггер текста на координатах: (<A HREF='?_src_=holder;adminplayerobservecoodjump=1;X=[x];Y=[y];Z=[z]'>JMP</a>)")

/*
// Пока что готово лишь частично
/obj/structure/fd/mapping/fogofwar // Создают на области туман войны, мешающий гостам видеть содержимое зоны пока в неё не зайдёт человек
	name = "FOG OF WAR (PLAY THE GAME YOU BITCH)"
	icon_state = "fog"

	var/revealed = FALSE

/obj/structure/fd/mapping/fogofwar/Initialize()
	. = ..()
	icon_state = "tools/black"

/obj/structure/fd/mapping/fogofwar/Crossed(mob/living/M)
	. = ..()
	if(istype(M) && !revealed)
		revealed = TRUE
		animate(ghostcurtain, alpha = 0, time = 3 SECONDS)*/

// Флаффовые метки для напоминания самому себе

/obj/structure/fd/mapping/dev_tip //При наведении мышкой - показывает заметку
	name = "DEV TIP (DELETE AFTER)"
	icon_state = "dev_text"

	var/text_to_show = "test"

/obj/structure/fd/mapping/dev_tip/MouseEntered(location, control, params)
	var/content_of_tooltip = get_additional_info()
	openToolTip(user = usr, tip_src = src, params = params, title = name, content = content_of_tooltip)
	..()

/obj/structure/fd/mapping/dev_tip/proc/get_additional_info() // Полностью оверрайдим на юните
	var/list/info = list()

	info += FONT_NORMAL("<li>[SPAN_COLOR("#ffffff","[text_to_show]")]</li>")

	return jointext(info, "")

/obj/structure/fd/mapping/placeholder //Простая заглушка чтобы не забыть что тут что-то должно быть
	name = "SOMETHING (DELETE AFTER)"
	icon_state = "cubemap"
