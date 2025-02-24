/datum/psi_complexus
	var/list/current_abilities = list()
	var/list/abilities_by_name = list()

	var/list/unselected_abilities = list()

	var/list/action_buttons = list()
	var/action_buttons_amount = 4

/datum/psi_complexus/New(mob/_owner)
	owner = _owner
	START_PROCESSING(SSpsi, src)
	initialize_abilities()
	update_buttons()

/datum/psi_complexus/Destroy()
	for(var/ability in current_abilities)
		qdel(ability)
	for(var/button in action_buttons)
		qdel(button)
	action_buttons.Cut()

	return ..()

/datum/psi_complexus/proc/initialize_abilities()
	// For now we're giving out all avaivable abilities
	for(var/power_type in subtypesof(/datum/psi_ability))
		current_abilities += power_type
		current_abilities[power_type] = 1
	// REMOVE after adding selection panel

	var/list/to_initialize = current_abilities.Copy()

	for(var/ability in to_initialize)
		remove_ability(ability)
		add_ability(ability, to_initialize[ability])

/datum/psi_complexus/proc/add_ability(datum/psi_ability/ability, level = 1)
	if(!ability)
		return

	if(ispath(ability))
		ability = new ability(src, owner)
		ability.level = level

	abilities_by_name[ability.name] = ability
	current_abilities[ability] = level

	unselected_abilities += ability

/datum/psi_complexus/proc/remove_ability(datum/psi_ability/ability)
	if(!ability)
		return

	if(!ispath(ability))
		abilities_by_name -= ability.name
		unselected_abilities -= ability

	current_abilities -= ability

/datum/psi_complexus/proc/update_buttons()
	var/amount = action_buttons_amount
	if(suppressed)
		amount = 0

	while(length(action_buttons) < amount)
		action_buttons += new /datum/action/psi(src)

	var/increment = 0
	for(var/datum/action/action as anything in action_buttons)
		increment++
		if(increment > amount)
			action.Remove(owner)
		else
			action.Grant(owner)

/datum/psi_complexus/proc/invoke_abilities(atom/target, params, invoke_flag)
	if(suppressed)
		return

	for(var/datum/psi_ability/ability in current_abilities)
		if(!ability.active)
			continue
		if(ability.invoke_flags & invoke_flag)
			ability.on_target_click(target, params)
