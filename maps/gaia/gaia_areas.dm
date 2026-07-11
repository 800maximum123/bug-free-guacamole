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
	area_flags = AREA_FLAG_EXTERNAL

	ambient_group_type = /area/gaia
	ambient_group_color = "#ffffff"
	ambient_group_multiplier = 0.75
	ambient_group_enabled = TRUE

/area/gaia/deserter
	name = "\improper Out of Battlezone"

/area/gaia/montogemory
	name = "\improper Colonel Montogemory HQ"
	icon_state = "scg_command"
	ambience = list('maps/gaia/sounds/ambience/ambipartisan_command.ogg')
	sound_env = SMALL_ENCLOSED
	ambient_group_enabled = FALSE
	area_flags = null

/area/gaia/alistratova
	name = "\improper Kapitan Alistratova HQ"
	icon_state = "iccg_command"
	ambience = list('maps/gaia/sounds/ambience/ambioccupation_command.ogg')
	sound_env = LARGE_ENCLOSED
	ambient_group_enabled = FALSE
	area_flags = null

/*
* -- Area of Operations --
*/
// MARICARBONIA
/area/gaia/city
	name = "\improper Maricarbonia"
	icon_state = "gaia_city"
	ambience = list('sound/ambience/ominous1.ogg', 'sound/ambience/ominous2.ogg', 'sound/ambience/ominous3.ogg',)

// MARICARBONIA MINESHAFTS
/area/gaia/mineshafts
	name = "\improper Maricarbonia's Mineshafts Outskirts"
	icon_state = "gaia_mineshafts_outskirts"
	req_access = list(access_mining)

/area/gaia/mineshafts/inside
	name = "\improper Maricarbonia's Mineshafts Building"
	icon_state = "gaia_mineshafts_inside"
	sound_env = STANDARD_STATION
	ambient_group_enabled = FALSE
	area_flags = null

/area/gaia/mineshafts/inside/big
	name = "\improper Maricarbonia's Mineshafts Big Building"
	sound_env = LARGE_ENCLOSED
	ambient_group_enabled = FALSE

/area/gaia/mineshafts/shafts
	name = "\improper Maricarbonia's Mineshafts"
	icon_state = "gaia_mineshafts"
	forced_ambience = list('sound/ambience/maintambience.ogg')
	ambience = list('sound/ambience/spookyspace1.ogg', 'sound/ambience/spookyspace2.ogg',)
	sound_env = HALLWAY
	ambient_group_enabled = FALSE
	area_flags = null

/area/gaia/mineshafts/shafts/phoron_room
	name = "\improper Maricarbonia's Mineshafts Phoron Storage"
	icon_state = "gaia_mineshafts_phoron"
/area/gaia/mineshafts/shafts/chasm
	name = "\improper Maricarbonia's Mineshafts Chasm"
	icon_state = "gaia_mineshafts_chasm"
	sound_env = FOREST

// URBOMANKA
/area/gaia/urbanrebels
	name = "\improper Urbomanka"
	icon_state = "gaia_city"
	ambience = list(
			'sound/ambience/ominous1.ogg',
			'sound/ambience/ominous2.ogg',
			'sound/ambience/ominous3.ogg',
			'maps/gaia/sounds/ambience/propaganda/propaganda1.ogg',
			'maps/gaia/sounds/ambience/propaganda/propaganda2.ogg',
			'maps/gaia/sounds/ambience/propaganda/propaganda3.ogg',
			'maps/gaia/sounds/ambience/propaganda/propaganda4.ogg',
			'maps/gaia/sounds/ambience/propaganda/propaganda5.ogg',
			'maps/gaia/sounds/ambience/propaganda/propaganda6.ogg',
			)

/area/gaia/urbanrebels/park
	name = "\improper Urbomanka - Park"

/area/gaia/urbanrebels/river
	name = "\improper Urbomanka - River"

/area/gaia/urbanrebels/street
	name = "\improper Urbomanka - Street"

/area/gaia/urbanrebels/street/paula
	name = "\improper Urbomanka - Paula's Broadway"

/area/gaia/urbanrebels/street/brundino
	name = "\improper Urbomanka - Brundino's Street"

/area/gaia/urbanrebels/street/lusiano
	name = "\improper Urbomanka - Lusiano's Street"

/area/gaia/urbanrebels/street/quentino
	name = "\improper Urbomanka - Quentino's Street"

/area/gaia/urbanrebels/street/lizandro
	name = "\improper Urbomanka - Lizandro's Street"

/area/gaia/urbanrebels/street/talita
	name = "\improper Urbomanka - Talita's Street"

/area/gaia/urbanrebels/street/willmar
	name = "\improper Urbomanka - Willmar's Street"

/area/gaia/urbanrebels/street/manu
	name = "\improper Urbomanka - Manu's Street"

/area/gaia/urbanrebels/street/aya
	name = "\improper Urbomanka - Aya's Street"

/area/gaia/urbanrebels/street/nester
	name = "\improper Urbomanka - Nester's Street"

/area/gaia/urbanrebels/street/chester
	name = "\improper Urbomanka - Chester's Street"

/area/gaia/urbanrebels/street/dolores
	name = "\improper Urbomanka - Dolores's Street"

/area/gaia/urbanrebels/street/city
	name = "\improper Urbomanka - City's Street"

/area/gaia/urbanrebels/street/park
	name = "\improper Urbomanka - Park's Street"

/area/gaia/urbanrebels/street/celsia
	name = "\improper Urbomanka - Celsia's Street"

/area/gaia/urbanrebels/street/gaby
	name = "\improper Urbomanka - Gaby's Road"

/area/gaia/urbanrebels/inside
	name = "\improper Urbomanka - Inside Building"
	sound_env = SMALL_ENCLOSED
	ambience = list(
			'sound/ambience/ambigen5.ogg',
			'sound/ambience/ambigen7.ogg',
			'sound/ambience/ambigen9.ogg',
			'sound/ambience/ambigen10.ogg',
			'maps/gaia/sounds/ambience/propaganda/propaganda_muffled1.ogg',
			'maps/gaia/sounds/ambience/propaganda/propaganda_muffled2.ogg',
			'maps/gaia/sounds/ambience/propaganda/propaganda_muffled3.ogg',
			'maps/gaia/sounds/ambience/propaganda/propaganda_muffled4.ogg',
			'maps/gaia/sounds/ambience/propaganda/propaganda_muffled5.ogg',
			'maps/gaia/sounds/ambience/propaganda/propaganda_muffled6.ogg',
			)
	ambient_group_enabled = FALSE
	area_flags = null

/area/gaia/urbanrebels/inside/townhall
	name = "\improper Urbomanka - Town Hall"
	req_access = list(access_bridge)

/area/gaia/urbanrebels/inside/police
	name = "\improper Urbomanka - Police Station"
	req_access = list(access_security)

/area/gaia/urbanrebels/inside/firefighter
	name = "\improper Urbomanka - Fire Station"
	req_access = list(access_atmospherics)

/area/gaia/urbanrebels/inside/engineering
	name = "\improper Urbomanka - Engineering Station"
	req_access = list(access_engine)

/area/gaia/urbanrebels/inside/engineering/telecomms
	name = "\improper Urbomanka - Telecomms Station"

/area/gaia/urbanrebels/inside/engineering/electrical
	name = "\improper Urbomanka - Electrical Station"

/area/gaia/urbanrebels/inside/nt
	name = "\improper Urbomanka - NanoTrasen Office"
	req_access = list(access_nanotrasen)

/area/gaia/urbanrebels/inside/hospital
	name = "\improper Urbomanka - Hospital"
	req_access = list(access_medical
	)
/area/gaia/urbanrebels/inside/park
	name = "\improper Urbomanka - Park Office"

/area/gaia/urbanrebels/inside/church
	name = "\improper Urbomanka - Church"
	sound_env = LARGE_ENCLOSED
	ambience = list('sound/ambience/ambicha1.ogg', 'sound/ambience/ambicha2.ogg', 'sound/ambience/ambicha3.ogg')
	req_access = list(access_chapel_office)

/area/gaia/urbanrebels/inside/metro
	name = "\improper Urbomanka - Northern Metro Station"
	sound_env = SMALL_ENCLOSED
	ambience = list(
			'sound/ambience/ambigen1.ogg',
			'sound/ambience/ambigen9.ogg',
			'sound/ambience/ambigen11.ogg',
			'sound/ambience/ambigen13.ogg',
			'sound/ambience/ambigen14.ogg',
			'maps/gaia/sounds/ambience/propaganda/propaganda_muffled1.ogg',
			'maps/gaia/sounds/ambience/propaganda/propaganda_muffled2.ogg',
			'maps/gaia/sounds/ambience/propaganda/propaganda_muffled3.ogg',
			'maps/gaia/sounds/ambience/propaganda/propaganda_muffled4.ogg',
			'maps/gaia/sounds/ambience/propaganda/propaganda_muffled5.ogg',
			'maps/gaia/sounds/ambience/propaganda/propaganda_muffled6.ogg',
			)
	req_access = list(access_engine)

/area/gaia/urbanrebels/inside/metro/south
	name = "\improper Urbomanka - Southern Metro Station"

/area/gaia/urbanrebels/inside/street
	name = "\improper Urbomanka - Building at Street"

/area/gaia/urbanrebels/inside/street/paula
	name = "\improper Urbomanka - Building at Paula's Broadway"

/area/gaia/urbanrebels/inside/street/brundino
	name = "\improper Urbomanka - Building at Brundino's Street"

/area/gaia/urbanrebels/inside/street/lusiano
	name = "\improper Urbomanka - Building at Lusiano's Street"

/area/gaia/urbanrebels/inside/street/quentino
	name = "\improper Urbomanka - Building at Quentino's Street"

/area/gaia/urbanrebels/inside/street/lizandro
	name = "\improper Urbomanka - Building at Lizandro's Street"

/area/gaia/urbanrebels/inside/street/talita
	name = "\improper Urbomanka - Building at Talita's Street"

/area/gaia/urbanrebels/inside/street/willmar
	name = "\improper Urbomanka - Building at Willmar's Street"

/area/gaia/urbanrebels/inside/street/manu
	name = "\improper Urbomanka - Building at Manu's Street"

/area/gaia/urbanrebels/inside/street/aya
	name = "\improper Urbomanka - Building at Aya's Street"

/area/gaia/urbanrebels/inside/street/nester
	name = "\improper Urbomanka - Building at Nester's Street"

/area/gaia/urbanrebels/inside/street/chester
	name = "\improper Urbomanka - Building at Chester's Street"

/area/gaia/urbanrebels/inside/street/dolores
	name = "\improper Urbomanka - Building at Dolores's Street"

/area/gaia/urbanrebels/inside/street/city
	name = "\improper Urbomanka - Building at City's Street"

/area/gaia/urbanrebels/inside/street/park
	name = "\improper Urbomanka - Building at Park's Street"

/area/gaia/urbanrebels/inside/street/celsia
	name = "\improper Urbomanka - Building at Celsia's Street"

/area/gaia/urbanrebels/inside/street/gaby
	name = "\improper Urbomanka - Building at Gaby's Road"

/area/gaia/urbanrebels/underground
	name = "\improper Urbomanka - Underground"
	forced_ambience = list('sound/ambience/maintambience.ogg')
	ambience = list('sound/ambience/spookyspace1.ogg', 'sound/ambience/spookyspace2.ogg',)
	sound_env = TUNNEL_ENCLOSED
	ambient_group_enabled = FALSE
	area_flags = null

/area/gaia/urbanrebels/underground/police
	name = "\improper Urbomanka - Underground Police Station"
	req_access = list(access_security)

/area/gaia/urbanrebels/underground/townhall
	name = "\improper Urbomanka - Underground Town Hall"
	req_access = list(access_bridge)

/area/gaia/urbanrebels/underground/hospital
	name = "\improper Urbomanka - Underground Hospital"
	req_access = list(access_medical)

/area/gaia/urbanrebels/underground/church
	name = "\improper Urbomanka - Underground Church"
	req_access = list(access_chapel_office)

/area/gaia/urbanrebels/underground/sewers
	name = "\improper Urbomanka - Sewers"
	forced_ambience = list('maps/gaia/sounds/ambience/sewerambience.ogg')

/*
* -- SCG Camp "Boxcutters" Platoon camp --
*/

/area/gaia/scg
	name = "\improper SCG Camp"
	icon_state = "scg"
	req_access = list(access_solgov_crew)
	ambience = list('maps/gaia/sounds/ambience/ambipartisan_base.ogg')

/area/gaia/scg/outskirts
	name = "\improper SCG Camp - Outskirts"
	icon_state = "scg_outskirts"
	ambience = list('maps/gaia/sounds/ambience/ambipartisan_outskirts.ogg')

/area/gaia/scg/undeground
	name = "\improper SCG Camp - Underground"
	icon_state = "scg"
	sound_env = TUNNEL_ENCLOSED
	area_flags = null

// Barracks and Officer Barracks
/area/gaia/scg/barracks
	name = "\improper SCG Camp - Barracks"
	icon_state = "scg_barracks"
	sound_env = STANDARD_STATION
	ambient_group_enabled = FALSE
	area_flags = null

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
	ambient_group_enabled = FALSE

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
	ambient_group_enabled = FALSE
	area_flags = null

/area/gaia/scg/shooting_range
	name = "\improper SCG Camp - Shooting Range"
	icon_state = "scg_shooting_range"
	sound_env = LARGE_ENCLOSED
	ambient_group_enabled = FALSE

// Engineering
/area/gaia/scg/engineering
	name = "\improper SCG Camp - Engineering"
	icon_state = "scg_engineering"
	req_access = list(access_solgov_crew, access_engine)
	sound_env = SMALL_SOFTFLOOR
	ambient_group_enabled = FALSE
	area_flags = null

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
	ambient_group_enabled = FALSE
	area_flags = null

/area/gaia/scg/hospital/surgery
	name = "\improper SCG Camp - Surgical"
	sound_env = SMALL_SOFTFLOOR

// Command
/area/gaia/scg/command
	name = "\improper SCG Camp - Command Office"
	icon_state = "scg_command"
	req_access = list(access_solgov_crew, access_heads)
	ambience = list('maps/gaia/sounds/ambience/ambipartisan_command.ogg')
	sound_env = MEDIUM_SOFTFLOOR
	ambient_group_enabled = FALSE
	area_flags = null

/area/gaia/scg/command/briefing
	name = "\improper SCG Camp - Briefing Area"
	sound_env = STANDARD_STATION

// Security
/area/gaia/scg/security
	name = "\improper SCG Camp - Security Booth"
	icon_state = "scg_security"
	req_access = list(access_solgov_crew, access_security)
	sound_env = SMALL_SOFTFLOOR
	ambient_group_enabled = FALSE
	area_flags = null

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
	ambience = list('maps/gaia/sounds/ambience/ambioccupation_base.ogg')

/area/gaia/iccg/outskirts
	name = "\improper ICCG Camp - Outskirts"
	icon_state = "iccg_outskirts"
	ambience = list('maps/gaia/sounds/ambience/ambioccupation_outskirts.ogg')

// Main Citadel
/area/gaia/iccg/citadel
	name = "\improper ICCG Camp - Citadel"
	icon_state = "iccg_citadel"
	sound_env = STANDARD_STATION
	ambient_group_enabled = FALSE
	area_flags = null

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
	ambience = list('maps/gaia/sounds/ambience/ambioccupation_command.ogg')

/area/gaia/iccg/citadel/command/briefing
	name = "\improper ICCG Camp - Briefing"
	req_access = list(access_iccg)
	sound_env = LARGE_SOFTFLOOR

// Security
/area/gaia/iccg/security
	name = "\improper ICCG Camp - Police Station"
	icon_state = "iccg_police"
	sound_env = STANDARD_STATION
	ambient_group_enabled = FALSE
	area_flags = null
