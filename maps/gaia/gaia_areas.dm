/datum/map/gaia

	base_floor_type = /turf/simulated/floor/exoplanet/barren
	base_floor_area = /area/gaia

	post_round_safe_areas = list (
		/area/centcom,
		/area/shuttle/escape/centcom,
		/area/shuttle/escape_pod1/centcom,
		/area/shuttle/escape_pod2/centcom,
		/area/shuttle/escape_pod3/centcom,
		/area/shuttle/escape_pod5/centcom,
		/area/shuttle/transport1/centcom,
		/area/shuttle/administration/centcom,
		/area/shuttle/specops/centcom,
	)

/area/gaia
	name = "\improper Gaian Surface"
	icon_state = "gaia"
	requires_power = 0
	sound_env = ASTEROID
	ambience = list('sound/effects/wind/wind_2_1.ogg','sound/effects/wind/wind_2_2.ogg','sound/effects/wind/wind_3_1.ogg','sound/effects/wind/wind_4_1.ogg','sound/effects/wind/wind_4_2.ogg','sound/effects/wind/wind_5_1.ogg')

/*
* -- SCG Camp "Boxcutters" Platoon camp --
*/

/area/gaia/scg
	name = "\improper 'Boxcutters' Camp"
	icon_state = "scg"
	req_access = list(access_solgov_crew)
	ambience = list('maps/gaia/sounds/ambipartisan_base.ogg')

/area/gaia/scg/outskirts
	name = "\improper 'Boxcutters' Camp - Outskirts"
	icon_state = "scg_outskirts"
	ambience = list('maps/gaia/sounds/ambipartisan_outskirts.ogg')

// Barracks and Officer Barracks
/area/gaia/scg/barracks
	name = "\improper 'Boxcutters' Camp - Barracks"
	icon_state = "scg_barracks"
	sound_env = STANDARD_STATION

/area/gaia/scg/barracks/bathroom
	name = "\improper 'Boxcutters' Camp - Barracks Bathroom"
	sound_env = SMALL_ENCLOSED

/area/gaia/scg/barracks/ps
	name = "\improper 'Boxcutters' Camp - Platoon Sergeant"
	icon_state = "scg_ps"
	sound_env = SMALL_SOFTFLOOR

/area/gaia/scg/barracks/officer
	name = "\improper 'Boxcutters' Camp - Officer Barracks"
	icon_state = "scg_barracks_officer"
	sound_env = MEDIUM_SOFTFLOOR

/area/gaia/scg/barracks/officer/breakroom
	name = "\improper 'Boxcutters' Camp - Officer Breakroom"

/area/gaia/scg/barracks/officer/bathroom
	name = "\improper 'Boxcutters' Camp - Officer Bathroom"
	sound_env = SMALL_ENCLOSED

// Facilities
/area/gaia/scg/armory
	name = "\improper 'Boxcutters' Camp - Armory"
	icon_state = "scg_armory"
	req_access = list(access_solgov_crew, access_armory)
	sound_env = LARGE_ENCLOSED

/area/gaia/scg/engineering
	name = "\improper 'Boxcutters' Camp - Engineering"
	icon_state = "scg_engineering"
	sound_env = SMALL_SOFTFLOOR

/area/gaia/scg/engineering/communications
	name = "\improper 'Boxcutters' Camp - Communications"
	icon_state = "scg_comms"
	sound_env = STANDARD_STATION

/area/gaia/scg/engineering/water
	name = "\improper 'Boxcutters' Camp - Water Processing"

/area/gaia/scg/engineering/electricity
	name = "\improper 'Boxcutters' Camp - Electrical Room"

/area/gaia/scg/hospital
	name = "\improper 'Boxcutters' Camp - Hospital"
	icon_state = "scg_hospital"
	sound_env = STANDARD_STATION

/area/gaia/scg/hospital/surgery
	name = "\improper 'Boxcutters' Camp - Surgical"
	icon_state = "scg_hospital"
	sound_env = SMALL_SOFTFLOOR

// Command
/area/gaia/scg/command
	name = "\improper 'Boxcutters' Camp - Command Office"
	icon_state = "scg_command"
	ambience = list('maps/gaia/sounds/ambipartisan_command.ogg')
	sound_env = MEDIUM_SOFTFLOOR

/area/gaia/scg/command/briefing
	name = "\improper 'Boxcutters' Camp - Briefing Area"
	sound_env = STANDARD_STATION

/*
* -- ICCG Garrison "Kastel-13" base --
*/
