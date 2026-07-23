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
	if(H.jumping)
		return

	visible_message(SPAN_WARNING("[H.name] falls into a chasm with a panicked scream!"), SPAN_WARNING("You hear a fading scream as if someone fallen down a chasm!"))
	H.show_message(SPAN_DANGER("FUCK! YOU FELL DOWN A CHASM AND HIT THE GROUND!"))

	if(prob(10))
		H.say(pick("СУКА-А-А-А!!", "БЛЯ-Я-Я-ЯТЬ!!", "БЛЯ-Я-Я-Я!!", "ЕБА-А-А-АТЬ!!"))

	if(prob(95))
		if(H.gender == FEMALE)
			playsound(src, 'maps/gaia/sounds/voice/fallscream_female.ogg', 100, TRUE)
		else
			playsound(src, 'maps/gaia/sounds/voice/fallscream_male.ogg', 100, TRUE)
	else
		playsound(src, 'maps/gaia/sounds/voice/fallscream_rare.ogg', 100, TRUE)

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
	name = "deep sewers"
	icon = 'icons/turf/chlorine.dmi'
	icon_state = "chlorine_liquid"
	desc = "A deep pool of foul smelling contaminated water. Better not step into it."
	movement_delay = 2.5
	dirt_color = "#b1c760"
	reagent_type = /datum/reagent/acid/stomach
	water_depth = FLUID_DEEP
	// How much sewage is added onto the clothes
	var/stain_amount = 3
	var/cleanable_scent = "sewage"
	var/scent_intensity = /singleton/scent_intensity/overpowering
	var/scent_descriptor = SCENT_DESC_HAZE
	var/scent_range = 2

/turf/simulated/floor/exoplanet/water/shallow/sewers/Initialize()
	. = ..()
	set_extension(src, /datum/extension/scent/custom, cleanable_scent, scent_intensity, scent_descriptor, scent_range)

// Covers unfortunate guy in sewage ewww
/turf/simulated/floor/exoplanet/water/shallow/sewers/Crossed(mob/living/carbon/human/perp)
	if(!istype(perp))
		return
	var/list/to_cover = list(
		perp.head,
		perp.wear_mask,
		perp.wear_suit,
		perp.w_uniform,
		perp.gloves,
		perp.shoes,
		perp.glasses,
		perp.belt,
		perp.s_store,
		)

	var/obj/item/organ/external/l_foot = perp.get_organ(BP_L_FOOT)
	var/obj/item/organ/external/r_foot = perp.get_organ(BP_R_FOOT)
	var/hasfeet = 1
	if((!l_foot || l_foot.is_stump()) && (!r_foot || r_foot.is_stump()))
		hasfeet = 0
	for(var/obj/item/clothing/C in to_cover)
		C.blood_color = dirt_color
		if(!C.blood_overlay)
			C.generate_blood_overlay()
			C.blood_DNA = list()
			C.blood_overlay.color = dirt_color
			C.AddOverlays(C.blood_overlay)
		if(istype(C, /obj/item/clothing/shoes))
			var/obj/item/clothing/shoes/S = C
			S.track_blood = max(stain_amount,S.track_blood)

	if (hasfeet && !perp.shoes) //Or feet
		perp.feet_blood_color = dirt_color
		perp.track_blood = max(stain_amount, perp.track_blood)
		perp.feet_blood_DNA = list()
	else if (perp.buckled && istype(perp.buckled, /obj/structure/bed/chair/wheelchair))
		var/obj/structure/bed/chair/wheelchair/W = perp.buckled
		W.bloodiness = 4

	perp.update_icons()
