/obj/structure/gaia/wheel
	name = "wheel"
	desc = "A wheel, used for vehicles."
	icon = 'maps/gaia/icons/structures/truck.dmi'
	icon_state = "wheel"
	density = FALSE
	anchored = TRUE

/obj/structure/gaia/wheel/flat
	name = "flat wheel"
	desc = "A flat wheel, was used for vehicles."
	icon_state = "wheel_flat"

/obj/structure/gaia/truck_shadow
	name = "shadow"
	desc = "A shadow cast by something."
	icon = 'maps/gaia/icons/structures/truck.dmi'
	icon_state = "truck_shadow1"
	density = FALSE
	anchored = TRUE

/obj/structure/gaia/truck_shadow/middle
	icon_state = "truck_shadow2"

/obj/structure/gaia/truck_shadow/right
	icon_state = "truck_shadow3"

// Headlights
/obj/machinery/light_construct/small/headlight
	fixture_type = /obj/machinery/light/small/headlight

/obj/machinery/light_construct/small/headlight/alt
	fixture_type = /obj/machinery/light/small/headlight/alt

/obj/machinery/light/small/headlight
	icon = 'maps/gaia/icons/structures/truck.dmi'
	icon_state = "headlight_map"
	base_state = "headlight"
	desc = "A small yet powerful lighting fixture for vehicle headlights."
	light_type = /obj/item/light/tube/large
	construct_type = /obj/machinery/light_construct/small

/obj/machinery/light/small/headlight/alt
	icon_state = "headlight_alt_map"
	base_state = "headlight_alt"
	construct_type = /obj/machinery/light_construct/small/headlight/alt

// SCG Truck Signs
/obj/structure/gaia/truck_sign
	name = "truck sign"
	desc = "A fading sign on the truck, it reads: 'Gaia El Envío. Llamar 1338.'"
	icon = 'maps/gaia/icons/structures/truck.dmi'
	icon_state = "truck_sign1"
	density = FALSE
	anchored = TRUE

/obj/structure/gaia/truck_sign/second
	icon_state = "truck_sign2"

// ICCG Truck Signs

/obj/structure/gaia/truck_sign/iccg
	name = "ICCG sign"
	desc = "Bold blue letters stating 'ГКК'"
	icon_state = "iccg_sign"

/obj/structure/gaia/truck_sign/iccg/medical
	name = "medical sign"
	desc = "Bold blue cross sign, indicating a medical vehicle."
	icon_state = "med_sign"

/obj/structure/gaia/truck_sign/iccg/mp
	name = "MP sign"
	desc = "Bold blue letters stating 'ВП - Военная Полиция'."
	icon_state = "mp_sign"

/obj/structure/window/reinforced/windshield
	icon = 'maps/gaia/icons/structures/truck.dmi'
	icon_state = "windshield"
	basestate = "windshield"
	reinf_basestate = "windshield"

/obj/structure/window/reinforced/windshield/left
	icon_state = "windshield_left"
	basestate = "windshield_left"
	reinf_basestate = "windshield_left"

/obj/structure/window/reinforced/windshield/right
	icon_state = "windshield_right"
	basestate = "windshield_right"
	reinf_basestate = "windshield_right"

// ICCG APC
/obj/structure/window/reinforced/windshield/iccg
	init_reinf_material = MATERIAL_PLASTEEL
	paint_color = COLOR_GUNMETAL

/obj/structure/window/reinforced/windshield/left/iccg
	init_reinf_material = MATERIAL_PLASTEEL
	paint_color = COLOR_GUNMETAL
	basestate = "windshield_left"
	reinf_basestate = "windshield_left"

/obj/structure/window/reinforced/windshield/right/iccg
	init_reinf_material = MATERIAL_PLASTEEL
	paint_color = COLOR_GUNMETAL
	basestate = "windshield_right"
	reinf_basestate = "windshield_right"

/obj/machinery/rotating_alarm/emergency_vehicle
	name = "emergency sirens"
	desc = "An rotating alarm light with built-in speakers to get priority on the road."
	icon_state = "code blue"
	alarm_light_color = COLOR_BLUE

	public_methods = list(/singleton/public_access/public_method/emergency_vehicle_toggle)

	stock_part_presets = list(/singleton/stock_part_preset/radio/receiver/emergency_vehicle = 1)

	// Sound handling
	var/datum/sound_token/sound_token = null
	var/sound_name = "maps/gaia/sounds/apc_siren.ogg"

/obj/machinery/rotating_alarm/emergency_vehicle/proc/start_alarm_sound()
	if(sound_token)
		return
	// Play a looping 3D sound via the global sound player and keep the token
	sound_token = GLOB.sound_player.PlayLoopingSound(src, "\ref[src]", sound_name, volume = 80, range = 25, falloff = 1, prefer_mute = TRUE)

/obj/machinery/rotating_alarm/emergency_vehicle/proc/stop_alarm_sound()
	if(sound_token)
		sound_token.Stop()
		sound_token = null

// Receiver-friendly public method used by radio receivers. Expects a boolean-like value.

/obj/machinery/rotating_alarm/emergency_vehicle/proc/set_alarm_active()
	if(on)
		set_off()
	else
		set_on()
	return

// Ensure sound starts/stops when the alarm state changes
/obj/machinery/rotating_alarm/emergency_vehicle/set_on()
	..()
	start_alarm_sound()

/obj/machinery/rotating_alarm/emergency_vehicle/set_off()
	..()
	stop_alarm_sound()

/obj/machinery/rotating_alarm/emergency_vehicle/set_dir(ndir)
	. = ..()
	if(dir == NORTH)
		pixel_y = 19
	if(dir == SOUTH)
		pixel_y = -19
	if(dir == WEST)
		pixel_x = -18
	if(dir == EAST)
		pixel_x = 18

// Public access and radio receiver preset for external buttons
/singleton/public_access/public_method/emergency_vehicle_toggle
	name = "toggle emergency vehicle sirens"
	desc = "Toggles or sets the emergency vehicle sirens"
	call_proc = TYPE_PROC_REF(/obj/machinery/rotating_alarm/emergency_vehicle, set_on)

/singleton/stock_part_preset/radio/receiver/emergency_vehicle
	frequency = BUTTON_FREQ
	receive_and_call = list(
		"button_active" = /singleton/public_access/public_method/emergency_vehicle_toggle,
	)
