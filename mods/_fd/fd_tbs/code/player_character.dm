/obj/tbs_zone
	mouse_opacity = FALSE
	alpha = 50

	icon = 'mods/_fd/fd_tbs/icons/blueprints.dmi'
	icon_state = "valid"

/mob/living/simple_animal/fd/player
	name = "player mob"
	desc = "player mob"
	icon = 'mods/_fd/fd_tbs/icons/mob.dmi'
	icon_state = "catghost"

	var/active_turn = FALSE // Сейчас наш ход?
	var/side // Фракция

	var/list/unit_list = list() // Юниты в нашем распоряжении

	var/mob/living/simple_animal/fd/unit/selected // Кого мы выбрали для нашей активации?
	var/mob/previous_client
	movement_handlers = list(/datum/movement_handler/mob/multiz_connected, /datum/movement_handler/mob/incorporeal)
	var/team_vs_team = FALSE // Если у нас больше одного игрока за сторону

/mob/living/simple_animal/fd/player/two
	icon = 'mods/_fd/fd_tbs/icons/AI.dmi'
	icon_state = "ai-redoctober"
	side = "Red"

/mob/living/simple_animal/fd/player/marine
	icon = 'mods/_fd/fd_tbs/icons/AI.dmi'
	icon_state = "ai-lonestar"
	side = "Marines"
	active_turn = TRUE

/mob/living/simple_animal/fd/player/alien
	icon = 'mods/_fd/fd_tbs/icons/AI.dmi'
	icon_state = "ai-glitchman_dead"
	side = "Xenos"
	active_turn = TRUE
