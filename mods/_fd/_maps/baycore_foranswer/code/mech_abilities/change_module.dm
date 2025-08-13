/datum/mech_ability/action/change_module
	name = "Выбрать Модуль"
	action_state = "17"

	cooldown = 0

/datum/mech_ability/action/change_module/use(atom/target, params)
	. = ..()
	if(!.)
		return

	var/list/options = list()
	var/list/actions = list()
	for(var/datum/mech_equipment/equip as anything in owner.equipment)
		options[equip.name] = image(equip.action_icon, equip.action_state)
		actions[equip.name] = equip

	var/chosen_option = show_radial_menu(owner, owner, options, radius = 30, require_near = TRUE, offset_x = 125, offset_y = 125)
	if(!chosen_option)
		return TRUE // Тру вместо фолза, дабы оно не издавало звук ""ошибки"" при закрытии меню

	var/datum/mech_equipment/new_equip = actions[chosen_option]
	if(owner.selected_equipment != new_equip)
		playsound(get_turf(owner), 'packs/infinity/sound/items/change_jaws.ogg', 40, TRUE)

	owner.selected_equipment = new_equip
	owner.handle_mech_speed()
