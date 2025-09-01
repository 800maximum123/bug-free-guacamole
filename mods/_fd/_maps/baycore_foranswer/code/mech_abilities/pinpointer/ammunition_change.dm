/datum/mech_ability/action/ammunition_change
	name = "Сменить тип Снарядов"
	action_state = "ammunition"
	var/list/images = list()
	var/list/possible_ammo = list()
	var/list/ammo_types = list(/obj/item/projectile/bullet/mech/grenade, /obj/item/projectile/bullet/mech/grenade_flash, /obj/item/projectile/bullet/mech/grenade_grav)

/datum/mech_ability/action/ammunition_change/use(atom/target, params)
	. = ..()
	if(!.)
		return

	for(var/ammo in ammo_types)
		var/obj/item/I = new ammo (src)
		possible_ammo += I
		var/image/img = image(icon = 'mods/_fd/_maps/baycore_foranswer/icons/mechs/mech_ui.dmi', icon_state = "ammunition")
		img.name = I.name
		images[I] = img

	var/obj/item = show_radial_menu(owner, owner, images, radius = 50, require_near = TRUE)
	if(!item)
		images.Cut()
		possible_ammo.Cut()
		return FALSE
	var/item_type = item.type
	for(var/datum/mech_equipment/firearm/grenade_launcher/G in owner.equipment)
		G.bullet_type = item_type

		to_chat(owner, SPAN_WARNING("В [G.name] был заряжен <[item.name]> заряд!"))

	for(item in possible_ammo)
		qdel(item)

	images.Cut()
	possible_ammo.Cut()

	return .
