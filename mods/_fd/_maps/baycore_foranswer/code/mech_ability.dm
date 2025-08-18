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

	/// Максимальное количество зарядов способности
	var/max_charges = 0
	/// Максимальное количество зарядов способности
	var/charges = 0

	/// Бонус/пенальти к скорости меха, который можно менять этой способностью
	var/speed_debuff = 0

	/// Время перезарядки
	var/cooldown = 1 SECONDS

	/// Таймер кулдауна
	var/next_use = 0
	var/last_used = 0

	/// Референс к владельцу
	var/mob/living/simple_animal/fd/lancer/owner

/datum/mech_ability/New(mob/living/simple_animal/fd/lancer/new_owner)
	. = ..()
	owner = new_owner
	new_owner.abilities += src

/datum/mech_ability/Destroy()
	owner.abilities -= src
	owner = null
	. = ..()

/// НАПОМИНАНИЕ: что бы ввести процесс - нужно ретурнуть TRUE и прописать START_PROCESSING() в new()
/datum/mech_ability/Process()
	..()

/// Активация/переключение способности, возвращает результат использования
/datum/mech_ability/proc/use(atom/target, params)
	SHOULD_CALL_PARENT(TRUE)

	/// Сюда внутри подтипов вставлять код самих способностей

	return handle_use(target, params)

/// Хэндлер для активации способности, содержит все базовые проверки для использования
/datum/mech_ability/proc/handle_use(atom/target, params)
	if(owner.hacked)
		return FALSE

	if(max_charges && (charges <= 0))
		to_chat(owner, SPAN_WARNING("Способность <[name]> не имеет зарядов!"))
		return FALSE

	if(cooldown && (next_use > world.time))
		to_chat(owner, SPAN_WARNING("Способность <[name]> ещё не готова!"))
		return FALSE

	next_use = world.time + cooldown
	last_used = world.time

	if(max_charges)
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
	if(max_charges)
		. += list(list(
			"title" = ABILITY_STAT("Зарядов <[name]>:", charges, max_charges, 0.5),
			"desc" = ABILITY_STAT("[charges]/[max_charges]", charges, max_charges, 0.5),
			))
	return .

/// Дополнительная информация после скана владельца, диктуемая этой способностью (ПОКА НЕ ГОТОВО)
/datum/mech_ability/proc/get_scan_info(mob/living/simple_animal/fd/lancer/user)
	. = ""
	return .

/// Для удобства - вот тип способности, который сразу будет показыватся в радиальном меню :D
/datum/mech_ability/action
	is_action = TRUE
