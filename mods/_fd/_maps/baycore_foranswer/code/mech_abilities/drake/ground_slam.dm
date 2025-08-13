/datum/mech_ability/drake/ground_slam
	name = "Удар по земле"
	action_state = "37"

	required_params = list("middle")
	cooldown = 5 SECONDS

	var/setup_offset = 50 // Так мы сможем сетапать эффект ровно под ножкой у разных мехов, не страдая от постоянного переписывания use()

/// Активация/переключение способности, возвращает результат использования
/datum/mech_ability/drake/ground_slam/use(atom/target, params)
	. = ..()

	var/list/affected_turfs = list()

	animate(owner, time = 2 SECONDS, transform = matrix(30, MATRIX_ROTATE), easing = SINE_EASING, flags = ANIMATION_PARALLEL)
	spawn(2 SECONDS)
		animate(owner, time = 0.5 SECONDS, transform = matrix(), easing = ELASTIC_EASING)
		var/obj/effect/ground_slam/explosion = new /obj/effect/ground_slam(get_turf(owner))
		new explosion(get_turf(owner))
		explosion.pixel_x = owner.pixel_x - setup_offset

	for(var/turf/floor in block(owner.x-3, owner.y-3, owner.z, owner.x+3, owner.y+3, owner.z))
		affected_turfs[floor] = floor.color
		animate(floor, time = 1 SECONDS, color = COLOR_RED, easing = CUBIC_EASING | EASE_OUT, flags = ANIMATION_PARALLEL)

	sleep(2 SECONDS)
	for(var/turf/floor in affected_turfs.Copy())
		animate(floor, time = 0.2 SECONDS, color = affected_turfs[floor], easing = SINE_EASING | EASE_IN, flags = ANIMATION_PARALLEL)
		for(var/mob/living/victim in floor)
			if(victim == owner)
				continue
			victim.throw_at(get_edge_target_turf(victim, get_dir(owner, victim)), 2, 1, owner, spin = FALSE)
	affected_turfs.Cut()

	return handle_use(target, params)

/obj/effect/ground_slam
	name = "slam"
	desc = "slam"
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/drake_burst.dmi'
	icon_state = "burst"
	layer = ABOVE_HUMAN_LAYER

/obj/effect/ground_slam/Initialize()
	. = ..()
	QDEL_IN(src, 5 SECONDS)
