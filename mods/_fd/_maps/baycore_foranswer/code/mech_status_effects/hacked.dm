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

/obj/screen/fullscreen/noise/hacked
	icon_state = "1 moderate"
	alpha = 0

/obj/screen/fullscreen/noise/hacked/Initialize()
	. = ..()
	animate(src, color = COLOR_VIOLET, alpha = 255, time = 2 SECONDS)

/obj/screen/fullscreen/fishbed/hacked
	alpha = 0

/obj/screen/fullscreen/fishbed/hacked/Initialize()
	. = ..()
	animate(src, color = COLOR_VIOLET, alpha = 255, time = 2 SECONDS)
