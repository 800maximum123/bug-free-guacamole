#define ispinpointer(A) istype(A, /mob/living/simple_animal/fd/lancer/pinpointer)
#define CATEGORY_MECH_PIN "LANCER - PINPOINTER"

/datum/keybinding/pinpointer
	category = CATEGORY_MECH_PIN

/datum/keybinding/pinpointer/can_use(client/user)
	return ispinpointer(user.mob)

/datum/keybinding/pinpointer/revolver
	hotkey_keys = list("Numpad1")
	name = "revolver"
	full_name = "Pinpointer Class: REVOLVER"
	description = ""

/datum/keybinding/pinpointer/revolver/down(client/user)
	var/mob/living/simple_animal/fd/lancer/pinpointer/L = user.mob
	L.change_to_revolver()
	return TRUE

/mob/living/simple_animal/fd/lancer/pinpointer/verb/change_to_revolver()
	set name = "revolver"
	set hidden = 1

	for(var/datum/mech_equipment/firearm/revolver/R in equipment)
		selected_equipment = R
		recalculate_mech_speed()

/datum/keybinding/pinpointer/fist
	hotkey_keys = list("Numpad2")
	name = "fist"
	full_name = "Pinpointer Class: FIST"
	description = ""

/datum/keybinding/pinpointer/fist/down(client/user)
	var/mob/living/simple_animal/fd/lancer/pinpointer/L = user.mob
	L.change_to_fist()
	return TRUE

/mob/living/simple_animal/fd/lancer/pinpointer/verb/change_to_fist()
	set name = "fist"
	set hidden = 1

	for(var/datum/mech_equipment/weapon/fist/F in equipment)
		selected_equipment = F
		recalculate_mech_speed()

/datum/keybinding/pinpointer/launcher
	hotkey_keys = list("Numpad3")
	name = "launcher"
	full_name = "Pinpointer Class: GRENADE LAUNCHER"
	description = ""

/datum/keybinding/pinpointer/launcher/down(client/user)
	var/mob/living/simple_animal/fd/lancer/pinpointer/L = user.mob
	L.change_to_launcher()
	return TRUE

/mob/living/simple_animal/fd/lancer/pinpointer/verb/change_to_launcher()
	set name = "launcher"
	set hidden = 1

	for(var/datum/mech_equipment/firearm/grenade_launcher/G in equipment)
		selected_equipment = G
		recalculate_mech_speed()

/datum/keybinding/pinpointer/rifle
	hotkey_keys = list("Numpad4")
	name = "rifle"
	full_name = "Pinpointer Class: ASSAULT RIFLE"
	description = ""

/datum/keybinding/pinpointer/rifle/down(client/user)
	var/mob/living/simple_animal/fd/lancer/pinpointer/L = user.mob
	L.change_to_rifle()
	return TRUE

/mob/living/simple_animal/fd/lancer/pinpointer/verb/change_to_rifle()
	set name = "rifle"
	set hidden = 1

	for(var/datum/mech_equipment/firearm/assault_rifle/AR in equipment)
		selected_equipment = AR
		recalculate_mech_speed()

/datum/keybinding/pinpointer/rifle_firemode
	hotkey_keys = list("Q")
	name = "rifle_firemode"
	full_name = "Pinpointer Class: RIFLE FIRE-RATE"
	description = ""

/datum/keybinding/pinpointer/rifle_firemode/down(client/user)
	var/mob/living/simple_animal/fd/lancer/pinpointer/L = user.mob
	L.change_firemode()
	return TRUE

/mob/living/simple_animal/fd/lancer/pinpointer/verb/change_firemode()
	set name = "rifle_firemode"
	set hidden = 1

	for(var/datum/mech_ability/action/firemode_change/F in abilities)
		F.use()

#undef CATEGORY_MECH_PIN
