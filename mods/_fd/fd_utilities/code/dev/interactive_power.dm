/obj/machinery/proc/genturn_reaction(power_up = FALSE)
	if(power_up)
		use_power = POWER_USE_OFF
	else
		use_power = initial(use_power)

/obj/sturcture/fd/interactive/basic_power
	name = "TEST SOURCE"
	desc = "SIMPLE POWER SWITCH"
	var/currently_working = FALSE

	anchored = TRUE
	density = FALSE
	var/area/area

/obj/sturcture/fd/interactive/basic_power/Initialize()
	. = ..()
	area = get_area(src)

/obj/sturcture/fd/interactive/basic_power/proc/turn_on()
	icon_state = "[initial(icon_state)]_on"
	currently_working = TRUE

	for(var/obj/machinery/M in area.contents)
		invoke_async(M, TYPE_PROC_REF(/obj/machinery, genturn_reaction), TRUE)

/obj/sturcture/fd/interactive/basic_power/proc/turn_off()
	icon_state = "[initial(icon_state)]_off"
	currently_working = FALSE

	for(var/obj/machinery/M in area.contents)
		invoke_async(M, TYPE_PROC_REF(/obj/machinery, genturn_reaction), FALSE)

/obj/sturcture/fd/interactive/basic_power/interact_with(mob/user)
	. = ..()

/obj/sturcture/fd/interactive/basic_power/fuse_box
	name = "ЭЛЕКТРОЩИТОК"
	desc = "Коробка с разными проводками и микросхемами."

	icon = 'mods/_fd/fd_utilities/icons/power_source.dmi'
	icon_state = "fusebox_empty"

	var/obj/item/fd/basic_power/fuse/fuse
	var/prefit = FALSE
	var/prelit = FALSE

/obj/item/fd/basic_power/fuse
	name = "ПРЕДОХРАНИТЕЛЬ"
	desc = "Таким можно запитать какой-то небольшой щиток."

	icon = 'mods/_fd/fd_utilities/icons/power_source.dmi'
	icon_state = "fuse"

/obj/sturcture/fd/interactive/basic_power/fuse_box/Initialize()
	. = ..()
	if(prefit)
		fuse = new /obj/item/fd/basic_power/fuse()
		icon_state = "fusebox_off"

		if(prelit)
			turn_on()

/obj/sturcture/fd/interactive/basic_power/fuse_box/interact_with(mob/user)

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
			I.forceMove(src)
			fuse = I

			desc_special_show = FALSE
			if(do_after(user, 3 SECONDS, src, DO_PUBLIC_UNIQUE))
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

				turn_off(user)
				icon_state = "fusebox_empty"
				return TRUE

			if("ДЁРНУТЬ РУБИЛЬНИК")
				if(currently_working)
					turn_off()
					return TRUE
				else
					if(do_after(user, 3 SECONDS, src, DO_PUBLIC_UNIQUE))
						turn_on()
						return TRUE
