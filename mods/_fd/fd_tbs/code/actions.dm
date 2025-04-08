// ТУРФЫ

/turf/DblClick(location, control, params)
	var/mob/living/simple_animal/fd/player/user = usr
	if(!user)
		return 0
	if(!user.selected)
		return 0

	if(user.selected.chosen_action == "Move")
		for(var/mob/living/another_entity in get_turf(src))
			return 0
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
				user.selected.overlays -= image('mods/_fd/fd_tbs/icons/progressicons.dmi', "busy_friendly")
				var/turf/new_destination = get_turf(vision.endgoal)
				spawn(0.5 SECONDS)
					qdel(vision)
				walk_to(user.selected, new_destination, 0, 3)
				user.selected.chosen_action = null
				user.selected.unit_move_actions -= 1
				user.selected = null
				return 1
			else
				spawn(2 SECONDS)
					qdel(vision)
				user.selected.overlays -= image('mods/_fd/fd_tbs/icons/progressicons.dmi', "busy_friendly")
				user.selected.chosen_action = null
				user.selected = null
				return 1

	if(user.selected.chosen_action == "Special")
		if(user.selected.should_be_used_on == "Turf")
			var/question = alert(user, "Вас устраивает выбранная цель?", "Подтверждение", "Да", "Нет")
			switch(question)
				if("Да")
					user.selected.overlays -= image('mods/_fd/fd_tbs/icons/progressicons.dmi', "busy_friendly")
					user.selected.resolve_special(src)

					user.selected.chosen_action = null
					user.selected = null
					return 1
				else
					user.selected.overlays -= image('mods/_fd/fd_tbs/icons/progressicons.dmi', "busy_friendly")
					user.selected.decline_special()
					user.selected.chosen_special = null
					user.selected.chosen_action = null
					user.selected = null
					return 1

// ЮНИТЫ

/mob/living/simple_animal/fd/unit/DblClick(location, control, params)
	var/mob/living/simple_animal/fd/player/user = usr
	if(!user)
		return 0
	if(!user.selected)
		return 0
	if(!(src in user.selected.possible_targets))
		return 0

	user.selected.actual_target = src

	if(user.selected.chosen_action == "Attack")
		var/question = alert(user, "Вас устраивает выбранная цель?", "Подтверждение", "Да", "Нет")
		switch(question)
			if("Да")
				user.selected.overlays -= image('mods/_fd/fd_tbs/icons/progressicons.dmi', "busy_hostile")
				user.selected.resolve_attack()

				new /obj/temporary(get_turf(user.selected), 3, 'mods/_fd/fd_tbs/icons/progressicons.dmi', "busy_danger")

				user.selected.chosen_action = null
				user.selected.possible_targets.Cut()
				user.selected = null
				return 1
			else
				user.selected.overlays -= image('mods/_fd/fd_tbs/icons/progressicons.dmi', "busy_hostile")
				user.selected.chosen_attack = null
				user.selected.chosen_action = null
				user.selected.decline_attack()
				user.selected.possible_targets.Cut()
				user.selected = null
				return 1

	if(user.selected.chosen_action == "Special")
		if(user.selected.should_be_used_on == "Unit")
			var/question = alert(user, "Вас устраивает выбранная цель?", "Подтверждение", "Да", "Нет")
			switch(question)
				if("Да")
					user.selected.overlays -= image('mods/_fd/fd_tbs/icons/progressicons.dmi', "busy_friendly")
					user.selected.resolve_special(src)

					user.selected.chosen_action = null
					user.selected = null
					return 1
				else
					user.selected.overlays -= image('mods/_fd/fd_tbs/icons/progressicons.dmi', "busy_friendly")
					user.selected.decline_special()
					user.selected.chosen_special = null
					user.selected.chosen_action = null
					user.selected = null
					return 1

// АКТИВНОСТИ

/obj/structure/fd/tbs_activity // плейсхолдер, фактически может быть чем угодно и исполнять любую функцию
	name = "activity"
	desc = "Cool things will happen when you touch it!"
	icon = 'mods/_fd/fd_tbs/icons/hardsuit_token.dmi'
	icon_state = "hardsuit_token"

	var/activation_radius = 1 // зона 3х3

	var/list/activation_zone = list()
	var/remove_on_activation = FALSE

/obj/structure/fd/tbs_activity/Initialize()
	. = ..()
	for(var/turf/inzone in oview(activation_radius, src))
		if(inzone.density == TRUE)
			continue
		var/obj/cover = locate() in get_turf(inzone)
		if(cover && cover.density == TRUE)
			continue
		activation_zone += inzone
		new /obj/tbs_zone(get_turf(inzone))

/obj/structure/fd/tbs_activity/DblClick(location, control, params)
	var/mob/living/simple_animal/fd/player/user = usr
	if(!user)
		return 0
	if(!user.selected)
		return 0

	var/postion = get_turf(user.selected)
	for(postion in activation_zone)
		if(user.selected.chosen_action == "Activate")
			var/question = alert(user, "Вы хотите активировать [src]?", "Подтверждение", "Да", "Нет")
			switch(question)
				if("Да")
					user.selected.chosen_action = null
					user.selected = null
					if(remove_on_activation)
						for(var/turf/inzone in activation_zone)
							var/turf/covered = get_turf(inzone)
							var/obj/tbs_zone/overlay = locate() in covered
							if(overlay)
								qdel(overlay)
						activation_zone.Cut()
					activate()
					return 1
				else
					user.selected.chosen_action = null
					user.selected = null
					return 1

/obj/structure/fd/tbs_activity/proc/activate() // индивидуально для каждой активности
	return
