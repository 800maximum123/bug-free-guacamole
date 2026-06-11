/datum/map/gaia // setting the map to use this list
	security_state = /singleton/security_state/default/gaiadept

//gaia map alert levels. Refer to security_state.dm.
/singleton/security_state/default/gaiadept
	all_security_levels = list(/singleton/security_level/default/gaiadept/code_green, /singleton/security_level/default/gaiadept/code_blue, /singleton/security_level/default/gaiadept/code_red, /singleton/security_level/default/gaiadept/code_delta)

/singleton/security_level/default/gaiadept
	icon = 'maps/gaia/icons/security_state.dmi'

/singleton/security_level/default/gaiadept/code_green
	name = "business as usual"
	alarm_level = "off"

	light_range = 2
	light_power = 1
	light_color_alarm = COLOR_GREEN
	light_color_status_display = COLOR_GREEN

	overlay_alarm = "alarm_green"
	overlay_status_display = "status_display_green"
	alert_border = "alert_border_green"

	var/static/datum/announcement/priority/security/security_announcement_green = new(do_log = 0, do_newscast = 1, new_sound = sound('sound/misc/notice2.ogg'))

/singleton/security_level/default/gaiadept/code_green/switching_down_to()
	security_announcement_green.Announce("The situation has been resolved, and all citizens can return to their usual activity.", "Attention! Alert level lowered to 'business as usual'.")
	notify_station()

/singleton/security_level/default/gaiadept/code_blue
	name = "terrorism alert"
	alarm_level = "on"

	light_range = 2
	light_power = 1
	light_color_alarm = COLOR_BLUE
	light_color_status_display = COLOR_BLUE
	overlay_alarm = "alarm_blue"
	overlay_status_display = "status_display_blue"
	alert_border = "alert_border_blue"

	up_description = "A high risk of terrorist activity has developed. Citizens must stay tuned for updates and avoid gathering. Thanks for your cooperation."
	down_description = "Terrorism alert procedures are now in effect. Citizens must stay tuned for updates and avoid gathering. Thanks for your cooperation."

/singleton/security_level/default/gaiadept/code_red
	name = "curfew"
	alarm_level = "on"

	light_range = 4
	light_power = 2
	light_color_alarm = COLOR_RED
	light_color_status_display = COLOR_RED
	overlay_alarm = "alarm_red"
	overlay_status_display = "status_display_red"
	alert_border = "alert_border_red"

	up_description = "A curfew has been imposed. All citizens must remain indoors until the situation is resolved, violation of which may result in penalties. Please follow the orders of emergency personnel."

	var/static/datum/announcement/priority/security/security_announcement_red = new(do_log = 0, do_newscast = 1, new_sound = sound('sound/misc/redalert1.ogg'))

/singleton/security_level/default/gaiadept/code_red/switching_up_to()
	security_announcement_red.Announce(up_description, "Attention! Curfew procedures now in effect!")
	notify_station()
	GLOB.using_map.unbolt_saferooms()

/singleton/security_level/default/gaiadept/code_red/switching_down_to()
	security_announcement_red.Announce("A curfew has been imposed. All citizens must remain indoors until the situation is resolved, violation of which may result in penalties. Please follow the orders of emergency personnel.", "Attention! Curfew procedures now in effect!")
	notify_station()

/singleton/security_level/default/gaiadept/code_delta
	name = "NBC alert"
	alarm_level = "on"

	light_range = 4
	light_power = 2
	light_color_alarm = COLOR_RED
	light_color_status_display = COLOR_NAVY_BLUE

	overlay_alarm = "alarm_delta"
	overlay_status_display = "status_display_delta"
	alert_border = "alert_border_delta"

	var/static/datum/announcement/priority/security/security_announcement_delta = new(do_log = 0, do_newscast = 1, new_sound = sound('sound/effects/siren.ogg'))

/singleton/security_level/default/gaiadept/code_delta/switching_up_to()
	security_announcement_delta.Announce("Nuclear-Biological-Chemical alert procedures have been engaged. All citizens are to follow orders of emergency personnel and evacuate any affected areas. This is not a drill.", "Attention! NBC alert procedures now in effect!")
	notify_station()
