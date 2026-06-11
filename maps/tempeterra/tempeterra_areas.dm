/datum/map/tempeterra

	base_floor_type = /turf/simulated/floor/reinforced
	base_floor_area = /area/torchexterior

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

/area/tempeterra
	icon = 'tempeterra.dmi'
//	req_access = list(access_fleet_crew)

/area/tempeterra/hangar
	name = "Hangar"
	icon_state = "hangar"

// First Deck Start Change to Third Deck

/area/tempeterra/thirddeck/hallway/fore/port
	name = "Brig Storage"
	icon_state = "hallp"

/area/tempeterra/thirddeck/hallway/stairs
	name = "Third Deck Stairwell"
	icon_state = "stairs"

/area/tempeterra/thirddeck/hallway/ladder/port
	name = "Third Deck Port Ladders"
	icon_state = "stairs"

/area/tempeterra/thirddeck/hallway/ladder/starboard
	name = "Third Deck Starboard Ladders"
	icon_state = "stairs"

/area/tempeterra/thirddeck/medical
	name = "Third Deck Auxilary Medical"
	icon_state = "medbay"
//First Deck End

/area/tempeterra/brig/port
	name = "Port Holding Cell"
	icon_state = "brig"

/area/tempeterra/meeting
	name = "Meeting Room"
	icon_state = "briefing_room"

/area/tempeterra/robotics
	name = "Robotics Workshop"
	icon_state = "robotics"

/area/tempeterra/atmos/monitoring
	name = "Damage Control Central"
	icon_state = "atmos_monitoring"

/area/tempeterra/atmos
	name = "TempeTerra Atmospherics"
	name = "Atmospherics"
	icon_state = "atmos"

//deck 2

//medical

/area/tempeterra/medical/sugery
	name = "Medical Surgery"
	icon_state = "surgery"

/area/tempeterra/medical/lockers
	name = "Medical Locker Room"
	icon_state = "locker"

/area/tempeterra/medical/chemistry
	name = "Chemistry"
	icon_state = "chem"

/area/tempeterra/medical/hallway
	name = "Medical Hallway"
	icon_state = "medbay2"

/area/tempeterra/medical/treatment
	name = "Medical Treatment Center"
	icon_state = "medbay"

/area/tempeterra/medical/storage
	name = "Medical Storage"
	icon_state = "medbay4"

/area/tempeterra/command/bunks
	name = "Crew Locker Room"
	icon_state = "locker"

/area/tempeterra/armsmen/locker
	name = "Armsmen Locker Room"
	icon_state = "locker"

/area/tempeterra/armsmen/armory
	name = "Armory"
	icon_state = "armory"

/area/tempeterra/crew/lounge
	name = "Crew Racks"
	icon_state = "crew_quarters"

/area/tempeterra/crew/head
	name = "Head"
	icon_state = "restrooms"

/area/tempeterra/seconddeck/hallway/fore/midships
	name = "Second Deck Fore Midships Hallway"
	icon_state = "hallc"

/area/tempeterra/seconddeck/hallway/aft/midships
	name = "Second Deck Aft Midships Hallway"
	icon_state = "hallc"

/area/tempeterra/crew/laundry
	name = "Laundry Room"
	icon_state = "fitness"

/area/tempeterra/crew/washroom
	name = "Laundrey Room"
	icon_state = "fitness"

/area/tempeterra/crew/chiefmess
	name = "Chief's Mess"
	icon_state = "eva"

/area/tempeterra/command/cic
	name = "CIC"
	icon_state = "cic"

/area/tempeterra/seconddeck/armaments/port
	name = "Port Missile Tubes"
	icon_state = "missile_port"

/area/tempeterra/seconddeck/armaments/starboard
	name = "Starboard Missile Tubes"
	icon_state = "missile_starboard"

/area/tempeterra/seconddeck/hallway/ladder/port
	name = "Second Deck Port Ladders"
	icon_state = "stairs"

/area/tempeterra/seconddeck/hallway/ladder/starboard
	name = "Second Deck Starboard Ladders"
	icon_state = "stairs"

/area/tempeterra/engineering/foyer
	name = "Engineering Foyer"
	icon_state = "engineering_foyer"

/area/tempeterra/engineering/tool
	name = "Engineering Tool Storage"
	icon_state = "engineering_workshop"

/area/tempeterra/engineering/material
	name = "Engineering Material Storage"
	icon_state = "engineering_storage"

/area/tempeterra/engineering/reactor/powerdistone
	name = "Reactor One Power Distribution"
	icon_state = "engine_smes"

/area/tempeterra/engineering/reactor/powerdisttwo
	name = "Reactor Two Power Distribution"
	icon_state = "engine_smes"

/area/tempeterra/engineering/reactor/onecore
	name = "Reactor One"
	icon_state = "rust_reactor"

/area/tempeterra/engineering/reactor/twocore
	name = "Reactor Two"
	icon_state = "rust_reactor"

/area/tempeterra/engineering/reactor/control
	name = "Reactor Control Room"
	icon_state = "engine_monitoring"

/area/tempeterra/engineering/reactor/fuel
	name = "Reactor Fuel Access"
	icon_state = "toxstorage"

//deck 3
/area/tempeterra/shuttle/airlock

/obj/structure/wall_frame/ocp
	material = MATERIAL_OSMIUM_CARBIDE_PLASTEEL

/obj/wallframe_spawn/reinforced_phoron/ocp
	frame_path = /obj/structure/wall_frame/ocp

/area/tempeterra/engineering/it/sensors
	name = "Forward Sensor Array"
	icon_state = "sensors"

/area/tempeterra/engineering/it/maint
	name = "Forward Maintenance"
	icon_state = "fmaint"

/area/tempeterra/engineering/it/telecomms
	name = "Telecomms Array"
	icon_state = "tcommsat"

/area/tempeterra/armaments/storage/port
	name = "Armaments Port Storage"
	icon_state = "missile_port"

/area/tempeterra/armaments/storage/starboard
	name = "Armaments Starboard Storage"
	icon_state = "missile_starboard"

/area/tempeterra/command/flight
	name = "Flight Deck"
	icon_state = "flight_deck"

/area/tempeterra/firstdeck/hallway/ladder/port
	name = "First Deck Port Ladders"
	icon_state = "stairs"

/area/tempeterra/firstdeck/hallway/ladder/starboard
	name = "First Deck Starboard Ladders"
	icon_state = "stairs"

/area/tempeterra/firstdeck/hallway/aft/midships
	name = "First Deck Aft Midships Hallway"
	icon_state = "hallc"

/area/tempeterra/firstdeck/hallway/fore/midships
	name = "First Deck Fore Midships Hallway"
	icon_state = "hallc"

/area/tempeterra/crew/kitchen
	name = "Kitchen"
	icon_state = "kitchen"

/area/tempeterra/crew/mess
	name = "Crew Mess"
	icon_state = "cafeteria"

/area/tempeterra/crew/storage
	name = "Wardroom"
	icon_state = "storage"

/area/tempeterra/crew/disposals
	name = "Disposals"
	icon_state = "disposal"

/area/tempeterra/crew/janitorial
	name = "Custodial"
	icon_state = "janitor"

/area/tempeterra/command/eva
	name = "EVA Prep"
	icon_state = "eva"

/area/tempeterra/airlock
	name = "Primary External Access"
	icon_state = "eva"

/area/tempeterra/crew/hydro
	name = "Hydroponics"
	icon_state = "hydro"

/area/tempeterra/crew/fridge
	name = "Cold Storage"
	icon_state = "kitchen"
