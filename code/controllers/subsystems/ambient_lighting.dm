SUBSYSTEM_DEF(ambient_lighting) //A simple SS that handles updating ambient lights of away sites and such places
	name = "Ambient Lighting"
	wait = 1
	priority = SS_PRIORITY_LIGHTING
	init_order = SS_INIT_AMBIENT_LIGHT
	runlevels = RUNLEVELS_PREGAME | RUNLEVELS_GAME

	/// List of turfs queued for ambient light evaluation
	var/list/queued = list()

	/// A bitmap of free ambience group indexes.
	var/ambient_group_free_bitmap = ~0
	/// map of ambiient groups
	var/list/ambient_groups[AMBIENT_GROUP_MAX_BITS]

/datum/ambient_group
	var/name = "Ambient Group"
	/// Index in SSambient_lighting map
	var/global_index
	var/list/member_turfs_by_z = list()
	/// Color data, do NOT modify manually
	var/apparent_r
	var/apparent_g
	var/apparent_b
	/// Prevent modification of member turfs or colour while an operation is taking place
	var/busy = FALSE
	/// What area the group is associated with?
	var/area/ambient_area

/datum/ambient_group/New(ncolor, nmultiplier, nindex, area/_type, name)
	. = ..()
	set_color(ncolor, nmultiplier)
	global_index = nindex
	ambient_area = _type
	name = name

/datum/ambient_group/Destroy()
	SSambient_lighting.ambient_groups[global_index] = null
	SSambient_lighting.ambient_group_free_bitmap |= FLAG(global_index)
	return ..()

/datum/ambient_group/proc/set_color(color, multiplier)
	var/list/new_parts = rgb2num(color)
	//Calculate delta from current to desired location
	var/dr = (new_parts[1] / 255) * multiplier - apparent_r
	var/dg = (new_parts[2] / 255) * multiplier - apparent_g
	var/db = (new_parts[3] / 255) * multiplier - apparent_b

	if (round(dr/4, LIGHTING_ROUND_VALUE) == 0 && round(dg/4, LIGHTING_ROUND_VALUE) == 0 && round(db/4, LIGHTING_ROUND_VALUE) == 0)
		// no-op
		return

	busy = TRUE

	// Doing it ordered by zlev should ensure that it looks vaguely coherent mid-update regardless of turf insertion order.
	for (var/zlev in 1 to length(member_turfs_by_z))
		for (var/turf/T as anything in member_turfs_by_z[zlev])
			T.add_ambient_light_raw(dr, dg, db)
			CHECK_TICK

	apparent_r += dr
	apparent_g += dg
	apparent_b += db

	busy = FALSE

/**
 * Adds group ambient light to a turf
 *
 * **Parameters**:
 * - `T` turf - Turf to modify
 *
 */
/datum/ambient_group/proc/set_ambient_light(turf/T)
	set waitfor = FALSE

	UNTIL(!busy)
	T.add_ambient_light_raw(apparent_r, apparent_g, apparent_b)

/**
 * Removes group ambient light from turf
 *
 * **Parameters**:
 * - `T` turf - Turf to modify
 *
 */
/datum/ambient_group/proc/remove_ambient_light(turf/T)
	set waitfor = FALSE

	UNTIL(!busy)
	T.add_ambient_light_raw(-apparent_r, -apparent_g, -apparent_b)

/**
 * Adds turf to ambient group, will set bitflags and set current ambient light
 *
 * **Parameters**:
 * - `T` turf - Turf to add and track
 *
 */
/datum/ambient_group/proc/add_turf(turf/T)
	set waitfor = FALSE

	UNTIL(!busy)
	//Already existing
	if(T.ambient_bitflag & FLAG(global_index))
		return

	if (T.z > length(member_turfs_by_z))
		member_turfs_by_z.len = T.z

	LAZYADD(member_turfs_by_z[T.z], T)
	T.ambient_bitflag |= FLAG(global_index)
	set_ambient_light(T)

/**
 * Removes turf from ambient group if it is part of it. Removes group's ambient light and flag from turf
 *
 * **Parameters**:
 * - `T` turf - Turf to remove
 *
 */
/datum/ambient_group/proc/remove_turf(turf/T)
	set waitfor = FALSE

	UNTIL(!busy)
	if(!(T.ambient_bitflag & FLAG(global_index)))
		return

	if (T.z > length(member_turfs_by_z))
		CRASH("Attempt to remove member turf with Z greater than local max -- this turf is not a member")

	remove_ambient_light(T)
	T.ambient_bitflag &= ~FLAG(global_index)
	member_turfs_by_z[T.z] -= T

/**
 * Find a valid index in the ambient group map for a new group
 *
 * Returns index or -1 if no indices are left
 */
/datum/controller/subsystem/ambient_lighting/proc/allocate_index()
	if (ambient_group_free_bitmap == 0)
		return -1 //Out of indices, no ambient light for you

	// Find the first free index in the bitmap.
	var/index = 1
	while (!(ambient_group_free_bitmap & FLAG(index)) && index < AMBIENT_GROUP_MAX_BITS)
		index += 1

	ambient_group_free_bitmap &= ~FLAG(index)

	return index
/**
 * Adds the space ambient group if it doesn't currently exist
 *
 */
/datum/controller/subsystem/ambient_lighting/proc/add_space_ambient_group()
	var/index = allocate_index() //It will always be 1, but we want to make sure bitmap is in a valid state

	ASSERT(index == SPACE_AMBIENT_GROUP)

	ambient_groups[index] = new /datum/ambient_group(SSskybox.background_color, config.starlight, index, name = "Space Ambient Group")

/**
 * Removes turf from ambient group if it is part of it. Removes group's ambient light and flag from turf
 *
 * **Parameters**:
 * - `color` color - Initial color
 * - `multiplier` float - Initial multiplier of light strength
 * - `area/_type` type - What area its associated with? (optional)
 * - `name` string - Name of the ambient group
 *
 * Returns index or -1 if no indices are left
 */
/datum/controller/subsystem/ambient_lighting/proc/create_ambient_group(color, multiplier, area/_type, name)

	if(isnull(ambient_groups[SPACE_AMBIENT_GROUP])) //Something (probably a planet) wants to add an ambient group, add space first
		add_space_ambient_group()

	// Find the first free index in the bitmap.
	var/index = allocate_index()

	if(index <= 0)
		return index

	ambient_groups[index] = new /datum/ambient_group(color, multiplier, index, _type, name)

	return index

/datum/controller/subsystem/ambient_lighting/proc/create_area_ambient_group(area/_type, color, multiplier)
	if(_type == null)
		return -1

	var/index = get_area_ambient_group(_type)
	if(index > 0)
		return index

	index = create_ambient_group(color, multiplier, _type, "[_type.name] Ambient Group")

	return index

/datum/controller/subsystem/ambient_lighting/proc/get_area_ambient_group(area/A)
	for(var/datum/ambient_group/choosen in ambient_groups)
		if (choosen)
			// ambient_area may be stored as a type, while callers may pass either
			// an area instance or a type. Match either exact equality for types
			// or `istype()` for instances.
			if (A == choosen.ambient_area || istype(A, choosen.ambient_area))
				return choosen.global_index

	return -1

/datum/controller/subsystem/ambient_lighting/proc/update_area_sun(area/_type, daycycle, sun_brightness_modifier = 1.0)
	var/group_index = get_area_ambient_group(_type)
	if (group_index <= 0)
		if (_type && _type.ambient_group_enabled && _type.ambient_group_type && _type.ambient_group_color)
			group_index = create_area_ambient_group(_type.ambient_group_type, _type.ambient_group_color, _type.ambient_group_multiplier)
		if (group_index <= 0)
			return FALSE // no ambient group available for this area type
	if(sun_last_process == world.time) //For now, calling it several times in same frame is not valid. Add a parameter to ignore this if weather is added
		return
	sun_last_process = world.time

	var/time_of_day = (world.time % daycycle) / daycycle //0 to 1 range.
	var/distance_from_night = abs(time_of_day - 0.5)
	var/sun_position = distance_from_night / 0.5 // 0 to 1 range
	sun_position = abs(sun_position - 1)

	var/low_brightness = null
	var/high_brightness = null
	var/low_color = null
	var/high_color = null
	var/min = 0
	var/max = 0

	// Yes night and noon are swapped around unlike the _exoplanet.dm one
	// I had to do it so all missions start at the Noon
	// If we ever want them to start at the night I guess you can manually replace the positions
	switch(sun_position)
		if(0 to 0.40) // Noon
			low_brightness = 0.8
			low_color = "#dddddd"
			high_brightness = 1.0
			high_color = "#ffffff"
			min = 0.70
			max = 1.0

		if(0.40 to 0.50) // Sunrise/set
			low_brightness = 0.5
			low_color = "#cc3300"
			high_brightness = 0.8
			high_color = "#ff9933"
			min = 0.50
			max = 0.70

		if(0.50 to 0.70) // Twilight
			low_brightness = 0.2
			low_color = "#66004d"
			high_brightness = 0.5
			high_color = "#cc3300"
			min = 0.40
			max = 0.50

		if(0.70 to 1.00) // Night
			low_brightness = 0.01
			low_color = "#000066"
			high_brightness = 0.2
			high_color = "#66004d"
			min = 0
			max = 0.4

	var/interpolate_weight = (sun_position - min) / (max - min)
	var/new_brightness = (Interpolate(low_brightness, high_brightness, interpolate_weight)) * sun_brightness_modifier
	var/new_color = UNLINT(gradient(low_color, high_color, space = COLORSPACE_HSV, index=interpolate_weight))

	var/datum/ambient_group/A = ambient_groups[group_index]
	A.set_color(new_color, new_brightness)

	return TRUE

/**
 * Removes turf from all ambient groups it is part of (if any)
 *
 * **Parameters**:
 * - `target` turf - Turf to remove
 */
/datum/controller/subsystem/ambient_lighting/proc/clean_turf(turf/target)
	if(target.ambient_bitflag != 0)
		for(var/datum/ambient_group/A in ambient_groups)
			if(target.ambient_bitflag & FLAG(A.global_index))
				A.remove_turf(target)
			if(!target.ambient_bitflag)
				return //Return early if flag is already clear

/datum/controller/subsystem/ambient_lighting/Initialize(start_timeofday)
	//Create space ambient group if nothing created it until now.
	if(isnull(ambient_groups[SPACE_AMBIENT_GROUP]))
		add_space_ambient_group()

	gaia_initialize_sun()

	fire(FALSE, TRUE)
	return ..()

/// Go over turfs in queue, add them to space or planet ambient groups if valid, else remove them from all ambient groups
/datum/controller/subsystem/ambient_lighting/fire(resumed = FALSE, no_mc_tick = FALSE)
	var/list/curr = queued
	var/starlight_enabled = config.starlight
	// [FD-ADD] - DOH Starlight Override [doh_torch.dm]
	#ifdef STARLIGHT_OFF
	var/starlight_enabled = FALSE
	#endif
	// [/FD-ADD]

	var/needs_ambience
	while (length(curr))
		var/turf/target = curr[length(curr)]
		LIST_DEC(curr)

		if(target && target.is_outside())
			needs_ambience = TURF_IS_DYNAMICALLY_LIT_UNSAFE(target)
			if (!needs_ambience)
				for (var/turf/T in RANGE_TURFS(target, 1))
					if(TURF_IS_DYNAMICALLY_LIT_UNSAFE(T))
						needs_ambience = TRUE
						break

			if (needs_ambience)
				var area_group_index = -1
				var/area/A = isarea(target) ? target : get_step(target, 0)?.loc
				var/skip_ambient_fallback = FALSE
				if (A)
					if (!A.ambient_group_enabled)
						skip_ambient_fallback = TRUE
						if (target.ambient_bitflag != 0)
							for (var/datum/ambient_group/A5 in ambient_groups)
								A5.remove_turf(target)
								if (!target.ambient_bitflag)
									break
					else
						area_group_index = get_area_ambient_group(A)
						if (area_group_index <= 0 && A.ambient_group_type && A.ambient_group_color)
							area_group_index = create_area_ambient_group(A.ambient_group_type, A.ambient_group_color, A.ambient_group_multiplier)

				if (area_group_index > 0)
					var/datum/ambient_group/A2 = ambient_groups[area_group_index]
					A2.add_turf(target)
				else if (!skip_ambient_fallback)
					var/obj/overmap/visitable/sector/exoplanet/E = map_sectors["[target.z]"]
					if (istype(E))
						if(E.ambient_group_index > 0)
							var/datum/ambient_group/A3 = ambient_groups[E.ambient_group_index]
							A3.add_turf(target)
					else
						if (starlight_enabled) //Assume we can light up exterior with space light generally
							var/datum/ambient_group/A4 = ambient_groups[SPACE_AMBIENT_GROUP]
							A4.add_turf(target)
		else if (TURF_IS_AMBIENT_LIT_UNSAFE(target))
			//Remove from all groups
			if(target.ambient_bitflag != 0)
				for(var/datum/ambient_group/A in ambient_groups)
					A.remove_turf(target)
					if(!target.ambient_bitflag)
						break

		if (no_mc_tick)
			CHECK_TICK
		else if (MC_TICK_CHECK)
			return

	// Update Gaia sun cycle
	if(sun_last_process <= (world.time - sun_process_interval) && do_update_gaia)
		update_gaia_sun()
