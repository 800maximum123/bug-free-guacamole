//quality code theft -- Remap, GTC - Grand Theft Code
/obj/overmap/visitable/sector/desertplanet
	name = "desert planet"
	desc = "An empty looking deserted world with a minimum activity indication."
	sector_flags = OVERMAP_SECTOR_KNOWN
	icon_state = "hoxxes"
	initial_generic_waypoints = list(
		"nav_dead_sea_1",
		"nav_dead_sea_2",
		"nav_dead_sea_3"
	)
	var/list/lightmain

/obj/overmap/visitable/sector/desertplanet/Initialize()
    ..()

    lightmain = block(locate(world.maxx, world.maxy, max(map_z)), locate(1, 1, min(map_z)))
    for(var/atom/A as anything in lightmain)
        if(!istype(A.loc, /area/map_template/dead_sea/surface) || A.density || istype(A.loc, /area/map_template/dead_sea/underground))
            lightmain -= A
    update_daynight()

/obj/overmap/visitable/sector/desertplanet/proc/update_daynight(light = 1.7, light_color_m = "#f5dbb4")
    for(var/turf/T as anything in lightmain)
        T.set_light(1, light, l_color = light_color_m)

/obj/overmap/visitable/sector/dead_sea/New(nloc, max_x, max_y)
	name = "[generate_planet_name()], \a [name]"
	..()

/datum/map_template/ruin/away_site/dead_sea
	name = "Dead Sea"
	id = "awaysite_dead_sea"
	spawn_cost = 2
	description = "Two z-level map with n deserted planet and life-seeded underground caves"
	prefix = "mods/_fd/_maps/dead_sea/maps/"
	suffixes = list("dead_sea.dmm")
	generate_mining_by_z = list(1,2)
	area_usage_test_exempted_root_areas = list(/area/map_template/dead_sea)
	apc_test_exempt_areas = list(
		/area/map_template/dead_sea/underground = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/map_template/dead_sea/surface = NO_SCRUBBER|NO_VENT|NO_APC
	)

//This is ported from /vg/ and isn't entirely functional. If it sees a threat, it moves towards it, and then activates it's animation.
//At that point while it sees threats, it will remain in it's attack stage. It's a bug, but I figured it nerfs it enough to not be impossible to deal with
/mob/living/simple_animal/hostile/hive_alien/luminiscent_shark
	name = "luminiscent shark"
	desc = "."
	icon = 'mods/_fd/_maps/dead_sea/icons/luminiscent_shark.dmi'
	icon_state = "shark"
	icon_living = "shark"
	icon_dead = "shark_dead"
	light_power = 1
	light_range = 2
	light_color = COLOR_INDIGO
	move_to_delay = 2
	speed = 1
	health = 150
	maxHealth = 150
	can_escape = TRUE

	harm_intent_damage = 15
	natural_weapon = /obj/item/natural_weapon/shark_jaws
	ai_holder = /datum/ai_holder/simple_animal/melee/luminiscent_shark
	var/attack_mode = FALSE

	var/transformation_delay_min = 4
	var/transformation_delay_max = 8

/datum/ai_holder/simple_animal/melee/luminiscent_shark/lose_target()
	. = ..()
	var/mob/living/simple_animal/hostile/hive_alien/luminiscent_shark/D = holder
	if(D.attack_mode && !find_target()) //If we don't immediately find another target, switch to movement mode
		D.mode_movement()

	return ..()

/datum/ai_holder/simple_animal/melee/luminiscent_shark/lose_target()
	. = ..()
	var/mob/living/simple_animal/hostile/hive_alien/luminiscent_shark/D = holder
	if(D.attack_mode && !find_target()) //If we don't immediately find another target, switch to movement mode
		D.mode_movement()

	return ..()

/datum/ai_holder/simple_animal/melee/luminiscent_shark/engage_target()
	. = ..()
	var/mob/living/simple_animal/hostile/hive_alien/luminiscent_shark/D = holder
	if(!D.attack_mode)
		return D.mode_attack()

	flick("luminiscent_shark_attacking", src)

	return ..()
/obj/item/natural_weapon/shark_jaws
	name = "jaws"
	attack_verb = list("ripped")
	force = 10
	edge = TRUE
	hitsound = 'sound/weapons/slash.ogg'

/mob/living/simple_animal/hostile/hive_alien/luminiscent_shark/proc/mode_movement() //Slightly broken, but it's alien and unpredictable so w/e
	set waitfor = 0
	icon_state = "shark"
	flick("luminiscent_shark_movemode", src)
	sleep(rand(transformation_delay_min, transformation_delay_max))
	anchored = FALSE
	speed = 1
	move_to_delay = 8
	. = FALSE

	//Immediately find a target so that we're not useless for 1 Life() tick!
	ai_holder.find_target()

/mob/living/simple_animal/hostile/hive_alien/luminiscent_shark/proc/mode_attack()
	set waitfor = 0
	icon_state = "shark"
	flick("luminiscent_shark_attackmode", src)
	sleep(rand(transformation_delay_min, transformation_delay_max))
	anchored = TRUE
	speed = 0
	attack_mode = TRUE
	walk(src, 0)

/mob/living/simple_animal/hostile/hive_alien/luminiscent_shark/wounded
	name = "wounded luminiscent_shark"
	health = 75
	can_escape = FALSE

//This is ported from /vg/ and isn't entirely functional. If it sees a threat, it moves towards it, and then activates it's animation.
//At that point while it sees threats, it will remain in it's attack stage. It's a bug, but I figured it nerfs it enough to not be impossible to deal with
/mob/living/simple_animal/hostile/hive_alien/deepwater_lurker
	name = "deepwater lurker"
	desc = "."
	icon = 'mods/_fd/_maps/dead_sea/icons/deepwater_lurker.dmi'
	icon_state = "lurker"
	icon_living = "lurker"
	icon_dead = "lurker_dead"
	light_power = 1
	light_range = 3
	light_color = COLOR_CYAN
	move_to_delay = 2
	speed = 1
	health = 300
	maxHealth = 300
	can_escape = TRUE

	harm_intent_damage = 20
	natural_weapon = /obj/item/natural_weapon/tentacle
	ai_holder = /datum/ai_holder/simple_animal/melee/deepwater_lurker
	var/attack_mode = FALSE

	var/transformation_delay_min = 4
	var/transformation_delay_max = 8

/datum/ai_holder/simple_animal/melee/deepwater_lurker/lose_target()
	. = ..()
	var/mob/living/simple_animal/hostile/hive_alien/deepwater_lurker/D = holder
	if(D.attack_mode && !find_target()) //If we don't immediately find another target, switch to movement mode
		D.mode_movement()

	return ..()

/datum/ai_holder/simple_animal/melee/deepwater_lurker/lose_target()
	. = ..()
	var/mob/living/simple_animal/hostile/hive_alien/deepwater_lurker/D = holder
	if(D.attack_mode && !find_target()) //If we don't immediately find another target, switch to movement mode
		D.mode_movement()

	return ..()

/datum/ai_holder/simple_animal/melee/deepwater_lurker/engage_target()
	. = ..()
	var/mob/living/simple_animal/hostile/hive_alien/deepwater_lurker/D = holder
	if(!D.attack_mode)
		return D.mode_attack()

	flick("deepwater_lurker_attacking", src)

	return ..()
/obj/item/natural_weapon/tentacle
	name = "tentacles"
	attack_verb = list("hit")
	force = 30
	edge = TRUE
	hitsound = 'sound/weapons/slash.ogg'

/mob/living/simple_animal/hostile/hive_alien/deepwater_lurker/proc/mode_movement() //Slightly broken, but it's alien and unpredictable so w/e
	set waitfor = 0
	icon_state = "lurker"
	flick("deepwater_lurker_movemode", src)
	sleep(rand(transformation_delay_min, transformation_delay_max))
	anchored = FALSE
	speed = 1
	move_to_delay = 8
	. = FALSE

	//Immediately find a target so that we're not useless for 1 Life() tick!
	ai_holder.find_target()

/mob/living/simple_animal/hostile/hive_alien/deepwater_lurker/proc/mode_attack()
	set waitfor = 0
	icon_state = "lurker"
	flick("deepwater_lurker_attackmode", src)
	sleep(rand(transformation_delay_min, transformation_delay_max))
	anchored = TRUE
	speed = 0
	attack_mode = TRUE
	walk(src, 0)

/mob/living/simple_animal/hostile/hive_alien/deepwater_lurker/wounded
	name = "wounded deepwater_lurker"
	health = 100
	can_escape = FALSE

//This is ported from /vg/ and isn't entirely functional. If it sees a threat, it moves towards it, and then activates it's animation.
//At that point while it sees threats, it will remain in it's attack stage. It's a bug, but I figured it nerfs it enough to not be impossible to deal with
/mob/living/simple_animal/hostile/hive_alien/deepwater_dweller
	name = "deepwater dweller"
	desc = "."
	icon = 'mods/_fd/_maps/dead_sea/icons/dead_sea.dmi'
	icon_state = "dweller"
	icon_living = "dweller"
	icon_dead = "dweller_dead"
	light_power = 1
	light_range = 2
	light_color = COLOR_PINK
	move_to_delay = 2
	speed = 1
	health = 80
	maxHealth = 80
	can_escape = TRUE

	harm_intent_damage = 10
	natural_weapon = /obj/item/natural_weapon/dweller_tail
	ai_holder = /datum/ai_holder/simple_animal/melee/deepwater_dweller
	var/attack_mode = FALSE

	var/transformation_delay_min = 4
	var/transformation_delay_max = 8

/datum/ai_holder/simple_animal/melee/deepwater_dweller/lose_target()
	. = ..()
	var/mob/living/simple_animal/hostile/hive_alien/deepwater_dweller/D = holder
	if(D.attack_mode && !find_target()) //If we don't immediately find another target, switch to movement mode
		D.mode_movement()

	return ..()

/datum/ai_holder/simple_animal/melee/deepwater_dweller/lose_target()
	. = ..()
	var/mob/living/simple_animal/hostile/hive_alien/deepwater_dweller/D = holder
	if(D.attack_mode && !find_target()) //If we don't immediately find another target, switch to movement mode
		D.mode_movement()

	return ..()

/datum/ai_holder/simple_animal/melee/deepwater_dweller/engage_target()
	. = ..()
	var/mob/living/simple_animal/hostile/hive_alien/deepwater_dweller/D = holder
	if(!D.attack_mode)
		return D.mode_attack()

	flick("deepwater_dweller_attacking", src)

	return ..()
/obj/item/natural_weapon/dweller_tail
	name = "dweller's tail"
	attack_verb = list("swinged")
	force = 10
	edge = TRUE
	hitsound = 'sound/weapons/slash.ogg'

/mob/living/simple_animal/hostile/hive_alien/deepwater_dweller/proc/mode_movement() //Slightly broken, but it's alien and unpredictable so w/e
	set waitfor = 0
	icon_state = "dweller"
	flick("deepwater_dweller_movemode", src)
	sleep(rand(transformation_delay_min, transformation_delay_max))
	anchored = FALSE
	speed = 1
	move_to_delay = 8
	. = FALSE

	//Immediately find a target so that we're not useless for 1 Life() tick!
	ai_holder.find_target()

/mob/living/simple_animal/hostile/hive_alien/deepwater_dweller/proc/mode_attack()
	set waitfor = 0
	icon_state = "dweller"
	flick("deepwater_dweller_attackmode", src)
	sleep(rand(transformation_delay_min, transformation_delay_max))
	anchored = TRUE
	speed = 0
	attack_mode = TRUE
	walk(src, 0)

/mob/living/simple_animal/hostile/hive_alien/deepwater_dweller/wounded
	name = "wounded deepwater_dweller"
	health = 40
	can_escape = FALSE


/obj/shuttle_landmark/nav_dead_sea_1
	name = "Desert Landing Point #1"
	landmark_tag = "nav_dead_sea_1"
	base_area = /area/map_template/dead_sea/surface

/obj/shuttle_landmark/nav_dead_sea_2
	name = "Desert Landing Point #2"
	landmark_tag = "nav_dead_sea_2"
	base_area = /area/map_template/dead_sea/surface

/obj/shuttle_landmark/nav_dead_sea_3
	name = "Desert Landing Point #3"
	landmark_tag = "nav_dead_sea_3"
	base_area = /area/map_template/dead_sea/surface

/turf/simulated/floor/exoplanet/dead_sea
	name = "dried ocean surface"
	desc = "Scorched and racked sandy surface."
	icon = 'mods/_fd/_maps/dead_sea/icons/dead_sea.dmi'
	icon_state = "seafloor"
	dirt_color = "#ae9e66"
	footstep_type = /singleton/footsteps/sand
	temperature = 321

/turf/simulated/floor/exoplanet/dead_sea_under
	name = "cave ocean surface"
	desc = "Solid, rocky and slippery underwater surface."
	icon = 'mods/_fd/_maps/dead_sea/icons/dead_sea.dmi'
	movement_delay = 12
	footstep_type = /singleton/footsteps/water
	icon_state = "seafloor_under"
	temperature = 288

/obj/structure/flora/tree/dead_watercourse
	name = "stoned watercourse"
	desc = "Long ago stoned big ocean watercourse."
	icon = 'mods/_fd/_maps/dead_sea/icons/dead_sea_plants.dmi'
	icon_state = "dead_watercourse"

/obj/structure/flora/tree/dead_watercourse/New()
	..()
	icon_state = "dead_watercourse_[rand(1, 4)]"

/obj/structure/flora/ausbushes/dead_small_plants
	name = "dead stoned plants"
	icon = 'mods/_fd/_maps/dead_sea/icons/dead_sea.dmi'
	icon_state = "small_dead_plant"

/obj/structure/flora/ausbushes/dead_small_plants/New()
	..()
	icon_state = "small_dead_plant_[rand(1, 16)]"

/obj/structure/flora/ausbushes/dead_small_cacti
	name = "dead stoned cacti"
	icon = 'mods/_fd/_maps/dead_sea/icons/dead_sea.dmi'
	icon_state = "small_dead_cacti"

/obj/structure/flora/ausbushes/dead_small_cacti/New()
	..()
	icon_state = "small_dead_cacti_[rand(1, 3)]"

/obj/structure/flora/ausbushes/dead_small_flower
	name = "dead stoned flower"
	icon = 'mods/_fd/_maps/dead_sea/icons/dead_sea.dmi'
	icon_state = "small_dead_flower"

/obj/structure/flora/ausbushes/dead_small_cacti/New()
	..()
	icon_state = "small_dead_flower_[rand(1, 3)]"

/obj/floor_decal/rocks
	name = "rocks"
	icon = 'mods/_fd/_maps/dead_sea/icons/turf_decor.dmi'
	icon_state = "drought"


/obj/floor_decal/rocks/New()
	..()
	icon_state = "drought_[rand(2, 32)]"

/obj/structure/flora/ausbushes/redglow_plant
	name = "red-glowing plant"
	icon = 'mods/_fd/_maps/dead_sea/icons/dead_sea.dmi'
	icon_state = "fernybush"
	light_power = 1
	light_range = 3
	light_color = COLOR_RED_LIGHT

/obj/structure/flora/ausbushes/redglow_plant/New()
	..()
	icon_state = "fernybush_[rand(1, 3)]"

/obj/structure/flora/tree/crystal_tree
	name = "crystal tree"
	desc = "Tall, glowing, maybe even organic... Extremely weird-looking underwater tree."
	icon = 'mods/_fd/_maps/dead_sea/icons/crystal_tree.dmi'
	icon_state = "gem"
	light_power = 1
	light_range = 8
	light_color = COLOR_CYAN

/obj/structure/flora/ausbushes/purple_bush
	name = "purple-glowing bush"
	icon = 'mods/_fd/_maps/dead_sea/icons/dead_sea.dmi'
	icon_state = "purplebush"
	light_power = 1
	light_range = 3
	light_color = COLOR_VIOLET

/obj/structure/flora/ausbushes/purple_bush/New()
	..()
	icon_state = "purplebush_[rand(1, 2)]"

/obj/structure/flora/ausbushes/orange_shroom
	name = "orange-glowing shroom"
	icon = 'mods/_fd/_maps/dead_sea/icons/dead_sea.dmi'
	icon_state = "grib"
	light_power = 1
	light_range = 3
	light_color = COLOR_ORANGE

/obj/structure/flora/ausbushes/orange_shroom/New()
	..()
	icon_state = "grib_[rand(0, 1)]"

/obj/structure/flora/ausbushes/under_grass
	name = "underwater grass"
	icon = 'mods/_fd/_maps/dead_sea/icons/dead_sea.dmi'
	icon_state = "grass"

/obj/structure/flora/ausbushes/under_grass/New()
	..()
	icon_state = "grass_[rand(0, 8)]"

/obj/item/storage/wooden_barrel
  name = "Wooden barrel"
  desc = "Old barrel used as a storage for a variety of goods."
  icon = 'mods/_fd/_maps/dead_sea/icons/barrel.dmi'
  icon_state = "barrel"
  use_sound = 'sound/effects/closet_open.ogg'
  anchored = 1
  startswith = list()
  max_w_class = ITEM_SIZE_LARGE
  storage_slots = 10

/obj/structure/rib
	name = "giant rib"
	icon = 'mods/_fd/_maps/dead_sea/icons/bones.dmi'
	icon_state = "rib"
	anchored = 1

/obj/structure/giant_skull
	name = "giant skull"
	icon = 'mods/_fd/_maps/dead_sea/icons/bones.dmi'
	icon_state = "skull"
	anchored = 1

/obj/structure/half_skull
	name = "half of giant skull"
	icon = 'mods/_fd/_maps/dead_sea/icons/bones.dmi'
	icon_state = "skull-half"
	anchored = 1


/turf/simulated/planet_edge/dead_sea
    name = "world's edge"
    desc = "Government didn't want you to see this!"
    density = TRUE
    blocks_air = TRUE
    dynamic_lighting = FALSE
    icon = null
    icon_state = null
    permit_ao = FALSE

/turf/simulated/planet_edge/dead_sea
    name = "world's edge"
    desc = "Government didn't want you to see this!"
    density = TRUE
    blocks_air = TRUE
    dynamic_lighting = FALSE
    icon = null
    icon_state = null
    permit_ao = FALSE

/turf/simulated/planet_edge/dead_sea/Initialize()
    . = ..()
    var/obj/overmap/visitable/sector/E = map_sectors["[z]"]
    if(!istype(E))
        return
    var/nx = x
    if (x <= 51)
        nx = 148 - 1
    else if (x >= 148)
        nx = 51 + 1

    var/ny = y
    if(y <= 51)
        ny = 148 - 1
    else if (y >= 148)
        ny = 51 + 1

    var/turf/NT = locate(nx, ny, z)
    if(NT)
        vis_contents = list(NT)

    //Need to put a mouse-opaque overlay there to prevent people turning/shooting towards ACTUAL location of vis_content things
    var/obj/overlay/O = new(src)
    O.mouse_opacity = 2
    O.name = "distant terrain"
    O.desc = "You need to come over there to take a better look."

/turf/simulated/planet_edge/dead_sea/Bumped(atom/movable/A)
    . = ..()
    var/obj/overmap/visitable/sector/E = map_sectors["[z]"]
    if(!istype(E))
        return
    var/new_x = A.x
    var/new_y = A.y
    if(x <= 51)
        new_x = 148 - 1
    else if (x >= 148)
        new_x = 51 + 1
    else if (y <= 51)
        new_y = 148 - 1
    else if (y >= 148)
        new_y = 51 + 1

    var/turf/T = locate(new_x, new_y, A.z)
    if(T && !T.density)
        A.forceMove(T)
        if(isliving(A))
            var/mob/living/L = A
            if(L.pulling)
                var/atom/movable/AM = L.pulling
                AM.forceMove(T)