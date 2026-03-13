/area/
	var/unbreathable = FALSE
	var/mask_wont_help = FALSE
	var/damage_type = DAMAGE_OXY

/area/Entered(mob/living/user)
	. = ..()

	if(unbreathable)
		user.show_danger()

/area/Exited(mob/living/user)
	. = ..()

	if(unbreathable)
		user.hide_danger()

/mob/living
	var/naturally_stored_air = 20
	var/currently_stored_air = 20

/mob/living/Life()

	var/area/A = get_area(src)
	if(A.unbreathable)
		var/obj/item/clothing/mask/gas/gasmask = wear_mask

		if(!istype(gasmask, /obj/item/clothing/mask/gas) || gasmask.filter_stored_air <= 0 || A.mask_wont_help)
			if(currently_stored_air > 0)
				currently_stored_air -= 1
		else
			if(gasmask.filter_stored_air > 0)
				gasmask.filter_stored_air -= 1

	if(!A.unbreathable && currently_stored_air < naturally_stored_air)
		currently_stored_air += 1

	if(A.unbreathable && currently_stored_air == 5)
		show_lowair_warning()

	if(A.unbreathable && currently_stored_air <= 0)
		apply_damage(10, A.damage_type)

	. = ..()

/mob/living/proc/show_lowair_warning()
	var/text_message = "В глазах мутнеет...чувствую себя не очень хорошо..."
	var/colored = "#ffff"

	var/obj/screen/novel_message/start_credits/nofade_simple/visuals = new /obj/screen/novel_message/start_credits/nofade_simple()
	visuals.maptext_x = 0
	visuals.maptext_y = -210

	client.screen += visuals
	visuals.set_text(text_message, colored, time = 10 SECONDS)

/mob/living/proc/show_danger()
	var/text_message = "Что-то не так. Чувствую себя как-то неправильно..."
	var/colored = "#ffff"

	if(wear_mask && wear_mask.item_flags & ITEM_FLAG_AIRTIGHT)
		text_message = "Чувствую, что фильтры закрутились..."

	var/obj/screen/novel_message/start_credits/nofade_simple/visuals = new /obj/screen/novel_message/start_credits/nofade_simple()
	visuals.maptext_x = 0
	visuals.maptext_y = -210

	client.screen += visuals
	visuals.set_text(text_message, colored, time = 10 SECONDS)

/mob/living/proc/hide_danger()
	var/text_message = "Что бы то ни было, но оно миновало..."
	var/colored = "#ffff"

	if(wear_mask && wear_mask.item_flags & ITEM_FLAG_AIRTIGHT)
		text_message = "Похоже, тут можно безопасно снять снаряжение!"

	var/obj/screen/novel_message/start_credits/nofade_simple/visuals = new /obj/screen/novel_message/start_credits/nofade_simple()
	visuals.maptext_x = 0
	visuals.maptext_y = -210

	client.screen += visuals
	visuals.set_text(text_message, colored, time = 10 SECONDS)

/obj/item/clothing/mask/gas
	var/filter_stored_air = 0
	var/filter_max_air = 100
	var/current_status

/obj/item/clothing/mask/gas/MouseEntered(location, control, params)
	. = ..()

	if(loc == usr)

		switch(filter_stored_air)
			if(0)
				current_status = "gas_empty"
			if(1 to 20)
				current_status = "gas_low"
			if(21 to 50)
				current_status = "gas_half"
			if(51 to 75)
				current_status = "gas_notsofull"
			if(76 to 100)
				current_status = "gas_full"

		overlays += image('mods/_fd/fd_events/icons/casual_gasmask_info.dmi', current_status)

/obj/item/clothing/mask/gas/MouseExited(location, control, params)
	. = ..()
	overlays -= image('mods/_fd/fd_events/icons/casual_gasmask_info.dmi', current_status)

/obj/item/clothing/mask/gas/use_tool(obj/item/tool, mob/living/user, list/click_params)
	. = ..()

	if(istype(tool, /obj/item/fd/filter))
		var/obj/item/fd/filter/F = tool
		if(F.additional_air <= 0)
			to_chat(user, SPAN_WARNING("Наполнитель пуст!"))
			return FALSE

		if(do_after(user, 5 SECONDS, F, DO_PUBLIC_UNIQUE, DO_BOTH_CAN_MOVE))
			visible_message("[user] наполняет фильтр используя [F].", "Ты наполнил фильтр [src].")

			var/how_empty = filter_max_air - filter_stored_air
			var/refill_with = F.additional_air - how_empty

			if(refill_with <= 0)
				filter_stored_air += F.additional_air
				F.additional_air = 0
			else
				filter_stored_air += refill_with
				F.additional_air -= refill_with

/obj/item/fd/filter
	name = "НАПОЛНИТЕЛЬ"
	desc = "Специализированная канистра с ограниченными запасами смеси внутри."
	icon = 'mods/_fd/fd_assets/icons/obj/items/device_eris.dmi'
	icon_state = "nanorepair_tank"
	var/additional_air = 50
	var/current_status

	w_class = ITEM_SIZE_SMALL

/obj/item/fd/filter/MouseEntered(location, control, params)
	. = ..()

	if(loc == usr)

		switch(additional_air)
			if(0)
				current_status = "gas_empty"
			if(1 to 10)
				current_status = "gas_low"
			if(11 to 25)
				current_status = "gas_half"
			if(26 to 40)
				current_status = "gas_notsofull"
			if(41 to 50)
				current_status = "gas_full"

		overlays += image('mods/_fd/fd_events/icons/casual_gasmask_info.dmi', current_status)

/obj/item/fd/filter/MouseExited(location, control, params)
	. = ..()
	overlays -= image('mods/_fd/fd_events/icons/casual_gasmask_info.dmi', current_status)
