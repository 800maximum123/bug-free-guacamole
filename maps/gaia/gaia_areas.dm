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
	base_turf = /turf/simulated/floor/exoplanet/barren

/*
* -- SCG Camp "Boxcutters" Platoon camp --
*/

/area/gaia/scg
	name = "\improper SCG Camp"
	icon_state = "scg"
	//req_access = list(access_solgov_crew)
	ambience = list('maps/gaia/sounds/ambipartisan_base.ogg')

/area/gaia/scg/outskirts
	name = "\improper SCG Camp - Outskirts"
	icon_state = "scg_outskirts"
	ambience = list('maps/gaia/sounds/ambipartisan_outskirts.ogg')

// Barracks and Officer Barracks
/area/gaia/scg/barracks
	name = "\improper SCG Camp - Barracks"
	icon_state = "scg_barracks"
	sound_env = STANDARD_STATION

/area/gaia/scg/barracks/bathroom
	name = "\improper SCG Camp - Barracks Bathroom"
	sound_env = SMALL_ENCLOSED

/area/gaia/scg/barracks/ps
	name = "\improper SCG Camp - Platoon Sergeant"
	icon_state = "scg_ps"
	sound_env = SMALL_SOFTFLOOR

/area/gaia/scg/barracks/officer
	name = "\improper SCG Camp - Officer Barracks"
	icon_state = "scg_barracks_officer"
	sound_env = MEDIUM_SOFTFLOOR

/area/gaia/scg/barracks/officer/breakroom
	name = "\improper SCG Camp - Officer Breakroom"

/area/gaia/scg/barracks/officer/bathroom
	name = "\improper SCG Camp - Officer Bathroom"
	sound_env = SMALL_ENCLOSED

// Guns
/area/gaia/scg/armory
	name = "\improper SCG Camp - Armory"
	icon_state = "scg_armory"
	req_access = list(access_solgov_crew, access_armory)
	sound_env = LARGE_ENCLOSED

/area/gaia/scg/shooting_range
	name = "\improper SCG Camp - Shooting Range"
	icon_state = "scg_shooting_range"
	sound_env = LARGE_ENCLOSED

// Engineering
/area/gaia/scg/engineering
	name = "\improper SCG Camp - Engineering"
	icon_state = "scg_engineering"
	sound_env = SMALL_SOFTFLOOR

/area/gaia/scg/engineering/communications
	name = "\improper SCG Camp - Communications"
	icon_state = "scg_comms"
	sound_env = STANDARD_STATION

/area/gaia/scg/engineering/water
	name = "\improper SCG Camp - Water Processing"

/area/gaia/scg/engineering/electricity
	name = "\improper SCG Camp - Electrical Room"

// Hospital
/area/gaia/scg/hospital
	name = "\improper SCG Camp - Hospital"
	icon_state = "scg_hospital"
	sound_env = STANDARD_STATION

/area/gaia/scg/hospital/surgery
	name = "\improper SCG Camp - Surgical"
	icon_state = "scg_hospital"
	sound_env = SMALL_SOFTFLOOR

// Command
/area/gaia/scg/command
	name = "\improper SCG Camp - Command Office"
	icon_state = "scg_command"
	ambience = list('maps/gaia/sounds/ambipartisan_command.ogg')
	sound_env = MEDIUM_SOFTFLOOR

/area/gaia/scg/command/briefing
	name = "\improper SCG Camp - Briefing Area"
	sound_env = STANDARD_STATION

/area/gaia/scg/command/monty
	name = "\improper Colonel Montogemory HQ"
	sound_env = LARGE_ENCLOSED

// Security
/area/gaia/scg/security
	name = "\improper SCG Camp - Security Booth"
	icon_state = "scg_security"
	sound_env = SMALL_SOFTFLOOR

/area/gaia/scg/security/prison
	name = "\improper SCG Camp - Prison"
	sound_env = STANDARD_STATION

// Miscellaneous
/area/gaia/scg/worship
	name = "\improper SCG Camp - Worshipping Area"
	icon_state = "scg_worship"
	ambience = list('sound/ambience/ambicha1.ogg', 'sound/ambience/ambicha2.ogg', 'sound/ambience/ambicha3.ogg')

/*
* -- ICCG Garrison "Morskiye Dragooni" base --
*/
/area/gaia/iccg
	name = "\improper ICCG Camp"
	icon_state = "iccg"
	//req_access = list(access_iccg)
	ambience = list('maps/gaia/sounds/ambioccupation_base.ogg')

/area/gaia/iccg/outskirts
	name = "\improper ICCG Camp - Outskirts"
	icon_state = "iccg_outskirts"
	ambience = list('maps/gaia/sounds/ambioccupation_outskirts.ogg')

/area/gaia/iccg/citadel
	name = "\improper ICCG Camp - Citadel"
	icon_state = "iccg_citadel"
	sound_env = STANDARD_STATION

/area/gaia/iccg/citadel/command
	name = "\improper ICCG Camp - CIC"
	icon_state = "iccg_command"
	ambience = list('maps/gaia/sounds/ambioccupation_command.ogg')

/area/gaia/iccg/citadel/command/briefing
	name = "\improper ICCG Camp - Briefing"
	sound_env = LARGE_SOFTFLOOR
