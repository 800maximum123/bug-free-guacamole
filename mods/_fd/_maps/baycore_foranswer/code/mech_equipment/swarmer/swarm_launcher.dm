/datum/mech_equipment/firearm/swarm_launcher
	name = "Десантная труба"
	action_icon = 'mods/_fd/_maps/baycore_foranswer/icons/ui.dmi'
	action_state = "26"

	ammo = 10
	max_ammo = 10
	magazines = 10
	max_magazines = 10

	bullet_type = /obj/item/projectile/bullet/mech/swarm_launcher
	reload_time = 60 SECONDS

	cooldown = 1 SECONDS

/obj/item/projectile/bullet/mech/swarm_launcher
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/ascents.dmi'
	icon_state = "crip_bullet"
	fire_sound = 'sound/weapons/Egloves.ogg'

	bullet_size = 1
	integrity_damage = 0
	hull_damage = 0

	life_span = 12

/obj/item/projectile/bullet/mech/swarm_launcher/Destroy()
	new /mob/living/simple_animal/hostile/ascent_trooper(get_turf(src))
	. = ..()

/mob/living/simple_animal/hostile/ascent_trooper
	name = "Alate Trooper"
	desc = "Not so dangerous, honestly..."
	icon = 'mods/_fd/_maps/baycore_foranswer/icons/ascents.dmi'
	icon_state = "crip_1"
	icon_living = "crip"
	icon_dead = "crip"
	icon_gib = "gib"
	faction = "Ascents"
	min_gas = null
	max_gas = null
	minbodytemp = 0
	speed = 2
	bleed_colour = "#34f7f7"

	meat_type =     null
	meat_amount =   0
	bone_material = null
	bone_amount =   0
	skin_material = null
	skin_amount =   0

	ai_holder = /datum/ai_holder/simple_animal/ranged/kiting
	projectiletype = /obj/item/projectile/beam/anti_mech
	projectilesound = 'sound/weapons/gunshot/gunshot.ogg'

/mob/living/simple_animal/hostile/ascent_trooper/Initialize()
	. = ..()
	icon_state = "crip_[rand(1,3)]"
	icon_living = "crip_[rand(1,3)]"

/obj/item/projectile/beam/anti_mech
	damage = 0

	muzzle_type = /obj/projectile/laser/blue/muzzle
	tracer_type = /obj/projectile/laser/blue/tracer
	impact_type = /obj/projectile/laser/blue/impact

	var/integrity_damage = 2
	var/hull_damage = 1

/obj/item/projectile/beam/anti_mech/on_hit(atom/target, blocked = 0)
	if(istype(target, /mob/living/simple_animal/fd/lancer))
		var/mob/living/simple_animal/fd/lancer/M = target
		if(M.vulnerable)
			integrity_damage *= 2

		M.recieve_damage(integrity_damage = integrity_damage, hull_damage = hull_damage, shredding = FALSE, do_animation = TRUE)
