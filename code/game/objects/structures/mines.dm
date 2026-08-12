/obj/structure/mine
	name = "AP-1 mine"
	desc = "Anti-Personnel mine Mk1 produced by Hephaestus Industries favoured for its cheapness. It lacks IFF, but it does its job at turning legs into paste."
	anchored = TRUE
	icon = 'icons/obj/weapons/mines.dmi'
	icon_state = "mine"
	w_class = ITEM_SIZE_SMALL

	/// Can you hide it in the ground?
	var/can_hide = TRUE

	/// Boolean. If set, the mine is already triggered and won't trigger again. Used for both preventing duplicate activations, and for mines which have a delayed or ongoing effect.
	var/activated = FALSE
	var/rip_legs = TRUE
	var/power = 500
	var/falloff = 100
	var/weaken = 10

	/// Will it send fragments all around?
	var/shrapnel = FALSE
	var/list/fragment_types = list(/obj/item/projectile/bullet/pellet/fragment = 1)
	var/num_fragments = 72  //total number of fragments produced by the grenade
	//The radius of the circle used to launch projectiles. Lower values mean less projectiles are used but if set too low gaps may appear in the spread pattern
	var/spread_range = 7 //leave as is, for some reason setting this higher makes the spread pattern have gaps close to the epicenter

	var/trigger_sound = 'sound/effects/landmine.ogg'
	var/trigger_time = 1 // ticks
	var/animated = FALSE

	/// What mine will be given if disarmed?
	var/obj/item/device/mine/mine_type = /obj/item/device/mine
	/// Base disarm fail chance
	var/disarm_chance = 60

/obj/structure/mine/Initialize()
	. = ..()
	var/turf/simulated/floor/exoplanet/location = get_turf(src)
	if(istype(location))
		if(can_hide)
			color = location.dirt_color
			alpha = 200
			if(location.diggable)
				icon_state = initial(icon_state) + "-hidden"
				visible_message(SPAN_WARNING("\The [src] have been buried underground..."))
	playsound(src, 'sound/effects/bomb.ogg', 30, FALSE)
	audible_message(SPAN_WARNING("\The [src] chimes as it gets armed!"))

/obj/structure/mine/Crossed(atom/O)
	. = ..()
	if(!check(O))
		return
	var/mob/living/stepper = O
	var/obj/vehicles/vehicle = O
	if(istype(stepper))
		if(stepper.jumping)
			return
		to_chat(stepper, SPAN_WARNING("You step down on \the [src]... Uh oh..."))
	else if(istype(vehicle))
		if(vehicle.can_traverse_zs || vehicle.can_space_move)
			return

	if(!activated)
		pre_activate()
		activate(O)

/obj/structure/mine/bullet_act(obj/item/projectile/P, def_zone)
	if (prob(P.original == src ? 30 : 10)) // Small target, hard to hit on purpose, even harder to hit on accident
		if (!activated)
			activate(P)
		return FALSE
	visible_message(SPAN_WARNING("\The [P] misses \the [src] narrowly!"))
	return TRUE

/obj/structure/mine/ex_act(severity, direction)
	if (!activated)
		activate()

/obj/structure/mine/emp_act(severity)
	. = ..()
	if (!activated)
		activate()

/obj/structure/mine/use_weapon(obj/item/weapon, mob/user, list/click_params)
	SHOULD_CALL_PARENT(FALSE)
	if(prob(5))
		user.visible_message(
			SPAN_WARNING("\The [user] hits \the [src] with \a [weapon]!"),
			SPAN_DANGER("You hit \the [src] with \the [weapon]. Luckily it didn't go off.")
		)
		return FALSE
	else
		user.visible_message(
			SPAN_WARNING("\The [user] hits \the [src] with \a [weapon]!"),
			SPAN_DANGER("You hit \the [src] with \the [weapon]. This was a bad idea.")
		)
		if (!activated)
			pre_activate()
			activate(weapon)
	return TRUE

/obj/structure/mine/use_tool(obj/item/tool, mob/living/user, list/click_params)
	. = ..()
	disarm(user, tool)

/obj/structure/mine/proc/disarm(mob/user, obj/item/tool)
	if(isScrewdriver(tool))
		var/calculated_chance = max(0, (disarm_chance - user.get_skill_value(SKILL_DEVICES)*2 - (user.lying ? 10 : 0)))
		visible_message(SPAN_NOTICE("[user] starts disarming \the [src] with \the [tool]."))
		if(!do_after(user, 6 SECONDS, src, DO_PUBLIC_UNIQUE, INCAPACITATION_DISRUPTED))
			if(prob(calculated_chance))
				to_chat(user, SPAN_WARNING("Your hand slipped and triggered \the [src]!"))
				pre_activate()
				activate()
			else
				to_chat(user, SPAN_WARNING("You have been interrupted! Happily nothing happened..."))
			return
		if(prob(calculated_chance))
			to_chat(user, SPAN_WARNING("Your hand slipped and triggered \the [src]!"))
			pre_activate()
			activate()
		visible_message(SPAN_NOTICE("[user] disarms \the [src] with \the [tool]."))
		playsound(src, "sound/items/Wirecutter.ogg", 20)
		var/turf/drop = get_turf(src)
		new mine_type(drop)
		qdel(src)

/obj/structure/mine/proc/check(atom/O)
	if(isliving(O) || istype(O, /obj/vehicles))
		return TRUE
	return FALSE

/obj/structure/mine/proc/activate()
	activated = TRUE
	visible_message(
		SPAN_DANGER("\The [src] explodes!"),
		SPAN_DANGER("You hear an explosion!")
	)
	cell_explosion(epicenter = loc, power = power, falloff = falloff, shrapnel = shrapnel) // Fixes mines GAIA
	if(shrapnel)
		fragmentate(src.loc, num_fragments, spread_range, fragment_types)
	for(var/mob/living/carbon/human/H in get_turf(src))
		H.Weaken(weaken)
		if(rip_legs) // Yeah this will require stitches
			var/leg
			if(prob(10)) // if you're real unlucky you will lose your entire leg
				leg = pick(BP_L_LEG, BP_R_LEG)
			else
				leg = pick(BP_L_FOOT, BP_R_FOOT)
			H.apply_damage(50, DAMAGE_EXPLODE, leg, DAMAGE_FLAG_EXPLODE, src)
	qdel_self()

/// Just let it sink in for a moment
/obj/structure/mine/proc/pre_activate()
	activated = TRUE
	if(animated)
		flick(initial(icon_state) + "-fire", src)
	audible_message(SPAN_DANGER("You hear an ominous click from [src]!"))
	playsound(src, trigger_sound, 50, FALSE)
	sleep(trigger_time) // https://tenor.com/jjG9yCtYV8v.gif

/obj/item/device/mine
	name = "undeployed AP-1 mine"
	desc = "Broken description of a mine!"
	icon = 'icons/obj/weapons/mines.dmi'
	icon_state = "mine_item"
	w_class = ITEM_SIZE_SMALL

	/// Can you hide it in the ground?
	var/can_hide = TRUE
	/// What mine will be placed down?
	var/obj/structure/mine/mine_type = /obj/structure/mine

/obj/item/device/mine/Initialize()
	. = ..()
	if(mine_type)
		desc = mine_type.desc

/obj/item/device/mine/examine(mob/user, distance, is_adjacent)
	. = ..()
	if(can_hide)
		to_chat(user, SPAN_INFO("Use in-hand to activate, it will automatically recolor and bury into the ground if possible."))
	else
		to_chat(user, SPAN_INFO("Use in-hand to activate."))

/obj/item/device/mine/attack_self(mob/living/user)
	if(check_for_obstacles(user))
		return

	user.visible_message(SPAN_NOTICE("[user] starts deploying [src]."), SPAN_NOTICE("You start deploying [src]."))
	if(!do_after(user, 40, src))
		user.visible_message(SPAN_NOTICE("[user] stops deploying [src]."), SPAN_NOTICE("You stop deploying \the [src]."))
		return

	if(check_for_obstacles(user))
		return

	user.visible_message(SPAN_NOTICE("[user] finishes deploying [src]."), SPAN_NOTICE("You finish deploying [src]."))

	deploy_mine(user)

//checks for things that would prevent us from placing the mine.
/obj/item/device/mine/proc/check_for_obstacles(mob/living/user)
	if(locate(/obj/structure/mine) in get_turf(src))
		to_chat(user, SPAN_WARNING("There already is a mine at this position!"))
		return TRUE
	if(user.loc && user.loc.density)
		to_chat(user, SPAN_WARNING("You can't plant a mine here."))
		return TRUE

/obj/item/device/mine/proc/deploy_mine(mob/user)
	var/turf/location = get_turf(user)
	if(location && mine_type)
		new mine_type(location)
		qdel_self()

// ANTI-TANK MINE
/obj/structure/mine/antitank
	name = "AT-1 mine"
	desc = "Anti-Tank mine Mk1 produced by Hephaestus Industries. Can only be activated by vehicles and exosuits, not a threat to infantry."
	icon_state = "tankmine"
	w_class = ITEM_SIZE_NORMAL

	power = 1000
	falloff = 500

	mine_type = /obj/item/device/mine/antitank
	disarm_chance = 10 // fulyl safe is lying down

/obj/structure/mine/antitank/activate(atom/O)
	var/obj/vehicles/vehicle = O
	if(istype(vehicle))
		vehicle.deactivate()
	. = ..()

/obj/structure/mine/antitank/check(atom/O)
	if(istype(O, /obj/vehicles) || istype(O, /obj/vehicle) || istype(O, /mob/living/exosuit))
		return TRUE
	return FALSE

/obj/item/device/mine/antitank
	name = "undeployed AT-1 mine"
	icon_state = "tankmine_item"
	w_class = ITEM_SIZE_NORMAL
	mine_type = /obj/structure/mine/antitank

// BOUNCY (shrapnel) MINE
/obj/structure/mine/bouncy
	name = "APS-2 mine"
	desc = "Anti-Personnel-Shrapnel mine Mk2 produced by Hephaestus Industries. Once triggered it springs into the air blowing up into deadly cloud of shrapnel."
	icon_state = "bouncymine"

	power = 300
	falloff = 100
	shrapnel = TRUE
	rip_legs = FALSE

	trigger_time = 4
	trigger_sound = 'sound/effects/landmine_bouncy.ogg'
	animated = TRUE

	mine_type = /obj/item/device/mine/bouncy
	disarm_chance = 50 // Less volitile

/obj/structure/mine/bouncy/pre_activate()
	layer = ABOVE_HUMAN_LAYER
	alpha = 255
	color = COLOR_WHITE // initial
	var/datum/effect/spark_spread/sparks = new /datum/effect/spark_spread()
	sparks.set_up(1, 1, src.loc)
	sparks.start()
	. = ..()

/obj/item/device/mine/bouncy
	name = "APS-2 mine"
	icon_state = "bouncymine_item"
	mine_type = /obj/structure/mine/bouncy

// FRAG TRIPWIRE
/obj/structure/mine/tripwire
	name = "frag tripwire"
	desc = "Standard frag grenade with a hastly attached thin wire attached to it under tension, crossing it would take out the grenade pin causing it to blow up."
	icon_state = "tripwire"

	power = 200
	falloff = 50
	shrapnel = TRUE
	rip_legs = FALSE

	trigger_time = 5
	trigger_sound = 'sound/effects/tripwire.ogg'
	animated = TRUE

	mine_type = /obj/item/device/mine/tripwire // unused here
	disarm_chance = 20

/obj/item/device/mine/tripwire
	name = "frag tripwire"
	icon_state = "tripwire_item"
	mine_type = /obj/structure/mine/tripwire

/obj/structure/mine/tripwire/use_weapon(obj/item/weapon, mob/user, list/click_params)
	return

// Different from default
// You don't need to be a EOD specialist to cut a fishing line
/obj/structure/mine/tripwire/disarm(mob/user, obj/item/tool)
	if(tool.sharp == TRUE)
		var/calculated_chance = max(0, (disarm_chance - user.get_skill_value(SKILL_DEVICES)*2 - (user.lying ? 10 : 0)))
		visible_message(SPAN_NOTICE("[user] starts cutting \the [src] with \the [tool]."))
		if(!do_after(user, 3 SECONDS, src))
			if(prob(calculated_chance))
				to_chat(user, SPAN_WARNING("Your hand slipped and triggered \the [src]!"))
				pre_activate()
				activate()
			else
				to_chat(user, SPAN_WARNING("You have been interrupted! Happily nothing happened..."))
			return
		visible_message(SPAN_NOTICE("[user] cuts \the [src] with \the [tool]."))
		playsound(src, "sound/items/Wirecutter.ogg", 20)
		var/turf/drop = get_turf(src)
		new /obj/item/grenade/frag(drop)
		new /obj/item/stack/cable_coil/cut(drop)
		new /obj/item/stack/material/rods(drop)
		qdel(src)
