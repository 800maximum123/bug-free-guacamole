// GUNS USED IN GaianWar BRANCH
// PUT ALL NEW GUNS YOU MAKE HERE TO PREVENT ANY PROBLEMS WITH MERGES

//sol guns 4 gaia
/obj/item/gun/projectile/automatic/caseless
	name = "caseless assault rifle"
	desc = "An H3 'Ocelot' assault rifle. A mainstay of SCGDF, H3 and its configurations are made to shine in situations \
	where Z8 lacks versatility. Courtesy of Hephaestus Industries. This one's a regular make, only fitted with a holosight."
	icon = 'icons/obj/guns/pointman.dmi'
	icon_state = "infantry"
	item_state = "caselessrifle"
	w_class = ITEM_SIZE_HUGE
	force = 12
	caliber = CALIBER_RIFLE_CASELESS
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 1, TECH_ESOTERIC = 5)
	slot_flags = SLOT_BACK
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/caseless_rifle
	allowed_magazines = /obj/item/ammo_magazine/caseless_rifle
	auto_eject = 1
	auto_eject_sound = 'sound/weapons/smg_empty_alarm.ogg'
	handle_casings = CLEAR_CASINGS // obviously
	one_hand_penalty = 10
	accuracy_power = 9
	accuracy = 1
	wielded_item_state = "caselessrifle-wielded"
	mag_insert_sound = 'sound/weapons/guns/interaction/ltrifle_magin.ogg'
	mag_remove_sound = 'sound/weapons/guns/interaction/ltrifle_magout.ogg'
	fire_sound = 'sound/weapons/gunshot/rifle/shot.ogg'
	far_fire_sound = 'sound/weapons/gunshot/rifle/shot_far.ogg'
	firemodes = list(
		list(mode_name="semi auto",       burst=1, fire_delay=null,    move_delay=null, one_hand_penalty=8, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=4,    one_hand_penalty=8, burst_accuracy=list(0,0),       dispersion=list(0.0, 0.3, 0.6)),
		list(mode_name="full auto",		can_autofire=1, burst=1, fire_delay=0.5, one_hand_penalty=12, burst_accuracy = list(0,0,-1,-1,-2,-3,-4,-4,-4), dispersion = list(0.0, 0.6, 1.0, 1.0, 1.2)),
		)

/obj/item/gun/projectile/automatic/caseless/on_update_icon()
	..()
	if(ammo_magazine)
		if(length(ammo_magazine.stored_ammo))
			icon_state = "infantry-loaded"
			wielded_item_state = "caselessrifle-wielded"
		else
			icon_state = "infantry-empty"
			wielded_item_state = "caselessrifle-wielded-empty"
	else
		icon_state = "infantry"

/obj/item/gun/projectile/automatic/caseless/carbine
	name = "caseless carbine rifle"
	desc = "An H3/K 'Ocelot' carbine. A mainstay of SCGDF, H3 and its configurations are made to shine in situations \
	where Z8 lacks versatility. Courtesy of Hephaestus Industries. This one's a compact version, mainly used by vehicle crews."
	icon_state = "carbine"
	w_class = ITEM_SIZE_LARGE
	force = 8
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 1, TECH_ESOTERIC = 4)
	one_hand_penalty = 12 // unwieldy
	accuracy_power = 8
	accuracy = 1
	firemodes = list(
		list(mode_name="semi auto",       burst=1, fire_delay=null,    move_delay=null, one_hand_penalty=10, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=6,    one_hand_penalty=10, burst_accuracy=list(0,0),       dispersion=list(0.0, 0.4, 0.8)),
		list(mode_name="full auto",		can_autofire=1, burst=1, fire_delay=0.5, one_hand_penalty=14, burst_accuracy = list(0,-1,-1,-2,-3,-4,-4,-5,-5), dispersion = list(0.0, 1.0, 1.0, 1.2, 1.5)),
		)

/obj/item/gun/projectile/automatic/caseless/carbine/on_update_icon()
	..()
	if(ammo_magazine)
		if(length(ammo_magazine.stored_ammo))
			icon_state = "carbine-loaded"
			wielded_item_state = "caselessrifle-wielded"
		else
			icon_state = "carbine-empty"
			wielded_item_state = "caselessrifle-wielded-empty"
	else
		icon_state = "carbine"

/obj/item/gun/projectile/automatic/caseless/grenadier
	name = "caseless grenadier rifle"
	desc = "An H3/GL 'Ocelot' battle rifle. A mainstay of SCGDF, H3 and its configurations are made to shine in situations \
	where Z8 lacks versatility. Courtesy of Hephaestus Industries. This one's equipped with an underbarrel grenade launcher and combat optics."
	icon_state = "grenadier"
	force = 14 // heavier than the standard version
	one_hand_penalty = 12
	bulk = GUN_BULK_HEAVY_RIFLE
	firemodes = list(
		list(mode_name="semi auto",       burst=1,    fire_delay=null,    move_delay=null, use_launcher=null, one_hand_penalty=10, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3,    fire_delay=null, move_delay=4,    use_launcher=null, one_hand_penalty=10, burst_accuracy=list(0,0,0), dispersion=list(0.0, 0.3, 0.7)),
		list(mode_name="full auto",		can_autofire=1, burst=1, fire_delay=0.5, use_launcher=null, one_hand_penalty=14, burst_accuracy = list(0,0,-1,-1,-2,-3,-4,-4,-4), dispersion = list(0.0, 0.6, 0.8, 1.0, 1.2)),
		list(mode_name="fire grenades",  burst=null, fire_delay=null, move_delay=null, use_launcher=1,    one_hand_penalty=10, burst_accuracy=null, dispersion=null)
		)

	var/use_launcher = 0

	var/has_launcher = TRUE
	var/obj/item/gun/launcher/grenade/underslung/launcher

/obj/item/gun/projectile/automatic/caseless/grenadier/Initialize()
	. = ..()
	if (has_launcher)
		launcher = new(src)


/obj/item/gun/projectile/automatic/caseless/grenadier/use_tool(obj/item/tool, mob/user, list/click_params)
	// Grenade - Load launcher
	if (istype(tool, /obj/item/grenade) && launcher)
		launcher.load(tool, user)
		return TRUE

	return ..()

/obj/item/gun/projectile/automatic/caseless/grenadier/toggle_safety(mob/user)
	..()
	if(launcher)
		launcher.safety_state = safety_state //Set the launcher's safety to be equivalent to the gun's.

/obj/item/gun/projectile/automatic/caseless/grenadier/attack_hand(mob/user)
	if(user.get_inactive_hand() == src && launcher && use_launcher)
		launcher.unload(user)
	else
		..()

/obj/item/gun/projectile/automatic/caseless/grenadier/Fire(atom/target, mob/living/user, params, pointblank=0, reflex=0)
	if(launcher && use_launcher)
		launcher.Fire(target, user, params, pointblank, reflex)
		if(!launcher.chambered)
			switch_firemodes() //switch back automatically
	else
		..()

/obj/item/gun/projectile/automatic/caseless/grenadier/on_update_icon()
	..()
	if(ammo_magazine)
		if(length(ammo_magazine.stored_ammo))
			icon_state = "grenadier-loaded"
			wielded_item_state = "caselessrifle-wielded"
		else
			icon_state = "grenadier-empty"
			wielded_item_state = "caselessrifle-wielded-empty"
	else
		icon_state = "grenadier"

/obj/item/gun/projectile/automatic/caseless/grenadier/examine(mob/user)
	. = ..()
	if(!launcher)
		return
	if(launcher.chambered)
		to_chat(user, "\The [launcher] has \a [launcher.chambered] loaded.")
	else
		to_chat(user, "\The [launcher] is empty.")

//copypasted L6
/obj/item/gun/projectile/automatic/l6_caseless
	name = "caseless machine gun"
	desc = "An Aussec Armories L6E Squad Automatic Weapon. A conversion of a much older LMG design, this one you don't have to reload as often."
	icon = 'icons/obj/guns/saw_c.dmi'
	icon_state = "l6closed80"
	item_state = "l6closedmag"
	wielded_item_state = "l6closed-wielded"
	w_class = ITEM_SIZE_HUGE
	bulk = 10
	force = 10
	slot_flags = 0
	max_shells = 80
	caliber = CALIBER_RIFLE_CASELESS
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 1, TECH_ESOTERIC = 2)
	slot_flags = 0 //need sprites for SLOT_BACK
	ammo_type = /obj/item/ammo_casing/rifle/caseless
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/caseless_box
	allowed_magazines = list(/obj/item/ammo_magazine/caseless_box, /obj/item/ammo_magazine/caseless_rifle)
	handle_casings = CLEAR_CASINGS
	one_hand_penalty = 10
	mag_insert_sound = 'sound/weapons/guns/interaction/lmg_magin.ogg'
	mag_remove_sound = 'sound/weapons/guns/interaction/lmg_magout.ogg'
	fire_sound = 'sound/weapons/gunshot/l6/shot.ogg'
	far_fire_sound = 'sound/weapons/gunshot/l6/shot_far.ogg'
	can_special_reload = FALSE

	//LMG, better sustained fire accuracy than assault rifles (comparable to SMG), higer move delay and one-handing penalty
	//No single-shot or 3-round-burst modes since using this weapon should come at a cost to flexibility.
	firemodes = list(
		list(mode_name="short bursts",	can_autofire=0, burst=5, fire_delay=5, move_delay=12, one_hand_penalty=8, burst_accuracy = list(0,-1,-1,-2,-2),          dispersion = list(0.6, 1.0, 1.0, 1.0, 1.2)),
		list(mode_name="long bursts",	can_autofire=0, burst=8, fire_delay=5, one_hand_penalty=12, burst_accuracy = list(0,-1,-1,-2,-2,-2,-3,-3), dispersion = list(1.0, 1.0, 1.0, 1.0, 1.2)),
		list(mode_name="full auto",		can_autofire=1, burst=1, fire_delay=1, one_hand_penalty=12, burst_accuracy = list(0,-1,-1,-2,-2,-3,-4,-4), dispersion = list(1.0, 1.0, 1.0, 1.0, 1.2)),
		)

	var/cover_open = 0

/obj/item/gun/projectile/automatic/l6_caseless/mag
	magazine_type = /obj/item/ammo_magazine/caseless_rifle

/obj/item/gun/projectile/automatic/l6_caseless/special_check(mob/user)
	if(cover_open)
		to_chat(user, SPAN_WARNING("[src]'s cover is open! Close it before firing!"))
		return 0
	return ..()

/obj/item/gun/projectile/automatic/l6_caseless/proc/toggle_cover(mob/user)
	cover_open = !cover_open
	to_chat(user, SPAN_NOTICE("You [cover_open ? "open" : "close"] [src]'s cover."))
	update_icon()
	user.update_inv_l_hand()
	user.update_inv_r_hand()

/obj/item/gun/projectile/automatic/l6_caseless/attack_self(mob/user as mob)
	if(cover_open)
		toggle_cover(user) //close the cover
		update_icon()
		user.update_inv_l_hand()
		user.update_inv_r_hand()

	else
		return ..() //once closed, behave like normal

/obj/item/gun/projectile/automatic/l6_caseless/attack_hand(mob/user as mob)
	if(!cover_open && user.get_inactive_hand() == src)
		toggle_cover(user) //open the cover
		update_icon()
		user.update_inv_l_hand()
		user.update_inv_r_hand()

	else
		return ..() //once open, behave like normal

/obj/item/gun/projectile/automatic/l6_caseless/on_update_icon()
	..()
	if(istype(ammo_magazine, /obj/item/ammo_magazine/caseless_box))
		icon_state = "l6[cover_open ? "open" : "closed"][round(length(ammo_magazine.stored_ammo), 20)]"
		item_state = "l6[cover_open ? "open" : "closed"]"
		wielded_item_state = "l6[cover_open ? "open" : "closed"]-wielded"
	else if(ammo_magazine)
		icon_state = "l6[cover_open ? "open" : "closed"]mag"
		item_state = "l6[cover_open ? "open" : "closed"]mag"
		wielded_item_state = "l6[cover_open ? "open" : "closed"]mag-wielded"
	else
		icon_state = "l6[cover_open ? "open" : "closed"]-empty"
		item_state = "l6[cover_open ? "open" : "closed"]-empty"
		wielded_item_state = "l6[cover_open ? "open" : "closed"]-empty-wielded"

/obj/item/gun/projectile/automatic/l6_caseless/load_ammo(obj/item/A, mob/user)
	if(!cover_open)
		to_chat(user, SPAN_WARNING("You need to open the cover to load that into [src]."))
		return
	..()

/obj/item/gun/projectile/automatic/l6_caseless/unload_ammo(mob/user, allow_dump=1)
	if(!cover_open)
		to_chat(user, SPAN_WARNING("You need to open the cover to unload [src]."))
		return
	..()

//indie variants
/obj/item/gun/projectile/automatic/molot
	name = "caseless bullpup rifle"
	desc = "A 'MOLOT'-pattern rifle. Produced by Novaya Zemlya Arms, it only recently became standard-issue for ICCGN forces. It easily \
	balances between accuracy and reliability at the cost of its large size."
	icon = 'icons/obj/guns/molot.dmi'
	icon_state = "infantry"
	item_state = "molot"
	w_class = ITEM_SIZE_HUGE
	force = 12
	caliber = CALIBER_RIFLE_CASELESS
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 1, TECH_ESOTERIC = 5)
	slot_flags = SLOT_BACK
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/caseless_rifle
	allowed_magazines = /obj/item/ammo_magazine/caseless_rifle
	auto_eject = 1
	auto_eject_sound = 'sound/weapons/smg_empty_alarm.ogg'
	handle_casings = CLEAR_CASINGS
	one_hand_penalty = 10
	accuracy_power = 8
	accuracy = 2
	bulk = GUN_BULK_HEAVY_RIFLE
	wielded_item_state = "molot-wielded"
	mag_insert_sound = 'sound/weapons/guns/interaction/ltrifle_magin.ogg'
	mag_remove_sound = 'sound/weapons/guns/interaction/ltrifle_magout.ogg'
	fire_sound = 'sound/weapons/gunshot/rifle/shot.ogg'
	far_fire_sound = 'sound/weapons/gunshot/rifle/shot_far.ogg'
	firemodes = list(
		list(mode_name="semi auto",       burst=1, fire_delay=null,    move_delay=null, one_hand_penalty=8, burst_accuracy=null, dispersion=null),
		list(mode_name="2-round bursts", burst=2, fire_delay=null, move_delay=4,    one_hand_penalty=8, burst_accuracy=list(0,0),       dispersion=list(0.0, 0.2)),
		list(mode_name="full auto",		can_autofire=1, burst=1, fire_delay=1.5, one_hand_penalty=12, burst_accuracy = list(0,0,-1,-1,-1,-2,-3,-4,-4), dispersion = list(0.0, 0.3, 0.6, 1.0, 1.2)),
		)

/obj/item/gun/projectile/automatic/molot/on_update_icon()
	..()
	if(ammo_magazine)
		icon_state = "infantry"
	else
		icon_state = "infantry-empty"

/obj/item/gun/projectile/automatic/molot/grenadier
	name = "caseless grenadier rifle"
	desc = "A 'MOLOT' GL rifle. Produced by Novaya Zemlya Arms, it only recently became standard-issue for ICCGN forces. It easily \
	balances between accuracy and reliability at the cost of its large size. This one comes with an underbarrel grenade launcher."
	icon_state = "grenadier"
	one_hand_penalty = 12
	firemodes = list(
		list(mode_name="semi auto",       burst=1,    fire_delay=null,    move_delay=null, use_launcher=null, one_hand_penalty=10, burst_accuracy=null, dispersion=null),
		list(mode_name="2-round bursts", burst=2,    fire_delay=null, move_delay=4,    use_launcher=null, one_hand_penalty=10, burst_accuracy=list(0,0), dispersion=list(0.0, 0.2)),
		list(mode_name="full auto",		can_autofire=1, burst=1, fire_delay=1.5, use_launcher=null, one_hand_penalty=14, burst_accuracy = list(0,0,-1,-1,-1,-2,-3,-4,-4), dispersion = list(0.0, 0.3, 0.6, 1.0, 1.2)),
		list(mode_name="fire grenades",  burst=null, fire_delay=null, move_delay=null, use_launcher=1,    one_hand_penalty=10, burst_accuracy=null, dispersion=null)
		)

	var/use_launcher = 0

	var/has_launcher = TRUE
	var/obj/item/gun/launcher/grenade/underslung/launcher

/obj/item/gun/projectile/automatic/molot/grenadier/Initialize()
	. = ..()
	if (has_launcher)
		launcher = new(src)


/obj/item/gun/projectile/automatic/molot/grenadier/use_tool(obj/item/tool, mob/user, list/click_params)
	// Grenade - Load launcher
	if (istype(tool, /obj/item/grenade) && launcher)
		launcher.load(tool, user)
		return TRUE

	return ..()

/obj/item/gun/projectile/automatic/molot/grenadier/toggle_safety(mob/user)
	..()
	if(launcher)
		launcher.safety_state = safety_state //Set the launcher's safety to be equivalent to the bullpup's.

/obj/item/gun/projectile/automatic/molot/grenadier/attack_hand(mob/user)
	if(user.get_inactive_hand() == src && launcher && use_launcher)
		launcher.unload(user)
	else
		..()

/obj/item/gun/projectile/automatic/molot/grenadier/Fire(atom/target, mob/living/user, params, pointblank=0, reflex=0)
	if(launcher && use_launcher)
		launcher.Fire(target, user, params, pointblank, reflex)
		if(!launcher.chambered)
			switch_firemodes() //switch back automatically
	else
		..()

/obj/item/gun/projectile/automatic/molot/grenadier/on_update_icon()
	..()
	if(ammo_magazine)
		icon_state = "grenadier"
	else
		icon_state = "grenadier-empty"

/obj/item/gun/projectile/automatic/molot/grenadier/examine(mob/user)
	. = ..()
	if(!launcher)
		return
	if(launcher.chambered)
		to_chat(user, "\The [launcher] has \a [launcher.chambered] loaded.")
	else
		to_chat(user, "\The [launcher] is empty.")

/obj/item/gun/projectile/automatic/molot/squadauto
	name = "caseless automatic rifle"
	desc = "A 'MOLOT' SAW modification. Produced by Novaya Zemlya Arms, it only recently became standard-issue for ICCGN forces. It easily \
	balances between accuracy and reliability at the cost of its large size. This one's reinforced, intended to take bigger magazines and \
	lay down heavy suppressive fire."
	icon_state = "squadauto"
	magazine_type = /obj/item/ammo_magazine/caseless_box
	allowed_magazines = list(/obj/item/ammo_magazine/caseless_box, /obj/item/ammo_magazine/caseless_rifle) //it can fit regular ones, but why would you do that?
	auto_eject = 0
	firemodes = list(
		list(mode_name="semi auto",       burst=1, fire_delay=null,    move_delay=null, one_hand_penalty=8, burst_accuracy=null, dispersion=null),
		list(mode_name="2-round bursts", burst=2, fire_delay=null, move_delay=4,    one_hand_penalty=8, burst_accuracy=list(0,0), dispersion=list(0.0, 0.2)),
		list(mode_name="full auto",		can_autofire=1, burst=1, fire_delay=1, one_hand_penalty=12, burst_accuracy = list(0,-1,-1,-2,-2,-3,-4,-5,-5), dispersion = list(0.0, 0.6, 1.0, 1.2, 1.4)),
		)

/obj/item/gun/projectile/automatic/molot/squadauto/on_update_icon()
	..()
	if(istype(ammo_magazine, /obj/item/ammo_magazine/caseless_box))
		icon_state = "squadauto[round(length(ammo_magazine.stored_ammo), 20)]"
	else if(ammo_magazine)
		icon_state = "squadauto-mag"
	else
		icon_state = "squadauto-empty"

// TODO: XEROX MAKE THIS USE THE BAYSTATION BASE FOLDING-STOCK CODE!
/obj/item/gun/projectile/automatic/contempt
	name = "compact SMG"
	desc = "An Aussec Armoury 'Contempt' SMG. Designed with versatility in mind, this gun can easily switch between superior mobility and \
	precision by simply extending the stock. Not cheap, but it wins the competition against commonly used rifles in close quarters."
	icon = 'icons/obj/guns/contempt.dmi'
	icon_state = "contempt"
	magazine_type = /obj/item/ammo_magazine/piercing_smg
	allowed_magazines = /obj/item/ammo_magazine/piercing_smg
	bulk = -1
	caliber = CALIBER_PISTOL_FLECHETTE
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 3)
	slot_flags = SLOT_BELT
	accuracy_power = 7
	multi_aim = 1
	burst_delay = 2
	one_hand_penalty = 4
//	var/unfolded = FALSE
	firemodes = list(
		list(mode_name="semi auto",       burst=1, fire_delay=null,    move_delay=null, one_hand_penalty=4, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=4,    one_hand_penalty=5, burst_accuracy=list(0,-1,-1),       dispersion=list(0.0, 0.6, 1.0)),
		list(mode_name="full auto",   can_autofire=1, burst=1, fire_delay=0.5,    one_hand_penalty=6, burst_accuracy=list(0,-1,-1,-1,-2), dispersion=list(0.6, 0.6, 1.0, 1.0, 1.2)),
		)
/*
/obj/item/gun/projectile/automatic/contempt/on_update_icon()
	..()
	if(ammo_magazine)
		icon_state = "contempt-[unfolded]"
	else
		icon_state = "contempt-[unfolded]-empty"

/obj/item/gun/projectile/automatic/contempt/Initialize()
	..()
	verbs += /obj/item/gun/projectile/automatic/contempt/proc/stock

/obj/item/gun/projectile/automatic/contempt/proc/stock()
	set category = "Object"
	set name = "Toggle Weapon Stock"
	set popup_menu = 1

	toggle_stock(usr)

/obj/item/gun/projectile/automatic/contempt/proc/toggle_stock(mob/user) //TODO: figure out how to change accuracy in firemodes without breaking them
	unfolded = !unfolded
	if(unfolded)
		w_class = ITEM_SIZE_HUGE
		bulk = GUN_BULK_RIFLE
		accuracy = 1
		accuracy_power = 9
		multi_aim = 1
		one_hand_penalty = 10
		user.visible_message(SPAN_NOTICE("[user] extends \the [src]'s stock."), SPAN_NOTICE("You extend \the [src]'s stock outwards and lock it in place."), range = 3)
	else
		w_class = ITEM_SIZE_NORMAL
		bulk = -1
		accuracy = 0
		accuracy_power = 7
		multi_aim = 1
		one_hand_penalty = 4
		user.visible_message(SPAN_NOTICE("[user] retracts \the [src]'s stock."), SPAN_NOTICE("You unlock \the [src]'s stock and retract it back into the gun."), range = 3)
	update_icon()
	playsound(get_turf(src), 'sound/weapons/flipblade.ogg', 25, 1)
*/
/*
/obj/item/gun/projectile/sniper/panther //semi-automatic only
	name = "marksman rifle"
	desc = "An SD-Panther. It is a simple and durable rifle made of stamped steel manufactured by Novaya Zemlya Arms for the Confederation Navy. \
	While it lacks the burst fire of other military rifles, it's exceptionally accurate and has a powerful optic."
	icon = 'icons/obj/guns/terran_rifle.dmi'
	icon_state = "dmr"
	item_state = "dmr"
	fire_delay = 8
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 4, TECH_ESOTERIC = 5)
	w_class = ITEM_SIZE_HUGE
	force = 10
	caliber = CALIBER_RIFLE
	slot_flags = SLOT_BACK
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/rifle
	allowed_magazines = /obj/item/ammo_magazine/rifle
	one_hand_penalty = 8
	scoped_accuracy = 8
	scope_zoom = 1
	accuracy_power = 8
	accuracy = 4
	bulk = GUN_BULK_RIFLE
	wielded_item_state = "dmr-wielded"
	mag_insert_sound = 'sound/weapons/guns/interaction/ltrifle_magin.ogg'
	mag_remove_sound = 'sound/weapons/guns/interaction/ltrifle_magout.ogg'
	fire_sound = 'sound/weapons/gunshot/rifle/shot_heavy.ogg'
	far_fire_sound = 'sound/weapons/gunshot/rifle/shot_heavy_far.ogg'

/obj/item/gun/projectile/sniper/panther/on_update_icon()
	if(ammo_magazine)
		icon_state = "dmr"
	else
		icon_state = "dmr-empty"
	..()
*/
/obj/item/gun/projectile/sniper/caseless
	name = "caseless marksman rifle"
	desc = "An H3/M 'Ocelot' marksman rifle. A mainstay of SCGDF, H3 and its configurations are made to shine in situations \
	where Z8 lacks versatility. Courtesy of Hephaestus Industries. This one comes with a better stock and optics, but only has a semi-auto firemode."
	icon = 'icons/obj/guns/pointman.dmi'
	icon_state = "marksman"
	item_state = "caselessrifle"
	w_class = ITEM_SIZE_HUGE
	force = 12
	caliber = CALIBER_RIFLE_CASELESS
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 1, TECH_ESOTERIC = 5)
	slot_flags = SLOT_BACK
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/caseless_rifle
	allowed_magazines = /obj/item/ammo_magazine/caseless_rifle
	auto_eject = 1
	auto_eject_sound = 'sound/weapons/smg_empty_alarm.ogg'
	handle_casings = CLEAR_CASINGS // obviously
	one_hand_penalty = 8
	scoped_accuracy = 8
	scope_zoom = 1
	accuracy_power = 8
	accuracy = 4
	bulk = GUN_BULK_RIFLE
	wielded_item_state = "caselessrifle-wielded"
	mag_insert_sound = 'sound/weapons/guns/interaction/ltrifle_magin.ogg'
	mag_remove_sound = 'sound/weapons/guns/interaction/ltrifle_magout.ogg'
	fire_sound = 'sound/weapons/gunshot/rifle/shot_heavy.ogg'
	far_fire_sound = 'sound/weapons/gunshot/rifle/shot_heavy_far.ogg'

/obj/item/gun/projectile/sniper/caseless/on_update_icon()
	..()
	if(ammo_magazine)
		if(length(ammo_magazine.stored_ammo))
			icon_state = "marksman-loaded"
			wielded_item_state = "caselessrifle-wielded"
		else
			icon_state = "marksman-empty"
			wielded_item_state = "caselessrifle-wielded-empty"
	else
		icon_state = "marksman"

/obj/item/gun/projectile/boltloader/boltaction/scope //Scoped variant GAIA
	name = "scoped bolt action rifle"
	desc = "An old bolt action rifle from some forgotten war, still commonplace among farmers and colonists as an anti-varmint rifle. This one has an optical scope."
	icon_state = "boltaction_scoped"
	item_state = "boltaction_scoped"
	scope_zoom = 2
	scoped_accuracy = 3
	wielded_item_state = "boltaction_scoped-wielded"
