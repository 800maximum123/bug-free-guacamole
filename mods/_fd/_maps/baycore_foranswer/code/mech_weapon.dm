/datum/mech_weapon
	var/name = "pistol"

	/// Путь к иконке в радиальном меню
	var/action_icon = 'mods/_fd/_maps/baycore_foranswer/icons/ui.dmi'
	/// Иконка в радиальном меню
	var/action_state = "24"

	var/ammo = 0
	var/max_ammo = 100

	var/magazines = 5
	var/max_magazines = 5

	var/bullet_type = /obj/item/projectile/bullet/mech

	/// Цвет информации об оружии в стат панели
	var/stat_color = COLOR_DARKMODE_TEXT
	/// Вторичный цвет информации об оружии, по стандарту используется при нуле патрон
	var/second_color = COLOR_RED

	/// Количество выстрелов в очереди
	var/burst_size = 1
	/// Интервал выстрелов внутри очереди
	var/burst_interval = 0.1 SECONDS

	/// Время между очередями/выстрелами
	var/cooldown = 1 SECONDS
	/// Время перезарядки магазина
	var/reload_time = 3 SECONDS

	/// Таймер кулдауна
	var/next_fire = 0

	/// Референс к владельцу
	var/mob/living/simple_animal/hostile/fd/lancer/owner

/datum/mech_weapon/New(mob/living/simple_animal/hostile/fd/lancer/new_owner)
	. = ..()
	owner = new_owner
	new_owner.weapons += src
	ammo = max_ammo

/datum/mech_weapon/Destroy()
	owner.weapons -= src
	owner = null
	. = ..()

/// НАПОМИНАНИЕ: что бы ввести процесс - нужно ретурнуть TRUE и прописать START_PROCESSING() в new()
/datum/mech_weapon/Process()
	. = ..()

/// В идеале, модифицировать параметры пули зависимые от меха - тут
/datum/mech_weapon/proc/shoot(atom/target, params, obj/item/projectile/bullet/mech/projectile, burst_count)
	projectile.original = target
	projectile.current = target

	projectile.starting = get_turf(owner)
	projectile.shot_from = owner
	projectile.permutated += owner

	projectile.launch(target, BP_CHEST)

	//owner.visible_message(SPAN_DANGER("[owner.name] делает выстрел из [src.name]!")) Предположительно будет слишком засорять чат

	playsound(get_turf(owner), projectile.fire_sound, 30, TRUE)
	projectile.SetTransform(2)

/datum/mech_weapon/proc/fire(atom/target, params)
	. = handle_fire(target, params)
	if(!.)
		return .

	for(var/burst_count in 1 to burst_size)
		if(!handle_shoot(target, params, burst_count))
			playsound(get_turf(owner), 'sound/weapons/empty.ogg', 80, TRUE)
			break

		var/projectile = new bullet_type(get_turf(owner))

		shoot(target, params, projectile, burst_count)
		sleep(burst_interval)

	return .

/datum/mech_weapon/proc/handle_fire(atom/target, params)
	if(owner.damaged)
		return FALSE

	if(owner.malfunctioned)
		playsound(get_turf(src), 'sound/weapons/empty.ogg', 80, TRUE) // В идеале найти другой звук
		to_chat(src, SPAN_WARNING("Оружие заклинило!"))
		return FALSE

	if(owner.weapon_safety)
		to_chat(target, SPAN_WARNING("Включенный предохранитель не позволяет выстрелить с <[name]>!"))
		return FALSE

	if(world.time < next_fire)
		to_chat(target, SPAN_WARNING("[name] ещё не готов!"))
		return FALSE

	next_fire = world.time + cooldown
	owner.face_atom(target)

	return TRUE  // В идеале не переписывать этот прок, за исключением моментов, где эти базовые проверки будут мешать(

/datum/mech_weapon/proc/handle_shoot(atom/target, params, burst_count)
	if(owner.damaged)
		return FALSE

	if(owner.malfunctioned)
		return FALSE

	if(max_ammo <= 0)
		if(ammo <= 0)
			return FALSE

		ammo--

	return TRUE

/// Информация, которая пойдёт от абилки в стат панель игрока
/// ПРИМЕЧАНИЕ: += list(list( требуется для того, что бы список из тайтла и описания правильно добавился :3
/datum/mech_weapon/proc/get_stat_info(mob/living/simple_animal/hostile/fd/lancer/user)
	RETURN_TYPE(/list)
	. = list()
	if(max_ammo <= 0)
		. += list(list(
			"title" = SPAN_ABILITY_GRADIENT("<[name]> Боезапаса:", ammo/max_ammo),
			"desc" = SPAN_ABILITY_GRADIENT("[ammo]/[max_ammo]", ammo/max_ammo),
			))
	return .

/// Дополнительная информация после скана владельца, диктуемая этой способностью (ПОКА НЕ ГОТОВО)
/datum/mech_weapon/proc/get_scan_info(mob/living/simple_animal/hostile/fd/lancer/user)
	. = ""
	return .
