/obj/sturcture/fd/interactive/basic_power
	name = "TEST SOURCE"
	desc = "SIMPLE POWER SWITCH"
	var/currently_working = FALSE

	anchored = TRUE
	density = FALSE
	var/area/area

	var/datum/sound_token/sound_token
	var/sound_id

/obj/sturcture/fd/interactive/basic_power/Initialize()
	. = ..()
	area = get_area(src)

/obj/sturcture/fd/interactive/basic_power/fuse_box/Process()
	update_sound()

/obj/sturcture/fd/interactive/basic_power/proc/turn_on()
	icon_state = "[initial(icon_state)]_on"
	currently_working = TRUE

	area.requires_power = FALSE
	area.power_change()

	START_PROCESSING(SSobj, src)

/obj/sturcture/fd/interactive/basic_power/proc/turn_off()
	icon_state = "[initial(icon_state)]_off"
	currently_working = FALSE

	area.requires_power = TRUE
	area.power_change()

	STOP_PROCESSING(SSobj, src)

/obj/sturcture/fd/interactive/basic_power/proc/update_sound()
	if(!sound_id)
		sound_id = "[type]_[sequential_id(/obj/sturcture/fd/interactive/basic_power)]"
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

/obj/sturcture/fd/interactive/basic_power/fuse_box
	name = "ЭЛЕКТРОЩИТОК"
	desc = "Коробка с разными проводками и микросхемами."

	icon = 'mods/_fd/fd_utilities/icons/power_source.dmi'
	icon_state = "fusebox"

	var/obj/item/fd/basic_power/fuse/fuse
	var/prefit = FALSE
	var/prelit = FALSE

/obj/sturcture/fd/interactive/basic_power/fuse_box/Initialize()
	. = ..()
	if(prefit)
		fuse = new /obj/item/fd/basic_power/fuse()
		icon_state = "fusebox_off"

		if(prelit)
			turn_on()

/obj/sturcture/fd/interactive/basic_power/fuse_box/interact_with(mob/living/user)

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
