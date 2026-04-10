/turf/simulated/floor/exoplanet/chasm
	name = "chasm"
	desc = "A deep chasm in the ground. It looks like it could be jumped across, but it's a long fall if you miss."
	color = "#000000"
	diggable = FALSE
	var/fall_damage = 30
	var/fall_damage_type = DAMAGE_BRUTE

	var/teleport_x = 0	// teleportation coordinates to the chasm location (if one is null, then character gets deleted)
	var/teleport_y = 0
	var/teleport_z = 0

/turf/simulated/floor/exoplanet/chasm/use_tool(obj/item/C, mob/living/user, list/click_params)
	if(istype(C, /obj/item/ladder_mobile))
		if(!user)
			return
		if(!ishuman(user) || isghost(user))
			return

		// Start a timed climb so it can be interrupted; show public progress
		visible_message("[user.name] starts to descend into a chasm using a ladder.", "You hear a ladder creak as someone begins to descend into a chasm.")
		user.show_message("You begin to carefully climb down the chasm using your ladder.")

		// 3 seconds to climb down; match common flags used elsewhere
		if(!do_after(user, 3 SECONDS, src, DO_DEFAULT | DO_USER_UNIQUE_ACT | DO_PUBLIC_PROGRESS))
			// interrupted
			user.show_message("Your climb was interrupted!")
			return TRUE

		// Completed successfully — teleport without applying fall damage
		if(teleport_x && teleport_y && teleport_z)
			visible_message("[user.name] finishes climbing down a chasm.", "You hear the ladder settle as someone reaches the bottom of a chasm.")
			user.show_message("You carefully finish your descent and reach the bottom of the chasm.")
			user.x = teleport_x
			user.y = teleport_y
			user.z = teleport_z
			return TRUE
		else
			user.show_message("The ladder doesn't reach far enough down the chasm.")
			return TRUE

	return ..()

/turf/simulated/floor/exoplanet/chasm/ex_act(severity)
	return ..()

/turf/simulated/floor/exoplanet/chasm/Entered(mob/living/carbon/human/H)
	if(!H)
		return
	if(!ishuman(H) || isghost(H))
		return

	visible_message(SPAN_WARNING("[H.name] falls into a chasm with a panicked scream!"), SPAN_WARNING("You hear a fading scream as if someone fallen down a chasm!"))
	H.show_message(SPAN_DANGER("FUCK! YOU FELL DOWN A CHASM AND HIT THE GROUND!"))

	if(prob(10))
		H.say(pick("СУКА-А-А-А!!", "БЛЯ-Я-Я-ЯТЬ!!", "БЛЯ-Я-Я-Я!!", "ЕБА-А-А-АТЬ!!"))

	if(prob(95))
		if(H.gender == FEMALE)
			playsound(src, 'maps/gaia/sounds/fallscream_female.ogg', 100, TRUE)
		else
			playsound(src, 'maps/gaia/sounds/fallscream_male.ogg', 100, TRUE)
	else
		playsound(src, 'maps/gaia/sounds/fallscream_rare.ogg', 100, TRUE)

	if(teleport_x && teleport_y && teleport_z)
		//Teleports to where chasm hole location is
		H.x = teleport_x
		H.y = teleport_y
		H.z = teleport_z

		//Applies fall damage
		H.apply_damage(damage = fall_damage, damagetype = fall_damage_type, def_zone = BP_R_LEG, used_weapon = src, silent = TRUE)
		H.apply_damage(damage = fall_damage, damagetype = fall_damage_type, def_zone = BP_L_LEG, used_weapon = src, silent = TRUE)

		H.apply_damage(damage = fall_damage, damagetype = fall_damage_type, def_zone = BP_R_FOOT, used_weapon = src, silent = TRUE)
		H.apply_damage(damage = fall_damage, damagetype = fall_damage_type, def_zone = BP_L_FOOT, used_weapon = src, silent = TRUE)
		playsound(H, 'sound/weapons/genhit1.ogg', 100, TRUE)
	else
		qdel(H) //If no teleport coordinates are set, the character just gets deleted (falls into the void)
	. = ..()

/turf/simulated/floor/exoplanet/water/shallow/sewers
	name = "shallow sewers"
	icon = 'icons/turf/chlorine.dmi'
	icon_state = "chlorine_liquid"
	desc = "A pool of foul smelling contaminated water. Better not step into it."
	dirt_color = "#d2e0b7"
	reagent_type = /datum/reagent/acid/stomach
