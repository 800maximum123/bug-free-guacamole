// Spawns vehicles at the start of the round as placing them in the map causes issues
/obj/landmark/vehicle_spawnpoint
	name = "test vehicle spawnpoint"
	var/obj/vehicles/vehicle = /obj/vehicles/large/warthog

/obj/landmark/vehicle_spawnpoint/New()
	SHOULD_CALL_PARENT(FALSE)
	if(vehicle)
		new vehicle(src.loc)

	delete_me = TRUE

/obj/landmark/vehicle_spawnpoint/exploration
	name = "exploration vehicle spawnpoint"
	vehicle = /obj/vehicles/large/exploration
