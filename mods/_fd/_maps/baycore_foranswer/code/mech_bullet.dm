/obj/item/projectile/bullet/mech
	name = "bullet"
	icon_state = "bullet"
	fire_sound = 'sound/weapons/guns/ricochet4.ogg'
	damage = 0
	distance_falloff = 0.1
	embed = FALSE
	damage_type = DAMAGE_BRUTE
	damage_flags = DAMAGE_FLAG_BULLET

	var/bullet_size = 2 // Множитель размера пули
	var/integrity_damage = 10 // Реальный дамаг по мехам
	var/hull_damage = 10 // Относительный урон броне
	var/shredding = FALSE // Игнорирует армор?

/obj/item/projectile/bullet/mech/pistol
	integrity_damage = 5

/obj/item/projectile/bullet/mech/on_hit(atom/target, blocked = 0)
	if(istype(target, /mob/living/simple_animal/hostile/ascent_trooper))
		var/mob/living/simple_animal/hostile/ascent_trooper/AT = target
		AT.gib()

	if(istype(target, /mob/living/simple_animal/fd/lancer))
		var/mob/living/simple_animal/fd/lancer/M = target
		if(M.vulnerable)
			integrity_damage *= 2

		M.recieve_damage(integrity_damage = integrity_damage, hull_damage = hull_damage, shredding = shredding, do_animation = TRUE)

/*		if(M.overprotected)
			for(var/mob/living/simple_animal/fd/lancer/saladin/D in range(13, get_turf(src)))
				if(D.protected != M)
					continue
				D.shield_integrity -= final_damage
				D.heat += 1
				D.damage_animation(0, ignore_armor = FALSE)
				return TRUE*/

/obj/item/projectile/bullet/mech/launch(atom/target, target_zone, x_offset, y_offset, angle_offset)
	. = ..()

	spawn(rand(0.5 SECONDS, 1 SECONDS))
		playsound(get_turf(firer), pick(list('sound/weapons/guns/casingfall1.ogg','sound/weapons/guns/casingfall2.ogg','sound/weapons/guns/casingfall3.ogg')), 25, TRUE)
