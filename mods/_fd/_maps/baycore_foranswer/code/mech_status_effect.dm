/datum/mech_status
	var/name = "Лигма"

	/// Цвет имени эффекта в окне сканирования. Оставить на null, если эффект должен быть скрыт
	var/effect_color = null

	/// Тип эффекта, см. _defines.dm
	var/status_type = STATUS_EFFECT_ADJUST

	/// Длительность эффекта, может выставлятся в on_creation()
	var/duration = -1
	/// Установлена ли уже длительность?
	var/duration_set = FALSE

	/// A list of all sources applying this status effect. Sources are a list of keys
	var/list/sources = list()

	/// Референс к владельцу
	var/mob/living/simple_animal/fd/lancer/owner

	/// Таймер конца эффекта
	var/timerid

/datum/mech_status/New(...)
	on_creation(arglist(args))

/datum/mech_status/proc/on_creation(mob/living/new_owner, new_duration, new_status_type, source, ...)
	SHOULD_NOT_SLEEP(TRUE) // Don't sleep between duration_set and update_timer
	if(new_owner)
		owner = new_owner
	if(new_duration)
		duration = new_duration
	if(new_status_type)
		status_type = new_status_type
	if(source)
		sources += source
	if(QDELETED(owner) || !on_apply())
		qdel(src)
		return
	if(owner)
		LAZYADD(owner.status_effects, src)

	if(duration != -1)
		duration = world.time + duration
		duration_set = TRUE

	if(duration > world.time) //don't process if we don't care
		START_PROCESSING(SSobj, src)
		update_timer()

	return TRUE

/datum/mech_status/Destroy()
	if(timerid)
		deltimer(timerid)
	STOP_PROCESSING(SSobj, src)
	if(owner)
		LAZYREMOVE(owner.status_effects, src)
		on_remove()
		owner = null
	return ..()

/datum/mech_status/Process()
	SHOULD_NOT_OVERRIDE(TRUE)
	if(QDELETED(owner))
		qdel(src)
		return
	tick()

	// Timer and update procs should basically always handle this, it's a safety net
	if(!timerid && duration != -1 && duration < world.time)
		qdel(src)
	else
		update_timer() // Attempt to start up end timer

/// Updates the timer used for precisely ending the effect
/// We force_refresh if the duration changed otherwise than ticking down
/datum/mech_status/proc/update_timer(force_refresh = FALSE)
	if(duration == -1 || duration <= world.time) // infinite or expired
		return
	else if(duration - world.time <= 2 SECONDS)
		if(!timerid || force_refresh)
			timerid = addtimer(new Callback(src, PROC_REF(timer_callback)), duration - world.time, TIMER_OVERRIDE|TIMER_UNIQUE|TIMER_STOPPABLE|TIMER_NO_HASH_WAIT)
	else if(timerid)
		deltimer(timerid)
		timerid = null

/// Timer invocation callback to end the effect
/datum/mech_status/proc/timer_callback()
	if(timerid)
		timerid = null
	qdel(src) // shrimple as that

/// Called when the effect is applied in on_created
/// Returning FALSE will cause it to delete itself during creation instead.
/datum/mech_status/proc/on_apply()
	return TRUE

/datum/mech_status/proc/get_scan_info()
	if(effect_color)
		return FONT_NORMAL(SPAN_COLOR(effect_color, "<br>" + name))
	return ""

/**
 * Called every tick from process().
 * This is only called of tick_interval is not -1.
 *
 * Note that every tick =/= every processing cycle.
 *
 * * seconds_between_ticks = This is how many SECONDS that elapse between ticks.
 * This is a constant value based upon the initial tick interval set on the status effect.
 * It is similar to seconds_per_tick, from processing itself, but adjusted to the status effect's tick interval.
 */
/datum/mech_status/proc/tick()
	return

/// Called whenever the buff expires or is removed (qdeleted)
/// Note that at the point this is called, it is out of the
/// owner's status_effects list, but owner is not yet null
/datum/mech_status/proc/on_remove()
	return

/// Called instead of on_remove when a status effect
/// of status_type STATUS_EFFECT_REPLACE is replaced by itself,
/// or when a status effect with on_remove_on_mob_delete
/// set to FALSE has its mob deleted
/datum/mech_status/proc/be_replaced()
	LAZYREMOVE(owner.status_effects, src)
	owner = null
	qdel(src)

/// Called before being fully removed (before on_remove)
/// Returning FALSE will cancel removal
/datum/mech_status/proc/before_remove(source)
	if(status_type != STATUS_EFFECT_SOURCED)
		return TRUE
	sources -= source
	return !length(sources)

/// Called when a status effect of status_type STATUS_EFFECT_REFRESH
/// has its duration refreshed in add_status_effect - is passed New() args
/datum/mech_status/proc/refresh(effect, new_duration, new_status_type, source, ...)
	var/original_duration = initial(duration)
	if(original_duration == -1)
		return
	duration = world.time + original_duration
	update_timer(force_refresh = TRUE)

/// Adds nextmove modifier multiplicatively to the owner while applied
/datum/mech_status/proc/nextmove_modifier()
	return 1

/// Adds nextmove adjustment additiviely to the owner while applied
/datum/mech_status/proc/nextmove_adjust()
	return 0

/// Updates the duration of the status effect to the given [amount] of deciseconds from now, qdeling / ending if we eclipse the current world time.
/// If increment is truthy, we only update if the resulting amount is higher.
/datum/mech_status/proc/update_duration(amount, increment = FALSE)
	if(!duration_set)  // Barebones setter for before we start everything up
		if(increment)
			duration = max(duration, amount)
		else
			duration = amount
		return FALSE
	if(duration == -1) // Infinite duration
		return FALSE
	var/new_duration = world.time + amount
	if(increment && duration >= new_duration)
		return FALSE
	duration = new_duration
	if(duration <= world.time)
		qdel(src)
		return TRUE
	update_timer(force_refresh = TRUE)
	return FALSE

/// Updates the duration of the status effect to the given [amount] of deciseconds from its current set ending
/datum/mech_status/proc/add_duration(amount)
	if(!duration_set)
		duration += amount
		return FALSE
	if(duration == -1)
		return FALSE
	var/remaining = duration - world.time
	remaining += amount
	return update_duration(remaining)

/datum/mech_status/proc/adjust_duration(amount)
	if(!duration_set)
		duration = amount
		return FALSE
	if(duration == -1)
		return FALSE
	var/longest_duration = max(duration, world.time + amount)
	return update_duration(longest_duration)

/// Remove [amount] of duration (in deciseconds) from the status effect. Compatibility handler with /tg/.
/datum/mech_status/proc/remove_duration(amount)
	add_duration(-amount)

/// Get duration left on the effect
/datum/mech_status/proc/get_duration_left()
	if(!duration_set)
		return -1
	var/remaining = duration - world.time
	if(remaining < 0)
		return -1
	return remaining
