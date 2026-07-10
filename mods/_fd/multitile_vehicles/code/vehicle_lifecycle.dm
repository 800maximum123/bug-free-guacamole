/obj/vehicles/Destroy()
	STOP_PROCESSING(SSobj, src)
	stop_working_soundloop()
	kick_occupants()
	. = ..()

/obj/vehicles/on_death()
	if(health_dead)
		return
	health_dead = TRUE
	movement_destroyed = TRUE
	guns_disabled = TRUE
	block_enter_exit = FALSE
	headlights_state = 2
	update_headlights(FALSE)
	icon_state = "[initial(icon_state)]_destroyed"
	fall()
	deactivate()
	if(has_alarm)
		stop_alarm_soundloop()
	if(wheels)
		CutOverlays(wheels)

	//get a viable list of places to eject our cargo
	density = FALSE
	var/list/turfs_base = list()
	for(var/turf/T in src.locs)
		if(not_turf_contains_dense_objects(T))
			turfs_base.Add(T)
	if(!turfs_base.len)
		turfs_base = src.locs.Copy()
	var/list/free_turfs = turfs_base.Copy()

	//reset the vehicle density
	density = TRUE

	while(cargo_contents.len)

		//remove it from the list
		var/atom/movable/A = cargo_contents[1]
		cargo_contents -= A

		//get a random turf
		var/turf/T = pick(free_turfs)

		//dont double up turfs
		free_turfs -= T
		if(!free_turfs.len)
			free_turfs = turfs_base.Copy()

		//eject it
		eject_cargo_item(A, T)
	for(var/mob/living/l in occupants)
		var/dam_max = BASE_VEHICLE_DEATH_EXPLODE_DAMAGE * ((bound_height / 32) + (bound_width / 32))/2
		l.adjustBruteLoss(dam_max/2)
		dam_max /= 2
		l.adjust_fire_stacks(10)
		l.IgniteMob()
		while(dam_max > 0)
			var/dam_deal = rand(dam_max/3,dam_max)
			dam_max -= dam_deal
			l.adjustBruteLoss(dam_deal)
	kick_occupants(TRUE)
	cell_explosion(src.loc, 150, 50, shrapnel = FALSE)
	var/list/fire_spread = get_turfs_in_range(src.loc, 2)

	for(var/turf/around in fire_spread)
		around.IgniteTurf(20, COLOR_YELLOW)

/obj/vehicles/proc/inactive_pilot_effects() //Overriden on a vehicle-by-vehicle basis.

/obj/vehicles/Process()
	if(world.time % 3)
		if(active)
			var/list/drivers = get_occupants_in_position(VP_DRIVER)
			if(!drivers.len || isnull(drivers) || movement_destroyed)
				inactive_pilot_effects()
