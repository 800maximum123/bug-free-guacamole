/proc/everyone_look_at_overmap(anim_time = 10 SECONDS, reset_delay = 20 SECONDS, anim_distance = 150)
	set waitfor = FALSE

	anim_distance *= 32

	var/list/affected_mobs = list()
	for(var/client/client as() in GLOB.clients)
		if(!client)
			continue
		ADD_TRANSFORMATION_MOVEMENT_HANDLER(client.mob)
		sound_to(client.mob, sound('sound/ambience/ominous3.ogg', volume = 60))
		client.mob.reset_view(null)
		affected_mobs += client.mob
		animate(client, pixel_y = anim_distance, time = anim_time/2, easing = CUBIC_EASING|EASE_IN)

	for(var/mob/mob as() in affected_mobs)
		var/obj/overmap/current_ship = map_sectors["[mob.loc.z]"]
		if(!current_ship)
			continue
		current_ship.invisibility = 0

	sleep(anim_time/2)

	for(var/client/client as() in GLOB.clients)
		if(!client)
			continue
		client.pixel_y = -anim_distance
		client.adminobs = TRUE
		client.mob.reset_view(map_sectors["[client.mob.loc.z]"])
		animate(client, pixel_y = 0, time = anim_time/2, easing = CUBIC_EASING|EASE_OUT)

	sleep(reset_delay)

	for(var/client/client as() in GLOB.clients)
		if(!client)
			continue
		animate(client, pixel_y = -anim_distance, time = anim_time/2, easing = CUBIC_EASING|EASE_IN)

	sleep(anim_time/2)

	for(var/client/client as() in GLOB.clients)
		if(!client)
			continue
		client.pixel_y = anim_distance
		client.adminobs = null
		client.mob.reset_view(null)
		animate(client, pixel_y = 0, time = anim_time/2, easing = CUBIC_EASING|EASE_OUT)

	sleep(anim_time/2)

	for(var/mob/mob as() in affected_mobs)
		var/obj/overmap/current_ship = map_sectors["[mob.loc.z]"]
		current_ship.invisibility = INVISIBILITY_OVERMAP
		// in theory, if someone flies off the ship during the animation - we can accidentially leave it visible for the rest of the round, but gah who cares
