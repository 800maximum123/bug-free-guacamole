/obj/structure/fd/mech_wreckage/medium/napoleon
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/mechs/trooper_def.dmi'
	icon_state = "trooper_death_1"

	pixel_y = 0
	pixel_x = 0
	bound_width = 256
	bound_height = 64

/obj/structure/fd/mech_wreckage/medium/napoleon/Initialize()
	. = ..()
	var/state = rand(1,9)
	icon_state = "trooper_death_[state]"

/mob/living/simple_animal/hostile/fd/mech/napoleon
	name = "Armored Personal Unit (APU)"
	desc = "An special experimental vehicle."
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/mechs/trooper_def.dmi'
	icon_state = "trooper"
	icon_living = "trooper"

	armor_stat = 2

	integrity = 500
	integrity_max = 500
	repairs_left = 2

	heat_overflow = 10

	weapon_equipped = "Riot Shotgun"

	wreck_type = /obj/structure/fd/mech_wreckage/medium/napoleon
