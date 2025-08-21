/datum/mech_equipment/weapon/shield
	name = "Осадный щит"
	action_icon = 'mods/_fd/_maps/baycore_foranswer/icons/ui.dmi'
	action_state = "15"

	integrity_damage = 5 // Дамаг пока такой, ибо я всё ещё не знаю, планируем мы повышать урон, или наоборот понижать хп
	hull_damage = 0

	attack_sound = 'sound/weapons/pushhiss.ogg'

/datum/mech_equipment/weapon/shield/use(atom/target, params)
	. = ..()
	if(!.)
		return .

	if(istype(target, /mob/living/simple_animal/fd/lancer))
		var/mob/living/simple_animal/fd/lancer/L = target

		L.throw_at(get_edge_target_turf(L, get_dir(src, L)), 5, 3, src)

	return .
