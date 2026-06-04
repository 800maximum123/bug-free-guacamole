/client/proc/set_ambient_group_color()
	set category = "Fun"
	set name = "Ambient Group Color"

	if(!SSambient_lighting)
		return alert(src, "Ambient lighting subsystem is not available.", "Edit Ambient Group Color")

	var/list/group_choices = list()
	for(var/i = 1; i <= AMBIENT_GROUP_MAX_BITS; i++)
		var/datum/ambient_group/A = SSambient_lighting.ambient_groups[i]
		if(!A)
			continue

		group_choices[A.name] = i

	if(!length(group_choices))
		return alert(src, "No ambient groups exist.", "Edit Ambient Group Color")

	var/group_name = input(src, "Choose an ambient group to edit:", "Ambient Group Selection") as null|anything in group_choices
	if(!group_name)
		return
	var/given_index = group_choices[group_name]

	var/datum/ambient_group/A = SSambient_lighting.ambient_groups[given_index]
	if(!A)
		return alert(src, "Ambient group [given_index] is not valid.", "Edit Ambient Group Color")

	var/list/preset_choices = list("Night (Low)", "Night (High)", "Twilight (Low)", "Twilight (High)", "Sunrise/set (Low)", "Sunrise/set (High)", "Noon (Low)", "Noon (High)", "Custom color")
	var/choice = input(src, "Choose a preset or custom color:", "Ambient Group Color", "Noon (High)") as null|anything in preset_choices
	if(!choice)
		return

	var/color = null
	var/multiplier = 1.0

	switch(choice)
		if("Night (Low)")
			color = "#000066"
			multiplier = 0.01
		if("Night (High)")
			color = "#66004d"
			multiplier = 0.2
		if("Twilight (Low)")
			color = "#66004d"
			multiplier = 0.2
		if("Twilight (High)")
			color = "#cc3300"
			multiplier = 0.5
		if("Sunrise/set (Low)")
			color = "#cc3300"
			multiplier = 0.5
		if("Sunrise/set (High)")
			color = "#ff9933"
			multiplier = 0.8
		if("Noon (Low)")
			color = "#dddddd"
			multiplier = 0.8
		if("Noon (High)")
			color = "#ffffff"
			multiplier = 1.0
		if("Custom color")
			color = input(src, "Choose a color for ambient group [given_index]:", "Ambient Group Color") as null|color
			if(!color)
				return

			var/raw_multiplier = input(src, "Enter a light multiplier for ambient group [given_index]:", "Ambient Group Multiplier", 1.0) as null|num
			if(isnull(raw_multiplier))
				return
			multiplier = clamp(raw_multiplier, 0.0, 10.0)

	A.set_color(color, multiplier)
	log_admin("[key_name(src)] changed ambient group [given_index] to color [color] with multiplier [multiplier]")
	alert(src, "Ambient group [given_index] updated to [color] ×[multiplier].", "Edit Ambient Group Color")

/datum/admins/proc/toggle_gaia_sun_updates()
	set category = "Fun"
	set name = "Toggle Gaia Sun Updates"
	if(!check_rights(R_FUN))
		return

	if(!SSambient_lighting)
		return alert(src, "Ambient lighting subsystem is not available.", "Toggle Gaia Sun Updates")

	SSambient_lighting.do_update_gaia = !SSambient_lighting.do_update_gaia
	var/status = SSambient_lighting.do_update_gaia ? "ENABLED" : "DISABLED"
	log_admin("[key_name(src)] toggled gaia sun updates to [status]")
	message_admins("[key_name_admin(src)] toggled gaia sun updates to [status]", 1)
