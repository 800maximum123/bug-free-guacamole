/obj/item/reagent_containers/food/snacks/meta_plate
	name = "plate"
	icon = 'mods/cooking/icons/kitchen32x32.dmi'
	icon_state = "plate"
	trash = /obj/item/reagent_containers/food/snacks/meta_plate
	bitesize = 2
	volume = 30

/obj/item/reagent_containers/food/snacks/meta_plate/proc/update_dish(name, icon, icon_state)
	src.icon = icon
	src.icon_state = icon_state
	src.name = name
