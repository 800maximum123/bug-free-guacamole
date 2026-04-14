
/area/nightmare/

/area/nightmare/streets
	name = "City Streets - Real World"
	requires_power = 0

/area/nightmare/bar_real
	name = "Bar - Real World"
	requires_power = 1

/obj/screen/interactive_door
	name = "Дверь"
	desc = "Просто дверь..."
	icon = 'mods/_fd/fd_assets/icons/structures/doors/door.dmi'
	icon_state = "fancy"

	mouse_opacity = FALSE

	plane = HUD_PLANE
	layer = 5.3

	screen_loc = "CENTER-0.2,CENTER"

/obj/screen/interactive_door/Initialize()
	. = ..()
	SetTransform(6)

/obj/structure/fd/interactive/door
	name = "door"
	desc = "Simple door."

	anchored = TRUE
	density = TRUE
	opacity = TRUE

	icon = 'mods/_fd/fd_assets/icons/structures/doors/door.dmi'
	icon_state = "fancy"

	var/opened = FALSE

	var/key_needed = FALSE
	var/locked = FALSE
	var/obj/item/door_key = null
	var/doorsound = 'mods/_fd/_maps/collective_nightmare/sounds/wooden_door_open.wav'

	var/obj/screen/interactive_door/door

/obj/structure/fd/interactive/door/Initialize()
	. = ..()

	door = new /obj/screen/interactive_door()
	door.icon = icon
	door.icon_state = icon_state

/obj/structure/fd/interactive/door/interact_with(mob/living/user)
	if(!opened)
		if(locked)
			if(key_needed)
				var/obj/item/I = user.get_active_hand()
				if(!I)
					desc_special = {"Дверь заперта. Я бы смог открыть её при помощи <span style="color: yellow;">[door_key.name]</span>."}
					desc_special_show = TRUE
					. = ..()
					return TRUE
				if(!istype(I, door_key))
					desc_special = {"Дверь заперта. Я бы смог открыть её, будь у меня <span style="color: yellow;">[door_key.name]</span>."}
					desc_special_show = TRUE
					. = ..()
					return TRUE
				if(istype(I, door_key))
					playsound(user, 'sound/items/metal_clicking_13.ogg', 50)
					locked = FALSE
					desc_special = {"<span style="color: green;">Дверь теперь открыта</span>."}
					desc_special_show = TRUE
					. = ..()
					return TRUE

			else
				desc_special = {"Дверь заперта. На вряд ли у меня получится её открыть."}
				desc_special_show = TRUE
				. = ..()
				return TRUE

		open_door(user)
		return TRUE

	if(opened)
		close_door(user)
		return TRUE

/obj/structure/fd/interactive/door/proc/open_door(mob/living/user)
	for(var/obj/screen/T in user.client.screen)
		if(istype(T, /obj/screen/cancel_interaction))
			user.client.screen -= T
	user.stunned = 99999

	user.reading = TRUE
	user.currently_interacting = src

	user.overlay_fullscreen("smallshade", /obj/screen/fullscreen/shade)
	user.client.screen += door

	sleep(2 SECONDS)
	door.icon_state = "[initial(icon_state)]opening"
	playsound(user, doorsound, 100)
	sleep(1 SECONDS)
	density = FALSE
	opacity = FALSE

	opened = TRUE
	icon_state = "[initial(icon_state)]open"
	door.icon_state = "[initial(icon_state)]open"

	sleep(1 SECONDS)
	user.stunned = 0

	user.reading = FALSE
	user.currently_interacting = null

	user.clear_fullscreen("smallshade")
	for(var/obj/screen/T in user.client.screen)
		if(istype(T, /obj/screen/interactive_door))
			user.client.screen -= T

/obj/structure/fd/interactive/door/proc/close_door(mob/living/user)
	for(var/obj/screen/T in user.client.screen)
		if(istype(T, /obj/screen/cancel_interaction))
			user.client.screen -= T
	user.stunned = 99999

	user.reading = TRUE
	user.currently_interacting = src

	user.overlay_fullscreen("smallshade", /obj/screen/fullscreen/shade)
	user.client.screen += door

	sleep(2 SECONDS)
	density = TRUE
	opacity = initial(opacity)

	playsound(user, 'mods/_fd/_maps/collective_nightmare/sounds/door_close.ogg', 100)

	opened = FALSE
	icon_state = "[initial(icon_state)]"
	door.icon_state = "[initial(icon_state)]"

	sleep(1 SECONDS)
	user.stunned = 0

	user.reading = FALSE
	user.currently_interacting = null

	user.clear_fullscreen("smallshade")
	for(var/obj/screen/T in user.client.screen)
		if(istype(T, /obj/screen/interactive_door))
			user.client.screen -= T

/obj/item/fd/door_key
	name = "key"
	desc = "This one has particular shape!"

	icon = 'mods/_fd/_maps/small_exoplanet_1/icons/keys.dmi'
	icon_state = "mazekey"

	w_class = ITEM_SIZE_TINY

/obj/item/fd/door_key/test
	name = "квадратный ключ"

/obj/item/fd/door_key/kitchen
	name = "ключ от морозилки"

/obj/structure/fd/interactive/door/test_locked

	key_needed = TRUE
	locked = TRUE
	door_key = /obj/item/fd/door_key/test

/obj/structure/fd/interactive/door/exterior
	icon_state = "exterior"
	doorsound = 'mods/_fd/_maps/collective_nightmare/sounds/metal_door_open.wav'

/obj/structure/fd/interactive/door/grate
	opacity = FALSE
	icon_state = "grate"

/obj/structure/fd/interactive/door/wood
	icon_state = "wood"
	doorsound = 'mods/_fd/_maps/collective_nightmare/sounds/metal_door_open.wav'

/obj/structure/fd/interactive/door/wood_alt
	icon_state = "wood_alt"

/obj/structure/fd/interactive/door/wood_old
	icon_state = "old"

/obj/structure/fd/interactive/door/wood_old2
	icon_state = "bold"

/obj/structure/fd/interactive/door/agrate
	opacity = FALSE
	icon_state = "agrate"
	doorsound = 'mods/_fd/_maps/collective_nightmare/sounds/metal_door_open.wav'

/obj/structure/fd/interactive/door/fancy
	opacity = FALSE
	icon_state = "fancy_alt"

/obj/structure/fd/interactive/door/metal
	icon_state = "metal"
	doorsound = 'mods/_fd/_maps/collective_nightmare/sounds/metal_door_open.wav'

/obj/structure/fd/interactive/door/metal_glass
	opacity = FALSE
	icon_state = "metal_glass"
	doorsound = 'mods/_fd/_maps/collective_nightmare/sounds/metal_door_open.wav'

/obj/structure/fd/interactive/door/metal_train
	opacity = FALSE
	icon_state = "metal_train"
	doorsound = 'mods/_fd/_maps/collective_nightmare/sounds/metal_door_open.wav'

/obj/structure/fd/interactive/door/nightmare/kitchen
	icon_state = "metal_glass"
	opacity = FALSE

	key_needed = TRUE
	locked = TRUE
	door_key = /obj/item/fd/door_key/kitchen
	doorsound = 'mods/_fd/_maps/collective_nightmare/sounds/metal_door_open.wav'
