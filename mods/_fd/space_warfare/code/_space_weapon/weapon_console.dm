/obj/machinery/computer/space_weapons
	name = "weapons control"
	icon = 'icons/obj/machines/computer.dmi'
	icon_state = "computer"

	core_skill = SKILL_PILOT

	icon_keyboard = "syndie_key" // Red means war
	icon_screen = "teleport"

	/// Automatically links with any weapon that has the same id
	var/id

	/// Direction in which our overmap representations will travel
	var/shooting_dir = 0

	/// X and Y of turf that will be targeted after entering map_z of an overmap object
	var/coords_x = 100
	var/coords_y = 100

	/// List of linked weapon refs that we will NOT shoot when ordered to fire
	var/list/disabled_weapons = list()
	/// List of all linked weapons
	var/list/linked_weapons = list()

	/// Should we try and fire linked weapons indefinitely
	var/loop_fire = FALSE

/obj/item/stock_parts/circuitboard/weapon_control
	name = "circuit board (weapons control)"
	build_path = /obj/machinery/computer/space_weapons
	origin_tech = list(TECH_ENGINEERING = 2, TECH_COMBAT = 4)

/obj/machinery/computer/space_weapons/Initialize()
	. = ..()
	//set_extension(src, /datum/extension/interactive/multitool/store)
	START_PROCESSING_MACHINE(src, MACHINERY_PROCESS_SELF)
	return INITIALIZE_HINT_LATELOAD

/obj/machinery/computer/space_weapons/LateInitialize(mapload, ...)
	. = ..()
	if(id)
		link_weapons()

/obj/machinery/computer/space_weapons/Destroy()
	. = ..()
	STOP_PROCESSING_MACHINE(src, MACHINERY_PROCESS_SELF)

/obj/machinery/computer/space_weapons/Process()
	if(!loop_fire)
		return

	for(var/datum/space_weapon/weapon as anything in linked_weapons)
		if(any2ref(weapon) in disabled_weapons)
			continue

		var/estimated_heat = weapon.heat_per_bullet * weapon.burst_size
		if(weapon.current_heat + estimated_heat > weapon.max_heat)
			continue

		weapon.fire(shooting_dir, list(coords_x, coords_y))

/obj/machinery/computer/space_weapons/use_tool(obj/item/tool, mob/living/user, list/click_params)
	. = ..()
	if(isMultitool(tool))
		var/obj/item/device/multitool/multitool = tool
		var/datum/space_weapon/buffer = multitool.buffer_object
		if(!buffer)
			return FALSE
		if(QDELETED(buffer))
			to_chat(user, SPAN_NOTICE("Buffer no longer exists. Purging."))
			multitool.buffer_object = null
			return FALSE
		if(!istype(buffer))
			return FALSE
		if(buffer in linked_weapons)
			to_chat(user, SPAN_NOTICE("[buffer.name] is already linked to this console. Purging buffer."))
			multitool.buffer_object = null
			return FALSE
		to_chat(user, SPAN_NOTICE("Successfully linked [buffer.name] to console. Purging buffer."))
		linked_weapons += buffer
		multitool.buffer_object = null
		return TRUE

/obj/machinery/computer/space_weapons/proc/link_weapons()
	for(var/datum/space_weapon/weapon as anything in GLOB.space_weapon_datums)
		if(weapon.id == id)
			linked_weapons += weapon

/obj/machinery/computer/space_weapons/interface_interact(mob/user)
	ui_interact(user)
	return TRUE

/obj/machinery/computer/space_weapons/ui_interact(mob/user, ui_key = "main", datum/nanoui/ui = null, force_open = TRUE)
	var/data[0]

	data["coords_x"] = coords_x
	data["coords_y"] = coords_y
	data["coordinates"] = coords_x != 100 || coords_y != 100
	data["shooting_dir"] = shooting_dir

	var/list/weapons = list()
	for(var/datum/space_weapon/weapon as anything in linked_weapons)
		var/ref = any2ref(weapon)
		var/cd = (weapon.next_shot - world.time)
		var/heat = ceil(weapon.current_heat / weapon.max_heat * 100)

		var/color = "#40628a"
		var/control = TRUE
		if(!weapon.check_parts())
			color = COLOR_RED
			control = FALSE
		else if(!weapon.check_power())
			color = COLOR_BLACK
			control = FALSE
		else if(!weapon.get_ammo())
			color = COLOR_GRAY
		else if(weapon.next_shot > world.time)
			color = COLOR_ORANGE

		var/cd_message = cd > 0 ? "[ceil(cd / 10)] SEC" : "READY"

		weapons.Add(list(list(\
			"ref" = ref, \
			"name" = weapon.name, \
			"ignore" = (ref in disabled_weapons), \
			"color" = color, \
			"control" = control, \
			"cd_message" = cd_message, \
			"heat" = heat)))

	data["linked_weapons"] = weapons
	data["loop_fire"] = loop_fire

	ui = SSnano.try_update_ui(user, src, ui_key, ui, data, force_open)
	if(!ui)
		ui = new(user, src, ui_key, "mods-weapon.tmpl", "Weapons Control", 420, 550)
		ui.set_initial_data(data)
		ui.open()
		ui.set_auto_update(1)

/obj/machinery/computer/space_weapons/OnTopic(mob/user, list/href_list, state)
	. = ..()
	if(.)
		return

	var/direction = href_list["direction"]
	if(direction)
		shooting_dir = sanitize_integer(text2num(direction), 0, 10, 0)

	var/toggle_loop = href_list["toggle_loop"]
	if(toggle_loop)
		loop_fire = !loop_fire

	var/toggled_gun = href_list["toggled_gun"] // Remember this returns a ref
	if(toggled_gun)
		if(toggled_gun in disabled_weapons)
			disabled_weapons -= toggled_gun
		else
			disabled_weapons |= toggled_gun

	if(href_list["setx"])
		var/newx = input("Input new target x coordinate", "Coordinate input", coords_x) as num|null
		if(!CanInteract(user,state))
			return

		if(newx)
			coords_x = clamp(newx, SW_MIN_COORD, SW_MAX_COORD)

	if(href_list["sety"])
		var/newy = input("Input new target y coordinate", "Coordinate input", coords_y) as num|null
		if(!CanInteract(user,state))
			return

		if(newy)
			coords_y = clamp(newy, SW_MIN_COORD, SW_MAX_COORD)

	if(href_list["reset"])
		coords_x = 100
		coords_y = 100

	if(href_list["fire"])
		for(var/datum/space_weapon/weapon as anything in linked_weapons)
			if(any2ref(weapon) in disabled_weapons)
				continue

			weapon.fire(shooting_dir, list(coords_x, coords_y))

	return TOPIC_REFRESH
