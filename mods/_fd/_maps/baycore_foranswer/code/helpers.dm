
// Status effect helpers for living mobs

/**
 * Applies a given status effect to this mob.
 *
 * new_effect - TYPEPATH of a status effect to apply.
 * Additional status effect arguments can be passed.
 *
 * Returns the instance of the created effected, if successful.
 * Returns 'null' if unsuccessful.
 */
/mob/living/simple_animal/fd/lancer/proc/add_status_effect(datum/mech_status/new_effect, new_duration, new_status_type, source, ...)
	RETURN_TYPE(/datum/mech_status)

	// The arguments we pass to the start effect. The 1st argument is this mob.
	var/list/arguments = args.Copy()
	arguments[1] = src

	if(!new_status_type)
		new_status_type = initial(new_effect.status_type)

	if(!source)
		source = src

	// If the status effect we're applying doesn't allow multiple effects, we need to handle it
	if(new_status_type != STATUS_EFFECT_MULTIPLE)
		for(var/datum/mech_status/existing_effect as anything in status_effects)
			if(existing_effect.name != initial(new_effect.name))
				continue

			// Добавляет/убавляет длительность нового эффекта к существующему
			if(new_status_type == STATUS_EFFECT_ADJUST)
				existing_effect.adjust_duration(new_duration)
				return

			switch(existing_effect.status_type)
				// Multiple are allowed, continue as normal. (Not normally reachable)
				if(STATUS_EFFECT_MULTIPLE)
					break
				// Only one is allowed of this type - early return
				if(STATUS_EFFECT_UNIQUE)
					return
				// Replace the existing instance (deletes it).
				if(STATUS_EFFECT_REPLACE)
					existing_effect.be_replaced()
				// Refresh the existing type, then early return
				if(STATUS_EFFECT_REFRESH)
					existing_effect.refresh(arglist(arguments))
					return
				// Добавляет источник нового эффекта к существующему
				if(STATUS_EFFECT_SOURCED)
					existing_effect.sources |= source
					return

	// Create the status effect with our mob + our arguments
	var/datum/mech_status/new_instance = new new_effect(arglist(arguments))
	if(!QDELETED(new_instance))
		return new_instance

/**
 * Removes all instances of a given status effect from this mob
 *
 * removed_effect - TYPEPATH of a status effect to remove.
 * Additional status effect arguments can be passed - these are passed into before_remove.
 *
 * Returns TRUE if at least one was removed.
 */
/mob/living/simple_animal/fd/lancer/proc/remove_status_effect(datum/mech_status/removed_effect, ...)
	var/list/arguments = args.Copy(2)

	. = FALSE
	for(var/datum/mech_status/existing_effect as anything in status_effects)
		if(existing_effect.name == initial(removed_effect.name) && existing_effect.before_remove(arguments))
			qdel(existing_effect)
			. = TRUE

	return .

/**
 * Checks if this mob has a status effect that shares the passed effect's ID
 *
 * checked_effect - TYPEPATH of a status effect to check for. Checks for its ID, not it's typepath
 *
 * Returns an instance of a status effect, or NULL if none were found.
 */
/mob/proc/get_status_effect(datum/mech_status/checked_effect)
	// Yes I'm being cringe and putting this on the mob level even though status effects only apply to the living level
	// There's quite a few places (namely examine and, bleh, cult code) where it's easier to not need to cast to living before checking
	// for an effect such as blindness
	return null

/mob/living/simple_animal/fd/lancer/get_status_effect(datum/mech_status/checked_effect)
	RETURN_TYPE(/datum/mech_status)

	for(var/datum/mech_status/present_effect as anything in status_effects)
		if(present_effect.name == initial(checked_effect.name))
			return present_effect

	return null

/**
 * Returns a list of all status effects that share the passed effect type's ID
 *
 * checked_effect - TYPEPATH of a status effect to check for. Checks for its ID, not it's typepath
 *
 * Returns a list
 */
/mob/proc/get_status_effect_list(datum/mech_status/checked_effect)
	// See [/mob/proc/get_status_effect] for reason behind having this on the mob level
	return null

/mob/living/simple_animal/fd/lancer/get_status_effect_list(datum/mech_status/checked_effect)
	RETURN_TYPE(/list)

	var/list/effects_found = list()
	for(var/datum/mech_status/present_effect as anything in status_effects)
		if(present_effect.name == initial(checked_effect.name))
			effects_found += present_effect

	return effects_found
