/obj/overmap/event/ship_wreck
	name = "unknown wreck"
	icon = 'mods/_fd/fd_assets/icons/overmap_eris.dmi'
	opacity = 0
	color = "#888888" // = spawned but not assigned, error
	weaknesses = OVERMAP_WEAKNESS_MINING | OVERMAP_WEAKNESS_EXPLOSIVE

/obj/overmap/event/ship_wreck/Initialize()
	. = ..()


/obj/overmap/event/ship_wreck/tiny_ship_wreck
	name = "tiny ship wreck"
	icon = 'mods/_fd/fd_assets/icons/overmap.dmi'
	event_icon_states = list("dust1", "dust2", "dust3", "dust4")
	difficulty = EVENT_LEVEL_MUNDANE

/obj/overmap/event/ship_wreck/small_ship_wreck
	name = "small ship wreck"
	icon = 'mods/_fd/fd_assets/icons/overmap.dmi'
	event_icon_states = list("mines1", "mines2", "mines3", "mines4")
	events = list(/datum/event/dust)
	difficulty = EVENT_LEVEL_MODERATE

/obj/overmap/event/ship_wreck/large_ship_wreck
	name = "large ship wreck"
	icon = 'mods/_fd/fd_assets/icons/overmap.dmi'
	event_icon_states = list("ship_exploded")
	events = list(/datum/event/meteor_wave/overmap)
	difficulty = EVENT_LEVEL_MAJOR
