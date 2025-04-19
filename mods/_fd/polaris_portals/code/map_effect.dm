// These are objects you can use inside special maps or for adminbuse.
// Players cannot see or interact with these.
// Ported from polaris, doesn't actually do much other than provide a definition portals can use.
/obj/map_effect
	anchored = TRUE
	invisibility = 99 // So a badmin can go view these by changing their see_invisible.
	icon = 'mods/_fd/polaris_portals/icons/map_effects.dmi'

/obj/map_effect/ex_act()
	return

/obj/map_effect/singularity_pull()
	return

/obj/map_effect/singularity_act()
	return
