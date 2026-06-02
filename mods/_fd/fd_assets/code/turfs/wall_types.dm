/turf/simulated/wall/invincible
	icon_state = "r_invinsible"
	floor_type = /turf/simulated/floor/reinforced
	mouse_opacity = MOUSE_OPACITY_UNCLICKABLE
	icon = 'mods/_fd/fd_assets/icons/wall_masks.dmi'

/turf/simulated/wall/invincible/New(newloc)
	..(newloc, MATERIAL_PLASTEEL,MATERIAL_TITANIUM)

/turf/simulated/wall/invincible/Initialize()
	. = ..()
	desc = "A wall. You cannot pass through this one."

/turf/simulated/wall/invincible/bullet_act()
	return

/turf/simulated/wall/invincible/can_damage_health()
	SHOULD_CALL_PARENT(FALSE)
	return FALSE

/turf/simulated/wall/invincible/attack_hand()
	return

/turf/simulated/wall/invincible/use_tool()
	SHOULD_CALL_PARENT(FALSE)
	return

/turf/simulated/wall/invincible/can_melt()
	return

/turf/simulated/wall/invincible/ex_act()
	return

/turf/simulated/wall/invincible/hitby()
	return

/turf/simulated/wall/invincible/prepainted
	paint_color = COLOR_GUNMETAL

// CM COOL BEAUTIFUL WALLS //

/turf/simulated/wall/invincible/blend
	icon = 'mods/_fd/fd_assets/icons/turfs/wall/strata_jungle.dmi'
	icon_state = "strata_jungle"
	floor_type = /turf/simulated/floor/exoplanet/fd/drought
	mouse_opacity = MOUSE_OPACITY_NORMAL
	/// If TRUE, then allow mine wall with pickaxe's.
	var/can_mine = FALSE
	/// Mining with emitter
	var/emitter_blasts_taken = 0
	/// For message spamming
	var/last_act = 0

/turf/simulated/wall/invincible/blend/update_material()
	if(!material)
		material = SSmaterials.get_material_by_name(DEFAULT_WALL_MATERIAL)
	update_connections(1)
	update_icon()
	calculate_damage_data()

/turf/simulated/wall/invincible/blend/set_material(material/newmaterial, material/newrmaterial)
	material = newmaterial
	reinf_material = newrmaterial
	update_material()

/turf/simulated/wall/invincible/blend/on_update_icon()
	queue_ao(FALSE)

	if(!material)
		return

	if(!damage_overlays[1]) //list hasn't been populated; note that it is always of fixed length, so we must check for membership.
		generate_overlays()

	ClearOverlays()

	var/image/I
	var/base_color = paint_color
	for(var/i = 1 to 4)
		I = image(initial(icon), "[initial(icon_state)][wall_connections[i]]", dir = SHIFTL(1, i - 1))
		I.color = base_color
		AddOverlays(I)

	if(get_damage_value() != 0)
		var/overlay = round((get_damage_percentage() / 100) * length(damage_overlays)) + 1
		overlay = clamp(overlay, 1, length(damage_overlays))

		AddOverlays(damage_overlays[overlay])
	return

/turf/simulated/wall/invincible/blend/generate_overlays()
	var/alpha_inc = 256 / length(damage_overlays)

	for(var/i = 1; i <= length(damage_overlays); i++)
		var/image/img = image(icon = 'icons/turf/walls.dmi', icon_state = "overlay_damage")
		img.blend_mode = BLEND_MULTIPLY
		img.alpha = (i * alpha_inc) - 1
		damage_overlays[i] = img

/turf/simulated/wall/invincible/blend/update_connections(propagate = 0)
	if(!material)
		return
	var/list/wall_dirs = list()
	var/list/other_dirs = list()

	for(var/turf/simulated/wall/W in orange(src, 1))
		switch(can_join_with(W))
			if(0)
				continue
			if(1)
				wall_dirs += get_dir(src, W)
			if(2)
				wall_dirs += get_dir(src, W)
				other_dirs += get_dir(src, W)
		if(propagate)
			W.update_connections()
			W.update_icon()

	for(var/turf/T in orange(src, 1))
		var/success = 0
		for(var/obj/O in T)
			for(var/b_type in blend_objects)
				if(istype(O, b_type))
					success = 1
				for(var/nb_type in noblend_objects)
					if(istype(O, nb_type))
						success = 0
				if(success)
					break
			if(success)
				break

		if(success)
			wall_dirs += get_dir(src, T)
			if(get_dir(src, T) in GLOB.cardinal)
				other_dirs += get_dir(src, T)

	wall_connections = dirs_to_corner_states(wall_dirs)
	other_connections = dirs_to_corner_states(other_dirs)

/turf/simulated/wall/invincible/blend/can_join_with(turf/simulated/wall/W)
	if(material && W.material && material.wall_icon_base == W.material.wall_icon_base)
		if((reinf_material && W.reinf_material) || (!reinf_material && !W.reinf_material))
			return 1
		return 2
	for(var/wb_type in blend_turfs)
		if(istype(W, wb_type))
			return 2
	return 0

/turf/simulated/wall/invincible/blend/bullet_act(obj/item/projectile/Proj)

	// Emitter blasts
	if(istype(Proj, /obj/item/projectile/beam/emitter))
		if(can_mine)
			emitter_blasts_taken++
			if(emitter_blasts_taken > 2) // 3 blasts per tile
				new/obj/particle_emitter/burst/rocks(src, 1 SECOND, color)
				ChangeTurf(floor_type)

/turf/simulated/wall/invincible/blend/Bumped(AM)
	. = ..()
	if (ismob(AM))
		var/mob/mob = AM
		var/obj/item/pickaxe/pickaxe = mob.IsHolding(/obj/item/pickaxe)
		if (pickaxe)
			if(can_mine)
				use_tool(pickaxe, mob)
			else
				to_chat(usr, SPAN_WARNING("You can't mine this wall!"))

/turf/simulated/wall/invincible/blend/use_tool(obj/item/W, mob/living/user, list/click_params)
	if (!user.IsAdvancedToolUser())
		to_chat(usr, SPAN_WARNING("You don't have the dexterity to do this!"))
		return TRUE

	if (istype(W, /obj/item/pickaxe))
		if(!istype(user.loc, /turf))
			return
		if(!can_mine)
			to_chat(usr, SPAN_WARNING("You can't mine this wall!"))
			return
		var/obj/item/pickaxe/P = W
		if(last_act + P.digspeed > world.time)//prevents message spam
			to_chat(user, SPAN_WARNING("You cannot use \the [W] again so soon!"))
			return TRUE

		last_act = world.time
		playsound(user, P.drill_sound, 20, 1)

		to_chat(user, SPAN_NOTICE("You start [P.drill_verb]."))

		if(do_after(user, P.digspeed, src,  DO_DEFAULT | DO_PUBLIC_PROGRESS))

			to_chat(user, SPAN_NOTICE("You finish [P.drill_verb] \the [src]."))
			//Let's add some effects
			new/obj/particle_emitter/burst/rocks(src, 1 SECOND, color)
			ChangeTurf(floor_type)
		return TRUE

	else
		return ..()

// Walls here

/turf/simulated/wall/invincible/blend/jungle
	icon = 'mods/_fd/fd_assets/icons/turfs/wall/strata_jungle.dmi'
	icon_state = "strata_jungle"
	floor_type = /turf/simulated/floor/exoplanet/fd/grass

/turf/simulated/wall/invincible/blend/cave
	icon = 'mods/_fd/fd_assets/icons/turfs/wall/cave.dmi'
	icon_state = "cavewall"
	floor_type = /turf/simulated/floor/exoplanet/fd/drought

/turf/simulated/wall/invincible/blend/cave/gray
	color = "#3d3a37"

/turf/simulated/wall/invincible/blend/cave/brown
	color = "#544332"

/turf/simulated/wall/invincible/blend/rock
	icon = 'mods/_fd/fd_assets/icons/turfs/wall/kutjevo.dmi'
	icon_state = "rock_border"
	floor_type = /turf/simulated/floor/exoplanet/fd/drought

/turf/simulated/wall/invincible/blend/rock/dark
	icon = 'mods/_fd/fd_assets/icons/turfs/wall/kutjevorockdark.dmi'
