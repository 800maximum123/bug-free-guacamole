/datum/mech_ability/action/firemode_change
	name = "Сменить режим Стрельбы"
	action_state = "firemode"

	var/semi_off = TRUE

/datum/mech_ability/action/firemode_change/use(atom/target, params)
	. = ..()
	if(!.)
		return FALSE

	semi_off = !semi_off
	to_chat(owner, SPAN_INFO("Ты только что переключил винтовку на стрельбу[semi_off ? "очередями" : "одиночными"]."))

	if(!semi_off)
		for(var/datum/mech_equipment/firearm/assault_rifle/AR in owner.equipment)
			AR.cooldown = 0
			AR.burst_size = 1
	else
		for(var/datum/mech_equipment/firearm/assault_rifle/AR in owner.equipment)
			AR.cooldown = initial(AR.cooldown)
			AR.burst_size = initial(AR.burst_size)
