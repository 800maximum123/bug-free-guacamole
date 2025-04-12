GLOBAL_LIST_EMPTY(match_controllers)
GLOBAL_LIST_EMPTY(match_names)

/mob/
	var/player_team

/obj/match_controller
	name = "DEV"
	icon = 'mods/_fd/fd_tbs/icons/AI.dmi'
	icon_state = "floating face"
	mouse_opacity = FALSE
	invisibility = 50
	var/controller_id = "Test Match"//Если нам вдруг понадобится больше одной арены или одновременных игр
	var/list/players_in = list() //Игроки в очереди
	var/list/players_done = list() //Те, что уже походили
	var/list/teams = list() //Список команд
	var/mob/living/simple_animal/fd/player/active_gamer //Чья сейчас очередь?
	var/round_ended = FALSE //Все ли игроки сделали ход?
	var/team_vs_team = FALSE

	var/player_token = 1
	var/current_token = 1

/obj/match_controller/Initialize()
	. = ..()
	GLOB.match_names += controller_id
	GLOB.match_controllers += src

/obj/match_controller/proc/start_the_game()
	START_PROCESSING(SSobj, src)

/obj/match_controller/Process()
	if(!round_ended && players_in == players_done)
		current_token = 1
		round_ended = TRUE
		active_gamer = null
		players_done.Cut()

	if(round_ended)


	if(!active_gamer)
		for(var/mob/living/simple_animal/fd/player/chosen in players_in)
			if(chosen.token == current_token)
				active_gamer = chosen
				active_gamer.active_turn = TRUE

/mob/join_match()
	var/pick_match = input(src, "Выберите ЛОББИ!","Присоединение") as null|anything in GLOB.match_names
	if(!pick_match)
		return
	for(var/obj/match_controller/GM in GLOB.match_controllers)
		if(pick_match == GM.controller_id)
			var/obj/match_controller/picked_lobby = GM

	player_team = input(src, "Выберите вашу СТОРОНУ!","Присоединение") as null|anything in picked_lobby.teams
	if(!player_team)
		return
	for(var/mob/living/simple_animal/fd/player/gamer in picked_lobby.players_in)
		if(gamer.side == player_team && !picked_lobby.team_vs_team)
			player_team = null
			return

	var/mob/living/simple_animal/fd/player/gamer = new /mob/living/simple_animal/fd/player(get_turf(picked_lobby))
	gamer.ckey = src.ckey
	gamer.side = player_team

	player_team = null
	gamer.previous_client = src
	if(picked_lobby.team_vs_team)
		gamer.team_vs_team = TRUE

	picked_lobby.players_in += gamer
	if(picked_lobby.player_token == 1)
		gamer.token = 1
		picked_lobby.player_token += 1
	else
		picked_lobby.player_token += 1
		gamer.token = picked_lobby.player_token

	return TRUE
