/obj/structure/fd/mech_wreckage/big
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/mechs/heavy_def.dmi'
	icon_state = "heavy_death_1"

	pixel_y = 0
	pixel_x = 0
	bound_width = 256
	bound_height = 64

/obj/structure/fd/mech_wreckage/big/Initialize()
	. = ..()
	var/state = rand(1,7)
	icon_state = "heavy_death_[state]"

/mob/living/simple_animal/fd/lancer/drake
	name = "H-APU Drake"
	desc = "Боевая машина, собранная с одним единственным намерением - выстоять."
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/mechs/heavy_def.dmi'
	icon_state = "heavy"

	pixel_x = -110
	default_pixel_x = -110
	pixel_y = -30
	default_pixel_y = -30

	abilities = list(
		/// ТЕСТ
		/datum/mech_ability/action/bunker,
		/datum/mech_ability/ground_slam,
		/datum/mech_ability/action/accelerate
	)
	equipment = list(
		/datum/mech_equipment/firearm/assault_cannon,
		/datum/mech_equipment/weapon/shield
	)

	armor_stat = 5
	armor_durability = 200
	integrity = 500
	integrity_max = 500

	heat_max = 8
	base_movement_cooldown = 6

	wreck_type = /obj/structure/fd/mech_wreckage/big
