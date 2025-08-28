/datum/mech_ability/action/accelerate
	name = "Разгон Модуля"
	action_icon = 'mods/_fd/_maps/baycore_foranswer/icons/ui.dmi'
	action_state = "accelerate"

	charges_max = 4
	charges = 4

	var/datum/mech_equipment/buffed

/datum/mech_ability/action/accelerate/use(atom/target, params)
	. = ..()
	if(!.)
		return

	if(isnull(buffed))
		buffed = owner.selected_equipment
		addtimer(new Callback(src, PROC_REF(reset_after)), 20 SECONDS)

	if(buffed.cooldown <= 0)
		to_chat(owner, SPAN_WARNING("<[buffed.name]> находится на пределе своего разгона!"))
		return FALSE

	owner.visible_message(SPAN_DANGER("[owner] начинает неистово разгонять своё орудие!"), SPAN_INFO("Ты начинаешь раскручивать ствол [buffed.name]."))

	if(!do_after(owner, 2 SECONDS))
		return FALSE

	owner.heat += 2
	if(owner.overheated)
		buffed.cooldown -= 2 SECONDS
	else
		buffed.cooldown -= 1 SECOND
	playsound(get_turf(src),'mods/_fd/immersive_sounds/sounds/SOMA/computer_fan_turn_on.ogg',100)
	new /obj/effect/mech_particle/accelerating(owner.loc)

	return .

/datum/mech_ability/action/accelerate/proc/reset_after()
	buffed.cooldown = initial(buffed.cooldown)
	charges = charges_max
	buffed = null
