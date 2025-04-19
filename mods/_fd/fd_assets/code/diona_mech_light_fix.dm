// Добавляет простую фичу: дионы теперь могут получать еду, которую они обычно получают от света, в мехах, но только если те включены
// https://discord.com/channels/1075532954253656104/1348381810597302292
// - Tech-priest-34

/obj/item/organ/internal/diona/node/Process()
	..()
	if(is_broken() || !owner)
		return
	var/light_amount = 0 //how much light there is in the place, affects receiving nutrition and healing
	if(isturf(owner.loc)) //else, there's considered to be no light
		var/turf/T = owner.loc
		light_amount = T.get_lumcount() * 10
	// ---===--- FD CHANGES ---===---
	else
		if(istype(owner.loc, /mob/living/exosuit))
			var/mob/living/exosuit/piloted_mech = owner.loc
			if(piloted_mech.power == MECH_POWER_ON)
				light_amount = 1 * 10 // Max light level?
	// ---===--- FD CHANGES ---===---
	owner.set_nutrition(clamp(owner.nutrition + light_amount, 0, 550))
	owner.shock_stage -= light_amount


// exosuit.pilots
// power = MECH_POWER_ON
