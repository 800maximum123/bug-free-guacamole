/atom
	var/allow_fishing = FALSE
	var/list/fish_types = list(
		/mob/living/simple_animal/aquatic/fish = 100,
		/mob/living/simple_animal/aquatic/fish/grump = 100,
		/mob/living/simple_animal/aquatic/fish/judge = 100,
		)
	var/currently_fishing = FALSE // Одновременно и время старта последней рыбалки.

/atom/use_tool(obj/item/tool, mob/living/user, list/click_params)
	. = ..()
	if(can_fish(user, tool))
		do_fishing(tool, user, click_params)

/atom/proc/do_fishing(obj/item/tool, mob/living/carbon/user, list/click_params)
	set waitfor = FALSE

	currently_fishing = world.time
	var/timer_data = addtimer(new Callback(src, PROC_REF(fishing_qte), user, tool), rand(tool.min_fishing_duration, tool.max_fishing_duration), TIMER_OVERRIDE)

	do_after(user, tool.max_fishing_duration, src, DO_PUBLIC_UNIQUE)

	deltimer(timer_data)
	currently_fishing = FALSE

/atom/proc/can_fish(mob/living/user, obj/item/tool)
	if(!allow_fishing)
		return FALSE

	if(!tool.can_fish)
		return FALSE

	if(currently_fishing)
		to_chat(user, SPAN_WARNING("Тут уже кто-то рыбачит."))
		return

	if(tool.fishing_range < get_dist(user, src))
		return FALSE

	if(!iscarbon(user))
		return FALSE

	if(isturf(src)) // Проверка на размер водоёма, пока-что только для турфов
		var/adjacent_duplicates = 0
		for(var/new_direction in GLOB.alldirs)
			if(!istype(get_step(src, new_direction), src.type))
				continue
			adjacent_duplicates++

		if(adjacent_duplicates < 5)
			to_chat(user, SPAN_WARNING("Водоём слишком мал для рыбалки."))
			return FALSE

	return TRUE

/atom/proc/fishing_qte(mob/living/carbon/user, obj/item/tool)
	set waitfor = FALSE

	if(currently_fishing < tool.last_use_fishing)
		to_chat(user, SPAN_WARNING("Вы должны использовать [tool] в момент, когда рыба клюнет!"))
		return

	addtimer(new Callback(src, PROC_REF(catch_fish), user, tool), tool.fishing_timing)
	playsound(get_turf(src), 'packs/infinity/sound/effects/Splash_Small_01_mono.ogg', 100, TRUE)

	animate(tool, tool.fishing_timing/2, easing = SINE_EASING|EASE_OUT, transform = matrix().Update(scale_x = 1.5, scale_y = 1.5, rotation = 30))
	sleep(tool.fishing_timing/2)
	animate(tool, tool.fishing_timing/2, easing = SINE_EASING|EASE_IN, transform = matrix())

/atom/proc/catch_fish(mob/living/carbon/user, obj/item/tool)
	if(!currently_fishing)
		return FALSE

	// Выключаем ду_афтер вторым ду_афтер'ом
	do_after(user, 1, src, DO_PUBLIC_UNIQUE)
	currently_fishing = FALSE

	if(tool.last_use_fishing < (world.time - tool.fishing_timing))
		to_chat(user, SPAN_WARNING("Вы упустили рыбу!"))
		return FALSE

	var/new_fish_type = pickweight(fish_types)
	var/mob/fish = new new_fish_type(src)

	fish.kill_health()
	fish.update_icon()

	fish.throw_at(get_turf(user), get_dist(src, user), fish.throw_speed, spin = TRUE)

	playsound(get_turf(src), 'sound/effects/watersplash.ogg', 100, TRUE)
