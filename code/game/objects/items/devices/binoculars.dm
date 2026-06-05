// Binoculars used to peer into distance
/obj/item/device/binoculars
	name = "binoculars"
	desc = "A pair of binoculars."
	zoomdevicename = "eyepieces"
	icon = 'icons/obj/tools/binoculars.dmi'
	icon_state = "binoculars"

	obj_flags = OBJ_FLAG_CONDUCTIBLE
	force = 5.0
	w_class = ITEM_SIZE_SMALL
	throwforce = 5.0
	throw_range = 15
	throw_speed = 3
	matter = list(MATERIAL_GLASS = 200)
	// Can its zoom be adjusted by the user?
	var/adjustable_zoom = FALSE
	// Current zoom levels
	var/zoom_offset = 14
	var/zoom_size = 9
	// Minimal zoom levels
	var/min_zoom_offset = 14
	var/min_zoom_size = 9
	// Maximal zoom levels
	var/max_zoom_offset = 14
	var/max_zoom_size = 9

// Gets list of possible zoom offsets for adjustment
/obj/item/device/binoculars/proc/get_zoom_offset_choices()
	var/list/choices = list()
	for(var/i = min_zoom_offset; i <= max_zoom_offset; i++)
		choices += i
	return choices

// Gets list of possible zoom sizes for adjustment
/obj/item/device/binoculars/proc/get_zoom_size_choices()
	var/list/choices = list()
	for(var/i = min_zoom_size; i <= max_zoom_size; i++)
		choices += i
	return choices

/obj/item/device/binoculars/examine(mob/user)
	. = ..()
	if(adjustable_zoom)
		to_chat(user, SPAN_NOTICE("Using <b>ALT-CLICK</b> you can adjust the zoom."))

// Changing the offset and size of the zoom with alt-click
/obj/item/device/binoculars/AltClick(mob/user)
	. = ..()
	if(!CanPhysicallyInteractWith(user, src))
		return FALSE

	if(!adjustable_zoom)
		return FALSE

	var/set_zoom_offset = input(user, "Choose zoom offset (current: [zoom_offset])", "Zoom Offset", zoom_offset) as anything in get_zoom_offset_choices()
	var/set_zoom_size = input(user, "Choose zoom size (current: [zoom_size])", "Zoom Size", zoom_size) as anything in get_zoom_size_choices()

	if(set_zoom_offset != null)
		zoom_offset = set_zoom_offset
	if(set_zoom_size != null)
		zoom_size = set_zoom_size

// Zooming in and out with the binoculars
/obj/item/device/binoculars/attack_self(mob/user)
	if(zoom)
		unzoom(user)
	else
		zoom(user, zoom_offset, zoom_size)

// Some preset binoculars with different zoom levels
/obj/item/device/binoculars/x2
	name = "binoculars x2"
	desc = "A pair of binoculars. 2 times the zoom!"
	icon_state = "binocularsX2"

	adjustable_zoom = TRUE
	max_zoom_offset = 16
	max_zoom_size = 10

/obj/item/device/binoculars/x4
	name = "binoculars x4"
	desc = "A pair of binoculars. 4 times the zoom!"
	icon_state = "binocularsX4"

	adjustable_zoom = TRUE
	max_zoom_offset = 18
	max_zoom_size = 11
