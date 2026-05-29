/area/
	var/unbreathable = FALSE
	var/mask_wont_help = FALSE
	var/damage_type = DAMAGE_OXY

/area/Entered(mob/living/user)
	. = ..()

	if(isliving(user) && user.need_to_breath)
		if(unbreathable && user.client)
			user.balloon_alert(user, "|ВНИМАНИЕ! ЗАДЕРЖИТЕ ДЫХАНИЕ!|", COLOR_RED)

/area/Exited(mob/living/user)
	. = ..()

	if(isliving(user) && user.need_to_breath)
		if(unbreathable && user.client)
			user.balloon_alert(user, "|МОЖНО ДЫШАТЬ|", COLOR_GREEN)

/mob/living
	var/naturally_stored_air = 30
	var/currently_stored_air = 30

	var/need_to_breath = TRUE

/mob/living/Life()

	var/obj/item/clothing/mask/gas/gasmask = wear_mask
	var/area/A = get_area(src)

	if(need_to_breath)

		if(A.unbreathable && currently_stored_air == 5 && client)
			balloon_alert(src, "|ВНИМАНИЕ! У ВАС ПРАКТИЧЕСКИ ЗАКОНЧИЛСЯ ВОЗДУХ! НАДЕНЬТЕ МАСКУ!|", COLOR_RED)

		if(!A.unbreathable && currently_stored_air < naturally_stored_air)
			currently_stored_air = clamp(currently_stored_air + 2, 0, naturally_stored_air)

		if(ishuman(src))
			var/mob/living/carbon/human/H = src
			var/obj/item/organ/internal/cell/E = H.internal_organs_by_name[BP_CELL]

			if(A.unbreathable)
				if(isSynthetic(H))
					if(E && E.cell.charge >= 5)
						E.cell.charge -= 5
					if(E && E.cell.charge == 20)
						balloon_alert(src, "|ВНИМАНИЕ! КРИТИЧЕСКАЯ НЕХВАТКА ПИТАНИЯ!|", COLOR_RED)
						//H.recalculate_reality_connection(0.1) // УДАЛИТЬ ПОТОМ
				else

					if(breath_protected(gasmask, A))
						gasmask.filter_slot.stored_air = clamp(gasmask.filter_slot.stored_air - 1, 0, gasmask.filter_slot.stored_air)
						playsound_local(get_turf(src), 'sound/machines/pump.ogg', 20)
					else
						if(currently_stored_air > 0)
							currently_stored_air = clamp(currently_stored_air - 1, 0, naturally_stored_air)
						if(currently_stored_air <= 0)
							emote("gasp")
							if(simple_combat_on)
								simple_health_calculation(2, 0, 0, 0)
							else
								apply_damage(10, A.damage_type)
								//H.recalculate_reality_connection(0.1) // УДАЛИТЬ ПОТОМ

		if(A.unbreathable && !ishuman(src))
			if(currently_stored_air > 0)
				currently_stored_air = clamp(currently_stored_air - 1, 0, naturally_stored_air)
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
	if(!protection.filter_slot)
		return FALSE
	if(protection.filter_slot.stored_air <= 0)
		return FALSE
	if(infested_zone.mask_wont_help)
		return FALSE

	return TRUE

/obj/item/clothing/mask/gas
	var/current_status

	var/obj/item/fd/filter/filter_slot
	var/start_with_filter = FALSE

/obj/item/clothing/mask/gas/Initialize()
	. = ..()

	if(start_with_filter)
		filter_slot = new /obj/item/fd/filter()

/obj/item/clothing/mask/gas/MouseEntered(location, control, params)
	. = ..()

	if(loc == usr)

		if(!filter_slot)
			current_status = "gas_empty"

		else
			switch(filter_slot.stored_air)
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

		AddOverlays(image('mods/_fd/fd_events/icons/casual_gasmask_info.dmi', current_status))

/obj/item/clothing/mask/gas/MouseExited(location, control, params)
	. = ..()
	CutOverlays(image('mods/_fd/fd_events/icons/casual_gasmask_info.dmi', current_status))

/obj/item/clothing/mask/gas/use_tool(obj/item/tool, mob/living/user, list/click_params)
	. = ..()

	if(istype(tool, /obj/item/fd/filter))
		var/obj/item/fd/filter/F = tool

		if(do_after(user, 5 SECONDS, F, DO_PUBLIC_UNIQUE))
			CutOverlays(image('mods/_fd/fd_events/icons/casual_gasmask_info.dmi', current_status))
			if(filter_slot)
				user.put_in_inactive_hand(filter_slot)
				filter_slot = null

			user.drop_from_inventory(F)
			F.forceMove(src)
			filter_slot = F

			if(filter_slot.stored_air > 0)
				balloon_alert_to_viewers("|ПШШШ...|", null, COLOR_WHITE)
				playsound(user, 'sound/effects/refill.ogg', 50)
			visible_message("[user] вставляет [F] в [src].", "Ты вставил фильтр в [src].")
			if(filter_slot.stored_air <= 0)
				user.balloon_alert(user, "|ВНИМАНИЕ! ФИЛЬТР ПУСТ!|", COLOR_RED)

/obj/item/fd/filter
	name = "gas filter"
	desc = "For sanitizing bad chemicals in the air."
	icon = 'mods/_fd/fd_assets/icons/obj/items/device_eris.dmi'
	icon_state = "nanorepair_tank"
	var/stored_air = 100
	var/max_stored_air = 100

	w_class = ITEM_SIZE_TINY

/obj/item/fd/filter/MouseEntered(location, control, params)
	. = ..()

	if(loc == usr)
		maptext = STYLE_SMALLFONTS_OUTLINE("[stored_air]/[max_stored_air]", 7, COLOR_WHITE, COLOR_BLACK)

/obj/item/fd/filter/MouseExited(location, control, params)
	. = ..()

	if(maptext)
		maptext = ""

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
