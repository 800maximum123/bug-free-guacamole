/datum/mech_ability/action/toggle_cloak
	name = "Скрытность Вкл/Выкл"
	action_state = "38"

	stat_color = "#c675fc"
	//stat_color = "#ec75fc"

	cooldown = 10 SECONDS

	var/state = FALSE
	var/cloak_alpha = 15
	var/light_color = "#27d6a2"

/datum/mech_ability/action/toggle_cloak/use(atom/target, params)
	. = ..()
	if(!.)
		return

	state = !state
	to_chat(owner, SPAN_INFO("Ты [state ? "активировал" : "деактивировал"] режим скрытности."))
	playsound(get_turf(owner), pick(GLOB.switch_small_sound), 90, TRUE)

	if(state)
		owner.icon_state = owner.icon_living
		animate(owner, 1 SECOND, alpha = 255, easing = SINE_EASING, flags = ANIMATION_PARALLEL)
		owner.set_light(0)
	else
		owner.icon_state = "[owner.icon_living]_cloak"
		animate(owner, 1 SECOND, alpha = cloak_alpha, easing = SINE_EASING, flags = ANIMATION_PARALLEL)
		owner.set_light(3, 2, l_color = light_color)
