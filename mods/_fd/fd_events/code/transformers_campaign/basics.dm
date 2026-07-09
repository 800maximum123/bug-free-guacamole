/datum/simple_status/tf_character
	name = "Трансформер" // А как ещё это назвать, лол?
	desc_text = null
	status_type = STATUS_EFFECT_UNIQUE

	positive_effect = TRUE // Это несовсем позитивный эффект, но нам всё равно нужно чтобы он оставался после реджува
	var/lives = 5 // Сколько раз за один раунд мы можем "умереть" В ЦЕЛОМ
	var/lives_left = 5 // Сколько раз ещё осталось

/datum/simple_status/crit/on_apply() // Оверрайд кода крита
	var/datum/simple_status/tf_character/tf = owner.get_status_effect(/datum/simple_status/tf_character)
	if(ishuman(owner))
		var/mob/living/carbon/human/H = owner

		var/list/pick_organs
		for(var/obj/item/organ/external/E in H.organs)
			if(istype(E,/obj/item/organ/external/chest) || istype(E,/obj/item/organ/external/groin))
				continue
			pick_organs += E

		if(tf && tf.lives_left > 0 && length(pick_organs))
			tf.lives_left -= 1

			var/obj/item/organ/external/limb = pick(pick_organs)
			limb.take_general_damage(50)
			limb.droplimb()

			H.simple_health_calculation(-(H.max_simple_health / 2),0,0,0)
			for(var/datum/simple_status/effects in H.status_effects)
				if(effects.positive_effect)
					continue
				if(effects == src)
					continue
				H.remove_status_effect(effects)

			return FALSE

	. = ..()

/obj/screen/fullscreen/almost_done_robot
	icon = 'mods/_fd/fd_assets/icons/aurora/robot_pain.dmi'
	icon_state = "ipcdamageoverlay6"
	scale_to_view = TRUE
	alpha = 0

/obj/screen/fullscreen/almost_done_robot/Initialize()
	. = ..()
	animate(src, alpha = 255, time = 5, LINEAR_EASING)

/obj/item
	var/tf_charge_cost = 0
	var/mob/living/carbon/human/tf

/obj/item/dropped(mob/user)
	..()

	if(tf)
		if(tf.tf_weapon_slot == src)
			forceMove(tf)
			tf.tf_weapon_shown = FALSE
		else
			QDEL_IN(src,0)

/mob/living/carbon/human
	var/obj/item/tf_weapon_slot
	var/tf_weapon_shown = FALSE

/mob/living/carbon/human/proc/spent_transformer_charge(amount)
	var/obj/item/organ/internal/cell/cell = internal_organs_by_name[BP_CELL]
	if(cell)
		cell.cell = clamp(cell.cell.charge - amount, 0, cell.cell.maxcharge)

/mob/living/carbon/human/proc/change_transformer_cell()
	var/obj/item/organ/internal/cell/cell = internal_organs_by_name[BP_CELL]
	if(cell)
		cell.cell = new /obj/item/cell/infinite(src)

/mob/living/carbon/human/proc/change_tf_weapon_status()
	if(!tf_weapon_shown)
		tf_weapon_shown = TRUE
		if(!tf_weapon_slot.tf)
			tf_weapon_slot.tf = src

		put_in_any_hand_if_possible(tf_weapon_slot)
		return TRUE
	else
		tf_weapon_slot.dropped(src)
		return TRUE

#define CATEGORY_FD_TF "FINAL DESTINATION: TRANSFORMERS"

/datum/keybinding/living/fd/transformers
	category = CATEGORY_FD_TF

/datum/keybinding/living/fd/transformers/manage_weaponry
	hotkey_keys = list("None")
	name = "manage_weaponry"
	full_name = "TF: Show/Hide In-hand"
	description = ""

/datum/keybinding/living/fd/transformers/manage_weaponry/can_use(client/user)
	if(!ishuman(user.mob))
		return FALSE

	var/mob/living/carbon/human/H = user.mob
	if(!H.tf_weapon_slot)
		return FALSE

	. = ..()

/datum/keybinding/living/fd/transformers/manage_weaponry/down(client/user)
	var/mob/living/carbon/human/H = user.mob
	H.change_tf_weapon_status()
	return TRUE
