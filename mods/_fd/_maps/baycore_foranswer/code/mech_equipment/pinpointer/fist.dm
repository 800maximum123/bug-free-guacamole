/datum/mech_equipment/weapon/fist
	name = "Железный кулак"

	integrity_damage = 10
	hull_damage = 1

	cooldown = 1 SECONDS
	attack_distance = 7

	attack_sound = 'sound/effects/meteorimpact.ogg'

/datum/mech_equipment/weapon/fist/use(atom/target, params)
	. = ..()
	if(!.)
		return .

	if(istype(target, /mob/living/simple_animal/fd/lancer))
		var/mob/living/simple_animal/fd/lancer/L = target

		if(get_dist(owner, L) <= attack_distance && get_dist(owner, L) > 0)
			var/turf/target_turf = get_step(get_turf(L), pick(GLOB.alldirs))
			var/list/line_list = getline(owner, target_turf)
			for(var/i = 1 to length(line_list))
				var/turf/T = line_list[i]
				var/obj/temp_visual/decoy/D = new /obj/temp_visual/decoy(T, owner.dir, owner)
				D.alpha = min(150 + i*15, 255)
				animate(D, alpha = 0, time = 2 + i*2)
			owner.forceMove(target_turf)

		L.add_status_effect(/datum/mech_status/chained, 1 SECOND)

	for(var/datum/mech_equipment/firearm/revolver/R in owner.equipment)
		if(R.ammo < R.max_ammo)
			R.ammo += 1

	if(owner.heat > 0 && !owner.get_status_effect(/datum/mech_status/overheated))
		owner.heat -= 1

	return .
