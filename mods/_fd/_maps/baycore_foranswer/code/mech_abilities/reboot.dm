/datum/mech_ability/action/reboot
	name = "Перезагрузка"
	action_state = "32"

	cooldown = 0

	var/duration = 15 SECONDS

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
	for(var/status_effect in ALL_MECH_EFFECTS)
		if(owner.vars[status_effect] < 1 HOURS)
			owner.SetEffect(status_effect, 0)

	if(!do_after(owner, duration, owner, DO_SHOW_PROGRESS|DO_PUBLIC_PROGRESS|DO_BOTH_UNIQUE_ACT|DO_BOTH_CAN_MOVE|DO_BOTH_CAN_TURN))
		message_admins("[owner.ckey] КАКИМ ТО ОБРАЗОМ СМОГ ЗААБУЗИТЬ ДЕЛЕЙ НА РЕБУТ!!!!!!!!!!!!!!!!!!!!!!")

	owner.power_up()
