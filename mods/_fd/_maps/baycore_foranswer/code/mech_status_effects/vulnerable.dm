/// Увеличивает входящий по меху урон
/datum/mech_status/vulnerable
	name = "Уязвим"
	var/damage_mod = 2

/datum/mech_status/vulnerable/on_apply()
	. = ..()

/datum/mech_status/vulnerable/tick()
	. = ..()
	new /obj/effect/mech_particle/vulnerable(owner.loc)

/datum/mech_status/vulnerable/on_remove()
	. = ..()
	owner.visible_message(SPAN_WARNING("[owner] перестал быть уязвимым!"))
