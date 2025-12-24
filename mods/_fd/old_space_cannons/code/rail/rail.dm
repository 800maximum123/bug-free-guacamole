/obj/machinery/ship_weapon/front_part/rail
	name = "OA-99 primary magnetic accelerator"
	desc = "Initial velocity Magnetic Accelerator.\
		<br>A sign on it reads: <i>STAY CLEAR! DO NOT BLOCK!</i>"
	icon_state = "front"

/obj/machinery/ship_weapon/middle_part/rail
	name = "OA-99 heating unit"
	desc = "Munition heating system. \
		<br>A sign on it reads: <i>EXPLOSIVE! DO NOT OVERHEAT!</i>"
	icon_state = "middle"
	var/link_range = 7
	var/list/modules = list()

/obj/machinery/ship_weapon/back_part/rail
	name = "OA-99 munition rack"
	desc = "Ammo reciever. Munition then goes to heating unit."
	icon_state = "back"

/obj/machinery/ship_weapon/module_part/rail
	name = "OA-99 accelerator module"
	desc = "Velocity Accelerator."
	icon_state = "accelerator"
	density = FALSE
	idle_power_usage = 1000

/obj/machinery/ship_weapon/module_part/rail/Initialize()
	. = ..()
	dir = pick(1,2,4,8)

/obj/machinery/ship_weapon/middle_part/rail/Initialize()
	. = ..()
	Connect()

/obj/machinery/ship_weapon/middle_part/rail/proc/Connect()
	for(var/obj/machinery/ship_weapon/module_part/rail/part in orange(link_range,src))
		if(part in modules)
			continue
		modules += part

	for(var/obj/machinery/ship_weapon/module_part/rail/part in modules)
		if(!part)
			modules -= part
	modules_amount = length(modules)

/obj/machinery/ship_weapon/middle_part/rail/use_tool(obj/item/O, mob/user)
	if(istype(O, /obj/item/device/multitool))
		Connect()
		to_chat(user, "Connecting [src] with modules...")
	..()

////////////////////////////////CIRCUIT////////////////////////////////

/obj/item/stock_parts/circuitboard/rail
	name = "circuit board (railgun control)"
	build_path = /obj/machinery/computer/ship/ship_weapon/rail_gun
	origin_tech = list(TECH_ENGINEERING = 2, TECH_COMBAT = 2, TECH_ESOTERIC = 4)

/obj/item/stock_parts/circuitboard/railfront
	name = "circuit board (railgun PM-Accelerator)"
	build_path = /obj/machinery/ship_weapon/front_part/rail
	board_type = "machine"
	origin_tech = list(TECH_ENGINEERING = 6, TECH_COMBAT = 4, TECH_MAGNET = 6)
	req_components = list (
		/obj/item/stack/material/plasteel = 20,
		/obj/item/stock_parts/capacitor/super = 2
	)

/obj/item/stock_parts/circuitboard/railmiddle
	name = "circuit board (railgun heating unit)"
	build_path = /obj/machinery/ship_weapon/middle_part/rail
	board_type = "machine"
	origin_tech = list(TECH_ENGINEERING = 6, TECH_COMBAT = 4, TECH_PHORON = 2)
	req_components = list (
		/obj/item/stack/material/ocp = 20,
		/obj/item/stack/material/phoron = 20
	)

/obj/item/stock_parts/circuitboard/railback
	name = "circuit board (railgun munition rack)"
	build_path = /obj/machinery/ship_weapon/back_part/rail
	board_type = "machine"
	origin_tech = list(TECH_ENGINEERING = 4, TECH_COMBAT = 2)
	req_components = list (
		/obj/item/stock_parts/capacitor/super = 3,
		/obj/item/stock_parts/manipulator/pico = 3
	)

/obj/item/stock_parts/circuitboard/railaccelerator
	name = "circuit board (railgun accelerator module)"
	build_path = /obj/machinery/ship_weapon/module_part/rail
	board_type = "machine"
	origin_tech = list(TECH_ENGINEERING = 2, TECH_COMBAT = 2, TECH_MAGNET = 2)
	req_components = list (
		/obj/item/stack/material/rods = 10,
		/obj/item/stock_parts/capacitor = 1,
		/obj/item/stack/material/plasteel = 2,
		/obj/item/stock_parts/power/terminal
	)
