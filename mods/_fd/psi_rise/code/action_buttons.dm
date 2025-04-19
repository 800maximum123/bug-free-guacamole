/obj/screen/movable/action_button/Click(location,control,params)
	var/list/modifiers = params2list(params)
	if(modifiers["shift"])
		moved = 0
		return 1
	if(usr.next_move >= world.time) // Is this needed ?
		return
	owner.Trigger(params)
	return 1


/datum/action/psi
	name = "Psi Action"
	button_icon = 'mods/_fd/psi_rise/icons/psionics_overhaul.dmi'
	background_icon_state = "slot_standart"
	button_icon_state = "none"
	action_type = AB_GENERIC
	check_flags = AB_CHECK_STUNNED | AB_CHECK_ALIVE

	var/datum/psi_complexus/psi_complexus
	var/datum/psi_ability/selected_ability

/datum/action/psi/New(datum/psi_complexus)
	src.psi_complexus = psi_complexus

/datum/action/psi/Trigger(params)
	if(!Checks())
		return

	var/list/modifiers = params2list(params)
	if(modifiers["alt"] || !selected_ability)
		if(selected_ability)
			if(world.time < selected_ability.cooldown_end)
				return
			if(selected_ability.active && selected_ability.is_continuous())
				selected_ability.toggle_active()
			if(!length(psi_complexus.unselected_abilities))
				deselect_ability()
				return

		var/datum/psi_ability/new_ability = input(owner, "Select an ability", "Choose ability",) as null|anything in psi_complexus.unselected_abilities
		if(!new_ability || new_ability.action)
			return

		select_ability(new_ability)
		return

	if(!(selected_ability in psi_complexus.current_abilities))
		deselect_ability()
		return

	if(world.time >= selected_ability.cooldown_end)
		flick("slot_activated", button)
	selected_ability.on_button_click(params)
	return

/datum/action/psi/proc/select_ability(datum/psi_ability/ability)
	if(!ability)
		return

	if(selected_ability)
		psi_complexus.unselected_abilities += selected_ability
	psi_complexus.unselected_abilities -= ability

	ability.action = src
	selected_ability = ability

	update_icon()

/datum/action/psi/proc/deselect_ability()
	if(!selected_ability)
		return

	if(selected_ability in psi_complexus.current_abilities)
		psi_complexus.unselected_abilities += selected_ability

	selected_ability.action = null
	selected_ability = null

	update_icon()

/datum/action/psi/proc/update_icon()
	button_icon_state = selected_ability?.icon_state || "none"
	if(world.time < selected_ability?.cooldown_end)
		button_icon_state += "_off"
	background_icon_state = selected_ability?.active ? "slot_active" : "slot_standart"
	button?.UpdateIcon()

/datum/action/psi/UpdateName()
	return selected_ability?.name || name
