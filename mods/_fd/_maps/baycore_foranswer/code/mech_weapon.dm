/datum/mech_equipment/weapon
	name = "Лезвие"

	/// Реальный дамаг по мехам
	var/integrity_damage = 10

	/// Относительный урон броне
	var/hull_damage = 10

	/// Игнорирует армор?
	var/shredding = FALSE

	/// Насколько далеко мы можем бить этим оружием?
	var/attack_distance = 1

/datum/mech_equipment/weapon/use(atom/target, params)
	. = ..()
	if(!.)
		return .

	if(!istype(target, /mob/living/simple_animal/hostile/fd/lancer))
		return FALSE

	var/mob/living/simple_animal/hostile/fd/lancer/mech = target

	owner.do_attack_animation(mech)
	mech.recieve_damage(integrity_damage, hull_damage, shredding)

	return .

/datum/mech_equipment/weapon/handle_use(atom/target, params)
	if(get_dist(owner, target) > attack_distance)
		return FALSE

	if(owner.weapon_safety)
		to_chat(target, SPAN_WARNING("Включенный предохранитель не позволяет ударить при помощи <[name]>!"))
		return FALSE

	return ..()
