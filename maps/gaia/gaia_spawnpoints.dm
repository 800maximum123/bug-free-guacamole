
GLOBAL_LIST_EMPTY(latejoin_barracks_scg)
GLOBAL_LIST_EMPTY(latejoin_officer_barracks_iccg)

GLOBAL_LIST_EMPTY(latejoin_officer_barracks_scg)
GLOBAL_LIST_EMPTY(latejoin_barracks_iccg)

GLOBAL_LIST_EMPTY(latejoin_area_of_operations)

// -- SCG Spawnpoints --
/datum/spawnpoint/scg_barracks
	display_name = "SCG Barracks"
	disallow_job = list("Commanding Officer", "Platoon Sergeant", "Squad Leader", "Komandir Vzvoda", "Nachalnik Shtaba", "Voyennyy Vrach", "Voyennyy Inzhener", "Voyennyy Politseyskiy", "Komandir Otdeleniya", "Pekhotinets", "Citizen")

/datum/spawnpoint/scg_barracks/New()
	..()
	turfs = GLOB.latejoin_barracks_scg

/datum/spawnpoint/scg_officer_barracks
	display_name = "SCG Officer Barracks"
	disallow_job = list("Field Engineer", "Trooper", "Komandir Vzvoda", "Nachalnik Shtaba", "Voyennyy Vrach", "Voyennyy Inzhener", "Voyennyy Politseyskiy", "Komandir Otdeleniya", "Pekhotinets", "Citizen")

/datum/spawnpoint/scg_officer_barracks/New()
	..()
	turfs = GLOB.latejoin_officer_barracks_scg

// -- ICCG Spawnpoints --
/datum/spawnpoint/iccg_barracks
	display_name = "ICCG Barracks"
	disallow_job = list("Commanding Officer", "Platoon Sergeant", "Squad Leader", "Field Engineer", "Field Medic", "Trooper", "Komandir Vzvoda", "Nachalnik Shtaba", "Voyennyy Vrach", "Komandir Otdeleniya", "Citizen")

/datum/spawnpoint/iccg_barracks/New()
	..()
	turfs = GLOB.latejoin_barracks_iccg

/datum/spawnpoint/iccg_officer_barracks
	display_name = "ICCG Officer Barracks"
	disallow_job = list("Commanding Officer", "Platoon Sergeant", "Squad Leader", "Field Engineer", "Field Medic", "Trooper", "Voyennyy Inzhener", "Voyennyy Politseyskiy", "Pekhotinets", "Citizen")

/datum/spawnpoint/iccg_officer_barracks/New()
	..()
	turfs = GLOB.latejoin_officer_barracks_iccg

// -- Miscellaneous Spawnpoints --
/datum/spawnpoint/area_of_operations
	display_name = "Area of Operations"
	disallow_job = list("Commanding Officer", "Platoon Sergeant", "Squad Leader", "Field Engineer", "Field Medic", "Trooper", "Komandir Vzvoda", "Nachalnik Shtaba", "Voyennyy Vrach", "Voyennyy Inzhener", "Voyennyy Politseyskiy", "Komandir Otdeleniya", "Pekhotinets")

/datum/spawnpoint/area_of_operations/New()
	..()
	turfs = GLOB.latejoin_area_of_operations
