var/global/const/POSTER_FLAG_GAIA = FLAG(2)

/obj/structure/sign/poster/gaia
	name = "ICCG propaganda poster"
	icon = 'maps/gaia/icons/posters.dmi'
	random_poster_base_type = /singleton/poster/gaia
	excluded_poster_flags = POSTER_FLAG_CONTRABAND || POSTER_FLAG_RANDOM_PICK

// Gaia propaganda posters
/singleton/poster/gaia
	poster_flags = POSTER_FLAG_GAIA

/singleton/poster/gaia/gaia_1
	icon_state = "gaiaposter1"
	name = "Looming Imperialism"
	desc = "Omnious depiction of a large hand of Sol looming over Gaia dripping blood on it."
	poster_flags = POSTER_FLAG_GAIA

/singleton/poster/gaia/gaia_2
	icon_state = "gaiaposter2"
	name = "YOU!"
	desc = "A recruitment poster showing premier-minister of ICCG persuading local Gaian population to colloborate with the ICCG."
	poster_flags = POSTER_FLAG_GAIA

/singleton/poster/gaia/gaia_3
	icon_state = "gaiaposter3"
	name = "Gilgamesh outshines Sol"
	desc = "Depiction of the star Gilgamesh outshining Sol and casting a shadow on it. You have no idea how a shadow can be cast in space, but the artist seems to know what they are doing."
	poster_flags = POSTER_FLAG_GAIA

/singleton/poster/gaia/gaia_4
	icon_state = "gaiaposter4"
	name = "Confederate Dome"
	desc = "Poster shows Gaia being shielded by a ICCG flag deflecting Sol missiles away."
	poster_flags = POSTER_FLAG_GAIA

/singleton/poster/gaia/gaia_5
	icon_state = "gaiaposter5"
	name = "Independent Confederation of Gilgamesh"
	desc = "Massive ICCG seal on a black background, around the symbol are the words 'Independent Confederation of Gilgamesh' in bold letters."
	poster_flags = POSTER_FLAG_GAIA

/singleton/poster/gaia/gaia_6
	icon_state = "gaiaposter6"
	name = "DEMOCRACY, LIBERTY, JUSTICE"
	desc = "A massive red and blue crowd is cheering in front of a ICCG flag with a dove flying above."
	poster_flags = POSTER_FLAG_GAIA

/singleton/poster/gaia/gaia_7
	icon_state = "gaiaposter7"
	name = "CARRY YOUR PASSPORT"
	desc = "Large red passport is plastered on the poster, bold words above say 'CARRY YOUR PASSPORT AT ALL TIMES' and below it says 'PROTECT YOURSELF FROM THE DANGERS OF SOL'."
	poster_flags = POSTER_FLAG_GAIA

/singleton/poster/gaia_random
	icon_state = "random_poster"
	name = "Gaia Poster"
	desc = "You probably shouldn't be seeing this."
	abstract_type = /singleton/poster/gaia_random
	poster_flags = POSTER_FLAG_GAIA

// non-random posters
/obj/structure/sign/poster/gaia_1
	name = "ICCG propaganda poster"
	icon = 'maps/gaia/icons/posters.dmi'
	random_poster_base_type = /singleton/poster/gaia/gaia_1

/obj/structure/sign/poster/gaia_2
	name = "ICCG propaganda poster"
	icon = 'maps/gaia/icons/posters.dmi'
	random_poster_base_type = /singleton/poster/gaia/gaia_2

/obj/structure/sign/poster/gaia_3
	name = "ICCG propaganda poster"
	icon = 'maps/gaia/icons/posters.dmi'
	random_poster_base_type = /singleton/poster/gaia/gaia_3

/obj/structure/sign/poster/gaia_4
	name = "ICCG propaganda poster"
	icon = 'maps/gaia/icons/posters.dmi'
	random_poster_base_type = /singleton/poster/gaia/gaia_4

/obj/structure/sign/poster/gaia_5
	name = "ICCG propaganda poster"
	icon = 'maps/gaia/icons/posters.dmi'
	random_poster_base_type = /singleton/poster/gaia/gaia_5

/obj/structure/sign/poster/gaia_6
	name = "ICCG propaganda poster"
	icon = 'maps/gaia/icons/posters.dmi'
	random_poster_base_type = /singleton/poster/gaia/gaia_6

/obj/structure/sign/poster/gaia_7
	name = "ICCG propaganda poster"
	icon = 'maps/gaia/icons/posters.dmi'
	random_poster_base_type = /singleton/poster/gaia/gaia_7
