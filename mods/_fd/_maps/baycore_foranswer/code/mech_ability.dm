/datum/mech_ability
	var/name = ""

	/// Путь к иконке в радиальном меню
	var/action_icon = 'mods/_fd/_maps/baycore_foranswer/icons/ui.dmi'
	/// Иконка в радиальном меню
	var/action_state = "9"
	/// Цвет придаваемый иконке в радиальном меню
	var/action_color = "#ffffff"

	/// Список параметров клика мышкой, при котором будет применяться способность
	var/list/required_params = list()
	/// Будет ли наше действие появляться как кнопка в радиальном меню?
	var/is_action = FALSE

	/// Цвет информации об абилке в стат панели
	var/stat_color = COLOR_DARKMODE_TEXT
	/// Вторичный цвет информации об абилке, по стандарту используется при нуле зарядов
	var/second_color = COLOR_RED

	/// Пенальти/бонус к скорости меха, который можно менять этой способностью
	var/speed_debuff = 0

	/// Максимальное количество зарядов способности
	var/charges_max = 0
	/// Максимальное количество зарядов способности
	var/charges = 0
	/// Время, через которое будет появлятся новый заряд (FALSE для отмены регенерации)
	var/charges_cooldown = FALSE

	/// Время перезарядки
	var/cooldown = 1 SECONDS

	/// Таймер кулдауна зарядов
	var/next_charge

	/// Таймер кулдауна
	var/next_use
	/// Последний раз, когда использовалась способность
	var/last_used

	/// Референс к владельцу
	var/mob/living/simple_animal/fd/lancer/owner

/datum/mech_ability/New(mob/living/simple_animal/fd/lancer/new_owner)
	. = ..()
	owner = new_owner
	new_owner.abilities += src
	charges = charges_max
	START_PROCESSING(SSprocessing, src)

/datum/mech_ability/Destroy()
	owner.abilities -= src
	owner = null
	STOP_PROCESSING(SSprocessing, src)
	. = ..()

/datum/mech_ability/Process()
	if(!charges_cooldown)
		return

	if(charges >= charges_max)
		return

	if(!next_charge)
		next_charge = world.time + charges_cooldown

	if(world.time < next_charge)
		return

	next_charge = 0
	charges++

/// Активация/переключение способности, возвращает результат использования
/datum/mech_ability/proc/use(atom/target, params)
	SHOULD_CALL_PARENT(TRUE)

	/// Сюда внутри подтипов вставлять код самих способностей

	return handle_use(target, params)

/// Хэндлер для активации способности, содержит все базовые проверки для использования
/datum/mech_ability/proc/handle_use(atom/target, params)
	if(owner.hacked)
		return FALSE

	if(charges_max && (charges <= 0))
		to_chat(owner, SPAN_WARNING("Способность <[name]> не имеет зарядов!"))
		return FALSE

	if(cooldown && (next_use > world.time))
		to_chat(owner, SPAN_WARNING("Способность <[name]> ещё не готова!"))
		return FALSE

	next_use = world.time + cooldown
	last_used = world.time

	if(charges_max)
		charges--

	return TRUE // В идеале не переписывать этот прок, за исключением моментов, где эти базовые проверки будут мешать(

/// Информация, которая пойдёт от абилки в стат панель игрока
/// ПРИМЕЧАНИЕ: += list(list( требуется для того, что бы список из тайтла и описания правильно добавился :3
/datum/mech_ability/proc/get_stat_info(mob/living/simple_animal/fd/lancer/user)
	RETURN_TYPE(/list)
	. = list()
	var/time = world.time
	if(next_use > time)
		. += list(list(
			"title" = ABILITY_STAT("<[name]> Готов Через:", time-last_used, next_use-last_used, 0.5),
			"desc" = ABILITY_STAT("[SECONDS_LEFT(time, next_use)] секунд", time-last_used, next_use-last_used, 0.5),
			))
	if(charges_max)
		. += list(list(
			"title" = ABILITY_STAT("Зарядов <[name]>:", charges, charges_max, 0.5),
			"desc" = ABILITY_STAT("[charges]/[charges_max]", charges, charges_max, 0.5),
			))
	return .

/// Дополнительная информация после скана владельца, диктуемая этой способностью
/datum/mech_ability/proc/get_scan_info(mob/living/simple_animal/fd/lancer/user)
	return ""

/// Для удобства - вот тип способности, который сразу будет показыватся в радиальном меню :D
/datum/mech_ability/action
	is_action = TRUE
