/datum/mech_equipment/weapon
	name = "Лезвие"
	action_icon = 'mods/_fd/_maps/baycore_foranswer/icons/mechs/mech_ui.dmi'
	action_state = "melee_weapon"

	/// Реальный дамаг по мехам
	var/integrity_damage = 10

	/// Относительный урон броне
	var/hull_damage = 10

	/// Насколько далеко мы можем бить этим оружием?
	var/attack_distance = 1

	/// Игнорирует армор?
	var/shredding = FALSE

	/// Звук, воспроизводящийся при ударе
	var/attack_sound = 'sound/weapons/rapidslice.ogg'

/datum/mech_equipment/weapon/use(atom/target, params)
	. = ..()
	if(!.)
		return .

	if(!istype(target, /mob/living/simple_animal/fd/lancer))
		return FALSE

	var/mob/living/simple_animal/fd/lancer/mech = target

	mech.recieve_damage(integrity_damage, hull_damage, shredding)

	owner.do_attack_animation(mech)
	playsound(get_turf(owner), attack_sound, 100, TRUE)

	return .

/datum/mech_equipment/weapon/handle_use(atom/target, params)
	if(get_dist(owner, target) > attack_distance)
		return FALSE

	if(owner.weapon_safety)
		to_chat(owner, SPAN_WARNING("Включенный предохранитель не позволяет ударить при помощи <[name]>!"))
		return FALSE

	owner.face_atom(target)
	return ..()
