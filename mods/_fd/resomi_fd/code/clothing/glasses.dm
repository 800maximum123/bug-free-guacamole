/obj/item/clothing/glasses/sunglasses/lenses
	name = "small sun lenses"
	desc = "It looks fitted to nonhuman proportions. Usually, you can(?) see them in resomis' or monkeys' eyes."
	item_icons = list(slot_glasses_str = 'mods/_fd/resomi_fd/icons/clothing/onmob_eyes_resomi.dmi')
	icon = 'packs/infinity/icons/obj/clothing/species/resomi/obj_eyes_resomi.dmi'
	icon_state = "sun_lenses"
	item_state = null
	species_restricted = list(SPECIES_RESOMI)
	flash_protection = FLASH_PROTECTION_MODERATE
	light_protection = 7
	body_parts_covered = 0

/obj/item/clothing/glasses/sunglasses/sechud/lenses
	name = "small sechud lenses"
	desc = "Lenses with a HUD. This one has a sechud."
	item_icons = list(slot_glasses_str = 'mods/_fd/resomi_fd/icons/clothing/onmob_eyes_resomi.dmi')
	icon = 'packs/infinity/icons/obj/clothing/species/resomi/obj_eyes_resomi.dmi'
	icon_state = "sec_lenses"
	item_state = null
	species_restricted = list(SPECIES_RESOMI)
	flash_protection = FLASH_PROTECTION_MODERATE
	light_protection = 7

/obj/item/clothing/glasses/hud/health/lenses
	name = "small medhud lenses"
	desc = "A small lenses that scans the creatures in view and provides accurate data about their health status."
	item_icons = list(slot_glasses_str = 'mods/_fd/resomi_fd/icons/clothing/onmob_eyes_resomi.dmi')
	icon = 'packs/infinity/icons/obj/clothing/species/resomi/obj_eyes_resomi.dmi'
	icon_state = "med_lenses"
	item_state = null
	flash_protection = FLASH_PROTECTION_MODERATE
	light_protection = 7
	species_restricted = list(SPECIES_RESOMI)

/obj/item/clothing/glasses/lightgoggles
	name = "orange goggles"
	desc = "Resomi designed lightweight goggles."
	icon_state = "orange-g"
	item_icons = list(
		slot_glasses_str = 'mods/_fd/resomi_fd/icons/clothing/onmob_eyes_resomi.dmi',
		slot_r_hand_str = "glasses",
		slot_l_hand_str = "glasses"
		)
	icon = 'mods/_fd/resomi_fd/icons/clothing/obj_eyes_resomi.dmi'
	action_button_name = "Adjust Orange Goggles"
	var/up = 0
	body_parts_covered = EYES
	species_restricted = list(SPECIES_RESOMI)
	flash_protection = FLASH_PROTECTION_MODERATE
	light_protection = 7

/obj/item/clothing/glasses/lightgoggles/attack_self()
	toggle()

/obj/item/clothing/glasses/lightgoggles/verb/toggle()
	set category = "Object"
	set name = "Adjust Orange Goggles"
	set src in usr

	if(!usr.incapacitated())
		if(src.up)
			src.up = !src.up
			flags_inv |= HIDEEYES
			body_parts_covered |= EYES
			icon_state = initial(icon_state)
			flash_protection = initial(flash_protection)
			light_protection = initial(light_protection)
			tint = initial(tint)
			to_chat(usr, "You flip \the [src] down to protect your eyes.")
		else
			src.up = !src.up
			flags_inv &= ~HIDEEYES
			body_parts_covered &= ~EYES
			icon_state = "[initial(icon_state)]up"
			flash_protection = FLASH_PROTECTION_NONE
			light_protection = null
			to_chat(usr, "You push \the [src] up from in front of your eyes.")
		update_clothing_icon()
		update_vision()
		usr.update_action_buttons()
