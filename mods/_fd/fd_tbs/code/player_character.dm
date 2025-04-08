/obj/tbs_zone
	mouse_opacity = FALSE
	alpha = 50

	icon = 'mods/_fd/fd_tbs/icons/blueprints.dmi'
	icon_state = "valid"

/mob/living/simple_animal/fd/player
	name = "player mob"
	desc = "player mob"
	icon = 'mods/_fd/fd_tbs/icons/AI.dmi'
	icon_state = "ai-lonestar"

	var/active_turn = FALSE // Сейчас наш ход?
	var/side = "Blue" // Фракция

	var/mob/living/simple_animal/fd/unit/selected // Кого мы выбрали для нашей активации?
	movement_handlers = list(/datum/movement_handler/mob/multiz_connected, /datum/movement_handler/mob/incorporeal)

/mob/living/simple_animal/fd/player/two
	icon = 'mods/_fd/fd_tbs/icons/AI.dmi'
	icon_state = "ai-redoctober"
	side = "Red"
