/datum/mech_equipment/firearm/submachinegun
	name = "Пистолет-пулемёт"
	action_icon = 'mods/_fd/_maps/baycore_foranswer/icons/ui.dmi'
	action_state = "26"

	max_ammo = 60
	max_magazines = 3

	bullet_type = /obj/item/projectile/bullet/mech/goblintail

	burst_size = 3
	burst_interval = 0.2 SECONDS

	reload_time = 3 SECONDS
	cooldown = 1 SECONDS

/datum/mech_equipment/firearm/submachinegun/fire(atom/target, params, obj/item/projectile/bullet/mech/projectile, burst_count)
	. = ..()

	var/datum/mech_ability/action/toggle_cloak/invis
	for(var/ability in owner.abilities)
		if(istype(ability, /datum/mech_ability/action/toggle_cloak))
			invis = ability

	if(!invis || !invis.state)
		return .

	if(burst_count >= burst_size)
		invis.use()

	projectile.integrity_damage += 10

/obj/item/projectile/bullet/mech/goblintail
	integrity_damage = 5
	hull_damage = 5
	fire_sound = 'sound/weapons/gunshot/gunshot.ogg'
