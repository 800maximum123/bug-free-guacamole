/proc/everyone_look_at_torch(anim_time = 10 SECONDS, reset_delay = 20 SECONDS, anim_distance = 150)
	anim_distance *= 32

	for(var/obj/overmap/known_ship as() in GLOB.known_overmap_sectors)
		known_ship.invisibility = 0
	var/list/affected_mobs = list()
	for(var/client/client as() in GLOB.clients)
		ADD_TRANSFORMATION_MOVEMENT_HANDLER(client.mob)
		sound_to(client.mob, sound('sound/ambience/ominous3.ogg', volume = 60))
		client.mob.reset_view(null)
		affected_mobs += client.mob
		animate(client, pixel_y = anim_distance, time = anim_time/2, easing = CUBIC_EASING|EASE_IN)

	sleep(anim_time/2)

	for(var/client/client as() in GLOB.clients)
		client.pixel_y = -anim_distance
		client.adminobs = TRUE
		client.mob.reset_view(map_sectors["[client.mob.loc.z]"])
		animate(client, pixel_y = 0, time = anim_time/2, easing = CUBIC_EASING|EASE_OUT)

	sleep(reset_delay)

	for(var/client/client as() in GLOB.clients)
		animate(client, pixel_y = -anim_distance, time = anim_time/2, easing = CUBIC_EASING|EASE_IN)

	sleep(anim_time/2)

	for(var/obj/overmap/known_ship as() in GLOB.known_overmap_sectors)
		known_ship.invisibility = INVISIBILITY_OVERMAP
	for(var/client/client as() in GLOB.clients)
		client.pixel_y = anim_distance
		client.adminobs = null
		client.mob.reset_view(null)
		animate(client, pixel_y = 0, time = anim_time/2, easing = CUBIC_EASING|EASE_OUT)

	sleep(anim_time/2)

	for(var/mob/mob as() in affected_mobs)
		DEL_TRANSFORMATION_MOVEMENT_HANDLER(mob)
