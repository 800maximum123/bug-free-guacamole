/datum/mech_equipment
	var/name = "Модуль"

	/// Путь к иконке в радиальном меню
	var/action_icon = 'mods/_fd/_maps/baycore_foranswer/icons/ui.dmi'
	/// Иконка в радиальном меню
	var/action_state = "2"

	/// Цвет информации об оружии в стат панели
	var/stat_color = COLOR_DARKMODE_TEXT
	/// Вторичный цвет информации об оружии, по стандарту используется при нуле патрон
	var/second_color = COLOR_RED

	/// Число, добавляемое к задержке между шагами в качестве дебаффа от тяжести модуля
	var/speed_debuff = 0

	/// Время перезарядки модуля
	var/cooldown = 1 SECONDS

	/// Таймер кулдауна
	var/next_use = 0

	/// Референс к владельцу
	var/mob/living/simple_animal/hostile/fd/lancer/owner

/datum/mech_equipment/New(mob/living/simple_animal/hostile/fd/lancer/new_owner)
	. = ..()
	owner = new_owner
	new_owner.equipment += src

/datum/mech_equipment/Destroy()
	owner.equipment -= src
	owner = null
	. = ..()

/// НАПОМИНАНИЕ: что бы ввести процесс - нужно ретурнуть TRUE и прописать START_PROCESSING() в new()
/datum/mech_equipment/Process()
	. = ..()

/datum/mech_equipment/proc/use(atom/target, params)
	. = handle_use(target, params)
	if(!.)
		return .

/datum/mech_equipment/proc/handle_use(atom/target, params)
	if(owner.damaged)
		return FALSE

	if(world.time < next_use)
		to_chat(target, SPAN_WARNING("[name] ещё не готов!"))
		return FALSE

	next_use = world.time + cooldown
	owner.face_atom(target)

	return TRUE  // В идеале не переписывать этот прок, за исключением моментов, где эти базовые проверки будут мешать(

/// Информация, которая пойдёт от абилки в стат панель игрока
/// ПРИМЕЧАНИЕ: += list(list( требуется для того, что бы список из тайтла и описания правильно добавился :3
/datum/mech_equipment/proc/get_stat_info(mob/living/simple_animal/hostile/fd/lancer/user)
	RETURN_TYPE(/list)
	. = list()
	return .

/// Дополнительная информация после скана владельца, диктуемая этой способностью (ПОКА НЕ ГОТОВО)
/datum/mech_equipment/proc/get_scan_info(mob/living/simple_animal/hostile/fd/lancer/user)
	. = ""
	return .
