/datum/mech_ability/body_swap
	name = "Захват Контроля"
	action_state = "37"

	required_params = list("middle")
	cooldown = 1 MINUTE

	var/player_ckey
	var/enemy_ckey
	var/mob/living/simple_animal/fd/lancer/controlled_mech = null

	var/player_out = FALSE

/datum/mech_ability/body_swap/use(atom/target, params)
	. = ..()
	if(!.)
		return

	if(istype(target, /mob/living/simple_animal/fd/lancer))
		var/mob/living/simple_animal/fd/lancer/L = target
		if(L.swap_protected)
			to_chat(owner, SPAN_DANGER("Что-то помешало переносу!"))
			return FALSE

		for(var/datum/mech_ability/action/toggle_cloak/ability as anything in owner.abilities)
			if(istype(ability) && !ability.state)
				to_chat(owner, SPAN_DANGER("Перенос не может быть осуществлён, пока мех настолько открыт!"))
				return FALSE

		owner.adjust_heat(8)

		player_ckey = owner.ckey
		controlled_mech = L
		if(L.client)
			enemy_ckey = L.ckey
			L.ghostize(0)
		L.ckey = owner.ckey
		L.teleop = null

		player_out = TRUE
		addtimer(new Callback(src, PROC_REF(swap_back)), 10 SECONDS)

/datum/mech_ability/body_swap/proc/swap_back()
	if(!player_out)
		return TRUE

	if(owner.client)
		owner.ghostize(0)

	owner.ckey = player_ckey
	owner.teleop = null

	controlled_mech.ckey = enemy_ckey
	controlled_mech.teleop = null

	player_ckey = null
	enemy_ckey = null
	controlled_mech = null

	player_out = FALSE

	return TRUE

/datum/mech_ability/body_swap/Process()
	. = ..()

	if(!isnull(controlled_mech))
		if(player_out)
			if(controlled_mech.mech_condition != CONSCIOUS)
				swap_back()

			if(controlled_mech.ckey != player_ckey)
				swap_back()

	if(isnull(controlled_mech) && player_out)
		swap_back()
