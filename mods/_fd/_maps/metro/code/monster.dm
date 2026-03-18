/obj/
	var/image/revealed_mob
	var/show_mob_to_monster = FALSE

/obj/proc/show_insides()
	var/icon/T = new('mods/_fd/fd_utilities/icons/actions.dmi')
	return image(T, "revealed", layer = HUD_PLANE)

/obj/proc/show_player_inside(mob/living/user)
	revealed_mob = show_insides()

	show_mob_to_monster = TRUE

	revealed_mob.loc = get_turf(src)
	user.client.images += revealed_mob

/obj/proc/hide_player_inside(mob/living/user)
	if(user.client)
		user.client.images -= revealed_mob
		show_mob_to_monster = FALSE

/datum/keybinding/living/fd/monster
	category = CATEGORY_FD

/datum/keybinding/living/fd/monster/can_use(client/user)
	. = ..()

	var/mob/living/L = user.mob
	if(!istype(L, /mob/living/simple_animal/metro_jeff))
		return FALSE

/datum/keybinding/living/fd/monster/reveal_hiding_players
	category = CATEGORY_FD
	hotkey_keys = list("1")
	name = "reveal_hiding_players"
	full_name = "MONSTER: REVEAL NEARBY"
	description = ""

/datum/keybinding/living/fd/monster/reveal_hiding_players/down(client/user)
	var/mob/living/simple_animal/metro_jeff/M = user.mob

	if(M.sniffing)
		M.sniffing = FALSE
		return TRUE
	else
		M.sniffing = TRUE
		return TRUE

/mob/living/simple_animal/metro_jeff
	name = "WIP"
	desc = "WIP"

	icon = 'mods/_fd/fd_assets/icons/animals/prime_soul.dmi' // PLACEHOLDER
	icon_state = "body" // PLACEHOLDER
	icon_living = "body" // PLACEHOLDER
	icon_dead = "body" // PLACEHOLDER
	var/sniffing = FALSE
	var/list/obj/hidespots = list()

/mob/living/simple_animal/metro_jeff/Life()

	if(client)

		if(sniffing)
			for(var/obj/A in view(src))
				if(A.hidden_mob && !A.show_mob_to_monster)
					A.show_player_inside(src)
					hidespots += A
				if(!A.hidden_mob && A.show_mob_to_monster)
					A.hide_player_inside(src)

		if(!sniffing)
			for(var/obj/A in hidespots)
				if(A.hidden_mob && A.show_mob_to_monster)
					A.hide_player_inside(src)

	. = ..()
