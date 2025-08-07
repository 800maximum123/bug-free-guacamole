/*////////////////////////////////
//          FABRICATORS         //
*/////////////////////////////////

/obj/machinery/fabricator/space_weapon
	name = "military autolathe"
	desc = "It produces ammo from common resources."
	base_type = /obj/machinery/fabricator/space_weapon
	fabricator_class = "military"
	base_storage_capacity = list(
		/material/steel = 50000,
	)
	machine_name = "military autolathe"
	machine_desc = "A military-grade autolathe, which serves as a space weapons ammo supplyer."
	color = COLOR_GRAY
	var/autoinsert_cooldown = 0.5 SECONDS
	var/next_autoinsert = 0

/obj/machinery/fabricator/space_weapon/get_next_build()
	currently_building = null
	if(length(queued_orders))
		currently_building = queued_orders[1]
		queued_orders -= currently_building
		try_queue_build(currently_building.target_recipe, currently_building.multiplier)
		start_building()
	else
		stop_building()
	updateUsrDialog()

/obj/machinery/fabricator/space_weapon/Bumped(AM)
	. = ..()
	if(!has_recycler)
		return

	if(!istype(AM, /obj/item/stack/material))
		return

	if(world.time < next_autoinsert)
		return

	var/obj/item/stack/stack = AM
	var/turf/prev_loc = stack.loc

	stack.forceMove(null)

	var/result = take_materials(stack, null)
	if(result == -1) // SUBSTANCE_TAKEN_NONE
		stack.forceMove(prev_loc)
		return TRUE

	playsound(loc, 'mods/_fd/space_warfare/sounds/loading_sound.mp3', 100, TRUE)
	next_autoinsert = world.time + autoinsert_cooldown
	if(!QDELETED(stack) && stack.amount > 0)
		stack.forceMove(prev_loc)

/obj/machinery/fabricator/space_weapon/pre_loaded/Initialize()
	. = ..()
	stored_material[/material/steel] = base_storage_capacity[/material/steel]


/*////////////////////////////////
//         BASIC RECIPE         //
*/////////////////////////////////

/datum/fabricator_recipe/space_weapon
	path = /obj/item/ammo_casing/space_weapon
	build_time = 1 SECONDS
	fabricator_types = list("military")


/*////////////////////////////////
//           CIRCUITS           //
*/////////////////////////////////

/obj/item/stock_parts/circuitboard/autolathe/space_weapon
	name = "circuit board (military autolathe)"
	build_path = /obj/machinery/fabricator/space_weapon
	board_type = "machine"
	origin_tech = list(TECH_ENGINEERING = 3, TECH_DATA = 2, TECH_COMBAT = 2)
	req_components = list(
							/obj/item/stock_parts/matter_bin = 3,
							/obj/item/stock_parts/manipulator = 1)
	additional_spawn_components = list(
		/obj/item/stock_parts/console_screen = 1,
		/obj/item/stock_parts/keyboard = 1,
		/obj/item/stock_parts/power/apc/buildable = 1
	)
