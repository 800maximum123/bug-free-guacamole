// These involve BYOND's built in filters that do visual effects, and not stuff that distinguishes between things.

// All of this ported from TG.
// And then ported to Nebula from Polaris.
/atom
	var/list/filter_data // For handling persistent filters

/proc/cmp_filter_data_priority(list/A, list/B)
	return A["priority"] - B["priority"]

/image/proc/add_filter(filter_name, priority, list/params)
	filters += filter(arglist(params))

/*// Defining this for future proofing and ease of searching for erroneous usage.

/atom/movable/proc/add_filter(filter_name, priority, list/params)
	var/list/p = params.Copy()
	p["priority"] = priority
	LAZYSET(filter_data, filter_name, p)
	update_filters()

/atom/movable/proc/update_filters()
	filters = null
	filter_data = sortTim(filter_data, /proc/cmp_filter_data_priority, TRUE)
	for(var/f in filter_data)
		var/list/data = filter_data[f]
		var/list/arguments = data.Copy()
		arguments -= "priority"
		filters += filter(arglist(arguments))
	UPDATE_OO_IF_PRESENT

/atom/movable/proc/get_filter(filter_name)
	var/filter_index = filter_data?.Find(filter_name)
	if(filter_index > 0 && filter_index <= length(filters))
		return filters[filter_index]

// Polaris Extensions
/atom/movable/proc/remove_filter(filter_name)
	var/thing = get_filter(filter_name)
	if(thing)
		LAZYREMOVE(filter_data, filter_name)
		filters -= thing
		update_filters()

*/

/atom/proc/add_filter(name,priority,list/params)
	LAZYINITLIST(filter_data)
	var/list/p = params.Copy()
	p["priority"] = priority
	filter_data[name] = p
	update_filters()

/atom/proc/update_filters()
	filters = null
	filter_data = sortTim(filter_data, GLOBAL_PROC_REF(cmp_filter_data_priority), TRUE)
	for(var/f in filter_data)
		var/list/data = filter_data[f]
		var/list/arguments = data.Copy()
		arguments -= "priority"
		filters += filter(arglist(arguments))
	UNSETEMPTY(filter_data)

/// Animate a given filter on this atom. All params after the first are passed to animate().
/atom/movable/proc/animate_filter(filter_name, list/params)
	if (!filter_data || !filter_data[filter_name])
		return

	var/list/monkeypatched_params = params.Copy()
	monkeypatched_params.Insert(1, null)
	var/index = filter_data.Find(filter_name)

	// First, animate ourselves.
	monkeypatched_params[1] = filters[index]
	animate(arglist(monkeypatched_params))

	// If we're being copied by Z-Mimic, update mimics too.
	if (bound_overlay)
		for (var/atom/movable/AM as anything in get_above_oo())
			monkeypatched_params[1] = AM.filters[index]
			animate(arglist(monkeypatched_params))

/** Update a filter's parameter and animate this change. If the filter doesnt exist we won't do anything.
 * Basically a [datum/proc/modify_filter] call but with animations. Unmodified filter parameters are kept.
 *
 * Arguments:
 * * name - Filter name
 * * new_params - New parameters of the filter
 * * time - time arg of the BYOND animate() proc.
 * * easing - easing arg of the BYOND animate() proc.
 * * loop - loop arg of the BYOND animate() proc.
 */
/atom/proc/transition_filter(name, list/new_params, time, easing, loop)
	var/filter = get_filter(name)
	if(!filter)
		return

	var/list/old_filter_data = filter_data[name]

	var/list/params = old_filter_data.Copy()
	for(var/thing in new_params)
		params[thing] = new_params[thing]

	animate(filter, new_params, time = time, easing = easing, loop = loop)
	for(var/param in params)
		filter_data[name][param] = params[param]

/atom/proc/change_filter_priority(name, new_priority)
	if(!filter_data || !filter_data[name])
		return

	filter_data[name]["priority"] = new_priority
	update_filters()

/*/obj/item/update_filters()
	. = ..()
	for(var/X in actions)
		var/datum/action/A = X
		A.UpdateButtonIcon()*/

/atom/proc/get_filter(name)
	if(filter_data && filter_data[name])
		return filters[filter_data.Find(name)]

/atom/proc/remove_filter(name_or_names)
	if(!filter_data)
		return

	var/found = FALSE
	var/list/names = islist(name_or_names) ? name_or_names : list(name_or_names)

	for(var/name in names)
		if(filter_data[name])
			filter_data -= name
			found = TRUE

	if(found)
		update_filters()

/atom/proc/clear_filters()
	filter_data = null
	filters = null
