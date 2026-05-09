#define isanomaly(A) istype(A, /mob/living/simple_animal/hostile/retaliate/anomaly)

/datum/keybinding/living/fd/event
	category = CATEGORY_FD_EVENT

/datum/keybinding/living/fd/event/anomaly/can_use(client/user)
	return isanomaly(user.mob)

/datum/keybinding/living/fd/event/anomaly/active1
	hotkey_keys = list("Q")
	name = "active1"
	full_name = "Anomaly: Active Ability 1"
	description = ""

/datum/keybinding/living/fd/event/anomaly/active1/down(client/user)
	var/mob/living/simple_animal/hostile/retaliate/anomaly/L = user.mob

	L.trigger_first_ability()
	return TRUE

/datum/keybinding/living/fd/event/anomaly/active2
	hotkey_keys = list("E")
	name = "active2"
	full_name = "Anomaly: Active Ability 2"
	description = ""

/datum/keybinding/living/fd/event/anomaly/active2/down(client/user)
	var/mob/living/simple_animal/hostile/retaliate/anomaly/L = user.mob

	L.trigger_second_ability()
	return TRUE

/mob/living/simple_animal/hostile/retaliate/anomaly

	health = 999999
	maxHealth = 999999
	meat_amount = 0
	skin_amount = 0

	simple_combat_on = TRUE
	simple_health = 1000
	max_simple_health = 1000

	min_gas = null
	max_gas = null
	minbodytemp = 0

	faction = "anomaly"

	ai_holder = /datum/ai_holder/simple_animal/retaliate

/mob/living/simple_animal/hostile/retaliate/anomaly/proc/trigger_first_ability()
	return

/mob/living/simple_animal/hostile/retaliate/anomaly/proc/trigger_second_ability()
	return

/obj/item/natural_weapon/anomaly
	force = 2

// Жаба. Большая. Любит бодаться. Всё что сжирается - либо выплёвывается как снаряд, либо перерабатывается в ресурсы, которые тоже потом выплёвываются

/mob/living/simple_animal/hostile/retaliate/anomaly/frog
	name = "frog"
	desc = "Giant semi-sentient frog."
	icon = 'mods/_fd/_maps/aaaa_facility/icons/64x64.dmi'
	icon_state = "blubbering"
	icon_living = "blubbering"
	icon_dead = "blubbering_dead"

	mob_size = MOB_LARGE
	mob_bump_flag = HEAVY
	mob_swap_flags = HEAVY
	mob_push_flags = ALLMOBS
	can_escape = TRUE

	universal_speak = FALSE
	universal_understand = TRUE

	natural_weapon = /obj/item/natural_weapon/anomaly/frog_bump
	response_help = "strokes"
	response_disarm = "bumps"
	response_harm = "strikes"

/obj/item/natural_weapon/anomaly/frog_bump
	name = "head"
	attack_verb = list("ramed")
	simple_damage = 20

	hitsound = 'sound/weapons/heavysmash.ogg'

/obj/item/natural_weapon/anomaly/frog_bump/afterattack(atom/movable/target, mob/user, is_adjacent, click_params)
	. = ..()
	target.throw_at(get_edge_target_turf(target, get_dir(user, target)), 6, 2, user)

/mob/living/simple_animal/hostile/retaliate/anomaly/frog/set_dir()
	..()
	switch(dir)
		if(NORTH, SOUTH)
			bound_height = 64
			bound_width = 64
		if(EAST, WEST)
			bound_height = 64
			bound_width = 64

/mob/living/simple_animal/hostile/retaliate/anomaly/frog/trigger_first_ability()
	var/turf/T = get_turf(get_step(src, dir))

	for(var/atom/movable/I in T)
		if(!I.anchored)
			do_attack_animation(I)
			spawn(2)
			I.forceMove(src)

/mob/living/simple_animal/hostile/retaliate/anomaly/frog/trigger_second_ability()
	if(length(contents))
		var/list/options = list(
			"ВЫПЛЮНУТЬ" = image('mods/_fd/_maps/collective_nightmare/icons/radial.dmi', "radial_drop"),
			"ПЕРЕВАРИТЬ" = image('mods/_fd/_maps/collective_nightmare/icons/radial.dmi', "radial_create")
		)
		var/chosen_option = show_radial_menu(src, src, options, radius = 25, require_near = TRUE)
		if(!chosen_option)
			return 0

		switch(chosen_option)
			if("ВЫПЛЮНУТЬ")
				anchored = TRUE
				icon_state = "blubbering_tongue"

				for(var/atom/movable/I in contents)
					do_attack_animation(get_turf(get_step(src,dir)))

					I.forceMove(get_turf(get_step(src,dir)))
					I.throw_at(get_edge_target_turf(I, get_dir(src, I)), 6, 2, src)
					sleep(5)

				anchored = FALSE
				icon_state = "blubbering"
				return TRUE
			if("ПЕРЕВАРИТЬ")
				var/item_to_transform = input("Select an atom to transform", "Transformation") as null|anything in contents
				if(!item_to_transform)
					return

				var/list/types = typesof(/atom)
				var/list/matches = new()

				for(var/path in types)
					if(findtext("[path]", "/obj/item/stack/material"))
						matches += path

				if(length(matches)==0)
					return

				var/chosen
				if(length(matches)==1)
					chosen = matches[1]
				else
					chosen = input("Select an atom type", "Spawn Atom", matches[1]) as null|anything in matches
					if(!chosen)
						return
				icon_state = "blubbering_tongue"

				do_attack_animation(get_turf(get_step(src,dir)))
				var/obj/item/stack/material/M = new chosen(get_turf(get_step(src,dir)))
				M.throw_at(get_edge_target_turf(M, get_dir(src, M)), 6, 2, src)

				qdel(item_to_transform)
				icon_state = "blubbering"
				return TRUE

/mob/living/simple_animal/hostile/retaliate/anomaly/bench
	name = "bench"
	desc = "Very-very normal bench."
	icon = 'mods/_fd/_maps/aaaa_facility/icons/48x48.dmi'
	icon_state = "quiet_day"
	icon_living = "quiet_day"
	icon_dead = "quiet_day"

	pass_flags = PASS_FLAG_TABLE
	density = FALSE
	universal_speak = TRUE
	universal_understand = TRUE

	mob_size = MOB_MINISCULE
	anchored = TRUE

	interactive = TRUE
	desc_special_show = TRUE
	desc_special = {"Пустая деревянная лавочка. От одного взгляда на неё пробирает какая-то тоска."}

/mob/living/simple_animal/hostile/retaliate/anomaly/bench/trigger_first_ability()
	var/new_memo = input(src, "Describe the person", "Memo") as null|text
	if(!new_memo)
		return

	desc_special = {"На лавочке сидит <b><span style="color: yellow;">тень</span></b>. [new_memo]."}
	icon_state = "quiet_fadein"
	return TRUE

/mob/living/simple_animal/hostile/retaliate/anomaly/bench/trigger_second_ability()
	desc_special = {"Пустая деревянная лавочка. От одного взгляда на неё пробирает какая-то тоска."}
	icon_state = "quiet_fadeout"
	return TRUE

/mob/living/simple_animal/hostile/retaliate/anomaly/veteran
	name = "soldier"
	desc = "Military man with no head."
	icon = 'mods/_fd/_maps/aaaa_facility/icons/32x64.dmi'
	icon_state = "DrFluShots"
	icon_living = "DrFluShots"
	icon_dead = "DrFluShots"

	mob_size = MOB_LARGE
	mob_bump_flag = HEAVY
	mob_swap_flags = HEAVY
	mob_push_flags = ALLMOBS
	can_escape = TRUE

	universal_speak = TRUE
	universal_understand = TRUE

	natural_weapon = /obj/item/natural_weapon/anomaly/stock_bash
	response_help = "strokes"
	response_disarm = "bashes"
	response_harm = "strikes"

	var/inside_facility = TRUE

/obj/item/natural_weapon/anomaly/stock_bash
	name = "stock"
	attack_verb = list("bashed")
	simple_damage = 20

	hitsound = 'sound/weapons/genhit3.ogg'

/mob/living/simple_animal/hostile/retaliate/anomaly/veteran/trigger_first_ability()
	icon = 'mods/_fd/_maps/aaaa_facility/icons/64x64.dmi'
	anchored = TRUE

	playsound(loc, 'packs/infinity/sound/weapons/guns/interact/gun_cock.ogg', 50, 1)

	sleep(5)

	var/obj/item/projectile/pew
	var/pew_sound

	pew = new /obj/item/projectile/bullet/shotgun(get_turf(src))
	pew_sound = 'sound/weapons/gunshot/shotgun.ogg'

	pew.simple_damage = 50
	pew.simple_armor_penetration = 30

	var/atom/target = get_turf(get_step(src, dir))

	if(istype(pew))
		playsound(pew.loc, pew_sound, 50, 1)
		pew.original = target
		pew.current = target
		pew.starting = get_turf(src)
		pew.shot_from = src
		pew.launch(target)

	sleep(5)

	anchored = FALSE
	icon = 'mods/_fd/_maps/aaaa_facility/icons/32x64.dmi'

/obj/structure/fd/anomaly/veteran_teleport_cell
	mouse_opacity = FALSE
	icon = 'mods/_fd/fd_utilities/icons/newsource.dmi'
	icon_state = "landmark"
	invisibility = 50

/obj/structure/fd/anomaly/veteran_teleport_battlefield
	mouse_opacity = FALSE
	icon = 'mods/_fd/fd_utilities/icons/newsource.dmi'
	icon_state = "landmark"
	invisibility = 50

/mob/living/simple_animal/hostile/retaliate/anomaly/veteran/trigger_second_ability()
	var/obj/structure/fd/anomaly/veteran_teleport_cell/C = locate() in world
	var/obj/structure/fd/anomaly/veteran_teleport_battlefield/B = locate() in world

	if(inside_facility)
		for(var/mob/living/L in range(1,src))
			animate(L, alpha = 0, time = 1 SECONDS)
			sleep(1 SECONDS)
			L.forceMove(get_turf(B))
			animate(L, alpha = 255, time = 1 SECONDS)
		inside_facility = FALSE
		return TRUE

	if(!inside_facility)
		for(var/mob/living/L in range(1,src))
			animate(L, alpha = 0, time = 1 SECONDS)
			sleep(1 SECONDS)
			L.forceMove(get_turf(C))
			animate(L, alpha = 255, time = 1 SECONDS)
		inside_facility = TRUE
		return TRUE

/mob/living/simple_animal/hostile/retaliate/anomaly/florist
	name = "florist"
	desc = "Semi-young women covered in leafs."
	icon = 'mods/_fd/_maps/aaaa_facility/icons/32x48.dmi'
	icon_state = "beanstalk"
	icon_living = "beanstalk"
	icon_dead = "beanstalk_dead"

	universal_speak = TRUE
	universal_understand = TRUE

	natural_weapon = /obj/item/natural_weapon/anomaly/leaf_spear
	response_help = "strokes"
	response_disarm = "pokes"
	response_harm = "strikes"

/mob/living/simple_animal/hostile/retaliate/anomaly/florist/trigger_first_ability()
	var/turf/simulated/floor/T = get_turf(get_step(src, dir))
	var/obj/structure/gestalt_prison/prison
	if(!(prison in T))
		T.gestalt_imprisoned()
		return TRUE
	else
		T.gestalt_free()
		return TRUE

/mob/living/simple_animal/hostile/retaliate/anomaly/florist/trigger_second_ability()
	var/turf/simulated/floor/T = get_turf(get_step(src, dir))
	T.gestalt_attack_alt()

/turf/simulated/floor/proc/gestalt_attack_alt()
	var/obj/effect/gestalt_targeting/targeting = new /obj/effect/gestalt_targeting(get_turf(src))
	spawn(1 SECOND)
		animate(targeting, 1 SECOND, alpha = 0)
		new /obj/effect/gestalt_spike(get_turf(src))
		for(var/mob/living/actual_target in get_turf(src))
			actual_target.simple_health_calculation(20,1,10)
	spawn(3 SECONDS)
		qdel(targeting)
		for(var/obj/effect/gestalt_spike/spike in get_turf(src))
			animate(spike, 1 SECOND, alpha = 0)
			spawn(1 SECOND)
				qdel(spike)

/obj/item/natural_weapon/anomaly/leaf_spear
	name = "leaf spear"
	attack_verb = list("pierced")
	simple_damage = 20
	simple_armor_penetration = 10

	hitsound = 'sound/weapons/pierce.ogg'

/obj/structure/fd/interactive/anomaly_tree
	name = "tree"
	desc = "Normal tree. Kinda"

	anchored = TRUE
	density = TRUE

	icon = 'mods/_fd/fd_assets/icons/structures/flora/beet_tree.dmi'
	icon_state = "beet_tree"
	layer = 4.10
	pixel_x = -32

/obj/structure/fd/interactive/anomaly_tree/interact_with(mob/living/user)
	if(!istype(user,/mob/living/simple_animal/hostile/retaliate/anomaly/florist))
		desc_special = {"<span style="color: green;">Дерево</span>. Наверху виднеются какие-то плоды."}
		desc_special_show = TRUE
		. = ..()
		return TRUE

	var/list/types = typesof(/atom)
	var/list/matches = new()

	for(var/path in types)
		if(findtext("[path]", "/obj/item/reagent_containers/food/snacks/grown"))
			matches += path

	if(length(matches)==0)
		return

	var/chosen
	if(length(matches)==1)
		chosen = matches[1]
	else
		chosen = input(user,"Select an atom type", "Spawn Atom", matches[1]) as null|anything in matches
		if(!chosen)
			return

	animate(src, transform = matrix(rand(-3,3), rand(-3,3), MATRIX_TRANSLATE), time = 0.5, easing = EASE_IN)
	for(var/i in 0 to 10)
		animate(transform = matrix(rand(-4,4), rand(-4,4), MATRIX_TRANSLATE), time = 1)
	animate(transform = matrix(0, 0, MATRIX_TRANSLATE), time = 0.5, easing = EASE_OUT)

	spawn(10)
		new chosen(get_turf(src))
	return TRUE

/mob/living/simple_animal/hostile/retaliate/anomaly/boss
	name = "Dr. Cherenkov"
	desc = "Your Boss. Yeah, he is an anomaly himself."
	icon = 'mods/_fd/_maps/aaaa_facility/icons/32x32.dmi'
	icon_state = "firstfold"
	icon_living = "firstfold"
	icon_dead = "firstfold"

	universal_speak = TRUE
	universal_understand = TRUE

/mob/living/simple_animal/hostile/retaliate/anomaly/littletraveler
	name = "little guy"
	desc = "Friendly fella."
	icon = 'mods/_fd/_maps/aaaa_facility/icons/32x64.dmi'
	icon_state = "watchman"
	icon_living = "watchman"
	icon_dead = "watchman"

	pass_flags = PASS_FLAG_TABLE
	density = FALSE
	universal_speak = TRUE
	universal_understand = TRUE

	mob_size = MOB_TINY

	light_power = 0.1
	light_range = 3
	light_color = COLOR_AMBER

	var/image/buddy

	var/mob/living/carbon/human/connected_to
	var/next_heal = 5
	var/heal_speed = 5

/mob/living/simple_animal/hostile/retaliate/anomaly/littletraveler/Life()
	if(light_power > 0.1)
		for(var/mob/living/simple_animal/hostile/anomaly/shadow/S in range(3,src))
			S.simple_health_calculation(10, 0, 0)
		light_power -= 0.1

	if(light_power <= 0.1)
		light_power = 0.1

	if(connected_to)
		if(next_heal <= 0)
			connected_to.simple_health_calculation(-2, 0, 0)
			next_heal = heal_speed
		else
			next_heal -= 1

	. = ..()

/mob/living/simple_animal/hostile/retaliate/anomaly/littletraveler/trigger_first_ability()
	light_power = 2
	return TRUE

/mob/living/simple_animal/hostile/retaliate/anomaly/littletraveler/trigger_second_ability()
	if(!connected_to)
		var/turf/T = get_turf(get_step(src, dir))
		buddy = image(icon, icon_state)
		buddy.mouse_opacity = FALSE
		buddy.pixel_y = 26
		buddy.pixel_x = 18

		for(var/mob/living/carbon/human/H in T)
			forceMove(H)
			connected_to = H

		connected_to.AddOverlays(buddy)

	else
		forceMove(get_turf(connected_to))
		connected_to.CutOverlays(buddy)
		connected_to = null
		next_heal = heal_speed

/obj/structure/fd/interactive/rift
	name = "rift"
	desc = "Strange tear in reality."

	anchored = TRUE
	density = TRUE

	icon = 'mods/_fd/_maps/aaaa_facility/icons/32x32.dmi'
	icon_state = "rift"
	layer = 4.10

/obj/structure/fd/interactive/rift/interact_with(mob/living/user)
	if(!istype(user,/mob/living/simple_animal/hostile/retaliate/anomaly/littletraveler))
		desc_special = {"<span style="color: red;">Пространственный разлом</span>. Лучше позволить ему закрыться самостоятельно."}
		desc_special_show = TRUE
		. = ..()
		return TRUE

	user.forceMove(get_turf(src))
	animate(src, alpha = 0, time = 10, LINEAR_EASING)
	spawn(10)
	qdel(src)
	return TRUE

/mob/living/simple_animal/hostile/anomaly/shadow
	name = "shadow"
	desc = "A walking darkness."
	icon = 'mods/_fd/_maps/aaaa_facility/icons/shadow_guard.dmi'
	icon_state = "shadow2"
	icon_living = "shadow2"
	icon_dead = ""

	health = 999999
	maxHealth = 999999

	simple_combat_on = TRUE
	simple_health = 50
	max_simple_health = 50

	simple_armor_natural = 10

	speed = 2

	natural_weapon = /obj/item/natural_weapon/anomaly/grips
	ai_holder = /datum/ai_holder/simple_animal/melee
	faction = "shadows"

	bleed_colour = "#000000"
	meat_type = null
	meat_amount = 0
	bone_material = null
	bone_amount = 0
	skin_material = null
	skin_amount = 0

	min_gas = null
	max_gas = null
	minbodytemp = 0

/obj/item/natural_weapon/anomaly/grips
	name = "grip"
	attack_verb = list("punched")
	simple_damage = 15

	hitsound = 'sound/hallucinations/growl3.ogg'

/mob/living/simple_animal/hostile/anomaly/shadow/fast
	icon_state = "shadow"
	icon_living = "shadow"
	icon_dead = ""

	simple_health = 10
	max_simple_health = 10

	simple_armor_natural = 5

	speed = -1

	natural_weapon = /obj/item/natural_weapon/anomaly/grips
	ai_holder = /datum/ai_holder/simple_animal/melee/evasive

/obj/item/natural_weapon/anomaly/grips_weak
	name = "grip"
	attack_verb = list("punched")
	simple_damage = 5

	hitsound = 'sound/hallucinations/growl3.ogg'

/mob/living/simple_animal/hostile/anomaly/bugsoldier
	name = "bug soldier"
	desc = "A walking mess of a human and bug parts."
	icon = 'mods/_fd/_maps/aaaa_facility/icons/32x32.dmi'
	icon_state = "gcorp5"
	icon_living = "gcorp5"
	icon_dead = "gcorp_corpse2"

	health = 999999
	maxHealth = 999999

	simple_combat_on = TRUE
	simple_health = 30
	max_simple_health = 30

	simple_armor_natural = 3

	speed = 1.5

	natural_weapon = /obj/item/natural_weapon/anomaly/claws
	ai_holder = /datum/ai_holder/simple_animal/melee/evasive
	faction = "bugarmy"

	bleed_colour = "#000000"
	meat_type = null
	meat_amount = 0
	bone_material = null
	bone_amount = 0
	skin_material = null
	skin_amount = 0

	min_gas = null
	max_gas = null
	minbodytemp = 0

/obj/item/natural_weapon/anomaly/claws
	name = "claw"
	attack_verb = list("pierced")
	simple_damage = 5
	simple_armor_penetration = 5

	hitsound = 'sound/weapons/rapidslice.ogg'

/mob/living/simple_animal/hostile/anomaly/bugsoldier_fast
	name = "bug soldier"
	desc = "A walking mess of a human and bug parts."
	icon = 'mods/_fd/_maps/aaaa_facility/icons/32x32.dmi'
	icon_state = "gcorp6"
	icon_living = "gcorp6"
	icon_dead = "gcorp_corpse"

	health = 999999
	maxHealth = 999999

	simple_combat_on = TRUE
	simple_health = 10
	max_simple_health = 10

	speed = -1

	natural_weapon = /obj/item/natural_weapon/anomaly/claws
	ai_holder = /datum/ai_holder/simple_animal/melee/hit_and_run
	faction = "bugarmy"

	bleed_colour = "#000000"
	meat_type = null
	meat_amount = 0
	bone_material = null
	bone_amount = 0
	skin_material = null
	skin_amount = 0

	min_gas = null
	max_gas = null
	minbodytemp = 0

/mob/living/simple_animal/hostile/anomaly/merm
	name = "mermaid"
	desc = "An giant fishlike creature. NOT FRIENDLY!"
	icon = 'mods/_fd/_maps/aaaa_facility/icons/64x64.dmi'
	icon_state = "merm"
	icon_living = "merm"
	icon_dead = "merm_dead"

	health = 999999
	maxHealth = 999999

	simple_combat_on = TRUE
	simple_health = 50
	max_simple_health = 50

	speed = 0

	natural_weapon = /obj/item/natural_weapon/anomaly/bite
	ai_holder = /datum/ai_holder/simple_animal/melee/evasive
	faction = "mermaid"

	bleed_colour = "#00ffd5"
	meat_type = null
	meat_amount = 0
	bone_material = null
	bone_amount = 0
	skin_material = null
	skin_amount = 0

	min_gas = null
	max_gas = null
	minbodytemp = 0

	pixel_x = -16

/obj/item/natural_weapon/anomaly/bite
	name = "teeth"
	attack_verb = list("bit")
	simple_damage = 10

	hitsound = 'sound/weapons/bite.ogg'

/mob/living/simple_animal/hostile/anomaly/merm_bigger
	name = "mermaid"
	desc = "An giant fishlike creature. NOT FRIENDLY!"
	icon = 'mods/_fd/_maps/aaaa_facility/icons/64x64.dmi'
	icon_state = "scarymerm"
	icon_living = "scarymerm"
	icon_dead = "scarymerm_dead"

	health = 999999
	maxHealth = 999999

	simple_combat_on = TRUE
	simple_health = 100
	max_simple_health = 100

	simple_armor_natural = 5

	speed = 2

	natural_weapon = /obj/item/natural_weapon/anomaly/hardbite
	ai_holder = /datum/ai_holder/simple_animal/melee/evasive
	faction = "mermaid"

	bleed_colour = "#92a8a5"
	meat_type = null
	meat_amount = 0
	bone_material = null
	bone_amount = 0
	skin_material = null
	skin_amount = 0

	min_gas = null
	max_gas = null
	minbodytemp = 0

	pixel_x = -16

/obj/item/natural_weapon/anomaly/hardbite
	name = "teeth"
	attack_verb = list("bit")
	simple_damage = 25
	simple_armor_penetration = 5

	hitsound = 'sound/weapons/bite.ogg'

// MAP STUFF //

/datum/map_template/ruin/away_site/aaaa_facility
	name = "AAAA Facility"
	id = "awaysite_afacility"
	spawn_cost = 2
	description = "..."
	prefix = "mods/_fd/_maps/aaaa_facility/maps/"
	suffixes = list("aaaa_facility.dmm")
	area_usage_test_exempted_root_areas = list(/area/aaaa_facility)
	apc_test_exempt_areas = list(
		/area/aaaa_facility = NO_SCRUBBER|NO_VENT|NO_APC
	)

/singleton/submap_archetype/aaaa_facility
	descriptor = "Oil Rig (Beauro 12)"
	map = "On-water Facility"
	crew_jobs = list(/datum/job/submap/aaaa_facility)

/obj/submap_landmark/joinable_submap/aaaa_facility
	name = "On-water Facility"
	archetype = /singleton/submap_archetype/aaaa_facility

/datum/job/submap/aaaa_facility
	title = "Beauro 12 Agent"
	total_positions = -1
	outfit_type = /singleton/hierarchy/outfit/aaaa_facility
	create_record = TRUE
	skill_points = 62
	no_skill_buffs = TRUE
	max_skill = list(
		SKILL_BUREAUCRACY = SKILL_MAX,
		SKILL_FINANCE = SKILL_MAX,
		SKILL_EVA = SKILL_MAX,
		SKILL_MECH = SKILL_MAX,
		SKILL_PILOT = SKILL_MAX,
		SKILL_HAULING = SKILL_MAX,
		SKILL_COMPUTER = SKILL_MAX,
		SKILL_BOTANY = SKILL_MAX,
		SKILL_COOKING = SKILL_MAX,
		SKILL_COMBAT = SKILL_MAX,
		SKILL_WEAPONS = SKILL_MAX,
		SKILL_FORENSICS = SKILL_MAX,
		SKILL_CONSTRUCTION = SKILL_MAX,
		SKILL_ELECTRICAL = SKILL_MAX,
		SKILL_ATMOS = SKILL_MAX,
		SKILL_ENGINES = SKILL_MAX,
		SKILL_DEVICES = SKILL_MAX,
		SKILL_SCIENCE = SKILL_MAX,
		SKILL_MEDICAL = SKILL_MAX,
		SKILL_ANATOMY = SKILL_MAX,
		SKILL_CHEMISTRY = SKILL_MAX
	)

/datum/job/submap/aaaa_facility/post_equip_rank(mob/living/person, alt_title)
	. = ..()
	person.simple_combat_on = TRUE
	person.anchored = TRUE

/singleton/hierarchy/outfit/aaaa_facility
	name = "Beauro 12 Agent Appearance"

	uniform = /obj/item/clothing/under/lawyer/infil
	suit = /obj/item/clothing/suit/storage/det_trench/grey
	shoes = /obj/item/clothing/shoes/laceup

	back = /obj/item/storage/backpack/satchel/pocketbook

/obj/submap_landmark/spawnpoint/aaaa_facility
	name = "Beauro 12 Agent"

/area/aaaa_facility
	name = "OIL RIG(OUTER)"
	requires_power = FALSE

/area/aaaa_facility/levelone
	name = "OIL RIG(LVL -1)"

/area/aaaa_facility/leveltwo
	name = "OIL RIG(LVL 0)"

/area/aaaa_facility/levelthree
	name = "OIL RIG(LVL 1)"

/obj/structure/fd/interactive/timetrigger
	mouse_opacity = FALSE
	icon = 'mods/_fd/fd_utilities/icons/newsource.dmi'
	icon_state = ""

	var/light_controller_id = "daycycle"
	var/daycolor = "#f1c063"
	var/nightcolor = "#1f75bb"

/obj/structure/fd/interactive/timetrigger/interact_with(mob/living/carbon/human/user)

	var/obj/item/I = user.get_active_hand()

	if(!I)
		desc_special = {"Отличный вид. Самое то для <span style="color: yellow;">сигаретки</span>."}
		desc_special_show = TRUE
		. = ..()
		return TRUE

	if(istype(I, /obj/item/clothing/mask/smokable/cigarette))
		var/list/options = list(
			"ПОКУРИТЬ" = image('mods/_fd/_maps/collective_nightmare/icons/radial.dmi', "radial_talk")
		)
		var/chosen_option = show_radial_menu(user, src, options, radius = 25, require_near = TRUE)
		if(!chosen_option)
			return 0
		if(chosen_option == "ПОКУРИТЬ")
			user.anchored = TRUE

			animate(user.client, pixel_y = 192, 3 SECONDS, SINE_EASING|EASE_OUT)
			user.overlay_fullscreen("timeskip", /obj/screen/fullscreen/fd/falling_asleep)

			for(var/obj/structure/fd/mapping/light_marker/LM in world)
				if(LM.marker_id != light_controller_id)
					continue

				if(LM.color == daycolor)
					LM.setup_marker(10, 0.5, nightcolor)
					continue

				if(LM.color == nightcolor)
					LM.setup_marker(10, 0.8, daycolor)
					continue

			user.drop_from_inventory(I)
			qdel(I)

			for(var/mob/living/carbon/human/H in world)
				H.simple_health_calculation(-100, 0, 0)

			spawn(5 SECONDS)
				animate(user.client, pixel_y = 0, 3 SECONDS, SINE_EASING|EASE_IN)
				user.clear_fullscreen("timeskip")
				user.anchored = FALSE

GLOBAL_DATUM_INIT(idealist_agendas, /datum/antagonist/cain_agenda_idealist, new)
GLOBAL_DATUM_INIT(firebug_agendas, /datum/antagonist/cain_agenda_firebug, new)
GLOBAL_DATUM_INIT(drudge_agendas, /datum/antagonist/cain_agenda_drudge, new)
GLOBAL_DATUM_INIT(doomed_agendas, /datum/antagonist/cain_agenda_doomed, new)
GLOBAL_DATUM_INIT(demon_agendas, /datum/antagonist/cain_agenda_demon, new)
GLOBAL_DATUM_INIT(cheater_agendas, /datum/antagonist/cain_agenda_cheater, new)
GLOBAL_DATUM_INIT(zealot_agendas, /datum/antagonist/cain_agenda_zealot, new)
GLOBAL_DATUM_INIT(maw_agendas, /datum/antagonist/cain_agenda_maw, new)
GLOBAL_DATUM_INIT(mentor_agendas, /datum/antagonist/cain_agenda_mentor, new)
GLOBAL_DATUM_INIT(beast_agendas, /datum/antagonist/cain_agenda_beast, new)
GLOBAL_DATUM_INIT(guardian_agendas, /datum/antagonist/cain_agenda_guardian, new)
GLOBAL_DATUM_INIT(loner_agendas, /datum/antagonist/cain_agenda_loner, new)
GLOBAL_DATUM_INIT(hardliner_agendas, /datum/antagonist/cain_agenda_hardliner, new)
GLOBAL_DATUM_INIT(torch_agendas, /datum/antagonist/cain_agenda_torch, new)
GLOBAL_DATUM_INIT(songbird_agendas, /datum/antagonist/cain_agenda_songbird, new)
GLOBAL_DATUM_INIT(scum_agendas, /datum/antagonist/cain_agenda_scum, new)

#define MODE_AGENDA_IDEALIST "idealist"
#define MODE_AGENDA_FIREBUG "firebug"
#define MODE_AGENDA_DRUDGE "drudge"
#define MODE_AGENDA_DOOMED "doomed"
#define MODE_AGENDA_DEMON "demon"
#define MODE_AGENDA_CHEATER "cheater"
#define MODE_AGENDA_ZEALOT "zealot"
#define MODE_AGENDA_MAW "maw"
#define MODE_AGENDA_MENTOR "mentor"
#define MODE_AGENDA_BEAST "beast"
#define MODE_AGENDA_GUARDIAN "guardian"
#define MODE_AGENDA_LONER "loner"
#define MODE_AGENDA_HARDLINER "hardliner"
#define MODE_AGENDA_TORCH "torch"
#define MODE_AGENDA_SONGBIRD "songbird"
#define MODE_AGENDA_SCUM "scum"

/datum/antagonist/cain_agenda_idealist
	id = MODE_AGENDA_IDEALIST
	flags = ANTAG_RANDOM_EXCEPTED
	role_text = "IDEALIST AGENDA"
	role_text_plural = "IDEALIST AGENDA"
	antaghud_indicator = "hud_traitor"
	antag_text = "Нет таких проблем, которые нельзя было бы решить оптимизмом."
	welcome_text = {"Твоя <b><span style="color: yellow;">АГЕНДА</span></b> на сегодня: <b>ИДЕАЛИСТ</b>!"}

	blacklisted_jobs = list()
	skill_setter = null
	min_player_age = 0

	no_prior_faction = TRUE

/datum/antagonist/cain_agenda_idealist/create_objectives(datum/mind/player)
	if(!..())
		return
	player.objectives += new /datum/objective/cain_agenda/idealist1()
	player.objectives += new /datum/objective/cain_agenda/idealist2()

/datum/antagonist/cain_agenda_idealist/greet(datum/mind/player)
	// Basic intro text.
	to_chat(player.current, SPAN_DANGER(FONT_LARGE("YOUR MEMO IS [role_text]!")))

	if(leader_welcome_text && player == leader)
		to_chat(player.current, SPAN_CLASS("antagdesc", "[get_leader_welcome_text(player.current)]"))
	else
		to_chat(player.current, SPAN_CLASS("antagdesc", "[get_welcome_text(player.current)]"))
		to_chat(player.current, get_antag_text(player.current))

	to_chat(player.current, SPAN_NOTICE("Во время раунда попытайся сделать следующее:"))

	var/obj_count = 1
	for(var/datum/objective/objective in player.objectives)
		to_chat(player.current, "<B>Кредо #[obj_count]</B>: [objective.explanation_text]")
		obj_count++
	return 1

/datum/objective/cain_agenda/idealist1
	explanation_text = "Прорвись через трудности с улыбкой на лице"
/datum/objective/cain_agenda/idealist2
	explanation_text = "Столкнись с суровой реальностью"

/datum/antagonist/cain_agenda_firebug
	id = MODE_AGENDA_FIREBUG
	flags = ANTAG_RANDOM_EXCEPTED
	role_text = "FIREBUG AGENDA"
	role_text_plural = "FIREBUG AGENDA"
	antaghud_indicator = "hud_traitor"
	antag_text = "Мир устроен очень интересно."
	welcome_text = {"Твоя <b><span style="color: yellow;">АГЕНДА</span></b> на сегодня: <b>СВЕТЛЯЧОК</b>!"}

	blacklisted_jobs = list()
	skill_setter = null
	min_player_age = 0

	no_prior_faction = TRUE

/datum/antagonist/cain_agenda_firebug/create_objectives(datum/mind/player)
	if(!..())
		return
	player.objectives += new /datum/objective/cain_agenda/firebug1()
	player.objectives += new /datum/objective/cain_agenda/firebug2()

/datum/antagonist/cain_agenda_firebug/greet(datum/mind/player)
	// Basic intro text.
	to_chat(player.current, SPAN_DANGER(FONT_LARGE("YOUR MEMO IS [role_text]!")))

	if(leader_welcome_text && player == leader)
		to_chat(player.current, SPAN_CLASS("antagdesc", "[get_leader_welcome_text(player.current)]"))
	else
		to_chat(player.current, SPAN_CLASS("antagdesc", "[get_welcome_text(player.current)]"))
		to_chat(player.current, get_antag_text(player.current))

	to_chat(player.current, SPAN_NOTICE("Во время раунда попытайся сделать следующее:"))

	var/obj_count = 1
	for(var/datum/objective/objective in player.objectives)
		to_chat(player.current, "<B>Кредо #[obj_count]</B>: [objective.explanation_text]")
		obj_count++
	return 1

/datum/objective/cain_agenda/firebug1
	explanation_text = "Реши проблему креативно"
/datum/objective/cain_agenda/firebug2
	explanation_text = "Найди самый простой путь"

/datum/antagonist/cain_agenda_drudge
	id = MODE_AGENDA_DRUDGE
	flags = ANTAG_RANDOM_EXCEPTED
	role_text = "DRUDGE AGENDA"
	role_text_plural = "DRUDGE AGENDA"
	antaghud_indicator = "hud_traitor"
	antag_text = "В этой истории - ты герой второго плана."
	welcome_text = {"Твоя <b><span style="color: yellow;">АГЕНДА</span></b> на сегодня: <b>ЧЕРНОРАБОЧИЙ</b>!"}

	blacklisted_jobs = list()
	skill_setter = null
	min_player_age = 0

	no_prior_faction = TRUE

/datum/antagonist/cain_agenda_drudge/create_objectives(datum/mind/player)
	if(!..())
		return
	player.objectives += new /datum/objective/cain_agenda/drudge1()
	player.objectives += new /datum/objective/cain_agenda/drudge2()

/datum/antagonist/cain_agenda_drudge/greet(datum/mind/player)
	// Basic intro text.
	to_chat(player.current, SPAN_DANGER(FONT_LARGE("YOUR MEMO IS [role_text]!")))

	if(leader_welcome_text && player == leader)
		to_chat(player.current, SPAN_CLASS("antagdesc", "[get_leader_welcome_text(player.current)]"))
	else
		to_chat(player.current, SPAN_CLASS("antagdesc", "[get_welcome_text(player.current)]"))
		to_chat(player.current, get_antag_text(player.current))

	to_chat(player.current, SPAN_NOTICE("Во время раунда попытайся сделать следующее:"))

	var/obj_count = 1
	for(var/datum/objective/objective in player.objectives)
		to_chat(player.current, "<B>Кредо #[obj_count]</B>: [objective.explanation_text]")
		obj_count++
	return 1

/datum/objective/cain_agenda/drudge1
	explanation_text = "Займись грязной работой"
/datum/objective/cain_agenda/drudge2
	explanation_text = "Исправь чужую оплошность"

/datum/antagonist/cain_agenda_doomed
	id = MODE_AGENDA_DOOMED
	flags = ANTAG_RANDOM_EXCEPTED
	role_text = "DOOMED AGENDA"
	role_text_plural = "DOOMED AGENDA"
	antaghud_indicator = "hud_traitor"
	antag_text = "Обратного пути для тебя - уже нет."
	welcome_text = {"Твоя <b><span style="color: yellow;">АГЕНДА</span></b> на сегодня: <b>ОБРЕЧЁННЫЙ</b>!"}

	blacklisted_jobs = list()
	skill_setter = null
	min_player_age = 0

	no_prior_faction = TRUE

/datum/antagonist/cain_agenda_doomed/create_objectives(datum/mind/player)
	if(!..())
		return
	player.objectives += new /datum/objective/cain_agenda/doomed1()
	player.objectives += new /datum/objective/cain_agenda/doomed2()

/datum/antagonist/cain_agenda_doomed/greet(datum/mind/player)
	// Basic intro text.
	to_chat(player.current, SPAN_DANGER(FONT_LARGE("YOUR MEMO IS [role_text]!")))

	if(leader_welcome_text && player == leader)
		to_chat(player.current, SPAN_CLASS("antagdesc", "[get_leader_welcome_text(player.current)]"))
	else
		to_chat(player.current, SPAN_CLASS("antagdesc", "[get_welcome_text(player.current)]"))
		to_chat(player.current, get_antag_text(player.current))

	to_chat(player.current, SPAN_NOTICE("Во время раунда попытайся сделать следующее:"))

	var/obj_count = 1
	for(var/datum/objective/objective in player.objectives)
		to_chat(player.current, "<B>Кредо #[obj_count]</B>: [objective.explanation_text]")
		obj_count++
	return 1

/datum/objective/cain_agenda/doomed1
	explanation_text = "Продемонстрируй свою человечность"
/datum/objective/cain_agenda/doomed2
	explanation_text = "Продемонстрируй свою отречённость от человеческого"

/datum/antagonist/cain_agenda_demon
	id = MODE_AGENDA_DEMON
	flags = ANTAG_RANDOM_EXCEPTED
	role_text = "DEMON AGENDA"
	role_text_plural = "DEMON AGENDA"
	antaghud_indicator = "hud_traitor"
	antag_text = "Человеческой жадности никогда не будет предела."
	welcome_text = {"Твоя <b><span style="color: yellow;">АГЕНДА</span></b> на сегодня: <b>ДЕМОН</b>!"}

	blacklisted_jobs = list()
	skill_setter = null
	min_player_age = 0

	no_prior_faction = TRUE

/datum/antagonist/cain_agenda_demon/create_objectives(datum/mind/player)
	if(!..())
		return
	player.objectives += new /datum/objective/cain_agenda/demon1()
	player.objectives += new /datum/objective/cain_agenda/demon2()

/datum/antagonist/cain_agenda_demon/greet(datum/mind/player)
	// Basic intro text.
	to_chat(player.current, SPAN_DANGER(FONT_LARGE("YOUR MEMO IS [role_text]!")))

	if(leader_welcome_text && player == leader)
		to_chat(player.current, SPAN_CLASS("antagdesc", "[get_leader_welcome_text(player.current)]"))
	else
		to_chat(player.current, SPAN_CLASS("antagdesc", "[get_welcome_text(player.current)]"))
		to_chat(player.current, get_antag_text(player.current))

	to_chat(player.current, SPAN_NOTICE("Во время раунда попытайся сделать следующее:"))

	var/obj_count = 1
	for(var/datum/objective/objective in player.objectives)
		to_chat(player.current, "<B>Кредо #[obj_count]</B>: [objective.explanation_text]")
		obj_count++
	return 1

/datum/objective/cain_agenda/demon1
	explanation_text = "Обогати себя"
/datum/objective/cain_agenda/demon2
	explanation_text = "Отдай что-то важное тебе"

/datum/antagonist/cain_agenda_cheater
	id = MODE_AGENDA_CHEATER
	flags = ANTAG_RANDOM_EXCEPTED
	role_text = "CHEATER AGENDA"
	role_text_plural = "CHEATER AGENDA"
	antaghud_indicator = "hud_traitor"
	antag_text = "Никогда не показывай своего истинного лица."
	welcome_text = {"Твоя <b><span style="color: yellow;">АГЕНДА</span></b> на сегодня: <b>ОБМАНЩИК</b>!"}

	blacklisted_jobs = list()
	skill_setter = null
	min_player_age = 0

	no_prior_faction = TRUE

/datum/antagonist/cain_agenda_cheater/create_objectives(datum/mind/player)
	if(!..())
		return
	player.objectives += new /datum/objective/cain_agenda/cheater1()
	player.objectives += new /datum/objective/cain_agenda/cheater2()

/datum/antagonist/cain_agenda_cheater/greet(datum/mind/player)
	// Basic intro text.
	to_chat(player.current, SPAN_DANGER(FONT_LARGE("YOUR MEMO IS [role_text]!")))

	if(leader_welcome_text && player == leader)
		to_chat(player.current, SPAN_CLASS("antagdesc", "[get_leader_welcome_text(player.current)]"))
	else
		to_chat(player.current, SPAN_CLASS("antagdesc", "[get_welcome_text(player.current)]"))
		to_chat(player.current, get_antag_text(player.current))

	to_chat(player.current, SPAN_NOTICE("Во время раунда попытайся сделать следующее:"))

	var/obj_count = 1
	for(var/datum/objective/objective in player.objectives)
		to_chat(player.current, "<B>Кредо #[obj_count]</B>: [objective.explanation_text]")
		obj_count++
	return 1

/datum/objective/cain_agenda/cheater1
	explanation_text = "Солги о чём-то важном"
/datum/objective/cain_agenda/cheater2
	explanation_text = "Будь откровенен как ясный день"

/datum/antagonist/cain_agenda_zealot
	id = MODE_AGENDA_ZEALOT
	flags = ANTAG_RANDOM_EXCEPTED
	role_text = "ZEALOT AGENDA"
	role_text_plural = "ZEALOT AGENDA"
	antaghud_indicator = "hud_traitor"
	antag_text = "Мета-фактор - это следующая ступень человеческой эволюции. Они просто не готовы принять это как факт."
	welcome_text = {"Твоя <b><span style="color: yellow;">АГЕНДА</span></b> на сегодня: <b>ФАНАТИК</b>!"}

	blacklisted_jobs = list()
	skill_setter = null
	min_player_age = 0

	no_prior_faction = TRUE

/datum/antagonist/cain_agenda_zealot/create_objectives(datum/mind/player)
	if(!..())
		return
	player.objectives += new /datum/objective/cain_agenda/zealot1()
	player.objectives += new /datum/objective/cain_agenda/zealot2()

/datum/antagonist/cain_agenda_zealot/greet(datum/mind/player)
	// Basic intro text.
	to_chat(player.current, SPAN_DANGER(FONT_LARGE("YOUR MEMO IS [role_text]!")))

	if(leader_welcome_text && player == leader)
		to_chat(player.current, SPAN_CLASS("antagdesc", "[get_leader_welcome_text(player.current)]"))
	else
		to_chat(player.current, SPAN_CLASS("antagdesc", "[get_welcome_text(player.current)]"))
		to_chat(player.current, get_antag_text(player.current))

	to_chat(player.current, SPAN_NOTICE("Во время раунда попытайся сделать следующее:"))

	var/obj_count = 1
	for(var/datum/objective/objective in player.objectives)
		to_chat(player.current, "<B>Кредо #[obj_count]</B>: [objective.explanation_text]")
		obj_count++
	return 1

/datum/objective/cain_agenda/zealot1
	explanation_text = "Продемонстрируй мета-человеческое превосходство"
/datum/objective/cain_agenda/zealot2
	explanation_text = {"<b><span style="color: red;">УБЕЙ БЕЗМОЗГЛЫХ ОБЕЗЪЯН</span></b>"}

/datum/antagonist/cain_agenda_maw
	id = MODE_AGENDA_MAW
	flags = ANTAG_RANDOM_EXCEPTED
	role_text = "MAW AGENDA"
	role_text_plural = "MAW AGENDA"
	antaghud_indicator = "hud_traitor"
	antag_text = "Никогда не отказывай самому себе в удовольствии."
	welcome_text = {"Твоя <b><span style="color: yellow;">АГЕНДА</span></b> на сегодня: <b>РОТ</b>!"}

	blacklisted_jobs = list()
	skill_setter = null
	min_player_age = 0

	no_prior_faction = TRUE

/datum/antagonist/cain_agenda_maw/create_objectives(datum/mind/player)
	if(!..())
		return
	player.objectives += new /datum/objective/cain_agenda/maw1()
	player.objectives += new /datum/objective/cain_agenda/maw2()

/datum/antagonist/cain_agenda_maw/greet(datum/mind/player)
	// Basic intro text.
	to_chat(player.current, SPAN_DANGER(FONT_LARGE("YOUR MEMO IS [role_text]!")))

	if(leader_welcome_text && player == leader)
		to_chat(player.current, SPAN_CLASS("antagdesc", "[get_leader_welcome_text(player.current)]"))
	else
		to_chat(player.current, SPAN_CLASS("antagdesc", "[get_welcome_text(player.current)]"))
		to_chat(player.current, get_antag_text(player.current))

	to_chat(player.current, SPAN_NOTICE("Во время раунда попытайся сделать следующее:"))

	var/obj_count = 1
	for(var/datum/objective/objective in player.objectives)
		to_chat(player.current, "<B>Кредо #[obj_count]</B>: [objective.explanation_text]")
		obj_count++
	return 1

/datum/objective/cain_agenda/maw1
	explanation_text = "Ответь своей жажде"
/datum/objective/cain_agenda/maw2
	explanation_text = "Воздержись от самоудовлетворения"

/datum/antagonist/cain_agenda_mentor
	id = MODE_AGENDA_MENTOR
	flags = ANTAG_RANDOM_EXCEPTED
	role_text = "MENTOR AGENDA"
	role_text_plural = "MENTOR AGENDA"
	antaghud_indicator = "hud_traitor"
	antag_text = "Твоё время вышло. Теперь настала их пора."
	welcome_text = {"Твоя <b><span style="color: yellow;">АГЕНДА</span></b> на сегодня: <b>МЕНТОР</b>!"}

	blacklisted_jobs = list()
	skill_setter = null
	min_player_age = 0

	no_prior_faction = TRUE

/datum/antagonist/cain_agenda_mentor/create_objectives(datum/mind/player)
	if(!..())
		return
	player.objectives += new /datum/objective/cain_agenda/mentor1()
	player.objectives += new /datum/objective/cain_agenda/mentor2()

/datum/antagonist/cain_agenda_mentor/greet(datum/mind/player)
	// Basic intro text.
	to_chat(player.current, SPAN_DANGER(FONT_LARGE("YOUR MEMO IS [role_text]!")))

	if(leader_welcome_text && player == leader)
		to_chat(player.current, SPAN_CLASS("antagdesc", "[get_leader_welcome_text(player.current)]"))
	else
		to_chat(player.current, SPAN_CLASS("antagdesc", "[get_welcome_text(player.current)]"))
		to_chat(player.current, get_antag_text(player.current))

	to_chat(player.current, SPAN_NOTICE("Во время раунда попытайся сделать следующее:"))

	var/obj_count = 1
	for(var/datum/objective/objective in player.objectives)
		to_chat(player.current, "<B>Кредо #[obj_count]</B>: [objective.explanation_text]")
		obj_count++
	return 1

/datum/objective/cain_agenda/mentor1
	explanation_text = "Наставь союзника на правильный путь"
/datum/objective/cain_agenda/mentor2
	explanation_text = "Передай свой \"факел\" молодому поколению"

/datum/antagonist/cain_agenda_beast
	id = MODE_AGENDA_BEAST
	flags = ANTAG_RANDOM_EXCEPTED
	role_text = "BEAST AGENDA"
	role_text_plural = "BEAST AGENDA"
	antaghud_indicator = "hud_traitor"
	antag_text = "РВИ и КРОМСАЙ пока не останется ничего."
	welcome_text = {"Твоя <b><span style="color: yellow;">АГЕНДА</span></b> на сегодня: <b>ЗВЕРЬ</b>!"}

	blacklisted_jobs = list()
	skill_setter = null
	min_player_age = 0

	no_prior_faction = TRUE

/datum/antagonist/cain_agenda_beast/create_objectives(datum/mind/player)
	if(!..())
		return
	player.objectives += new /datum/objective/cain_agenda/beast1()
	player.objectives += new /datum/objective/cain_agenda/beast2()

/datum/antagonist/cain_agenda_beast/greet(datum/mind/player)
	// Basic intro text.
	to_chat(player.current, SPAN_DANGER(FONT_LARGE("YOUR MEMO IS [role_text]!")))

	if(leader_welcome_text && player == leader)
		to_chat(player.current, SPAN_CLASS("antagdesc", "[get_leader_welcome_text(player.current)]"))
	else
		to_chat(player.current, SPAN_CLASS("antagdesc", "[get_welcome_text(player.current)]"))
		to_chat(player.current, get_antag_text(player.current))

	to_chat(player.current, SPAN_NOTICE("Во время раунда попытайся сделать следующее:"))

	var/obj_count = 1
	for(var/datum/objective/objective in player.objectives)
		to_chat(player.current, "<B>Кредо #[obj_count]</B>: [objective.explanation_text]")
		obj_count++
	return 1

/datum/objective/cain_agenda/beast1
	explanation_text = "Ввяжись в драку"
/datum/objective/cain_agenda/beast2
	explanation_text = "Сдержи себя"

/datum/antagonist/cain_agenda_guardian
	id = MODE_AGENDA_GUARDIAN
	flags = ANTAG_RANDOM_EXCEPTED
	role_text = "GUARDIAN AGENDA"
	role_text_plural = "GUARDIAN AGENDA"
	antaghud_indicator = "hud_traitor"
	antag_text = "Жертвуй собой на чужое благо."
	welcome_text = {"Твоя <b><span style="color: yellow;">АГЕНДА</span></b> на сегодня: <b>ЗАЩИТНИК</b>!"}

	blacklisted_jobs = list()
	skill_setter = null
	min_player_age = 0

	no_prior_faction = TRUE

/datum/antagonist/cain_agenda_guardian/create_objectives(datum/mind/player)
	if(!..())
		return
	player.objectives += new /datum/objective/cain_agenda/guardian1()
	player.objectives += new /datum/objective/cain_agenda/guardian2()

/datum/antagonist/cain_agenda_guardian/greet(datum/mind/player)
	// Basic intro text.
	to_chat(player.current, SPAN_DANGER(FONT_LARGE("YOUR MEMO IS [role_text]!")))

	if(leader_welcome_text && player == leader)
		to_chat(player.current, SPAN_CLASS("antagdesc", "[get_leader_welcome_text(player.current)]"))
	else
		to_chat(player.current, SPAN_CLASS("antagdesc", "[get_welcome_text(player.current)]"))
		to_chat(player.current, get_antag_text(player.current))

	to_chat(player.current, SPAN_NOTICE("Во время раунда попытайся сделать следующее:"))

	var/obj_count = 1
	for(var/datum/objective/objective in player.objectives)
		to_chat(player.current, "<B>Кредо #[obj_count]</B>: [objective.explanation_text]")
		obj_count++
	return 1

/datum/objective/cain_agenda/guardian1
	explanation_text = "Защити своих людей"
/datum/objective/cain_agenda/guardian2
	explanation_text = "Не оставь никого позади"

/datum/antagonist/cain_agenda_loner
	id = MODE_AGENDA_LONER
	flags = ANTAG_RANDOM_EXCEPTED
	role_text = "LONER AGENDA"
	role_text_plural = "LONER AGENDA"
	antaghud_indicator = "hud_traitor"
	antag_text = "Никто не сделает эту работу лучше тебя."
	welcome_text = {"Твоя <b><span style="color: yellow;">АГЕНДА</span></b> на сегодня: <b>ОДИНОЧКА</b>!"}

	blacklisted_jobs = list()
	skill_setter = null
	min_player_age = 0

	no_prior_faction = TRUE

/datum/antagonist/cain_agenda_loner/create_objectives(datum/mind/player)
	if(!..())
		return
	player.objectives += new /datum/objective/cain_agenda/loner1()
	player.objectives += new /datum/objective/cain_agenda/loner2()

/datum/antagonist/cain_agenda_loner/greet(datum/mind/player)
	// Basic intro text.
	to_chat(player.current, SPAN_DANGER(FONT_LARGE("YOUR MEMO IS [role_text]!")))

	if(leader_welcome_text && player == leader)
		to_chat(player.current, SPAN_CLASS("antagdesc", "[get_leader_welcome_text(player.current)]"))
	else
		to_chat(player.current, SPAN_CLASS("antagdesc", "[get_welcome_text(player.current)]"))
		to_chat(player.current, get_antag_text(player.current))

	to_chat(player.current, SPAN_NOTICE("Во время раунда попытайся сделать следующее:"))

	var/obj_count = 1
	for(var/datum/objective/objective in player.objectives)
		to_chat(player.current, "<B>Кредо #[obj_count]</B>: [objective.explanation_text]")
		obj_count++
	return 1

/datum/objective/cain_agenda/loner1
	explanation_text = "Продемонстрируй своё превосходство"
/datum/objective/cain_agenda/loner2
	explanation_text = "Покажи настоящего себя"

/datum/antagonist/cain_agenda_hardliner
	id = MODE_AGENDA_HARDLINER
	flags = ANTAG_RANDOM_EXCEPTED
	role_text = "HARDLINER AGENDA"
	role_text_plural = "HARDLINER AGENDA"
	antaghud_indicator = "hud_traitor"
	antag_text = "Меньше думай - больше делай."
	welcome_text = {"Твоя <b><span style="color: yellow;">АГЕНДА</span></b> на сегодня: <b>ПОДЧИНЁННЫЙ</b>!"}

	blacklisted_jobs = list()
	skill_setter = null
	min_player_age = 0

	no_prior_faction = TRUE

/datum/antagonist/cain_agenda_hardliner/create_objectives(datum/mind/player)
	if(!..())
		return
	player.objectives += new /datum/objective/cain_agenda/hardliner1()
	player.objectives += new /datum/objective/cain_agenda/hardliner2()

/datum/antagonist/cain_agenda_hardliner/greet(datum/mind/player)
	// Basic intro text.
	to_chat(player.current, SPAN_DANGER(FONT_LARGE("YOUR MEMO IS [role_text]!")))

	if(leader_welcome_text && player == leader)
		to_chat(player.current, SPAN_CLASS("antagdesc", "[get_leader_welcome_text(player.current)]"))
	else
		to_chat(player.current, SPAN_CLASS("antagdesc", "[get_welcome_text(player.current)]"))
		to_chat(player.current, get_antag_text(player.current))

	to_chat(player.current, SPAN_NOTICE("Во время раунда попытайся сделать следующее:"))

	var/obj_count = 1
	for(var/datum/objective/objective in player.objectives)
		to_chat(player.current, "<B>Кредо #[obj_count]</B>: [objective.explanation_text]")
		obj_count++
	return 1

/datum/objective/cain_agenda/hardliner1
	explanation_text = "Беспрекословно следуй приказам"
/datum/objective/cain_agenda/hardliner2
	explanation_text = "Продемонстрируй собственное мнение"

/datum/antagonist/cain_agenda_torch
	id = MODE_AGENDA_TORCH
	flags = ANTAG_RANDOM_EXCEPTED
	role_text = "TORCH AGENDA"
	role_text_plural = "TORCH AGENDA"
	antaghud_indicator = "hud_traitor"
	antag_text = "Каким бы тёмным тоннель не был - ты всегда найдёшь в нём путь."
	welcome_text = {"Твоя <b><span style="color: yellow;">АГЕНДА</span></b> на сегодня: <b>ФАКЕЛ</b>!"}

	blacklisted_jobs = list()
	skill_setter = null
	min_player_age = 0

	no_prior_faction = TRUE

/datum/antagonist/cain_agenda_torch/create_objectives(datum/mind/player)
	if(!..())
		return
	player.objectives += new /datum/objective/cain_agenda/torch1()
	player.objectives += new /datum/objective/cain_agenda/torch2()

/datum/antagonist/cain_agenda_torch/greet(datum/mind/player)
	// Basic intro text.
	to_chat(player.current, SPAN_DANGER(FONT_LARGE("YOUR MEMO IS [role_text]!")))

	if(leader_welcome_text && player == leader)
		to_chat(player.current, SPAN_CLASS("antagdesc", "[get_leader_welcome_text(player.current)]"))
	else
		to_chat(player.current, SPAN_CLASS("antagdesc", "[get_welcome_text(player.current)]"))
		to_chat(player.current, get_antag_text(player.current))

	to_chat(player.current, SPAN_NOTICE("Во время раунда попытайся сделать следующее:"))

	var/obj_count = 1
	for(var/datum/objective/objective in player.objectives)
		to_chat(player.current, "<B>Кредо #[obj_count]</B>: [objective.explanation_text]")
		obj_count++
	return 1

/datum/objective/cain_agenda/torch1
	explanation_text = "Заставь людей идти за собой"
/datum/objective/cain_agenda/torch2
	explanation_text = "Позволь другому перехватить контроль"

/datum/antagonist/cain_agenda_songbird
	id = MODE_AGENDA_SONGBIRD
	flags = ANTAG_RANDOM_EXCEPTED
	role_text = "SONGBIRD AGENDA"
	role_text_plural = "SONGBIRD AGENDA"
	antaghud_indicator = "hud_traitor"
	antag_text = "Заставь других плесать под твою дудку. В конечном счёте, разве они годятся на что-то помимо выполнения твоих хотелок?"
	welcome_text = {"Твоя <b><span style="color: yellow;">АГЕНДА</span></b> на сегодня: <b>СОЛОВЕЙ</b>!"}

	blacklisted_jobs = list()
	skill_setter = null
	min_player_age = 0

	no_prior_faction = TRUE

/datum/antagonist/cain_agenda_songbird/create_objectives(datum/mind/player)
	if(!..())
		return
	player.objectives += new /datum/objective/cain_agenda/songbird1()
	player.objectives += new /datum/objective/cain_agenda/songbird2()

/datum/antagonist/cain_agenda_songbird/greet(datum/mind/player)
	// Basic intro text.
	to_chat(player.current, SPAN_DANGER(FONT_LARGE("YOUR MEMO IS [role_text]!")))

	if(leader_welcome_text && player == leader)
		to_chat(player.current, SPAN_CLASS("antagdesc", "[get_leader_welcome_text(player.current)]"))
	else
		to_chat(player.current, SPAN_CLASS("antagdesc", "[get_welcome_text(player.current)]"))
		to_chat(player.current, get_antag_text(player.current))

	to_chat(player.current, SPAN_NOTICE("Во время раунда попытайся сделать следующее:"))

	var/obj_count = 1
	for(var/datum/objective/objective in player.objectives)
		to_chat(player.current, "<B>Кредо #[obj_count]</B>: [objective.explanation_text]")
		obj_count++
	return 1

/datum/objective/cain_agenda/songbird1
	explanation_text = "Заставь другого человека выполнить какую-то работу за тебя"
/datum/objective/cain_agenda/songbird2
	explanation_text = "Сделай что-то самоотверженное"

/datum/antagonist/cain_agenda_scum
	id = MODE_AGENDA_SCUM
	flags = ANTAG_RANDOM_EXCEPTED
	role_text = "SCUM AGENDA"
	role_text_plural = "SCUM AGENDA"
	antaghud_indicator = "hud_traitor"
	antag_text = "Есть ли дно ниже этого?"
	welcome_text = {"Твоя <b><span style="color: yellow;">АГЕНДА</span></b> на сегодня: <b>ОТБРОС</b>!"}

	blacklisted_jobs = list()
	skill_setter = null
	min_player_age = 0

	no_prior_faction = TRUE

/datum/antagonist/cain_agenda_scum/create_objectives(datum/mind/player)
	if(!..())
		return
	player.objectives += new /datum/objective/cain_agenda/scum1()
	player.objectives += new /datum/objective/cain_agenda/scum2()

/datum/antagonist/cain_agenda_scum/greet(datum/mind/player)
	// Basic intro text.
	to_chat(player.current, SPAN_DANGER(FONT_LARGE("YOUR MEMO IS [role_text]!")))

	if(leader_welcome_text && player == leader)
		to_chat(player.current, SPAN_CLASS("antagdesc", "[get_leader_welcome_text(player.current)]"))
	else
		to_chat(player.current, SPAN_CLASS("antagdesc", "[get_welcome_text(player.current)]"))
		to_chat(player.current, get_antag_text(player.current))

	to_chat(player.current, SPAN_NOTICE("Во время раунда попытайся сделать следующее:"))

	var/obj_count = 1
	for(var/datum/objective/objective in player.objectives)
		to_chat(player.current, "<B>Кредо #[obj_count]</B>: [objective.explanation_text]")
		obj_count++
	return 1

/datum/objective/cain_agenda/scum1
	explanation_text = "Продемонстрируй, почему нет никого хуже тебя"
/datum/objective/cain_agenda/scum2
	explanation_text = "Опусти кого-то до своего уровня"

#include "..\maps\aaaa_facility.dmm"
