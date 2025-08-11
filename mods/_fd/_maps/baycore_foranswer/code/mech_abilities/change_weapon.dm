/datum/mech_ability/action/change_weapon
	name = "Сменить основное оружие"
	action_state = "17"

	cooldown = 0

/datum/mech_ability/action/change_weapon/use(atom/target, params)
	. = ..()
	if(!.)
		return

	var/list/options = list()
	var/list/actions = list()
	for(var/datum/mech_weapon/weapon as anything in owner.weapons)
		options[weapon.name] = image(weapon.action_icon, weapon.action_state)
		actions[weapon.name] = weapon

	var/chosen_option = show_radial_menu(owner, owner, options, radius = 30, require_near = TRUE, offset_x = 125, offset_y = 125)
	if(!chosen_option)
		return TRUE // Тру вместо фолза, дабы оно не издавало звук ""ошибки"" при закрытии меню

	var/datum/mech_weapon/new_weapon = actions[chosen_option]
	if(owner.selected_weapon != new_weapon)
		playsound(get_turf(owner), 'packs/infinity/sound/items/change_jaws.ogg', 40, TRUE)
	owner.selected_weapon = new_weapon
