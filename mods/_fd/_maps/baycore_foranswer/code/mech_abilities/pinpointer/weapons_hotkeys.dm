#define ismech(A) istype(A, /mob/living/simple_animal/fd/lancer)
#define CATEGORY_MECH "LANCER"

/datum/keybinding/pinpointer
	category = CATEGORY_MECH

/datum/keybinding/pinpointer/can_use(client/user)
	return ismech(user.mob)

/datum/keybinding/pinpointer/revolver
	hotkey_keys = list("Numpad1")
	name = "revolver"
	full_name = "Pinpointer Class: REVOLVER"
	description = ""

/datum/keybinding/pinpointer/revolver/down(client/user)
	var/mob/living/simple_animal/fd/lancer/L = user.mob
	L.change_to_revolver()
	return TRUE

/mob/living/simple_animal/fd/lancer/verb/change_to_revolver()
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
	var/mob/living/simple_animal/fd/lancer/L = user.mob
	L.change_to_fist()
	return TRUE

/mob/living/simple_animal/fd/lancer/verb/change_to_fist()
	set name = "fist"
	set hidden = 1

	for(var/datum/mech_equipment/weapon/fist/F in equipment)
		selected_equipment = F
		recalculate_mech_speed()

/datum/keybinding/pinpointer/launcher
	hotkey_keys = list("Numpad3")
	name = "launcher"
	full_name = "Pinpointer Class: GRAVI-LAUNCHER"
	description = ""

/datum/keybinding/pinpointer/launcher/down(client/user)
	var/mob/living/simple_animal/fd/lancer/L = user.mob
	L.change_to_launcher()
	return TRUE

/mob/living/simple_animal/fd/lancer/verb/change_to_launcher()
	set name = "launcher"
	set hidden = 1

	for(var/datum/mech_equipment/firearm/grenade_launcher/G in equipment)
		selected_equipment = G
		recalculate_mech_speed()

#undef CATEGORY_MECH
