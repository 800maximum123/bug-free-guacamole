/// Перегрев, постепенно наносит меху урон и частично ускоряет его
/datum/mech_status/overheated
	name = "Перегрет"

/datum/mech_status/overheated/on_apply()
	. = ..()
	if(owner.has_overheated_state)
		owner.icon_state = "[owner.icon_living]_charged"

	owner.add_filter("heated", 5, list("type" = "outline", , "size" = 0, "color" = COLOR_AMBER))
	animate(owner.get_filter("heated"), time = 5 SECONDS, size = 1, flags = ANIMATION_PARALLEL)

	owner.add_filter("heated_blur", 4, list("type" = "blur", , "size" = 0))
	animate(owner.get_filter("heated_blur"), time = 5 SECONDS, size = 1, flags = ANIMATION_PARALLEL)

	animate(owner, time = 5 SECONDS, color = "#fc987a", flags = ANIMATION_PARALLEL)

	playsound(get_turf(owner),'sound/mecha/internaldmgalarm.ogg', 20)
	playsound(get_turf(owner),'sound/effects/iron_sizzle.ogg', 100, TRUE)

/datum/mech_status/overheated/tick()
	. = ..()
	new /obj/effect/mech_particle/overheated(owner.loc)

/datum/mech_status/overheated/on_remove()
	. = ..()

	if(owner.has_overheated_state && (owner.mech_condition != DEAD))
		owner.icon_state = initial(owner.icon_state)

	owner.visible_message(SPAN_WARNING("[owner] прекратил плавиться от перегрева!"))

	animate(owner.get_filter("heated"), time = 5 SECONDS, size = 0, flags = ANIMATION_PARALLEL)
	animate(owner.get_filter("heated_blur"), time = 5 SECONDS, size = 0, flags = ANIMATION_PARALLEL)

	animate(owner, time = 5 SECONDS, color = initial(owner.color), flags = ANIMATION_PARALLEL)
