/proc/length_no_nulls(list/list)
	var/list/list_copy = list.Copy()
	for(var/thing in list)
		if(isnull(thing))
			list_copy -= null

	return length(list_copy)
