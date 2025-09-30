/obj/fd_water
	name = "water"
	desc = "Shrimple as that."

	icon = 'mods/_fd/fd_assets/icons/water.dmi'
	icon_state = "water2"
	alpha = 100
	var/reagent_type = /datum/reagent/water

	layer = 2.22

/obj/fd_water/use_tool(obj/item/O, mob/living/user, list/click_params)
	var/obj/item/reagent_containers/RG = O
	if (reagent_type && istype(RG) && RG.is_open_container() && RG.reagents)
		RG.reagents.add_reagent(reagent_type, min(RG.volume - RG.reagents.total_volume, RG.amount_per_transfer_from_this))
		user.visible_message(SPAN_NOTICE("[user] fills \the [RG] from \the [src]."),SPAN_NOTICE("You fill \the [RG] from \the [src]."))
		return TRUE

	. = ..()

/obj/fd_water/Crossed(mob/living/L)
	var/random_watersound = pick('sound/effects/footstep/water1.ogg', 'sound/effects/footstep/water2.ogg', 'sound/effects/footstep/water3.ogg', 'sound/effects/footstep/water4.ogg')
	playsound(get_turf(src), random_watersound, 20)

	if(istype(L))
		log_and_message_admins(SPAN_WARNING("<b> МЫ ВОШЛИ В ВОДУ.</i></b>"))
		L.update_water_overlay()
	else
		log_and_message_admins(SPAN_WARNING("<b> МЫ НЕ НАШЛИ В ВОДЕ ЧЕЛОВЕКА.</i></b>"))

/obj/fd_water/Uncrossed(mob/living/L)
	if(!(locate(L) in get_turf(src)))
		log_and_message_admins(SPAN_WARNING("<b> ВОДА НАС ОТПУСТИЛА.</i></b>"))
		L.update_water_overlay()
	else
		return

/mob/living/proc/update_water_overlay()
	if(!get_filter("underwater"))
		log_and_message_admins(SPAN_WARNING("<b> ДОБАВИЛИ НОВЫЙ ОВЕРЛЕЙ</i></b>"))
		add_filter("underwater", 2, list("type" = "alpha", "icon" = icon('mods/_fd/fd_assets/icons/watermask.dmi', "watermask")))
	else
		log_and_message_admins(SPAN_WARNING("<b> УДАЛИЛИ СТАРЫЙ ОВЕРЛЕЙ</i></b>"))
		remove_filter("underwater")

/obj/fd_water/alt_ver1
	icon_state = "water3"
	alpha = 70

/obj/fd_water/alt_ver2
	icon_state = "water4"
	alpha = 70
