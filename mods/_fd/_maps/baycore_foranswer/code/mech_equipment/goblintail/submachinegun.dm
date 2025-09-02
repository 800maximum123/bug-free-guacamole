/datum/mech_equipment/firearm/submachinegun
	name = "Пистолет-пулемёт"
	action_state = "light_weapon"

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
	for(var/datum/mech_ability/action/toggle_cloak/ability in owner.abilities)
		invis = ability
		break

	if(!invis || !invis.state)
		return .

	if(burst_count >= burst_size)
		invis.next_use = 0
		invis.use()

	projectile.integrity_damage += 10

/obj/item/projectile/bullet/mech/goblintail
	integrity_damage = 5
	hull_damage = 5
	fire_sound = 'sound/weapons/gunshot/gunshot.ogg'
