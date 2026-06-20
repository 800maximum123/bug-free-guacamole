
/proc/generate_junkyard_name()
	return "[rand(100,999)]"

/area
	var/junkyard_area = FALSE // true if the area belongs to a yard.
	var/assigned_junkyard = null

/obj/overmap/visitable/sector/junkyard
	name = "junkyard"
	icon_state = "junkyard"
	sector_flags = OVERMAP_SECTOR_KNOWN
	sensor_visibility = 60
	var/area/junkyard_area

	var/maxx
	var/maxy
	var/landmark_type = /obj/shuttle_landmark/automatic

	var/list/rock_colors = list(COLOR_ASTEROID_ROCK)

	var/list/possible_themes = list(
		/datum/junkyard = 100,
		)
	var/list/themes = list()

	var/list/map_generators = list()

	//Flags deciding what features to pick
	var/ruin_tags_whitelist
	var/ruin_tags_blacklist
	var/features_budget = 5
	var/list/possible_features = list()
	var/list/spawned_features

/obj/overmap/visitable/sector/junkyard/New(nloc, max_x, max_y)
	if (!GLOB.using_map.use_overmap)
		return

	maxx = max_x ? max_x : world.maxx
	maxy = max_y ? max_y : world.maxy

	var/junkyard_name = generate_junkyard_name()
	name = "[name]-[junkyard_name]"

	junkyard_area = new junkyard_area()
	GLOB.using_map.area_purity_test_exempt_areas += junkyard_area.type
	junkyard_area.name = "[name]-[junkyard_name]"

	INCREMENT_WORLD_Z_SIZE
	forceMove(locate(1,1,world.maxz))

	if (LAZYLEN(possible_themes))
		var/datum/junkyard/T = pick(possible_themes)
		themes += new T
		possible_themes -= T

	for (var/datum/junkyard/T in themes)
		if (T.ruin_tags_whitelist)
			ruin_tags_whitelist |= T.ruin_tags_whitelist
		if (T.ruin_tags_blacklist)
			ruin_tags_blacklist |= T.ruin_tags_blacklist

	for (var/T in subtypesof(/datum/map_template/ruin/junkyard))
		var/datum/map_template/ruin/junkyard/ruin = T
		if (initial(ruin.template_flags) & TEMPLATE_FLAG_RUIN_STARTS_DISALLOWED)
			continue
		if (ruin_tags_whitelist && !(ruin_tags_whitelist & initial(ruin.ruin_tags)))
			continue
		if (ruin_tags_blacklist & initial(ruin.ruin_tags))
			continue
		possible_features += new ruin
	..()

/obj/overmap/visitable/sector/junkyard/proc/build_level()
	generate_map()
	generate_features()
	for(var/datum/junkyard/T in themes)
		T.after_map_generation(src)
	generate_landing(2)
	START_PROCESSING(SSobj, src)

/obj/overmap/visitable/sector/junkyard/proc/generate_map()
	for (var/datum/junkyard/T in themes)
		T.before_map_generation(src)
	for (var/zlevel in map_z)
		var/list/edges
		edges += block(locate(1, 1, zlevel), locate(TRANSITIONEDGE, maxy, zlevel))
		edges |= block(locate(maxx-TRANSITIONEDGE, 1, zlevel),locate(maxx, maxy, zlevel))
		edges |= block(locate(1, 1, zlevel), locate(maxx, TRANSITIONEDGE, zlevel))
		edges |= block(locate(1, maxy-TRANSITIONEDGE, zlevel),locate(maxx, maxy, zlevel))
		for (var/turf/T in edges)
			T.ChangeTurf(/turf/simulated/junkyard_edge)
		for (var/map_type in map_generators)
			new map_type(null,1,1,zlevel,maxx,maxy,0,1,1,junkyard_area)

/obj/overmap/visitable/sector/junkyard/proc/generate_features()
	spawned_features = seedRuins(map_z, features_budget, possible_features, /area/junkyard, maxx, maxy)

/obj/landmark/junkyard_spawn/Initialize()
	..()
	return INITIALIZE_HINT_LATELOAD

//Tries to generate num landmarks, but avoids repeats.
/obj/overmap/visitable/sector/junkyard/proc/generate_landing(num = 1)
	var/places = list()
	var/attempts = 30*num
	var/new_type = landmark_type
	while(num)
		attempts--
		var/turf/T = locate(rand(TRANSITIONEDGE + LANDING_ZONE_RADIUS, maxx - TRANSITIONEDGE - LANDING_ZONE_RADIUS), rand(TRANSITIONEDGE + LANDING_ZONE_RADIUS, maxy - TRANSITIONEDGE - LANDING_ZONE_RADIUS),map_z[length(map_z)])
		if (!T || (T in places) || T.density) // Don't allow two landmarks on one turf, and don't use a dense turf.
			continue
		if (attempts >= 0) // While we have the patience, try to find better spawn points. If out of patience, put them down wherever, so long as there are no repeats.
			var/valid = TRUE
			var/list/block_to_check = block(locate(T.x - LANDING_ZONE_RADIUS, T.y - LANDING_ZONE_RADIUS, T.z), locate(T.x + LANDING_ZONE_RADIUS, T.y + LANDING_ZONE_RADIUS, T.z))
			for (var/turf/check in block_to_check)
				if (!istype(get_area(check), /area/junkyard) || check.turf_flags & TURF_FLAG_NORUINS)
					valid = FALSE
					break
			if (attempts >= 10)
				if (check_collision(T.loc, block_to_check)) //While we have lots of patience, ensure landability
					valid = FALSE
			else //Running out of patience, but would rather not clear ruins, so switch to clearing landmarks and bypass landability check
				new_type = /obj/shuttle_landmark/automatic/clearing

			if (!valid)
				continue

		num--
		places += T
		new new_type(T)

/obj/overmap/visitable/sector/junkyard/get_scan_data(mob/user)
	. = ..()
	var/list/extra_data = list()

	if (LAZYLEN(spawned_features) && user.skill_check(SKILL_SCIENCE, SKILL_TRAINED))
		var/ruin_num = 0
		for (var/datum/map_template/ruin/junkyard/R in spawned_features)
			if (!(R.ruin_tags & RUIN_NATURAL))
				ruin_num++
		if (ruin_num)
			extra_data += "<br>[ruin_num] possible artificial structure\s detected."

	for (var/datum/junkyard/T in themes)
		if (T.get_sensor_data())
			extra_data += T.get_sensor_data()
	. += jointext(extra_data, "<br>")

/area/junkyard
	name = "\improper Junkyard"
	ambience = list('sound/ambience/ambispace1.ogg','sound/ambience/ambispace2.ogg','sound/ambience/ambispace3.ogg','sound/ambience/ambispace4.ogg','sound/ambience/ambispace5.ogg')
	always_unpowered = TRUE
	area_flags = AREA_FLAG_EXTERNAL
	junkyard_area = TRUE

	has_gravity = FALSE

//Special world edge turf

/turf/simulated/junkyard_edge
	name = "world's edge"
	desc = "Government didn't want you to see this!"
	density = TRUE
	blocks_air = TRUE
	dynamic_lighting = FALSE
	icon = null
	icon_state = null
	permit_ao = FALSE

/turf/simulated/junkyard_edge/Initialize()
	. = ..()
	var/obj/overmap/visitable/sector/junkyard/E = map_sectors["[z]"]
	if(!istype(E))
		return
	var/nx = x
	if (x <= TRANSITIONEDGE)
		nx = x + (E.maxx - 2*TRANSITIONEDGE) - 1
	else if (x >= (E.maxx - TRANSITIONEDGE))
		nx = x - (E.maxx  - 2*TRANSITIONEDGE) + 1

	var/ny = y
	if(y <= TRANSITIONEDGE)
		ny = y + (E.maxy - 2*TRANSITIONEDGE) - 1
	else if (y >= (E.maxy - TRANSITIONEDGE))
		ny = y - (E.maxy - 2*TRANSITIONEDGE) + 1

	var/turf/NT = locate(nx, ny, z)
	if(NT)
		vis_contents = list(NT)

	//Need to put a mouse-opaque overlay there to prevent people turning/shooting towards ACTUAL location of vis_content things
	var/obj/overlay/O = new(src)
	O.mouse_opacity = 2
	O.name = "distant terrain"
	O.desc = "You need to come over there to take a better look."

/turf/simulated/junkyard_edge/Bumped(atom/movable/A)
	. = ..()
	var/obj/overmap/visitable/sector/junkyard/E = map_sectors["[z]"]
	if(!istype(E))
		return
	if(E.junkyard_area && istype(loc, world.area))
		ChangeArea(src, E.junkyard_area)
	var/new_x = A.x
	var/new_y = A.y
	if(x <= TRANSITIONEDGE)
		new_x = E.maxx - TRANSITIONEDGE - 1
	else if (x >= (E.maxx - TRANSITIONEDGE))
		new_x = TRANSITIONEDGE + 1
	else if (y <= TRANSITIONEDGE)
		new_y = E.maxy - TRANSITIONEDGE - 1
	else if (y >= (E.maxy - TRANSITIONEDGE))
		new_y = TRANSITIONEDGE + 1

	var/turf/T = locate(new_x, new_y, A.z)
	if(T && !T.density)
		A.forceMove(T)
		if(isliving(A))
			var/mob/living/L = A
			if(L.pulling)
				var/atom/movable/AM = L.pulling
				AM.forceMove(T)
