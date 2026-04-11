/obj/structure/fd/interactive/basic_power
	name = "TEST SOURCE"
	desc = "SIMPLE POWER SWITCH"
	var/currently_working = FALSE

	anchored = TRUE
	density = FALSE
	var/other_area
	var/area/area

	var/datum/sound_token/sound_token
	var/sound_id

/obj/structure/fd/interactive/basic_power/Initialize()
	. = ..()
	if(other_area)
		area = locate(other_area)
	else
		area = get_area(src)

/obj/structure/fd/interactive/basic_power/Process()
	update_sound()

/obj/structure/fd/interactive/basic_power/proc/turn_on()
	icon_state = "[initial(icon_state)]_on"
	currently_working = TRUE

	area.requires_power = FALSE
	area.power_change()

	START_PROCESSING(SSobj, src)

/obj/structure/fd/interactive/basic_power/proc/turn_off()
	icon_state = "[initial(icon_state)]_off"
	currently_working = FALSE

	area.requires_power = TRUE
	area.power_change()

	STOP_PROCESSING(SSobj, src)
	QDEL_NULL(sound_token)

/obj/structure/fd/interactive/basic_power/proc/update_sound()
	if(!sound_id)
		sound_id = "[type]_[sequential_id(/obj/structure/fd/interactive/basic_power)]"
	if(currently_working)
		if(!sound_token)
			sound_token = GLOB.sound_player.PlayLoopingSound(src, sound_id, 'sound/machines/engine.ogg', volume = 50)
		sound_token.SetVolume(50)
	else if(sound_token)
		QDEL_NULL(sound_token)

/obj/item/fd/basic_power/fuse
	name = "ПРЕДОХРАНИТЕЛЬ"
	desc = "Таким можно запитать какой-то небольшой щиток."

	icon = 'mods/_fd/fd_utilities/icons/power_source.dmi'
	icon_state = "fuse"

/obj/structure/fd/interactive/basic_power/fuse_box
	name = "ЭЛЕКТРОЩИТОК"
	desc = "Коробка с разными проводками и микросхемами."

	icon = 'mods/_fd/fd_utilities/icons/power_source.dmi'
	icon_state = "fusebox"

	var/obj/item/fd/basic_power/fuse/fuse
	var/prefit = FALSE
	var/prelit = FALSE

/obj/structure/fd/interactive/basic_power/fuse_box/Initialize()
	. = ..()
	if(prefit)
		fuse = new /obj/item/fd/basic_power/fuse()
		icon_state = "fusebox_off"

		if(prelit)
			turn_on()

/obj/structure/fd/interactive/basic_power/fuse_box/interact_with(mob/living/user)

	if(!fuse)
		var/obj/item/I = user.get_active_hand()
		if(!I)
			desc_special = {"Здесь нужен <span style="color: yellow;">предохранитель</span>."}
			desc_special_show = TRUE
			. = ..()
			return TRUE
		if(!istype(I, /obj/item/fd/basic_power/fuse))
			desc_special = {"<span style="color: red;">Здесь это не подойдёт</span>."}
			desc_special_show = TRUE
			. = ..()
			return TRUE

		if(istype(I, /obj/item/fd/basic_power/fuse))
			user.drop_from_inventory(I)
			I.forceMove(src)
			fuse = I

			playsound(user, 'sound/effects/extin.ogg', 50)
			icon_state = "fusebox_inserted"

			desc_special_show = FALSE
			if(do_after(user, 3 SECONDS, src, DO_PUBLIC_UNIQUE))
				playsound(user, 'sound/items/shuttle_beacon_complete.ogg', 100)
				turn_on()
				return TRUE

	if(fuse)

		var/list/options = list(
			"ДОСТАТЬ ПРЕДОХРАНИТЕЛЬ" = image('icons/screen/radial.dmi', "radial_pickup"),
			"ДЁРНУТЬ РУБИЛЬНИК" = image('icons/screen/radial.dmi', "radial_use")
		)
		var/chosen_option = show_radial_menu(user, src, options, radius = 25, require_near = TRUE)
		if (!chosen_option)
			return 0

		switch(chosen_option)
			if("ДОСТАТЬ ПРЕДОХРАНИТЕЛЬ")
				user.put_in_active_hand(fuse)
				fuse = null

				playsound(user, 'sound/effects/extout.ogg', 50)

				turn_off(user)
				icon_state = "fusebox"
				return TRUE

			if("ДЁРНУТЬ РУБИЛЬНИК")
				playsound(user, 'sound/items/scrape_clunk.ogg', 30)

				if(currently_working)
					playsound(user, 'sound/items/plastic_handle.ogg', 100)
					turn_off()
					return TRUE
				else
					if(do_after(user, 3 SECONDS, src, DO_PUBLIC_UNIQUE))
						playsound(user, 'sound/items/shuttle_beacon_complete.ogg', 100)
						turn_on()
						return TRUE

/obj/screen/gen_background
	name = "ПАНЕЛЬ"
	desc = "С разными кнопками..."
	icon = 'mods/_fd/fd_utilities/icons/power_source.dmi'
	icon_state = "background_1"

	mouse_opacity = FALSE

	plane = HUD_PLANE
	layer = 5.3

	screen_loc = "CENTER-0.2,CENTER"

/obj/screen/gen_background/Initialize()
	. = ..()
	SetTransform(6)

/obj/screen/tumbler
	name = "ТУМБЛЕР"
	desc = "Переключается..."
	icon = 'mods/_fd/fd_utilities/icons/power_source.dmi'
	icon_state = "tumbler"

	var/turned = 1
	plane = HUD_PLANE
	layer = 5.4

	screen_loc = "CENTER-7,CENTER-7"

/obj/screen/tumbler/Initialize()
	. = ..()
	SetTransform(3)

/obj/screen/tumbler/Click()
	if(turned == 2)
		turned = 1
		icon_state = "[initial(icon_state)]"
		return TRUE

	if(turned == 1)
		turned = 2
		icon_state = "[initial(icon_state)]_on"
		return TRUE

/obj/screen/tumbler/techswitch
	icon_state = "switch"

/obj/structure/fd/interactive/basic_power/cool_gen
	name = "ГЕНЕРАТОР"
	desc = "Блок с огромным количеством энергии внутри себя."

	icon = 'mods/_fd/fd_utilities/icons/power_source.dmi'
	icon_state = "gen"
	density = TRUE

	var/obj/screen/tumbler/button1
	var/obj/screen/tumbler/button2
	var/obj/screen/tumbler/button3
	var/obj/screen/tumbler/techswitch/button4

	var/obj/screen/gen_background/back

	var/combination = "2122"

/obj/structure/fd/interactive/basic_power/cool_gen/Initialize()
	. = ..()

	back = new /obj/screen/gen_background()

	button1 = new /obj/screen/tumbler()
	button2 = new /obj/screen/tumbler()
	button3 = new /obj/screen/tumbler()
	button4 = new /obj/screen/tumbler/techswitch()

	button1.screen_loc = "CENTER-1,CENTER+1"
	button2.screen_loc = "CENTER-1,CENTER"
	button3.screen_loc = "CENTER-1,CENTER-1"
	button4.screen_loc = "CENTER+1,CENTER"

	START_PROCESSING(SSobj, src)

/obj/structure/fd/interactive/basic_power/cool_gen/interact_with(mob/living/user)
	show_ui(user)

/obj/structure/fd/interactive/basic_power/cool_gen/proc/show_ui(mob/living/user)
	user.stunned = 99999

	user.reading = TRUE
	user.currently_interacting = src

	user.overlay_fullscreen("smallshade", /obj/screen/fullscreen/shade)

	user.client.screen += back

	user.client.screen += button1
	user.client.screen += button2
	user.client.screen += button3
	user.client.screen += button4

/obj/structure/fd/interactive/basic_power/cool_gen/proc/hide_ui(mob/living/user)
	user.stunned = 0

	user.reading = FALSE
	user.currently_interacting = null

	user.clear_fullscreen("smallshade")
	for(var/obj/screen/T in user.client.screen)
		if(istype(T, /obj/screen/tumbler))
			user.client.screen -= T

		if(istype(T, /obj/screen/gen_background))
			user.client.screen -= T

/obj/structure/fd/interactive/basic_power/cool_gen/Process()
	. = ..()

	if(combination == "[button1.turned][button2.turned][button3.turned][button4.turned]" && !currently_working)
		turn_on()

	if(combination != "[button1.turned][button2.turned][button3.turned][button4.turned]" && currently_working)
		turn_off()

/obj/structure/fd/interactive/basic_power/cool_gen/turn_on()
	icon_state = "[initial(icon_state)]_on"
	currently_working = TRUE

	area.requires_power = FALSE
	area.power_change()

/obj/structure/fd/interactive/basic_power/cool_gen/turn_off()
	icon_state = "[initial(icon_state)]_off"
	currently_working = FALSE

	area.requires_power = TRUE
	area.power_change()

/obj/structure/fd/interactive/note/gen_note
	name = "ГЕНЕРАТОР"
	attached_text = list(/datum/interactive_note/gen_note)

/datum/interactive_note/gen_note
	name = "ВКЛЮЧЕНИЕ ГЕНЕРАТОРА"
	note_info = {"Сначала переведите <span style="color: green;">ползунок</span> давления в положение <span style="color: green;">"ВВЕРХ"</span>. Затем, <span style="color: green;">переключите</span> первый и третий <span style="color: green;">тумблеры</span>, <span style="color: red;">пропуская второй</span>. \
	Если вы сделали всё правильно - на генераторе загорится зелёный индикатор."}
