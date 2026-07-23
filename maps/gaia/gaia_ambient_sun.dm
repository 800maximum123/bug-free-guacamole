// Gaia ambient sun cycle controller
// Handles dynamic day/night cycle for Gaia area ambient lighting

/datum/controller/subsystem/ambient_lighting/proc/gaia_initialize_sun()
	gaia_daycycle = 10 HOURS
	update_gaia_sun()

/datum/controller/subsystem/ambient_lighting/proc/update_gaia_sun()
	if (!gaia_daycycle || gaia_daycycle <= 0)
		return
	update_area_sun(/area/gaia, gaia_daycycle, 1.0)

/datum/controller/subsystem/ambient_lighting/proc/set_gaia_update_state(state)
	/// Enable or disable gaia sun updates
	do_update_gaia = state
	return do_update_gaia

/datum/controller/subsystem/ambient_lighting
	// DAY/NIGHT CYCLE
	var/gaia_daycycle = 10 HOURS
	var/sun_process_interval = 1.5 MINUTES //How often we update planetary sunlight
	var/sun_last_process = null // world.time
	var/do_update_gaia = FALSE // Whether to update Gaia's sun or not
