// Sets up a light
// Use this instead of invisible light bulbs to prevent any possible issues with that.
/obj/landmark/light
	icon_state = "light"
	light_range = 20
	light_power = 1
	light_color = COLOR_WHITE

/obj/landmark/light/Initialize()
	. = ..()
	set_light(light_range, light_power, light_color)
