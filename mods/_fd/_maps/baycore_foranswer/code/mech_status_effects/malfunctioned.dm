/// Сбой систем, запрещает меху открывать меню действий
/datum/mech_status/malfunctioned
	name = "Сбоит"

/datum/mech_status/malfunctioned/on_apply()
	. = ..()

/datum/mech_status/malfunctioned/tick()
	. = ..()
	new /obj/effect/mech_particle/malfunctioned(owner.loc)

/datum/mech_status/malfunctioned/on_remove()
	. = ..()
	owner.visible_message(SPAN_WARNING("[owner] вновь начал исправно функционировать!"))
