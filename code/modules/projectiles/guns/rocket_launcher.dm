// Single-shot rocket launcher with backblast
/obj/item/gun/projectile/rocket_launcher
	name = "HI-SRL-1 Rocket Launcher"
	desc = "A single-shot rocket launcher manufactured by Hephaestus Industries. Creates a dangerous backblast when fired. Marked with the distinctive forge emblem of its maker."
	icon = 'icons/obj/guns/launchers.dmi'
	icon_state = "rocket"
	item_state = "rocket"
	origin_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 2)
	w_class = ITEM_SIZE_HUGE
	slot_flags = SLOT_BACK
	matter = list(MATERIAL_STEEL = 2000)
	screen_shake = 1
	space_recoil = 0 //Learn physics son
	accuracy = 2
	accuracy_power = 10

	// single heavy rocket
	caliber = "rocket"
	handle_casings = EJECT_CASINGS
	load_method = SINGLE_CASING
	max_shells = 1
	ammo_type = /obj/item/ammo_casing/rocket
	fire_sound = 'sound/weapons/gunshot/general/rocket_launch.ogg'
	far_fire_sound = 'sound/weapons/gunshot/general/rocket_launch_far.ogg'
	load_sound = 'sound/weapons/guns/interaction/shotgun_instert.ogg'

// After firing, perform normal behaviour then apply backblast behind the shooter
/obj/item/gun/projectile/rocket_launcher/afterattack(atom/A, mob/living/user)
	// Only create backblast if the launcher actually fired (not a dry-click)
	var/before_ammo = 0
	if(istype(src, /obj/item/gun/projectile))
		before_ammo = src.getAmmo()

	..()

	var/after_ammo = 0
	if(istype(src, /obj/item/gun/projectile))
		after_ammo = src.getAmmo()

	// If ammo didn't decrease, no shot was fired (dry click/failed), so skip backblast
	if(after_ammo >= before_ammo)
		return

	// backblast affects the turf immediately behind the shooter
	var/turf/T = get_ranged_target_turf(get_turf(user), turn(user.dir, 180), 1)
	if(!T)
		return
	// sound and minor visual/audio feedback
	if(isturf(T))
		playsound(T, 'sound/effects/Explosion1.ogg', 30, 1)
		var/datum/effect/smoke_spread/smoke = new
		smoke.set_up(3,3, T, 0)
		smoke.start()
	// damage any living mob on that turf (excluding the shooter)
	for(var/mob/living/thing in T.contents)
		if(thing != user && isghost(thing) == FALSE)
			// apply a strong burst of damage from the backblast
			visible_message(SPAN_DANGER("The backblast from [user.name] hits [thing.name] with a powerful force!"), SPAN_DANGER("You hear as if someone got hit by a backblast!"))
			thing.show_message(SPAN_DANGER("The backblast from [user.name] hits you with a powerful force, burning and deafening you!"))
			thing.apply_damage(35, DAMAGE_BURN, used_weapon = "Backblast")
			thing.Weaken(15)
			thing.ear_deaf = max(thing.ear_deaf,15)
