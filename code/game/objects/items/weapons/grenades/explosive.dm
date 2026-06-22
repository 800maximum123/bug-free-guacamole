/obj/item/projectile/bullet/pellet/fragment
	damage = 30
	range_step = 2 //controls damage falloff with distance. projectiles lose a "pellet" each time they travel this distance. Can be a non-integer.

	base_spread = 0 //causes it to be treated as a shrapnel explosion instead of cone
	spread_step = 40

	silenced = TRUE
	fire_sound = null
	no_attack_log = TRUE
	muzzle_type = null
	embed = TRUE

/obj/item/projectile/bullet/pellet/fragment/strong
	damage = 60

/obj/item/grenade/frag
	name = "fragmentation grenade"
	desc = "A military fragmentation grenade, designed to explode in a deadly shower of fragments, while avoiding massive structural damage."
	icon_state = "frggrenade"

	var/list/fragment_types = list(/obj/item/projectile/bullet/pellet/fragment = 1)
	var/explosion_size = 200   //size of the center explosion. CHANGED IN GAIA
	var/explosion_falloff = 50 //how much the explosion falloffs
	var/num_fragments = 50     //total number of fragments produced by the grenade

	//The radius of the circle used to launch projectiles. Lower values mean less projectiles are used but if set too low gaps may appear in the spread pattern
	var/spread_range = 7 //leave as is, for some reason setting this higher makes the spread pattern have gaps close to the epicenter

/obj/item/grenade/frag/detonate(mob/living/user)
	..()

	var/turf/O = get_turf(src)
	if(!O) return

	src.fragmentate(O, num_fragments, spread_range, fragment_types) // Fragmentation first to prevent fragments being "eaten"

	if(explosion_size)
		on_explosion(O)

	qdel(src)


/obj/proc/fragmentate(turf/T, fragment_number = 30, spreading_range = 5, list/fragtypes=list(/obj/item/projectile/bullet/pellet/fragment), shoot_from, direction)
	set waitfor = 0
	var/list/target_turfs = getcircle(T, spreading_range)

	// filter target turfs if a direction was given
	if(direction)
		var/list/filtered = list()
		for(var/turf/O in target_turfs)
			// find the dir from origin turf to this turf
			var/dir_to = get_dir(T, O)
			// only allow turfs that match the given direction (including diagonals)
			if(dir_to & direction)
				filtered += O
		target_turfs = filtered

	if(!length(target_turfs))
		return

	var/fragments_per_projectile = round(fragment_number / length(target_turfs))

	for(var/turf/O in target_turfs)
		sleep(0)
		var/fragment_type = pickweight(fragtypes)
		var/obj/item/projectile/bullet/pellet/fragment/P = new fragment_type(T)
		P.pellets = fragments_per_projectile
		P.shot_from = shoot_from
		P.hitchance_mod = 50
		P.launch(O)

		// Handle damaging whatever the grenade's inside. Currently only checks for mobs.
		if (loc != get_turf(src))
			var/recursion_limit = 3 // Prevent infinite loops
			var/atom/current_check = src
			while (recursion_limit)
				current_check = current_check.loc
				if (isturf(current_check))
					break
				if (ismob(current_check))
					P.attack_mob(current_check, 0, 25)
				recursion_limit--

		//Make sure to hit any mobs in the source turf
		for(var/mob/living/M in T)
			//lying on a frag grenade while the grenade is on the ground causes you to absorb most of the shrapnel.
			//you will most likely be dead, but others nearby will be spared the fragments that hit you instead.
			if(M.lying && isturf(src.loc))
				P.attack_mob(M, 0, 5)
			else
				P.attack_mob(M, 0, 50)

/obj/item/grenade/frag/proc/on_explosion(turf/O)
	if(explosion_size)
		cell_explosion(epicenter = loc, power = explosion_size, falloff = explosion_falloff, shrapnel = FALSE) // Gaia

/obj/item/grenade/frag/shell
	name = "fragmentation grenade"
	desc = "A light fragmentation grenade, designed to be fired from a launcher. It can still be activated and thrown by hand if necessary."
	icon_state = "fragshell"

	num_fragments = 40 //less powerful than a regular frag grenade

/obj/item/grenade/frag/high_yield
	name = "fragmentation bomb"
	desc = "Larger and heavier than a standard fragmentation grenade, this device is extremely dangerous. It cannot be thrown as far because of its weight."
	icon_state = "frag"

	w_class = ITEM_SIZE_NORMAL
	throw_speed = 3
	throw_range = 5 //heavy, can't be thrown as far

	fragment_types = list(/obj/item/projectile/bullet/pellet/fragment=1,/obj/item/projectile/bullet/pellet/fragment/strong=4)
	num_fragments = 72  //total number of fragments produced by the grenade
	explosion_size = 300
	explosion_falloff = 100

/obj/item/grenade/frag/makeshift
	name = "improvised explosive device"
	desc = "An aluminum can with a wire fuse leading inside of it. Partially guaranteed to blow your mind AND hands!"
	icon_state = "ghetto"
	arm_sound = 'sound/effects/flare.ogg'

	num_fragments = 15  // Its a /can/ , not nearly as strong as an industrially produced grenade.
	explosion_size = 150 // Gaia

	det_time = 5

	var/shrapnel_reinforced = 0 //But, with some patience, you can make it worth your time.

	var/possible_reinforcements = list(
		/obj/item/ammo_casing,
		/obj/item/material/coin,
		/obj/item/material/shard,
		/obj/item/reagent_containers/syringe,
		/obj/item/pen,
		/obj/item/material/knife/table,
		/obj/item/material/kitchen/utensil
		)

/obj/item/grenade/frag/makeshift/Initialize()
	det_time = rand(5,100) // Fuse is randomized.
	. = ..()

/obj/item/grenade/frag/makeshift/use_tool(obj/item/W, mob/living/user, list/click_params)
	if(isScrewdriver(W)) //overrides the act to screwdrive a grenade to set its fuse.
		to_chat(user, SPAN_WARNING("You can't adjust the timer on \the [src]!"))
		return TRUE

	if (is_type_in_list(W, possible_reinforcements))
		if(shrapnel_reinforced<10) //you can only add 10 items inside the can
			user.visible_message(
				SPAN_WARNING("\The [user] pries \the [src] open and drops \a [W] inside."),
				SPAN_DANGER("You open \the [src], carefully adding \a [W] before sealing the lid again."),
				SPAN_WARNING("You hear a metallic crack, followed by clinking.")
			)
			num_fragments += rand(3,7) // add 3 to 7 pellets. If you're /REALLY/ lucky, you'll end up with something similar to a standard grenade
			shrapnel_reinforced += 1
			qdel(W)
		else
			to_chat(user, SPAN_WARNING("You can't add any more items to \the [src]!"))
		return TRUE

	return ..()

// GAIA dud RPGs missiles/rockets
/obj/item/grenade/frag/dud_missile
	name = "dud frag rocket"
	desc = "The fact that it didn't explode inside the guy - doesn't mean it won't explode in your hands."
	icon_state = "rocketshell_dud"
	w_class = ITEM_SIZE_NORMAL

	det_time = 3 SECONDS
	num_fragments = 60

	var/blowup_chance = 30
	var/disarm_time = 4 SECONDS
	var/dangerous = TRUE

/obj/item/grenade/frag/dud_missile/LateExamine(mob/user, distance, is_adjacent)
	. = ..()
	if(is_adjacent)
		if(dangerous)
			to_chat(user, SPAN_WARNING("It looks extremely unstable."))
		else
			to_chat(user, SPAN_NOTICE("It have been disarmed."))

/obj/item/grenade/frag/dud_missile/attack_self(mob/living/user)
	if(!dangerous)
		return
	to_chat(user, SPAN_WARNING("Uh-oh..."))
	return ..()

/obj/item/grenade/frag/dud_missile/use_tool(obj/item/W, mob/living/user, list/click_params)
	if(isWirecutter(W))
		if(!dangerous)
			to_chat(user, SPAN_NOTICE("Its already disarmed..."))
			return FALSE
		var/eod_skill = user.get_skill_value(SKILL_DEVICES)
		var/real_disarm_time = disarm_time - eod_skill * 2
		to_chat(user, SPAN_WARNING("You begin disarming the [src]..."))
		if(!do_after(user, real_disarm_time, src))
			if(prob(blowup_chance))
				to_chat(user, SPAN_DANGER("You've been interrupted and [src] goes crazy!"))
				activate(user)
				return TRUE
			else
				to_chat(user, SPAN_WARNING("You've been interrupted, but hopefully [src] is silent."))
				return FALSE

		to_chat(user, SPAN_NOTICE("You succesfully disarmed [src]."))
		visible_message(SPAN_NOTICE("[user] succesfully disarms [src]."), SPAN_NOTICE("You hear a relieving snap of wire."))
		dangerous = FALSE
	return ..()

/obj/item/grenade/frag/dud_missile/dropped(mob/user)
	. = ..()
	playsound(src, 'sound/items/pipe_hit.ogg', 60, TRUE)
	if(!dangerous)
		return

	if(prob(blowup_chance))
		to_chat(user, SPAN_WARNING("Uh-oh..."))
		activate(user)

/obj/item/grenade/frag/dud_missile/thermobaric
	name = "dud thermobaric rocket"
	icon_state = "rocket_dud"

	num_fragments = 0
	explosion_size = 200

/obj/item/grenade/frag/dud_missile/he
	name = "dud HE rocket"
	icon_state = "rocket_he_dud"

	num_fragments = 0
	explosion_size = 300

/obj/item/grenade/frag/dud_missile/aphe
	name = "dud APHE rocket"
	icon_state = "rocket_aphe_dud"

	num_fragments = 50
	explosion_size = 150

/obj/item/grenade/frag/dud_missile/tandem
	name = "dud tandem APHE rocket"
	icon_state = "rocket_tandem_dud"

	num_fragments = 50
	explosion_size = 200
