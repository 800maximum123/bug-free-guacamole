GLOBAL_LIST_EMPTY(latejoin_area_of_operations)

GLOBAL_LIST_EMPTY(latejoin_barracks_scg)
GLOBAL_LIST_EMPTY(latejoin_officer_barracks_scg)

GLOBAL_LIST_EMPTY(latejoin_barracks_iccg)
GLOBAL_LIST_EMPTY(latejoin_officer_barracks_iccg)

// -- Miscellaneous Spawnpoints --
/datum/spawnpoint/area_of_operations
	display_name = "Area of Operations"
	restrict_job = list("Citizen", "Town Mayor", "Police Officer", "Paramedic", "Firefighter", "Municipal Engineer", "Priest")
	/// Cover the spawned people in dirt? Used for maps of city ruins or similiar.
	var/is_dirty = TRUE

/datum/spawnpoint/area_of_operations/New()
	..()
	turfs = GLOB.latejoin_area_of_operations

/datum/spawnpoint/area_of_operations/after_join(mob/living/carbon/human/victim)
	if(!is_dirty)
		return
	if(!istype(victim))
		return
	var/list/to_cover = list(
		victim.head,
		victim.wear_mask,
		victim.wear_suit,
		victim.w_uniform,
		victim.gloves,
		victim.shoes,
		victim.glasses,
		victim.belt,
		victim.s_store,
		)

	for(var/obj/item/clothing/C in to_cover)
		if(prob(50))
			return
		C.blood_color = SYNTH_BLOOD_COLOUR
		if(!C.blood_overlay)
			C.generate_blood_overlay()
			C.blood_DNA = list()
			C.blood_overlay.color = SYNTH_BLOOD_COLOUR
			C.AddOverlays(C.blood_overlay)
		if(istype(C, /obj/item/clothing/shoes))
			var/obj/item/clothing/shoes/S = C
			S.track_blood = max(3,S.track_blood)

	if (victim.buckled && istype(victim.buckled, /obj/structure/bed/chair/wheelchair))
		var/obj/structure/bed/chair/wheelchair/W = victim.buckled
		W.bloodiness = 4

	victim.update_icons()

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
