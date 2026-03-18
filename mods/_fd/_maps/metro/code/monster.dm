/obj/
	var/image/revealed_mob

/obj/proc/show_insides()
	var/icon/T = new('mods/_fd/fd_utilities/icons/actions.dmi')
	return image(T, "revealed", layer = HUD_PLANE)

/obj/proc/show_player_inside(mob/living/user)
	revealed_mob = show_insides()

	revealed_mob.loc = get_turf(src)
	user.client.images += revealed_mob

/obj/proc/hide_player_inside(mob/living/user)
	if(user.client)
		user.client.images -= revealed_mob

/datum/keybinding/living/fd/monster
	category = CATEGORY_FD

/datum/keybinding/living/fd/monster/can_use(client/user)
	. = ..()

	var/mob/living/L = user.mob
	if(!istype(L, /mob/living/simple_animal/hostile/metro_jeff))
		return FALSE

/datum/keybinding/living/fd/monster/reveal_hiding_players
	category = CATEGORY_FD
	hotkey_keys = list("1")
	name = "reveal_hiding_players"
	full_name = "MONSTER: REVEAL NEARBY"
	description = ""

/datum/keybinding/living/fd/monster/reveal_hiding_players/down(client/user)
	var/mob/living/simple_animal/hostile/metro_jeff/M = user.mob
	M.sniffing = TRUE

	return TRUE

/datum/keybinding/living/fd/monster/reveal_hiding_players/up(client/user)
	var/mob/living/simple_animal/hostile/metro_jeff/M = user.mob
	M.sniffing = FALSE

	for(var/obj/A in M.hidespots)
		A.hide_player_inside(M)
		M.hidespots -= A

	return TRUE

/mob/living/simple_animal/hostile/metro_jeff
	name = "WIP"
	desc = "WIP"

	icon = 'mods/_fd/fd_assets/icons/animals/prime_soul.dmi' // PLACEHOLDER
	icon_state = "body" // PLACEHOLDER
	icon_living = "body" // PLACEHOLDER
	icon_dead = "body" // PLACEHOLDER
	var/sniffing = FALSE
	var/list/obj/hidespots = list()

/mob/living/simple_animal/hostile/metro_jeff/Move()
	. = ..()
	if(.)
		if(sniffing && client)
			for(var/obj/A in view(src))
				if(!A.can_hide_inside)
					continue
				if(!A.hidden_mob)
					continue
				if(A in hidespots)
					continue
				hidespots += A

			for(var/obj/A in hidespots)
				if(A.hidden_mob)
					A.show_player_inside(src)
