
/area/map_template/scgcity
	name = "\improper SCG City"
	icon_state = "dk_yellow"

/area/map_template/scgcity/hallway
	name = "\improper City Central Hallway"
	icon_state = "teleporter"

/area/map_template/scgcity/hallway/north
	name = "\improper City North Hallway"

/area/map_template/scgcity/hallway/south
	name = "\improper City South Hallway"

/area/map_template/scgcity/hallway/west
	name = "\improper City West Hallway"

/area/map_template/scgcity/hallway/east
	name = "\improper City East Hallway"

/area/map_template/scgcity/medbay
	name = "\improper City Infirmary"
	icon_state = "medbay"
	req_access = list(access_medical)
	lighting_tone = AREA_LIGHTING_COOL

/area/map_template/scgcity/medbay/surgery
	name = "\improper City Surgery"

/area/map_template/scgcity/medbay/storage
	name = "\improper City Infirmary Storage"

/area/map_template/scgcity/medbay/chemistryonelove
	name = "\improper City Infirmary Chemistry"

/area/map_template/scgcity/cargo
	name = "\improper City Cargo"

/area/map_template/scgcity/cargo/mining
	name = "\improper City Mining Hangar"
	req_access = list(list(access_mining, access_xenoarch))

/area/map_template/scgcity/cargo/mining/storage
	name = "\improper City Mining Storage"

/area/map_template/scgcity/cargo/qm
	name = "\improper City Quartermaster Office"

/area/map_template/scgcity/engineering
	name = "\improper City Engineering"
	icon_state = "engine"
	req_access = list(access_engine)
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED

/area/map_template/scgcity/engineering/smes
	name = "\improper City Engineering SMES Room"

/area/map_template/scgcity/engineering/dorms
	name = "\improper City Engineering Dormitories"

/area/map_template/scgcity/engineering/storage
	name = "\improper City Engineering Storage"

/area/map_template/scgcity/engineering/solars
	name = "\improper City Solars"

/area/map_template/scgcity/engineering/atmospheris
	name = "\improper City Atmospherics"
	icon_state = "atmos"
	sound_env = LARGE_ENCLOSED
	req_access = list(access_atmospherics)
/area/map_template/scgcity/engineering/atmospheris/storage
	name = "\improper City Atmospherics Storage"
	sound_env = SMALL_ENCLOSED

/area/map_template/scgcity/bridge
	name = "\improper City Command"
	icon_state = "bridge"
	req_access = list(access_bridge)
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED

/area/map_template/scgcity/bridge/sgr
	name = "\improper City SGR Office"
	req_access = list(access_captain)
	lighting_tone = AREA_LIGHTING_WARM

/area/map_template/scgcity/bridge/sgr/back
	name = "\improper City SCGR's Quarters"

/area/map_template/scgcity/bridge/sea
	icon_state = "heads_sea"
	name = "\improper Prep Room"
	req_access = list(access_explorer)
	lighting_tone = AREA_LIGHTING_WARM

/area/map_template/scgcity/bridge/sea/back
	name = "\improper City SEA's Quarters"

/area/map_template/scgcity/bridge/storage
	name = "\improper City Command Storage"

/area/map_template/scgcity/bridge/emexit
	name = "\improper City Command Emergency Exit"

/area/map_template/scgcity/bridge/meeting
	name = "\improper City Command Conference Room"

/area/map_template/scgcity/bridge/hallway
	name = "\improper City Command Hallway"

/area/map_template/scgcity/bridge/officehall
	name = "\improper City Command Heads Hallway"
	req_access = list(access_researchlab_supervisor)

/area/map_template/scgcity/bridge/heads
	name = "\improper City Overseer Office"
	icon_state = "heads"
	sound_env = MEDIUM_SOFTFLOOR
	req_access = list(access_captain)
	lighting_tone = AREA_LIGHTING_WARM

/area/map_template/scgcity/bridge/heads/rd
	name = "\improper Research Director Office"
	req_access = list(access_rd)
	lighting_tone = AREA_LIGHTING_COOL

/area/map_template/scgcity/bridge/heads/ce
	name = "\improper Chief Engineer Office"
	req_access = list(access_ce)

/area/map_template/scgcity/bridge/heads/cos
	name = "\improper Chief of Security Office"
	req_access = list(access_hos)

/area/map_template/scgcity/bridge/heads/cmo
	name = "\improper Chief Medical Officer Office"
	req_access = list(access_cmo)
	lighting_tone = AREA_LIGHTING_COOL

/area/map_template/scgcity/bridge/heads/hop
	name = "\improper Head of Personnel Office"
	req_access = list(access_hop)
	lighting_tone = AREA_LIGHTING_WARM

/area/map_template/scgcity/bridge/heads/hop/office
	name = "\improper HoP Office"

/area/map_template/scgcity/bridge/checkpoint
	name = "\improper City Command Security Checkpoint"
	req_access = list(access_security)

/area/map_template/scgcity/research
	name = "\improper City Research Wing"
	icon_state = "purple"
	req_access = list(access_research)
	lighting_tone = AREA_LIGHTING_COOL

/area/map_template/scgcity/research/office
	name = "\improper City Research Paperwork Office"

/area/map_template/scgcity/research/office/one
	name = "\improper City Research Office 1"

/area/map_template/scgcity/research/office/two
	name = "\improper City Research Office 2"

/area/map_template/scgcity/research/meeting
	name = "\improper City Research Conference Room"

/area/map_template/scgcity/research/checkpoint
	name = "\improper City Research Security Checkpoint"
	req_access = list(access_security)

/area/map_template/scgcity/research/storage
	name = "\improper City Research Equipment Storage"

/area/map_template/scgcity/research/datab
	name = "\improper City Research DB storage"

/area/map_template/scgcity/research/rdoffice
	name = "\improper RD Office"
	req_access = list(access_rd)

/area/map_template/scgcity/research/testlab
	name = "\improper City Research Testing Lab"

/area/map_template/scgcity/research/testlab/observation
	name = "\improper City Research Testing Lab Observation"

/area/map_template/scgcity/public
	name = "\improper City"
	icon_state = "locker"

/area/map_template/scgcity/public/entrance
	name = "\improper Main City Entrance"
	icon_state = "Tactical"
	sound_env = SMALL_ENCLOSED
	req_access = list(list(access_bridge,access_security,access_medical,access_cargo,access_research,access_engine))

/area/map_template/scgcity/public/entrance/airlock
	name = "\improper Main City Entrance Airlock"
/area/map_template/scgcity/public/entrance/prep
	name = "\improper Main City Entrance Preparations"

/area/map_template/scgcity/public/maint
	name = "\improper City Maintenance"
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED
/area/map_template/scgcity/public/maint/two
	name = "\improper City Second Maintenance"
/area/map_template/scgcity/public/maint/three
	name = "\improper City Thirt Maintenance"
/area/map_template/scgcity/public/maint/four
	name = "\improper City Fourth Maintenance"

/area/map_template/scgcity/public/house
	name = "\improper City House 101"
	icon_state = "brig"

/area/map_template/scgcity/public/house/a102
	name = "\improper City House 102"

/area/map_template/scgcity/public/house/a103
	name = "\improper City House 103"

/area/map_template/scgcity/public/house/a104
	name = "\improper City House 104"

/area/map_template/scgcity/public/house/a105
	name = "\improper City House 105"

/area/map_template/scgcity/public/house/a106
	name = "\improper City House 106"

/area/map_template/scgcity/public/bar
	name = "\improper City Bar"
	icon_state = "cafeteria"
	sound_env = LARGE_SOFTFLOOR
	req_access = list(access_kitchen)
	lighting_tone = AREA_LIGHTING_WARM

/area/map_template/scgcity/public/bar/kitchen
	name = "\improper City Kitchen"

/area/map_template/scgcity/public/adherant
	name = "\improper City Adherant Room"

/area/map_template/scgcity/public/hydro
	name = "\improper City Hydroponics"

/area/map_template/scgcity/public/janitor
	name = "\improper City Janitor Maintenance"

/area/map_template/scgcity/public/dorms
	name = "\improper City Dormitories"

/area/map_template/scgcity/public/head
	name = "\improper City Head"

/area/map_template/scgcity/public/laundry
	name = "\improper City Laundry"

/area/map_template/scgcity/public/computer
	name = "\improper City Computer Lab"

/area/map_template/scgcity/public/recreation
	name = "\improper City Recreation"
	sound_env = SMALL_SOFTFLOOR
	lighting_tone = AREA_LIGHTING_WARM

/area/map_template/scgcity/public/recreation/observatory
	name = "\improper City Recreation Observatory"

/area/map_template/scgcity/public/recreation/pool
	name = "\improper City Recreation Pool"
	sound_env = LARGE_ENCLOSED

/area/map_template/scgcity/security
	name = "\improper City Security"
	icon_state = "security"
	req_access = list(access_security)

/area/map_template/scgcity/security/forensics
	name = "\improper City Detective Office"
	sound_env = MEDIUM_SOFTFLOOR
	req_access = list(access_forensics_lockers)
	lighting_tone = AREA_LIGHTING_COOL

/area/map_template/scgcity/security/cells
	name = "\improper City Security Prison"

/area/map_template/scgcity/security/equipment
	name = "\improper City Security Equipment Storage"

/area/map_template/scgcity/outside
	name = "\improper City Environment"

/area/map_template/scgcity/hangar
	name = "\improper City Hangar"
	icon_state = "hangar"
	sound_env = LARGE_ENCLOSED

/area/map_template/scgcity/hangar/shuttle
	name = "\improper SCGV Lovely"

/area/map_template/scgcity/tcommsat
	ambience = list('sound/ambience/ambisin2.ogg', 'sound/ambience/signal.ogg', 'sound/ambience/signal.ogg', 'sound/ambience/ambigen10.ogg')
	req_access = list(access_tcomsat)
	icon_state = "tcomsatcham"

/area/map_template/scgcity/tcommsat/chamber
	name = "\improper Telecoms Central Compartment"
	icon_state = "tcomsatcham"

/area/map_template/scgcity/tcommsat/computer
	name = "\improper Telecoms Control Room"
	icon_state = "tcomsatcomp"


// ACCESS


/var/const/access_researchlab_lead = "ACCESS_SCG_RESEARCH_LEAD" //g
/datum/access/researchlab
	id = access_researchlab_lead
	desc = "SCG Lab Researcher leaders' access"
	region = ACCESS_REGION_NONE

var/const/access_researchlab_supervisor = "ACCESS_SCG_RESEARCH_SUPERVISOR"
/datum/access/researchlab/supervisor
	id = access_researchlab_supervisor
