/datum/mech_status/anchored
	name = "Зафиксирован"
	status_type = STATUS_EFFECT_SOURCED

/datum/mech_status/anchored/on_apply()
	. = ..()
	owner.anchored = TRUE

/datum/mech_status/anchored/on_remove()
	. = ..()
	owner.anchored = FALSE
