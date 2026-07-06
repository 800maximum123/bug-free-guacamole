/obj/item/gun/projectile/shotgun/pump/sol_service
	name = "service shotgun"
	desc = "The Hephaestus Industries MSS8 Rammer is a semi-auto tube-fed shotgun in widespread use of SCG federal law enforcement and SCGDF to lesser extent. For use with non-lethal payloads, however, pump-action mode is required to ensure proper cycling."
	icon = 'mods/_fd/fd_guns/icons/service_longarms.dmi'
	icon_state = "rammer"
	item_state = "cshotgun"
	max_shells = 8
	w_class = ITEM_SIZE_HUGE
	force = 10
	obj_flags =  OBJ_FLAG_CONDUCTIBLE
	slot_flags = SLOT_BACK
	caliber = CALIBER_SHOTGUN
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 3)
	fire_delay = 5
	load_method = SINGLE_CASING
	ammo_type = /obj/item/ammo_casing/shotgun/pellet
	handle_casings = EJECT_CASINGS
	one_hand_penalty = 8
	bulk = 6
	var/semiauto = TRUE
	var/low_power_casings = list(/obj/item/ammo_casing/shotgun/beanbag, /obj/item/ammo_casing/shotgun/blank, /obj/item/ammo_casing/shotgun/stunshell, /obj/item/ammo_casing/shotgun/flash)
	var/mode_icon = "rammer-mode"
	wielded_item_state = "cshotgun-wielded"
	load_sound = 'sound/weapons/guns/interaction/shotgun_instert.ogg'

/obj/item/gun/projectile/shotgun/pump/sol_service/Initialize()
	..()
	verbs += /obj/item/gun/projectile/shotgun/pump/sol_service/proc/cycling_mode

/obj/item/gun/projectile/shotgun/pump/sol_service/on_update_icon()
	..()
	if(!semiauto)
		AddOverlays(image(icon, mode_icon))

/obj/item/gun/projectile/shotgun/pump/sol_service/proc/cycling_mode()
	set category = "Object"
	set name = "Switch Cycling Mode"
	set popup_menu = 1

	toggle_mode(usr)

/obj/item/gun/projectile/shotgun/pump/sol_service/proc/toggle_mode(mob/user)
	if(!semiauto)
		handle_casings = EJECT_CASINGS
		to_chat(user, SPAN_NOTICE("You press the action toggle button on [src], switching it to semi-automatic."))
	else
		handle_casings = HOLD_CASINGS
		to_chat(user, SPAN_NOTICE("You press the action toggle button on [src], switching it to pump-action."))
	playsound(src.loc, 'sound/weapons/flipblade.ogg', 50, 1)
	semiauto = !semiauto
	update_icon()

/obj/item/gun/projectile/shotgun/pump/sol_service/handle_post_fire(mob/user)
	if(semiauto && is_type_in_list(chambered, low_power_casings))
		to_chat(user, SPAN_WARNING("\The [src] fails to extract the casing! Pump it manually!"))
		handle_casings = HOLD_CASINGS
		semiauto = !semiauto

	..()
	if(semiauto)
		if(length(loaded))
			var/obj/item/ammo_casing/AC = loaded[1]
			loaded -= AC
			chambered = AC
