/datum/mech_ability/action/toggle_cloak
	name = "Скрытность Вкл/Выкл"
	action_state = "38"

	stat_color = "#c675fc"
	//stat_color = "#ec75fc"

	cooldown = 10 SECONDS

	var/state = FALSE

/datum/mech_ability/action/toggle_cloak/use(atom/target, params)
	. = ..()
	if(!.)
		return

	state = !state
	to_chat(owner, SPAN_INFO("Ты [state ? "активировал" : "деактивировал"] режим скрытности."))
	playsound(get_turf(owner), pick(GLOB.switch_small_sound), 90, TRUE)
