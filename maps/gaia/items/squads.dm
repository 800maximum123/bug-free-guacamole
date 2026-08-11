// Items for squads and also squad kits
// These are for GCC only for now
// TODO: Make SCG variants

// Squad kits selector
/obj/item/selection/squad
	name = "squad selection kit"
	desc = "A secure box containing a kit for a specific squad."
	selection_options = list(
		"Anna Squad - Red" = /obj/item/storage/box/squad/alpha,
		"Boris Squad - Yellow" = /obj/item/storage/box/squad/bravo,
		"Vasiliyi Squad - Purple" = /obj/item/storage/box/squad/charlie,
		"Galina Squad - Blue" = /obj/item/storage/box/squad/delta,
		"Specz Squad - Green" = /obj/item/storage/box/squad/echo,
	)

// Squad kits
/obj/item/storage/box/squad
	name = "squad kit"
	desc = "A kit for specific squad."
	icon_state = "squadA"

/obj/item/storage/box/squad/alpha
	name = "Anna squad kit"
	desc = "A red kit for an 'Anna' squad."
	icon_state = "squadA"
	color = COLOR_RED_GRAY
	startswith = list(
		/obj/item/clothing/accessory/armband/squad/alpha = 1,
		/obj/item/clothing/accessory/helmet_stripe/squad/alpha = 1,
		/obj/item/clothing/accessory/buddy_tag/squad/alpha = 1,
		/obj/item/device/kit/armor/squad/alpha = 1,
		/obj/item/paper/squad/alpha = 1,
	)

/obj/item/storage/box/squad/bravo
	name = "Boris squad kit"
	desc = "A red kit for an 'Boris' squad."
	icon_state = "squadB"
	color = COLOR_YELLOW_GRAY
	startswith = list(
		/obj/item/clothing/accessory/armband/squad/bravo = 1,
		/obj/item/clothing/accessory/helmet_stripe/squad/bravo = 1,
		/obj/item/clothing/accessory/buddy_tag/squad/bravo = 1,
		/obj/item/device/kit/armor/squad/bravo = 1,
		/obj/item/paper/squad/bravo = 1,
	)

/obj/item/storage/box/squad/charlie
	name = "Vasiliyi squad kit"
	desc = "A red kit for an 'Vasiliyi' squad."
	icon_state = "squadC"
	color = COLOR_PURPLE_GRAY
	startswith = list(
		/obj/item/clothing/accessory/armband/squad/charlie = 1,
		/obj/item/clothing/accessory/helmet_stripe/squad/charlie = 1,
		/obj/item/clothing/accessory/buddy_tag/squad/charlie = 1,
		/obj/item/device/kit/armor/squad/charlie = 1,
		/obj/item/paper/squad/charlie = 1,
	)

/obj/item/storage/box/squad/delta
	name = "Galina squad kit"
	desc = "A red kit for an 'Galina' squad."
	icon_state = "squadD"
	color = COLOR_BLUE_GRAY
	startswith = list(
		/obj/item/clothing/accessory/armband/squad/delta = 1,
		/obj/item/clothing/accessory/helmet_stripe/squad/delta = 1,
		/obj/item/clothing/accessory/buddy_tag/squad/delta = 1,
		/obj/item/device/kit/armor/squad/delta = 1,
		/obj/item/paper/squad/delta = 1,
	)

/obj/item/storage/box/squad/echo
	name = "Specz squad kit"
	desc = "A red kit for an 'Specz' squad."
	icon_state = "squadE"
	color = COLOR_GREEN_GRAY
	startswith = list(
		/obj/item/clothing/accessory/armband/squad/echo = 1,
		/obj/item/clothing/accessory/helmet_stripe/squad/echo = 1,
		/obj/item/clothing/accessory/buddy_tag/squad/echo = 1,
		/obj/item/device/kit/armor/squad/echo = 1,
		/obj/item/paper/squad/echo = 1,
	)

// Armbands
/obj/item/clothing/accessory/armband/squad/alpha
	name = "Anna armband"
	desc = "An armband, worn to designate a squad. This one is red and designates 'Anna'."
	icon_state = "red"

/obj/item/clothing/accessory/armband/squad/bravo
	name = "Boris armband"
	desc = "An armband, worn to designate a squad. This one is yellow and designates 'Boris'."
	icon_state = "cargo" // yellow

/obj/item/clothing/accessory/armband/squad/charlie
	name = "Vasiliyi armband"
	desc = "An armband, worn to designate a squad. This one is purple and designates 'Vasiliyi'."
	icon_state = "rnd" // purple

/obj/item/clothing/accessory/armband/squad/delta
	name = "Galina armband"
	desc = "An armband, worn to designate a squad. This one is blue and designates 'Galina'."
	icon_state = "blue"

/obj/item/clothing/accessory/armband/squad/echo
	name = "Specz armband"
	desc = "An armband, worn to designate a squad. This one is green and designates 'Specz'."
	icon_state = "green"

// Helmet stripes
/obj/item/clothing/accessory/helmet_stripe
	name = "helmet stripe"
	desc = "A fabric stripe for armored helmets."
	icon_override = 'icons/mob/onmob/onmob_modular_armor.dmi'
	icon = 'icons/obj/clothing/obj_suit_modular_armor.dmi'
	accessory_icons = list(
		slot_tie_str = 'icons/mob/onmob/onmob_modular_armor.dmi',
		slot_head_str = 'icons/mob/onmob/onmob_modular_armor.dmi'
	)
	icon_state = null
	slot = ACCESSORY_SLOT_HELM_D // So you can mix them with the covers
	body_location = HEAD

/obj/item/clothing/accessory/helmet_stripe/squad/alpha
	name = "Anna helmet stripe"
	desc = "A fabric stripe for armored helmets, worn to designate a squad. This one is red and designates 'Anna'."
	icon_state = "helmstripe_red"

/obj/item/clothing/accessory/helmet_stripe/squad/bravo
	name = "Boris helmet stripe"
	desc = "A fabric stripe for armored helmets, worn to designate a squad. This one is yellow and designates 'Boris'."
	icon_state = "helmstripe_yellow"

/obj/item/clothing/accessory/helmet_stripe/squad/charlie
	name = "Vasiliyi helmet stripe"
	desc = "A fabric stripe for armored helmets, worn to designate a squad. This one is purple and designates 'Vasiliyi'."
	icon_state = "helmstripe_purple"

/obj/item/clothing/accessory/helmet_stripe/squad/delta
	name = "Galina helmet stripe"
	desc = "A fabric stripe for armored helmets, worn to designate a squad. This one is blue and designates 'Galina'."
	icon_state = "helmstripe_blue"

/obj/item/clothing/accessory/helmet_stripe/squad/echo
	name = "Specz helmet stripe"
	desc = "A fabric stripe for armored helmets, worn to designate a squad. This one is red and designates 'Specz'."
	icon_state = "helmstripe_green"

// Buddy tags
/obj/item/clothing/accessory/buddy_tag/squad/alpha
	name = "Anna buddy tag"
	desc = "A tiny device, paired up with a counterpart set to same code. When devices are taken apart too far, they start beeping. This one is preset to 'Anna' squad ID 10."
	color = COLOR_RED
	id = 10

/obj/item/clothing/accessory/buddy_tag/squad/bravo
	name = "Boris buddy tag"
	desc = "A tiny device, paired up with a counterpart set to same code. When devices are taken apart too far, they start beeping. This one is preset to 'Boris' squad ID 11."
	color = COLOR_YELLOW
	id = 11

/obj/item/clothing/accessory/buddy_tag/squad/charlie
	name = "Vasiliyi buddy tag"
	desc = "A tiny device, paired up with a counterpart set to same code. When devices are taken apart too far, they start beeping. This one is preset to 'Vasiliyi' squad ID 12."
	color = COLOR_PURPLE
	id = 12

/obj/item/clothing/accessory/buddy_tag/squad/delta
	name = "Galina buddy tag"
	desc = "A tiny device, paired up with a counterpart set to same code. When devices are taken apart too far, they start beeping. This one is preset to 'Galina' squad ID 13."
	color = COLOR_BLUE
	id = 13

/obj/item/clothing/accessory/buddy_tag/squad/echo
	name = "Specz buddy tag"
	desc = "A tiny device, paired up with a counterpart set to same code. When devices are taken apart too far, they start beeping. This one is preset to 'Specz' squad ID 14."
	color = COLOR_GREEN
	id = 14

// Shoulder stripes
// TODO: Make this use more vars and not hardcoded shit for shoulder straps and etc, really make these painting procs for base clothing
/obj/item/device/kit/armor
	name = "armor modification kit"
	desc = "A kit for modifying armor's appearance."
	w_class = ITEM_SIZE_SMALL
	new_name = "heavy arm guards"
	new_desc = "A pair of arm pads reinforced with heavy armor plating. Attaches to a plate carrier."
	new_icon = "gcc-shoulder-pads"
	uses = 1

/obj/item/device/kit/armor/use(amt, mob/user)
	uses -= amt
	playsound(get_turf(user), 'sound/effects/spray.ogg', 50, 1)
	if(uses < 1)
		qdel(src)

/obj/item/device/kit/armor/proc/apply_to(obj/item/clothing/accessory/arm_guards/gaia/arm_guards)
	if(!istype(arm_guards))
		return FALSE

	arm_guards.SetName(new_name)
	arm_guards.desc = new_desc
	arm_guards.set_icon_state(new_icon)

	var/image/old_overlay = arm_guards.inv_overlay
	arm_guards.inv_overlay = null
	var/image/new_overlay = arm_guards.get_inv_overlay()

	if(arm_guards.parent && old_overlay)
		arm_guards.parent.CutOverlays(old_overlay)
	if(arm_guards.parent)
		arm_guards.parent.AddOverlays(new_overlay)

	arm_guards.update_icon()
	return TRUE

/obj/item/clothing/pcarrier/gaia/use_tool(obj/item/O, mob/living/user, list/click_params)
	if(istype(O,/obj/item/device/kit/armor))
		var/obj/item/device/kit/armor/kit = O
		for(var/obj/item/clothing/accessory/arm_guards/gaia/arm_guards in accessories)
			if(kit.apply_to(arm_guards))
				kit.use(1,user)
				return TRUE
	return ..()

/obj/item/clothing/accessory/arm_guards/gaia/use_tool(obj/item/O, mob/living/user, list/click_params)
	if(istype(O,/obj/item/device/kit/armor))
		var/obj/item/device/kit/armor/kit = O
		if(kit.apply_to(src))
			kit.use(1,user)
			return TRUE
	return ..()

/obj/item/clothing/accessory/arm_guards/gaia/on_update_icon()
	return

/obj/item/device/kit/armor/squad/alpha
	name = "Anna armor modification kit"
	desc = "A kit for modifying armor's appearance. This one paints arm guards with red stripes designating 'Anna' squad."
	color = COLOR_RED_GRAY
	new_name = "Anna heavy arm guards"
	new_desc = "A pair of arm pads reinforced with heavy armor plating. Attaches to a plate carrier. These one have red stripes that designate 'Anna' squad."
	new_icon = "gcc-shoulder-pads-red"

/obj/item/device/kit/armor/squad/bravo
	name = "Boris armor modification kit"
	desc = "A kit for modifying armor's appearance. This one paints arm guards with yellow stripes designating 'Boris' squad."
	color = COLOR_YELLOW_GRAY
	new_name = "Boris heavy arm guards"
	new_desc = "A pair of arm pads reinforced with heavy armor plating. Attaches to a plate carrier. These one have yellow stripes that designate 'Boris' squad."
	new_icon = "gcc-shoulder-pads-yellow"

/obj/item/device/kit/armor/squad/charlie
	name = "Vasiliyi armor modification kit"
	desc = "A kit for modifying armor's appearance. This one paints arm guards with purple stripes designating 'Vasiliyi' squad."
	color = COLOR_PURPLE_GRAY
	new_name = "Vasiliyi heavy arm guards"
	new_desc = "A pair of arm pads reinforced with heavy armor plating. Attaches to a plate carrier. These one have purple stripes that designate 'Vasiliyi' squad."
	new_icon = "gcc-shoulder-pads-purple"

/obj/item/device/kit/armor/squad/delta
	name = "Galina armor modification kit"
	desc = "A kit for modifying armor's appearance. This one paints arm guards with blue stripes designating 'Galina' squad."
	color = COLOR_BLUE_GRAY
	new_name = "Galina heavy arm guards"
	new_desc = "A pair of arm pads reinforced with heavy armor plating. Attaches to a plate carrier. These one have blue stripes that designate 'Galina' squad."
	new_icon = "gcc-shoulder-pads-blue"

/obj/item/device/kit/armor/squad/echo
	name = "Specz armor modification kit"
	desc = "A kit for modifying armor's appearance. This one paints arm guards with green stripes designating 'Specz' squad."
	color = COLOR_GREEN_GRAY
	new_name = "Specz heavy arm guards"
	new_desc = "A pair of arm pads reinforced with heavy armor plating. Attaches to a plate carrier. These one have green stripes that designate 'Specz' squad."
	new_icon = "gcc-shoulder-pads-green"

// Papers
/obj/item/paper/squad
	name = "squad radio frequnecies"
	icon_state = "paper_words"
	language = LANGUAGE_HUMAN_RUSSIAN
	info = "These frequencies are used by the next squads:<br><b>Anna</b> - 1441<br><b>Boris</b> - 1442<br><b>Vasiliyi</b> - 1443<br><b>Galina</b> - 1444<br><b>Specz</b> - 1445"

/obj/item/paper/squad/alpha
	name = "Anna squad radio"
	info = "Welcome to the Anna Squad. For communication in squad please set your shortwave radio to frequency: <b>1441</b>"

/obj/item/paper/squad/bravo
	name = "Boris squad radio"
	info = "Welcome to the Boris Squad. For communication in squad please set your shortwave radio to frequency: <b>1442</b>"

/obj/item/paper/squad/charlie
	name = "Vasiliyi squad radio"
	info = "Welcome to the Vasiliyi Squad. For communication in squad please set your shortwave radio to frequency: <b>1443</b>"

/obj/item/paper/squad/delta
	name = "Galina squad radio"
	info = "Welcome to the Galina Squad. For communication in squad please set your shortwave radio to frequency: <b>1444</b>"

/obj/item/paper/squad/echo
	name = "Specz squad radio"
	info = "Welcome to the Specz Squad. For communication in squad please set your shortwave radio to frequency: <b>1445</b>"
