/obj/landmark/light
	icon_state = "light"
	light_range = 20
	light_power = 1
	light_color = COLOR_WHITE

/obj/landmark/light/Initialize()
	. = ..()
	set_light(light_range, light_power, light_color)

/obj/landmark/light/gaia
	light_range = 20
	light_power = 0.7
	light_color = COLOR_WHITE
