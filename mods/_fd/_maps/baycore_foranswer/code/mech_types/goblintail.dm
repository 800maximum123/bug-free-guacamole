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
	desc = "An spec-ops lightweight APU model with installed stealth-tech."
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/mechs/scout_def.dmi'
	icon_state = "scout"

	abilities = list(
		/datum/mech_ability/action/change_module,
		/datum/mech_ability/action/reboot,
		/datum/mech_ability/action/toggle_safety,
		/datum/mech_ability/action/toggle_cloak,
		/datum/mech_ability/intrusion,
		/datum/mech_ability/action/boosters_passive,
		/datum/mech_ability/boosters_quick,
	)
	equipment = list(
		/datum/mech_equipment/firearm,
		/datum/mech_equipment/weapon,
	)

	integrity = 300
	integrity_max = 300

	heat_overflow = 10
	repairs = 2

	base_movement_cooldown = 3

	spare_magazines = 4

	pixel_x = -105
	default_pixel_x = -105
	pixel_y = -76
	default_pixel_y = -76

	wreck_type = /obj/structure/fd/mech_wreckage/small/goblin

/obj/item/projectile/bullet/mech/goblintail
	integrity_damage = 5
	hull_damage = 5
	fire_sound = 'sound/weapons/gunshot/gunshot.ogg'
