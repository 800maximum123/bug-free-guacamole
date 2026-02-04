/turf/simulated/wall/invincible/jungle

/turf/simulated/wall/invincible/jungle/New(newloc)
	..(newloc)

/turf/simulated/wall/invincible/jungle/Initialize()
	. = ..()
	icon = 'mods/_fd/fd_assets/icons/turfs/wall/jungle_veg.dmi'
	icon_state = "jungle_veg"
	desc = "A peculiar wall made of welded-together plant matter."

// /turf/simulated/wall/invincible/jungle/update_connections(propagate = 0)
//	..(propagate)

/turf/simulated/wall/invincible/jungle/update_icon()
	icon_state = "jungle_veg[connections]"
