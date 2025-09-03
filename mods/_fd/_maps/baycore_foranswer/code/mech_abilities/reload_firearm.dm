/datum/mech_ability/action/reload_firearm
	name = "Перезарядка Оружия"
	action_state = "reload"

/datum/mech_ability/action/reload_firearm/use(atom/target, params)
	. = ..()
	if(!.)
		return FALSE

	if(!istype(owner.selected_equipment, /datum/mech_equipment/firearm))
		return FALSE

	var/datum/mech_equipment/firearm/firearm = owner.selected_equipment
	return firearm.reload()
