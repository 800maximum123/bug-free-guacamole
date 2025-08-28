/datum/mech_status/malfunction
	name = "Сбоит"

/datum/mech_status/malfunction/on_creation(mob/living/new_owner, new_duration, ...)
	. = ..()

/datum/mech_status/malfunction/tick()
	. = ..()
	new /obj/effect/mech_particle/malfunctioned(owner.loc)

/datum/mech_status/malfunction/on_remove()
	. = ..()
	owner.visible_message(SPAN_WARNING("[owner] вновь начал исправно функционировать!"))
