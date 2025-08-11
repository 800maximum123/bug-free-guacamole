/obj/item/projectile/bullet/mech
	name = "bullet"
	icon_state = "bullet"
	fire_sound = null
	damage = 0
	damage_type = DAMAGE_BRUTE
	damage_flags = DAMAGE_FLAG_BULLET
	embed = FALSE
	fire_sound = 'sound/weapons/guns/ricochet4.ogg'

	var/real_damage = 10 // Реальный дамаг по мехам
	var/piercing = FALSE // Игнорирует армор?
