/datum/mech_equipment/firearm/assault_rifle
	name = "Штурмовая винтовка"

	ammo = 48
	max_ammo = 48
	magazines = 9
	max_magazines = 9

	bullet_type = /obj/item/projectile/bullet/mech/assault_rifle
	burst_size = 6
	reload_time = 6 SECONDS

	speed_debuff = 1
	cooldown = 1 SECONDS

/obj/item/projectile/bullet/mech/assault_rifle
	icon_state = "bolter"
	fire_sound = 'sound/weapons/gunshot/gunshot_strong.ogg'

	integrity_damage = 2
	hull_damage = 4
