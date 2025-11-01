
#define PROGRESS_COOKED 10
#define PROGRESS_BURNING 15
#define PROGRESS_BURNED 20
#define PROGRESS_CLEARED 50

/particles/cooking_smoke
	width = 96
	height = 512
	count = 100
	spawning = 0.5
	lifespan = 30
	fade = 5
	position = generator("box", vector(-16,8,0), vector(16,16,50))
	gravity = vector(0, 1)
	friction = 0.3
	drift = generator("sphere", 0, 2)

	icon = 'mods/cooking/icons/particles.dmi'
	icon_state = list("1","2","3","4","5","6","7","8")

	grow = vector(0.1, 0.1)

	color = "#fff"

/obj/item/reagent_containers/cooker
	name = "Pot"
	icon = 'mods/cooking/icons/kitchen32x32.dmi'
	icon_state = "pot"
	var/little_icon_state = "lilpot_stoverlay"
	var/lid_overlay = "lid"
	var/little_lid_overlay = "overlay-lid"

	volume = 60
	atom_flags = ATOM_FLAG_OPEN_CONTAINER

	vis_flags = VIS_INHERIT_ID // Clicking on pot when it's on cooking surface causes issues otherwise

	var/max_item_size = ITEM_SIZE_HUGE
	w_class = ITEM_SIZE_HUGE

	var/progress = 0

	var/global/list/blacklisted_items = list(
		/obj/item/reagent_containers/glass,
		/obj/item/reagent_containers/syringe,
		/obj/item/reagent_containers/dropper,
		/obj/item/reagent_containers/chem_disp_cartridge,
		/obj/item/reagent_containers/food/drinks/bottle,
		/obj/item/reagent_containers/spray,
		/obj/item/flame/lighter
	)

	var/particles/cooking_smoke/cooking_smoke

/obj/item/reagent_containers/cooker/New()
	. = ..()

/obj/item/reagent_containers/cooker/proc/is_cookable(obj/item/I)
	if(!I)
		return FALSE

	for(var/path in blacklisted_items)
		if(istype(I, path))
			return FALSE

	if(I.reagents?.total_volume)
		return TRUE
	return FALSE

/obj/item/reagent_containers/cooker/proc/calc_total_volume()
	. = reagents.total_volume
	for(var/obj/item/I in contents)
		. += I.reagents?.total_volume

/obj/item/reagent_containers/cooker/attack_self()
	..()
	if(!(atom_flags & ATOM_FLAG_OPEN_CONTAINER))
		to_chat(usr, SPAN_NOTICE("You take the lid off \a [src]."))
		atom_flags |= ATOM_FLAG_OPEN_CONTAINER
	else
		to_chat(usr, SPAN_NOTICE("You put the lid on \a [src]."))
		atom_flags ^= ATOM_FLAG_OPEN_CONTAINER
	update_icon()

/obj/item/reagent_containers/cooker/on_update_icon()
	overlays.Cut()

	if(!(atom_flags & ATOM_FLAG_OPEN_CONTAINER))
		overlays += image(icon, icon_state = icon_state == little_icon_state ? little_lid_overlay : lid_overlay)

/obj/item/reagent_containers/cooker/proc/clear()
	particles = null
	cooking_smoke = null
	contents.Cut()
	reagents.clear_reagents()
	progress = 0

/obj/item/reagent_containers/cooker/verb/verb_clear()
	set name = "Clear"
	set src in view(1)

	for(var/obj/O in contents)
		O.forceMove(get_turf(usr))
	clear()


/obj/item/reagent_containers/cooker/proc/update_cooking()
	if(!contents.len && !progress)
		return

	++progress

	if(progress == 5)
		cooking_smoke = new/particles/cooking_smoke
		particles = cooking_smoke
		cooking_smoke.spawning = 0.25
		cooking_smoke.lifespan = 15
		cooking_smoke.grow = vector(0, 0)

	if(progress == PROGRESS_COOKED)
		if(calc_total_volume() > volume)
			reagents.remove_any(calc_total_volume() - volume)

		for(var/obj/item/I in contents)
			I.reagents.trans_to_holder(reagents, I.reagents.total_volume, copy = TRUE)
			qdel(I)

		cooking_smoke.spawning = 0.5
		cooking_smoke.lifespan = 30
		cooking_smoke.grow = vector(0.1, 0.1)

	if(progress == PROGRESS_BURNING)
		cooking_smoke.color = "#666"
		cooking_smoke.lifespan = 50
		cooking_smoke.grow = vector(0.25, 0.25)
		cooking_smoke.gravity = vector(0, 0.75)

	if(progress == PROGRESS_BURNED)
		cooking_smoke.color = "#222"
		cooking_smoke.lifespan = 40
		cooking_smoke.spawning = 0.75
		cooking_smoke.grow = vector(0.4, 0.4)
		cooking_smoke.gravity = vector(0, 0.5)

	if(progress >= PROGRESS_BURNING)
		var/amount = reagents.total_volume / (PROGRESS_BURNED - PROGRESS_BURNING)
		reagents.remove_any(amount)
		reagents.add_reagent(/datum/reagent/toxin , amount * 0.25)
		reagents.add_reagent(/datum/reagent/carbon, amount * 0.75)

	if(progress == PROGRESS_CLEARED)
		clear()

/obj/item/reagent_containers/cooker/use_after(atom/target, mob/living/user, click_parameters)
	if(standard_dispenser_refill(user, target) || standard_pour_into(user, target))
		if(reagents.total_volume < 1)
			clear()
		return TRUE

	return ..()

/obj/item/reagent_containers/cooker/use_tool(obj/item/I, mob/living/user, list/click_params)
	. = ..()
	if(.)
		return

	if(!(atom_flags & ATOM_FLAG_OPEN_CONTAINER))
		to_chat(user, SPAN_WARNING("You need to remove a lid from \a [src]."))
		return TRUE

	if(progress > PROGRESS_COOKED)
		to_chat(user, SPAN_WARNING("You need to clear \a [src] first."))
		return TRUE

	if(I.w_class > max_item_size)
		to_chat(user, SPAN_WARNING("\The [I] is too large for \a [src]."))
		return TRUE

	if(!is_cookable(I))
		to_chat(user, SPAN_WARNING("\The [src] can't cook it."))
		return TRUE

	if((calc_total_volume() + I.reagents.total_volume) > volume)
		to_chat(user, SPAN_WARNING("\The [src] is full."))
		return TRUE

	if (user.unEquip(I, src))
		to_chat(user, SPAN_NOTICE("You put \the [I] in \a [src]."))
		contents += I
		return TRUE

	return FALSE

/obj/item/reagent_containers/cooker/proc/transform_to_overlay(offset_x = 0, offset_y = 0)
	pixel_x    = offset_x
	pixel_y    = offset_y
	icon_state = little_icon_state
	particles  = cooking_smoke
	update_icon()

/obj/item/reagent_containers/cooker/proc/transform_to_item()
	pixel_x    = 0
	pixel_y    = 0
	particles  = null
	icon_state = initial(icon_state)
	update_icon()


#undef PROGRESS_COOKED
#undef PROGRESS_BURNING
#undef PROGRESS_BURNED
#undef PROGRESS_CLEARED
