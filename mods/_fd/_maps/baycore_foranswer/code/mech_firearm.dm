/datum/mech_equipment/firearm
	name = "Пушка"
	action_icon = 'mods/_fd/_maps/baycore_foranswer/icons/mechs/mech_ui.dmi'
	action_state = "medium_weapon"

	var/bullet_type = /obj/item/projectile/bullet/mech

	var/max_ammo = 100
	var/max_magazines = 5

	var/ammo = 0
	var/magazines = 0

	/// Количество выстрелов в очереди
	var/burst_size = 1
	/// Интервал выстрелов внутри очереди
	var/burst_interval = 0.1 SECONDS

	/// Время перезарядки магазина
	var/reload_time = 3 SECONDS

	var/reload_sound = 'sound/machines/bolts_up.ogg'

/datum/mech_equipment/firearm/New(mob/living/simple_animal/fd/lancer/new_owner)
	. = ..()
	ammo = max_ammo
	magazines = max_magazines

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
	if(owner.get_status_effect(/datum/mech_status/jammed))
		playsound(get_turf(owner), 'sound/weapons/empty.ogg', 80, TRUE) // В идеале найти другой звук
		to_chat(owner, SPAN_WARNING("Оружие заклинило!"))
		return FALSE

	owner.face_atom(target)

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

	projectile.firer = owner // Если нам вдруг понадобится для какой-то абилки
	projectile.launch(target, BP_CHEST)

	//owner.visible_message(SPAN_DANGER("[owner.name] делает выстрел из [src.name]!")) Предположительно будет слишком засорять чат

	playsound(get_turf(owner), projectile.fire_sound, 30, TRUE)
	projectile.SetTransform(2)

/datum/mech_equipment/firearm/proc/handle_fire(atom/target, params, burst_count)
	if(owner.damaged)
		return FALSE

	if(owner.get_status_effect(/datum/mech_status/jammed))
		return FALSE

	if(max_ammo > 0)
		if(ammo <= 0)
			return FALSE

		ammo--

	return TRUE

/datum/mech_equipment/firearm/proc/reload()
	if(!magazines)
		return FALSE

	if(!do_after(owner, reload_time, owner, DO_BOTH_CAN_MOVE | DO_PUBLIC_UNIQUE))
		return FALSE

	magazines -= 1
	ammo = max_ammo

	owner.visible_message("[owner] перезаряжает своё основное оружие!")
	playsound(get_turf(owner), reload_sound, 100, TRUE)

	return TRUE

/datum/mech_equipment/firearm/get_stat_info(mob/living/simple_animal/fd/lancer/user)
	. = ..()
	if(max_ammo > 0)
		. += list(list(
			"title" = ABILITY_STAT("Боезапаса <[name]>:", ammo, max_ammo, 0.5),
			"desc" = ABILITY_STAT("[ammo] / [max_ammo]", ammo, max_ammo, 0.5),
			))
	return .
