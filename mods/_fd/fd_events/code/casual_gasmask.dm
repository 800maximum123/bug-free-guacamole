/area/
	var/unbreathable = FALSE
	var/mask_wont_help = FALSE
	var/damage_type = DAMAGE_OXY

/area/Entered(mob/living/user)
	. = ..()

	if(isliving(user) && user.need_to_breath)
		if(unbreathable && user.client)
			user.show_danger()

/area/Exited(mob/living/user)
	. = ..()

	if(isliving(user) && user.need_to_breath)
		if(unbreathable && user.client)
			user.hide_danger()

/mob/living
	var/naturally_stored_air = 20
	var/currently_stored_air = 20

	var/need_to_breath = TRUE

/mob/living/Life()

	var/obj/item/clothing/mask/gas/gasmask = wear_mask
	var/area/A = get_area(src)

	if(need_to_breath)

		if(A.unbreathable && currently_stored_air == 5 && client)
			show_lowair_warning()

		if(!A.unbreathable && currently_stored_air < naturally_stored_air)
			currently_stored_air += 1

		if(ishuman(src))
			var/mob/living/carbon/human/H = src
			var/obj/item/organ/internal/cell/E = H.internal_organs_by_name[BP_CELL]

			if(A.unbreathable)
				if(E && E.cell.charge >= 10)
					E.cell.charge -= 10
					//H.recalculate_reality_connection(0.1) // УДАЛИТЬ ПОТОМ
				else

					if(breath_protected(gasmask, A))
						gasmask.filter_stored_air -= 1
						playsound_local(get_turf(src), 'sound/machines/pump.ogg', 20)
					else
						if(currently_stored_air > 0)
							currently_stored_air -= 1
						if(currently_stored_air <= 0)
							emote("gasp")
							if(simple_combat_on)
								simple_health_calculation(5, 0, 0, 0)
							else
								apply_damage(10, A.damage_type)
								//H.recalculate_reality_connection(0.1) // УДАЛИТЬ ПОТОМ

		if(A.unbreathable && !ishuman(src))
			if(currently_stored_air > 0)
				currently_stored_air -= 1
			if(currently_stored_air <= 0)
				if(simple_combat_on)
					simple_health_calculation(5, 0, 0, 0)
				else
					apply_damage(10, A.damage_type)

	. = ..()

/mob/living/proc/breath_protected(obj/item/clothing/mask/gas/protection, area/infested_zone)
	if(!protection)
		return FALSE
	if(!istype(protection, /obj/item/clothing/mask/gas))
		return FALSE
	if(protection.filter_stored_air <= 0)
		return FALSE
	if(infested_zone.mask_wont_help)
		return FALSE

	return TRUE

/mob/living/proc/show_lowair_warning()
	var/text_message = "В глазах мутнеет...чувствую себя не очень хорошо..."
	var/colored = "#000f"

	var/obj/screen/novel_message/start_credits/visuals = new /obj/screen/novel_message/start_credits()
	visuals.maptext_x = 0
	visuals.maptext_y = -210

	client.screen += visuals
	visuals.set_text(text_message, colored, time = 5 SECONDS)

/mob/living/proc/show_danger()
	var/text_message = "Что-то не так. Чувствую себя как-то неправильно..."
	var/colored = "#000f"

	if(wear_mask && wear_mask.item_flags & ITEM_FLAG_AIRTIGHT)
		playsound(src, 'sound/effects/internals.ogg', 50)
		text_message = "Чувствую, что фильтры закрутились..."

	var/obj/screen/novel_message/start_credits/visuals = new /obj/screen/novel_message/start_credits()
	visuals.maptext_x = 0
	visuals.maptext_y = -210

	client.screen += visuals
	visuals.set_text(text_message, colored, time = 5 SECONDS)

/mob/living/proc/hide_danger()
	var/text_message = "Что бы то ни было, но оно миновало..."
	var/colored = "#000f"

	if(wear_mask && wear_mask.item_flags & ITEM_FLAG_AIRTIGHT)
		text_message = "Похоже, тут можно безопасно снять снаряжение!"

	var/obj/screen/novel_message/start_credits/visuals = new /obj/screen/novel_message/start_credits()
	visuals.maptext_x = 0
	visuals.maptext_y = -210

	client.screen += visuals
	visuals.set_text(text_message, colored, time = 5 SECONDS)

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
			else
				current_status = "gas_full"

		AddOverlays(image('mods/_fd/fd_events/icons/casual_gasmask_info.dmi', current_status), ATOM_ICON_CACHE_ALL)

/obj/item/clothing/mask/gas/MouseExited(location, control, params)
	. = ..()
	CutOverlays(image('mods/_fd/fd_events/icons/casual_gasmask_info.dmi', current_status), ATOM_ICON_CACHE_ALL)

/obj/item/clothing/mask/gas/use_tool(obj/item/tool, mob/living/user, list/click_params)
	. = ..()

	if(istype(tool, /obj/item/fd/filter))
		var/obj/item/fd/filter/F = tool
		if(F.additional_air <= 0)
			to_chat(user, SPAN_WARNING("Наполнитель пуст!"))
			return FALSE

		if(do_after(user, 5 SECONDS, F, DO_PUBLIC_UNIQUE))
			visible_message("[user] наполняет фильтр используя [F].", "Ты наполнил фильтр [src].")
			playsound(user, 'sound/effects/refill.ogg', 50)

			var/how_empty = filter_max_air - filter_stored_air
			var/refill_with = F.additional_air - how_empty

			if(refill_with <= 0)
				filter_stored_air += F.additional_air
				F.additional_air = 0
			else
				filter_stored_air += refill_with
				F.additional_air -= refill_with

/obj/item/fd/filter
	name = "gas filter"
	desc = "For sanitizing bad chemicals in the air."
	icon = 'mods/_fd/fd_assets/icons/obj/items/device_eris.dmi'
	icon_state = "nanorepair_tank"
	var/additional_air = 50
	var/current_status

	w_class = ITEM_SIZE_TINY

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

		AddOverlays(image('mods/_fd/fd_events/icons/casual_gasmask_info.dmi', current_status), ATOM_ICON_CACHE_ALL)

/obj/item/fd/filter/MouseExited(location, control, params)
	. = ..()
	CutOverlays(image('mods/_fd/fd_events/icons/casual_gasmask_info.dmi', current_status), ATOM_ICON_CACHE_ALL)

// Gasmask overlay stuff

/obj/item/clothing/mask/gas
	var/gasmaskoverlay = TRUE //аймин, минусы будут?

/obj/item/clothing/mask/gas/equipped(mob/user, slot)
	. = ..()
	if(gasmaskoverlay)
		GLOB.mob_equipped_event.register(user, src, PROC_REF(update_terribleoverlay))
		GLOB.mob_unequipped_event.register(user, src, PROC_REF(update_terribleoverlay))

/obj/item/clothing/mask/gas/dropped(mob/user, slot)
	. = ..()
	if(gasmaskoverlay)
		GLOB.mob_equipped_event.unregister(user, src, PROC_REF(update_terribleoverlay))
		GLOB.mob_unequipped_event.unregister(user, src, PROC_REF(update_terribleoverlay))

/obj/item/clothing/mask/gas/proc/update_terribleoverlay(mob/user)
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/player = user
	var/obj/item/clothing/mask/gas/gasmask = player.wear_mask
	player.clear_fullscreen("gasmaskoverlay")
	if(gasmask.gasmaskoverlay)
		player.overlay_fullscreen("gasmaskoverlay", /obj/screen/fullscreen/gasmask)
	/*if(istype(user.wear_mask, /obj/item/clothing/mask/gas))
		var/obj/item/clothing/mask/gas/gasmask = user.wear_mask
	if(!gasmask.gasmaskoverlay)
		user.clear_fullscreen("gasmaskoverlay")
	user.overlay_fullscreen("gasmaskoverlay", /obj/screen/fullscreen/gasmask)
*/
/obj/screen/fullscreen/gasmask
	icon = 'mods/_fd/fd_events/icons/gasmask_fullscreen.dmi'
	scale_to_view = FALSE
	icon_state = "gasmaskbetter"
