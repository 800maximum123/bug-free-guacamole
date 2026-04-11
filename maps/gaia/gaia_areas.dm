/datum/map/gaia

	base_floor_type = /turf/simulated/floor/exoplanet/barren
	base_floor_area = /area/gaia

	post_round_safe_areas = list (
		/area/gaia/scg,
		/area/gaia/iccg,
	)

/area/gaia
	name = "\improper Gaian Surface"
	icon = 'maps/gaia/icons/areas.dmi'
	icon_state = "gaia"
	requires_power = 0
	sound_env = ASTEROID
	ambience = list('sound/effects/wind/wind_2_1.ogg','sound/effects/wind/wind_2_2.ogg','sound/effects/wind/wind_3_1.ogg','sound/effects/wind/wind_4_1.ogg','sound/effects/wind/wind_4_2.ogg','sound/effects/wind/wind_5_1.ogg')
	base_turf = /turf/simulated/floor/exoplanet/barren

/*
* -- Area of Operations --
*/
/area/gaia/city
	name = "\improper Maricarbonia"
	icon_state = "gaia_city"
	ambience = list('sound/ambience/ominous1.ogg', 'sound/ambience/ominous2.ogg', 'sound/ambience/ominous3.ogg',)

/area/gaia/mineshafts
	name = "\improper Maricarbonia's Mineshafts Outskirts"
	icon_state = "gaia_mineshafts_outskirts"
	req_access = list(access_mining)

/area/gaia/mineshafts/inside
	name = "\improper Maricarbonia's Mineshafts Building"
	icon_state = "gaia_mineshafts_inside"
	sound_env = STANDARD_STATION

/area/gaia/mineshafts/inside/big
	name = "\improper Maricarbonia's Mineshafts Big Building"
	sound_env = LARGE_ENCLOSED

/area/gaia/mineshafts/shafts
	name = "\improper Maricarbonia's Mineshafts"
	icon_state = "gaia_mineshafts"
	forced_ambience = list('sound/ambience/maintambience.ogg')
	ambience = list('sound/ambience/spookyspace1.ogg', 'sound/ambience/spookyspace2.ogg',)
	sound_env = HALLWAY

/area/gaia/mineshafts/shafts/phoron_room
	name = "\improper Maricarbonia's Mineshafts Phoron Storage"
	icon_state = "gaia_mineshafts_phoron"

/area/gaia/mineshafts/shafts/chasm
	name = "\improper Maricarbonia's Mineshafts Chasm"
	icon_state = "gaia_mineshafts_chasm"
	sound_env = FOREST

/area/gaia/urbanrebels
	name = "\improper Urbomanka"
	icon_state = "gaia_city"
	ambience = list('sound/ambience/ominous1.ogg', 'sound/ambience/ominous2.ogg', 'sound/ambience/ominous3.ogg', 'maps/gaia/sounds/propaganda1.ogg', 'maps/gaia/sounds/propaganda2.ogg', 'maps/gaia/sounds/propaganda3.ogg', 'maps/gaia/sounds/propaganda4.ogg', 'maps/gaia/sounds/propaganda5.ogg', 'maps/gaia/sounds/propaganda6.ogg',)

/*
* -- SCG Camp "Boxcutters" Platoon camp --
*/

/area/gaia/scg
	name = "\improper SCG Camp"
	icon_state = "scg"
	req_access = list(access_solgov_crew)
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
	req_access = list(access_solgov_crew, access_engine)
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
	req_access = list(access_solgov_crew, access_medical)
	sound_env = STANDARD_STATION

/area/gaia/scg/hospital/surgery
	name = "\improper SCG Camp - Surgical"
	sound_env = SMALL_SOFTFLOOR

// Command
/area/gaia/scg/command
	name = "\improper SCG Camp - Command Office"
	icon_state = "scg_command"
	req_access = list(access_solgov_crew, access_heads)
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
	req_access = list(access_solgov_crew, access_security)
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
	req_access = list(access_iccg)
	ambience = list('maps/gaia/sounds/ambioccupation_base.ogg')

/area/gaia/iccg/outskirts
	name = "\improper ICCG Camp - Outskirts"
	icon_state = "iccg_outskirts"
	ambience = list('maps/gaia/sounds/ambioccupation_outskirts.ogg')

// Main Citadel
/area/gaia/iccg/citadel
	name = "\improper ICCG Camp - Citadel"
	icon_state = "iccg_citadel"
	sound_env = STANDARD_STATION

/area/gaia/iccg/citadel/armory
	name = "\improper ICCG Camp - Armory"
	icon_state = "iccg_armory"
	req_access = list(access_iccg_com)
	sound_env = SMALL_ENCLOSED

/area/gaia/iccg/citadel/armory/second
	name = "\improper ICCG Camp - 2nd Floor Armory"
	sound_env = LARGE_ENCLOSED

// Command
/area/gaia/iccg/citadel/command
	name = "\improper ICCG Camp - CIC"
	icon_state = "iccg_command"
	req_access = list(access_iccg_com)
	ambience = list('maps/gaia/sounds/ambioccupation_command.ogg')

/area/gaia/iccg/citadel/command/briefing
	name = "\improper ICCG Camp - Briefing"
	req_access = list(access_iccg)
	sound_env = LARGE_SOFTFLOOR

// Security
/area/gaia/iccg/security
	name = "\improper ICCG Camp - Police Station"
	icon_state = "iccg_police"
	sound_env = STANDARD_STATION
