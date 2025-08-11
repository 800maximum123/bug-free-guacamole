/datum/mech_ability/action/change_weapon
	name = "Сменить основное оружие"
	action_state = "17"

	cooldown = 0

/datum/mech_ability/action/change_weapon/use(atom/target, params)
	. = ..()
	if(!.)
		return

	var/list/options = list(
		"Standart Pistol" = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "24"),
		"Standart Rifle" = image('mods/_fd/_maps/baycore_foranswer/icons/ui.dmi', "26")
	)

	var/chosen_option = show_radial_menu(owner, owner, options, radius = 30, require_near = TRUE, offset_x = 125, offset_y = 125)
	if(!chosen_option)
		return TRUE // Тру вместо фолза, дабы оно не издавало звук """ошибки""" при закрытии меню

	owner.weapon_equipped = chosen_option
	playsound(get_turf(owner), 'packs/infinity/sound/items/change_jaws.ogg', 40, TRUE)
