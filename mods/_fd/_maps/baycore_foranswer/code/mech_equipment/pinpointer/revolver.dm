/datum/mech_equipment/firearm/revolver
	name = "Револьвер"
	action_icon = 'mods/_fd/_maps/baycore_foranswer/icons/ui.dmi'
	action_state = "26"

	ammo = 6
	max_ammo = 6
	magazines = 12
	max_magazines = 12

	bullet_type = /obj/item/projectile/bullet/mech/revolver
	reload_time = 6 SECONDS

	cooldown = 1 SECONDS

/datum/mech_equipment/firearm/revolver/fire(atom/target, params, obj/item/projectile/bullet/mech/projectile, burst_count)

	projectile.firer = owner
	var/mob/living/simple_animal/fd/lancer/L = projectile.firer
	for(var/datum/mech_ability/death_mark/DM in L.abilities)
		if(DM.charges == 1)
			projectile.shredding = TRUE
	. = ..()


/obj/item/projectile/bullet/mech/revolver
	icon_state = "bolter"
	fire_sound = 'sound/weapons/gunshot/gunshot3.ogg'

	integrity_damage = 20
	hull_damage = 0

/obj/item/projectile/bullet/mech/revolver/on_hit(atom/target, blocked = 0)
	. = ..()

	if(istype(target, /mob/living/simple_animal/fd/lancer))
		if(istype(firer, /mob/living/simple_animal/fd/lancer))
			var/mob/living/simple_animal/fd/lancer/L = firer
			for(var/datum/mech_ability/death_mark/DM in L.abilities)
				DM.charges -= 1
