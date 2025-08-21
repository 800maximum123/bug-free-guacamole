/datum/mech_ability/grab_swarmer
	name = "Схватить"

	action_icon = 'mods/_fd/_maps/baycore_foranswer/icons/ui.dmi' // Поменять
	action_state = "9" // Поменять

	required_params = list("ctrl")
	cooldown = 10 SECONDS

	var/mob/living/simple_animal/fd/lancer/grabbed
	var/mutable_appearance/grabbed_overlay
	var/grabbed_someone = FALSE

/datum/mech_ability/grab_swarmer/use(atom/target, params)
	. = ..()
	if(!.)
		return

	if(istype(target, /mob/living/simple_animal/fd/lancer))
		var/mob/living/simple_animal/fd/lancer/L = target
		if(grabbed_someone && !isnull(grabbed))
			detach(grabbed)

			spawn(0.5 SECONDS)
				attach(L)
				addtimer(new Callback(src, PROC_REF(detach(grabbed))), 10 SECONDS)
		else if(!grabbed_someone && isnull(grabbed))
			attach(L)
			addtimer(new Callback(src, PROC_REF(detach(grabbed))), 10 SECONDS)

	return .

/datum/mech_ability/grab_swarmer/attach(mob/living/simple_animal/fd/lancer/target)
	speed_debuff = -4

	target.forceMove(owner)
	grabbed = target
	grabbed_overlay = mutable_appearance(target.icon, target.icon_state)
	grabbed_overlay.pixel_x = target.pixel_x - 100
	grabbed_overlay.layer = ABOVE_OBJ_LAYER
	grabbed_overlay.mouse_opacity = FALSE

	grabbed_someone = TRUE

	owner.AddOverlays(grabbed_overlay)

/datum/mech_ability/grab_swarmer/detach(mob/living/simple_animal/fd/lancer/target)
	speed_debuff = 0

	grabbed.forceMove(get_turf(owner))
	grabbed = null
	contents -= grabbed

	grabbed_someone = FALSE

	owner.CutOverlays(grabbed_overlay)
	return TRUE
