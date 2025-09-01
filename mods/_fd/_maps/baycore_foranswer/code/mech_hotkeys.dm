#define ismech(A) istype(A, /mob/living/simple_animal/fd/lancer)
#define CATEGORY_MECH "LANCER"

/datum/keybinding/mech_general
	category = CATEGORY_MECH

/datum/keybinding/mech_general/can_use(client/user)
	return ismech(user.mob)

/datum/keybinding/mech_general/reload_weapon
	hotkey_keys = list("R")
	name = "reload_weapon"
	full_name = "General: GUN RELOAD"
	description = ""

/datum/keybinding/mech_general/reload_weapon/down(client/user)
	var/mob/living/simple_animal/fd/lancer/L = user.mob
	L.reload_weapon()
	return TRUE

/mob/living/simple_animal/fd/lancer/verb/reload_weapon()
	set name = "reload_weapon"
	set hidden = 1

	for(var/datum/mech_ability/action/reload_firearm/R in abilities)
		R.use()

#undef CATEGORY_MECH
