/datum/species
	var/water_adapted = 2 // 0 is perfect adaptation, -1 and less means you literally can't sunk at this point

/datum/species/nabber
	water_adapted = 4

/datum/species/resomi
	water_adapted = 4

/datum/species/machine
	water_adapted = 4

/datum/species/human/gravworlder
	water_adapted = 4

/datum/species/human/tritonian
	water_adapted = 0

/datum/species/adherent
	water_adapted = -1

/datum/species/unathi/yeosa
	water_adapted = -1

/datum/species/skrell
	water_adapted = -1

/datum/species/diona
	water_adapted = -1

/atom/movable
	var/sunking = FALSE
	var/can_sunk = FALSE
	var/current_sunking = 0
	var/image/sunking_overlay

/mob/living
	can_sunk = TRUE

/mob/living/carbon/human/Initialize(mapload)
	. = ..()

	if(species.water_adapted < 0)
		can_sunk = FALSE

/obj/item
	can_sunk = TRUE

/atom/movable/proc/update_sunking(atom/source, amount)
	if(source)
		if(sunking)
			CutOverlays(sunking_overlay)
			toggle_water_overlay(FALSE)

			appearance_flags |= KEEP_TOGETHER
			current_sunking += amount
			if(istype(src,/obj/item))
				var/obj/item/I = src
				current_sunking = clamp(current_sunking + I.w_class, 0, 32)

			if(ishuman(src))
				var/mob/living/carbon/human/H = src
				current_sunking = clamp(current_sunking + H.species.water_adapted, 0, 32)

			sunking_overlay = image(source.icon, src, source.icon_state)

			sunking_overlay.appearance_flags |= KEEP_TOGETHER
			sunking_overlay.blend_mode = BLEND_INSET_OVERLAY
			sunking_overlay.alpha = 255
			sunking_overlay.color = COLOR_BLACK

			sunking_overlay.pixel_y = current_sunking - 32
			sunking_overlay.add_filter("alpha_mask", 1, list("type" = "alpha", "icon" = icon('icons/turf/space.dmi', "black")))

			AddOverlays(sunking_overlay)
			toggle_water_overlay(source)
	else
		sunking = FALSE
		current_sunking = 0
		alpha = 255
		pixel_y = 0
		CutOverlays(sunking_overlay)
		toggle_water_overlay(FALSE)

/atom/movable/proc/sunk_completely(atom/source)

	animate(src, alpha = 0, pixel_y = -32, time = 1 SECONDS, easing = SINE_EASING|EASE_IN)
	sleep(1 SECONDS)

	if(sunking)
		var/turf/simulated/floor/F = get_turf(source)

		if(isopenspace(F))
			forceMove(GetBelow(src))
		else
			forceMove(source)
			if(isliving(src))
				var/mob/living/L = src
				L.adjustOxyLoss(200)
				L.adjustBrainLoss(150)

			if(!F.something_underwater)
				F.something_underwater = image('mods/_fd/fd_assets/icons/tg/effects_newer.dmi', F, "shadow_telegraph")
				F.something_underwater.layer = 2.21
				F.something_underwater.SetTransform(1.5)

			F.CutOverlays(F.something_underwater)
			F.AddOverlays(F.something_underwater)

		update_sunking(FALSE)

		alpha = 255
		pixel_y = initial(pixel_y)

/turf/simulated/floor
	var/image/something_underwater

/obj/fd_water
	name = "water"
	desc = "Shrimple as that."

	icon = 'mods/_fd/fd_assets/icons/water.dmi'
	icon_state = "water2"
	alpha = 100

	anchored = TRUE

	var/reagent_type = /datum/reagent/water
	var/verydeep = FALSE

	//var/watermask_type = /obj/fd_water/down // ~~это уёбищно, это отвратительно, но во времена когда аватар куб спит - это лучшее, что я смог придумать~~
	// Аватар данилкус проснулся, теперь всё хорошо

	layer = 2.22
	var/list/acceptable_fishgens = list(/obj/landmark/fd/fishgen,
										/obj/landmark/fd/fishgen/dionacave,
										/obj/landmark/fd/fishgen/ocean)

/obj/fd_water/Process()
	for(var/atom/movable/A in loc)
		if(A.can_sunk && !A.sunking && verydeep)
			A.sunking = TRUE

		if(A.can_sunk && A.sunking && verydeep)
			if(A.current_sunking < 32)
				if(isliving(A))
					var/mob/living/L = A
					if(L.get_stamina() > 0)
						L.adjust_stamina(-2)
					else
						L.update_sunking(src,1)
				else
					A.update_sunking(src,1)
			else
				A.sunk_completely(src)

/obj/fd_water/Destroy()
	. = ..()

/obj/fd_water/use_tool(obj/item/O, mob/living/user, list/click_params)
	var/obj/item/reagent_containers/RG = O
	if (reagent_type && istype(RG) && RG.is_open_container() && RG.reagents)
		RG.reagents.add_reagent(reagent_type, min(RG.volume - RG.reagents.total_volume, RG.amount_per_transfer_from_this))
		user.visible_message(SPAN_NOTICE("[user] fills \the [RG] from \the [src]."),SPAN_NOTICE("You fill \the [RG] from \the [src]."))
		return TRUE

	. = ..()

/obj/fd_water/attack_hand(mob/living/user)
	if(verydeep && length(contents))
		if(do_after(user, 10 SECONDS, user, DO_PUBLIC_UNIQUE))
			for(var/atom/movable/A in contents)
				A.forceMove(get_turf(src))
				sleep(1)
			var/turf/simulated/floor/F = get_turf(src)
			F.CutOverlays(F.something_underwater)
		return

	. = ..()

/obj/fd_water/Crossed(atom/movable/A)
	// нам похуй на тайпкастинг, потому что прок теперь может быть исполнен на любом атоме
	A.toggle_water_overlay(src)

	if(A.can_sunk && verydeep)
		START_PROCESSING(SSobj,src)

	if(isliving(A))
		var/random_watersound = pick('sound/effects/footstep/water1.ogg', 'sound/effects/footstep/water2.ogg', 'sound/effects/footstep/water3.ogg', 'sound/effects/footstep/water4.ogg')
		playsound(get_turf(src), random_watersound, 40)

/turf/simulated/floor/Exited(atom/movable/Obj, atom/newloc)
	. = ..()

	var/obj/fd_water/new_target = null
	for(var/obj/fd_water/W in newloc)
		if(W.verydeep)
			new_target = W

	if(!new_target || !new_target.verydeep)
		if(Obj.sunking)
			Obj.sunking = FALSE
			Obj.update_sunking(FALSE)

/obj/fd_water/Uncrossed(atom/movable/A)
	. = ..()
	A.toggle_water_overlay(FALSE)

	if(verydeep)
		var/list/atoms_to_process = list()

		for(var/atom/movable/object in loc)
			if(object.can_sunk)
				atoms_to_process += object

		if(!length(atoms_to_process))
			STOP_PROCESSING(SSobj,src)

/obj/fd_water/deep
	water_overlay_height = 23
	color = "#969696"
	verydeep = TRUE

/obj/fd_water/deep/Initialize()
	. = ..()

	color = COLOR_WHITE

/obj/fd_water/alt_ver1
	icon_state = "water3"
	alpha = 70

/obj/fd_water/alt_ver2
	icon_state = "water4"
	alpha = 70

/atom
	var/water_overlay_height = 12

/atom/movable
	var/image/water_overlay
	var/do_water_overlay = FALSE

/atom/movable/proc/toggle_water_overlay(atom/source)
	if(source)
		if(do_water_overlay)
			appearance_flags |= KEEP_TOGETHER

			water_overlay = image(source.icon, src, source.icon_state)

			water_overlay.appearance_flags |= KEEP_TOGETHER
			water_overlay.blend_mode = BLEND_INSET_OVERLAY
			water_overlay.alpha = source.alpha
			water_overlay.color = source.color

			water_overlay.pixel_y = source.water_overlay_height - 32
			water_overlay.add_filter("alpha_mask", 1, list("type" = "alpha", "icon" = icon('icons/turf/space.dmi', "black")))

			AddOverlays(water_overlay)
	else
		CutOverlays(water_overlay)

/mob/living
	do_water_overlay = TRUE

/obj
	do_water_overlay = TRUE
