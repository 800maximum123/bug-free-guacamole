/obj/screen/fullscreen/monster_sight
	icon = 'mods/_fd/_maps/metro/icons/monster_sight.dmi'
	icon_state = "sight"
	allstate = 1
	alpha = 0

	plane = HUD_PLANE
	layer = 5.3

/obj/screen/fullscreen/monster_sight/Initialize()
	. = ..()
	animate(src, alpha = 255, time = 3, easing = SINE_EASING|EASE_IN)

/obj/screen/fullscreen/monster_sight/Destroy()
	animate(src, alpha = 0, time = 3, easing = SINE_EASING|EASE_OUT)
	. = ..()

/obj/screen/teleport_monster
	name = "ТЕЛЕПОРТ"
	desc = "Телепортирует..."
	icon = 'mods/_fd/_maps/metro/icons/monster_additional.dmi'
	icon_state = "teleport_to_trap"

	plane = HUD_PLANE
	layer = 5.4
	alpha = 0

	screen_loc = "CENTER,CENTER+2"
	var/turf/connected_turf

/obj/screen/teleport_monster/Initialize()
	. = ..()
	SetTransform(2)

	spawn(10 SECONDS)
		var/mob/living/simple_animal/metro_jeff/J = usr
		if(src in J.client.screen)
			J.client.screen -= src
		animate(src, alpha = 0, time = 3, easing = SINE_EASING|EASE_IN)

/obj/screen/teleport_monster/Click()
	var/mob/living/simple_animal/metro_jeff/J = usr

	if(!J.in_shadow)
		J.change_monster_vis()
		J.forceMove(connected_turf)
		animate(src, alpha = 0, time = 3, easing = SINE_EASING|EASE_IN)
		J.client.screen -= src
		return TRUE
	else
		J.forceMove(connected_turf)
		animate(src, alpha = 0, time = 3, easing = SINE_EASING|EASE_IN)
		J.client.screen -= src
		return TRUE

/obj/effect/trap_triggered
	name = "trap"
	desc = "trap"
	icon = 'mods/_fd/_maps/metro/icons/monster_additional.dmi'
	icon_state = "trap_triggered"
	alpha = 0
	mouse_opacity = FALSE

/obj/effect/trap_triggered/Initialize()
	. = ..()
	animate(src, alpha = 255, pixel_x = 0, pixel_y = 32, time = 1 SECOND, easing = SINE_EASING|EASE_IN)

	spawn(1.5 SECONDS)
		animate(src, alpha = 0, pixel_x = 0, pixel_y = 0, time = 1 SECOND, easing = SINE_EASING|EASE_IN)
	spawn(2 SECONDS)
		qdel(src)

/obj/structure/fd/monster_trigger
	name = "Придумай название(желательно на англ.)"
	desc = "Придумай описание"

	icon = 'mods/_fd/fd_utilities/icons/source.dmi'
	icon_state = "sound"
	invisibility = 50

	var/mob/living/simple_animal/metro_jeff/jeff
	var/obj/screen/teleport_monster/tp_button
	var/vent_off_sound = 'sound/effects/glass_crack1.ogg'
	var/should_make_sound = TRUE
	var/one_time_trigger = FALSE
	var/triggered = FALSE

/obj/structure/fd/monster_trigger/Initialize()
	. = ..()

	for(var/mob/living/simple_animal/metro_jeff/J in world)
		jeff = J

	tp_button = new /obj/screen/teleport_monster()
	tp_button.connected_turf = get_turf(src)

/obj/structure/fd/monster_trigger/Crossed(mob/living/M)
	. = ..()

	if(isliving(M) && M != jeff && !triggered)
		if(jeff.client)
			jeff.client.screen += tp_button
			animate(tp_button, alpha = 255, time = 3, easing = SINE_EASING|EASE_IN)

		new /obj/effect/trap_triggered(get_turf(src))
		if(should_make_sound)
			playsound(src, vent_off_sound, 100)
		if(one_time_trigger)
			triggered = TRUE
		return TRUE

/obj/
	var/image/revealed_mob
	var/show_mob_to_monster = FALSE

/obj/proc/show_insides()
	var/icon/T = new('mods/_fd/fd_utilities/icons/actions.dmi')
	return image(T, "revealed", layer = HUD_PLANE)

/obj/proc/show_player_inside(mob/living/user)
	revealed_mob = show_insides()
	revealed_mob.alpha = 0
	revealed_mob.plane = HUD_PLANE

	show_mob_to_monster = TRUE

	revealed_mob.loc = get_turf(src)
	animate(revealed_mob, alpha = 255, time = 3, easing = SINE_EASING|EASE_OUT)
	user.client.images += revealed_mob

/obj/proc/hide_player_inside(mob/living/user)
	if(user.client)
		animate(revealed_mob, alpha = 0, pixel_x = 0, pixel_y = -10, time = 0.3 SECOND, easing = SINE_EASING|EASE_IN)
		spawn(0.3 SECONDS)
			user.client.images -= revealed_mob
			show_mob_to_monster = FALSE

/datum/keybinding/living/fd/monster
	category = CATEGORY_FD

/datum/keybinding/living/fd/monster/can_use(client/user)
	. = ..()

	var/mob/living/L = user.mob
	if(!istype(L, /mob/living/simple_animal/metro_jeff))
		return FALSE

/datum/keybinding/living/fd/event/monster/reveal_hiding_players
	category = CATEGORY_FD_EVENT
	hotkey_keys = list("1")
	name = "reveal_hiding_players"
	full_name = "JEFF: REVEAL NEARBY"
	description = ""

/datum/keybinding/living/fd/event/monster/reveal_hiding_players/down(client/user)
	var/mob/living/simple_animal/metro_jeff/M = user.mob

	if(M.sniffing)

		M.sniffing = FALSE
		M.clear_fullscreen("eyes")
		return TRUE
	else
		M.sniffing = TRUE
		M.overlay_fullscreen("eyes", /obj/screen/fullscreen/monster_sight)
		return TRUE

/datum/keybinding/living/fd/event/monster/invisibility
	category = CATEGORY_FD_EVENT
	hotkey_keys = list("2")
	name = "invisibility"
	full_name = "JEFF: HIDE"
	description = ""

/datum/keybinding/living/fd/event/monster/invisibility/down(client/user)
	var/mob/living/simple_animal/metro_jeff/M = user.mob

	M.change_monster_vis()
	return TRUE

/obj/screen/visibility_status
	name = "ГЛАЗ"
	desc = "Смотрит..."
	icon = 'mods/_fd/_maps/metro/icons/monster_additional.dmi'
	icon_state = "visible"

	mouse_opacity = FALSE
	alpha = 0

	plane = HUD_PLANE
	layer = 5.3

	screen_loc = "CENTER,CENTER"

/obj/item/natural_weapon/claws/metro_jeff
	name = "claws"
	attack_verb = list("mauled", "clawed", "slashed")
	force = 2
	sharp = TRUE
	edge = TRUE

/mob/living/simple_animal/metro_jeff
	name = "WIP"
	desc = "WIP"

	icon = 'mods/_fd/fd_assets/icons/animals/prime_soul.dmi' // PLACEHOLDER
	icon_state = "body" // PLACEHOLDER
	icon_living = "body" // PLACEHOLDER
	icon_dead = "body" // PLACEHOLDER
	var/sniffing = FALSE
	var/in_shadow = FALSE
	var/list/obj/hidespots = list()
	var/obj/screen/visibility_status/seen
	natural_weapon = /obj/item/natural_weapon/claws/metro_jeff

	need_to_breath = FALSE
	health = 999999
	maxHealth = 999999

/mob/living/simple_animal/metro_jeff/Initialize()
	. = ..()
	set_light(3, 1, l_color = "#00f7ff", angle = LIGHT_WIDE)
	seen = new /obj/screen/visibility_status()

/mob/living/simple_animal/metro_jeff/Life()

	if(client)

		if(sniffing)
			for(var/obj/A in view(src.loc))
				if(A.hidden_mob && !A.show_mob_to_monster)
					A.show_player_inside(src)
					hidespots += A
				if(!A.hidden_mob && A.show_mob_to_monster)
					A.hide_player_inside(src)

		if(!sniffing)
			for(var/obj/A in hidespots)
				if(A.hidden_mob && A.show_mob_to_monster)
					A.hide_player_inside(src)

		if(!in_shadow)
			for(var/obj/machinery/light/light in orange(20,src))
				light.flicker(1)

	. = ..()

/mob/living/simple_animal/metro_jeff/proc/change_monster_vis()
	if(!in_shadow)
		if(client)
			client.screen += seen
			animate(seen, alpha = 255, time = 3, easing = SINE_EASING|EASE_IN)
			spawn(1 SECONDS)
				seen.icon_state = "invisible"
			spawn(3 SECONDS)
				animate(seen, alpha = 0, time = 3, easing = SINE_EASING|EASE_IN)

		in_shadow = TRUE
		set_light(0)
		set_see_in_dark(7)
		set_invisibility(INVISIBILITY_OBSERVER)
		AddMovementHandler(/datum/movement_handler/mob/incorporeal)
		add_filter("invisible_monster", 1, list("type" = "outline", , "size" = 1, "color" = COLOR_WHITE))
		return TRUE
	else
		if(client)
			animate(seen, alpha = 255, time = 3, easing = SINE_EASING|EASE_IN)
			spawn(1 SECONDS)
				seen.icon_state = "visible"
			spawn(3 SECONDS)
				animate(seen, alpha = 0, time = 3, easing = SINE_EASING|EASE_IN)
			spawn(3.5 SECONDS)
				client.screen -= seen

		in_shadow = FALSE
		set_light(3, 1, l_color = "#202424", angle = LIGHT_WIDE)
		set_see_in_dark(initial(see_in_dark))
		set_invisibility(0)
		RemoveMovementHandler(/datum/movement_handler/mob/incorporeal)
		remove_filter("invisible_monster")
		return TRUE
