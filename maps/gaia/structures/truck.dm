/obj/structure/gaia/wheel
	name = "wheel"
	desc = "A wheel, used for vehicles."
	icon = 'maps/gaia/icons/truck.dmi'
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
	icon = 'maps/gaia/icons/truck.dmi'
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
	icon = 'maps/gaia/icons/truck.dmi'
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
	icon = 'maps/gaia/icons/truck.dmi'
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
	icon = 'maps/gaia/icons/truck.dmi'
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
