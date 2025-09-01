/datum/mech_ability/action/smoke_deployer
	name = "Выброс Дыма"
	action_state = "smoke"

	cooldown = 30 SECONDS

/obj/structure/fd/lancer/smoke
	icon = 'icons/effects/smoke.dmi'
	icon_state = "smoke wall"

	opacity = TRUE
	mouse_opacity = FALSE

	layer = ABOVE_HUMAN_LAYER
	icon_state = "smoke"

	pixel_x = -9
	pixel_y = -6

/obj/structure/fd/lancer/smoke/Initialize()
	. = ..()
	spawn(5 SECONDS)
		animate(src, 5 SECOND, alpha = 0)
	spawn(8 SECONDS)
		opacity = FALSE

/obj/structure/fd/lancer/grenade/smoke/bomb_trigger()
	set waitfor = FALSE

	var/list/affected_turfs = list()

	for(var/turf/floor in block(src.x-splash_zone, src.y-splash_zone, src.z, src.x+splash_zone, src.y+splash_zone, src.z))
		affected_turfs[floor] = floor.color
		animate(floor, time = 1 SECONDS, color = COLOR_RED, easing = CUBIC_EASING | EASE_OUT)

	sleep(1 SECONDS)

	for(var/turf/floor in affected_turfs.Copy())
		animate(floor, time = 0.2 SECONDS, color = affected_turfs[floor], easing = SINE_EASING | EASE_IN)
		bomb_effect(floor)

	affected_turfs.Cut()

/obj/structure/fd/lancer/grenade/smoke/bomb_effect(turf/where_to_check)
	if(where_to_check.density == FALSE)
		new /obj/structure/fd/lancer/smoke(where_to_check)

	spawn(4 SECONDS)
		qdel(src)

/datum/mech_ability/action/smoke_deployer/use(atom/target, params)
	. = ..()
	if(!.)
		return

	var/list/affected_turfs = list()
	for(var/turf/floor in oview(7, owner))
		affected_turfs += floor

	for(var/smokes, smokes<6, smokes++)
		var/turf/deployment_turf = pick(affected_turfs)

		new /obj/structure/fd/lancer/grenade/smoke(deployment_turf)
		affected_turfs -= deployment_turf

	return .
