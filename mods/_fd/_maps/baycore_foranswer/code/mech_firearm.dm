/datum/mech_equipment/firearm
	name = "Пушка"
	action_icon = 'mods/_fd/_maps/baycore_foranswer/icons/ui.dmi'
	action_state = "26"

	var/ammo = 0
	var/max_ammo = 100

	var/magazines = 5
	var/max_magazines = 5

	var/bullet_type = /obj/item/projectile/bullet/mech

	/// Количество выстрелов в очереди
	var/burst_size = 1
	/// Интервал выстрелов внутри очереди
	var/burst_interval = 0.1 SECONDS

	/// Время перезарядки магазина
	var/reload_time = 3 SECONDS

/datum/mech_equipment/firearm/New(mob/living/simple_animal/hostile/fd/lancer/new_owner)
	. = ..()
	ammo = max_ammo

/datum/mech_equipment/firearm/use(atom/target, params)
	. = ..()
	if(!.)
		return .

	for(var/burst_count in 1 to burst_size)
		if(!handle_fire(target, params, burst_count))
			playsound(get_turf(owner), 'sound/weapons/empty.ogg', 80, TRUE)
			break

		var/projectile = new bullet_type(get_turf(owner))

		fire(target, params, projectile, burst_count)
		sleep(burst_interval)

	return .

/datum/mech_equipment/firearm/handle_use(atom/target, params)
	if(owner.malfunctioned)
		playsound(get_turf(owner), 'sound/weapons/empty.ogg', 80, TRUE) // В идеале найти другой звук
		to_chat(owner, SPAN_WARNING("Оружие заклинило!"))
		return FALSE

	if(owner.weapon_safety)
		to_chat(owner, SPAN_WARNING("Включенный предохранитель не позволяет выстрелить с <[name]>!"))
		return FALSE

	return ..()

/// В идеале, модифицировать параметры пули с зависимостью от меха - тут
/datum/mech_equipment/firearm/proc/fire(atom/target, params, obj/item/projectile/bullet/mech/projectile, burst_count)
	projectile.original = target
	projectile.current = target

	projectile.starting = get_turf(owner)
	projectile.shot_from = owner
	projectile.permutated += owner

	projectile.launch(target, BP_CHEST)

	//owner.visible_message(SPAN_DANGER("[owner.name] делает выстрел из [src.name]!")) Предположительно будет слишком засорять чат

	playsound(get_turf(owner), projectile.fire_sound, 30, TRUE)
	projectile.SetTransform(2)

/datum/mech_equipment/firearm/proc/handle_fire(atom/target, params, burst_count)
	if(owner.damaged)
		return FALSE

	if(owner.malfunctioned)
		return FALSE

	if(max_ammo > 0)
		if(ammo <= 0)
			return FALSE

		ammo--

	return TRUE

/datum/mech_equipment/firearm/get_stat_info(mob/living/simple_animal/hostile/fd/lancer/user)
	. = ..()
	if(max_ammo > 0)
		. += list(list(
			"title" = SPAN_ABILITY_GRADIENT("Боезапаса <[name]>:", ammo/max_ammo),
			"desc" = SPAN_ABILITY_GRADIENT("[ammo] / [max_ammo]", ammo/max_ammo),
			))
	return .
