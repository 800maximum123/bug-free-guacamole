/datum/simple_status
	/// Название эффекта. Выставить на null, если не должен отображатся при сканировании.
	var/name = "Лигма"
	var/desc_text = "У него Лигма"

	/// Цвет имени эффекта в окне сканирования.
	var/status_color = COLOR_DARKMODE_TEXT

	/// Тип эффекта, см. _defines.dm
	var/status_type = STATUS_EFFECT_ADJUST

	/// Длительность эффекта, может выставлятся в on_creation()
	var/duration = -1
	/// Установлена ли уже длительность?
	var/duration_set = FALSE

	/// Стоит ли удалять эффект при входе в крит?
	var/delete_if_uncon = FALSE

	/// A list of all sources applying this status effect. Sources are a list of keys
	var/list/sources = list()

	/// Референс к владельцу
	var/mob/living/owner

	/// Таймер конца эффекта
	var/timerid

/image/healthinfo
/mob/living
	var/list/healthchecking = list()
	var/hidehealinfo = FALSE

	var/list/datum/simple_status/status_effects

/mob/living/proc/show_healthinfo(mob/living/A)
	if(!client || (A in revealed_hints))
		return

	var/image/healthinfo/healthinfo = new /image/healthinfo('mods/_fd/fd_events/icons/simple_vfx_statuses.dmi', A, "healthinfo", layer = HUD_PLANE)

	healthinfo.alpha = 0
	healthinfo.pixel_x = pixel_x - 10
	healthinfo.plane = HUD_PLANE

	healthinfo.maptext_x = 32
	healthinfo.maptext_height = 192
	healthinfo.maptext_width = 192

	healthinfo.maptext = STYLE_SMALLFONTS_OUTLINE("|Здоров|<br>", 7, COLOR_LIME, COLOR_BLACK)

	if(A.simple_health < A.max_simple_health && A.simple_health > A.max_simple_health / 1.2)
		healthinfo.maptext = STYLE_SMALLFONTS_OUTLINE("|Слегка потрёпан|<br>", 7, COLOR_GREEN, COLOR_BLACK)
	if(A.simple_health < A.max_simple_health / 1.2 && A.simple_health > A.max_simple_health / 1.5)
		healthinfo.maptext = STYLE_SMALLFONTS_OUTLINE("|Выглядит неважно|<br>", 7, COLOR_GOLD, COLOR_BLACK)
	if(A.simple_health < A.max_simple_health / 1.5 && A.simple_health > A.max_simple_health / 2)
		healthinfo.maptext = STYLE_SMALLFONTS_OUTLINE("|Ранен|<br>", 7, COLOR_SUN, COLOR_BLACK)
	if(A.simple_health < A.max_simple_health / 2 && A.simple_health > A.max_simple_health / 4)
		healthinfo.maptext = STYLE_SMALLFONTS_OUTLINE("|Тяжело ранен|<br>", 7, COLOR_RED, COLOR_BLACK)
	if(A.simple_health < A.max_simple_health / 4 && A.simple_health > A.max_simple_health / 8)
		healthinfo.maptext = STYLE_SMALLFONTS_OUTLINE("|При смерти!|<br>", 7, COMMS_COLOR_ICCG, COLOR_BLACK)
	if(A.simple_health <= 0)
		healthinfo.maptext = STYLE_SMALLFONTS_OUTLINE("|. . .|<br><br>", 7, COMMS_COLOR_ICCG, COLOR_BLACK)

	for(var/datum/simple_status/effect in A.status_effects)
		if(effect.desc_text)
			healthinfo.maptext += STYLE_SMALLFONTS_OUTLINE("[effect.desc_text]<br>", 7, effect.status_color, COLOR_BLACK)

	animate(healthinfo, alpha = 255, pixel_x = src.pixel_x, time = 0.3 SECONDS, easing = SINE_EASING|EASE_OUT, ANIMATION_PARALLEL)

	client.images += healthinfo
	healthchecking[A] = healthinfo

/mob/living/proc/hide_healthinfo(mob/living/A)
	if(!client || !(A in healthchecking))
		return

	var/image/healthinfo/healthinfo = healthchecking[A]

	animate(healthinfo, alpha = 0, pixel_x = src.pixel_x, time = 0.3 SECONDS, easing = SINE_EASING|EASE_IN)

	spawn(0.3 SECONDS)
		if(client)
			client.images -= healthinfo
		healthchecking -= A

/// Дополнительная информация после осмотра владельца, диктуемая этим эффектом
/mob/living/examine(mob/user, distance)
	if(isliving(user))
		var/mob/living/L = user
		if(L.simple_combat_on)
			if(simple_combat_on && isliving(src))
				if(!(src in L.healthchecking))
					L.show_healthinfo(src)
					addtimer(new Callback(L, PROC_REF(hide_healthinfo), src), 5 SECONDS)
				else
					L.hide_healthinfo(src)

	. = ..()

/mob/living/carbon/human/examine(mob/user, distance)
	if(isliving(user))
		var/mob/living/L = user
		if(L.simple_combat_on)
			if(simple_combat_on && isliving(src))
				if(!(src in L.healthchecking))
					L.show_healthinfo(src)
					addtimer(new Callback(L, PROC_REF(hide_healthinfo), src), 5 SECONDS)
				else
					L.hide_healthinfo(src)

	. = ..()

/datum/simple_status/New(...)
	on_creation(arglist(args))

/datum/simple_status/proc/on_creation(mob/living/new_owner, new_duration, new_status_type, source, ...)
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

	START_PROCESSING(SSobj, src)

	update_timer()
	return TRUE

/datum/simple_status/Destroy()
	if(timerid)
		deltimer(timerid)
	STOP_PROCESSING(SSobj, src)
	if(owner)
		LAZYREMOVE(owner.status_effects, src)
		on_remove()
		owner = null
	return ..()

/datum/simple_status/Process()
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
/datum/simple_status/proc/update_timer(force_refresh = FALSE)
	if(duration == -1 || duration <= world.time) // infinite or expired
		return
	else if(duration - world.time <= 2 SECONDS)
		if(!timerid || force_refresh)
			timerid = addtimer(new Callback(src, PROC_REF(timer_callback)), duration - world.time, TIMER_OVERRIDE|TIMER_UNIQUE|TIMER_STOPPABLE|TIMER_NO_HASH_WAIT)
	else if(timerid)
		deltimer(timerid)
		timerid = null

/// Timer invocation callback to end the effect
/datum/simple_status/proc/timer_callback()
	if(timerid)
		timerid = null
	qdel(src) // shrimple as that

/// Called when the effect is applied in on_created
/// Returning FALSE will cause it to delete itself during creation instead.
/datum/simple_status/proc/on_apply()
	return TRUE

/**
* Called every tick from process().
*/
/datum/simple_status/proc/tick()
	return

/// Called whenever the buff expires or is removed (qdeleted)
/// Note that at the point this is called, it is out of the
/// owner's status_effects list, but owner is not yet null
/datum/simple_status/proc/on_remove()
	return

/// Called instead of on_remove when a status effect
/// of status_type STATUS_EFFECT_REPLACE is replaced by itself,
/// or when a status effect with on_remove_on_mob_delete
/// set to FALSE has its mob deleted
/datum/simple_status/proc/be_replaced()
	LAZYREMOVE(owner.status_effects, src)
	owner = null
	qdel(src)

/// Called before being fully removed (before on_remove)
/// Returning FALSE will cancel removal
/datum/simple_status/proc/before_remove(source)
	if(status_type != STATUS_EFFECT_SOURCED)
		return TRUE
	sources -= source
	return !length(sources)

/// Called when a status effect of status_type STATUS_EFFECT_REFRESH
/// has its duration refreshed in add_status_effect - is passed New() args
/datum/simple_status/proc/refresh(effect, new_duration, new_status_type, source, ...)
	var/original_duration = initial(duration)
	if(original_duration == -1)
		return
	duration = world.time + original_duration
	update_timer(force_refresh = TRUE)

/// Adds nextmove modifier multiplicatively to the owner while applied
/datum/simple_status/proc/nextmove_modifier()
	return 1

/// Adds nextmove adjustment additiviely to the owner while applied
/datum/simple_status/proc/nextmove_adjust()
	return 0

/// Updates the duration of the status effect to the given [amount] of deciseconds from now, qdeling / ending if we eclipse the current world time.
/// If increment is truthy, we only update if the resulting amount is higher.
/datum/simple_status/proc/update_duration(amount, increment = FALSE)
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
/datum/simple_status/proc/add_duration(amount)
	if(!duration_set)
		duration += amount
		return FALSE
	if(duration == -1)
		return FALSE
	var/remaining = duration - world.time
	remaining += amount
	return update_duration(remaining)

/datum/simple_status/proc/adjust_duration(amount)
	if(amount < 0)
		add_duration(amount)
	else
		update_duration(amount, TRUE)
	return

/// Remove [amount] of duration (in deciseconds) from the status effect. Compatibility handler with /tg/.
/datum/simple_status/proc/remove_duration(amount)
	add_duration(-amount)

/// Get duration left on the effect
/datum/simple_status/proc/get_duration_left()
	if(!duration_set)
		return -1
	var/remaining = duration - world.time
	if(remaining < 0)
		return -1
	return remaining

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

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
/mob/living/proc/add_status_effect(datum/simple_status/new_effect, new_duration, new_status_type, source, ...)
	RETURN_TYPE(/datum/simple_status)

	// The arguments we pass to the start effect. The 1st argument is this mob.
	var/list/arguments = args.Copy()
	arguments[1] = src

	if(!new_status_type)
		new_status_type = initial(new_effect.status_type)

	if(!source)
		source = src

	// If the status effect we're applying doesn't allow multiple effects, we need to handle it
	if(new_status_type != STATUS_EFFECT_MULTIPLE)
		for(var/datum/simple_status/existing_effect as anything in status_effects)
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
	var/datum/simple_status/new_instance = new new_effect(arglist(arguments))
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
/mob/living/proc/remove_status_effect(datum/simple_status/removed_effect, ...)
	var/list/arguments = args.Copy(2)

	. = FALSE
	for(var/datum/simple_status/existing_effect as anything in status_effects)
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
/mob/proc/get_status_effect(datum/simple_status/checked_effect)
	// Yes I'm being cringe and putting this on the mob level even though status effects only apply to the living level
	// There's quite a few places (namely examine and, bleh, cult code) where it's easier to not need to cast to living before checking
	// for an effect such as blindness
	return null

/mob/living/get_status_effect(datum/simple_status/checked_effect)
	RETURN_TYPE(/datum/simple_status)

	for(var/datum/simple_status/present_effect as anything in status_effects)
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
/mob/proc/get_status_effect_list(datum/simple_status/checked_effect)
	// See [/mob/proc/get_status_effect] for reason behind having this on the mob level
	return null

/mob/living/get_status_effect_list(datum/simple_status/checked_effect)
	RETURN_TYPE(/list)

	var/list/effects_found = list()
	for(var/datum/simple_status/present_effect as anything in status_effects)
		if(present_effect.name == initial(checked_effect.name))
			effects_found += present_effect

	return effects_found

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/datum/simple_status/crit
	name = "Критически ранен"
	desc_text = "- Он едва дышит. . ."
	status_type = STATUS_EFFECT_UNIQUE
	status_color = COMMS_COLOR_ICCG

/datum/simple_status/crit/on_apply()
	. = ..()

	owner.appearance_flags |= KEEP_TOGETHER
	owner.overlay_fullscreen("dead",/obj/screen/fullscreen/underworld_vision)
	animate(owner, transform = matrix(90, MATRIX_ROTATE), time = 5, easing = SINE_EASING|EASE_IN)

	new /obj/effect/simple_combat_particle/downed(owner.loc)

	owner.add_filter("wounded", 1, list("type" = "outline", , "size" = 0, "color" = COLOR_RED))
	owner.animate_filter("wounded", list(time = 10, size = 1))

	owner.regen_period += 110

/datum/simple_status/crit/tick()
	. = ..()

	owner.SetTransform(1,0,0,90)

	if(!owner.get_filter("wounded"))
		owner.add_filter("wounded", 1, list("type" = "outline", , "size" = 1, "color" = COLOR_RED))

/datum/simple_status/crit/on_remove()
	. = ..()

	owner.animate_filter("wounded", list(time = 10, size = 0))
	spawn(5)
		owner.remove_filter("wounded")

	owner.clear_fullscreen("dead")
	animate(owner, transform = matrix(0, MATRIX_ROTATE), time = 5, easing = SINE_EASING|EASE_IN)

/datum/simple_status/hardcrit
	name = "Умирает"
	desc_text = "- Ещё чуть-чуть и всё. . ."
	status_type = STATUS_EFFECT_UNIQUE
	status_color = COMMS_COLOR_ICCG

/datum/simple_status/hardcrit/on_apply()
	. = ..()

	owner.appearance_flags |= KEEP_TOGETHER

	owner.add_client_color(/datum/client_color/noir)
	owner.update_client_color()

	owner.can_speak = FALSE
	owner.SetWeakened(999)

	owner.add_filter("dead", 1, list("type" = "outline", , "size" = 0, "color" = COLOR_BLACK))
	owner.animate_filter("dead", list(time = 10, size = 2))

	owner.regen_period = 999

/datum/simple_status/hardcrit/tick()
	. = ..()

	if(!owner.get_filter("dead"))
		owner.add_filter("dead", 1, list("type" = "outline", , "size" = 2, "color" = COLOR_BLACK))

/datum/simple_status/hardcrit/on_remove()
	. = ..()

	owner.animate_filter("dead", list(time = 10, size = 0))
	spawn(5)
		owner.remove_filter("dead")

	owner.remove_client_color(/datum/client_color/noir)
	owner.update_client_color()

	owner.can_speak = TRUE
	owner.SetWeakened(0)

	if(!owner.stabilized)
		owner.adjustOxyLoss(owner.maxHealth)
		owner.setBrainLoss(owner.maxHealth)

	else
		owner.pre_death = FALSE
		owner.stabilized = FALSE

/datum/simple_status/bleed
	name = "Кровотечение"
	desc_text = "- Из его ран сочится кровь"
	status_type = STATUS_EFFECT_REFRESH
	status_color = COLOR_RED
	duration = 0

/datum/simple_status/bleed/tick()
	. = ..()

	owner.simple_health_calculation(5, 0, 0, 0)
	new /obj/effect/simple_combat_particle/bleeding(owner.loc)

	var/obj/decal/cleanable/blood/B = blood_splatter(get_step(owner, SOUTH), owner, 0, SOUTH)
	B.icon_state = "dir_splatter_1"
	B.SetTransform(0.5)

	if(ishuman(owner))
		var/mob/living/carbon/human/H = owner
		var/obj/temp_visual/bloodsplatter/splat = new /obj/temp_visual/bloodsplatter(owner.loc, SOUTH, H.species.blood_color)
		splat.layer = ABOVE_HUMAN_LAYER
		splat.SetTransform(0.5)
	else
		var/obj/temp_visual/bloodsplatter/splat = new /obj/temp_visual/bloodsplatter(owner.loc, SOUTH, owner.bleed_colour)
		splat.layer = ABOVE_HUMAN_LAYER
		splat.SetTransform(0.5)

/datum/simple_status/splinted
	name = "Шина"
	desc_text = "+ Его нога зафиксирована"
	status_type = STATUS_EFFECT_REPLACE
	status_color = COLOR_YELLOW
	duration = 0

/datum/simple_status/splinted/tick()
	. = ..()

	if(!owner.get_status_effect(/datum/simple_status/legbroke))
		owner.remove_status_effect(/datum/simple_status/splinted)

/datum/simple_status/legbroke
	name = "Перелом"
	desc_text = "- Он хромает"
	status_type = STATUS_EFFECT_UNIQUE
	status_color = COLOR_RED

/datum/simple_status/legbroke/on_apply()
	. = ..()

	new /obj/effect/simple_combat_particle/fracture(owner.loc)

/datum/simple_status/fixation
	name = "Схвачен"
	desc_text = "- Скован"
	status_type = STATUS_EFFECT_UNIQUE
	status_color = COLOR_RED

/datum/simple_status/fixation/on_apply()
	. = ..()

	owner.appearance_flags |= KEEP_TOGETHER
	new /obj/effect/simple_combat_particle/zzaped(owner.loc)

	owner.add_filter("anchored", 1, list("type" = "outline", , "size" = 0, "color" = COLOR_GRAY))
	owner.animate_filter("anchored", list(time = 10, size = 1))

	owner.anchored = TRUE

/datum/simple_status/fixation/tick()
	. = ..()

	owner.anchored = TRUE

/datum/simple_status/fixation/on_remove()
	. = ..()

	owner.animate_filter("anchored", list(time = 10, size = 0))
	spawn(5)
		owner.remove_filter("anchored")

	owner.anchored = FALSE

/datum/simple_status/attack_speed_buff
	name = "Бафф скорости атаки"
	desc_text = null
	status_type = STATUS_EFFECT_UNIQUE

/datum/simple_status/attack_speed_buff/on_apply()
	. = ..()

	if(istype(owner,/mob/living/simple_animal/hostile))
		var/mob/living/simple_animal/hostile/S = owner

		S.attack_delay = 1 SECONDS


/datum/simple_status/attack_speed_buff/tick()
	. = ..()

	if(istype(owner,/mob/living/simple_animal/hostile))
		var/mob/living/simple_animal/hostile/S = owner

		S.attack_delay = 1 SECONDS

/datum/simple_status/attack_speed_buff/on_remove()
	. = ..()

	if(istype(owner,/mob/living/simple_animal/hostile))
		var/mob/living/simple_animal/hostile/S = owner

		S.attack_delay = initial(S.attack_delay)
