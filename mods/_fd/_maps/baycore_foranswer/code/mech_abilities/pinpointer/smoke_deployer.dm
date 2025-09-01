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

/obj/structure/fd/lancer/grenade/smoke
	splash_zone = 2
	var/list/remove_from_pull = list()

/obj/structure/fd/lancer/grenade/smoke/Initialize()
	check_near()

	. = ..()
/obj/structure/fd/lancer/grenade/smoke/proc/check_near()
	for(var/turf/floor in block(x-splash_zone, y-splash_zone, z, x+splash_zone, y+splash_zone, z))
		remove_from_pull -= floor

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
		var/delay
		var/final_delay = 1 SECOND + delay
		var/obj/structure/fd/lancer/grenade/smoke/S

		spawn(final_delay)
			var/turf/deployment_turf = pick(affected_turfs)

			new S(deployment_turf)
			affected_turfs -= S.remove_from_pull
			delay += 1 SECOND


	return .
