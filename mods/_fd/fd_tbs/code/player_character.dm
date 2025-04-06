/obj/walkable_zone
	mouse_opacity = FALSE
	alpha = 50

	icon = 'mods/_fd/fd_tbs/icons/blueprints.dmi'
	icon_state = "valid"

/turf/DblClick(location, control, params)
	var/mob/living/simple_animal/fd/player/user = usr
	if(!user)
		return 0
	if(!user.selected)
		return 0

	if(user.selected.chosen_action == "Move")
		var/mob/living/simple_animal/fd/walk_simulation/vision = new /mob/living/simple_animal/fd/walk_simulation(get_turf(user.selected))
		vision.owner = user.selected
		vision.endgoal = src
		vision.owner_speed = user.selected.unit_speed
		vision.icon = user.selected.icon
		vision.icon_state = user.selected.icon_state
		animate(vision, 1 SECOND, color = "#4e807dff")
		animate(vision, 1 SECOND, alpha = 50)
		walk_to(vision, src, 0, 3)
		var/question = alert(user, "Вас устраивает этот маршрут?", "Подтверждение", "Да", "Нет")
		switch(question)
			if("Да")
				vision.density = FALSE
				vision.mob_size = MOB_MINISCULE
				vision.owner = null
				walk_to(user.selected, vision.endgoal, 0, 3)
				user.selected.chosen_action = null
				user.selected.unit_move_actions -= 1
				user.selected = null
				spawn(3 SECONDS)
					qdel(vision)
				return 1
			else
				vision.owner = null
				spawn(3 SECONDS)
					qdel(vision)
				user.selected.chosen_action = null
				user.selected = null
				return 1


/*		if(src in user.selected.walkable_zone)
			walk_to(user.selected, src, 0, 3)
			user.selected.chosen_action = null
			for(var/turf/inzone in user.selected.walkable_zone)
				var/turf/covered = get_turf(inzone)
				var/obj/walkable_zone/overlay = locate() in covered
				if(overlay)
					qdel(overlay)
			user.selected.walkable_zone.Cut()
			user.selected.unit_move_actions -= 1
			user.selected = null
			return 1*/

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
