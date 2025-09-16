//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// OUTDATED, BUT CANNOT BE DELETED //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/obj/structure/fd/fake_torch
	name = "SEV 'TORCH'"
	desc = "Это заглушка для фоновой анимации"
	icon = 'mods/_fd/ai_overmap_objects/icons/scg/sfv64.dmi'
	icon_state = "tigris"

/obj/structure/fd/fake_ascent_ship
	name = "Ascent Fighter"
	desc = "Это заглушка для фоновой анимации"
	icon = 'mods/_fd/ai_overmap_objects/icons/ascent/ascent_ships.dmi'
	icon_state = "fighter"

/obj/structure/fd/planet_sea
	name = "sea"
	desc = "sea"
	mouse_opacity = FALSE
	anchored = TRUE
	density = FALSE
	layer = DECAL_LAYER
	bound_height = 480
	bound_width = 480
	icon = 'mods/_fd/fd_assets/icons/parallax.dmi'
	icon_state = "layer1-water"
	var/id_background = 1

/obj/structure/fd/planet_sky
	name = "clouds"
	desc = "clouds"
	mouse_opacity = FALSE
	anchored = TRUE
	density = FALSE
	layer = ABOVE_TILE_LAYER
	bound_height = 480
	bound_width = 480
	icon = 'mods/_fd/fd_assets/icons/parallax.dmi'
	icon_state = "layer2-water"
	var/id_background = 1

/proc/change_background()
	for(var/obj/structure/fd/planet_sea/PS in world)
		var/pixel_switch = PS.pixel_x - 480
		animate(PS, pixel_x = pixel_switch, time = 10 SECONDS, easing = LINEAR_EASING | EASE_IN)
	for(var/obj/structure/fd/planet_sky/PSK in world)
		var/pixel_switch = PSK.pixel_x - 480
		animate(PSK, pixel_x = pixel_switch, time = 10 SECONDS, easing = LINEAR_EASING | EASE_IN)

/proc/reset_background()
	for(var/obj/structure/fd/planet_sea/PS in world)
		var/obj/structure/fd/background_controller/BS = locate(/obj/structure/fd/background_controller) in world
		if(BS.id_background == PS.id_background)
			var/turf/relocate_to = get_turf(BS)
			PS.forceMove(relocate_to)
			PS.pixel_x = 0
	for(var/obj/structure/fd/planet_sky/PSK in world)
		var/obj/structure/fd/background_controller/BS = locate(/obj/structure/fd/background_controller) in world
		if(BS.id_background == PSK.id_background)
			var/turf/relocate_to = get_turf(BS)
			PSK.forceMove(relocate_to)
			PSK.pixel_x = 0

/obj/structure/fd/camera_controller
	icon = 'mods/_fd/event_tools/icons/landmarks_static.dmi'
	icon_state = "generic_event"

	invisibility = 50

/obj/structure/fd/background_controller
	icon = 'mods/_fd/event_tools/icons/landmarks_static.dmi'
	icon_state = "generic_event"

	invisibility = 50
	var/id_background = 1

/obj/screen/fullscreen/fd/blackout
	icon = 'mods/_fd/fd_assets/icons/screen_full.dmi'
	icon_state = "fullblack"
	allstate = 1
	plane = HUD_PLANE
	layer = HUD_ABOVE_HUD_LAYER

/obj/screen/fullscreen/fd/blackout/alt
	layer = UNDER_HUD_LAYER

/obj/screen/fullscreen/fishbed/fd
	plane = HUD_PLANE
	layer = 7

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// OUTDATED, BUT CANNOT BE DELETED //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
