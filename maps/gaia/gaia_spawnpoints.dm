GLOBAL_LIST_EMPTY(latejoin_area_of_operations)

GLOBAL_LIST_EMPTY(latejoin_barracks_scg)
GLOBAL_LIST_EMPTY(latejoin_officer_barracks_scg)

GLOBAL_LIST_EMPTY(latejoin_barracks_iccg)
GLOBAL_LIST_EMPTY(latejoin_officer_barracks_iccg)

// -- Miscellaneous Spawnpoints --
/datum/spawnpoint/area_of_operations
	display_name = "Area of Operations"
	restrict_job = list("Citizen", "Town Mayor", "Policeman", "Paramedic", "Firefighter", "Construction Worker", "Priest")

/datum/spawnpoint/area_of_operations/New()
	..()
	turfs = GLOB.latejoin_area_of_operations

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
