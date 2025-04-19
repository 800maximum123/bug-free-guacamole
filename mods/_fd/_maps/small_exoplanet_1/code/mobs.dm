/mob/living/simple_animal/hostile/ghoul
	name = "ghoul"
	desc = "Strange looking humanoid without any hair or even eyes colors."
	faction = "ghoul"
	icon = 'mods/_fd/_maps/small_exoplanet_1/icons/ms13enemies.dmi'
	icon_state = "feralghoul"
	icon_living = "feralghoul"
	icon_dead = "feralghoul_dead"
	movement_cooldown = 3
	maxHealth = 200
	health = 200
	speed = 3
	natural_weapon = /obj/item/natural_weapon/claws/strong
	cold_damage_per_tick = 0
	pass_flags = PASS_FLAG_TABLE
	mob_size = MOB_MEDIUM

	ai_holder = /datum/ai_holder/simple_animal/melee/ghoul

/datum/ai_holder/simple_animal/melee/ghoul
	vision_range = 5
	cooperative = TRUE
	violent_breakthrough = FALSE

/datum/ai_holder/simple_animal/melee/ghoul/list_targets()
	. = ohearers(vision_range, holder)
	. -= global.dview_mob // Not the dview mob!

	for (var/mob/living/HM in range(vision_range, holder))
		if (can_see(holder, HM, vision_range) && MOVING_QUICKLY(HM))
			. += HM

/datum/ai_holder/simple_animal/melee/ghoul/can_pursue(atom/movable/target)
	ai_log("can_pursue() : Entering.", AI_LOG_TRACE)
	if (isliving(target))
		var/mob/living/L = target
		if (ishuman(L) || issilicon(L))
			if (L.key && !L.client)	// SSD players get a pass
				return FALSE

			if (L.status_flags & NOTARGET)
				return FALSE

			if(MOVING_DELIBERATELY(L) && get_dist(holder, target) > 3)
				return FALSE

		if (L.stat)
			if (L.stat == DEAD && !handle_corpse) // Leave dead things alone
				return FALSE
			if (L.stat == UNCONSCIOUS)	// Do we have mauling? Yes? Then maul people who are sleeping but not SSD
				if (mauling)
					return TRUE
				else
					return FALSE

		if (holder.IIsAlly(L))
			return FALSE
		return TRUE

	if (istype(target, /mob/living/exosuit))
		var/mob/living/exosuit/M = target
		for (var/mob/pilot in M.pilots)
			return can_attack(pilot)
		return destructive // Empty mechs are 'neutral'.

	if (istype(target, /obj/machinery/porta_turret))
		var/obj/machinery/porta_turret/P = target
		if (MACHINE_IS_BROKEN(P))
			return FALSE // Already dead.
		if (!(P.assess_living(holder)))
			return FALSE // Don't shoot allied turrets.
		if (!P.raised && !P.raising)
			return FALSE // Turrets won't get hurt if they're still in their cover.
	return TRUE

/mob/living/simple_animal/hostile/ghoul/froggo
	name = "deepone"
	desc = "Strange looking humanoid reptile."
	icon = 'mods/_fd/_maps/small_exoplanet_1/icons/deepone.dmi'
	icon_state = "deepone"
	icon_living = "deepone"
	icon_dead = "deepone_g"

/mob/living/simple_animal/hostile/seeker
	name = "seeker"
	desc = "An large, horrifying entity without any signs of it's lower body."
	faction = "ghoul"
	icon = 'mods/_fd/_maps/small_exoplanet_1/icons/enigma_dragger.dmi'
	icon_state = "dragger"
	icon_living = "dragger"
	icon_dead = "dragger_dead"
	movement_cooldown = 3
	maxHealth = 500
	health = 500
	speed = 5
	natural_weapon = /obj/item/natural_weapon/claws/strong
	cold_damage_per_tick = 0
	pass_flags = PASS_FLAG_TABLE
	mob_size = MOB_LARGE

	ai_holder = /datum/ai_holder/simple_animal/guard/give_chase
