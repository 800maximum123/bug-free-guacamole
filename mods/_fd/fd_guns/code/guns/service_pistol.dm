/obj/item/gun/projectile/pistol/sol_service
	name = "service pistol"
	desc = "A Ward-Takahashi 302, 114mm barrel model, SCGF standard-issue service pistol. Cheap and easy to maintain, though known for accidental discharges when dropped. Comes with a sleek light-laser combo."
	magazine_type = /obj/item/ammo_magazine/pistol/double
	allowed_magazines = /obj/item/ammo_magazine/pistol/double
	icon = 'mods/_fd/fd_guns/icons/service_pistol.dmi'
	icon_state = "wt302"
	item_state = "secgundark"
	safety_icon = "wt302-safety"
	origin_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 3)
	fire_delay = 7
	ammo_indicator = TRUE
	var/autoswitched = FALSE //to prevent installation of multiple autoswitches
	//mounted light
	var/light_on = FALSE
	var/activation_sound = 'sound/effects/flashlight.ogg'
	var/flashlight_power = 1
	var/flashlight_range = 5
	light_wedge = LIGHT_NARROW
	var/light_icon = "wt302-light" //flashlight overlay
	var/auto_icon = "wt302-auto" //fullauto upgrade overlay

/obj/item/gun/projectile/pistol/sol_service/Initialize()
	..()
	verbs += /obj/item/gun/projectile/pistol/sol_service/proc/gunlight

/obj/item/gun/projectile/pistol/sol_service/proc/gunlight()
	set category = "Object"
	set name = "Toggle Mounted Light"
	set popup_menu = 1

	toggle_gunlight(usr)

/obj/item/gun/projectile/pistol/sol_service/proc/toggle_gunlight()
	light_on = !light_on
	if(light_on)
		set_light(flashlight_range, flashlight_power, light_color)
	else
		set_light(0)
	update_icon()
	playsound(get_turf(src), activation_sound, 75, 1)


/obj/item/gun/projectile/pistol/sol_service/on_update_icon()
	..()
	if(light_on == TRUE)
		AddOverlays(image(icon, light_icon))

	if(autoswitched == TRUE)
		if(icon_state != "[initial(icon_state)]-e")
			AddOverlays(image(icon, auto_icon))
		else
			AddOverlays(image(icon, "[auto_icon]-e"))

/obj/item/gun/projectile/pistol/sol_service/dropped(mob/living/user)
	if(light_wedge)
		set_dir(user.dir)
		update_light()
	drop_discharge(user)
	return ..()

/obj/item/gun/projectile/pistol/sol_service/proc/drop_discharge(mob/living/user, message = "\The [src] gets hit on the back of its slide and goes off!", fail_chance = 1)
	if(!safety() && prob(fail_chance))
		user.visible_message(SPAN_WARNING(message))
		var/list/targets = list(user)
		targets += trange(2, get_turf(src))
		var/picked = pick(targets)
		afterattack(picked, user)
		return 1


/obj/item/gun/projectile/pistol/sol_service/empty
	starts_loaded = FALSE

// The makeshift auto sear. Turns it a into (mediocre) full auto ghetto blaster. Forever.

/obj/item/gun/projectile/pistol/sol_service/proc/autoswitch(obj/item/A, mob/user)
	if(istype(A, /obj/item/autosear))
		if(autoswitched == FALSE)
			autoswitched = TRUE
			can_autofire=1
			burst=1
			fire_delay=1
			one_hand_penalty=2
			burst_accuracy=list(0,-1,-2,-2,-3)
			dispersion=list(0.6, 0.8, 1.0, 1.3, 1.8)
			user.visible_message("[user] fiddles with [A] a little and installs it into [src].", SPAN_WARNING("You install [A] into [src]. Careful with this thing now!"))
			qdel(A)
		else
			to_chat(user, SPAN_WARNING("[src] is already fully automatic!"))

/obj/item/gun/projectile/pistol/sol_service/use_tool(obj/item/tool, mob/user, list/click_params)
	if (autoswitch(tool, user))
		return TRUE

	return ..()

/obj/item/autosear
	name = "firearm auto sear"
	desc = "A tiny makeshift mod for a pistol that depresses the trigger bar, allowing the hammer to be struck repeatedly by the cycling bolt. In other words, it makes a gun go full auto."
	icon = 'mods/_fd/fd_guns/icons/service_pistol.dmi'
	icon_state = "autosear"
	w_class = ITEM_SIZE_TINY

/singleton/crafting_stage/autosear_base
	begins_with_object_type = /obj/item/stock_parts/manipulator
	completion_trigger_type = /obj/item/wirecutters
	consume_completion_trigger = FALSE
	item_desc = "It's a micro-manipulator with the wiring cut off. Could probably be used for something?"
	item_icon = 'mods/_fd/fd_guns/icons/service_pistol.dmi'
	item_icon_state = "autosear1"
	progress_message = "You snap the wires off the manipulator, making it useless."
	next_stages = list(/singleton/crafting_stage/welding/autosear)

/singleton/crafting_stage/welding/autosear
	item_desc = "It's a tiny horseshoe shape metal part fashioned out of a manipulator."
	item_icon = 'mods/_fd/fd_guns/icons/service_pistol.dmi'
	item_icon_state = "autosear2"
	progress_message = "You bend the crippled manipulator into a horseshoe shape with hand and hold it against the welder's flame, melting its joints together."
	next_stages = list(/singleton/crafting_stage/autosear_cutters)

/singleton/crafting_stage/autosear_cutters
	completion_trigger_type = /obj/item/wirecutters
	consume_completion_trigger = FALSE
	item_desc = "It's a tiny makeshift mechanical switch. There's a screw that could use some adjustment."
	item_icon = 'mods/_fd/fd_guns/icons/service_pistol.dmi'
	item_icon_state = "autosear2"
	progress_message = "You trim one of the component's tips with wirecutters, turning it into a tiny mechanical switch."
	next_stages = list(/singleton/crafting_stage/screwdriver/autosear)

/singleton/crafting_stage/screwdriver/autosear
	item_desc = "It's a tiny makeshift part, fit to make a pistol 'better'. It only lacks a frame."
	item_icon = 'mods/_fd/fd_guns/icons/service_pistol.dmi'
	item_icon_state = "autosear3"
	progress_message = "You tighten up a holding screw and make some final adjustments to the assembly with a screwdriver."
	next_stages = list(/singleton/crafting_stage/material/autosear_cover)

/singleton/crafting_stage/material/autosear_cover
	completion_trigger_type = /obj/item/stack/material
	stack_material = MATERIAL_PLASTIC
	stack_consume_amount  = 1
	progress_message = "You assemble a frame for the mechanism, completing it."
	item_icon = 'mods/_fd/fd_guns/icons/service_pistol.dmi'
	item_icon_state = "autosear2"
	product = /obj/item/autosear

/obj/item/gun/projectile/pistol/sol_compact
	name = "compact pistol"
	desc = "A Hephaestus Industries P19K, also known as M19C in SCGDF service. Light and short with superior handling. While often called compact, it is, in fact, subcompact and can fit in a pocket."
	magazine_type = /obj/item/ammo_magazine/pistol
	allowed_magazines = /obj/item/ammo_magazine/pistol
	banned_magazines = list(
		/obj/item/ammo_magazine/pistol/double,
		/obj/item/ammo_magazine/pistol/small
	)
	w_class = ITEM_SIZE_SMALL
	icon = 'mods/_fd/fd_guns/icons/service_pistol.dmi'
	icon_state = "m19c"
	item_state = "secgundark"
	safety_icon = "m19c-safety"
	origin_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 3)
	fire_delay = 5

/obj/item/gun/projectile/pistol/sol_compact/empty
	starts_loaded = FALSE
