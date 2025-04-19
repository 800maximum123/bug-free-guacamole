#define SOUNDS_CRYSTAL_METAL    list('mods/_fd/old_space_cannons/sounds/glassbreak1.ogg','mods/_fd/old_space_cannons/sounds/glassbreak2.ogg','mods/_fd/old_space_cannons/sounds/glassbreak3.ogg')
#define CALIBER_SHIP_CRYSTAL    "Crystal"

/obj/item/ammo_magazine/ammobox/crystal/ex_act()
	return

/obj/item/ammo_magazine/ammobox/crystal/New()
	..()
	ammo_count = max_ammo

/obj/item/ammo_magazine/ammobox/crystal/Initialize()
	..()
	START_PROCESSING(SSobj, src)

/obj/item/ammo_magazine/ammobox/crystal/Destroy()
	..()
	STOP_PROCESSING(SSobj, src)

/obj/item/ammo_magazine/ammobox/crystal/Process()
	if(regenerate_ammo && max_ammo < ammo_count)
		regen++
		if(regen >= regenerate_delay)
			regen = 0
			ammo_count++
	..()

///////////////////////////AMMOBOX///////////////////////////

/obj/item/ammo_magazine/ammobox/crystal
	name = "Mobile crystal growth chamber"
	desc = "A box where the crystals growth. (PLACEHOLDER)"

	caliber = CALIBER_SHIP_CRYSTAL
	max_ammo = 90
	ammo_type = /obj/item/ammo_casing/huge_caliber/crystal

	should_explode = FALSE

	var/ammo_count = 0

	var/regenerate_ammo = TRUE
	var/regenerate_delay = 10
	var/regen = 0

/obj/item/ammo_magazine/ammobox/crystal/high_explosive
	name = "Mobile B-type crystal growth chamber"
	icon_state = "ammocrate_autocannon"
	max_ammo = 40
	ammo_type = /obj/item/ammo_casing/huge_caliber/crystal/high_explosive

/obj/item/ammo_magazine/ammobox/crystal/shrapnel
	name = "Mobile X-type crystal growth chamber"
	icon_state = "ammocrate_autocannon"
	max_ammo = 40
	ammo_type = /obj/item/ammo_casing/huge_caliber/crystal/shrapnel

///////////////////////////CASING///////////////////////////

/obj/item/ammo_casing/huge_caliber/crystal
	name = "crystal shard"
	desc = "A strange, regenerative crystal."
	caliber = CALIBER_SHIP_CRYSTAL
	projectile_type = /obj/item/projectile/bullet/huge_caliber/crystal

/obj/item/ammo_casing/huge_caliber/crystal/high_explosive
	projectile_type = /obj/item/projectile/bullet/huge_caliber/crystal/high_explosive

/obj/item/ammo_casing/huge_caliber/crystal/shrapnel
	projectile_type = /obj/item/projectile/bullet/huge_caliber/crystal/shrapnel

///////////////////////////BULLETS///////////////////////////

// Большие осколки с маленьким ХП. Я не хочу копипиздить код пенетрации на пеллеты, так что пусть будет так
/obj/item/projectile/bullet/huge_caliber/crystal/fragment
	name ="crystal shard"
	icon_state= "dark_pellet"
	damage = 50
	pew_spread = 10

	armor_penetration = 100
	penetrating = 8
	penetration_modifier = 1.1

	muzzle_type = null
	fire_sound = null

	should_fragmentate = FALSE
	var/destroy_self = TRUE

// В итоге пришлось копипиздить код самих пеллетов. СУКА
	var/pellets = 4
	var/range_step = 2
	var/base_spread = 90
	var/spread_step = 10
	is_pellet = TRUE

/obj/item/projectile/bullet/huge_caliber/crystal/fragment/Bump(atom/A as mob|obj|turf|area, forced=0)
	if(!exploded && destroy_self)
		exploded = TRUE
		playsound(get_turf(src),pick(SOUNDS_CRYSTAL_METAL))

	..()

/obj/item/projectile/bullet/huge_caliber/crystal/fragment/Bumped()
	. = ..()
	bumped = 0

/obj/item/projectile/bullet/huge_caliber/crystal/fragment/proc/get_pellets(distance)
	var/pellet_loss = round(max(distance - 1, 0)/range_step)
	return max(pellets - pellet_loss, 1)

/obj/item/projectile/bullet/huge_caliber/crystal/fragment/attack_mob(mob/living/target_mob, distance, miss_modifier)
	if (pellets < 0) return 1

	var/total_pellets = get_pellets(distance)
	var/spread = max(base_spread - (spread_step*distance), 0)

	var/prone_chance = 0
	if(!base_spread)
		prone_chance = max(spread_step*(distance - 2), 0)

	var/hits = 0
	for (var/i in 1 to total_pellets)
		if(target_mob.lying && target_mob != original && prob(prone_chance))
			continue

		var/old_zone = def_zone
		def_zone = ran_zone(def_zone, spread)
		if (..())
			hits++
		def_zone = old_zone

	pellets -= hits
	if (hits >= total_pellets || pellets <= 0)
		return 1
	return 0

/obj/item/projectile/bullet/huge_caliber/crystal/fragment/get_structure_damage()
	var/distance = get_dist(loc, starting)
	return ..() * get_pellets(distance)

/obj/item/projectile/bullet/huge_caliber/crystal/fragment/Move()
	. = ..()

	if(. && !base_spread && isturf(loc))
		for(var/mob/living/M in loc)
			if(M.lying || !M.CanPass(src, loc, 0.5, 0))
				if(Bump(M))
					return

/obj/item/projectile/bullet/huge_caliber/crystal
	name ="crystal shard"
	icon_state= "dark_pellet"
	damage = CANNON_DMGS_VERYHIGH
	pew_spread = 10
	armor_penetration = 100
	penetration_modifier = 1.1
	penetrating = 20
	muzzle_type = null
	fire_sound = null

	var/should_fragmentate = TRUE
	should_explode = FALSE

/obj/item/projectile/bullet/huge_caliber/crystal/Bump(atom/A as mob|obj|turf|area, forced=0)

	if(!exploded && should_fragmentate)
		exploded = TRUE
		fragmentate(get_turf(src), rand(2,3), 2, list(/obj/item/projectile/bullet/huge_caliber/crystal/fragment), name)
		playsound(get_turf(src),pick(SOUNDS_CRYSTAL_METAL),150)

	..()

/obj/item/projectile/bullet/huge_caliber/crystal/Destroy()
	if(src)
		if(src.z != GLOB.using_map.overmap_z)
			playsound(get_turf(src),pick(SOUNDS_CRYSTAL_METAL))
	..()

/obj/item/projectile/bullet/huge_caliber/crystal/high_explosive
	should_explode = TRUE
	explosion_radius = EXPLOSION_FALLOFF_VERYHIGH
	explosion_max_power = EXPLOSION_POWER_HIGH

/obj/item/projectile/bullet/huge_caliber/crystal/high_explosive/Bump(atom/A as mob|obj|turf|area, forced=0)
	var/backwards = turn(dir, 180)
	if(!exploded)
		exploded = TRUE
		playsound(get_turf(src),pick(SOUNDS_CRYSTAL_METAL),150)
		cell_explosion(get_step(get_turf(A), backwards), explosion_max_power, explosion_radius, direction = dir, shrapnel = FALSE)
		qdel(src)

/obj/item/projectile/bullet/huge_caliber/crystal/shrapnel
	should_fragmentate = FALSE
	armor_penetration = 80
	penetrating = 20
	proximity_detonation = FALSE

	var/exploded_inwall = FALSE
	var/delay = 4

/obj/item/projectile/bullet/huge_caliber/crystal/shrapnel/Bump(atom/A as mob|obj|turf|area, forced=0)
	if(exploded)
		return

	exploded = TRUE
	if(istype(A,/obj/shield))
		playsound(get_turf(src),pick(SOUNDS_CRYSTAL_METAL),150)
		fragmentate(get_turf(src), rand(10,20), 5, list(/obj/item/projectile/bullet/pellet/fragment/crystal), name)
		qdel(src)
		return

	sleep(delay)

	if(src && !exploded_inwall)
		playsound(get_turf(src),pick(SOUNDS_CRYSTAL_METAL),150)
		fragmentate(get_turf(src), rand(10,20), 5, list(/obj/item/projectile/bullet/pellet/fragment/crystal), name)
		qdel(src)

	..()

/obj/item/projectile/bullet/huge_caliber/crystal/shrapnel/Destroy()
	if(src)
		if(src.z != GLOB.using_map.overmap_z)
			if(!exploded_inwall && !istype(loc,/atom/movable))
				exploded = TRUE
				exploded_inwall = TRUE
				fragmentate(get_turf(src), rand(10,20), 5, list(/obj/item/projectile/bullet/pellet/fragment/crystal), name)
				playsound(get_turf(src),pick(SOUNDS_CRYSTAL_METAL),150)
	..()

/obj/item/projectile/bullet/pellet/fragment/crystal
	name = "crystal fragment"
	damage = 65
	icon_state= "dark_pellet"

/obj/item/projectile/bullet/pellet/fragment/crystal/Bump(atom/A as mob|obj|turf|area, forced=0)
	if(src)
		playsound(get_turf(src),pick(SOUNDS_CRYSTAL_METAL))
	..()

#undef CALIBER_SHIP_CRYSTAL
#undef SOUNDS_CRYSTAL_METAL
