/datum/mech_ability/action/toggle_cloak
	name = "Скрытность Вкл/Выкл"
	action_state = "1"
	stat_color = "#c675fc"

	cooldown = 10 SECONDS

	var/state = FALSE
	var/cloak_alpha = 30
	var/light_color = "#27d6a2"
	var/icon_postfix = "_cloak"

/datum/mech_ability/action/toggle_cloak/use(atom/target, params)
	. = ..()
	if(!.)
		return

	state = !state
	to_chat(owner, SPAN_INFO("Ты [state ? "активировал" : "деактивировал"] режим скрытности."))
	playsound(get_turf(owner), pick(GLOB.switch_small_sound), 90, TRUE)

	if(state)
		animate(owner, 1 SECOND, alpha = cloak_alpha, easing = SINE_EASING, flags = ANIMATION_PARALLEL)
		owner.icon_state = owner.icon_living + icon_postfix
		owner.set_light(3, 2, light_color)
	else
		animate(owner, 1 SECOND, alpha = 255, easing = SINE_EASING, flags = ANIMATION_PARALLEL)
		owner.icon_state = owner.icon_living
		owner.set_light(0)
