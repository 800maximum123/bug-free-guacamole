/datum/mech_ability/action/toggle_safety
	name = "Предохранитель Вкл/Выкл"
	action_state = "38"

	cooldown = 0

/datum/mech_ability/action/toggle_safety/use(atom/target, params)
	. = ..()
	if(!.)
		return

	owner.weapon_safety = !owner.weapon_safety
	to_chat(owner, SPAN_INFO("Ты [owner.weapon_safety ? "включил" : "выключил"] орудийный предохранитель."))
	playsound(get_turf(owner), pick(GLOB.switch_small_sound), 90, TRUE)

/datum/mech_ability/action/toggle_safety/get_stat_info()
	var/color = owner.weapon_safety ? stat_color : second_color
	. = list(list(
		"title" = SPAN_ABILITY_STAT("Предохранитель:", color),
		"desc" = SPAN_ABILITY_STAT(owner.weapon_safety ? "АКТИВЕН" : "НЕАКТИВЕН", color),
		))
