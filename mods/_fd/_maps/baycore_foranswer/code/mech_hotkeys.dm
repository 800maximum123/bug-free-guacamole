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

/datum/keybinding/mech_general/quick_boost
	hotkey_keys = list("Space")
	name = "quick_boost"
	full_name = "General: QUICK-BOOST"
	description = ""
	var/list/forbid_quickboost = list(/mob/living/simple_animal/fd/lancer/ascent/swarmer, /mob/living/simple_animal/fd/lancer/drake)

/datum/keybinding/mech_general/quick_boost/can_use(client/user)
	var/mob/living/simple_animal/fd/lancer/L = user.mob
	if(L in forbid_quickboost)
		return
	. = ..()

/datum/keybinding/mech_general/quick_boost/down(client/user)
	var/mob/living/simple_animal/fd/lancer/L = user.mob
	L.perform_qb()
	return TRUE

/mob/living/simple_animal/fd/lancer/verb/perform_qb()
	set name = "quick_boost"
	set hidden = 1

	for(var/datum/mech_ability/boosters_quick/B in abilities)
		B.use()

/datum/keybinding/mech_general/zoom
	hotkey_keys = list("F")
	name = "zoom"
	full_name = "General: ZOOM"
	description = ""

/datum/keybinding/mech_general/zoom/down(client/user)
	var/mob/living/simple_animal/fd/lancer/L = user.mob

	if(L.set_zoom(!L.zoom))
		L.precise_zoom = TRUE
		user.last_mouse_position = null

	. = ..()

/datum/keybinding/mech_general/zoom/up(client/user)
	var/mob/living/simple_animal/fd/lancer/L = user.mob

	if(L.precise_zoom)
		L.set_zoom(TRUE)
	L.precise_zoom = FALSE

	. = ..()

#undef CATEGORY_MECH
