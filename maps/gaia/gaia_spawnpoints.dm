GLOBAL_LIST_EMPTY(latejoin_barracks_scg)
GLOBAL_LIST_EMPTY(latejoin_officer_barracks_scg)
GLOBAL_LIST_EMPTY(latejoin_prison_scg)

GLOBAL_LIST_EMPTY(latejoin_barracks_iccg)
GLOBAL_LIST_EMPTY(latejoin_officer_barracks_iccg)
GLOBAL_LIST_EMPTY(latejoin_prison_iccg)

GLOBAL_LIST_EMPTY(latejoin_area_of_operations)

// -- SPAWN PROCS --
/datum/spawnpoint/proc/after_prison(mob/living/victim)
	var/singleton/hierarchy/outfit/prison_outfit = /singleton/hierarchy/outfit/job/gaia/prisoner
	var/pre_to_move = list(
		/obj/item/clothing, /obj/item/storage, /obj/item/radio,
		/obj/item/card, /obj/item/melee, /obj/item/device,
		)

	if(!istype(victim))
		return

	// Collect clothing items the victim currently has equipped/contained
	var/list/to_move = list()
	for(var/obj/item/I in victim.contents)
		for(var/obj/item/Pre_I in pre_to_move)
			if(istype(I, Pre_I))
				to_move += I

	// Get the victim's location and area
	var/turf/T = get_turf(victim)
	var/area/A = T?.loc

	// Find all brig closets and racks in the same area with default names
	var/obj/structure/closet/secure_closet/brig/available_closet = null
	var/obj/structure/table/rack/available_rack = null

	if(A)
		for(var/obj/structure/closet/secure_closet/brig/closet in A)
			if(closet.name == initial(closet.name))
				available_closet = closet
				break

		if(!available_closet)
			for(var/obj/structure/table/rack/rack in A)
				if(rack.name == initial(rack.name))
					available_rack = rack
					break

	var/obj/target = available_closet || available_rack

	// Set name to victim's name if we found a target
	if(target)
		target.name = victim.name

	// Move clothing items to the found container, otherwise drop them onto the turf
	for(var/obj/item/I in to_move)
		if(istype(I))
			if(target)
				I.Move(target)
			else if(T)
				I.Move(T)

	// Finally, equip the prisoner outfit
	if(prison_outfit && istype(prison_outfit, /singleton/hierarchy/outfit))
		. = prison_outfit.equip(victim)
	alert(victim, "You're a prisoner of war and have been stripped of your belongings. This was done because you set your spawnpoint to a prison. If this has been done by mistake send an AHELP to the admins.")

// -- SCG Spawnpoints --
/datum/spawnpoint/scg_barracks
	display_name = "SCG Barracks"
	restrict_job = list("Field Engineer", "Field Medic", "Trooper")

/datum/spawnpoint/scg_barracks/New()
	..()
	turfs = GLOB.latejoin_barracks_scg

/datum/spawnpoint/scg_officer_barracks
	display_name = "SCG Officer Barracks"
	restrict_job = list("Commanding Officer", "Platoon Sergeant", "Squad Leader", "Field Medic")

/datum/spawnpoint/scg_officer_barracks/New()
	..()
	turfs = GLOB.latejoin_officer_barracks_scg

/datum/spawnpoint/scg_prison
	display_name = "SCG Prison"

/datum/spawnpoint/scg_prison/New()
	..()
	turfs = GLOB.latejoin_prison_scg

/datum/spawnpoint/scg_prison/after_join(mob/living/victim)
	after_prison(victim)

// -- ICCG Spawnpoints --
/datum/spawnpoint/iccg_barracks
	display_name = "ICCG Barracks"
	restrict_job = list("Voyennyy Inzhener", "Voyennyy Politseyskiy", "Pekhotinets")

/datum/spawnpoint/iccg_barracks/New()
	..()
	turfs = GLOB.latejoin_barracks_iccg

/datum/spawnpoint/iccg_officer_barracks
	display_name = "ICCG Officer Barracks"
	restrict_job = list("Komandir Vzvoda", "Nachalnik Shtaba", "Voyennyy Vrach", "Komandir Otdeleniya")

/datum/spawnpoint/iccg_officer_barracks/New()
	..()
	turfs = GLOB.latejoin_officer_barracks_iccg

/datum/spawnpoint/iccg_prison
	display_name = "ICCG Prison"

/datum/spawnpoint/iccg_prison/New()
	..()
	turfs = GLOB.latejoin_prison_iccg

/datum/spawnpoint/iccg_prison/after_join(mob/living/victim)
	after_prison(victim)

// -- Miscellaneous Spawnpoints --
/datum/spawnpoint/area_of_operations
	display_name = "Area of Operations"
	restrict_job = list("Citizen")

/datum/spawnpoint/area_of_operations/New()
	..()
	turfs = GLOB.latejoin_area_of_operations
