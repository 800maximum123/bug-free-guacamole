/datum/mech_ability/action/reboot
	name = "Перезагрузка"
	action_state = "reboot"

	cooldown = 0

	var/duration = 15 SECONDS

	var/list/to_remove = list(
		/datum/mech_status/chained,
		/datum/mech_status/hacked,
		/datum/mech_status/jammed,
		/datum/mech_status/malfunctioned,
		/datum/mech_status/overheated,
		/datum/mech_status/vulnerable,
		)

/datum/mech_ability/action/reboot/use(atom/target, params)
	. = ..()
	if(!.)
		return

	var/answer = alert(owner, "Вы уверены, что хотите перезагрузить системы меха?", "Перезагрузка", "Да", "Нет")
	if(answer != "Да")
		return FALSE

	reboot()
	return TRUE

/datum/mech_ability/action/reboot/proc/reboot()
	set waitfor = FALSE

	owner.power_down()
	for(var/datum/mech_status/status_effect as anything in owner.status_effects)
		if(status_effect.type in to_remove)
			qdel(status_effect)

	if(!do_after(owner, duration, owner, DO_SHOW_PROGRESS|DO_PUBLIC_PROGRESS|DO_BOTH_UNIQUE_ACT|DO_BOTH_CAN_MOVE|DO_BOTH_CAN_TURN))
		message_admins("[owner.ckey] КАКИМ ТО ОБРАЗОМ СМОГ ЗААБУЗИТЬ ДЕЛЕЙ НА РЕБУТ!!!!!!!!!!!!!!!!!!!!!!")

	owner.power_up()
