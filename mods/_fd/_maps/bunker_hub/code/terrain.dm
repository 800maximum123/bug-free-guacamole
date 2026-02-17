/turf/simulated/floor/exoplanet/fd/whitesand
	icon = 'mods/_fd/fd_assets/icons/konyang_beach.dmi'
	icon_state = "sand"
	name = "sand"
	desc = "Salty."

	footstep_type = /singleton/footsteps/sand

/turf/simulated/floor/exoplanet/fd/desertsand
	icon = 'mods/_fd/fd_assets/icons/desert.dmi'
	icon_state = "desert"
	name = "sand"
	desc = "Windy."

	footstep_type = /singleton/footsteps/sand

/turf/simulated/floor/exoplanet/fd/drought
	icon = 'mods/_fd/fd_assets/icons/battlefield.dmi'
	icon_state = "wasteland"
	name = "sand"
	desc = "Dead."

	footstep_type = /singleton/footsteps/sand

/turf/simulated/floor/exoplanet/fd/drought/Initialize()
	var/newicon = rand(1,32)
	icon_state = "wasteland[newicon]"

	. = ..()

/turf/simulated/floor/exoplanet/fd/waste
	icon = 'mods/_fd/fd_assets/icons/wasteplanet.dmi'
	icon_state = "wasteplanet0"
	name = "dead land"
	desc = "REALLY dead."

	footstep_type = /singleton/footsteps/asteroid

/turf/simulated/floor/exoplanet/fd/waste/Initialize()
	var/newicon = rand(1,24)
	icon_state = "wasteplanet[newicon]"

	. = ..()

/turf/simulated/floor/exoplanet/fd/messygrass
	icon = 'mods/_fd/fd_assets/icons/konyang.dmi'
	icon_state = "grass"
	name = "grass"
	desc = "Touch it."

	footstep_type = /singleton/footsteps/grass

/obj/floor_decal/messygrass
	name = "grass edges"
	icon = 'mods/_fd/fd_assets/icons/konyang.dmi'
	icon_state = "edge1"
	layer = 2.24

/obj/floor_decal/messygrass/Initialize()
	. = ..()
	var/newicon = rand(1,3)
	icon_state = "edge[newicon]"

/turf/simulated/floor/exoplanet/fd/grass
	icon = 'mods/_fd/fd_assets/icons/moghes.dmi'
	icon_state = "grass"
	name = "grass"
	desc = "Touch it."
	color = "#8eb35f"

	footstep_type = /singleton/footsteps/grass

/turf/simulated/floor/exoplanet/fd/muddirt
	icon = 'mods/_fd/fd_assets/icons/moghes.dmi'
	icon_state = "dirt"
	name = "dirt"
	desc = "Ugh, gross."
	color = "#887d60"

	footstep_type = /singleton/footsteps/asteroid
