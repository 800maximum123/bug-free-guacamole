/area/
	var/adventure_mode = FALSE

/mob/living/Life()

	var/area/A = get_area(src)
	if(A.adventure_mode && client && psi)
		psi.stunned(5)

	. = ..()

/obj/machinery/door/Initialize()
	. = ..()
	var/area/A = get_area(src)

	if(A.adventure_mode)
		can_use_tools = FALSE

/obj/machinery/door/use_tool(obj/item/I, mob/living/user, list/click_params)

	if(!can_use_tools)

		desc_special = {"<span style="color: red;">Чего я пытаюсь добиться?</span>"}
		desc_special_show = TRUE

		if (!operating)
			if (allowed(user) && operable())
				if(density)
					open()
				else
					close()
				return TRUE

			if (density)
				do_animate("deny")
			update_icon()
			return TRUE

		else
			interact_with(user)

			desc_special = initial(desc_special)
			desc_special_show = FALSE
			return TRUE

	else
		. = ..()

/turf/simulated/wall/use_tool(obj/item/W, mob/living/user, list/click_params)
	var/area/A = get_area(src)

	if(A.adventure_mode)
		desc_special = {"<span style="color: red;">Чего я пытаюсь добиться?</span>"}
		desc_special_show = TRUE

		interact_with(user)

		desc_special = initial(desc_special)
		desc_special_show = FALSE
		return TRUE

	. = ..()
