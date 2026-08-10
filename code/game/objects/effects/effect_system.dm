/* This is an attempt to make some easily reusable "particle" type effect, to stop the code
constantly having to be rewritten. An item like the jetpack that uses the ion_trail_follow system, just has one
defined, then set up when it is created with New(). Then this same system can just be reused each time
it needs to create more trails.A beaker could have a steam_trail_follow system set up, then the steam
would spawn and follow the beaker, even if it is carried or thrown.
*/


/obj/effect
	name = "effect"
	icon = 'icons/effects/effects.dmi'
	mouse_opacity = 0
	unacidable = TRUE
	pass_flags = PASS_FLAG_TABLE | PASS_FLAG_GRILLE

/datum/effect
	var/number = 3
	var/cardinals = 0
	var/turf/location
	var/atom/holder
	var/setup = 0

/datum/effect/proc/set_up(n = 3, c = 0, turf/loc)
	if(n > 10)
		n = 10
	number = n
	cardinals = c
	location = loc
	setup = 1

/datum/effect/proc/attach(atom/atom)
	holder = atom

/datum/effect/proc/start()

/datum/effect/proc/spread()


/////////////////////////////////////////////
// GENERIC STEAM SPREAD SYSTEM

//Usage: set_up(number of bits of steam, use North/South/East/West only, spawn location)
// The attach(atom/atom) proc is optional, and can be called to attach the effect
// to something, like a smoking beaker, so then you can just call start() and the steam
// will always spawn at the items location, even if it's moved.

/* Example:
	var/datum/effect/steam_spread/steam = new /datum/effect/steam_spread() -- creates new system
	steam.set_up(5, 0, mob.loc) -- sets up variables
	OPTIONAL: steam.attach(mob)
	steam.start() -- spawns the effect
*/
/////////////////////////////////////////////
/obj/effect/steam
	name = "steam"
	icon = 'icons/effects/effects.dmi'
	icon_state = "extinguish"
	density = FALSE

/datum/effect/steam_spread

/datum/effect/steam_spread/set_up(n = 3, c = 0, turf/loc)
	if(n > 10)
		n = 10
	number = n
	cardinals = c
	location = loc

/datum/effect/steam_spread/start()
	var/i = 0
	for(i=0, i<src.number, i++)
		addtimer(new Callback(src, TYPE_PROC_REF(/datum/effect, spread), i), 0)

/datum/effect/steam_spread/spread(i)
	set waitfor = 0
	if(holder)
		src.location = get_turf(holder)
	var/obj/effect/steam/steam = new /obj/effect/steam(location)
	var/direction
	if(src.cardinals)
		direction = pick(GLOB.cardinal)
	else
		direction = pick(GLOB.alldirs)
	for(i=0, i<pick(1,2,3), i++)
		sleep(5)
		step(steam,direction)
	QDEL_IN(steam, 2 SECONDS)

/////////////////////////////////////////////
//SPARK SYSTEM (like steam system)
// The attach(atom/atom) proc is optional, and can be called to attach the effect
// to something, like the RCD, so then you can just call start() and the sparks
// will always spawn at the items location.
/////////////////////////////////////////////

/obj/sparks
	name = "sparks"
	icon_state = "sparks"
	icon = 'icons/effects/effects.dmi'
	var/amount = 6.0
	anchored = TRUE
	mouse_opacity = 0

/obj/sparks/New()
	..()
	playsound(src.loc, "sparks", 100, 1)
	var/turf/T = src.loc
	if (istype(T, /turf))
		T.hotspot_expose(1000,100)

/obj/sparks/Initialize()
	. = ..()
	QDEL_IN(src, 5 SECONDS)

/obj/sparks/Destroy()
	var/turf/T = src.loc
	if (istype(T, /turf))
		T.hotspot_expose(1000,100)
	return ..()

/obj/sparks/Move()
	..()
	var/turf/T = src.loc
	if (istype(T, /turf))
		T.hotspot_expose(1000,100)

/datum/effect/spark_spread

/datum/effect/spark_spread/set_up(n = 3, c = 0, loca)
	if(n > 10)
		n = 10
	number = n
	cardinals = c
	if(isturf(loca))
		location = loca
	else
		location = get_turf(loca)

/datum/effect/spark_spread/start()
	var/i = 0
	for(i=0, i<src.number, i++)
		addtimer(new Callback(src, TYPE_PROC_REF(/datum/effect, spread), i), 0)

/datum/effect/spark_spread/spread(i)
	set waitfor = 0
	if(holder)
		src.location = get_turf(holder)
	var/obj/sparks/sparks = new /obj/sparks(location)
	var/direction
	if(src.cardinals)
		direction = pick(GLOB.cardinal)
	else
		direction = pick(GLOB.alldirs)
	for(i=0, i<pick(1,2,3), i++)
		sleep(5)
		step(sparks,direction)

//and to shortcut all that
/proc/sparks(n = 3, c = 0, loca)
	RETURN_TYPE(/datum/effect/spark_spread)
	var/datum/effect/spark_spread/S = new
	S.set_up(n, c, loca)
	S.start()
	return S

/////////////////////////////////////////////
//// SMOKE SYSTEMS
// direct can be optinally added when set_up, to make the smoke always travel in one direction
// in case you wanted a vent to always smoke north for example
/////////////////////////////////////////////


/obj/effect/smoke
	name = "smoke"
	icon_state = "smoke"
	opacity = 1
	anchored = FALSE
	mouse_opacity = 0
	color = COLOR_GRAY
	var/amount = 6.0
	var/time_to_live = 1 MINUTE

	//Remove this bit to use the old smoke
	icon = 'icons/effects/96x96.dmi'
	pixel_x = -32
	pixel_y = -32

/obj/effect/smoke/Initialize()
	. = ..()
	addtimer(new Callback(src, PROC_REF(fade_out)), time_to_live)

/obj/effect/smoke/Crossed(mob/living/carbon/M as mob )
	..()
	if (can_air_affect(M))
		air_affect(M)
	if (can_skin_affect(M))
		skin_affect(M)

/obj/effect/smoke/Move()
	..()
	for(var/mob/living/carbon/M in get_turf(src))
		if (can_air_affect(M))
			air_affect(M)
		if (can_skin_affect(M))
			skin_affect(M)

/// Fades out the smoke smoothly using it's alpha variable.
/obj/effect/smoke/proc/fade_out(frames = 16)
	set_opacity(FALSE)
	frames = max(frames, 1) //We will just assume that by 0 frames, the coder meant "during one frame".
	var/alpha_step = round(alpha / frames)
	while(alpha > 0)
		alpha = max(0, alpha - alpha_step)
		sleep(world.tick_lag)
	qdel(src)

/obj/effect/smoke/proc/can_air_affect(mob/living/carbon/M)
	if (!istype(M))
		return FALSE
	if (M.isSynthetic())
		return FALSE
	if (HAS_FLAGS(M.wear_mask?.item_flags, ITEM_FLAG_BLOCK_GAS_SMOKE_EFFECT))
		return FALSE
	if (M.internal != null)
		if(M.wear_mask && (M.wear_mask.item_flags & ITEM_FLAG_AIRTIGHT))
			return FALSE
		if(istype(M,/mob/living/carbon/human))
			var/mob/living/carbon/human/H = M
			if(H.head && (H.head.item_flags & ITEM_FLAG_AIRTIGHT))
				return FALSE
		return FALSE
	return TRUE

/obj/effect/smoke/proc/can_skin_affect(mob/living/carbon/M)
	if (!istype(M))
		return FALSE
	// Are they protected by hazmat clothing?
	var/vuln = 1 - M.get_blocked_ratio(null, DAMAGE_TOXIN, damage_flags = DAMAGE_FLAG_BIO)
	if (vuln < 0.10)
		return FALSE
	return TRUE

/obj/effect/smoke/proc/air_affect(mob/living/carbon/M)
	return

/obj/effect/smoke/proc/skin_affect(mob/living/carbon/M)
	return

/obj/effect/smoke/yellow
	color = COLOR_YELLOW_GRAY

/obj/effect/smoke/blue
	color = COLOR_BLUE_GRAY

/obj/effect/smoke/red
	color = COLOR_RED_GRAY

/////////////////////////////////////////////
// Illumination
/////////////////////////////////////////////

/obj/effect/smoke/illumination
	name = "illumination"
	opacity = 0
	icon = 'icons/effects/effects.dmi'
	icon_state = "sparks"

/obj/effect/smoke/illumination/New(newloc, lifetime=10, range=null, power=null, color=null)
	set_light(range, power, color)
	time_to_live=lifetime
	..()

/obj/effect/smoke/illumination/flare
	name = "illumination"
	opacity = 0
	anchored = TRUE
	icon = null
	icon_state = null

/obj/effect/smoke/illumination/flare/New(newloc, lifetime=10, range=null, power=null, color=null)
	..()
	new/obj/particle_emitter/smoke(newloc, time_to_live)
	new/obj/particle_emitter/sparks_flare(newloc, time_to_live)


/////////////////////////////////////////////
// Bad smoke / White Phosphorus
/////////////////////////////////////////////

/obj/effect/smoke/bad
	color = COLOR_WHITE
	time_to_live = 2 MINUTES

/obj/effect/smoke/bad/air_affect(mob/living/carbon/human/R)
	R.adjustOxyLoss(3)
	if (R.coughedtime != 1)
		R.coughedtime = 1
		R.emote("cough")
		addtimer(new Callback(R, TYPE_PROC_REF(/mob/living/carbon, clear_coughedtime)), 2 SECONDS)
	R.updatehealth()
	return

/obj/effect/smoke/bad/skin_affect(mob/living/carbon/human/R)
	R.adjust_fire_stacks(1)
	if (prob(30))
		new /obj/sparks(R.loc)
		R.IgniteMob()
		R.visible_message(SPAN_WARNING("[R] catches fire from the smoke!"), SPAN_DANGER("You catch fire from the smoke!"))
	R.updatehealth()
	return

/obj/effect/smoke/bad/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
	if(air_group || (height==0)) return 1
	if(istype(mover, /obj/item/projectile/beam))
		var/obj/item/projectile/beam/B = mover
		B.damage = (B.damage/2)
	return 1

/////////////////////////////////////////////
// Sleep smoke
/////////////////////////////////////////////

/obj/effect/smoke/sleepy

/obj/effect/smoke/sleepy/air_affect(mob/living/carbon/M as mob )
	M:sleeping += 1
	if (M.coughedtime != 1)
		M.coughedtime = 1
		M.emote("cough")
		addtimer(new Callback(M, TYPE_PROC_REF(/mob/living/carbon, clear_coughedtime)), 2 SECONDS)

/////////////////////////////////////////////
// Mustard Gas
/////////////////////////////////////////////

/obj/effect/smoke/mustard
	name = "mustard gas"
	color = COLOR_YELLOW_GRAY
	time_to_live = 3 MINUTES

/obj/effect/smoke/mustard/Initialize()
	. = ..()
	set_extension(src, /datum/extension/scent/custom, "mustard", /singleton/scent_intensity/strong, SCENT_DESC_SMELL, world.view)

/obj/effect/smoke/mustard/air_affect(mob/living/carbon/human/R)
	R.adjustOxyLoss(rand(10, 15))
	if (R.coughedtime != 1)
		R.coughedtime = 1
		R.emote("gasp")
		to_chat(R, SPAN_DANGER("Your lungs burn!"))
		addtimer(new Callback(R, TYPE_PROC_REF(/mob/living/carbon, clear_coughedtime)), 2 SECONDS)
	R.updatehealth()
	return

/obj/effect/smoke/mustard/skin_affect(mob/living/carbon/human/R)
	R.contaminate()
	R.pl_effects()
	R.updatehealth()
	return

/////////////////////////////////////////////
// [GAIA] Thermobaric Gas
// Used in thermobaric missiles
// The cloud blows up when in contact with fire
/////////////////////////////////////////////

/obj/effect/smoke/thermobaric
	name = "thermobaric gas"
	color = COLOR_AMBER
	opacity = FALSE
	anchored = TRUE
	alpha = 50
	var/suffocation = 5
	var/fire_stacks = 15
	var/detonation_time = 1 SECONDS
	var/auto_detonate = TRUE
	var/blown_up = FALSE

/obj/effect/smoke/thermobaric/Initialize()
	. = ..()
	if(auto_detonate)
		addtimer(new Callback(src, PROC_REF(blow_up)), detonation_time)

/obj/effect/smoke/thermobaric/air_affect(mob/living/carbon/human/R)
	R.adjustOxyLoss(suffocation)
	if (R.coughedtime != 1)
		R.coughedtime = 1
		R.emote("gasp")
		to_chat(R, SPAN_DANGER("You smell harsh fuel!"))
		addtimer(new Callback(R, TYPE_PROC_REF(/mob/living/carbon, clear_coughedtime)), 2 SECONDS)
	R.updatehealth()
	return

/obj/effect/smoke/thermobaric/skin_affect(mob/living/carbon/human/R)
	R.adjust_fire_stacks(fire_stacks)
	R.updatehealth()
	return

/obj/effect/smoke/thermobaric/proc/blow_up()
	var/turf/location = src.loc
	if(location && !blown_up)
		blown_up = TRUE // Just in case
		location.hotspot_expose(1000,500,1)
		cell_explosion(location, 300, 50, shrapnel = FALSE, thermobaric = TRUE)
		for(var/mob/living/carbon/human/victim in location)
			victim.rupture_lung()
		qdel(src)

/////////////////////////////////////////////
// Smoke spread
/////////////////////////////////////////////

// TODO: Fix it not spreading sometimes fnr
/datum/effect/smoke_spread
	var/total_smoke = 0 // To stop it being spammed and lagging!
	var/direction
	var/smoke_type = /obj/effect/smoke
	var/range
	var/list/targetTurfs
	var/list/wallList
	var/density
	var/smokeVolume

/datum/effect/smoke_spread/set_up(n = 5, c = 0, loca, direct)
	if(n > 50)
		n = 50
	number = n
	cardinals = c
	smokeVolume = n
	range = n * 0.3
	if(isturf(loca))
		location = loca
	else
		location = get_turf(loca)
	if(direct)
		direction = direct
	if(!location)
		return

	targetTurfs = new()
	for(var/turf/T in view(range, location))
		if(sqrt((T.x - location.x)**2 + (T.y - location.y)**2) <= range)
			targetTurfs += T

	if(cardinals)
		var/list/cardinalTargets = new()
		for(var/turf/T in targetTurfs)
			if(T.x == location.x || T.y == location.y)
				cardinalTargets += T
		targetTurfs = cardinalTargets

	wallList = new()
	smokeFlow()
	density = max(1, length(targetTurfs) / 4)

/datum/effect/smoke_spread/start(sound = TRUE)
	if(!location)
		return
	if(sound)
		playsound(src.location, 'sound/effects/smoke_emit.ogg', 50, 1)

	var/smoke_duration = max(5, smokeVolume * 1.5 SECONDS)
	for(var/turf/T in targetTurfs)
		spawn(0)
			spawnSmoke(T, smoke_duration, range)

/datum/effect/smoke_spread/proc/spawnSmoke(turf/T, smoke_duration, dist = 1)
	var/obj/effect/smoke/smoke = new smoke_type(T)
	smoke.time_to_live = smoke_duration
	return smoke

/datum/effect/smoke_spread/proc/smokeFlow()
	var/list/pending = new()
	var/list/complete = new()

	pending += location

	while(length(pending))
		for(var/turf/current in pending)
			for(var/D in GLOB.cardinal)
				var/turf/target = get_step(current, D)
				if(wallList)
					if(istype(target, /turf/simulated/wall) && target != location)
						if(!(target in wallList))
							wallList += target
						continue

				if(target in pending)
					continue
				if(target in complete)
					continue
				if(!(target in targetTurfs))
					continue
				if(current.c_airblock(target) && target != location)
					continue
				if(target.c_airblock(current) && target != location)
					continue
				pending += target

			pending -= current
			complete += current

	targetTurfs = complete

	return

/datum/effect/smoke_spread/bad
	smoke_type = /obj/effect/smoke/bad

/datum/effect/smoke_spread/yellow
	smoke_type = /obj/effect/smoke/yellow

/datum/effect/smoke_spread/blue
	smoke_type = /obj/effect/smoke/blue

/datum/effect/smoke_spread/red
	smoke_type = /obj/effect/smoke/red

/datum/effect/smoke_spread/sleepy
	smoke_type = /obj/effect/smoke/sleepy

/datum/effect/smoke_spread/mustard
	smoke_type = /obj/effect/smoke/mustard

// [GAIA]
// Used in thermobaric missiles
/datum/effect/smoke_spread/thermobaric
	smoke_type = /obj/effect/smoke/thermobaric

/////////////////////////////////////////////
//////// Attach an Ion trail to any object, that spawns when it moves (like for the jetpack)
/// just pass in the object to attach it to in set_up
/// Then do start() to start it and stop() to stop it, obviously
/// and don't call start() in a loop that will be repeated otherwise it'll get spammed!
/////////////////////////////////////////////
/datum/effect/trail
	var/turf/oldposition
	var/processing = 1
	var/on = 1
	var/max_number = 0
	number = 0
	var/list/specific_turfs = list()
	var/trail_type
	var/duration_of_effect = 10

/datum/effect/trail/set_up(atom/atom)
	attach(atom)
	oldposition = get_turf(atom)


/datum/effect/trail/start()
	if(!src.on)
		src.on = 1
		src.processing = 1
	if(src.processing)
		src.processing = 0
		spawn(0)
			var/turf/T = get_turf(src.holder)
			if(T != src.oldposition)
				if(is_type_in_list(T, specific_turfs) && (!max_number || number < max_number))
					var/obj/effect/trail = new trail_type(oldposition)
					src.oldposition = T
					effect(trail)
					number++
					spawn( duration_of_effect )
						number--
						qdel(trail)
				spawn(2)
					if(src.on)
						src.processing = 1
						src.start()
			else
				spawn(2)
					if(src.on)
						src.processing = 1
						src.start()

/datum/effect/trail/proc/stop()
	src.processing = 0
	src.on = 0

/datum/effect/trail/proc/effect(obj/effect/T)
	T.set_dir(src.holder.dir)
	return

/obj/effect/ion_trails
	name = "ion trails"
	icon_state = "ion_trails"
	anchored = TRUE

/datum/effect/trail/ion
	trail_type = /obj/effect/ion_trails
	specific_turfs = list(/turf/space)
	duration_of_effect = 20

/datum/effect/trail/ion/effect(obj/effect/T)
	..()
	flick("ion_fade", T)
	T.icon_state = "blank"

/obj/effect/thermal_trail
	name = "therman trail"
	icon_state = "explosion_particle"
	anchored = TRUE

/datum/effect/trail/thermal
	trail_type = /obj/effect/thermal_trail
	specific_turfs = list(/turf/space)

/////////////////////////////////////////////
//////// Attach a steam trail to an object (eg. a reacting beaker) that will follow it
// even if it's carried of thrown.
/////////////////////////////////////////////

/datum/effect/trail/steam
	max_number = 3
	trail_type = /obj/effect/steam

/datum/effect/reagents_explosion
	var/amount 						// TNT equivalent

/datum/effect/reagents_explosion/set_up (amt, loc, flash = 0, flash_fact = 0)
	amount = amt
	if(isturf(loc))
		location = loc
	else
		location = get_turf(loc)

	return

/datum/effect/reagents_explosion/start()
	if (amount <= 2)
		var/datum/effect/spark_spread/s = new /datum/effect/spark_spread()
		s.set_up(2, 1, location)
		s.start()

		for(var/mob/M in viewers(5, location))
			to_chat(M, SPAN_WARNING("The solution violently explodes."))
		for(var/mob/M in viewers(1, location))
			if (prob (50 * amount))
				to_chat(M, SPAN_WARNING("The explosion knocks you down."))
				M.Weaken(rand(1,5))
		return
	else
		var/devst = -1
		var/heavy = -1
		var/light = -1

		// Clamp all values to fractions of config.max_explosion_range, following the same pattern as for tank transfer bombs
		if (round(amount/12) > 0)
			devst = devst + amount/12

		if (round(amount/6) > 0)
			heavy = heavy + amount/6

		if (round(amount/3) > 0)
			light = light + amount/3

		var/range = min(devst + heavy + light, BOMBCAP_RADIUS)

		var/max_power
		if (devst)
			max_power = EX_ACT_DEVASTATING
		else if (heavy)
			max_power = EX_ACT_HEAVY
		else
			max_power = EX_ACT_LIGHT

		for(var/mob/M in viewers(8, location))
			to_chat(M, SPAN_WARNING("The solution violently explodes."))

		explosion(location, range, max_power)
