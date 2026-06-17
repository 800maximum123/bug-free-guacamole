/obj/item/gun/projectile/automatic/mp5
	name = "\improper MP5 submachine gun"
	desc = "A German design, this was one of the most widely used submachine guns in the world. It's still possible to find this firearm in the hands of collectors or gun fanatics. Wait, where full-auto?"
	icon = 'mods/_fd/fd_customs/customs/palerno/icon/smgs.dmi'
	icon_state = "mp5"
	item_state = "mp5"
	item_icons = list(
		slot_l_hand_str = 'mods/_fd/fd_customs/customs/palerno/onmob/smgs_lefthand.dmi',
		slot_r_hand_str = 'mods/_fd/fd_customs/customs/palerno/onmob/smgs_righthand.dmi',
		slot_back_str = 'mods/_fd/fd_customs/customs/palerno/onmob/smgs_back.dmi'
	)
	w_class = ITEM_SIZE_LARGE
	force = 10
	caliber = CALIBER_PISTOL
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2)
	slot_flags = SLOT_BACK
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/smg/mp5
	allowed_magazines = /obj/item/ammo_magazine/smg/mp5
	fire_sound = 'mods/_fd/fd_customs/customs/palerno/sound/smg_light.ogg'
	mag_insert_sound = 'mods/_fd/fd_customs/customs/palerno/sound/smg_reload.ogg'
	mag_remove_sound = 'mods/_fd/fd_customs/customs/palerno/sound/smg_unload.ogg'
	bulk = -1
	accuracy = 2
	one_hand_penalty = 4

	firemodes = list(
		list(mode_name = "semi auto", burst = 1, fire_delay = 2.5, move_delay = null, one_hand_penalty = 4, burst_accuracy = null, dispersion = 0.3),
		list(mode_name = "3-round bursts", burst = 3, fire_delay = 2.5, burst_delay = 1.5, move_delay = 4, one_hand_penalty = 5, burst_accuracy = list(0, -1, -1), dispersion = list(0.3, 0.6, 0.9)),
	)

/obj/item/gun/projectile/automatic/mp5/on_update_icon()
	..()
	if(ammo_magazine)
		icon_state = initial(icon_state)
	else
		icon_state = "[initial(icon_state)]-empty"

	var/mob/living/M = loc
	if(istype(M) && M.can_wield_item(src) && is_held_twohanded(M))
		item_state_slots[slot_l_hand_str] = "mp5_wielded"
		item_state_slots[slot_r_hand_str] = "mp5-wielded"
	else
		item_state_slots[slot_l_hand_str] = initial(item_state)
		item_state_slots[slot_r_hand_str] = initial(item_state)

/obj/item/gun/projectile/automatic/mp5/empty
	starts_loaded = FALSE

/obj/item/ammo_magazine/smg/mp5
	name = "\improper MP5 magazine"
	desc = "A magazine for the MP5 submachine gun."
	icon = 'mods/_fd/fd_customs/customs/palerno/icon/smgs_ammo.dmi'
	icon_state = "mp5"
	max_ammo = 30

/obj/item/ammo_magazine/smg/mp5/empty
	initial_ammo = 0
