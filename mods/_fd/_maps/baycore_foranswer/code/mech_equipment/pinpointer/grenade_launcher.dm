/datum/mech_equipment/firearm/grenade_launcher
	name = "Гранатомёт"
	action_icon = 'mods/_fd/_maps/baycore_foranswer/icons/ui.dmi'
	action_state = "26"

	ammo = 12
	max_ammo = 12
	magazines = 2
	max_magazines = 2

	bullet_type = /obj/item/projectile/bullet/mech/grenade
	reload_time = 10 SECONDS

	cooldown = 2 SECONDS

/obj/item/projectile/bullet/mech/grenade
	name = "РАЗРЫВНОЙ"
	integrity_damage = 0
	hull_damage = 0

	life_span = 12
	fire_sound = 'sound/weapons/bombwhine.ogg'
	icon_state = "spark_"

/obj/item/projectile/bullet/mech/grenade/Destroy()
	new /obj/structure/fd/lancer/grenade/basic(get_turf(src))
	. = ..()

/obj/item/projectile/bullet/mech/grenade_flash
	name = "СВЕТОШУМОВОЙ"
	integrity_damage = 0
	hull_damage = 0

	life_span = 12
	fire_sound = 'sound/weapons/bombwhine.ogg'
	icon_state = "spark_green"

/obj/item/projectile/bullet/mech/grenade_flash/Destroy()
	new /obj/structure/fd/lancer/grenade/flash(get_turf(src))
	. = ..()

/obj/item/projectile/bullet/mech/grenade_grav
	name = "ГРАВИТАЦИОННЫЙ"
	integrity_damage = 0
	hull_damage = 0

	life_span = 12
	fire_sound = 'sound/weapons/bombwhine.ogg'
	icon_state = "bluespace"

/obj/item/projectile/bullet/mech/grenade_grav/Destroy()
	new /obj/structure/fd/lancer/grenade/gravitational(get_turf(src))
	. = ..()

/obj/structure/fd/lancer/grenade
	alpha = 0
	var/splash_zone = 2

/obj/structure/fd/lancer/grenade/Initialize()
	. = ..()
	bomb_trigger()

/obj/structure/fd/lancer/grenade/proc/bomb_trigger()
	set waitfor = FALSE

	var/list/affected_turfs = list()
	for(var/turf/floor in block(x-splash_zone, y-splash_zone, z, x+splash_zone, y+splash_zone, z))
		affected_turfs[floor] = floor.color
		animate(floor, time = 1 SECONDS, color = COLOR_RED, easing = CUBIC_EASING | EASE_OUT, flags = ANIMATION_PARALLEL)

	sleep(1 SECONDS)

	for(var/turf/floor in affected_turfs.Copy())
		animate(floor, time = 0.2 SECONDS, color = affected_turfs[floor], easing = SINE_EASING | EASE_IN, flags = ANIMATION_PARALLEL)
		bomb_effect(floor)
	affected_turfs.Cut()

/obj/structure/fd/lancer/grenade/proc/bomb_effect(turf/where_to_check)
	return

/obj/structure/fd/lancer/grenade/basic
	splash_zone = 3
/obj/structure/fd/lancer/grenade/basic/bomb_effect(turf/where_to_check)
	for(var/mob/living/simple_animal/fd/lancer/mobik in where_to_check)
		mobik.recieve_damage(integrity_damage = 10, hull_damage = 30, shredding = FALSE, do_animation = TRUE)

	for(var/mob/living/simple_animal/hostile/ascent_trooper/AT in where_to_check)
		AT.gib()

	spawn(4 SECONDS)
		qdel(src)

/obj/structure/fd/lancer/grenade/gravitational/bomb_effect(turf/where_to_check)
	for(var/mob/living/simple_animal/fd/lancer/mobik in where_to_check)

		if(get_dist(src, mobik) > 0)
			var/turf/target_turf = get_step(get_turf(src), pick(GLOB.alldirs))
			var/list/line_list = getline(mobik, target_turf)
			for(var/i = 1 to length(line_list))
				var/turf/T = line_list[i]
				var/obj/temp_visual/decoy/D = new /obj/temp_visual/decoy(T, mobik.dir, mobik)
				D.alpha = min(150 + i*15, 255)
				animate(D, alpha = 0, time = 2 + i*2)
			mobik.forceMove(target_turf)

	spawn(4 SECONDS)
		qdel(src)

/obj/structure/fd/lancer/grenade/flash/bomb_effect(turf/where_to_check)
	for(var/mob/living/simple_animal/fd/lancer/mobik in where_to_check)
		mobik.add_status_effect(/datum/mech_status/vulnerable, 5 SECONDS)

	spawn(4 SECONDS)
		qdel(src)
