// Single-shot multi-use rocket launcher with backblast
/obj/item/gun/projectile/rocket_launcher
	name = "SMRL-1 rocket launcher"
	desc = "A single-shot multi-use rocket launcher manufactured by Hephaestus Industries."
	icon = 'icons/obj/guns/launchers.dmi'
	icon_state = "rocket" // TODO: Change the sprite XeroX!
	item_state = "rocket"
	origin_tech = list(TECH_COMBAT = 8, TECH_MATERIAL = 5)
	w_class = ITEM_SIZE_HUGE
	force = 10
	slot_flags = SLOT_BACK
	matter = list(MATERIAL_STEEL = 2000)
	screen_shake = 1
	space_recoil = 0 // Learn physics son
	accuracy = -2
	bulk = GUN_BULK_ANTI_TANK
	one_hand_penalty = 6
	starts_loaded = FALSE

	// single heavy rocket
	caliber = CALIBER_ROCKET
	handle_casings = CLEAR_CASINGS
	load_method = SINGLE_CASING
	max_shells = 1
	ammo_type = /obj/item/ammo_casing/rocket
	fire_sound = 'sound/weapons/gunshot/general/rocket_launch.ogg'
	far_fire_sound = 'sound/weapons/gunshot/general/rocket_launch_far.ogg'
	load_sound = 'sound/weapons/guns/interaction/rpg_insert.ogg'
	fire_delay = 12

	var/backblast_power = 300
	var/backblast_falloff = 50

/obj/item/gun/projectile/rocket_launcher/examine(mob/user)
	. = ..()
	if(backblast_power > 0)
		to_chat(user, SPAN_WARNING("\The [src] creates a lethal backblast when fired."))

// Apply backblast behind the shooter
/obj/item/gun/projectile/rocket_launcher/handle_post_fire(mob/user, atom/target, pointblank = 0, reflex = 0, obj/projectile)
	. = ..()
	// backblast affects the turf immediately behind the shooter
	var/turf/T = get_ranged_target_turf(get_turf(user), turn(user.dir, 180), 1)
	var/direction = get_dir(user, T)
	if(!T)
		return
	if(isturf(T))
		if(T.density)
			user.visible_message(SPAN_DANGER("\The [src]'s backblast bounces off \the [T]!"), SPAN_DANGER("\The [src]'s backblast bounces off \the [T] onto you!"))
			T = get_turf(user) // fuck you
			direction = null // and fuck anyone around you
		cell_explosion(T, backblast_power, backblast_falloff, direction = direction, shrapnel = FALSE)

/obj/item/gun/projectile/rocket_launcher/gcc
	name = "RPG-2 rocket launcher"
	desc = "A single-shot multi-use rocket launcher manufactured by Novaya Zemlya Arms."
	icon_state = "rocket_gcc"
	item_state = "rocket_gcc"

// Single-shot single-use rocket launcher
/obj/item/gun/projectile/rocket_launcher/single
	name = "SU-4 (Frag) rocket launcher"
	desc = "A single-shot single-use rocket launcher manufactured by Hephaestus Industries. Can be collapsed to fit into a backpack."
	icon_state = "rocket_tube-off"
	item_state = "rocket_tube-off"
	w_class = ITEM_SIZE_LARGE
	matter = list(MATERIAL_STEEL = 1000, MATERIAL_ALUMINIUM = 1000)
	starts_loaded = TRUE

	handle_casings = HOLD_CASINGS
	/// Was it used already?
	var/used = FALSE
	/// Is it unfolded or not?
	var/activated = FALSE

/obj/item/gun/projectile/rocket_launcher/single/proc/unfold(mob/user)
	to_chat(user, SPAN_NOTICE("You unfold \the [src]. Ready to fire."))
	playsound(src, 'sound/weapons/rpg_unfold.ogg', 40, TRUE)
	icon_state = "rocket_tube-on"
	item_state = "rocket_tube-on"
	w_class = ITEM_SIZE_HUGE
	activated = TRUE
	update_icon()

/obj/item/gun/projectile/rocket_launcher/single/proc/fold(mob/user)
	to_chat(user, SPAN_NOTICE("You fold \the [src]."))
	playsound(src, 'sound/weapons/rpg_fold.ogg', 40, TRUE)
	icon_state = "rocket_tube-off"
	item_state = "rocket_tube-off"
	w_class = ITEM_SIZE_LARGE
	activated = FALSE
	update_icon()

/obj/item/gun/projectile/rocket_launcher/single/attack_self(mob/user)
	if(used)
		to_chat(user, SPAN_WARNING("\The [src] have been used up!"))
		return
	if(activated)
		fold(user)
	else
		unfold(user)

/obj/item/gun/projectile/rocket_launcher/single/afterattack(atom/A, mob/living/user)
	if(!activated)
		to_chat(user, SPAN_WARNING("\The [src] must be unfolded first!"))
		return
	. = ..()

/obj/item/gun/projectile/rocket_launcher/single/handle_post_fire(mob/user, atom/target, pointblank = 0, reflex = 0, obj/projectile)
	used = TRUE
	icon_state = "rocket_tube-used"
	item_state = "rocket_tube-used"
	update_icon()
	. = ..()

/obj/item/gun/projectile/rocket_launcher/single/unload_ammo(mob/user, allow_dump=1)
	to_chat(user, SPAN_WARNING("\The [src] is single-use!"))
	return

/obj/item/gun/projectile/rocket_launcher/single/load_ammo(obj/item/A, mob/user)
	to_chat(user, SPAN_WARNING("\The [src] is single-use!"))
	return

/obj/item/gun/projectile/rocket_launcher/single/he
	name = "SU-4 (HE) rocket launcher"
	ammo_type = /obj/item/ammo_casing/rocket/he

/obj/item/gun/projectile/rocket_launcher/single/thermobaric
	name = "SU-4 (Thermobaric) rocket launcher"
	ammo_type = /obj/item/ammo_casing/rocket/thermobaric

/obj/item/gun/projectile/rocket_launcher/single/aphe
	name = "SU-4 (APHE) rocket launcher"
	ammo_type = /obj/item/ammo_casing/rocket/aphe

/obj/item/gun/projectile/rocket_launcher/single/tandem
	name = "SU-4 (APHE tandem) rocket launcher"
	ammo_type = /obj/item/ammo_casing/rocket/tandem
