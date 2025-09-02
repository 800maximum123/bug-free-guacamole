#define CATEGORY_MECHS "MECHS"

/datum/keybinding/mechs/zoom
	category = CATEGORY_MECHS
	hotkey_keys = list("F")
	name = "zoom"
	full_name = "Zoom"
	description = "Переключает оптику меха в режим приближения"

/datum/keybinding/mechs/zoom/down(client/user)
	var/mob/living/simple_animal/fd/lancer/mech = user.mob
	if(!istype(mech))
		return

	if(mech.set_zoom(!mech.zoom))
		mech.precise_zoom = TRUE
		user.last_mouse_position = null

	. = ..()

/datum/keybinding/mechs/zoom/up(client/user)
	var/mob/living/simple_animal/fd/lancer/mech = user.mob
	if(!istype(mech))
		return

	if(mech.precise_zoom)
		mech.set_zoom(TRUE)
	mech.precise_zoom = FALSE


	. = ..()