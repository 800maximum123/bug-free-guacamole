/obj/structure/fd/mech_wreckage/small/goblin
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/mechs/scout_def.dmi'
	icon_state = "scout_death_1"

	pixel_y = 0
	pixel_x = 0
	bound_width = 160
	bound_height = 64

/obj/structure/fd/mech_wreckage/small/goblin/Initialize()
	. = ..()
	var/state = rand(1,4)
	icon_state = "scout_death_[state]"

/mob/living/simple_animal/fd/lancer/goblintail
	name = "L-APU Goblintail"
	desc = "Специальный легковесный фрейм, рассчитанный на ведение боя из тени."
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/mechs/scout_def.dmi'
	icon_state = "scout"

	abilities = list(
		/datum/mech_ability/action/toggle_cloak,
		/datum/mech_ability/intrusion,
		/datum/mech_ability/body_swap,
		/datum/mech_ability/action/flash
	)
	equipment = list(
		/datum/mech_equipment/firearm/submachinegun,
		/datum/mech_equipment/weapon/nano_whip,
	)

	armor_stat = 5
	armor_durability = 50 // Износ брони

	integrity = 200
	integrity_max = 200

	heat_max = 14

	scan_delay = 0.5 SECONDS
	base_movement_cooldown = 2

	pixel_x = -105
	default_pixel_x = -105
	pixel_y = -76
	default_pixel_y = -76

	wreck_type = /obj/structure/fd/mech_wreckage/small/goblin
