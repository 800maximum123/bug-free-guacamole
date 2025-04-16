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

	var/player_token = 1
	var/current_token = 1

/obj/match_controller/Initialize()
	. = ..()
	GLOB.match_names += controller_id
	GLOB.match_controllers += src

/obj/match_controller/proc/start_the_game()
	START_PROCESSING(SSobj, src)

/mob/living/simple_animal/fd/unit/proc/resolve_aftereffects()
	if(poison_strenght > 0)
		process_damage(1)
		poison_strenght -= 1

/obj/match_controller/Process()
	if(!round_ended && players_in == players_done) // Если раунд ещё не закончен, но все игроки в нём получили право активации
		current_token = 1 // Мы возвращаем текущий токен на исходную
		round_ended = TRUE // Подтверждаем, что раунд завершился
		active_gamer = null // Убираем возможно оставшегося в варе игрока
		players_done.Cut() // И чистим список игроков, которые свою активацию закончили

	if(round_ended) // Если раунд завершён
		for(var/mob/living/simple_animal/fd/unit/U in world)
			U.resolve_aftereffects() // Мы резолвим эффекты вроде отравления и подобного

		for(var/mob/living/simple_animal/fd/player/P in players_in)
			for(var/mob/living/simple_animal/fd/unit/U in P.unit_used)
				U.unit_actions_amount = initial(U.unit_actions_amount)
				U.unit_move_actions = initial(U.unit_move_actions)
			P.unit_used.Cut()

		round_ended = FALSE // И начинаем цикл по новой

	if(active_gamer) // Если у нас есть активный игрок
		if(active_gamer.active_turn && active_gamer.unit_list == active_gamer.unit_used) // И у него закончились юниты, которых он мог бы использовать
			active_gamer.active_turn = FALSE // Мы забираем у него право хода
			current_token += 1 // Повышаем значение токена на один, чтобы передать ход следующему игроку
			active_gamer = null // Удаляем нашего текущего игрока из вара

	if(!active_gamer) // Если у нас нет активного игрока
		for(var/mob/living/simple_animal/fd/player/chosen in players_in) // Мы пролистываем весь локальный список
			if(chosen.token == current_token) // На наличие игрока с токеном идентичным текущему
				active_gamer = chosen // Добавляем его в вар для последующего взаимодействия
				active_gamer.active_turn = TRUE // И позволяем действовать

/mob/proc/join_match()
	var/obj/match_controller/picked_lobby

	var/pick_match = input(src, "Выберите ЛОББИ!","Присоединение") as null|anything in GLOB.match_names // Выбираем контроллер, к которому мы хотим подсосаться
	if(!pick_match)
		return
	for(var/obj/match_controller/GM in GLOB.match_controllers)
		if(pick_match == GM.controller_id)
			picked_lobby = GM

	player_team = input(src, "Выберите вашу СТОРОНУ!","Присоединение") as null|anything in picked_lobby.teams // Выбираем одну из фракций, предзаписанных в выбранный контроллер
	if(!player_team)
		return
	for(var/mob/living/simple_animal/fd/player/gamer in picked_lobby.players_in) // Если кто-то уже играет за эту фракцию - ретурнаем
		if(gamer.side == player_team)
			player_team = null
			return

	var/mob/living/simple_animal/fd/player/gamer = new /mob/living/simple_animal/fd/player(get_turf(picked_lobby)) // В ином случае, если проблем нет - создаём новую тушу
	gamer.ckey = src.ckey // Пихаем в неё нашего РЕАЛЬНОГО игрока
	gamer.side = player_team // И присваиваем ему выбранную команду

	player_team = null // Затем ресетаем
	gamer.previous_client = src // И сохраняем оригинального моба в отдельную переменную куклы наблюдения, чтобы затем вернуть его сознание в правильное место

	picked_lobby.players_in += gamer // Добавляем наблюдуна в список всех участвующих в бою игроков
	if(picked_lobby.player_token == 1) // Если это первый участник - мы присваиваем ему соответственное место
		gamer.token = 1
		picked_lobby.player_token += 1 // И затем начинаем считать
	else
		picked_lobby.player_token += 1
		gamer.token = picked_lobby.player_token

	return TRUE
