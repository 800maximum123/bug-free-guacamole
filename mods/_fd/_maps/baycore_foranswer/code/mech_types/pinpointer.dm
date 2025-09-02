/obj/structure/fd/mech_wreckage/medium/pinpointer
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/mechs/trooper_def.dmi'
	icon_state = "trooper_death_1"

	pixel_y = 0
	pixel_x = 0
	bound_width = 256
	bound_height = 64

/obj/structure/fd/mech_wreckage/medium/pinpointer/Initialize()
	. = ..()
	var/state = rand(1,9)
	icon_state = "trooper_death_[state]"

/mob/living/simple_animal/fd/lancer/pinpointer
	name = "APU Napoleon"
	desc = "Являясь одним из рядовых, 'Наполеон' также наиболее привередлив к пилотам. Нет никаких проблем научиться управлять данной моделью. Но вот довести этот навык до идеала..."

	abilities = list(
		/datum/mech_ability/death_mark,
		/datum/mech_ability/action/ammunition_change,
		/datum/mech_ability/action/smoke_deployer,
		/datum/mech_ability/action/firemode_change
	)
	equipment = list(
		/datum/mech_equipment/firearm/revolver,
		/datum/mech_equipment/weapon/fist,
		/datum/mech_equipment/firearm/grenade_launcher,
		/datum/mech_equipment/firearm/assault_rifle
	)

	armor_stat = 5

	integrity = 300
	integrity_max = 300

	heat_max = 8

	base_movement_cooldown = 3

	wreck_type = /obj/structure/fd/mech_wreckage/medium/pinpointer
