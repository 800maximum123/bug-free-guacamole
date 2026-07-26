/turf/unsimulated/floor/exoplanet/fd/desertsand
	icon = 'mods/_fd/fd_assets/icons/desert.dmi'
	icon_state = "desert"
	name = "sand"
	desc = "Windy."

	footstep_type = /singleton/footsteps/sand

/turf/unsimulated/floor/exoplanet/fd/drought
	icon = 'mods/_fd/fd_assets/icons/battlefield.dmi'
	icon_state = "wasteland"
	name = "sand"
	desc = "Dead."

	footstep_type = /singleton/footsteps/sand

/turf/unsimulated/floor/exoplanet/fd/drought/Initialize()
	var/newicon = rand(1,32)
	icon_state = "wasteland[newicon]"

	. = ..()

/turf/unsimulated/floor/exoplanet/gravel
	name = "gravel"
	desc = "Just a gravel, nothing special."
	icon = 'mods/_fd/_maps/small_exoplanet_1/icons/turf_floor_grim.dmi'
	icon_state = "gravel"

/turf/unsimulated/floor/exoplanet/gravel/New()
	..()
	icon_state = "gravel_[rand(1, 4)]"

/turf/unsimulated/mineral/desert
	name = "sandstone rock"
	color = COLOR_WHEAT
