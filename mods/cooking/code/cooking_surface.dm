/obj/structure/fd/stove
	name = "stove"
	icon = 'mods/cooking/icons/kitchen32x32.dmi'
	icon_state = "colonyDuo_off"
	density = TRUE
	anchored = TRUE

	var/lit = FALSE
	var/obj/item/reagent_containers/cooker/cooker

/obj/structure/fd/stove/use_tool(obj/item/I, mob/living/user)
	. = ..()
	if(isFlameOrHeatSource(I))
		if(do_after(user, 30))
			lit = TRUE
			update_icon()
			START_PROCESSING(SSobj, src)
		return TRUE
	if(istype(I, /obj/item/reagent_containers/cooker))
		var/obj/item/reagent_containers/cooker/C = I

		if(C.is_open_container())
			to_chat(user, SPAN_WARNING("You need to put a lid on \a [C]"))
			return

		if(!user.unEquip(C, user))
			return

		to_chat(user, SPAN_NOTICE("You put \a [C] on \the [src]."))
		cooker = C
		cooker.transform_to_overlay(-6, 1)
		update_icon()
		return TRUE

/obj/structure/fd/stove/attack_hand(mob/user)
	. = ..()
	if(cooker)
		if(user.put_in_hands(cooker))
			cooker.transform_to_item()
			cooker = null
			update_icon()
			return TRUE

	if(lit)
		to_chat(user, SPAN_NOTICE("You've turned off \the [src]."))
		lit = FALSE

		update_icon()
		STOP_PROCESSING(SSobj, src)
		return TRUE

/obj/structure/fd/stove/Process()
	if(lit)
		cooker?.update_cooking()

/obj/structure/fd/stove/on_update_icon()
	. = ..()
	vis_contents.Cut()
	if(cooker)
		vis_contents += cooker

	CutOverlays("burner_on_flame")
	if(lit)
		AddOverlays("burner_on_flame")

/obj/structure/fd/campfire/var/obj/item/reagent_containers/cooker/cooker
/obj/structure/fd/campfire/use_tool(obj/item/I, mob/living/user)
	. = ..()
	if(istype(I, /obj/item/reagent_containers/cooker))
		var/obj/item/reagent_containers/cooker/C = I

		if(C.is_open_container())
			to_chat(user, SPAN_WARNING("You need to put a lid on \a [C]"))
			return

		if(!user.unEquip(C, user))
			return

		to_chat(user, SPAN_NOTICE("You put \a [C] on \the [src]."))
		cooker = C
		cooker.transform_to_overlay(0, -8)
		update_icon()

/obj/structure/fd/campfire/on_update_icon()
	. = ..()
	vis_contents.Cut()
	if(cooker)
		vis_contents += cooker

/obj/structure/fd/campfire/attack_hand(mob/user)
	. = ..()
	if(cooker)
		if(user.put_in_hands(cooker))
			cooker.transform_to_item()
			cooker = null
			update_icon()

/obj/structure/fd/campfire/Process()
	. = ..()
	if(lit)
		cooker?.update_cooking()
