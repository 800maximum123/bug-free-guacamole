/turf/unsimulated/void
	name = ""
	icon = 'icons/turf/areas.dmi'
	icon_state = null
	mouse_opacity = MOUSE_OPACITY_UNCLICKABLE
	density = TRUE

/turf/unsimulated/void/examine(mob/user, distance, infix, suffix)
	return TRUE

/area/long_forgotten_place
	name = "\improper Centcom"

/obj/effect/eyes
	name = "eyes"
	icon = 'mods/_fd/resurgence/icons/eyes.dmi'
	icon_state = "eyes_s"
	color = COLOR_ORANGE
	appearance_flags = TILE_BOUND | PIXEL_SCALE | LONG_GLIDE | KEEP_TOGETHER
	anchored = TRUE
	layer = 5
	var/scale = 16

	var/blink_delay_max = 9 SECONDS
	var/blink_delay_min = 3 SECONDS

	var/blink_duration_max = 0.6 SECONDS
	var/blink_duration_min = 0.4 SECONDS

/obj/effect/eyes/Initialize()
	. = ..()

	AddOverlays(emissive_appearance(icon, icon_state))
	SetTransform(scale)

	addtimer(new Callback(src, PROC_REF(blink)), rand(blink_delay_min, blink_delay_max))

/obj/effect/eyes/proc/blink()
	var/half_duration = rand(blink_duration_min, blink_duration_max) / 2
	animate(src, time = half_duration, easing = SINE_EASING|EASE_IN, pixel_y = -scale, transform = matrix().Scale(scale, 0))
	sleep(half_duration)
	animate(src, time = half_duration, easing = SINE_EASING|EASE_OUT, pixel_y = 0, transform = matrix().Scale(scale, scale))
	sleep(half_duration)

	addtimer(new Callback(src, PROC_REF(blink)), rand(blink_delay_min, blink_delay_max))

/datum/species/resurgence
	name = "Ω"
	name_plural = "Ω"
	husk_icon = 'icons/mob/human_races/species/starborn/husk.dmi'
	description = "Would you mind taking a seat, and discussing the inevitable?"

	blood_color = COLOR_ORANGE
	flesh_color = COLOR_ORANGE

	total_health = INFINITY
	silent_steps = TRUE

	warning_low_pressure = 50
	hazard_low_pressure = 0
	warning_high_pressure = 150
	hazard_high_pressure = INFINITY
	hunger_factor = 0
	thirst_factor = 0
	breath_type = null

	burn_mod = 0
	brute_mod = 0
	oxy_mod = 0
	toxins_mod = 0
	radiation_mod = 0
	metabolism_mod = 0
	stun_mod = 0
	paralysis_mod = 0
	weaken_mod = 0

	vision_flags = SEE_SELF | SEE_THRU

	species_flags = SPECIES_FLAG_NO_MINOR_CUT | SPECIES_FLAG_NO_SCAN | SPECIES_FLAG_NO_SLIP | SPECIES_FLAG_NO_POISON | SPECIES_FLAG_NO_EMBED | SPECIES_FLAG_NO_TANGLE | SPECIES_FLAG_NO_PAIN

	unarmed_types = list(/datum/unarmed_attack/resurgence)

/datum/species/resurgence/handle_post_spawn(mob/living/carbon/human/H)
	. = ..()
	H.real_name = ""
	H.name = ""
	H.universal_understand = TRUE
	H.universal_speak = TRUE
	H.color = COLOR_BLACK

/datum/unarmed_attack/resurgence
	attack_verb = list("disintegrated", "oblitirated")
	shredding = TRUE
	attack_name = "weight of life choises"

/datum/unarmed_attack/resurgence/show_attack(mob/living/carbon/human/user, mob/living/carbon/human/target, zone, attack_damage)
	user.visible_message(SPAN_WARNING("\The [user] [pick(attack_verb)] \the [target]!"))

/datum/unarmed_attack/resurgence/apply_effects(mob/living/carbon/human/user, mob/living/carbon/human/target, attack_damage, zone)
	target.emote("scream")
	new /obj/temporary(get_turf(target), 24.5, 'mods/antagonists/icons/effects/bs_silk.dmi', "silc_teleport_back")
	qdel(target)
