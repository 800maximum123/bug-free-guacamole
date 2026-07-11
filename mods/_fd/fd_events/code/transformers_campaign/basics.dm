/area/teletraan
	name = "TELETRAAN LEVEL"
	dynamic_lighting = FALSE

/obj/structre/fd/tf/teletraan
	icon = 'mods/_fd/fd_assets/icons/goons/manufacturer.dmi'
	icon_state = "fab-med"

	name = "mainframe station"
	desc = "Quick supplies and equipment"

	anchored = TRUE
	density = TRUE

	var/health_packs = 4 //rejuvs for 4 people or 1 greedy one
	interactive = TRUE

	var/obj/structre/fd/tf/teletraan_ui/exit_button/teletraan_ui

/obj/structre/fd/tf/teletraan/interact_with(mob/living/carbon/human/user)
	if(!user.reading)

		user.reading = TRUE
		user.currently_interacting = src
		user.anchored = TRUE

		if(!teletraan_ui)
			for(var/obj/structre/fd/tf/teletraan_ui/exit_button/E in world)
				teletraan_ui = E

		if(!user.get_status_effect(/datum/simple_status/tf_character)) // for testing purposes
			user.add_status_effect(/datum/simple_status/tf_character)

		user.client.adminobs = TRUE
		user.reset_view(teletraan_ui)
		return TRUE

/obj/structre/fd/tf/teletraan_ui
	icon = 'mods/_fd/fd_events/code/transformers_campaign/ui.dmi'
	icon_state = "base"

	plane = ABOVE_LIGHTING_LAYER
	anchored = TRUE

	var/hovering = FALSE
	var/usable = TRUE
	var/show_outline = TRUE

/obj/structre/fd/tf/teletraan_ui/MouseEntered(location, control, params)
	. = ..()

	if(ishuman(usr))
		if(!hovering)
			var/outline_color = COLOR_GREEN

			if(!usable)
				outline_color = COLOR_RED

			if(show_outline)
				add_filter("hover_outline", 1, list("type" = "outline", "color" = outline_color, "size" = 1))
			hovering = TRUE

/obj/structre/fd/tf/teletraan_ui/MouseExited(location, control, params)
	. = ..()

	if(ishuman(usr))
		if(hovering)
			if(show_outline)
				remove_filter("hover_outline")
			hovering = FALSE

/obj/structre/fd/tf/teletraan_ui/equipment_choice
	name = "EQUIPMENT"
	icon_state = "base"

	desc = "Some description to add on maptext"
	var/item_to_equip = /obj/item

	maptext_width = 192
	maptext_height = 96
	maptext_x = -64
	maptext_y = -40

	show_outline = FALSE

/obj/structre/fd/tf/teletraan_ui/equipment_choice/Click(location, control, params)
	. = ..()
	if(ishuman(usr))
		var/mob/living/carbon/human/H = usr

		if(H.tf_weapon_slot)
			var/obj/item/W = H.tf_weapon_slot
			H.tf_weapon_slot = null
			W.forceMove(get_turf(H))
			W.dropped(H)

		H.tf_weapon_slot = new item_to_equip(src)

		animation_flash_color(src, COLOR_GREEN)
		animate(src, transform = matrix(0.7, MATRIX_SCALE), time = 0.2 SECONDS, easing = SINE_EASING | EASE_IN)
		animate(transform = matrix(1, MATRIX_SCALE), time = 0.2 SECONDS, easing = SINE_EASING | EASE_OUT)
		return TRUE

/obj/structre/fd/tf/teletraan_ui/equipment_choice/MouseEntered(location, control, params)
	. = ..()

	if(ishuman(usr))
		animate(src, transform = matrix(1.2, MATRIX_SCALE), time = 0.2 SECONDS, easing = SINE_EASING | EASE_IN)

		var/des_name = STYLE_SMALLFONTS_OUTLINE("<b>[name]</b><br>", 7, COLOR_CYAN, COLOR_BLACK)
		var/des_info = STYLE_SMALLFONTS_OUTLINE("[desc]", 7, COLOR_WHITE, COLOR_BLACK)

		maptext = des_name + des_info

/obj/structre/fd/tf/teletraan_ui/equipment_choice/MouseExited(location, control, params)
	. = ..()

	if(ishuman(usr))
		animate(src, transform = matrix(1, MATRIX_SCALE), time = 0.2 SECONDS, easing = SINE_EASING | EASE_IN)
		maptext = ""

/obj/structre/fd/tf/teletraan_ui/equipment_choice/kinetic
	name = "|РАЗОРИТЕЛЬ|"
	icon_state = "kinetic"

	maptext_x = -76
	maptext_y = -23

	desc = "Тяжёлое кинетическое оружие с магазинным боепитанием."
	item_to_equip = /obj/item/gun/projectile/automatic/tf/kinetic

/obj/item/gun/projectile/automatic/tf/kinetic
	name = "RAVAGER"
	desc = "Compact machine gun, used by military forces of Caminus-Prime."

	icon = 'mods/_fd/fd_events/code/transformers_campaign/weapons.dmi'
	icon_state = "kinetic"
	item_state = "kinetic" /// Onmob is WIP sprite

	item_icons = list(
		slot_l_hand_str = 'mods/_fd/fd_events/code/transformers_campaign/weapons_l.dmi',
		slot_r_hand_str = 'mods/_fd/fd_events/code/transformers_campaign/weapons_r.dmi'
		)

	w_class = ITEM_SIZE_NO_CONTAINER
	caliber = CALIBER_RIFLE
	slot_flags = 0
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/box/tf/kinetic
	allowed_magazines = /obj/item/ammo_magazine/box/tf/kinetic
	accuracy = 10
	one_hand_penalty = 0
	mag_insert_sound = 'sound/weapons/guns/interaction/lmg_magin.ogg'
	mag_remove_sound = 'sound/weapons/guns/interaction/lmg_magout.ogg'
	fire_sound = 'sound/weapons/gunshot/minigun.ogg'
	can_special_reload = FALSE

	move_delay = 0
	can_autofire = TRUE

	burst = 3
	burst_delay = 1
	fire_delay = 0

	has_safety = FALSE
	auto_eject = TRUE

	firemodes = list()

/obj/item/gun/projectile/automatic/tf/kinetic/on_update_icon()
	..()
	if(ammo_magazine)
		icon_state = "kinetic"
	else
		icon_state = "kinetic-empty"

/obj/item/ammo_magazine/box/tf/kinetic
	name = "box"
	mag_type = MAGAZINE
	caliber = CALIBER_RIFLE
	ammo_type = /obj/item/ammo_casing/rifle
	max_ammo = 300
	multiple_sprites = FALSE

/obj/structre/fd/tf/teletraan_ui/exit_button
	name = "EXIT INTERFACE"
	icon_state = "disconnect"

/obj/structre/fd/tf/teletraan_ui/exit_button/Click(location, control, params)
	. = ..()
	if(ishuman(usr))
		var/mob/living/carbon/human/H = usr
		H.client.adminobs = null
		H.reset_view()

		H.reading = FALSE
		H.currently_interacting = null
		H.anchored = FALSE

/obj/structre/fd/tf/teletraan_ui/heal_button
	name = "REPAIR DAMAGE"
	icon_state = "repair"

/obj/structre/fd/tf/teletraan_ui/heal_button/MouseEntered(location, control, params)
	if(ishuman(usr))
		var/mob/living/carbon/human/H = usr
		var/obj/structre/fd/tf/teletraan/T = H.currently_interacting
		if(T.health_packs > 0)
			usable = TRUE
		else
			usable = FALSE

	. = ..()

/obj/structre/fd/tf/teletraan_ui/heal_button/Click(location, control, params)
	. = ..()
	if(ishuman(usr))
		var/mob/living/carbon/human/H = usr
		var/obj/structre/fd/tf/teletraan/T = H.currently_interacting

		if(T.health_packs > 0)

			for(var/obj/item/clothing/armor in H.get_equipped_items())
				armor.simple_armor_blockchance = armor.simple_armor_blockchance_max

			H.simple_health_calculation(-H.max_simple_health, 0, 0, 0)
			H.spent_transformer_charge(-1500)

			for(var/datum/simple_status/effects in H.status_effects)
				if(effects.positive_effect)
					continue
				H.remove_status_effect(effects)

			T.health_packs = clamp(T.health_packs - 1, 0, INFINITY)
			animation_flash_color(src, COLOR_GREEN)
			animate(src, transform = matrix(0.7, MATRIX_SCALE), time = 0.2 SECONDS, easing = SINE_EASING | EASE_IN)
			animate(transform = matrix(1, MATRIX_SCALE), time = 0.2 SECONDS, easing = SINE_EASING | EASE_OUT)
			return TRUE

		else
			animation_flash_color(src, COLOR_RED)
			return TRUE

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
		cell.cell.charge = clamp(cell.cell.charge - amount, 0, cell.cell.maxcharge)

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
		drop_from_inventory(tf_weapon_slot)
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

#include "..\transformers_campaign\teletraan_level.dmm"
