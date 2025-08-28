/datum/mech_status/hacked
	name = "Взломан"
	status_type = STATUS_EFFECT_UNIQUE

/datum/mech_status/hacked/on_apply()
	. = ..()
	owner.overlay_fullscreen("hacked", /obj/screen/fullscreen/noise/hacked)
	owner.overlay_fullscreen("hacked_borders", /obj/screen/fullscreen/fishbed)

/datum/mech_status/hacked/tick()
	. = ..()
	new /obj/effect/mech_particle/hacked(owner.loc)

/datum/mech_status/hacked/on_remove()
	. = ..()
	owner.visible_message(SPAN_WARNING("[owner] вновь вернулся под контроль пилота!"))

	owner.clear_fullscreen("hacked", 2 SECONDS)
	owner.clear_fullscreen("hacked_borders", 2 SECONDS)
