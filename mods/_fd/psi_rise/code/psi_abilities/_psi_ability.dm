/datum/psi_ability
	var/name
	var/description
	var/faculty
	var/psi_type

	var/use_sound = 'sound/effects/psi/power_used.ogg'
	var/icon_state = ""

	var/level = 1

	var/invoke_flags

	var/windup
	var/windup_flags = DO_DEFAULT | DO_TARGET_CAN_MOVE | DO_BAR_OVER_USER

	var/cost
	var/upkeep_cost

	/// Must be a number, or everything will and WILL blow up
	var/cooldown = 1 SECONDS

	/// Will procces() for this amount of time after activaton, set to -1 for infinite duration or null for instant cast
	var/duration

	/* BEWARE, NON-CONFIG VARS AHEAD */

	/// Timers
	var/cooldown_end = 0
	var/duration_end = 0

	/// Controls if we should currently Process() with our psi_complexus
	var/active

	/// Refs
	var/datum/psi_complexus/psi_complexus
	var/datum/action/psi/action

	var/mob/living/holder

/datum/psi_ability/New(datum/psi_complexus/psi_complexus, /datum/action/psi/action)
	. = ..()
	src.psi_complexus = psi_complexus
	src.action = action

	src.holder = psi_complexus.owner

/datum/psi_ability/Destroy()
	psi_complexus.remove_ability(src)
	return ..()

/datum/psi_ability/proc/on_button_click(params)
	if(world.time < cooldown_end)
		return FALSE

	if(use_sound)
		playsound(holder.loc, use_sound, 75)

	if(windup && can_pre_use(null, params))
		do_pre_use(null, params)
		if(!do_after(holder, windup, null, windup_flags))
			return FALSE

	if(!can_use(null, params))
		return FALSE

	if(duration)
		if(toggle_active())
			start_duration()
		return TRUE

	if(do_use(null, params))
		psi_complexus.spend_power(cost)
		start_cooldown()
		return TRUE

	return FALSE

/datum/psi_ability/proc/on_target_click(atom/target, params)
	if(world.time < cooldown_end)
		return FALSE

	if(windup && can_pre_use(target, params))
		do_pre_use(target, params)
		if(!do_after(holder, windup, target, windup_flags))
			return FALSE

	if(!can_use(target, params))
		return FALSE

	if(do_use(target, params))
		psi_complexus.spend_power(cost)
		start_cooldown()
		return TRUE

	return FALSE

/datum/psi_ability/Process()
	update_icon()

	if(!active)
		return

	if(!is_continuous() && (world.time < duration_end))
		active = FALSE
		update_icon()
		return

	if(do_use())
		active = FALSE
		start_cooldown()

	if(upkeep_cost && !psi_complexus.spend_power(upkeep_cost))
		active = FALSE
		start_cooldown()

/datum/psi_ability/proc/is_continuous()
	return (duration < 0)

/datum/psi_ability/proc/start_duration()
	if(duration && !is_continuous())
		duration_end = world.time + duration

/datum/psi_ability/proc/start_cooldown()
	cooldown_end = world.time + cooldown
	update_icon()

/datum/psi_ability/proc/toggle_active()
	if(active)
		if(is_continuous())
			active = FALSE
		start_cooldown()
		update_icon()
		return FALSE

	active = TRUE
	update_icon()
	return TRUE

/datum/psi_ability/proc/update_icon()
	if(action)
		action.update_icon()

/datum/psi_ability/proc/can_pre_use(atom/target, params)
	if(target)
		return FALSE
	return TRUE

/datum/psi_ability/proc/do_pre_use(atom/target, params)
	return TRUE

/datum/psi_ability/proc/can_use(atom/target, params)
	return TRUE

/datum/psi_ability/proc/do_use(atom/target, params)
	return TRUE
