/obj/structure/fd/mech_wreckage/medium/swarmer
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/mechs/trooper_def.dmi'
	icon_state = "trooper_death_1"

	bound_width = 256
	bound_height = 64

/mob/living/simple_animal/fd/lancer/ascent/swarmer
	name = "Swarm Unit"
	desc = "Подобно чумным крысам - Свормеры крайне назойливы и живучи. Не представляя угрозы один-на-один - \
	они наводняют поле боя армиями самоубийственных, но крайне эффективных солдат."
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/mechs/enemy/swarmer.dmi'
	icon_state = "swarmer"

	faction = "Ascents"

	pixel_x = -105
	default_pixel_x = -105
	pixel_y = -55
	default_pixel_y = -55

	abilities = list(
		/datum/mech_ability/action/change_module,
		/datum/mech_ability/action/reboot,
		/datum/mech_ability/action/boosters_passive,
		/datum/mech_ability/action/toggle_safety,

		/datum/mech_ability/grab_swarmer
	)

	equipment = list(
		/datum/mech_equipment/weapon/ascent_torch,

	)

	armor_stat = 5
	integrity = 200
	integrity_max = 200

	heat_max = 10
	repairs = 0
	base_movement_cooldown = 6
	wreck_type = /obj/structure/fd/mech_wreckage/medium/swarmer
