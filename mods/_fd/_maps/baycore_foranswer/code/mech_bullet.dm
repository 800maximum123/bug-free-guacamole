/obj/item/projectile/bullet/mech
	name = "bullet"
	icon_state = "bullet"
	fire_sound = null
	damage = 0
	damage_type = DAMAGE_BRUTE
	damage_flags = DAMAGE_FLAG_BULLET
	embed = FALSE
	fire_sound = 'sound/weapons/guns/ricochet4.ogg'

	var/bullet_size = 2 // Множитель размера пули
	var/real_damage = 10 // Реальный дамаг по мехам
	var/piercing = FALSE // Игнорирует армор?

/obj/item/projectile/bullet/mech/pistol
	real_damage = 5

/obj/item/projectile/bullet/mech/on_hit(atom/target, blocked = 0)
	if(istype(target, /mob/living/simple_animal/hostile/fd/mech))
		var/mob/living/simple_animal/hostile/fd/mech/M = target
		var/final_damage = real_damage
		if(M.leader_target)
			final_damage *= 2

		if(!piercing)
			final_damage -= M.armor_stat

		if(M.shielded)
			for(var/mob/living/simple_animal/hostile/fd/mech/drake/D in view(2,src))
				if(!D.damaged)
					D.integrity -= final_damage
				if(piercing)
					D.damage_animation(final_damage, ignore_armor = TRUE)
					return TRUE
				else
					D.damage_animation(final_damage)
					return TRUE

		if(M.overprotected)
			for(var/mob/living/simple_animal/hostile/fd/mech/saladin/D in range(13, get_turf(src)))
				if(D.protected != M)
					continue
				D.shield_integrity -= final_damage
				D.heat += 1
				D.damage_animation(0, ignore_armor = FALSE)
				return TRUE

		if(!M.damaged)
			M.integrity -= final_damage
		if(piercing)
			M.damage_animation(real_damage, ignore_armor = TRUE)
		else
			M.damage_animation(real_damage)

/obj/item/projectile/bullet/mech/launch(atom/target, target_zone, x_offset, y_offset, angle_offset)
	. = ..()

	spawn(rand(0.5 SECONDS, 1 SECONDS))
		playsound(get_turf(firer), pick(list('sound/weapons/guns/casingfall1.ogg','sound/weapons/guns/casingfall2.ogg','sound/weapons/guns/casingfall3.ogg')), 25, TRUE)
