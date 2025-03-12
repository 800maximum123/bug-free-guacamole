/obj/item/organ/internal/augment/active/item/circuit/fd
	augment_slots = AUGMENT_ARM | AUGMENT_HAND

//По-сути, это тот же ванильный политул, но с поддержкой радиального меню. Я не знаю, как сделать радиалку модульной, так что пусть лучше будет так.

/obj/item/organ/internal/augment/active/polytool_fd
	name = "Polytool embedded module"
	action_button_name = "Deploy Tool"
	icon_state = "multitool"
	augment_slots = AUGMENT_HAND
	var/list/items = list()
	var/list/images = list()
	var/list/paths = list() //We may lose them
	augment_flags = AUGMENT_MECHANICAL

/obj/item/organ/internal/augment/active/polytool_fd/Initialize()
	. = ..()
	for(var/path in paths)
		var/obj/item/I = new path (src)
		I.canremove = FALSE
		items += I
		var/image/img = image(icon = I.icon, icon_state = I.item_state)
		img.name = I.name
		images[I] = img

/obj/item/organ/internal/augment/active/polytool_fd/Destroy()
	QDEL_NULL_LIST(items)
	. = ..()

/obj/item/organ/internal/augment/active/polytool_fd/proc/holding_dropped(obj/item/I)
	GLOB.item_unequipped_event.unregister(I, src)
	if (I.loc != src)
		I.canremove = TRUE

/obj/item/organ/internal/augment/active/polytool_fd/activate()
	if(!can_activate())
		return
	var/slot = null

	if(limb.organ_tag in list(BP_L_ARM, BP_L_HAND))
		slot = slot_l_hand
	else if(limb.organ_tag in list(BP_R_ARM, BP_R_HAND))
		slot = slot_r_hand

	var/obj/I = slot == slot_l_hand ? owner.l_hand : owner.r_hand

	if(I)
		if(is_type_in_list(I,paths) && !(I.type in items)) //We don't want several of same but you can replace parts whenever
			if(!owner.drop_from_inventory(I, src))
				to_chat(owner, "\the [I] fails to retract.")
				return
			items += I
			owner.visible_message(
				SPAN_WARNING("[owner] retracts \his [I] into [limb]."),
				SPAN_NOTICE("You retract your [I] into [limb].")
			)
		else
			to_chat(owner, SPAN_WARNING("You must drop [I] before tool can be extend."))
	else
		var/obj/item = show_radial_menu(owner, owner, images , radius = 48, require_near = TRUE)
		if(!item || !(src in owner.internal_organs))
			return
		if(owner.equip_to_slot_if_possible(item, slot))
			items -= item
			//Keep track of it, make sure it returns
			GLOB.item_unequipped_event.register(item, src, TYPE_PROC_REF(/obj/item/organ/internal/augment/active/polytool_fd, holding_dropped))
			var/datum/pronouns/pronouns = owner.choose_from_pronouns()
			owner.visible_message(
				SPAN_WARNING("[owner] extends [pronouns.his] [item.name] from [pronouns.his] [limb]."),
				SPAN_NOTICE("You extend your [item.name] from your [limb].")
			)

// Если вы вдруг захотите сделать инструменты в этом наборе особенными - воспользуйтесь тем что ниже. Эти обьекты были созданы
//лишь для прописания item_state, дабы show_radial_menu работало адекватно
/obj/item/bonesetter/finger
	item_state = "bone setter"
/obj/item/cautery/finger
	item_state = "cautery"
/obj/item/circular_saw/finger
	item_state = "saw3"
/obj/item/hemostat/finger
	item_state = "hemostat"
/obj/item/retractor/finger
	item_state = "retractor"
/obj/item/scalpel/basic/finger
	item_state = "scalpel"
/obj/item/surgicaldrill/finger
	item_state = "drill"

/obj/item/organ/internal/augment/active/polytool_fd/surgical
	name = "surgical toolset"
	action_button_name = "Deploy Surgical Tool"
	desc = "Part of Zeng-Hu Pharmaceutical's line of biomedical augmentations, this device contains the full set of tools any surgeon would ever need."
	icon_state = "multitool_medical"
	paths = list(
		/obj/item/bonesetter/finger,
		/obj/item/cautery/finger,
		/obj/item/circular_saw/finger,
		/obj/item/hemostat/finger,
		/obj/item/retractor/finger,
		/obj/item/scalpel/basic/finger,
		/obj/item/surgicaldrill/finger
	)

/obj/item/organ/internal/augment/active/polytool_fd/engineer
	name = "engineering toolset"
	action_button_name = "Deploy Engineering Tool"
	desc = "A lightweight augmentation for the engineer on-the-go. This one comes with a series of common tools."
	paths = list(
		/obj/item/screwdriver/finger,
		/obj/item/wrench/finger,
		/obj/item/weldingtool/finger,
		/obj/item/crowbar/finger,
		/obj/item/wirecutters/finger,
		/obj/item/device/multitool/finger
	)

/obj/item/screwdriver/finger
	icon_state = "screwdriver"
	icon = 'mods/_fd/cyberware_mayhem/icons/robot_items.dmi'

/obj/item/wrench/finger
	icon_state = "wrench"
	icon = 'mods/_fd/cyberware_mayhem/icons/robot_items.dmi'

/obj/item/weldingtool/finger
	icon_state = "welder"
	icon = 'mods/_fd/cyberware_mayhem/icons/robot_items.dmi'

/obj/item/crowbar/finger
	icon_state = "crowbar"
	icon = 'mods/_fd/cyberware_mayhem/icons/robot_items.dmi'

/obj/item/wirecutters/finger
	icon_state = "cutters"
	icon = 'mods/_fd/cyberware_mayhem/icons/robot_items.dmi'

/obj/item/device/multitool/finger
	icon_state = "engimplant"
	icon = 'mods/_fd/cyberware_mayhem/icons/tools.dmi'

GLOBAL_LIST_EMPTY(assist_hud_users)

/proc/process_assist_hud(mob/M, mob/Alt)
	var/datum/arranged_hud_process/P = arrange_hud_process(M, Alt, GLOB.assist_hud_users)
	for (var/mob/living/simple_animal/S in orange(5, P.Mob))
		if(P.Client)
			if(S.stat != DEAD)
				P.Client.images += S.hud_list[ASSIST_HUD]
	for (var/mob/living/carbon/human/L in orange(5, P.Mob))
		if(P.Client)
			if(L.stat != DEAD)
				P.Client.images += L.hud_list[ASSIST_HUD]
	for (var/mob/living/silicon/R in orange(5, P.Mob))
		if(P.Client)
			if(R.stat != DEAD)
				P.Client.images += R.hud_list[ASSIST_HUD]

//to-do: ADD SKILLBUFF

/obj/item/organ/internal/augment/active/shooting
	name = "gunnery booster"
	desc = "Hephaestus Industries' AIM-4 model improves gun accuracy by filtering unnecessary nerve signals."
	augment_slots = AUGMENT_FLUFF
	augment_flags = AUGMENT_BIOLOGICAL | AUGMENT_MECHANICAL
	var/active = FALSE

	icon = 'mods/_fd/cyberware_mayhem/icons/rig_modules.dmi' // PLACEHOLDER
	icon_state = "teleporter" // PLACEHOLDER
	default_action_type = /datum/action/item_action/organ/augment/fd

	action_button_name = "Activate Boosters"

/obj/item/organ/internal/augment/active/shooting/activate()
	. = ..()

	active = !active
	if (active)
		START_PROCESSING(SSobj, src)
	else
		STOP_PROCESSING(SSobj, src)

/obj/item/organ/internal/augment/active/shooting/emp_act(severity)
	if (istype(src.loc, /mob/living/carbon/human))
		var/mob/living/carbon/human/M = src.loc
		to_chat(M, SPAN_DANGER("Your [name] malfunctions, blinding you!"))
		M.eye_blind = 4
		M.eye_blurry = 8
		if (active)
			active = FALSE
	..()

/obj/item/organ/internal/augment/active/shooting/Process()
	. = ..()
	if(active)
		process_assist_hud(owner)

/image/hud_overlay/assist
	appearance_flags = DEFAULT_APPEARANCE_FLAGS | NO_CLIENT_COLOR | RESET_TRANSFORM | KEEP_APART
	layer = HUD_BASE_LAYER
	plane = HUD_PLANE
