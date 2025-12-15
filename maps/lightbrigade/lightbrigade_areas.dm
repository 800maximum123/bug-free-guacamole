//NOTE: IT USES SOME OF THE TORCH'S AREAS. DO NOT UNINCLUDE TORCH_AREAS.DM

/datum/map/lightbrigade

	base_floor_type = /turf/simulated/floor/reinforced/airless
	base_floor_area = /area/lbrigexterior

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

//lower deck aka z1
/area/hallway/primary/lower/aft
	name = "Lower Deck Aft Hallway"
	icon_state = "HallA"

/area/hallway/primary/lower/mid
	name = "Lower Deck Central Hallway"
	icon_state = "HallF"

/area/maintenance/lower
	name = "Lower Deck Maintenance"
	icon_state = "maintcentral"

/area/maintenance/lower/aftport
	name = "Lower Deck Aft Port Maintenance"
	icon_state = "apmaint"

/area/maintenance/lower/aftstarboard
	name = "Lower Deck Aft Starboard Maintenance"
	icon_state = "asmaint"

/area/maintenance/lower/foreport
	name = "Lower Deck Fore Port Maintenance"
	icon_state = "fpmaint"

/area/maintenance/lower/forestarboard
	name = "Lower Deck Fore Starboard Maintenance"
	icon_state = "fsmaint"

/area/thruster/ptfin
	name = "Port Thruster Fin"

/area/thruster/sbfin
	name = "Starboard Thruster Fin"

/area/thruster/aftpt
	name = "Aft Port Thruster"

/area/thruster/aftsb
	name = "Aft Starboard Thruster"

/area/quartermaster/ptfin
	name = "Port Fin Storage"

/area/quartermaster/sbfin
	name = "Starboard Fin Storage"

//middle deck aka z2
/area/hallway/primary/middle/fore
	name = "Middle Deck Fore Hallway"
	icon_state = "HallF"

/area/hallway/primary/middle/mid
	name = "Middle Deck Central Hallway"
	icon_state = "HallC3"

/area/hallway/primary/middle/aft
	name = "Middle Deck Aft Hallway"
	icon_state = "HallA"

/area/maintenance/middle/port
	name = "Middle Deck Port Maintenance"
	icon_state = "pmaint"

/area/maintenance/middle/starboard
	name = "Middle Deck Starboard Maintenance"
	icon_state = "smaint"

/area/maintenance/middle/ptfin
	name = "Middle Deck Port Fin Maintenance"
	icon_state = "pmaint"

/area/maintenance/middle/sbfin
	name = "Middle Deck Starboard Fin Maintenance"
	icon_state = "smaint"

/area/teleporter/middle
	name = "Middle Deck Teleporter"
	icon_state = "teleporter"

/area/maintenance/substation/middle
	name = "Middle Deck Substation"

/area/crew_quarters/safe_room/middle
	name = "Middle Deck Safe Room"

/area/vacant/office
	name = "Vacant Office"
	icon_state = "crew_quarters"

/area/crew_quarters/sleep/mid_cryo
	name = "Middle Deck Cryogenic Storage"
	icon_state = "crew_quarters"

//medical saferoom defined in torch_areas.dm is good nuff

//upper deck aka z3
/area/hallway/primary/upper/fore
	name = "Upper Deck Fore Hallway"
	icon_state = "HallF"

/area/hallway/primary/upper/aft
	name = "Upper Deck Aft Hallway"
	icon_state = "HallA"

/area/hallway/primary/upper/bunk
	name = "Upper Deck Bunks Hallway"
	icon_state = "HallC"

/area/hallway/primary/upper/obunk
	name = "Upper Deck Officer Bunks Hallway"
	icon_state = "HallC"

/area/crew_quarters/bunks
	name = "Crew Bunks"
	icon_state = "crew_quarters"

/area/crew_quarters/obunks
	name = "Officer's Bunks"
	icon_state = "crew_quarters"

/area/crew_quarters/bunks_head
	name = "Auxiliary Head"
	icon_state = "crew_quarters"

/area/crew_quarters/safe_room/upper
	name = "Upper Deck Safe Room"

/area/teleporter/upper
	name = "Upper Deck Teleporter"
	icon_state = "teleporter"

// command

/area/bridge/lbrig
	name = "Combat Information Center"

/area/bridge/lbrigstorage
	name = "CIC Storage"

/area/crew_quarters/heads/xobed
	name = "Command - XO's Quarters"
	sound_env = MEDIUM_SOFTFLOOR
	req_access = list(access_hop)
	lighting_tone = AREA_LIGHTING_WARM

/area/crew_quarters/heads/office/mo
	icon_state = "heads_cmo"
	name = "\improper MO's Office"
	req_access = list(access_cmo)
	lighting_tone = AREA_LIGHTING_WARM

/area/command/officersmess
	name = "Officer's Mess"
	icon_state = "bar"
	req_access = list(access_o_mess)
	sound_env = MEDIUM_SOFTFLOOR
	lighting_tone = AREA_LIGHTING_WARM

/area/lbrigexterior
	name = "\improper Exterior Reinforcements"
	icon_state = "maint_exterior"
	area_flags = AREA_FLAG_EXTERNAL
	has_gravity = FALSE
	turf_initializer = /singleton/turf_initializer/maintenance/space
	req_access = list(access_external_airlocks, access_maint_tunnels)

// engineering

/area/engineering/hall
	name = "Engineering Hallway"
	icon_state = "maintcentral"

/area/engineering/substation
	name = "Port Engine Substation"

/area/engineering/substation/starboard
	name = "Starboard Engine Substation"

/area/engineering/ptengine
	name = "Port Engine Bay"

/area/engineering/sbengine
	name = "Starboard Engine Bay"

/area/engineering/sensors
	name = "Sensor Array Maintenance"

// synth-related

/area/engineering/drone_fabrication
	name = "\improper Engineering Drone Fabrication"
	icon_state = "drone_fab"
	sound_env = SMALL_ENCLOSED
	req_access = list(access_robotics)

/area/turret_protected/ai
	name = "\improper AI Chamber"
	icon_state = "ai_chamber"
	ambience = list('sound/ambience/ambimalf.ogg')
	req_access = list(access_ai_upload)

// armsmemes

/area/security/armsmen
	name = "Armsman Prep Room"
	icon_state = "security"
	req_access = list(access_explorer)

// gunnery

/area/quartermaster/ptguns
	name = "Port Auxiliary Armament Hardpoint"
	req_access = (access_gun)

/area/quartermaster/sbguns
	name = "Starboard Auxiliary Armament Hardpoint"
	req_access = (access_gun)

/area/quartermaster/ptmaingun
	name = "Port Main Armament Hardpoint"
	req_access = (access_gun)

/area/quartermaster/sbmaingun
	name = "Starboard Main Armament Hardpoint"
	req_access = (access_gun)

// ammo stowages

/area/quartermaster/ptammo_main
	name = "Port Main Armament Ammo Stowage"
	req_access = (access_gun)

/area/quartermaster/sbammo_main
	name = "Starboard Main Armament Ammo Stowage"
	req_access = (access_gun)

/area/quartermaster/ptammo_aux_a
	name = "Port Ammo Stowage Alpha"
	req_access = (access_gun)

/area/quartermaster/ptammo_aux_b
	name = "Port Ammo Stowage Bravo"
	req_access = (access_gun)

/area/quartermaster/ptammo_aux_c
	name = "Port Ammo Stowage Charlie"
	req_access = (access_gun)

/area/quartermaster/sbammo_aux_a
	name = "Starboard Ammo Stowage Alpha"
	req_access = (access_gun)

/area/quartermaster/sbammo_aux_b
	name = "Starboard Ammo Stowage Bravo"
	req_access = (access_gun)

/area/quartermaster/sbammo_aux_c
	name = "Starboard Ammo Stowage Charlie"
	req_access = (access_gun)

// missiles

/area/quartermaster/missilestorage
	name = "Missile Storage"
	req_access = (access_gun)

/area/quartermaster/missilebay
	name = "Missile Bay"
	req_access = (access_gun)

/area/command/pilot/avprep
	name = "Pilots Prep Room"
	req_access = (access_pilot)

// elevators

/area/turbolift/ammo_pt_lift
	name = "\improper Port Munitions Lift"
	icon_state = "shuttle3"
	base_turf = /turf/simulated/open

/area/turbolift/ammo_sb_lift
	name = "\improper Starboard Munitions Lift"
	icon_state = "shuttle3"
	base_turf = /turf/simulated/open
	lighting_tone = AREA_LIGHTING_COOL


// crew quarters

/area/crew_quarters/lbrighead
	name = "Middle Deck Head"

/area/crew_quarters/lbrighead/aux
	name = "Auxiliary Head"

// shuttles

/area/scout_shuttle
	name = "Hunter"

/area/dropship
	name = "Raider"
