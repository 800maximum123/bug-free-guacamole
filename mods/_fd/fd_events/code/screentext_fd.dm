/obj/screen/novel_message
	icon = null
	icon_state = null
	mouse_opacity = MOUSE_OPACITY_UNCLICKABLE
	alpha = 0
	screen_loc = "TOP, CENTER - 3"
	maptext_width = 256
	maptext_height = 480
	maptext_x = -16
	maptext_y = -10
	plane = HUD_PLANE
	layer = HUD_ABOVE_HUD_LAYER

/obj/screen/novel_message/proc/set_text(text, text_color)
	animate(src, 1 SECOND, alpha = 255)
	maptext = "<span class='maptext' style='text-align: center; font-size: 300%; color: [text_color]'>[text]</span>"
