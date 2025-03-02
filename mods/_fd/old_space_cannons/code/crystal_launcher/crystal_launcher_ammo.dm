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
	max_ammo = 24
	ammo_type = /obj/item/ammo_casing/huge_caliber/crystal/high_explosive

/obj/item/ammo_magazine/ammobox/crystal/shrapnel
	name = "Mobile X-type crystal growth chamber"
	icon_state = "ammocrate_autocannon"
	max_ammo = 24
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

/obj/item/projectile/bullet/huge_caliber/crystal
	name ="crystal shard"
	icon_state= "dark_pellet"
	damage = CANNON_DMGS_VERYHIGH
	pew_spread = 10
	armor_penetration = 100
	penetration_modifier = 1.1
	muzzle_type = null
	fire_sound = null

	var/should_fragmentate = TRUE

/obj/item/projectile/bullet/huge_caliber/crystal/Bump(atom/A as mob|obj|turf|area, forced=0)

	if(!exploded && should_fragmentate)
		exploded = TRUE
		fragmentate(get_turf(src), rand(3,5), 7, list(/obj/item/projectile/bullet/huge_caliber/crystal/fragment), name)
		playsound(get_turf(src),pick(SOUNDS_CRYSTAL_METAL),150)
	..()

/obj/item/projectile/bullet/huge_caliber/crystal/Destroy()
	if(src)
		if(should_fragmentate)
			fragmentate(get_turf(src), rand(3,5), 7, list(/obj/item/projectile/bullet/huge_caliber/crystal/fragment), name)
		playsound(get_turf(src),pick(SOUNDS_CRYSTAL_METAL))
	..()

/obj/item/projectile/bullet/huge_caliber/crystal/high_explosive
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
	penetrating = 12
	proximity_detonation = FALSE

	var/exploded_inwall = FALSE
	var/delay = 4

/obj/item/projectile/bullet/huge_caliber/crystal/shrapnel/Bump(atom/A as mob|obj|turf|area, forced=0)
	..()
	if(exploded)
		return

	exploded = TRUE
	if(istype(A,/obj/shield))
		playsound(get_turf(src),pick(SOUNDS_CRYSTAL_METAL),150)
		fragmentate(get_turf(src), rand(40,60), 7, list(/obj/item/projectile/bullet/pellet/fragment/crystal), name)
		qdel(src)
		return

	sleep(delay)

	if(src && !exploded_inwall)
		playsound(get_turf(src),pick(SOUNDS_CRYSTAL_METAL),150)
		fragmentate(get_turf(src), rand(40,60), 7, list(/obj/item/projectile/bullet/pellet/fragment/crystal), name)
		qdel(src)

/obj/item/projectile/bullet/huge_caliber/crystal/shrapnel/Destroy()
	if(src && !exploded_inwall && !istype(loc,/atom/movable))
		exploded = TRUE
		exploded_inwall = TRUE
		playsound(get_turf(src),pick(SOUNDS_CRYSTAL_METAL),150)
		fragmentate(get_turf(src), rand(40,60), 7, list(/obj/item/projectile/bullet/pellet/fragment/crystal), name)
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
