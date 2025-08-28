/datum/mech_status/chained
	name = "Скован"

/datum/mech_status/chained/on_apply()
	. = ..()

/datum/mech_status/chained/tick()
	. = ..()
	new /obj/effect/mech_particle/chained(owner.loc)

/datum/mech_status/chained/on_remove()
	. = ..()
	owner.visible_message(SPAN_WARNING("[owner] вновь начал исправно двигаться!"))
