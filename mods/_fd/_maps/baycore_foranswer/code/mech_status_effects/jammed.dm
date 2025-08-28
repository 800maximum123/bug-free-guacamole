/// Клин оружия, запрещает меху бить/стрелять по целям
/datum/mech_status/jammed
	name = "Заклинен"

/datum/mech_status/jammed/on_apply()
	. = ..()

/datum/mech_status/jammed/tick()
	. = ..()

/datum/mech_status/jammed/on_remove()
	. = ..()
	owner.visible_message(SPAN_WARNING("[owner] сумел справиться с клином!"))
