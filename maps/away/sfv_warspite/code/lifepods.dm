/area/warspite/lifepod
	name = "Warspite | Lifepod One"
	icon_state = "yellow"

/area/warspite/lifepod/two
	name = "Warspite | Lifepod Two"

/area/warspite/lifepod/three
	name = "Warspite | Lifepod Three"

/area/warspite/lifepod/four
	name = "Warspite | Lifepod Four"

/area/warspite/lifepod/five
	name = "Warspite | Lifepod Five"

/area/warspite/lifepod/six
	name = "Warspite | Lifepod Six"

/obj/shuttle_landmark/lifepod
	name = "Lifepod One Landing Zone"
	landmark_tag = "nav_lifepod_one_start"
	movable_flags = MOVABLE_FLAG_EFFECTMOVE

/obj/shuttle_landmark/lifepod/two
	name = "Lifepod Two Landing Zone"
	landmark_tag = "nav_lifepod_two_start"

/obj/shuttle_landmark/lifepod/three
	name = "Lifepod Three Landing Zone"
	landmark_tag = "nav_lifepod_three_start"

/obj/shuttle_landmark/lifepod/four
	name = "Lifepod Four Landing Zone"
	landmark_tag = "nav_lifepod_four_start"

/obj/shuttle_landmark/lifepod/five
	name = "Lifepod Five Landing Zone"
	landmark_tag = "nav_lifepod_five_start"

/obj/shuttle_landmark/lifepod/six
	name = "Lifepod Six Landing Zone"
	landmark_tag = "nav_lifepod_six_start"

/obj/overmap/visitable/ship/landable/lifepod
	name = "Lifepod One"
	shuttle = "lifepod_one"
	desc = "Wake signature indicates a small lifepod, broadcasting emergency codes ."
	fore_dir = NORTH
	color = "#0751f3"
	alpha = 255
//	integrity_failure_cap = 150
	skill_needed = SKILL_UNSKILLED
	vessel_mass = 1800
	vessel_size = SHIP_SIZE_TINY
	max_speed = 1/(20 SECONDS) // 5 GM/H.
	burn_delay = 5 SECONDS
	hide_from_reports = TRUE
//	known = 0

/datum/shuttle/autodock/overmap/lifepod
	name = "lifepod_one"
	warmup_time = 10 SECONDS
	range = 0
	shuttle_area = list(
		/area/warspite/lifepod
	)
	defer_initialisation = TRUE
	skill_needed = SKILL_UNSKILLED
	ceiling_type = /turf/simulated/floor/reinforced
	current_location = "nav_lifepod_one_start"

/obj/overmap/visitable/ship/landable/lifepod/two
	name = "Lifepod Two"
	shuttle = "lifepod_two"
	fore_dir = WEST

/datum/shuttle/autodock/overmap/lifepod/two
	name = "lifepod_two"
	shuttle_area = list(
		/area/warspite/lifepod/two
	)
	current_location = "nav_lifepod_two_start"


/obj/overmap/visitable/ship/landable/lifepod/three
	name = "Lifepod Three"
	shuttle = "lifepod_three"
	fore_dir = SOUTH
//	known = 0


/datum/shuttle/autodock/overmap/lifepod/three
	name = "lifepod_three"
	shuttle_area = list(
		/area/warspite/lifepod/three
	)
	current_location = "nav_lifepod_three_start"


/obj/overmap/visitable/ship/landable/lifepod/four
	name = "Lifepod Four"
	shuttle = "lifepod_four"
	fore_dir = NORTH

/datum/shuttle/autodock/overmap/lifepod/four
	name = "lifepod_four"
	shuttle_area = list(
		/area/warspite/lifepod/four
	)
	current_location = "nav_lifepod_four_start"


/obj/overmap/visitable/ship/landable/lifepod/five
	name = "Lifepod Five"
	shuttle = "lifepod_five"
	fore_dir = EAST

/datum/shuttle/autodock/overmap/lifepod/five
	name = "lifepod_five"
	shuttle_area = list(
		/area/warspite/lifepod/five
	)
	current_location = "nav_lifepod_five_start"


/obj/overmap/visitable/ship/landable/lifepod/six
	name = "Lifepod Six"
	shuttle = "lifepod_six"
	fore_dir = SOUTH

/datum/shuttle/autodock/overmap/lifepod/six
	name = "lifepod_six"
	shuttle_area = list(
		/area/warspite/lifepod/six
	)
	current_location = "nav_lifepod_six_start"
