/datum/mech_ability/action/boosters_passive
	name = "Пассивные Ускорители"
	action_state = "29"

	cooldown = 0

	var/currently_active = FALSE
	var/image/overlay = null

/datum/mech_ability/action/boosters_passive/New(mob/living/simple_animal/fd/lancer/new_owner)
	. = ..()
	overlay = image(owner.icon, "burst", layer = ABOVE_OBJ_LAYER)

/datum/mech_ability/action/boosters_passive/use(atom/target, params)
	. = ..()
	if(!.)
		return

	currently_active = !currently_active
	to_chat(owner, SPAN_INFO("Ты [currently_active ? "включил" : "выключил"] пассивные ускорители."))

	if(currently_active)
		speed_debuff = -2
		START_PROCESSING(SSprocessing, src)
	else
		speed_debuff = 0
		STOP_PROCESSING(SSprocessing, src)
		owner.CutOverlays(overlay)

	owner.recalculate_mech_speed()

/datum/mech_ability/action/boosters_passive/Process()
	owner.CutOverlays(overlay)
	if(world.time <= owner.next_move)
		owner.adjust_heat(0.1)
		owner.AddOverlays(overlay)
		playsound(owner, 'sound/machines/thruster.ogg', 80, TRUE)

/datum/mech_ability/action/boosters_passive/get_stat_info()
	var/color = currently_active ? stat_color : second_color
	. = list(list(
		"title" = MECH_STAT("[name]:", color),
		"desc" = MECH_STAT(currently_active ? "РАБОТАЮТ" : "ОТКЛЮЧЕНЫ", color),
		))


/datum/mech_ability/boosters_quick
	name = "Реактивные Ускорители"
	action_state = "29"

	required_params = list("middle")
	cooldown = 2 SECONDS
	var/image/overlay = null

/datum/mech_ability/boosters_quick/New(mob/living/simple_animal/fd/lancer/new_owner)
	. = ..()
	overlay = image(owner.icon, "burst", layer = ABOVE_OBJ_LAYER)

/datum/mech_ability/boosters_quick/use(atom/target, params)
	. = ..()
	if(!.)
		return

	owner.face_atom(target)
	owner.AddOverlays(overlay)

	owner.throw_at(get_edge_target_turf(owner, get_dir(target, owner)), 15, 1, owner, spin = FALSE) // ЭТО НАМЕРЕННЫЙ РЕВЁРС КОТОРЫЙ ИЗНАЧАЛЬНО БЫЛ БАГОМ НО Я РЕШИЛ ТАК И ОСТАВИТЬ
	owner.adjust_heat(1)

	playsound(owner, 'sound/machines/thruster.ogg', 80, TRUE)

	sleep(0.5 SECONDS)
	owner.CutOverlays(overlay)


	return .
