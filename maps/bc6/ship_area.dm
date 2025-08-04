
/area/bc6/interior
	name = "\improper Ship Interior"
	icon_state = "teleporter"

/area/bc6/engineering
	name = "\improper Ship Engineering"
	icon_state = "engine"
	req_access = list(access_engine)
	area_flags = AREA_FLAG_RAD_SHIELDED | AREA_FLAG_ION_SHIELDED


/area/bc6/hangar
	name = "\improper Ship Hangar"
	icon_state = "hangar"
	sound_env = LARGE_ENCLOSED

/area/bc6/bridge
	name = "\improper Ship Bridge"
	ambience = list('sound/ambience/ambisin2.ogg', 'sound/ambience/signal.ogg', 'sound/ambience/signal.ogg', 'sound/ambience/ambigen10.ogg')
	icon_state = "bridge"
