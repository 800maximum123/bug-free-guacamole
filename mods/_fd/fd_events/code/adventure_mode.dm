/area/
	var/adventure_mode = FALSE

/obj/machinery/door/Initialize()
	var/area/A = get_area(src)

	if(A.adventure_mode)
		can_use_tools = FALSE

	. = ..()

/obj/machinery/door/use_tool(obj/item/I, mob/living/user, list/click_params)

	if(!can_use_tools)

		desc_special = {"<span style="color: red;">Чего я пытаюсь добиться?</span>"}
		desc_special_show = TRUE

		interact_with(user)

		desc_special = initial(desc_special)
		desc_special_show = FALSE
		return FALSE

	else
		. = ..()

/obj/machinery/door/use_weapon(obj/item/weapon, mob/living/user, list/click_params)

	if(!can_use_tools)
		desc_special = {"<span style="color: red;">Чего я пытаюсь добиться?</span>"}
		desc_special_show = TRUE

		interact_with(user)

		desc_special = initial(desc_special)
		desc_special_show = FALSE
		return FALSE

	. = ..()

/obj/machinery/door/airlock/use_tool(obj/item/I, mob/living/user, list/click_params)

	if(!can_use_tools)

		desc_special = {"<span style="color: red;">Чего я пытаюсь добиться?</span>"}
		desc_special_show = TRUE

		interact_with(user)

		desc_special = initial(desc_special)
		desc_special_show = FALSE
		return FALSE

	else
		. = ..()

/obj/machinery/door/blast/use_tool(obj/item/C, mob/living/user, list/click_params)

	if(!can_use_tools)

		desc_special = {"<span style="color: red;">Чего я пытаюсь добиться?</span>"}
		desc_special_show = TRUE

		interact_with(user)

		desc_special = initial(desc_special)
		desc_special_show = FALSE
		return FALSE

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
		return FALSE

	. = ..()

/turf/simulated/wall/use_weapon(obj/item/weapon, mob/living/user, list/click_params)
	var/area/A = get_area(src)

	if(A.adventure_mode)
		desc_special = {"<span style="color: red;">Чего я пытаюсь добиться?</span>"}
		desc_special_show = TRUE

		interact_with(user)

		desc_special = initial(desc_special)
		desc_special_show = FALSE
		return FALSE

	. = ..()
