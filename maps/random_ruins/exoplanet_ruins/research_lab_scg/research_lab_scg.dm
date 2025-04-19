// #include "scg_city_restored_shuttles.dm"
#include "code/areas.dm"
#include "code/closet.dm"
#include "code/jobs.dm"
#include "code/outfit.dm"

/datum/map_template/ruin/exoplanet/research_lab_scg
	name = "Research Lab of SCG"
	id = "research_lab_scg"
	description = "SCG City... Thats all, yeah."
	suffixes = list("research_lab_scg/research_lab_scg.dmm")
	spawn_cost = 10
	template_flags = TEMPLATE_FLAG_CLEAR_CONTENTS|TEMPLATE_FLAG_NO_RUINS
	ruin_tags = RUIN_HUMAN
//	shuttles_to_initialise = list(/datum/shuttle/autodock/overmap/lovely)

/singleton/submap_archetype/playablecity/research_lab_scg
	descriptor = "Research Lab of SCG"
	crew_jobs = list(
		/datum/job/submap/research_lab_scg,

		/datum/job/submap/research_lab_scg/research,
		/datum/job/submap/research_lab_scg/research/xenoarcheology,
		/datum/job/submap/research_lab_scg/research/xenoarcheology/lab,
		/datum/job/submap/research_lab_scg/research/roboticist,
		/datum/job/submap/research_lab_scg/research/roboticist/lab,
		/datum/job/submap/research_lab_scg/research/biology,
		/datum/job/submap/research_lab_scg/research/biology/lab,
		/datum/job/submap/research_lab_scg/research/bluespace,
		/datum/job/submap/research_lab_scg/research/bluespace/lab,
		/datum/job/submap/research_lab_scg/research/psycho,
		/datum/job/submap/research_lab_scg/research/psycho/lab,

		/datum/job/submap/research_lab_scg/agent,

		/datum/job/submap/research_lab_scg/service,
		/datum/job/submap/research_lab_scg/service/maintence,
		/datum/job/submap/research_lab_scg/service/colonist
	)

/obj/submap_landmark/spawnpoint/research_lab_scg/colonist
	name = "City Dweller"

/obj/submap_landmark/spawnpoint/citymayor_spawn
	name = "City Head"

/obj/submap_landmark/joinable_submap/city/research_lab_scg
	name = "Research Lab of SCG"
	archetype = /singleton/submap_archetype/playablecity/research_lab_scg
